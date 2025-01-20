@interface ABPK3DLiftingSequence
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)get3DLiftingResultsAsModelPoses;
- (ABPK3DLiftingSequence)init;
- (BOOL)initMLNetwork;
- (id).cxx_construct;
- (id)getLiftingResults;
- (int)runLiftingModelWithBuffer:(const void *)a3 with2DReferenceResults:(id)a4 atTimestamp:(double)a5 exportDebuggingData:(BOOL)a6;
- (int)runLiftingModelWithData:(id)a3 atTimestamp:(double)a4;
- (int)runLiftingModelWithData:(id)a3 imageResolution:(CGSize)a4 deviceOrientation:(int64_t)a5 atTimestamp:(double)a6;
- (vector<float)getGaussianSmoothedOutput:()(ext_vector_type(3;
- (void)_adjustBoneLength:(void *)a3;
- (void)_endLoading3DLiftingSequenceMLModelSignpost;
- (void)_endPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:(double)a3;
- (void)_endPrepareLiftingSequenceInputSignpostWithTimestamp:(double)a3;
- (void)_endRunLiftingSequenceModelSignpostWithTimestamp:(double)a3;
- (void)_startLoading3DLiftingSequenceMLModelSignpost;
- (void)_startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:(double)a3;
- (void)_startPrepareLiftingSequenceInputSignpostWithTimestamp:(double)a3;
- (void)_startRunLiftingSequenceModelSignpostWithTimestamp:(double)a3;
- (void)dealloc;
- (void)saveDataToFilePath:(ABPK3DLiftingSequence *)self with2DInputBuffer:(SEL)a2 withFirstStageOutput:(id)a3 withSmoothedOutput:(const void *)a4 withPostprocessedLiftingResults:(float *)a5;
- (void)updateInputImageResolution:(CGSize)a3;
@end

@implementation ABPK3DLiftingSequence

- (ABPK3DLiftingSequence)init
{
  [(ABPK3DLiftingSequence *)self _startLoading3DLiftingSequenceMLModelSignpost];
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ", (uint8_t *)__p, 2u);
  }

  v31.receiver = self;
  v31.super_class = (Class)ABPK3DLiftingSequence;
  v4 = [(ABPK3DLiftingSequence *)&v31 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_32;
  }
  v6 = objc_alloc_init(ABPKMLModelConfiguration3DLiftingSequenceFirstStage);
  mlConfigFirstStage = v4->_mlConfigFirstStage;
  v4->_mlConfigFirstStage = v6;

  std::vector<simd_float4x4>::resize((uint64_t)&v4->_liftingResultAsModelPoses, 0x11uLL);
  v8 = 0;
  unsigned int v9 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v30 = 0;
  float v10 = 0.0;
  do
  {
    float v11 = 0.0;
    if (v9 <= 8) {
      float v11 = exp((float)(int)(v9 - 8) * (float)(int)(v9 - 8) * -0.125);
    }
    if (v8 >= v30)
    {
      v12 = (float *)__p[0];
      uint64_t v13 = ((char *)v8 - (char *)__p[0]) >> 2;
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = (char *)v30 - (char *)__p[0];
      if (((char *)v30 - (char *)__p[0]) >> 1 > v14) {
        unint64_t v14 = v15 >> 1;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16)
      {
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v30, v16);
        v12 = (float *)__p[0];
        v8 = (float *)__p[1];
      }
      else
      {
        v17 = 0;
      }
      v18 = (float *)&v17[4 * v13];
      float *v18 = v11;
      v19 = v18 + 1;
      while (v8 != v12)
      {
        int v20 = *((_DWORD *)v8-- - 1);
        *((_DWORD *)v18-- - 1) = v20;
      }
      __p[0] = v18;
      __p[1] = v19;
      v30 = (float *)&v17[4 * v16];
      if (v12) {
        operator delete(v12);
      }
      v8 = (float *)v19;
    }
    else
    {
      *v8++ = v11;
    }
    __p[1] = v8;
    float v10 = v10 + v11;
    ++v9;
  }
  while (v9 != 17);
  v21 = (float *)__p[0];
  if (v8 != __p[0])
  {
    unint64_t v22 = ((char *)v8 - (char *)__p[0]) >> 2;
    if (v22 <= 1) {
      unint64_t v22 = 1;
    }
    do
    {
      float *v21 = *v21 / v10;
      ++v21;
      --v22;
    }
    while (v22);
  }
  p_gaussianSmoothingFilter = &v4->_gaussianSmoothingFilter;
  begin = v5->_gaussianSmoothingFilter.__begin_;
  if (begin)
  {
    v5->_gaussianSmoothingFilter.__end_ = begin;
    operator delete(begin);
    p_gaussianSmoothingFilter->__begin_ = 0;
    p_gaussianSmoothingFilter->__end_ = 0;
    p_gaussianSmoothingFilter->__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_gaussianSmoothingFilter->__begin_ = *(_OWORD *)__p;
  v5->_gaussianSmoothingFilter.__end_cap_.__value_ = v30;
  v5->_frameCount = 0;
  v25 = [[ABPKSkeletonDefinition alloc] initWithType:3];
  abpkLiftingSkeletonDefinition = v5->_abpkLiftingSkeletonDefinition;
  v5->_abpkLiftingSkeletonDefinition = v25;

  if (![(ABPK3DLiftingSequence *)v5 initMLNetwork])
  {
    v27 = 0;
  }
  else
  {
LABEL_32:
    [(ABPK3DLiftingSequence *)v5 _endLoading3DLiftingSequenceMLModelSignpost];
    v27 = v5;
  }

  return v27;
}

- (void)updateInputImageResolution:(CGSize)a3
{
  *(CGSize *)&self->_imageWidth = a3;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ABPK3DLiftingSequence;
  [(ABPK3DLiftingSequence *)&v3 dealloc];
}

- (BOOL)initMLNetwork
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  objc_super v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ML Network - first stage ", buf, 2u);
  }

  v4 = [(ABPKMLModelConfiguration3DLiftingSequenceFirstStage *)self->_mlConfigFirstStage compiledMLModelPath];
  if (!v4) {
    goto LABEL_18;
  }
  v5 = [(ABPKMLModelConfiguration3DLiftingSequenceFirstStage *)self->_mlConfigFirstStage inputTensorNames];
  inputTensorFirstStageNames = self->_inputTensorFirstStageNames;
  self->_inputTensorFirstStageNames = v5;

  v7 = [(ABPKMLModelConfiguration3DLiftingSequenceFirstStage *)self->_mlConfigFirstStage outputTensorNames];
  outputTensorFirstStageNames = self->_outputTensorFirstStageNames;
  self->_outputTensorFirstStageNames = v7;

  if (![v4 hasSuffix:@".bundle"])
  {
    context = (void *)espresso_create_context();
    self->_context_first_stage = context;
    if (context)
    {
      unint64_t v16 = "ANE";
LABEL_10:
      v18 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v16;
        _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_DEFAULT, " \t Deploying 3D lifting model on %s ", buf, 0xCu);
      }

      Espresso::get_internal_context(&v27, (Espresso *)self->_context_first_stage, v19);
      self->_plan_first_stage = (void *)espresso_create_plan();
      id v20 = [v4 stringByAppendingPathComponent:@"model.espresso.net"];
      [v20 UTF8String];
      espresso_plan_add_network();
      espresso_plan_build();
      id v21 = [(NSArray *)self->_inputTensorFirstStageNames objectAtIndexedSubscript:0];
      [v21 UTF8String];
      espresso_network_bind_buffer();

      id v22 = [(NSArray *)self->_outputTensorFirstStageNames objectAtIndexedSubscript:0];
      [v22 UTF8String];
      espresso_network_bind_buffer();

      *(_OWORD *)buf = 0u;
      long long v30 = 0u;
      id v23 = [(NSArray *)self->_inputTensorFirstStageNames objectAtIndexedSubscript:0];
      [v23 UTF8String];
      espresso_network_query_blob_dimensions();

      if (v28) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v28);
      }
      goto LABEL_14;
    }
    v17 = (void *)espresso_create_context();
    self->_context_first_stage = v17;
    if (v17)
    {
      unint64_t v16 = "GPU";
      goto LABEL_10;
    }
    v25 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_ERROR, " ANE not available. GPU not available. Espresso context creation failed for 3D lifting model. ", buf, 2u);
    }

