@interface ABPK3DLiftingLSTM
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)get3DLiftingResultsAsModelPoses;
- (ABPK3DLiftingLSTM)init;
- (BOOL)initMLNetwork;
- (id).cxx_construct;
- (id)getLiftingResults;
- (int)runLiftingModelWithData:(id)a3 atTimestamp:(double)a4;
- (int)runLiftingModelWithData:(id)a3 imageResolution:(CGSize)a4 deviceOrientation:(int64_t)a5 atTimestamp:(double)a6;
- (int)runLiftingModelWithRawDetectionXYVisbility:(const void *)a3 with2DReferenceResults:(id)a4 atTimestamp:(double)a5 exportDebuggingData:(BOOL)a6;
- (void)_adjustBoneLength:(void *)a3;
- (void)_endLoading3DLiftingLSTMMLModelSignpost;
- (void)_endPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:(double)a3;
- (void)_endPrepareLiftingLSTMInputSignpostWithTimestamp:(double)a3;
- (void)_endRunLiftingLSTMModelSignpostWithTimestamp:(double)a3;
- (void)_startLoading3DLiftingLSTMMLModelSignpost;
- (void)_startPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:(double)a3;
- (void)_startPrepareLiftingLSTMInputSignpostWithTimestamp:(double)a3;
- (void)_startRunLiftingLSTMModelSignpostWithTimestamp:(double)a3;
- (void)resetCellStateAndHiddenStateInput;
- (void)resetInputCellStateBuffer;
- (void)resetInputHiddenStateBuffer;
- (void)saveDataToFilePath:(ABPK3DLiftingLSTM *)self with2DInput:(SEL)a2 withLSTMOutput:(id)a3 withPostprocessedLiftingResults:(const void *)a4;
- (void)updateInputImageResolution:(CGSize)a3;
@end

@implementation ABPK3DLiftingLSTM

- (ABPK3DLiftingLSTM)init
{
  [(ABPK3DLiftingLSTM *)self _startLoading3DLiftingLSTMMLModelSignpost];
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ", buf, 2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)ABPK3DLiftingLSTM;
  v4 = [(ABPK3DLiftingLSTM *)&v12 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  v6 = objc_alloc_init(ABPKMLModelConfiguration3DLiftingLSTM);
  mlConfigLSTM = v4->_mlConfigLSTM;
  v4->_mlConfigLSTM = v6;

  std::vector<simd_float4x4>::resize((uint64_t)&v4->_liftingResultAsModelPoses, 0x11uLL);
  v4->_frameCount = 0;
  v4->_setUpStatus = 0;
  v8 = [[ABPKSkeletonDefinition alloc] initWithType:3];
  abpkLiftingSkeletonDefinition = v4->_abpkLiftingSkeletonDefinition;
  v4->_abpkLiftingSkeletonDefinition = v8;

  if (![(ABPK3DLiftingLSTM *)v4 initMLNetwork])
  {
    v10 = 0;
  }
  else
  {
LABEL_5:
    [(ABPK3DLiftingLSTM *)v4 _endLoading3DLiftingLSTMMLModelSignpost];
    v10 = v4;
  }

  return v10;
}

- (void)updateInputImageResolution:(CGSize)a3
{
  *(CGSize *)&self->_imageWidth = a3;
}

- (BOOL)initMLNetwork
{
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ML Network - LSTM ", v16, 2u);
  }

  v4 = [(ABPKMLModelConfiguration3DLiftingLSTM *)self->_mlConfigLSTM compiledMLModelPath];
  if (v4)
  {
    v5 = [(ABPKMLModelConfiguration3DLiftingLSTM *)self->_mlConfigLSTM inputTensorNames];
    inputTensorLSTMNames = self->_inputTensorLSTMNames;
    self->_inputTensorLSTMNames = v5;

    v7 = [(ABPKMLModelConfiguration3DLiftingLSTM *)self->_mlConfigLSTM outputTensorNames];
    outputTensorLSTMNames = self->_outputTensorLSTMNames;
    self->_outputTensorLSTMNames = v7;

    self->_useEspressoV2 = 1;
    v9 = [[ABPKMLNetworkV2 alloc] initWithNetworkPath:v4 networkConfig:@"main" inputNames:self->_inputTensorLSTMNames outputNames:self->_outputTensorLSTMNames useSurface:0];
    networkV2 = self->_networkV2;
    self->_networkV2 = v9;

    v11 = [(ABPKMLNetworkV2 *)self->_networkV2 inputBuffers];
    inputBufferDict = self->_inputBufferDict;
    self->_inputBufferDict = v11;

    v13 = [(ABPKMLNetworkV2 *)self->_networkV2 outputBuffers];
    outputBufferDict = self->_outputBufferDict;
    self->_outputBufferDict = v13;
  }
  return v4 != 0;
}

