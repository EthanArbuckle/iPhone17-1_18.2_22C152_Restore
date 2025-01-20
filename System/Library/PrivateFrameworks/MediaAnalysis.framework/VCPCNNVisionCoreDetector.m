@interface VCPCNNVisionCoreDetector
- (VCPCNNVisionCoreDetector)initWithOptions:(id)a3;
- (id).cxx_construct;
- (id)allocatePostProcessingBuffers:(id)a3 error:(id *)a4;
- (id)planExecutionandOutput:()vector<espresso_buffer_t descriptor:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3;
- (id)resultForPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 Error:(id *)a5;
- (int)UpdateInputBuffersAndBindPixelBuffer:(__CVBuffer *)a3;
- (int)downscaleBuffer:(__CVBuffer *)a3 scaledImage:(__CVBuffer *)a4;
- (int)getBodyRegions:(id)a3 fromVisionCorePostProcessingOutput:(id)a4 imageWidth:(int)a5 imageHeight:(int)a6 extendRatio:(float)a7 portrait_mode:(BOOL)a8;
- (int)getHandsRegions:(id)a3 fromVisionCorePostProcessingOutput:(id)a4 imageWidth:(int)a5 imageHeight:(int)a6 extendRatio:(float)a7 portrait_mode:(BOOL)a8;
- (int)loadModel:(id)a3 withOptions:(id)a4;
- (void)dealloc;
@end

@implementation VCPCNNVisionCoreDetector

- (VCPCNNVisionCoreDetector)initWithOptions:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v99 = a3;
  v123.receiver = self;
  v123.super_class = (Class)VCPCNNVisionCoreDetector;
  v4 = [(VCPCNNVisionCoreDetector *)&v123 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  v4->_frameCount = 0;
  v97 = (void *)[objc_alloc(MEMORY[0x1E4FB3F10]) initWithMajor:1];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB3EB0], "descriptorForIdentifier:version:objectTrackingEnabled:segmentationEnabled:lowFrameRate:error:", *MEMORY[0x1E4FB3F68]);
  descriptor = v5->_descriptor;
  v5->_descriptor = (VisionCoreISPInferenceNetworkDescriptor *)v6;

  v5->_espressoNetwork.plan = 0;
  v5->_espressoNetwork.network_index = 0;
  int v8 = [(VCPCNNVisionCoreDetector *)v5 loadModel:v5->_descriptor withOptions:v99];
  if (v8) {
    goto LABEL_3;
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  outputBufferMapping = v5->_outputBufferMapping;
  v5->_outputBufferMapping = (NSMutableDictionary *)v10;

  v94 = [(VisionCoreISPInferenceNetworkDescriptor *)v5->_descriptor allOutputNames];
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3ED8]), "initWithCapacity:", objc_msgSend(v94, "count"));
  inferenceOutputNamedObjects = v5->_inferenceOutputNamedObjects;
  v5->_inferenceOutputNamedObjects = (VisionCoreMutableNamedObjects *)v12;

  if ((![v94 count] || !v94) && (int)MediaAnalysisLogLevel() >= 3)
  {
    v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - outputNames nil or empty", buf, 2u);
    }
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = v94;
  uint64_t v15 = [obj countByEnumeratingWithState:&v119 objects:v128 count:16];
  if (!v15) {
    goto LABEL_39;
  }
  id v95 = *(id *)v120;
  p_outputEspressoBuffers = &v5->_outputEspressoBuffers;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(id *)v120 != v95) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v119 + 1) + 8 * i);
      v18 = [(VisionCoreISPInferenceNetworkDescriptor *)v5->_descriptor outputNamed:v17 error:0];
      v19 = v18;
      if (!v18)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_67:

          goto LABEL_68;
        }
        v83 = VCPLogInstance();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v83, OS_LOG_TYPE_ERROR, "could not obtain model output", buf, 2u);
        }
LABEL_66:

        goto LABEL_67;
      }
      uint64_t v118 = 0;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      *(_OWORD *)buf = 0u;
      long long v109 = 0u;
      v20 = [v18 shape];
      [v20 rank];
      id v21 = v20;
      [v21 sizes];
      int v22 = espresso_buffer_pack_tensor_shape();
      if (v22)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v84 = VCPLogInstance();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v126 = 67109120;
            LODWORD(v127) = v22;
            _os_log_impl(&dword_1BBEDA000, v84, OS_LOG_TYPE_ERROR, "Failed with espresso status %i", v126, 8u);
          }
          goto LABEL_64;
        }
LABEL_65:

        v83 = v19;
        goto LABEL_66;
      }
      [v19 dataType];
      LODWORD(v118) = VisionCoreEspressoStorageTypeForTensorDataType();
      id v23 = v17;
      [v23 UTF8String];
      if (espresso_network_bind_buffer())
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v84 = VCPLogInstance();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            v85 = _espressoPlanErrorMessage(v5->_espressoNetwork.plan);
            *(_DWORD *)v126 = 138412290;
            v127 = v85;
            _os_log_impl(&dword_1BBEDA000, v84, OS_LOG_TYPE_ERROR, "%@", v126, 0xCu);
          }
