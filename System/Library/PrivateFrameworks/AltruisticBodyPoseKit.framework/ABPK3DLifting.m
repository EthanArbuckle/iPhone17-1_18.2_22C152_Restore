@interface ABPK3DLifting
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)get3DLiftingResultsAsModelPoses;
- (ABPK3DLifting)init;
- (BOOL)initMLNetwork;
- (id).cxx_construct;
- (id)getLiftingResults;
- (int)runLiftingModelWithData:(id)a3 atTimestamp:(double)a4;
- (void)_adjustBoneLength:(ABPK3DLifting *)self;
- (void)_endLoading3DLiftingMLModelSignpost;
- (void)_endPostProcessDataSignpostWithTimestamp:(double)a3;
- (void)_endPrepareLiftingInputSignpostWithTimestamp:(double)a3;
- (void)_endRunLiftingModelSignpostWithTimestamp:(double)a3;
- (void)_startLoading3DLiftingMLModelSignpost;
- (void)_startPostProcessDataSignpostWithTimestamp:(double)a3;
- (void)_startPrepareLiftingInputSignpostWithTimestamp:(double)a3;
- (void)_startRunLiftingModelSignpostWithTimestamp:(double)a3;
- (void)_transformRelativeToHip:(ABPK3DLifting *)self count:(SEL)a2;
- (void)dealloc;
@end

@implementation ABPK3DLifting

- (ABPK3DLifting)init
{
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ", (uint8_t *)&v14, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)ABPK3DLifting;
  v4 = [(ABPK3DLifting *)&v16 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  v6 = objc_alloc_init(ABPKMLModelConfiguration3DLifting);
  mlConfig = v4->_mlConfig;
  v4->_mlConfig = v6;

  std::vector<simd_float4x4>::vector(&v14, 0x11uLL);
  p_liftingResultAsModelPoses = &v4->_liftingResultAsModelPoses;
  begin = v5->_liftingResultAsModelPoses.__begin_;
  if (begin)
  {
    v5->_liftingResultAsModelPoses.__end_ = begin;
    operator delete(begin);
    p_liftingResultAsModelPoses->__begin_ = 0;
    p_liftingResultAsModelPoses->__end_ = 0;
    p_liftingResultAsModelPoses->__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_liftingResultAsModelPoses->__begin_ = v14;
  v5->_liftingResultAsModelPoses.__end_cap_.__value_ = v15;
  v10 = [[ABPKSkeletonDefinition alloc] initWithType:3];
  abpkLiftingSkeletonDefinition = v5->_abpkLiftingSkeletonDefinition;
  v5->_abpkLiftingSkeletonDefinition = v10;

  if (![(ABPK3DLifting *)v5 initMLNetwork]) {
    v12 = 0;
  }
  else {
LABEL_7:
  }
    v12 = v5;

  return v12;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ABPK3DLifting;
  [(ABPK3DLifting *)&v3 dealloc];
}

- (BOOL)initMLNetwork
{
  [(ABPK3DLifting *)self _startLoading3DLiftingMLModelSignpost];
  objc_super v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ML Network ", (uint8_t *)&buf, 2u);
  }

  v4 = [(ABPKMLModelConfiguration3DLifting *)self->_mlConfig inputTensorNames];
  inputTensorNames = self->_inputTensorNames;
  self->_inputTensorNames = v4;

  v6 = [(ABPKMLModelConfiguration3DLifting *)self->_mlConfig outputTensorNames];
  outputTensorNames = self->_outputTensorNames;
  self->_outputTensorNames = v6;

  self->_useEspressoV2 = 0;
  v8 = [(ABPKMLModelConfiguration3DLifting *)self->_mlConfig compiledMLModelPath];
  v9 = v8;
  if (!v8) {
    goto LABEL_10;
  }
  if (![v8 hasSuffix:@".bundle"])
  {
    context = (void *)espresso_create_context();
    self->_context = context;
    if (context)
    {
      Espresso::get_internal_context(&buf, (Espresso *)context, v17);
      self->_plan = (void *)espresso_create_plan();
      id v18 = [v9 stringByAppendingPathComponent:@"model.espresso.net"];
      [v18 UTF8String];
      espresso_plan_add_network();
      espresso_plan_build();
      id v19 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:0];
      [v19 UTF8String];
      espresso_network_bind_buffer();

      v20 = self->_inputTensorNames;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __30__ABPK3DLifting_initMLNetwork__block_invoke;
      v25[3] = &unk_2643B6E30;
      v25[4] = self;
      [(NSArray *)v20 enumerateObjectsUsingBlock:v25];
      v21 = self->_outputTensorNames;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __30__ABPK3DLifting_initMLNetwork__block_invoke_2;
      v24[3] = &unk_2643B6E30;
      v24[4] = self;
      [(NSArray *)v21 enumerateObjectsUsingBlock:v24];

      if (v27) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }
      goto LABEL_9;
    }
LABEL_10:
    BOOL v22 = 0;
    goto LABEL_11;
  }
  self->_useEspressoV2 = 1;
  v10 = [[ABPKMLNetworkV2 alloc] initWithNetworkPath:v9 inputNames:self->_inputTensorNames outputNames:self->_outputTensorNames useSurface:0];
  networkV2 = self->_networkV2;
  self->_networkV2 = v10;

  v12 = [(ABPKMLNetworkV2 *)self->_networkV2 inputBuffers];
  inputBufferDict = self->inputBufferDict;
  self->inputBufferDict = v12;

  long long v14 = [(ABPKMLNetworkV2 *)self->_networkV2 outputBuffers];
  outputBufferDict = self->outputBufferDict;
  self->outputBufferDict = v14;