LABEL_18:
    BOOL v24 = 0;
    goto LABEL_19;
  }
  self->_useEspressoV2 = 1;
  unsigned int v9 = [[ABPKMLNetworkV2 alloc] initWithNetworkPath:v4 networkConfig:@"main" inputNames:self->_inputTensorFirstStageNames outputNames:self->_outputTensorFirstStageNames useSurface:0];
  networkV2 = self->_networkV2;
  self->_networkV2 = v9;

  float v11 = [(ABPKMLNetworkV2 *)self->_networkV2 inputBuffers];
  inputBufferDict = self->_inputBufferDict;
  self->_inputBufferDict = v11;

  uint64_t v13 = [(ABPKMLNetworkV2 *)self->_networkV2 outputBuffers];
  outputBufferDict = self->_outputBufferDict;
  self->_outputBufferDict = v13;

LABEL_14:
  BOOL v24 = 1;
LABEL_19:

  return v24;
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
  int v12 = -[ABPK3DLiftingSequence runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](self, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v6, 1, v9, v7, a4);

  return v12;
}

- (int)runLiftingModelWithData:(id)a3 imageResolution:(CGSize)a4 deviceOrientation:(int64_t)a5 atTimestamp:(double)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  *(void *)v29._anon_28 = *MEMORY[0x263EF8340];
  v29.super.isa = *(Class *)&a4.width;
  v29._rawJoints.var0 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)&a4.height;
  id v11 = a3;
  [(ABPK3DLiftingSequence *)self _startPrepareLiftingSequenceInputSignpostWithTimestamp:a6];
  int v12 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v29._anon_10 = 134218240;
    *(CGFloat *)&v29._anon_10[4] = width;
    *(_WORD *)&v29._anon_10[12] = 2048;
    *(CGFloat *)&v29._anon_10[14] = height;
    _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData resolution: (w,h) = (%f,%f) ", v29._anon_10, 0x16u);
  }

  uint64_t v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [v11 rotation];
    *(_DWORD *)v29._anon_10 = 134217984;
    *(void *)&v29._anon_10[4] = v14;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData rotation: %ld ", v29._anon_10, 0xCu);
  }

  abpk::GetRawDetectionXYVisbilityWithRawDetection2D((abpk *)v11, (float64x2_t *)&v29, (uint64_t)v29._anon_10);
  abpk::Normalize2DCoordinatesSquareCrop((float **)v29._anon_10, (double *)&v29, a5);
  p__3DLiftingInputBuffer = &self->_3DLiftingInputBuffer;
  unint64_t insertionIndex = self->_3DLiftingInputBuffer._insertionIndex;
  if (!self->_3DLiftingInputBuffer._filled && !insertionIndex)
  {
    -[ABPK3DLiftingSequence updateInputImageResolution:](self, "updateInputImageResolution:", *(double *)&v29.super.isa, *(double *)&v29._rawJoints.var0);
    unint64_t insertionIndex = p__3DLiftingInputBuffer->_insertionIndex;
  }
  long long v17 = *(_OWORD *)v29._anon_10;
  var0 = v29._rotatedJoints.var0;
  memset(v29._anon_10, 0, 24);
  p_storage = &self->_3DLiftingInputBuffer._storage;
  id v20 = &self->_3DLiftingInputBuffer._storage.__elems_[insertionIndex];
  begin = v20->__begin_;
  unint64_t v22 = insertionIndex;
  if (v20->__begin_)
  {
    p_storage->__elems_[insertionIndex].__end_ = begin;
    long long v27 = v17;
    operator delete(begin);
    long long v17 = v27;
    v20->__end_ = 0;
    v20->__end_cap_.__value_ = 0;
    v20->__begin_ = 0;
    unint64_t v22 = p__3DLiftingInputBuffer->_insertionIndex;
  }
  *(_OWORD *)&v20->__begin_ = v17;
  p_storage->__elems_[insertionIndex].__end_cap_.__value_ = var0;
  unint64_t v23 = v22 + 1;
  p__3DLiftingInputBuffer->_unint64_t insertionIndex = v23;
  if (v23 == 243)
  {
    p__3DLiftingInputBuffer->_unint64_t insertionIndex = 0;
    self->_3DLiftingInputBuffer._filled = 1;
  }
  -[ABPK3DLiftingSequence _endPrepareLiftingSequenceInputSignpostWithTimestamp:](self, "_endPrepareLiftingSequenceInputSignpostWithTimestamp:", a6, v27);
  if ([(ABPK3DLiftingSequence *)self runLiftingModelWithBuffer:&self->_3DLiftingInputBuffer with2DReferenceResults:v11 atTimestamp:0 exportDebuggingData:a6])
  {
    BOOL v24 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_21B7C6000, v24, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", v28, 2u);
    }

    int v25 = -6662;
  }
  else
  {
    int v25 = 0;
  }
  if (*(void *)v29._anon_10)
  {
    *(void *)&v29._anon_10[8] = *(void *)v29._anon_10;
    operator delete(*(void **)v29._anon_10);
  }

  return v25;
}