LABEL_64:

          goto LABEL_65;
        }
        goto LABEL_65;
      }
      v24 = objc_opt_new();
      v106[8] = v116;
      v106[9] = v117;
      uint64_t v107 = v118;
      v106[4] = v112;
      v106[5] = v113;
      v106[6] = v114;
      v106[7] = v115;
      v106[0] = *(_OWORD *)buf;
      v106[1] = v109;
      v106[2] = v110;
      v106[3] = v111;
      [v24 setBuffer:v106];
      [(NSMutableDictionary *)v5->_outputBufferMapping setObject:v24 forKeyedSubscript:obj];
      end = v5->_outputEspressoBuffers.__end_;
      value = v5->_outputEspressoBuffers.__end_cap_.__value_;
      if (end >= value)
      {
        unint64_t v36 = 0xCF3CF3CF3CF3CF3DLL * ((end - p_outputEspressoBuffers->__begin_) >> 3);
        unint64_t v37 = v36 + 1;
        if (v36 + 1 > 0x186186186186186) {
          std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v38 = 0xCF3CF3CF3CF3CF3DLL * ((value - p_outputEspressoBuffers->__begin_) >> 3);
        if (2 * v38 > v37) {
          unint64_t v37 = 2 * v38;
        }
        if (v38 >= 0xC30C30C30C30C3) {
          unint64_t v39 = 0x186186186186186;
        }
        else {
          unint64_t v39 = v37;
        }
        if (v39) {
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>((uint64_t)&v5->_outputEspressoBuffers.__end_cap_, v39);
        }
        else {
          v40 = 0;
        }
        v41 = &v40[168 * v36];
        long long v42 = *(_OWORD *)buf;
        long long v43 = v110;
        *((_OWORD *)v41 + 1) = v109;
        *((_OWORD *)v41 + 2) = v43;
        *(_OWORD *)v41 = v42;
        long long v44 = v111;
        long long v45 = v112;
        long long v46 = v114;
        *((_OWORD *)v41 + 5) = v113;
        *((_OWORD *)v41 + 6) = v46;
        *((_OWORD *)v41 + 3) = v44;
        *((_OWORD *)v41 + 4) = v45;
        long long v47 = v115;
        long long v48 = v116;
        long long v49 = v117;
        *((void *)v41 + 20) = v118;
        *((_OWORD *)v41 + 8) = v48;
        *((_OWORD *)v41 + 9) = v49;
        *((_OWORD *)v41 + 7) = v47;
        begin = v5->_outputEspressoBuffers.__begin_;
        v50 = v5->_outputEspressoBuffers.__end_;
        v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v41;
        if (v50 != begin)
        {
          do
          {
            long long v53 = *(_OWORD *)((char *)v50 - 168);
            long long v54 = *(_OWORD *)((char *)v50 - 152);
            *(_OWORD *)((char *)v52 - 136) = *(_OWORD *)((char *)v50 - 136);
            *(_OWORD *)((char *)v52 - 152) = v54;
            *(_OWORD *)((char *)v52 - 168) = v53;
            long long v55 = *(_OWORD *)((char *)v50 - 120);
            long long v56 = *(_OWORD *)((char *)v50 - 104);
            long long v57 = *(_OWORD *)((char *)v50 - 88);
            *(_OWORD *)((char *)v52 - 72) = *(_OWORD *)((char *)v50 - 72);
            *(_OWORD *)((char *)v52 - 88) = v57;
            *(_OWORD *)((char *)v52 - 104) = v56;
            *(_OWORD *)((char *)v52 - 120) = v55;
            long long v58 = *(_OWORD *)((char *)v50 - 56);
            long long v59 = *(_OWORD *)((char *)v50 - 40);
            long long v60 = *(_OWORD *)((char *)v50 - 24);
            *((void *)v52 - 1) = *((void *)v50 - 1);
            *(_OWORD *)((char *)v52 - 24) = v60;
            *(_OWORD *)((char *)v52 - 40) = v59;
            *(_OWORD *)((char *)v52 - 56) = v58;
            v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v52 - 168);
            v50 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v50 - 168);
          }
          while (v50 != begin);
          v50 = p_outputEspressoBuffers->__begin_;
        }
        v35 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v41 + 168);
        v5->_outputEspressoBuffers.__begin_ = v52;
        v5->_outputEspressoBuffers.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v41 + 168);
        v5->_outputEspressoBuffers.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v40[168 * v39];
        if (v50) {
          operator delete(v50);
        }
      }
      else
      {
        long long v27 = *(_OWORD *)buf;
        long long v28 = v110;
        *((_OWORD *)end + 1) = v109;
        *((_OWORD *)end + 2) = v28;
        *(_OWORD *)end = v27;
        long long v29 = v111;
        long long v30 = v112;
        long long v31 = v114;
        *((_OWORD *)end + 5) = v113;
        *((_OWORD *)end + 6) = v31;
        *((_OWORD *)end + 3) = v29;
        *((_OWORD *)end + 4) = v30;
        long long v32 = v115;
        long long v33 = v116;
        long long v34 = v117;
        *((void *)end + 20) = v118;
        *((_OWORD *)end + 8) = v33;
        *((_OWORD *)end + 9) = v34;
        *((_OWORD *)end + 7) = v32;
        v35 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 168);
      }
      v5->_outputEspressoBuffers.__end_ = v35;
      v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", *((void *)v35 - 21), -[NSObject storageByteCount](v19, "storageByteCount"), 0);
      if (!v61)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v88 = VCPLogInstance();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v126 = 0;
            _os_log_impl(&dword_1BBEDA000, v88, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - no output data", v126, 2u);
          }
        }