- (int)runLiftingModelWithData:(id)a3 atTimestamp:(double)a4
{
  id v6 = a3;
  if ([v6 rotation] && objc_msgSend(v6, "rotation") != 180)
  {
    [v6 imageResolution];
    double v9 = v10;
    [v6 imageResolution];
    double v7 = v11;
  }
  else
  {
    [v6 imageResolution];
    double v9 = v8;
  }
  int v12 = -[ABPK3DLiftingLSTM runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](self, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v6, 1, v9, v7, a4);

  return v12;
}

- (int)runLiftingModelWithData:(id)a3 imageResolution:(CGSize)a4 deviceOrientation:(int64_t)a5 atTimestamp:(double)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  *(void *)v19._anon_28 = *MEMORY[0x263EF8340];
  v19.super.isa = *(Class *)&a4.width;
  v19._rawJoints.var0 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)&a4.height;
  id v11 = a3;
  [(ABPK3DLiftingLSTM *)self _startPrepareLiftingLSTMInputSignpostWithTimestamp:a6];
  int v12 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19._anon_10 = 134218240;
    *(CGFloat *)&v19._anon_10[4] = width;
    *(_WORD *)&v19._anon_10[12] = 2048;
    *(CGFloat *)&v19._anon_10[14] = height;
    _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData resolution: (w,h) = (%f,%f) ", v19._anon_10, 0x16u);
  }

  v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [v11 rotation];
    *(_DWORD *)v19._anon_10 = 134217984;
    *(void *)&v19._anon_10[4] = v14;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData rotation: %ld ", v19._anon_10, 0xCu);
  }

  abpk::GetRawDetectionXYVisbilityWithRawDetection2D((abpk *)v11, (float64x2_t *)&v19, (uint64_t)v19._anon_10);
  abpk::Normalize2DCoordinatesSquareCrop((float **)v19._anon_10, (double *)&v19, a5);
  if (!self->_setUpStatus)
  {
    -[ABPK3DLiftingLSTM updateInputImageResolution:](self, "updateInputImageResolution:", *(double *)&v19.super.isa, *(double *)&v19._rawJoints.var0);
    self->_setUpStatus = 1;
  }
  [(ABPK3DLiftingLSTM *)self _endPrepareLiftingLSTMInputSignpostWithTimestamp:a6];
  if ([(ABPK3DLiftingLSTM *)self runLiftingModelWithRawDetectionXYVisbility:v19._anon_10 with2DReferenceResults:v11 atTimestamp:0 exportDebuggingData:a6])
  {
    v15 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", v18, 2u);
    }

    int v16 = -6662;
  }
  else
  {
    int v16 = 0;
  }
  if (*(void *)v19._anon_10)
  {
    *(void *)&v19._anon_10[8] = *(void *)v19._anon_10;
    operator delete(*(void **)v19._anon_10);
  }

  return v16;
}

- (void)resetInputCellStateBuffer
{
  inputBufferDict = self->_inputBufferDict;
  v3 = [(NSArray *)self->_inputTensorLSTMNames objectAtIndexedSubscript:2];
  id v4 = [(NSMutableDictionary *)inputBufferDict objectForKeyedSubscript:v3];

  bzero((void *)[v4 bytes], objc_msgSend(v4, "size"));
}