- (int)runLiftingModelWithBuffer:(const void *)a3 with2DReferenceResults:(id)a4 atTimestamp:(double)a5 exportDebuggingData:(BOOL)a6
{
  BOOL v143 = a6;
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v8 = a4;
  [(ABPK3DLiftingSequence *)self _startRunLiftingSequenceModelSignpostWithTimestamp:a5];
  double v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Run Lifting Model With Data Buffer ", buf, 2u);
  }

  __p = 0;
  v154 = 0;
  v155 = 0;
  std::vector<float>::reserve(&__p, 0x30uLL);
  if (self->_useEspressoV2)
  {
    p_filled = &self->_smoothingFilterRingBuffer._filled;
    inputBufferDict = self->_inputBufferDict;
    id v11 = [(NSArray *)self->_inputTensorFirstStageNames objectAtIndexedSubscript:0];
    int v12 = [(NSMutableDictionary *)inputBufferDict objectForKeyedSubscript:v11];

    uint64_t v13 = [v12 bytes];
    uint64_t v14 = [v12 strideHeight];
    outputBufferDict = self->_outputBufferDict;
    unint64_t v16 = [(NSArray *)self->_outputTensorFirstStageNames objectAtIndexedSubscript:0];
    long long v17 = [(NSMutableDictionary *)outputBufferDict objectForKeyedSubscript:v16];

    uint64_t v18 = 0;
    unint64_t v19 = *(void *)a3;
    BOOL v20 = *(void *)a3 == 243;
    uint64_t v21 = v13 + 4 * v14;
    uint64_t v22 = 6 * v14;
    uint64_t v23 = v13 + 2 * v14;
    while (1)
    {
      uint64_t v24 = 0;
      int v25 = *((unsigned __int8 *)a3 + 5840);
      char v26 = v20;
      unint64_t v27 = v19;
      do
      {
        unint64_t v28 = v27 + 1;
        if (v27 + 1 <= 0xF2)
        {
          if (v26)
          {
            if (v28 >= v19) {
              unint64_t v28 = 243;
            }
          }
          else
          {
            char v26 = 0;
            uint64_t v31 = (char *)a3 + 8;
            if (!v25) {
              goto LABEL_21;
            }
          }
LABEL_20:
          uint64_t v31 = (char *)a3 + 24 * v27 + 8;
          goto LABEL_21;
        }
        char v29 = v25 | v26;
        if (v26) {
          unint64_t v30 = v27 + 1;
        }
        else {
          unint64_t v30 = v27 - 242;
        }
        if (v30 >= v19) {
          unint64_t v28 = 243;
        }
        else {
          unint64_t v28 = v30;
        }
        char v26 = 1;
        uint64_t v31 = (char *)a3 + 8;
        if (v29) {
          goto LABEL_20;
        }
LABEL_21:
        v32 = (int *)(*(void *)v31 + 12 * v18);
        _S0 = *v32;
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v13 + v24) = _S0;
        _S0 = v32[1];
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v23 + v24) = _S0;
        _S0 = v32[2];
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v21 + v24) = _S0;
        v24 += 2;
        unint64_t v27 = v28;
      }
      while (v24 != 486);
      ++v18;
      v21 += v22;
      v23 += v22;
      v13 += v22;
      if (v18 == 16)
      {
        [(ABPKMLNetworkV2 *)self->_networkV2 execute];
        [(ABPK3DLiftingSequence *)self _endRunLiftingSequenceModelSignpostWithTimestamp:a5];
        [(ABPK3DLiftingSequence *)self _startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:a5];
        id v40 = v8;
        uint64_t v41 = [v17 bytes];
        uint64_t v42 = [v17 strideHeight];
        uint64_t v43 = 0;
        v44 = v154;
        do
        {
          _H0 = *(_WORD *)(v41 + 2 * v42 * v43);
          __asm { FCVT            S9, H0 }
          if (v44 >= v155)
          {
            v48 = (char *)__p;
            uint64_t v49 = (v44 - (unsigned char *)__p) >> 2;
            unint64_t v50 = v49 + 1;
            if ((unint64_t)(v49 + 1) >> 62) {
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v51 = v155 - (unsigned char *)__p;
            if ((v155 - (unsigned char *)__p) >> 1 > v50) {
              unint64_t v50 = v51 >> 1;
            }
            if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v52 = v50;
            }
            if (v52)
            {
              v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v155, v52);
              v48 = (char *)__p;
              v44 = v154;
            }
            else
            {
              v53 = 0;
            }
            v54 = &v53[4 * v49];
            *(_DWORD *)v54 = _S9;
            v47 = v54 + 4;
            while (v44 != v48)
            {
              int v55 = *((_DWORD *)v44 - 1);
              v44 -= 4;
              *((_DWORD *)v54 - 1) = v55;
              v54 -= 4;
            }
            __p = v54;
            v154 = v47;
            v155 = &v53[4 * v52];
            if (v48) {
              operator delete(v48);
            }
          }
          else
          {
            *(_DWORD *)v44 = _S9;
            v47 = v44 + 4;
          }
          v154 = v47;
          ++v43;
          v44 = v47;
        }
        while (v43 != 48);

        id v8 = v40;
        v56 = v154;
        goto LABEL_42;
      }
    }
  }
  uint64_t v65 = 0;
  data = (char *)self->_inputTensorFirstStage.data;
  unint64_t v67 = *(void *)a3;
  BOOL v68 = *(void *)a3 == 243;
  do
  {
    uint64_t v69 = 0;
    int v70 = *((unsigned __int8 *)a3 + 5840);
    char v71 = v68;
    unint64_t v72 = v67;
    do
    {
      unint64_t v73 = v72 + 1;
      if (v72 + 1 <= 0xF2)
      {
        if (v71)
        {
          if (v73 >= v67) {
            unint64_t v73 = 243;
          }
        }
        else
        {
          char v71 = 0;
          v76 = (char *)a3 + 8;
          if (!v70) {
            goto LABEL_61;
          }
        }
LABEL_60:
        v76 = (char *)a3 + 24 * v72 + 8;
        goto LABEL_61;
      }
      char v74 = v70 | v71;
      if (v71) {
        unint64_t v75 = v72 + 1;
      }
      else {
        unint64_t v75 = v72 - 242;
      }
      if (v75 >= v67) {
        unint64_t v73 = 243;
      }
      else {
        unint64_t v73 = v75;
      }
      char v71 = 1;
      v76 = (char *)a3 + 8;
      if (v74) {
        goto LABEL_60;
      }
LABEL_61:
      v77 = (_DWORD *)(*(void *)v76 + 12 * v65);
      v78 = &data[v69];
      *(_DWORD *)v78 = *v77;
      *((_DWORD *)v78 + 243) = v77[1];
      *((_DWORD *)v78 + 486) = v77[2];
      v69 += 4;
      unint64_t v72 = v73;
    }
    while (v69 != 972);
    ++v65;
    data += 2916;
  }
  while (v65 != 16);
  if (espresso_plan_execute_sync())
  {
    int v79 = -6662;
  }
  else
  {
    [(ABPK3DLiftingSequence *)self _endRunLiftingSequenceModelSignpostWithTimestamp:a5];
    [(ABPK3DLiftingSequence *)self _startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:a5];
    p_filled = &self->_smoothingFilterRingBuffer._filled;
    uint64_t v131 = 0;
    v132 = self->_outputTensorFirstStage.data;
    v133 = v154;
    do
    {
      if (v133 >= v155)
      {
        v134 = (char *)__p;
        uint64_t v135 = (v133 - (unsigned char *)__p) >> 2;
        unint64_t v136 = v135 + 1;
        if ((unint64_t)(v135 + 1) >> 62) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v137 = v155 - (unsigned char *)__p;
        if ((v155 - (unsigned char *)__p) >> 1 > v136) {
          unint64_t v136 = v137 >> 1;
        }
        if ((unint64_t)v137 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v138 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v138 = v136;
        }
        if (v138)
        {
          v139 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v155, v138);
          v134 = (char *)__p;
          v133 = v154;
        }
        else
        {
          v139 = 0;
        }
        v140 = &v139[4 * v135];
        *(_DWORD *)v140 = v132[v131];
        v56 = v140 + 4;
        while (v133 != v134)
        {
          int v141 = *((_DWORD *)v133 - 1);
          v133 -= 4;
          *((_DWORD *)v140 - 1) = v141;
          v140 -= 4;
        }
        __p = v140;
        v154 = v56;
        v155 = &v139[4 * v138];
        if (v134) {
          operator delete(v134);
        }
      }
      else
      {
        *(_DWORD *)v133 = v132[v131];
        v56 = v133 + 4;
      }
      v154 = v56;
      ++v131;
      v133 = v56;
    }
    while (v131 != 48);