LABEL_76:

        v86 = 0;
        goto LABEL_70;
      }
      int v62 = [(VisionCoreMutableNamedObjects *)v5->_inferenceOutputNamedObjects assignData:v61 toName:v23 error:0];

      if (!v62) {
        goto LABEL_76;
      }
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v119 objects:v128 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_39:

  v64 = v5->_outputEspressoBuffers.__begin_;
  v63 = v5->_outputEspressoBuffers.__end_;
  if (0xCF3CF3CF3CF3CF3DLL * ((v63 - v64) >> 3) != [obj count] && (int)MediaAnalysisLogLevel() >= 3)
  {
    v65 = VCPLogInstance();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - outputBuffers not matching number of descriptors", buf, 2u);
    }
  }
  v125[0] = @"last_mask";
  v125[1] = @"last_salient_mask";
  uint64_t v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:2];
  inputMasksNames = v5->_inputMasksNames;
  v5->_inputMasksNames = (NSArray *)v66;

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v68 = v5->_inputMasksNames;
  uint64_t v69 = [(NSArray *)v68 countByEnumeratingWithState:&v102 objects:v124 count:16];
  if (!v69) {
    goto LABEL_54;
  }
  uint64_t v70 = *(void *)v103;
  v96 = v68;
LABEL_46:
  uint64_t v71 = 0;
  while (1)
  {
    if (*(void *)v103 != v70) {
      objc_enumerationMutation(v96);
    }
    v72 = *(void **)(*((void *)&v102 + 1) + 8 * v71);
    v73 = [(VisionCoreISPInferenceNetworkDescriptor *)v5->_descriptor inputNamed:v72 error:0];
    v74 = v73;
    if (!v73) {
      break;
    }
    uint64_t v118 = 0;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    *(_OWORD *)buf = 0u;
    long long v109 = 0u;
    v75 = [v73 shape];
    [v75 rank];
    id v76 = v75;
    [v76 sizes];
    if (espresso_buffer_pack_tensor_shape())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v91 = VCPLogInstance();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          v92 = _espressoPlanErrorMessage(v5->_espressoNetwork.plan);
          *(_DWORD *)v126 = 138412290;
          v127 = v92;
          _os_log_impl(&dword_1BBEDA000, v91, OS_LOG_TYPE_ERROR, "%@", v126, 0xCu);
        }
LABEL_87:
      }
LABEL_88:

      int v8 = -18;
      v82 = v74;
      goto LABEL_89;
    }
    [v74 dataType];
    LODWORD(v118) = VisionCoreEspressoStorageTypeForTensorDataType();
    id v77 = v72;
    [v77 UTF8String];
    int v78 = espresso_network_bind_buffer();
    if (v78)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v91 = VCPLogInstance();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v126 = 67109120;
          LODWORD(v127) = v78;
          _os_log_impl(&dword_1BBEDA000, v91, OS_LOG_TYPE_ERROR, "Failed with espresso status %i", v126, 8u);
        }
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    v79 = objc_opt_new();
    v100[8] = v116;
    v100[9] = v117;
    uint64_t v101 = v118;
    v100[4] = v112;
    v100[5] = v113;
    v100[6] = v114;
    v100[7] = v115;
    v100[0] = *(_OWORD *)buf;
    v100[1] = v109;
    v100[2] = v110;
    v100[3] = v111;
    [v79 setBuffer:v100];
    [(NSMutableDictionary *)v5->_inputBufferMapping setObject:v79 forKeyedSubscript:v77];

    if (v69 == ++v71)
    {
      v68 = v96;
      uint64_t v69 = [(NSArray *)v96 countByEnumeratingWithState:&v102 objects:v124 count:16];
      if (v69) {
        goto LABEL_46;
      }
LABEL_54:

      v96 = [(VisionCoreISPInferenceNetworkDescriptor *)v5->_descriptor postProcessingOutputDescriptors];
      uint64_t v80 = -[VCPCNNVisionCoreDetector allocatePostProcessingBuffers:error:](v5, "allocatePostProcessingBuffers:error:");
      postProcessingObjects = v5->_postProcessingObjects;
      v5->_postProcessingObjects = (VisionCoreMutableNamedObjects *)v80;

      v5->_personBuffer = (__CVBuffer *)[(VisionCoreMutableNamedObjects *)v5->_postProcessingObjects pixelBufferForName:@"$postprocessed$Person" error:0];
      v5->_salientBuffer = (__CVBuffer *)[(VisionCoreMutableNamedObjects *)v5->_postProcessingObjects pixelBufferForName:@"$postprocessed$SalientPerson" error:0];
      v5->_skinBuffer = (__CVBuffer *)[(VisionCoreMutableNamedObjects *)v5->_postProcessingObjects pixelBufferForName:@"$postprocessed$Skin" error:0];
      v5->_hairBuffer = (__CVBuffer *)[(VisionCoreMutableNamedObjects *)v5->_postProcessingObjects pixelBufferForName:@"$postprocessed$Hair" error:0];
      v5->_skyBuffer = (__CVBuffer *)[(VisionCoreMutableNamedObjects *)v5->_postProcessingObjects pixelBufferForName:@"$postprocessed$Sky" error:0];
      v82 = [(VisionCoreISPInferenceNetworkDescriptor *)v5->_descriptor allOutputNames];
      [v82 count];
      int v8 = 0;
LABEL_89:

      v90 = v96;
      goto LABEL_90;
    }
  }
  int v89 = MediaAnalysisLogLevel();
  v90 = v96;
  if (v89 >= 3)
  {
    v82 = VCPLogInstance();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_ERROR, "could not obtain inputDescriptor", buf, 2u);
    }
    int v8 = -18;
    goto LABEL_89;
  }
  int v8 = -18;