- (void)resetInputHiddenStateBuffer
{
  inputBufferDict = self->_inputBufferDict;
  v3 = [(NSArray *)self->_inputTensorLSTMNames objectAtIndexedSubscript:1];
  id v4 = [(NSMutableDictionary *)inputBufferDict objectForKeyedSubscript:v3];

  bzero((void *)[v4 bytes], objc_msgSend(v4, "size"));
}

- (void)resetCellStateAndHiddenStateInput
{
  [(ABPK3DLiftingLSTM *)self resetInputCellStateBuffer];
  [(ABPK3DLiftingLSTM *)self resetInputHiddenStateBuffer];
}

- (int)runLiftingModelWithRawDetectionXYVisbility:(const void *)a3 with2DReferenceResults:(id)a4 atTimestamp:(double)a5 exportDebuggingData:(BOOL)a6
{
  BOOL v6 = a6;
  id v114 = a4;
  double v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " ABPK3DLiftingLSTM: Run Lifting Model With Data Buffer ", buf, 2u);
  }
  BOOL v111 = v6;

  *(void *)buf = 0;
  v126 = 0;
  v127 = 0;
  std::vector<float>::reserve((void **)buf, 0x30uLL);
  inputBufferDict = self->_inputBufferDict;
  id v11 = [(NSArray *)self->_inputTensorLSTMNames objectAtIndexedSubscript:0];
  int v12 = [(NSMutableDictionary *)inputBufferDict objectForKeyedSubscript:v11];

  v13 = self->_inputBufferDict;
  uint64_t v14 = [(NSArray *)self->_inputTensorLSTMNames objectAtIndexedSubscript:1];
  v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];

  int v16 = self->_inputBufferDict;
  v17 = [(NSArray *)self->_inputTensorLSTMNames objectAtIndexedSubscript:2];
  v18 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v17];

  outputBufferDict = self->_outputBufferDict;
  v113 = v18;
  v20 = [(NSArray *)self->_outputTensorLSTMNames objectAtIndexedSubscript:0];
  v21 = [(NSMutableDictionary *)outputBufferDict objectForKeyedSubscript:v20];

  v22 = self->_outputBufferDict;
  v112 = v21;
  v23 = [(NSArray *)self->_outputTensorLSTMNames objectAtIndexedSubscript:1];
  v24 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:v23];

  v25 = self->_outputBufferDict;
  v26 = [(NSArray *)self->_outputTensorLSTMNames objectAtIndexedSubscript:2];
  v27 = [(NSMutableDictionary *)v25 objectForKeyedSubscript:v26];

  v28 = (_WORD *)[v12 bytes];
  uint64_t v29 = [v12 strideChannels];
  uint64_t v30 = 0;
  uint64_t v31 = *(void *)a3;
  do
  {
    _S0 = *(_DWORD *)(v31 + v30);
    __asm { FCVT            H0, S0 }
    _WORD *v28 = _S0;
    _S0 = *(_DWORD *)(v31 + v30 + 4);
    __asm { FCVT            H0, S0 }
    v28[v29] = _S0;
    _S0 = *(_DWORD *)(v31 + v30 + 8);
    __asm { FCVT            H0, S0 }
    v28[2 * v29] = _S0;
    v30 += 12;
    v28 += 3 * v29;
  }
  while (v30 != 192);
  memcpy((void *)[v15 bytes], (const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "size"));
  memcpy((void *)[v18 bytes], (const void *)objc_msgSend(v27, "bytes"), objc_msgSend(v27, "size"));
  [(ABPK3DLiftingLSTM *)self _startRunLiftingLSTMModelSignpostWithTimestamp:a5];
  [(ABPKMLNetworkV2 *)self->_networkV2 execute];
  [(ABPK3DLiftingLSTM *)self _endRunLiftingLSTMModelSignpostWithTimestamp:a5];
  [(ABPK3DLiftingLSTM *)self _startPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:a5];
  uint64_t v39 = [v21 bytes];
  uint64_t v40 = [v21 strideChannels];
  uint64_t v41 = 0;
  v42 = v126;
  do
  {
    _H0 = *(_WORD *)(v39 + 2 * v40 * v41);
    __asm { FCVT            S9, H0 }
    if (v42 >= v127)
    {
      v46 = *(char **)buf;
      uint64_t v47 = (uint64_t)&v42[-*(void *)buf] >> 2;
      unint64_t v48 = v47 + 1;
      if ((unint64_t)(v47 + 1) >> 62) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v49 = (uint64_t)&v127[-*(void *)buf];
      if ((uint64_t)&v127[-*(void *)buf] >> 1 > v48) {
        unint64_t v48 = v49 >> 1;
      }
      if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v50 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v50 = v48;
      }
      if (v50)
      {
        v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v127, v50);
        v46 = *(char **)buf;
        v42 = v126;
      }
      else
      {
        v51 = 0;
      }
      v52 = &v51[4 * v47];
      *(_DWORD *)v52 = _S9;
      v45 = v52 + 4;
      while (v42 != v46)
      {
        int v53 = *((_DWORD *)v42 - 1);
        v42 -= 4;
        *((_DWORD *)v52 - 1) = v53;
        v52 -= 4;
      }
      *(void *)buf = v52;
      v126 = v45;
      v127 = &v51[4 * v50];
      if (v46) {
        operator delete(v46);
      }
    }
    else
    {
      *(_DWORD *)v42 = _S9;
      v45 = v42 + 4;
    }
    v126 = v45;
    ++v41;
    v42 = v45;
  }
  while (v41 != 48);
  long long v123 = 0uLL;
  v124[0] = 0;
  v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v124, 1uLL);
  v56 = &v54[v55];
  HIDWORD(v57) = 0;
  _OWORD *v54 = 0u;
  v58 = v54 + 1;
  v59 = (char *)*((void *)&v123 + 1);
  v60 = (char *)v123;
  if (*((void *)&v123 + 1) != (void)v123)
  {
    do
    {
      long long v61 = *((_OWORD *)v59 - 1);
      v59 -= 16;
      HIDWORD(v57) = HIDWORD(v61);
      *--v54 = v61;
    }
    while (v59 != v60);
    v59 = (char *)v123;
  }
  *(void *)&long long v123 = v54;
  *((void *)&v123 + 1) = v58;
  v124[0] = v56;
  if (v59) {
    operator delete(v59);
  }
  uint64_t v62 = 0;
  *((void *)&v123 + 1) = v58;
  do
  {
    uint64_t v63 = *(void *)buf + 12 * v62;
    *(void *)&long long v57 = *(void *)v63;
    DWORD2(v57) = *(_DWORD *)(v63 + 8);
    if ((unint64_t)v58 >= v124[0])
    {
      long long v116 = v57;
      uint64_t v64 = (uint64_t)((uint64_t)v58 - v123) >> 4;
      if ((unint64_t)(v64 + 1) >> 60) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v65 = (uint64_t)(v124[0] - v123) >> 3;
      if (v65 <= v64 + 1) {
        unint64_t v65 = v64 + 1;
      }
      if (v124[0] - (void)v123 >= 0x7FFFFFFFFFFFFFF0uLL) {
        unint64_t v66 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v66 = v65;
      }
      if (v66) {
        v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v124, v66);
      }
      else {
        v67 = 0;
      }
      v68 = &v67[16 * v64];
      HIDWORD(v57) = HIDWORD(v116);
      *(_OWORD *)v68 = v116;
      v58 = v68 + 16;
      v69 = (char *)*((void *)&v123 + 1);
      v70 = (char *)v123;
      if (*((void *)&v123 + 1) != (void)v123)
      {
        do
        {
          long long v71 = *((_OWORD *)v69 - 1);
          v69 -= 16;
          HIDWORD(v57) = HIDWORD(v71);
          *((_OWORD *)v68 - 1) = v71;
          v68 -= 16;
        }
        while (v69 != v70);
        v69 = (char *)v123;
      }
      *(void *)&long long v123 = v68;
      *((void *)&v123 + 1) = v58;
      v124[0] = &v67[16 * v66];
      if (v69) {
        operator delete(v69);
      }
    }
    else
    {
      *v58++ = v57;
    }
    *((void *)&v123 + 1) = v58;
    ++v62;
  }
  while (v62 != 16);
  v121[0] = 0;
  v121[1] = 0;
  uint64_t v122 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v121, (const void *)v123, (uint64_t)v58, (uint64_t)((uint64_t)v58 - v123) >> 4);
  v72 = (float *)v121[0];
  for (i = (float *)v121[1]; v72 != i; v72 += 4)
    float *v72 = -*v72;
  [(ABPK3DLiftingLSTM *)self _adjustBoneLength:v121];
  v74 = (float32x2_t *)v121[0];
  v75 = (float32x2_t *)v121[1];
  if (v121[0] != v121[1])
  {
    float32x4_t v76 = *((float32x4_t *)v121[0] + 7);
    int32x4_t v77 = (int32x4_t)vmulq_f32(v76, v76);
    v77.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v77, 2), vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v77.i8, 1))).u32[0];
    float32x2_t v78 = vrsqrte_f32((float32x2_t)v77.u32[0]);
    float32x2_t v79 = vmul_f32(v78, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v78, v78)));
    float32x4_t v80 = vmulq_n_f32(v76, vmul_f32(v79, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v79, v79))).f32[0]);
    float32x4_t v81 = *((float32x4_t *)v121[0] + 4);
    int32x4_t v82 = (int32x4_t)vmulq_f32(v81, v81);
    v82.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v82, 2), vadd_f32(*(float32x2_t *)v82.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v82.i8, 1))).u32[0];
    float32x2_t v83 = vrsqrte_f32((float32x2_t)v82.u32[0]);
    float32x2_t v84 = vmul_f32(v83, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v83, v83)));
    float32x4_t v85 = vmulq_n_f32(v81, vmul_f32(v84, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v84, v84))).f32[0]);
    float32x4_t v86 = vmulq_f32(v80, v85);
    float32x4_t v87 = vmlsq_lane_f32(v80, v85, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v86, 2), vaddq_f32(v86, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.f32, 1))), 0);
    int32x4_t v88 = (int32x4_t)vmulq_f32(v87, v87);
    v88.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v88, 2), vadd_f32(*(float32x2_t *)v88.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v88.i8, 1))).u32[0];
    float32x2_t v89 = vrsqrte_f32((float32x2_t)v88.u32[0]);
    float32x2_t v90 = vmul_f32(v89, vrsqrts_f32((float32x2_t)v88.u32[0], vmul_f32(v89, v89)));
    float32x4_t v91 = vmulq_n_f32(v87, vmul_f32(v90, vrsqrts_f32((float32x2_t)v88.u32[0], vmul_f32(v90, v90))).f32[0]);
    float32x4_t v92 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v91, (int32x4_t)v91), (int8x16_t)v91, 0xCuLL), vnegq_f32(v85)), v91, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v85, (int32x4_t)v85), (int8x16_t)v85, 0xCuLL));
    float32x4_t v93 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v92, (int32x4_t)v92), (int8x16_t)v92, 0xCuLL);
    int32x4_t v94 = (int32x4_t)vmulq_f32(v92, v92);
    v94.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v94.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v94, 2), *(float32x2_t *)v94.i8)).u32[0];
    float32x2_t v95 = vrsqrte_f32((float32x2_t)v94.u32[0]);
    float32x2_t v96 = vmul_f32(v95, vrsqrts_f32((float32x2_t)v94.u32[0], vmul_f32(v95, v95)));
    int32x4_t v97 = (int32x4_t)vmulq_n_f32(v93, vmul_f32(v96, vrsqrts_f32((float32x2_t)v94.u32[0], vmul_f32(v96, v96))).f32[0]);
    float32x4_t v98 = (float32x4_t)vzip1q_s32((int32x4_t)v85, (int32x4_t)v91);
    v98.i32[2] = v97.i32[0];
    float32x4_t v99 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v85, v97), vdupq_lane_s32(*(int32x2_t *)v91.f32, 1));
    float32x4_t v100 = (float32x4_t)vzip2q_s32((int32x4_t)v85, (int32x4_t)v91);
    v100.i32[2] = v97.i32[2];
    do
    {
      *(float32x4_t *)v74->f32 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v98, COERCE_FLOAT(*(_OWORD *)v74->f32)), v99, *v74, 1), v100, *(float32x4_t *)v74->f32, 2);
      v74 += 2;
    }
    while (v74 != v75);
  }
  v101 = [ABPK3DLiftingResult alloc];
  *(_OWORD *)v119 = *(_OWORD *)v121;
  uint64_t v120 = v122;
  v121[1] = 0;
  uint64_t v122 = 0;
  v121[0] = 0;
  *(_OWORD *)__p = v123;
  uint64_t v118 = v124[0];
  long long v123 = 0uLL;
  v124[0] = 0;
  v102 = [(ABPK3DLiftingResult *)v101 initWithJoints:v119 rawNetworkOutputs:__p referenceDetectionResult:v114];
  liftingResult = self->_liftingResult;
  self->_liftingResult = v102;

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v119[0])
  {
    v119[1] = v119[0];
    operator delete(v119[0]);
  }
  [(ABPK3DLiftingLSTM *)self _endPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:a5];
  if (v111)
  {
    uint64_t frameCount = self->_frameCount;
    if (!frameCount)
    {
      id v105 = objc_alloc_init(MEMORY[0x263F08850]);
      [v105 removeItemAtPath:@"/var/mobile/Documents/debug_lifting_lstm/" error:0];
      [v105 createDirectoryAtPath:@"/var/mobile/Documents/debug_lifting_lstm/" withIntermediateDirectories:1 attributes:0 error:0];

      uint64_t frameCount = self->_frameCount;
    }
    v106 = objc_msgSend(NSString, "stringWithFormat:", @"%d", frameCount);
    v107 = [v106 stringByAppendingString:@".plist"];
    v108 = [@"current_frame_3D_lifting_debug_lstm_" stringByAppendingString:v107];

    v109 = [@"/var/mobile/Documents/debug_lifting_lstm/" stringByAppendingPathComponent:v108];
    [(ABPK3DLiftingLSTM *)self saveDataToFilePath:v109 with2DInput:a3 withLSTMOutput:[(ABPK3DLiftingResult *)self->_liftingResult rawNetworkOutputJoints] withPostprocessedLiftingResults:[(ABPK3DLiftingResult *)self->_liftingResult joints]];
  }
  ++self->_frameCount;
  if (v121[0])
  {
    v121[1] = v121[0];
    operator delete(v121[0]);
  }
  if ((void)v123)
  {
    *((void *)&v123 + 1) = v123;
    operator delete((void *)v123);
  }

  if (*(void *)buf)
  {
    v126 = *(char **)buf;
    operator delete(*(void **)buf);
  }

  return 0;
}