LABEL_42:
    p_smoothingFilterRingBuffer = &self->_smoothingFilterRingBuffer;
    v58 = (float *)__p;
    v59 = (float *)v155;
    v154 = 0;
    v155 = 0;
    __p = 0;
    p_storage = &self->_smoothingFilterRingBuffer._storage;
    unint64_t insertionIndex = self->_smoothingFilterRingBuffer._insertionIndex;
    v62 = &self->_smoothingFilterRingBuffer._storage.__elems_[insertionIndex];
    begin = v62->__begin_;
    if (v62->__begin_)
    {
      p_storage->__elems_[insertionIndex].__end_ = begin;
      operator delete(begin);
      v62->__end_ = 0;
      v62->__end_cap_.__value_ = 0;
      v62->__begin_ = 0;
      unint64_t v64 = p_smoothingFilterRingBuffer->_insertionIndex;
    }
    else
    {
      unint64_t v64 = self->_smoothingFilterRingBuffer._insertionIndex;
    }
    v62->__begin_ = v58;
    v80 = &p_storage->__elems_[insertionIndex];
    v80->__end_ = (float *)v56;
    v80->__end_cap_.__value_ = v59;
    unint64_t v81 = v64 + 1;
    p_smoothingFilterRingBuffer->_unint64_t insertionIndex = v81;
    if (v81 == 9)
    {
      self->_smoothingFilterRingBuffer._unint64_t insertionIndex = 0;
      BOOL *p_filled = 1;
    }
    [(ABPK3DLiftingSequence *)self getGaussianSmoothedOutput:&self->_smoothingFilterRingBuffer];
    v149[0] = 0;
    v149[1] = 0;
    uint64_t v150 = 0;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v149, v151[0], (uint64_t)v151[1], ((char *)v151[1] - (char *)v151[0]) >> 4);
    v82 = (float *)v149[0];
    v83 = (float *)v149[1];
    while (v82 != v83)
    {
      float *v82 = -*v82;
      v82 += 4;
    }
    [(ABPK3DLiftingSequence *)self _adjustBoneLength:v149];
    v84 = (float32x2_t *)v149[0];
    v85 = (float32x2_t *)v149[1];
    if (v149[0] != v149[1])
    {
      float32x4_t v86 = *((float32x4_t *)v149[0] + 7);
      int32x4_t v87 = (int32x4_t)vmulq_f32(v86, v86);
      v87.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v87, 2), vadd_f32(*(float32x2_t *)v87.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v87.i8, 1))).u32[0];
      float32x2_t v88 = vrsqrte_f32((float32x2_t)v87.u32[0]);
      float32x2_t v89 = vmul_f32(v88, vrsqrts_f32((float32x2_t)v87.u32[0], vmul_f32(v88, v88)));
      float32x4_t v90 = vmulq_n_f32(v86, vmul_f32(v89, vrsqrts_f32((float32x2_t)v87.u32[0], vmul_f32(v89, v89))).f32[0]);
      float32x4_t v91 = *((float32x4_t *)v149[0] + 4);
      int32x4_t v92 = (int32x4_t)vmulq_f32(v91, v91);
      v92.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2), vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v92.i8, 1))).u32[0];
      float32x2_t v93 = vrsqrte_f32((float32x2_t)v92.u32[0]);
      float32x2_t v94 = vmul_f32(v93, vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(v93, v93)));
      float32x4_t v95 = vmulq_n_f32(v91, vmul_f32(v94, vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(v94, v94))).f32[0]);
      float32x4_t v96 = vmulq_f32(v90, v95);
      float32x4_t v97 = vmlsq_lane_f32(v90, v95, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), vaddq_f32(v96, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1))), 0);
      int32x4_t v98 = (int32x4_t)vmulq_f32(v97, v97);
      v98.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v98, 2), vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v98.i8, 1))).u32[0];
      float32x2_t v99 = vrsqrte_f32((float32x2_t)v98.u32[0]);
      float32x2_t v100 = vmul_f32(v99, vrsqrts_f32((float32x2_t)v98.u32[0], vmul_f32(v99, v99)));
      float32x4_t v101 = vmulq_n_f32(v97, vmul_f32(v100, vrsqrts_f32((float32x2_t)v98.u32[0], vmul_f32(v100, v100))).f32[0]);
      float32x4_t v102 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v101, (int32x4_t)v101), (int8x16_t)v101, 0xCuLL), vnegq_f32(v95)), v101, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v95, (int32x4_t)v95), (int8x16_t)v95, 0xCuLL));
      float32x4_t v103 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v102, (int32x4_t)v102), (int8x16_t)v102, 0xCuLL);
      int32x4_t v104 = (int32x4_t)vmulq_f32(v102, v102);
      v104.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v104.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v104, 2), *(float32x2_t *)v104.i8)).u32[0];
      float32x2_t v105 = vrsqrte_f32((float32x2_t)v104.u32[0]);
      float32x2_t v106 = vmul_f32(v105, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v105, v105)));
      int32x4_t v107 = (int32x4_t)vmulq_n_f32(v103, vmul_f32(v106, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v106, v106))).f32[0]);
      float32x4_t v108 = (float32x4_t)vzip1q_s32((int32x4_t)v95, (int32x4_t)v101);
      v108.i32[2] = v107.i32[0];
      float32x4_t v109 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v95, v107), vdupq_lane_s32(*(int32x2_t *)v101.f32, 1));
      float32x4_t v110 = (float32x4_t)vzip2q_s32((int32x4_t)v95, (int32x4_t)v101);
      v110.i32[2] = v107.i32[2];
      do
      {
        *(float32x4_t *)v84->f32 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v108, COERCE_FLOAT(*(_OWORD *)v84->f32)), v109, *v84, 1), v110, *(float32x4_t *)v84->f32, 2);
        v84 += 2;
      }
      while (v84 != v85);
    }
    v111 = [ABPK3DLiftingResult alloc];
    *(_OWORD *)v147 = *(_OWORD *)v149;
    uint64_t v148 = v150;
    v149[1] = 0;
    uint64_t v150 = 0;
    v149[0] = 0;
    *(_OWORD *)v145 = *(_OWORD *)v151;
    uint64_t v146 = v152;
    v151[0] = 0;
    v151[1] = 0;
    uint64_t v152 = 0;
    v112 = [(ABPK3DLiftingResult *)v111 initWithJoints:v147 rawNetworkOutputs:v145 referenceDetectionResult:v8];
    liftingResult = self->_liftingResult;
    self->_liftingResult = v112;

    if (v145[0])
    {
      v145[1] = v145[0];
      operator delete(v145[0]);
    }
    if (v147[0])
    {
      v147[1] = v147[0];
      operator delete(v147[0]);
    }
    [(ABPK3DLiftingSequence *)self _endPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:a5];
    if (v143)
    {
      uint64_t frameCount = self->_frameCount;
      if (!frameCount)
      {
        id v115 = objc_alloc_init(MEMORY[0x263F08850]);
        [v115 removeItemAtPath:@"/var/mobile/Documents/debug_lifting/" error:0];
        [v115 createDirectoryAtPath:@"/var/mobile/Documents/debug_lifting/" withIntermediateDirectories:1 attributes:0 error:0];

        uint64_t frameCount = self->_frameCount;
      }
      v116 = objc_msgSend(NSString, "stringWithFormat:", @"%d", frameCount);
      v117 = [v116 stringByAppendingString:@".plist"];
      v118 = [@"current_frame_3D_lifting_debug" stringByAppendingString:v117];

      v119 = (long long *)self->_outputTensorFirstStage.data;
      long long v120 = v119[3];
      long long v122 = *v119;
      long long v121 = v119[1];
      long long v158 = v119[2];
      long long v159 = v120;
      *(_OWORD *)buf = v122;
      long long v157 = v121;
      long long v123 = v119[7];
      long long v125 = v119[4];
      long long v124 = v119[5];
      long long v162 = v119[6];
      long long v163 = v123;
      long long v160 = v125;
      long long v161 = v124;
      long long v126 = v119[11];
      long long v128 = v119[8];
      long long v127 = v119[9];
      long long v166 = v119[10];
      long long v167 = v126;
      long long v164 = v128;
      long long v165 = v127;
      v129 = [@"/var/mobile/Documents/debug_lifting/" stringByAppendingPathComponent:v118];
      [(ABPK3DLiftingSequence *)self saveDataToFilePath:v129 with2DInputBuffer:a3 withFirstStageOutput:buf withSmoothedOutput:[(ABPK3DLiftingResult *)self->_liftingResult rawNetworkOutputJoints] withPostprocessedLiftingResults:[(ABPK3DLiftingResult *)self->_liftingResult joints]];
    }
    ++self->_frameCount;
    if (v149[0])
    {
      v149[1] = v149[0];
      operator delete(v149[0]);
    }
    if (v151[0])
    {
      v151[1] = v151[0];
      operator delete(v151[0]);
    }
    int v79 = 0;
  }
  if (__p)
  {
    v154 = (char *)__p;
    operator delete(__p);
  }

  return v79;
}