LABEL_90:

LABEL_3:
  if (v8) {
LABEL_68:
  }
    v9 = 0;
  else {
LABEL_4:
  }
    v9 = v5;
  v86 = v9;
LABEL_70:

  return v86;
}

- (int)downscaleBuffer:(__CVBuffer *)a3 scaledImage:(__CVBuffer *)a4
{
  int v4 = -50;
  if (a3)
  {
    if (a4)
    {
      *a4 = 0;
      Scaler::Scale(&self->_scaler, a3, a4, 512, 384, 1111970369);
      int v4 = v6;
      if (v6)
      {
        if (*a4)
        {
          CFRelease(*a4);
          *a4 = 0;
        }
      }
    }
  }
  return v4;
}

- (int)loadModel:(id)a3 withOptions:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    int v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector creating ANE context", (uint8_t *)&v29, 2u);
    }
  }
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if (!context)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v10 = -18;
      goto LABEL_42;
    }
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector failed to create ANE context", (uint8_t *)&v29, 2u);
    }
    goto LABEL_35;
  }
  int v10 = espresso_context_set_low_precision_accumulation();
  if (!v10)
  {
    plan = (void *)espresso_create_plan();
    v13 = [v7 objectForKeyedSubscript:@"planPriority"];
    BOOL v14 = v13 == 0;

    if (v14) {
      goto LABEL_25;
    }
    uint64_t v15 = [v7 objectForKeyedSubscript:@"planPriority"];
    if ([v15 intValue] == 1)
    {
    }
    else
    {
      v16 = [v7 objectForKeyedSubscript:@"planPriority"];
      BOOL v17 = [v16 intValue] == 0x2000;

      if (!v17)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v20 = VCPLogInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = [v7 objectForKeyedSubscript:@"planPriority"];
            int v23 = [v22 intValue];
            int v29 = 67109120;
            LODWORD(v30) = v23;
            _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "VCPCNNVisionCoreDetector - invalid input espresso plan priority %d", (uint8_t *)&v29, 8u);
          }
          goto LABEL_24;
        }
LABEL_25:
        v24 = [v6 URL];
        v11 = [v24 absoluteString];

        if (v11)
        {
          v25 = v11;
          [v25 UTF8String];
          int v10 = espresso_plan_add_network();
          if (v10)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v26 = VCPLogInstance();
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
LABEL_34:

LABEL_41:
                goto LABEL_42;
              }
LABEL_29:
              long long v27 = _espressoPlanErrorMessage(plan);
              int v29 = 138412290;
              id v30 = v27;
              _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - %@", (uint8_t *)&v29, 0xCu);

              goto LABEL_34;
            }
          }
          else
          {
            int v10 = espresso_plan_build();
            if (v10 && (int)MediaAnalysisLogLevel() >= 3)
            {
              v26 = VCPLogInstance();
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                goto LABEL_34;
              }
              goto LABEL_29;
            }
          }
          v11 = v25;
          goto LABEL_41;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v26 = VCPLogInstance();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v29 = 138412546;
            id v30 = v6;
            __int16 v31 = 2112;
            uint64_t v32 = 0;
            _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - could not obtain model file path for %@ - %@", (uint8_t *)&v29, 0x16u);
          }
          int v10 = -18;
          goto LABEL_34;
        }
LABEL_35:
        int v10 = -18;
        goto LABEL_41;
      }
    }
    v18 = [v7 objectForKeyedSubscript:@"planPriority"];
    uint64_t v19 = [v18 intValue];

    espresso_plan_set_priority();
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = [NSNumber numberWithUnsignedInt:v19];
        int v29 = 138412290;
        id v30 = v21;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector - espresso plan priority is set to %@", (uint8_t *)&v29, 0xCu);
      }
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector failed to set low precision numerical accumulation", (uint8_t *)&v29, 2u);
    }
    goto LABEL_41;
  }
LABEL_42:

  return v10;
}