- (id)getLiftingResults
{
  return self->_liftingResult;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)get3DLiftingResultsAsModelPoses
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  v5 = (long long *)MEMORY[0x263EF89A8];
  float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  do
  {
    float32x4_t v6 = *(float32x4_t *)([(ABPK3DLiftingResult *)self->_liftingResult joints] + v4);
    double v7 = (_OWORD *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    long long v8 = *v5;
    long long v9 = v5[1];
    long long v10 = v5[3];
    v7[2] = v5[2];
    v7[3] = v10;
    _OWORD *v7 = v8;
    v7[1] = v9;
    float32x4_t v11 = vdivq_f32(v6, v14);
    int v12 = (float32x4_t *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    v11.i32[3] = v12[3].i32[3];
    v12[3] = v11;
    v4 += 16;
    v3 += 64;
  }
  while (v4 != 272);
  return self->_liftingResultAsModelPoses.__begin_;
}

- (void)saveDataToFilePath:(ABPK3DLiftingLSTM *)self with2DInput:(SEL)a2 withLSTMOutput:(id)a3 withPostprocessedLiftingResults:(const void *)a4
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  id v42 = a3;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13 = [NSNumber numberWithDouble:self->_imageWidth];
  [v11 setObject:v13 forKeyedSubscript:@"image_width"];

  float32x4_t v14 = [NSNumber numberWithDouble:self->_imageHeight];
  [v11 setObject:v14 forKeyedSubscript:@"image_height"];

  [v10 setObject:v11 forKeyedSubscript:@"image_resolution"];
  uint64_t v40 = v11;
  uint64_t v41 = v12;
  v43 = v10;
  id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v16 = *(_DWORD **)a4;
  v15 = (_DWORD *)*((void *)a4 + 1);
  if (*(_DWORD **)a4 != v15)
  {
    do
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      LODWORD(v18) = *v16;
      ABPK2DDetectionResult v19 = [NSNumber numberWithFloat:v18];
      [v17 setObject:v19 forKeyedSubscript:@"normalized_x"];

      LODWORD(v20) = v16[1];
      v21 = [NSNumber numberWithFloat:v20];
      [v17 setObject:v21 forKeyedSubscript:@"normalized_y"];

      LODWORD(v22) = v16[2];
      v23 = [NSNumber numberWithFloat:v22];
      [v17 setObject:v23 forKeyedSubscript:@"visibility"];

      [v44 addObject:v17];
      v16 += 3;
    }
    while (v16 != v15);
  }
  [v10 setObject:v44 forKeyedSubscript:@"input_2D_raw_pose_rawDetectionXYVisbility"];
  id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v24 = 0;
  unint64_t v25 = 0x263EFF000uLL;
  do
  {
    id v26 = objc_alloc_init(*(Class *)(v25 + 2464));
    LODWORD(v27) = *(_DWORD *)(v7 + v24);
    v28 = [NSNumber numberWithFloat:v27];
    [v26 setObject:v28 forKeyedSubscript:@"x"];

    LODWORD(v29) = *(_DWORD *)(v7 + v24 + 4);
    uint64_t v30 = [NSNumber numberWithFloat:v29];
    [v26 setObject:v30 forKeyedSubscript:@"y"];

    LODWORD(v31) = *(_DWORD *)(v7 + v24 + 8);
    v32 = [NSNumber numberWithFloat:v31];
    [v26 setObject:v32 forKeyedSubscript:@"z"];

    [v46 addObject:v26];
    id v33 = objc_alloc_init(*(Class *)(v25 + 2464));
    LODWORD(v34) = *(_DWORD *)(v6 + v24);
    v35 = [NSNumber numberWithFloat:v34];
    [v33 setObject:v35 forKeyedSubscript:@"x"];

    LODWORD(v36) = *(_DWORD *)(v6 + v24 + 4);
    v37 = [NSNumber numberWithFloat:v36];
    [v33 setObject:v37 forKeyedSubscript:@"y"];

    LODWORD(v38) = *(_DWORD *)(v6 + v24 + 8);
    uint64_t v39 = [NSNumber numberWithFloat:v38];
    [v33 setObject:v39 forKeyedSubscript:@"z"];

    [v45 addObject:v33];
    v24 += 16;
    unint64_t v25 = 0x263EFF000;
  }
  while (v24 != 272);
  [v41 setObject:v46 forKeyedSubscript:@"lifting_model_lstm_output_plus_000_hip_at_index_0"];
  [v41 setObject:v45 forKeyedSubscript:@"lifting_model_output_postprocessed_final"];
  [v43 setObject:v41 forKeyedSubscript:@"output"];
  [v43 writeToFile:v42 atomically:0];
}