LABEL_9:
  [(ABPK3DLifting *)self _endLoading3DLiftingMLModelSignpost];
  BOOL v22 = 1;
LABEL_11:

  return v22;
}

void __30__ABPK3DLifting_initMLNetwork__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "UTF8String", 0, 0, 0, 0);
  espresso_network_query_blob_dimensions();
}

void __30__ABPK3DLifting_initMLNetwork__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "UTF8String", 0, 0, 0, 0);
  espresso_network_query_blob_dimensions();
}

- (int)runLiftingModelWithData:(id)a3 atTimestamp:(double)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(ABPK3DLifting *)self _startRunLiftingModelSignpostWithTimestamp:a4];
  v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Run Lifting Model With Data ", buf, 2u);
  }

  if (self->_useEspressoV2)
  {
    v8 = [v6 liftingData];
    uint64_t v9 = [v8 liftingData3D];

    inputBufferDict = self->inputBufferDict;
    v11 = [(NSArray *)self->_inputTensorNames objectAtIndexedSubscript:0];
    v12 = [(NSMutableDictionary *)inputBufferDict objectForKeyedSubscript:v11];
    v13 = (_WORD *)[v12 bytes];

    for (uint64_t i = 0; i != 128; i += 4)
    {
      _S0 = *(_DWORD *)(v9 + i);
      __asm { FCVT            H0, S0 }
      _WORD *v13 = _S0;
      v13 += 32;
    }
    [(ABPKMLNetworkV2 *)self->_networkV2 execute];
  }
  else
  {
    id v31 = [(NSArray *)self->_inputTensorNames objectAtIndexedSubscript:0];
    [v31 UTF8String];
    int v32 = espresso_network_bind_buffer();

    if (v32) {
      goto LABEL_13;
    }
    v33 = [v6 liftingData];
    v34 = (long long *)[v33 liftingData3D];

    v35 = *(_OWORD **)buf;
    long long v36 = *v34;
    long long v37 = v34[1];
    long long v38 = v34[3];
    *(_OWORD *)(*(void *)buf + 32) = v34[2];
    v35[3] = v38;
    _OWORD *v35 = v36;
    v35[1] = v37;
    long long v39 = v34[4];
    long long v40 = v34[5];
    long long v41 = v34[7];
    v35[6] = v34[6];
    v35[7] = v41;
    v35[4] = v39;
    v35[5] = v40;
    if (espresso_plan_execute_sync())
    {
LABEL_13:
      int v42 = -6662;
      goto LABEL_18;
    }
  }
  [(ABPK3DLifting *)self _endRunLiftingModelSignpostWithTimestamp:a4];
  [(ABPK3DLifting *)self _startPostProcessDataSignpostWithTimestamp:a4];
  if (self->_useEspressoV2)
  {
    outputBufferDict = self->outputBufferDict;
    BOOL v22 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:0];
    v23 = [(NSMutableDictionary *)outputBufferDict objectForKeyedSubscript:v22];
    uint64_t v24 = [v23 bytes];

    for (uint64_t j = 0; j != 48; ++j)
    {
      v26 = self->outputBufferDict;
      v27 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:0];
      v28 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:v27];
      _H0 = *(_WORD *)(v24 + 2 * [v28 strideChannels] * j);
      __asm { FCVT            S0, H0 }
      *((_DWORD *)v59 + j) = _S0;
    }
  }
  else
  {
    data = self->_outputTensor.data;
    long long v44 = data[9];
    v59[8] = data[8];
    v59[9] = v44;
    long long v45 = data[11];
    v59[10] = data[10];
    v59[11] = v45;
    long long v46 = data[5];
    v59[4] = data[4];
    v59[5] = v46;
    long long v47 = data[7];
    v59[6] = data[6];
    v59[7] = v47;
    long long v48 = data[1];
    v59[0] = *data;
    v59[1] = v48;
    long long v49 = data[3];
    v59[2] = data[2];
    v59[3] = v49;
  }
  uint64_t v50 = 0;
  *(_OWORD *)uint64_t buf = 0u;
  v57[0] = 0u;
  uint64_t v51 = 1;
  do
  {
    *(void *)&long long v20 = *(void *)((char *)v59 + v50);
    float32x2_t v52 = vmla_f32(*(float32x2_t *)((char *)&unk_21B813E30 + v50), *(float32x2_t *)((char *)&unk_21B813EF0 + v50), *(float32x2_t *)&v20);
    DWORD2(v20) = *(_DWORD *)((char *)v59 + v50 + 8);
    v53 = &buf[v51 * 16];
    *(_OWORD *)v53 = v20;
    v57[v51] = v20;
    *((float *)v53 + 2) = (float)(*(float *)((char *)&unk_21B813E30 + v50 + 8)
                                + (float)(*((float *)&v20 + 2) * *(float *)((char *)&unk_21B813EF0 + v50 + 8)))
                        * 10.0;
    *(float32x2_t *)v53 = vmul_f32(v52, (float32x2_t)0x41200000C1200000);
    v50 += 12;
    ++v51;
  }
  while (v50 != 192);
  -[ABPK3DLifting _adjustBoneLength:](self, "_adjustBoneLength:", buf, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(10.0)), 524288.377, v57[0]);
  [(ABPK3DLifting *)self _transformRelativeToHip:buf count:17];
  v54 = [[ABPK3DLiftingResult alloc] initWithJoints:buf numberOfJoints:17 rawNetworkOutputs:v57 referenceDetectionResult:v6];
  liftingResult = self->_liftingResult;
  self->_liftingResult = v54;

  [(ABPK3DLifting *)self _endPostProcessDataSignpostWithTimestamp:a4];
  int v42 = 0;