- (int)UpdateInputBuffersAndBindPixelBuffer:(__CVBuffer *)a3
{
  v5 = [(VisionCoreISPInferenceNetworkDescriptor *)self->_descriptor allInputNames];
  uint64_t v6 = [v5 count];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3ED8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    id v10 = [(VisionCoreISPInferenceNetworkDescriptor *)self->_descriptor inputNamed:@"input_image" error:0];
    objc_opt_class();
    objc_opt_isKindOfClass();
    v11 = [v10 name];
    char v12 = [v9 assignPixelBuffer:a3 toName:v11 error:0];

    if (v12)
    {
      id v13 = [v10 name];
      [v13 UTF8String];
      int v8 = espresso_network_bind_cvpixelbuffer();

      if (v8)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          BOOL v14 = VCPLogInstance();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Failed to bind pixel buffer", buf, 2u);
          }
        }
      }
      else
      {
        int frameCount = self->_frameCount;
        if (frameCount >= 1)
        {
          BOOL v17 = [(VisionCoreISPInferenceNetworkDescriptor *)self->_descriptor inputNamed:@"prior_mask" error:0];
          v18 = [(NSMutableDictionary *)self->_inputBufferMapping objectForKeyedSubscript:@"last_mask"];
          uint64_t v19 = v18;
          if (v18)
          {
            [v18 buffer];
            v20 = *(void **)buf;
          }
          else
          {
            v20 = 0;
            uint64_t v64 = 0;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            *(_OWORD *)buf = 0u;
            long long v55 = 0u;
          }
          id v21 = [(NSMutableDictionary *)self->_outputBufferMapping objectForKeyedSubscript:@"prior_mask"];
          int v22 = v21;
          if (v21)
          {
            [v21 buffer];
            int v23 = (const void *)v32;
          }
          else
          {
            int v23 = 0;
            uint64_t v52 = 0;
            long long v48 = 0u;
            long long v50 = 0u;
            long long v44 = 0u;
            long long v46 = 0u;
            long long v40 = 0u;
            long long v42 = 0u;
            long long v36 = 0u;
            long long v38 = 0u;
            long long v32 = 0u;
            long long v34 = 0u;
          }
          memcpy(v20, v23, objc_msgSend(v17, "storageByteCount", v32, v34, v36, v38, v40, v42, v44, v46, v48, v50, v52));

          v24 = [(VisionCoreISPInferenceNetworkDescriptor *)self->_descriptor inputNamed:@"salient_person_prior_mask" error:0];
          v25 = [(NSMutableDictionary *)self->_inputBufferMapping objectForKeyedSubscript:@"last_salient_mask"];
          v26 = v25;
          if (v25)
          {
            [v25 buffer];
            long long v27 = *(void **)buf;
          }
          else
          {
            long long v27 = 0;
            uint64_t v64 = 0;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            *(_OWORD *)buf = 0u;
            long long v55 = 0u;
          }
          long long v28 = [(NSMutableDictionary *)self->_outputBufferMapping objectForKeyedSubscript:@"salient_person_prior_mask"];
          int v29 = v28;
          if (v28)
          {
            [v28 buffer];
            id v30 = (const void *)v33;
          }
          else
          {
            id v30 = 0;
            uint64_t v53 = 0;
            long long v49 = 0u;
            long long v51 = 0u;
            long long v45 = 0u;
            long long v47 = 0u;
            long long v41 = 0u;
            long long v43 = 0u;
            long long v37 = 0u;
            long long v39 = 0u;
            long long v33 = 0u;
            long long v35 = 0u;
          }
          memcpy(v27, v30, objc_msgSend(v24, "storageByteCount", v33, v35, v37, v39, v41, v43, v45, v47, v49, v51, v53));

          int frameCount = self->_frameCount;
        }
        int v8 = 0;
        self->_int frameCount = frameCount + 1;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Failed to assign buffer", buf, 2u);
        }
      }
      int v8 = -18;
    }

LABEL_38:
    goto LABEL_39;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - inputNames nil or empty", buf, 2u);
    }
    int v8 = -50;
    goto LABEL_38;
  }
  int v8 = -50;
LABEL_39:

  return v8;
}

- (void)dealloc
{
  if (self->_espressoNetwork.plan) {
    espresso_plan_destroy();
  }
  if (self->_espressoContext) {
    espresso_context_destroy();
  }
  v3 = [(NSMutableDictionary *)self->_inputBufferMapping objectForKeyedSubscript:@"last_mask"];

  if (v3)
  {
    int v4 = [(NSMutableDictionary *)self->_inputBufferMapping objectForKeyedSubscript:@"last_mask"];
    v5 = v4;
    if (v4)
    {
      [v4 buffer];
      uint64_t v6 = (void *)v25;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    free(v6);
  }
  BOOL v7 = [(NSMutableDictionary *)self->_inputBufferMapping objectForKeyedSubscript:@"last_salient_mask"];

  if (v7)
  {
    int v8 = [(NSMutableDictionary *)self->_inputBufferMapping objectForKeyedSubscript:@"last_salient_mask"];
    v9 = v8;
    if (v8)
    {
      [v8 buffer];
      id v10 = (void *)v25;
    }
    else
    {
      id v10 = 0;
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    free(v10);
  }
  v11 = [(NSMutableDictionary *)self->_outputBufferMapping objectForKeyedSubscript:@"prior_mask"];

  if (v11)
  {
    char v12 = [(NSMutableDictionary *)self->_outputBufferMapping objectForKeyedSubscript:@"prior_mask"];
    id v13 = v12;
    if (v12)
    {
      [v12 buffer];
      BOOL v14 = (void *)v25;
    }
    else
    {
      BOOL v14 = 0;
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    free(v14);
  }
  uint64_t v15 = [(NSMutableDictionary *)self->_outputBufferMapping objectForKeyedSubscript:@"salient_person_prior_mask"];

  if (v15)
  {
    v16 = [(NSMutableDictionary *)self->_outputBufferMapping objectForKeyedSubscript:@"salient_person_prior_mask"];
    BOOL v17 = v16;
    if (v16)
    {
      [v16 buffer];
      v18 = (void *)v25;
    }
    else
    {
      v18 = 0;
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    free(v18);
  }
  personBuffer = self->_personBuffer;
  if (personBuffer) {
    CFRelease(personBuffer);
  }
  salientBuffer = self->_salientBuffer;
  if (salientBuffer) {
    CFRelease(salientBuffer);
  }
  skinBuffer = self->_skinBuffer;
  if (skinBuffer) {
    CFRelease(skinBuffer);
  }
  hairBuffer = self->_hairBuffer;
  if (hairBuffer) {
    CFRelease(hairBuffer);
  }
  skyBuffer = self->_skyBuffer;
  if (skyBuffer) {
    CFRelease(skyBuffer);
  }
  v24.receiver = self;
  v24.super_class = (Class)VCPCNNVisionCoreDetector;
  [(VCPCNNVisionCoreDetector *)&v24 dealloc];
}

- (id)allocatePostProcessingBuffers:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3ED8]), "initWithCapacity:", objc_msgSend(v5, "count", v5));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v41;
    uint64_t v27 = *MEMORY[0x1E4F24D20];
    uint64_t v26 = *MEMORY[0x1E4F24C98];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v41 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        v46[0] = v27;
        v46[1] = v26;
        v47[0] = MEMORY[0x1E4F1CC08];
        v47[1] = &unk_1F15EB658;
        CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
        pixelBufferOut[0] = 0;
        CVPixelBufferCreate(0, [v11 pixelWidth], objc_msgSend(v11, "pixelHeight"), objc_msgSend(v11, "pixelFormatType"), v12, pixelBufferOut);
        CVPixelBufferRef v13 = pixelBufferOut[0];
        BOOL v14 = [v11 name];
        LOBYTE(v13) = [v6 assignPixelBuffer:v13 toName:v14 error:a4];

        if ((v13 & 1) == 0) {
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v39 = 0;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        *(_OWORD *)pixelBufferOut = 0u;
        long long v30 = 0u;
        uint64_t v15 = [v10 shape];
        [v15 rank];
        id v16 = v15;
        [v16 sizes];
        int v17 = espresso_buffer_pack_tensor_shape();
        [v10 dataType];
        LODWORD(v39) = VisionCoreEspressoStorageTypeForTensorDataType();
        pixelBufferOut[0] = (CVPixelBufferRef)malloc_type_malloc([v10 storageByteCount], 0x983FD0C3uLL);
        if (v17)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            int v23 = VCPLogInstance();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              int v45 = v17;
              _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Failed with espresso status %i", buf, 8u);
            }
          }
          goto LABEL_26;
        }
        id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v19 = objc_msgSend(v18, "initWithBytes:length:", pixelBufferOut[0], objc_msgSend(v10, "storageByteCount"));
        if (!v19)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            objc_super v24 = VCPLogInstance();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - no input data", buf, 2u);
            }
          }