- (void)_adjustBoneLength:(void *)a3
{
  uint64_t v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Adjust bone length ", buf, 2u);
  }

  id v26 = 0;
  double v27 = 0;
  uint64_t v28 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v26, *(const void **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  *(void *)buf = 0;
  double v20 = buf;
  uint64_t v21 = 0x6012000000;
  double v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  uint64_t v24 = &unk_21B8217B2;
  memset(v25, 0, 48);
  abpkLiftingSkeletonDefinition = self->_abpkLiftingSkeletonDefinition;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke;
  v18[3] = &unk_2643B6E80;
  v18[4] = buf;
  [(ABPKSkeletonDefinition *)abpkLiftingSkeletonDefinition enumerateChildrenJointIndicesOfJointAtIndex:0 withBlock:v18];
  while (1)
  {
    uint64_t v7 = v20;
    uint64_t v8 = *((void *)v20 + 11);
    if (!v8) {
      break;
    }
    uint64_t v9 = (uint64_t)(v20 + 48);
    unint64_t v10 = *((void *)v20 + 10);
    id v11 = (uint64_t *)(*(void *)(*((void *)v20 + 7) + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    *((void *)v20 + 10) = v10 + 1;
    *((void *)v7 + 11) = v8 - 1;
    std::deque<std::pair<long,long>>::__maybe_remove_front_spare[abi:ne180100](v9, 1);
    float32x4_t v14 = vsubq_f32(v26[v13], v26[v12]);
    float32x4_t v15 = vmulq_f32(v14, v14);
    v15.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).u64[0];
    v15.f32[0] = sqrtf(v15.f32[0]);
    *(float32x4_t *)(*(void *)a3 + 16 * v13) = vmlaq_n_f32(*(float32x4_t *)(*(void *)a3 + 16 * v12), vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0)), -[ABPK3DLiftingLSTM _adjustBoneLength:]::bones[v13] * 1000.0);
    int v16 = self->_abpkLiftingSkeletonDefinition;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke_2;
    v17[3] = &unk_2643B6EA8;
    v17[4] = buf;
    v17[5] = v13;
    [(ABPKSkeletonDefinition *)v16 enumerateChildrenJointIndicesOfJointAtIndex:v13 withBlock:v17];
  }
  _Block_object_dispose(buf, 8);
  std::deque<std::pair<long,long>>::~deque[abi:ne180100](v25);
  if (v26)
  {
    double v27 = v26;
    operator delete(v26);
  }
}