LABEL_18:

  return v42;
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
    v7 = (_OWORD *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    long long v8 = *v5;
    long long v9 = v5[1];
    long long v10 = v5[3];
    v7[2] = v5[2];
    v7[3] = v10;
    _OWORD *v7 = v8;
    v7[1] = v9;
    float32x4_t v11 = vdivq_f32(v6, v14);
    v12 = (float32x4_t *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    v11.i32[3] = v12[3].i32[3];
    v12[3] = v11;
    v4 += 16;
    v3 += 64;
  }
  while (v4 != 272);
  return self->_liftingResultAsModelPoses.__begin_;
}

- (void)_adjustBoneLength:(ABPK3DLifting *)self
{
  uint64_t v3 = v2;
  uint64_t v37 = *MEMORY[0x263EF8340];
  v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Adjust bone length ", (uint8_t *)buf, 2u);
  }

  memcpy(buf, v3, sizeof(buf));
  float32x4_t v6 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v31 = 0;
    _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: _abpkLiftingSkeletonDefinition once init ", v31, 2u);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  *(_OWORD *)id v31 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v7 = [(ABPKSkeletonDefinition *)self->_abpkLiftingSkeletonDefinition getChildrenIndices:0];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v26 = [*(id *)(*((void *)&v27 + 1) + 8 * v10) intValue];
        std::deque<std::pair<int,int>>::push_back(v31, &v26);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v8);
  }

  for (uint64_t i = *((void *)&v33 + 1); *((void *)&v33 + 1); uint64_t i = *((void *)&v33 + 1))
  {
    v12 = (int *)(*(void *)(*(void *)&v31[8] + (((unint64_t)v33 >> 6) & 0x3FFFFFFFFFFFFF8))
                + 8 * (v33 & 0x1FF));
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    *(void *)&long long v33 = v33 + 1;
    *((void *)&v33 + 1) = i - 1;
    if ((unint64_t)v33 >= 0x400)
    {
      operator delete(**(void ***)&v31[8]);
      *(void *)&v31[8] += 8;
      *(void *)&long long v33 = v33 - 512;
    }
    float32x4_t v15 = vsubq_f32(v3[v14], v3[v13]);
    float32x4_t v16 = vmulq_f32(v15, v15);
    v16.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).u64[0];
    v16.f32[0] = sqrtf(v16.f32[0]);
    buf[v14] = vmlaq_n_f32((float32x4_t)buf[v13], vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 0)), -[ABPK3DLifting _adjustBoneLength:]::bones[v14] * 1000.0);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v17 = -[ABPKSkeletonDefinition getChildrenIndices:](self->_abpkLiftingSkeletonDefinition, "getChildrenIndices:", v14, 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v23;
      uint64_t v20 = v14 << 32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v26 = v20 | [*(id *)(*((void *)&v22 + 1) + 8 * v21) intValue];
          std::deque<std::pair<int,int>>::push_back(v31, &v26);
          ++v21;
        }
        while (v18 != v21);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v18);
    }
  }
  memcpy(v3, buf, 0x110uLL);
  std::deque<std::pair<int,int>>::~deque[abi:ne180100](v31);
}