LABEL_25:

LABEL_26:
          id v22 = 0;
          goto LABEL_27;
        }
        v20 = [v10 name];
        char v21 = [v6 assignData:v19 toName:v20 error:a4];

        if ((v21 & 1) == 0) {
          goto LABEL_25;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v22 = v6;
LABEL_27:

  return v22;
}

- (id)planExecutionandOutput:()vector<espresso_buffer_t descriptor:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3
{
  if (espresso_plan_execute_sync())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "execution not successful", v8, 2u);
      }
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = self->_inferenceOutputNamedObjects;
  }
  return v6;
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 Error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v64[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = mach_absolute_time();
  id v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  CFDictionaryRef v12 = VCPSignPostLog();
  CVPixelBufferRef v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCPCNNVisionCoreDetectorDownscale", "", buf, 2u);
  }

  *(void *)buf = 0;
  if ([(VCPCNNVisionCoreDetector *)self downscaleBuffer:a3 scaledImage:buf])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v55 = 0;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - downscaling pixelBuffer failed", v55, 2u);
      }
    }
    if (a5)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v16 = [NSString stringWithFormat:@"VCPCNNVisionCoreDetector - downscaling buffer failed"];
      v64[0] = v16;
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
      id v18 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
LABEL_23:
      int v23 = 0;
      *a5 = v18;
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v19 = VCPSignPostLog();
    v20 = v19;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)long long v55 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_END, v11, "VCPCNNVisionCoreDetectorDownscale", "", v55, 2u);
    }

    if (v9)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if (![(VCPCNNVisionCoreDetector *)self UpdateInputBuffersAndBindPixelBuffer:*(void *)buf])
    {
      uint64_t v25 = mach_absolute_time();
      uint64_t v26 = VCPSignPostLog();
      os_signpost_id_t v27 = os_signpost_id_generate(v26);

      long long v28 = VCPSignPostLog();
      long long v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)long long v55 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VCPCNNVisionCoreDetectorExecution", "", v55, 2u);
      }

      __p = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&__p, self->_outputEspressoBuffers.__begin_, (uint64_t)self->_outputEspressoBuffers.__end_, 0xCF3CF3CF3CF3CF3DLL * ((self->_outputEspressoBuffers.__end_ - self->_outputEspressoBuffers.__begin_) >> 3));
      id v16 = [(VCPCNNVisionCoreDetector *)self planExecutionandOutput:&__p descriptor:self->_descriptor];
      if (__p)
      {
        uint64_t v53 = __p;
        operator delete(__p);
      }
      long long v30 = VCPSignPostLog();
      long long v31 = v30;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)long long v55 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v31, OS_SIGNPOST_INTERVAL_END, v27, "VCPCNNVisionCoreDetectorExecution", "", v55, 2u);
      }

      if (v25)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      uint64_t v32 = mach_absolute_time();
      long long v33 = VCPSignPostLog();
      os_signpost_id_t v34 = os_signpost_id_generate(v33);

      long long v35 = VCPSignPostLog();
      long long v36 = v35;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)long long v55 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "VCPCNNVisionCoreDetectorPostProcessing", "", v55, 2u);
      }

      int v17 = [(VisionCoreISPInferenceNetworkDescriptor *)self->_descriptor postProcessingOutputDescriptors];
      int v37 = [(VisionCoreISPInferenceNetworkDescriptor *)self->_descriptor requiresPostProcessing];
      if (v17) {
        int v38 = 0;
      }
      else {
        int v38 = v37;
      }
      if (v38 == 1)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v39 = VCPLogInstance();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v55 = 0;
            _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Descriptor requires post processing - but no postProcessingDescriptors returned", v55, 2u);
          }
        }
        if (!a5)
        {
          int v23 = 0;
          goto LABEL_24;
        }
        long long v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = *MEMORY[0x1E4F28568];
        long long v41 = [NSString stringWithFormat:@"VCPCNNVisionCoreDetector - Descriptor requires post processing - but no postProcessingDescriptors returned"];
        long long v60 = v41;
        id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        [v40 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v42];
        int v23 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v43 = objc_alloc(MEMORY[0x1E4FB3EB8]);
        long long v41 = (void *)[v43 initWithInputImageBuffer:*(void *)buf inputImageOrientation:v6 inferenceOutputNamedObjects:v16];
        LODWORD(v51) = v6;
        LODWORD(v50) = v6;
        id v42 = (id)[objc_alloc(MEMORY[0x1E4FB3EC0]) initWithPostProcessedPersonImageBuffer:self->_personBuffer personImageOrientation:v6 salientPersonImageBuffer:self->_salientBuffer salientPersonImageBufferOrientation:v6 skinImageBuffer:self->_skinBuffer skinImageBufferOrientation:v6 hairImageBuffer:self->_hairBuffer hairImageBufferOrientation:v50 skyImageBuffer:self->_skyBuffer skyImageBufferOrientation:v51];
        if ([(VisionCoreISPInferenceNetworkDescriptor *)self->_descriptor performPostProcessingForInput:v41 postProcessingOutput:v42 error:a5])
        {
          long long v44 = VCPSignPostLog();
          int v45 = v44;
          if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
          {
            *(_WORD *)long long v55 = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v45, OS_SIGNPOST_INTERVAL_END, v34, "VCPCNNVisionCoreDetectorPostProcessing", "", v55, 2u);
          }

          if (v32)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          id v42 = v42;
          int v23 = v42;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            long long v46 = VCPLogInstance();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long v55 = 0;
              _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - ISP post processing failure", v55, 2u);
            }
          }
          if (a5)
          {
            long long v47 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v57 = *MEMORY[0x1E4F28568];
            long long v48 = [NSString stringWithFormat:@"VCPCNNVisionCoreDetector - ISP post processing failure"];
            long long v58 = v48;
            uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
            *a5 = [v47 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v49];
          }
          int v23 = 0;
        }
      }