- (vector<float)getGaussianSmoothedOutput:()(ext_vector_type(3
{
  id v6 = v3;
  end = self->_gaussianSmoothingFilter.__end_;
  begin = self->_gaussianSmoothingFilter.__begin_;
  BOOL v9 = *(void *)a3 != 9 && *((unsigned char *)a3 + 224) == 0;
  double v10 = (char *)a3 + 24 * *(void *)a3 + 8;
  if (v9) {
    double v10 = (char *)a3 + 8;
  }
  uint64_t v11 = *((void *)v10 + 1) - *(void *)v10;
  uint64_t v12 = v11 >> 2;
  v32 = v6;
  uint64_t v13 = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(v6, (v11 >> 2) / 3 + 2);
  if (v11 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = end - begin;
    unint64_t v16 = v15 + 1;
    unint64_t v17 = (unint64_t)(v15 + 1) >> 1;
    if (v17 <= 1) {
      unint64_t v18 = 1;
    }
    else {
      unint64_t v18 = (unint64_t)(v15 + 1) >> 1;
    }
    while (1)
    {
      v33 = (unint64_t *)a3;
      uint64_t v34 = 9;
      unsigned __int8 v35 = 1;
      uint64_t v13 = abpk::RingBuffer<std::vector<float>,9ul>::Iterator<true>::operator-=(&v33, v17);
      if (v16 >= 2) {
        break;
      }
LABEL_28:
      v14 += 3;
      if (v12 <= v14) {
        return (vector<float __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>>)v13;
      }
    }
    uint64_t v19 = 0;
    unint64_t v20 = *v32 + 16 * (v14 / 3uLL) + 16;
    int v21 = v35;
    unint64_t v22 = v34;
    while (1)
    {
      float v23 = self->_gaussianSmoothingFilter.__begin_[v19];
      uint64_t v24 = &v33[3 * v22 + 1];
      if (!(*((unsigned __int8 *)v33 + 224) | v21)) {
        uint64_t v24 = v33 + 1;
      }
      long long v25 = *(_OWORD *)v20;
      float v26 = COERCE_FLOAT(*(_OWORD *)v20) + (float)(v23 * *(float *)(*v24 + 4 * v14));
      *(float *)unint64_t v20 = v26;
      unint64_t v27 = v33 + 1;
      if (*((unsigned __int8 *)v33 + 224) | v35) {
        unint64_t v27 = &v33[3 * v34 + 1];
      }
      float v28 = *(float *)(*v27 + 4 * (v14 + 1));
      *(_DWORD *)(v20 + 8) = DWORD2(v25);
      *(float *)&uint64_t v29 = v26;
      *((float *)&v29 + 1) = *((float *)&v25 + 1) + (float)(v23 * v28);
      *(void *)unint64_t v20 = v29;
      unint64_t v30 = v33 + 1;
      if (*((unsigned __int8 *)v33 + 224) | v35) {
        unint64_t v30 = &v33[3 * v34 + 1];
      }
      float v31 = *((float *)&v25 + 2) + (float)(v23 * *(float *)(*v30 + 4 * (v14 + 2)));
      *(void *)unint64_t v20 = v29;
      *(float *)(v20 + 8) = v31;
      unint64_t v22 = v34 + 1;
      if ((unint64_t)(v34 + 1) >= 9) {
        break;
      }
      ++v34;
      if (v35) {
        goto LABEL_23;
      }
      int v21 = 0;
LABEL_27:
      if (v18 == ++v19) {
        goto LABEL_28;
      }
    }
    if (!v35)
    {
      unsigned __int8 v35 = 1;
      unint64_t v22 = v34 - 8;
    }
    uint64_t v34 = v22;
LABEL_23:
    if (v22 >= *v33)
    {
      uint64_t v34 = 9;
      int v21 = 1;
      unint64_t v22 = 9;
    }
    else
    {
      int v21 = 1;
    }
    goto LABEL_27;
  }
  return (vector<float __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>>)v13;
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
    uint64_t v12 = (float32x4_t *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    v11.i32[3] = v12[3].i32[3];
    v12[3] = v11;
    v4 += 16;
    v3 += 64;
  }
  while (v4 != 272);
  return self->_liftingResultAsModelPoses.__begin_;
}

- (void)saveDataToFilePath:(ABPK3DLiftingSequence *)self with2DInputBuffer:(SEL)a2 withFirstStageOutput:(id)a3 withSmoothedOutput:(const void *)a4 withPostprocessedLiftingResults:(float *)a5
{
  uint64_t v67 = v6;
  uint64_t v66 = v5;
  id v55 = a3;
  unint64_t v9 = 0x263EFF000uLL;
  id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v11 = 0x263EFF000uLL;
  id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v13 = [NSNumber numberWithDouble:self->_imageWidth];
  [v10 setObject:v13 forKeyedSubscript:@"image_width"];

  float32x4_t v14 = [NSNumber numberWithDouble:self->_imageHeight];
  [v10 setObject:v14 forKeyedSubscript:@"image_height"];

  [v56 setObject:v10 forKeyedSubscript:@"image_resolution"];
  v54 = a5;
  unint64_t v15 = *(void *)a4;
  v58 = v10;
  if (*(void *)a4 != 243)
  {
    int v16 = 0;
    id v57 = v12;
    while (1)
    {
      int v17 = *((unsigned __int8 *)a4 + 5840);
      id v18 = objc_alloc_init(*(Class *)(v11 + 2432));
      int v64 = v16;
      unint64_t v62 = v15;
      if (v17 | v16) {
        uint64_t v19 = (char *)a4 + 24 * v15 + 8;
      }
      else {
        uint64_t v19 = (char *)a4 + 8;
      }
      int v21 = *(_DWORD **)v19;
      unint64_t v20 = (_DWORD *)*((void *)v19 + 1);
      if (*(_DWORD **)v19 != v20)
      {
        do
        {
          id v22 = objc_alloc_init(*(Class *)(v9 + 2464));
          unint64_t v23 = v9;
          LODWORD(v24) = *v21;
          long long v25 = [NSNumber numberWithFloat:v24];
          [v22 setObject:v25 forKeyedSubscript:@"normalized_x"];

          LODWORD(v26) = v21[1];
          unint64_t v27 = [NSNumber numberWithFloat:v26];
          [v22 setObject:v27 forKeyedSubscript:@"normalized_y"];

          LODWORD(v28) = v21[2];
          uint64_t v29 = [NSNumber numberWithFloat:v28];
          [v22 setObject:v29 forKeyedSubscript:@"visibility"];

          [v18 addObject:v22];
          v21 += 3;
          unint64_t v9 = v23;
        }
        while (v21 != v20);
      }
      [v59 addObject:v18];

      unint64_t v30 = v62 + 1;
      int v16 = v64;
      if (v62 + 1 >= 0xF3) {
        break;
      }
      id v12 = v57;
      unint64_t v11 = 0x263EFF000uLL;
      if (v64) {
        goto LABEL_13;
      }
LABEL_14:
      unint64_t v15 = v30;
      if (v30 == 243) {
        goto LABEL_15;
      }
    }
    if (!v64) {
      unint64_t v30 = v62 - 242;
    }
    int v16 = 1;
    id v12 = v57;
    unint64_t v11 = 0x263EFF000;
LABEL_13:
    if (v30 >= *(void *)a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_15:
  [v56 setObject:v59 forKeyedSubscript:@"input_2D_raw_pose"];
  id v61 = objc_alloc_init(*(Class *)(v11 + 2432));
  id v63 = objc_alloc_init(*(Class *)(v11 + 2432));
  id v65 = objc_alloc_init(*(Class *)(v11 + 2432));
  uint64_t v31 = 0;
  v32 = v54 + 2;
  do
  {
    if (v31 == 256) {
      goto LABEL_18;
    }
    id v33 = objc_alloc_init(*(Class *)(v9 + 2464));
    LODWORD(v34) = *(v32 - 2);
    unsigned __int8 v35 = [NSNumber numberWithFloat:v34];
    [v33 setObject:v35 forKeyedSubscript:@"x"];

    LODWORD(v36) = *(v32 - 1);
    v37 = [NSNumber numberWithFloat:v36];
    [v33 setObject:v37 forKeyedSubscript:@"y"];

    LODWORD(v38) = *v32;
    v39 = [NSNumber numberWithFloat:v38];
    [v33 setObject:v39 forKeyedSubscript:@"z"];

    [v61 addObject:v33];
    if (v31)
    {
LABEL_18:
      id v40 = objc_alloc_init(*(Class *)(v9 + 2464));
      LODWORD(v41) = *(_DWORD *)(v66 + v31);
      uint64_t v42 = [NSNumber numberWithFloat:v41];
      [v40 setObject:v42 forKeyedSubscript:@"x"];

      LODWORD(v43) = *(_DWORD *)(v66 + v31 + 4);
      v44 = [NSNumber numberWithFloat:v43];
      [v40 setObject:v44 forKeyedSubscript:@"y"];

      LODWORD(v45) = *(_DWORD *)(v66 + v31 + 8);
      v46 = [NSNumber numberWithFloat:v45];
      [v40 setObject:v46 forKeyedSubscript:@"z"];

      [v63 addObject:v40];
    }
    id v47 = objc_alloc_init(*(Class *)(v9 + 2464));
    LODWORD(v48) = *(_DWORD *)(v67 + v31);
    uint64_t v49 = [NSNumber numberWithFloat:v48];
    [v47 setObject:v49 forKeyedSubscript:@"x"];

    LODWORD(v50) = *(_DWORD *)(v67 + v31 + 4);
    uint64_t v51 = [NSNumber numberWithFloat:v50];
    [v47 setObject:v51 forKeyedSubscript:@"y"];

    LODWORD(v52) = *(_DWORD *)(v67 + v31 + 8);
    v53 = [NSNumber numberWithFloat:v52];
    [v47 setObject:v53 forKeyedSubscript:@"z"];

    [v65 addObject:v47];
    v31 += 16;
    v32 += 3;
  }
  while (v31 != 272);
  [v12 setObject:v61 forKeyedSubscript:@"first_stage_model_output"];
  [v12 setObject:v63 forKeyedSubscript:@"lifting_model_output_gaussian_smoothed"];
  [v12 setObject:v65 forKeyedSubscript:@"lifting_model_output_postprocessed_final"];
  [v56 setObject:v12 forKeyedSubscript:@"output"];
  [v56 writeToFile:v55 atomically:0];
}

- (void)_adjustBoneLength:(void *)a3
{
  uint64_t v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Adjust bone length ", buf, 2u);
  }

  double v26 = 0;
  unint64_t v27 = 0;
  uint64_t v28 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v26, *(const void **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  *(void *)buf = 0;
  unint64_t v20 = buf;
  uint64_t v21 = 0x6012000000;
  id v22 = __Block_byref_object_copy__0;
  unint64_t v23 = __Block_byref_object_dispose__0;
  double v24 = &unk_21B8217B2;
  memset(v25, 0, 48);
  abpkLiftingSkeletonDefinition = self->_abpkLiftingSkeletonDefinition;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke;
  v18[3] = &unk_2643B6E80;
  v18[4] = buf;
  [(ABPKSkeletonDefinition *)abpkLiftingSkeletonDefinition enumerateChildrenJointIndicesOfJointAtIndex:0 withBlock:v18];
  while (1)
  {
    double v7 = v20;
    uint64_t v8 = *((void *)v20 + 11);
    if (!v8) {
      break;
    }
    uint64_t v9 = (uint64_t)(v20 + 48);
    unint64_t v10 = *((void *)v20 + 10);
    unint64_t v11 = (uint64_t *)(*(void *)(*((void *)v20 + 7) + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8))
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
    *(float32x4_t *)(*(void *)a3 + 16 * v13) = vmlaq_n_f32(*(float32x4_t *)(*(void *)a3 + 16 * v12), vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0)), -[ABPK3DLiftingSequence _adjustBoneLength:]::bones[v13] * 1000.0);
    int v16 = self->_abpkLiftingSkeletonDefinition;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke_2;
    v17[3] = &unk_2643B6EA8;
    v17[4] = buf;
    v17[5] = v13;
    [(ABPKSkeletonDefinition *)v16 enumerateChildrenJointIndicesOfJointAtIndex:v13 withBlock:v17];
  }
  _Block_object_dispose(buf, 8);
  std::deque<std::pair<long,long>>::~deque[abi:ne180100](v25);
  if (v26)
  {
    unint64_t v27 = v26;
    operator delete(v26);
  }
}

uint64_t __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  v2 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  int v4 = 0;
  return std::deque<std::pair<long,long>>::emplace_back<long &,int>(v2, &v5, &v4);
}

uint64_t __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return std::deque<std::pair<long,long>>::emplace_back<long &,long const&>((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), &v3, (void *)(a1 + 40));
}