- (void)_transformRelativeToHip:(ABPK3DLifting *)self count:(SEL)a2
{
  if (v3)
  {
    float32x4_t v4 = *(float32x4_t *)v2[14].f32;
    int32x4_t v5 = (int32x4_t)vmulq_f32(v4, v4);
    v5.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v5, 2), vadd_f32(*(float32x2_t *)v5.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v5.i8, 1))).u32[0];
    float32x2_t v6 = vrsqrte_f32((float32x2_t)v5.u32[0]);
    float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v6, v6)));
    float32x4_t v8 = vmulq_n_f32(v4, vmul_f32(v7, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v7, v7))).f32[0]);
    float32x4_t v9 = *(float32x4_t *)v2[8].f32;
    int32x4_t v10 = (int32x4_t)vmulq_f32(v9, v9);
    v10.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2), vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1))).u32[0];
    float32x2_t v11 = vrsqrte_f32((float32x2_t)v10.u32[0]);
    float32x2_t v12 = vmul_f32(v11, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v11, v11)));
    float32x4_t v13 = vmulq_n_f32(v9, vmul_f32(v12, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v12, v12))).f32[0]);
    float32x4_t v14 = vmulq_f32(v8, v13);
    float32x4_t v15 = vmlsq_lane_f32(v8, v13, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))), 0);
    int32x4_t v16 = (int32x4_t)vmulq_f32(v15, v15);
    v16.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1))).u32[0];
    float32x2_t v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
    float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
    float32x4_t v19 = vmulq_n_f32(v15, vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]);
    float32x4_t v20 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19), (int8x16_t)v19, 0xCuLL), vnegq_f32(v13)), v19, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL));
    float32x4_t v21 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL);
    int32x4_t v22 = (int32x4_t)vmulq_f32(v20, v20);
    v22.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), *(float32x2_t *)v22.i8)).u32[0];
    float32x2_t v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
    float32x2_t v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
    int32x4_t v25 = (int32x4_t)vmulq_n_f32(v21, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
    float32x4_t v26 = (float32x4_t)vzip1q_s32((int32x4_t)v13, (int32x4_t)v19);
    v26.i32[2] = v25.i32[0];
    float32x4_t v27 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v13, v25), vdupq_lane_s32(*(int32x2_t *)v19.f32, 1));
    float32x4_t v28 = (float32x4_t)vzip2q_s32((int32x4_t)v13, (int32x4_t)v19);
    v28.i32[2] = v25.i32[2];
    do
    {
      *(float32x4_t *)v2->f32 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(_OWORD *)v2->f32)), v27, *v2, 1), v28, *(float32x4_t *)v2->f32, 2);
      v2 += 2;
      --v3;
    }
    while (v3);
  }
}

- (void)_startLoading3DLiftingMLModelSignpost
{
}

- (void)_endLoading3DLiftingMLModelSignpost
{
}

- (void)_startPrepareLiftingInputSignpostWithTimestamp:(double)a3
{
}

- (void)_endPrepareLiftingInputSignpostWithTimestamp:(double)a3
{
}

- (void)_startPostProcessDataSignpostWithTimestamp:(double)a3
{
}

- (void)_endPostProcessDataSignpostWithTimestamp:(double)a3
{
}

- (void)_startRunLiftingModelSignpostWithTimestamp:(double)a3
{
}

- (void)_endRunLiftingModelSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlConfig, 0);
  objc_storeStrong((id *)&self->_abpkLiftingSkeletonDefinition, 0);
  begin = self->_liftingResultAsModelPoses.__begin_;
  if (begin)
  {
    self->_liftingResultAsModelPoses.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_liftingResult, 0);
  objc_storeStrong((id *)&self->outputBufferDict, 0);
  objc_storeStrong((id *)&self->inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
}

- (id).cxx_construct
{
  *((void *)self + 33) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  return self;
}

@end