LABEL_24:
      goto LABEL_26;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      char v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v55 = 0;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - update input buffers and binding buffer failed", v55, 2u);
      }
    }
    if (a5)
    {
      id v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = *MEMORY[0x1E4F28568];
      id v16 = [NSString stringWithFormat:@"VCPCNNVisionCoreDetector - update input buffers and binding buffer failed"];
      long long v62 = v16;
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      id v18 = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
      goto LABEL_23;
    }
  }
  int v23 = 0;
LABEL_26:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
  return v23;
}

- (int)getHandsRegions:(id)a3 fromVisionCorePostProcessingOutput:(id)a4 imageWidth:(int)a5 imageHeight:(int)a6 extendRatio:(float)a7 portrait_mode:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  [a4 hands];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v14)
  {
    float v15 = (float)a5;
    float v16 = (float)a6;
    uint64_t v17 = *(void *)v70;
    double v18 = (float)((float)a5 * 0.0019531);
    double v19 = (float)((float)a6 / 384.0);
    float v68 = a7 + 1.0;
    uint64_t v66 = 134219264;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v70 != v17) {
          objc_enumerationMutation(obj);
        }
        char v21 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend(v21, "groupID", v66);
        [v21 boundingBox];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        uint64_t v31 = [v21 chirality];
        if (v31 == 1) {
          uint64_t v32 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v32 = v31 == 2;
        }
        unint64_t v33 = [v21 confidence];
        float v34 = v28 * v18 * 0.5;
        float v35 = v30 * v19 * 0.5;
        float v36 = v34 + v24 * v18;
        float v37 = v35 + v26 * v19;
        if (v34 < v35) {
          float v34 = v30 * v19 * 0.5;
        }
        float v38 = v68 * v34;
        float v39 = v36 - v38;
        if ((float)(v36 - v38) < 0.0) {
          float v39 = 0.0;
        }
        float v40 = v37 - v38;
        if ((float)(v37 - v38) < 0.0) {
          float v40 = 0.0;
        }
        float v41 = v38 + v36;
        if (v41 > v15) {
          float v41 = v15;
        }
        float v42 = v38 + v37;
        float v43 = v39 / v15;
        if (v42 > v16) {
          float v42 = (float)a6;
        }
        float v44 = v41 - v39;
        float v45 = v40 / v16;
        float v46 = v44 / v15;
        float v47 = (float)(v42 - v40) / v16;
        if (v8)
        {
          float v48 = (float)(1.0 - v43) - v46;
          float v43 = v40 / v16;
          if (v48 >= 0.0) {
            float v45 = v48;
          }
          else {
            float v45 = 0.0;
          }
          float v49 = v47;
        }
        else
        {
          float v49 = v44 / v15;
          float v46 = v47;
        }
        uint64_t v50 = [VCPBoundingBox alloc];
        *(float *)&double v51 = (float)v33;
        *(float *)&double v52 = v43;
        *(float *)&double v53 = v45;
        *(float *)&double v54 = v49;
        *(float *)&double v55 = v46;
        long long v56 = [(VCPBoundingBox *)v50 initWithXYAndSize:v52 y:v53 width:v54 height:v55 confidence:v51];
        [(VCPBoundingBox *)v56 setClassIndex:v32];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v57 = VCPLogInstance();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            [(VCPBoundingBox *)v56 minX];
            float v59 = v58;
            [(VCPBoundingBox *)v56 minY];
            float v61 = v60;
            [(VCPBoundingBox *)v56 maxX];
            float v63 = v62;
            [(VCPBoundingBox *)v56 maxY];
            *(_DWORD *)buf = v66;
            double v74 = v59;
            __int16 v75 = 2048;
            double v76 = v61;
            __int16 v77 = 2048;
            double v78 = v63;
            __int16 v79 = 2048;
            double v80 = v64;
            __int16 v81 = 1024;
            int v82 = v32;
            __int16 v83 = 2048;
            uint64_t v84 = v22;
            _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector: using VisionCore box (xyxy, chirality) = [%f, %f, %f, %f, %d], groupID = %lu", buf, 0x3Au);
          }
        }
        [(VCPBoundingBox *)v56 setGroupID:v22];
        [v13 addObject:v56];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
    }
    while (v14);
  }

  return 0;
}