- (void)_startLoading3DLiftingSequenceMLModelSignpost
{
}

- (void)_endLoading3DLiftingSequenceMLModelSignpost
{
}

- (void)_startPrepareLiftingSequenceInputSignpostWithTimestamp:(double)a3
{
}

- (void)_endPrepareLiftingSequenceInputSignpostWithTimestamp:(double)a3
{
}

- (void)_startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:(double)a3
{
}

- (void)_endPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:(double)a3
{
}

- (void)_startRunLiftingSequenceModelSignpostWithTimestamp:(double)a3
{
}

- (void)_endRunLiftingSequenceModelSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBufferDict, 0);
  objc_storeStrong((id *)&self->_inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  objc_storeStrong((id *)&self->_abpkLiftingSkeletonDefinition, 0);
  objc_storeStrong((id *)&self->_mlConfigFirstStage, 0);
  for (unint64_t i = 0; i != -216; i -= 24)
  {
    begin = self->_smoothingFilterRingBuffer._storage.__elems_[i / 0x18 + 8].__begin_;
    if (begin)
    {
      self->_smoothingFilterRingBuffer._storage.__elems_[i / 0x18 + 8].__end_ = begin;
      operator delete(begin);
    }
  }
  uint64_t v5 = self->_gaussianSmoothingFilter.__begin_;
  if (v5)
  {
    self->_gaussianSmoothingFilter.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = self->_liftingResultAsModelPoses.__begin_;
  if (v6)
  {
    self->_liftingResultAsModelPoses.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_liftingResult, 0);
  objc_storeStrong((id *)&self->_outputTensorFirstStageNames, 0);
  objc_storeStrong((id *)&self->_inputTensorFirstStageNames, 0);
  p_end = &self->_3DLiftingInputBuffer._storage.__elems_[242].__end_;
  uint64_t v8 = -5832;
  do
  {
    uint64_t v9 = *(p_end - 1);
    if (v9)
    {
      *p_end = v9;
      operator delete(v9);
    }
    p_end -= 3;
    v8 += 24;
  }
  while (v8);
}

- (id).cxx_construct
{
  self->_smoothingFilterRingBuffer._filled = 0;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[8].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[7].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[7].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[6].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[5].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[5].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[4].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[3].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[3].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[2].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[1].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[1].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[0].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._unint64_t insertionIndex = 0u;
  *(_OWORD *)&self->_gaussianSmoothingFilter.__end_ = 0u;
  *(_OWORD *)&self->_liftingResultAsModelPoses.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_liftingResultAsModelPoses.__begin_ = 0u;
  return self;
}

@end