uint64_t __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  v2 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  int v4 = 0;
  return std::deque<std::pair<long,long>>::emplace_back<long &,int>(v2, &v5, &v4);
}

uint64_t __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return std::deque<std::pair<long,long>>::emplace_back<long &,long const&>((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), &v3, (void *)(a1 + 40));
}

- (void)_startLoading3DLiftingLSTMMLModelSignpost
{
}

- (void)_endLoading3DLiftingLSTMMLModelSignpost
{
}

- (void)_startPrepareLiftingLSTMInputSignpostWithTimestamp:(double)a3
{
}

- (void)_endPrepareLiftingLSTMInputSignpostWithTimestamp:(double)a3
{
}

- (void)_startPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:(double)a3
{
}

- (void)_endPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:(double)a3
{
}

- (void)_startRunLiftingLSTMModelSignpostWithTimestamp:(double)a3
{
}

- (void)_endRunLiftingLSTMModelSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBufferDict, 0);
  objc_storeStrong((id *)&self->_inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  objc_storeStrong((id *)&self->_abpkLiftingSkeletonDefinition, 0);
  objc_storeStrong((id *)&self->_mlConfigLSTM, 0);
  begin = self->_liftingResultAsModelPoses.__begin_;
  if (begin)
  {
    self->_liftingResultAsModelPoses.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_liftingResult, 0);
  objc_storeStrong((id *)&self->_outputTensorLSTMNames, 0);
  objc_storeStrong((id *)&self->_inputTensorLSTMNames, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end