- (int)getBodyRegions:(id)a3 fromVisionCorePostProcessingOutput:(id)a4 imageWidth:(int)a5 imageHeight:(int)a6 extendRatio:(float)a7 portrait_mode:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v14 = [a4 fullBodyResults];
  if (v8) {
    int v15 = a5;
  }
  else {
    int v15 = a6;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  if (v8) {
    int v16 = a6;
  }
  else {
    int v16 = a5;
  }
  long long v67 = 0uLL;
  long long v68 = 0uLL;
  id obj = v14;
  uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
  if (v17)
  {
    float v18 = (float)v16 * 0.0019531;
    uint64_t v19 = *(void *)v68;
    double v66 = v18;
    float v20 = (float)a6;
    double v21 = (float)((float)v15 / 384.0);
    float v22 = (float)a5;
    float v23 = a7 + 1.0;
    uint64_t v64 = 134219008;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v68 != v19) {
          objc_enumerationMutation(obj);
        }
        double v25 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v26 = objc_msgSend(v25, "groupID", v64);
        [v25 boundingBox];
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        unint64_t v35 = [v25 confidence];
        float v36 = v32 * v66;
        float v37 = v34 * v21;
        float v38 = v28 * v66;
        float v39 = v30 * v21;
        if (v8)
        {
          float v40 = v20 - v38;
          float v38 = v30 * v21;
          float v39 = v40 - v36;
          float v41 = v37;
        }
        else
        {
          float v41 = v36;
          float v36 = v37;
        }
        float v42 = [VCPBoundingBox alloc];
        *(float *)&double v45 = (float)(v36 * 0.5) + v39;
        *(float *)&double v46 = v23 * (float)(v36 * 0.5);
        *(float *)&double v47 = *(float *)&v46 + *(float *)&v45;
        if ((float)(*(float *)&v46 + *(float *)&v45) > v20) {
          *(float *)&double v47 = v20;
        }
        float v48 = *(float *)&v45 - *(float *)&v46;
        float v49 = 0.0;
        if (v48 >= 0.0) {
          *(float *)&double v43 = v48;
        }
        else {
          *(float *)&double v43 = 0.0;
        }
        float v50 = (float)(v41 * 0.5) + v38;
        float v51 = v23 * (float)(v41 * 0.5);
        float v52 = v51 + v50;
        if ((float)(v51 + v50) > v22) {
          float v52 = (float)a5;
        }
        float v53 = v50 - v51;
        if (v53 >= 0.0) {
          float v49 = v53;
        }
        *(float *)&double v45 = *(float *)&v43 / v20;
        *(float *)&double v46 = v49 / v22;
        *(float *)&double v43 = (float)(*(float *)&v47 - *(float *)&v43) / v20;
        *(float *)&double v47 = (float)(v52 - v49) / v22;
        *(float *)&double v44 = (float)v35;
        double v54 = [(VCPBoundingBox *)v42 initWithXYAndSize:v46 y:v45 width:v47 height:v43 confidence:v44];
        [(VCPBoundingBox *)v54 setGroupID:v26];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          double v55 = VCPLogInstance();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            [(VCPBoundingBox *)v54 minX];
            float v57 = v56;
            [(VCPBoundingBox *)v54 minY];
            float v59 = v58;
            [(VCPBoundingBox *)v54 maxX];
            float v61 = v60;
            [(VCPBoundingBox *)v54 maxY];
            *(_DWORD *)buf = v64;
            double v72 = v57;
            __int16 v73 = 2048;
            double v74 = v59;
            __int16 v75 = 2048;
            double v76 = v61;
            __int16 v77 = 2048;
            double v78 = v62;
            __int16 v79 = 2048;
            uint64_t v80 = v26;
            _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector: person fullbody box (xyxy) = [%f, %f, %f, %f], groupID = %lu", buf, 0x34u);
          }
        }
        [v13 addObject:v54];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
    }
    while (v17);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingObjects, 0);
  objc_storeStrong((id *)&self->_inferenceOutputNamedObjects, 0);
  begin = self->_outputEspressoBuffers.__begin_;
  if (begin)
  {
    self->_outputEspressoBuffers.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputMasksNames, 0);
  objc_storeStrong((id *)&self->_inputBufferMapping, 0);
  objc_storeStrong((id *)&self->_outputBufferMapping, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.pool_.value_);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0;
  return self;
}

@end