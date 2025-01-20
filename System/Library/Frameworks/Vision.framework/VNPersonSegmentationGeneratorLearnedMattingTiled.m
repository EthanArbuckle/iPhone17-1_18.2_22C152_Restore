@interface VNPersonSegmentationGeneratorLearnedMattingTiled
+ (BOOL)supportsTiling;
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BufferSize)_calculateNumberOfTilesForNetworkInputImageSize:(BufferSize)a3 networkInputMaskSize:(BufferSize)a4 networkOutputMaskSize:(BufferSize)a5 rotated:(BOOL)a6;
- (BufferSize)outputMaskSize;
- (id)_bindPixelBufferToTexture:(__CVBuffer *)a3 error:(id *)a4;
- (optional<std::tuple<std::unordered_map<NSString)_processTiledImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNPersonSegmentationGeneratorLearnedMattingTiled *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(id)a4 qosClass:(id)a5 error:(id)a6;
- (optional<std::tuple<std::unordered_map<NSString)processLockedImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNPersonSegmentationGeneratorLearnedMattingTiled *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(__CVBuffer *)a4 qosClass:(id)a5 error:(id)a6;
- (uint64_t)_processTiledImageBuffer:(uint64_t)a1 inputMaskObservation:options:qosClass:error:;
@end

@implementation VNPersonSegmentationGeneratorLearnedMattingTiled

+ (BOOL)supportsTiling
{
  return 1;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"learnedmatting-f16-v2.espresso";
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___VNPersonSegmentationGeneratorLearnedMattingTiled;
  v3 = objc_msgSendSuper2(&v6, sel_computeStagesToBindForConfigurationOptions_, a3);
  v4 = [v3 arrayByAddingObject:@"VNComputeStagePostProcessing"];

  return v4;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___VNPersonSegmentationGeneratorLearnedMattingTiled;
  v4 = objc_msgSendSuper2(&v9, sel_supportedComputeStageDevicesForOptions_error_, a3, a4);
  v5 = v4;
  if (v4)
  {
    objc_super v6 = (void *)[v4 mutableCopy];
    v7 = +[VNComputeDeviceUtilities allGPUComputeDevices];
    [v6 setObject:v7 forKeyedSubscript:@"VNComputeStagePostProcessing"];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteTileComputePipelineState, 0);
  objc_storeStrong((id *)&self->_createTileWithScaleComputePipelineState, 0);

  objc_storeStrong((id *)&self->_postProcessingMetalContext, 0);
}

- (id)_bindPixelBufferToTexture:(__CVBuffer *)a3 error:(id *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  switch(PixelFormatType)
  {
    case 0x42475241u:
      uint64_t v8 = 80;
      goto LABEL_7;
    case 0x4C303066u:
      uint64_t v8 = 55;
      goto LABEL_7;
    case 0x4C303068u:
      uint64_t v8 = 25;
LABEL_7:
      objc_super v9 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](self->_postProcessingMetalContext, a3, v8, a4);
      goto LABEL_8;
  }
  if (a4)
  {
    id v11 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:@"pixel format unimplemented"];
    objc_super v9 = 0;
    *a4 = v11;
  }
  else
  {
    objc_super v9 = 0;
  }
LABEL_8:

  return v9;
}

- (optional<std::tuple<std::unordered_map<NSString)_processTiledImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNPersonSegmentationGeneratorLearnedMattingTiled *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(id)a4 qosClass:(id)a5 error:(id)a6
{
  v184[2] = *(id *)MEMORY[0x1E4F143B8];
  id v90 = a4;
  id v89 = a5;
  id v14 = a6;
  v15 = +[VNValidationUtilities requiredSessionInOptions:v14 error:a8];
  if (v15)
  {
    v88 = v15;
    v16 = [v14 objectForKeyedSubscript:@"VNSegmentationGeneratorProcessOption_ImageRotated"];
    if ([v16 BOOLValue]) {
      int v17 = [(id)objc_opt_class() rotateImageToMatchNetworkOrientation];
    }
    else {
      int v17 = 0;
    }

    float64x2_t v18 = *(float64x2_t *)(MEMORY[0x1E4F1DB28] + 16);
    long long v182 = *MEMORY[0x1E4F1DB28];
    float64x2_t v183 = v18;
    v19 = [v14 objectForKeyedSubscript:@"VNSegmentationGeneratorProcessOption_ImageROI"];
    dispatch_qos_class_t qos_class = a7;
    [v19 getValue:&v182 size:32];

    v20 = [(VNSegmentationGenerator *)self espressoInputImageSize];
    unint64_t width = v20->width;
    unint64_t height = v20->height;
    v23 = [(VNSegmentationGenerator *)self espressoInputMaskSize];
    unint64_t v24 = v23->width;
    unint64_t v25 = v23->height;
    uint64_t v26 = [(VNPersonSegmentationGeneratorLearnedMattingTiled *)self outputMaskSize];
    LOBYTE(v66) = v17;
    uint64_t v28 = -[VNPersonSegmentationGeneratorLearnedMattingTiled _calculateNumberOfTilesForNetworkInputImageSize:networkInputMaskSize:networkOutputMaskSize:rotated:](self, "_calculateNumberOfTilesForNetworkInputImageSize:networkInputMaskSize:networkOutputMaskSize:rotated:", width, height, v24, v25, v26, v27, v66);
    uint64_t v30 = v29;
    v31 = -[VNMetalContext commandQueueReturnError:]((os_unfair_lock_s *)self->_postProcessingMetalContext, a8);
    if (!v31)
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
LABEL_49:

      v15 = v88;
      goto LABEL_50;
    }
    v84 = v31;
    v32 = objc_opt_class();
    v82 = [v32 inputImageBlobName];
    v83 = [v32 inputMaskBlobName];
    uint64_t v33 = [v90 width];
    unint64_t v74 = [v90 height];
    unint64_t v75 = v33;
    uint64_t v77 = v30;
    uint64_t v78 = v28;
    float64x2_t v86 = v183;
    uint64_t v34 = [(VNPersonSegmentationGeneratorLearnedMattingTiled *)self outputMaskSize];
    if (v17) {
      unint64_t v36 = v35;
    }
    else {
      unint64_t v36 = v34;
    }
    if (v17) {
      unint64_t v37 = v34;
    }
    else {
      unint64_t v37 = v35;
    }
    v181[0] = 0;
    v181[1] = v181;
    v181[2] = 0x2020000000;
    v181[3] = 0;
    v180[0] = 0;
    v180[1] = v180;
    v180[2] = 0x2020000000;
    v180[3] = 0;
    uint64_t v176 = 0;
    v177 = &v176;
    uint64_t v178 = 0x2020000000;
    uint64_t v179 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke;
    aBlock[3] = &unk_1E5B1DD50;
    aBlock[4] = v181;
    aBlock[5] = v180;
    aBlock[6] = &v176;
    v85 = (void (**)(void))_Block_copy(aBlock);
    v162[0] = MEMORY[0x1E4F143A8];
    v162[1] = 3221225472;
    v162[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2;
    v162[3] = &unk_1E5B1DD78;
    v167 = v181;
    id v38 = v90;
    uint64x2_t v170 = vcvtq_u64_f64(v86);
    long long v171 = v182;
    float64x2_t v172 = v183;
    id v163 = v38;
    v168 = v180;
    id v164 = v89;
    v165 = self;
    id v166 = v88;
    v169 = &v176;
    unint64_t v173 = v36;
    unint64_t v174 = v37;
    v87 = _Block_copy(v162);
    if ((VNExecuteBlock(v87, (uint64_t)a8) & 1) == 0)
    {
      v85[2]();
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
LABEL_48:

      _Block_object_dispose(&v176, 8);
      _Block_object_dispose(v180, 8);
      _Block_object_dispose(v181, 8);

      v31 = v84;
      goto LABEL_49;
    }
    v160[0] = 0;
    v160[1] = v160;
    v160[2] = 0x3032000000;
    v160[3] = __Block_byref_object_copy__19625;
    v160[4] = __Block_byref_object_dispose__19626;
    id v161 = 0;
    v158[0] = 0;
    v158[1] = v158;
    v158[2] = 0x3032000000;
    v158[3] = __Block_byref_object_copy__19625;
    v158[4] = __Block_byref_object_dispose__19626;
    id v159 = 0;
    v156[0] = 0;
    v156[1] = v156;
    v156[2] = 0x3032000000;
    v156[3] = __Block_byref_object_copy__19625;
    v156[4] = __Block_byref_object_dispose__19626;
    id v157 = 0;
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_45;
    v155[3] = &unk_1E5B1DDA0;
    v155[5] = v160;
    v155[4] = self;
    v155[6] = v181;
    v155[7] = v158;
    v155[8] = v180;
    v155[9] = v156;
    v155[10] = &v176;
    v76 = _Block_copy(v155);
    if ((VNExecuteBlock(v76, (uint64_t)a8) & 1) == 0)
    {
      v85[2]();
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
LABEL_47:

      _Block_object_dispose(v156, 8);
      _Block_object_dispose(v158, 8);

      _Block_object_dispose(v160, 8);
      goto LABEL_48;
    }
    uint64_t v39 = *(void *)([(VNSegmentationGenerator *)self espressoMaskOutputBufferSizes]
                    + 16);
    long long v40 = v182;
    unint64_t v41 = *(void *)(v39 + 24);
    unint64_t v42 = *(void *)(v39 + 32);
    v153[0] = 0;
    v153[1] = v153;
    v153[2] = 0x6012000000;
    v153[3] = __Block_byref_object_copy__46;
    v153[4] = __Block_byref_object_dispose__47;
    v153[5] = "";
    memset(v154, 0, sizeof(v154));
    v151[0] = 0;
    v151[1] = v151;
    v151[2] = 0x3812000000;
    v151[3] = __Block_byref_object_copy__48_19628;
    v151[4] = __Block_byref_object_dispose__49_19629;
    v151[5] = "";
    int v152 = 0;
    v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v71 = dispatch_queue_create(0, v43);

    double v44 = (double)(v36 - v41) / (double)(unint64_t)(v78 - 1);
    double v45 = (double)v41;
    double v46 = (double)(v37 - v42) / (double)(unint64_t)(v77 - 1);
    LODWORD(v47) = (int)((double)v41 - v44);
    HIDWORD(v47) = (int)((double)v42 - v46);
    uint64_t dsemaa = v47;
    dispatch_semaphore_t v48 = dispatch_semaphore_create(0);
    uint64_t v145 = 0;
    v146 = &v145;
    uint64_t v147 = 0x3032000000;
    v148 = __Block_byref_object_copy__19625;
    v149 = __Block_byref_object_dispose__19626;
    id v150 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_51;
    block[3] = &unk_1E5B1DE10;
    v135 = v151;
    block[4] = self;
    v136 = v153;
    v137 = &v145;
    double v139 = v44;
    double v140 = v46;
    __int16 v144 = WORD2(dsemaa);
    __int16 v143 = dsemaa;
    id v49 = v84;
    id v133 = v49;
    v138 = v156;
    uint64_t v141 = v78;
    uint64_t v142 = v77;
    dsema = v48;
    v134 = dsema;
    dispatch_block_t v70 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos_class, 0, block);
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_4;
    v131[3] = &unk_1E5B1DE58;
    v131[4] = self;
    qos_classa = _Block_copy(v131);
    uint64_t v125 = 0;
    v126 = &v125;
    uint64_t v127 = 0x3032000000;
    v128 = __Block_byref_object_copy__19625;
    v129 = __Block_byref_object_dispose__19626;
    id v130 = 0;
    uint64_t v50 = *(void *)([(VNSegmentationGenerator *)self espressoMaskOutputBuffers] + 16)
        + 24;
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_6;
    v111[3] = &unk_1E5B1DED0;
    id v112 = v49;
    id v69 = qos_classa;
    id v117 = v69;
    v113 = self;
    v119 = v160;
    v120 = v158;
    id v114 = v82;
    uint64_t v124 = v50;
    id v115 = v83;
    v121 = &v125;
    v122 = v151;
    v123 = v153;
    v67 = v71;
    v116 = v67;
    id v68 = v70;
    id v118 = v68;
    v51 = _Block_copy(v111);
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_9;
    v101[3] = &unk_1E5B1DEF8;
    uint64_t v103 = v78;
    uint64_t v104 = v77;
    double v105 = *((double *)&v40 + 1) / (double)v74;
    double v106 = v44 / (double)v36;
    double v107 = v46 / (double)v37;
    double v108 = *(double *)&v40 / (double)v75;
    double v109 = v45 / (double)v36;
    double v110 = (double)v42 / (double)v37;
    id v79 = v51;
    id v102 = v79;
    v52 = (uint64_t (**)(void *, id *))_Block_copy(v101);
    v53 = (void *)MEMORY[0x1A6257080]();
    id v100 = 0;
    int v54 = v52[2](v52, &v100);
    id v55 = v100;
    if ((v54 & 1) == 0)
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
    }
    if (!v54)
    {
      v57 = 0;
      int v58 = 0;
      goto LABEL_29;
    }
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    v56 = (void *)v146[5];
    if (v56)
    {
      if (a8) {
LABEL_27:
      }
        *a8 = v56;
    }
    else
    {
      v56 = (void *)v126[5];
      if (!v56)
      {
        v57 = (void *)v177[3];
        v177[3] = 0;
        int v58 = 1;
LABEL_29:
        v85[2]();
        if (a8 && v55) {
          *a8 = v55;
        }
        if (v58)
        {
          v184[0] = *(id *)(*(void *)([(VNSegmentationGenerator *)self espressoMaskOutputBufferSizes]+ 16)+ 16);
          v184[1] = v57;
          *(_OWORD *)v91 = 0u;
          long long v92 = 0u;
          int v93 = 1065353216;
          std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},__CVBuffer *> const&>((uint64_t)v91, v184, (uint64_t)v184);
          v59 = v91[0];
          unint64_t v60 = (unint64_t)v91[1];
          v91[0] = 0;
          v91[1] = 0;
          v94[0] = v59;
          v94[1] = (void *)v60;
          long long v95 = v92;
          int v96 = v93;
          if (*((void *)&v92 + 1))
          {
            unint64_t v61 = *(void *)(v92 + 8);
            if ((v60 & (v60 - 1)) != 0)
            {
              if (v61 >= v60) {
                v61 %= v60;
              }
            }
            else
            {
              v61 &= v60 - 1;
            }
            *((void *)v59 + v61) = &v95;
            long long v92 = 0uLL;
          }
          long long v98 = 0u;
          long long __p = 0u;
          int v99 = 1065353216;
          std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)retstr, (uint64_t *)v94);
          std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)&retstr->var0.var1.var0.var1, (uint64_t *)&__p);
          retstr->var1 = 1;
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v98);
          v62 = (void *)__p;
          *(void *)&long long __p = 0;
          if (v62) {
            operator delete(v62);
          }
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v95);
          v63 = v94[0];
          v94[0] = 0;
          if (v63) {
            operator delete(v63);
          }
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(0);
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v92);
          v64 = v91[0];
          v91[0] = 0;
          if (v64) {
            operator delete(v64);
          }
        }
        _Block_object_dispose(&v125, 8);

        _Block_object_dispose(&v145, 8);
        _Block_object_dispose(v151, 8);
        _Block_object_dispose(v153, 8);
        std::deque<-[VNPersonSegmentationGeneratorLearnedMattingTiled _processTiledImageBuffer:inputMaskObservation:options:qosClass:error:]::OutputTileData>::~deque[abi:ne180100]((uint64_t)v154);
        goto LABEL_47;
      }
      if (a8) {
        goto LABEL_27;
      }
    }
    v57 = 0;
    int v58 = 0;
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    goto LABEL_29;
  }
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
LABEL_50:

  return result;
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(a1[5] + 8) + 24));
  *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(a1[6] + 8) + 24));
  *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "croppedBufferWithWidth:height:format:cropRect:options:error:", *(void *)(a1 + 88), *(void *)(a1 + 96), 1111970369, 0, a2, *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CVPixelBufferRetain((CVPixelBufferRef)[*(id *)(a1 + 40) pixelBuffer]);
    double Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    double v5 = Width / (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    double v6 = *(double *)(a1 + 120) / *(double *)(a1 + 128);
    if ((v5 >= 1.0 || v6 < 1.0) && (v5 < 1.0 || v6 >= 1.0)) {
      goto LABEL_14;
    }
    objc_super v9 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    v10 = [v9 imageByApplyingCGOrientation:6];

    CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    id v11 = [*(id *)(a1 + 48) boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a2];
    if (v11)
    {
      v12 = *(void **)(a1 + 48);
      size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v12 renderCIImage:v10 width:Height height:CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) format:1278226534 computeDevice:v11 session:*(void *)(a1 + 56) error:a2];
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);

      if (v14)
      {
LABEL_14:
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, *(void *)(a1 + 136), *(void *)(a1 + 144), 1278226536, a2);
        return *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 0;
      }
    }
    else
    {
    }
  }
  return 0;
}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _bindPixelBufferToTexture:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) error:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    return 0;
  }
  uint64_t v7 = [*(id *)(a1 + 32) _bindPixelBufferToTexture:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) error:a2];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  objc_super v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    return 0;
  }
  uint64_t v10 = -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](*(void **)(*(void *)(a1 + 32) + 216), *(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), a2);
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  return *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_51(uint64_t a1)
{
  v47[2] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 48));
  +[VNError VNAssert:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 88) != 0 log:@"VNSegmentationGenerator - output tiles queue is empty"];
  v2 = *(int64x2_t **)(*(void *)(a1 + 64) + 8);
  v3 = (void **)v2[3].i64[1];
  int64x2_t v4 = vaddq_s64(v2[5], (int64x2_t)xmmword_1A410C290);
  unint64_t v5 = (unint64_t)v3[v2[5].i64[0] / 0xAAuLL] + 24 * (v2[5].i64[0] % 0xAAuLL);
  uint64x2_t v36 = *(uint64x2_t *)v5;
  double v6 = *(__CVBuffer **)(v5 + 16);
  v2[5] = v4;
  if (v4.i64[0] >= 0x154uLL)
  {
    operator delete(*v3);
    v2[3].i64[1] += 8;
    v2[5].i64[0] -= 170;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 48));
  uint64_t v7 = (void *)MEMORY[0x1A6257080]();
  uint64_t v8 = *(void **)(a1 + 32);
  id v46 = 0;
  objc_super v9 = [v8 _bindPixelBufferToTexture:v6 error:&v46];
  id v10 = v46;
  id v11 = v46;
  v12 = v11;
  if (v9)
  {
    int32x2_t v13 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(*(float64x2_t *)(a1 + 88), vcvtq_f64_u64(v36)))));
    float v34 = 0.0;
    HIWORD(v14) = 0;
    float v35 = 0.0;
    if (v13.i32[0])
    {
      LOWORD(v14) = *(_WORD *)(a1 + 120);
      float v14 = (float)LODWORD(v14);
      float v35 = v14;
    }
    int32x2_t v32 = v13;
    if (v13.i32[1])
    {
      LOWORD(v14) = *(_WORD *)(a1 + 122);
      float v34 = (float)LODWORD(v14);
    }
    id v31 = v10;
    v15 = v7;
    id v33 = v11;
    v16 = [*(id *)(a1 + 40) commandBuffer];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v17 + 216);
    v19 = *(void **)(v17 + 232);
    uint64_t v20 = [v9 width];
    uint64_t v21 = [v9 height];
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v47[0] = v9;
    v47[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2_60;
    v43[3] = &__block_descriptor_44_e36_v16__0___MTLComputeCommandEncoder__8l;
    __int16 v45 = v32.i16[2];
    __int16 v44 = v32.i16[0];
    v43[4] = __PAIR64__(LODWORD(v34), LODWORD(v35));
    -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v18, v16, v19, v20, v21, v23, v43);

    v12 = v33;
    uint64_t v7 = v15;
    id v10 = v31;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_3;
    v37[3] = &unk_1E5B1DDE8;
    uint64_t v39 = v6;
    uint64x2_t v40 = v36;
    unint64_t v41 = v6;
    long long v42 = *(_OWORD *)(a1 + 104);
    id v38 = *(id *)(a1 + 48);
    [v16 addCompletedHandler:v37];
    [v16 commit];
  }
  else
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v26 = *(void *)(v24 + 40);
    unint64_t v25 = (id *)(v24 + 40);
    if (!v26) {
      objc_storeStrong(v25, v10);
    }
    CVPixelBufferRelease(v6);
  }

  if (v9) {
    BOOL v27 = v12 == 0;
  }
  else {
    BOOL v27 = 1;
  }
  if (!v27)
  {
    uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v30 = *(void *)(v28 + 40);
    uint64_t v29 = (id *)(v28 + 40);
    if (!v30) {
      objc_storeStrong(v29, v10);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

__CVBuffer *__121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_4(uint64_t a1, void *a2, void *a3, size_t a4, size_t a5, uint64_t a6, void *a7, double a8, double a9, double a10, double a11)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  id v22 = a3;
  unint64_t v23 = [v22 width];
  unint64_t v24 = [v22 height];
  unint64_t v25 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4, a5, a6, a7);
  if (v25)
  {
    uint64_t v26 = [*(id *)(a1 + 32) _bindPixelBufferToTexture:v25 error:a7];
    BOOL v27 = v26;
    if (v26)
    {
      uint64_t v28 = *(void *)(a1 + 32);
      unint64_t v37 = *(void **)(v28 + 224);
      uint64_t v38 = *(void *)(v28 + 216);
      uint64_t v36 = [v26 width];
      uint64_t v29 = [v27 height];
      v40[0] = v22;
      v40[1] = v27;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      *(float *)&uint64_t v31 = a8 * (double)v23;
      float v32 = a9 * (double)v24;
      *((float *)&v31 + 1) = v32;
      *(float *)&uint64_t v33 = a10 * (double)v23 / (float)a4;
      float v34 = a11 * (double)v24 / (float)a5;
      *((float *)&v33 + 1) = v34;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_5;
      v39[3] = &__block_descriptor_48_e36_v16__0___MTLComputeCommandEncoder__8l;
      v39[4] = v31;
      v39[5] = v33;
      -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v38, v21, v37, v36, v29, v30, v39);
    }
    else
    {
      CVPixelBufferRelease(v25);
      unint64_t v25 = 0;
    }
  }
  return v25;
}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  unint64_t v23 = [*(id *)(a1 + 32) commandBuffer];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v26 = (void *)[*(id *)(a1 + 40) espressoInputImageSize];
  uint64_t v54 = (*(uint64_t (**)(uint64_t, void *, uint64_t, void, void, uint64_t, uint64_t, double, double, double, double))(v24 + 16))(v24, v23, v25, *v26, v26[1], 1111970369, a4, a5, a6, a7, a8);
  if (v52[3])
  {
    uint64_t v47 = 0;
    dispatch_semaphore_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t v27 = *(void *)(a1 + 72);
    uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    uint64_t v29 = (void *)[*(id *)(a1 + 40) espressoInputMaskSize];
    uint64_t v50 = (*(uint64_t (**)(uint64_t, void *, uint64_t, void, void, uint64_t, uint64_t, double, double, double, double))(v27 + 16))(v27, v23, v28, *v29, v29[1], 1278226536, a4, a9, a10, a11, a12);
    uint64_t v30 = v48[3];
    BOOL v31 = v30 != 0;
    if (v30)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_7;
      v36[3] = &unk_1E5B1DEA8;
      float v32 = *(void **)(a1 + 48);
      v36[4] = *(void *)(a1 + 40);
      unint64_t v41 = &v51;
      id v37 = v32;
      long long v42 = &v47;
      id v38 = *(id *)(a1 + 56);
      uint64_t v45 = a2;
      uint64_t v46 = a3;
      long long v33 = *(_OWORD *)(a1 + 120);
      long long v43 = *(_OWORD *)(a1 + 104);
      long long v44 = v33;
      id v39 = *(id *)(a1 + 64);
      id v40 = *(id *)(a1 + 80);
      [v23 addCompletedHandler:v36];
      [v23 commit];
    }
    else
    {
      CVPixelBufferRelease((CVPixelBufferRef)v52[3]);
      v52[3] = 0;
    }
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    BOOL v31 = 0;
  }
  _Block_object_dispose(&v51, 8);

  return v31;
}

uint64_t __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_9(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 48);
  if (!v1) {
    return 1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = *(void *)(a1 + 40);
  while (!v4)
  {
LABEL_8:
    if (++v3 >= v1) {
      return 1;
    }
  }
  unint64_t v5 = 0;
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 56) + v6 * (double)v3;
  double v8 = v6 * (double)v3;
  while (((*(uint64_t (**)(double, double, double, double, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 80) + *(double *)(a1 + 64) * (double)v5, v7, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 64) * (double)v5, v8, *(double *)(a1 + 88), *(double *)(a1 + 96)) & 1) != 0)
  {
    ++v5;
    unint64_t v4 = *(void *)(a1 + 40);
    if (v5 >= v4)
    {
      unint64_t v1 = *(void *)(a1 + 48);
      goto LABEL_8;
    }
  }
  return 0;
}

- (uint64_t)_processTiledImageBuffer:(uint64_t)a1 inputMaskObservation:options:qosClass:error:
{
  v2 = *(void ***)(a1 + 8);
  unint64_t v3 = *(void ***)(a1 + 16);
  *(void *)(a1 + 40) = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      unint64_t v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 85;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    uint64_t v6 = 170;
LABEL_7:
    *(void *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      double v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8 != v9) {
      *(void *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v116 = 0;
  id v117 = &v116;
  uint64_t v118 = 0x2020000000;
  uint64_t v119 = 0;
  *(_OWORD *)long long __p = 0u;
  long long v114 = 0u;
  int v115 = 1065353216;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_8;
  aBlock[3] = &unk_1E5B1DE80;
  uint64_t v4 = *(void *)(a1 + 72);
  unint64_t v5 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v109 = v4;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 80);
  id v107 = v6;
  uint64_t v110 = v7;
  id v108 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 112);
  v111 = &v116;
  uint64_t v112 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  id v105 = 0;
  char v10 = VNExecuteBlock(v9, (uint64_t)&v105);
  id v11 = v105;
  id v12 = v105;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v15 = *(void *)(v13 + 40);
    float v14 = (id *)(v13 + 40);
    if (!v15) {
      objc_storeStrong(v14, v11);
    }
  }
  uint64_t v103 = *(void *)(a1 + 128);
  uint64_t v104 = *(void *)(a1 + 120);
  uint64_t v102 = v117[3];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
  v16 = *(void **)(*(void *)(a1 + 104) + 8);
  uint64_t v17 = (char *)v16[8];
  uint64_t v18 = (char *)v16[7];
  uint64_t v19 = (v17 - v18) >> 3;
  uint64_t v20 = v17 - v18;
  if (v17 == v18) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 170 * v19 - 1;
  }
  unint64_t v22 = v16[10];
  if (v21 == v16[11] + v22)
  {
    BOOL v23 = v22 >= 0xAA;
    unint64_t v24 = v22 - 170;
    v101 = v9;
    if (v23)
    {
      v16[10] = v24;
      uint64_t v27 = *(void *)v18;
      uint64_t v25 = v18 + 8;
      uint64_t v26 = v27;
      v16[7] = v25;
      if (v17 == (char *)v16[9])
      {
        id v99 = v12;
        uint64_t v28 = (char *)v16[6];
        if (v25 <= v28)
        {
          if (v17 == v28) {
            unint64_t v46 = 1;
          }
          else {
            unint64_t v46 = (v17 - v28) >> 2;
          }
          if (v46 >> 61) {
            goto LABEL_104;
          }
          uint64_t v47 = (char *)operator new(8 * v46);
          dispatch_semaphore_t v48 = &v47[8 * (v46 >> 2)];
          uint64_t v50 = v17 - v25;
          BOOL v49 = v17 == v25;
          uint64_t v17 = v48;
          if (!v49)
          {
            uint64_t v17 = &v48[v50 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v51 = 8 * (v50 >> 3);
            v52 = &v47[8 * (v46 >> 2)];
            do
            {
              uint64_t v53 = *(void *)v25;
              v25 += 8;
              *(void *)v52 = v53;
              v52 += 8;
              v51 -= 8;
            }
            while (v51);
          }
          v16[6] = v47;
          v16[7] = v48;
          v16[8] = v17;
          v16[9] = &v47[8 * v46];
          if (v28)
          {
            operator delete(v28);
            uint64_t v17 = (char *)v16[8];
          }
        }
        else
        {
          uint64_t v29 = (v25 - v28) >> 3;
          if (v29 >= -1) {
            uint64_t v30 = v29 + 1;
          }
          else {
            uint64_t v30 = v29 + 2;
          }
          uint64_t v31 = -(v30 >> 1);
          uint64_t v32 = v30 >> 1;
          long long v33 = &v25[-8 * v32];
          int64_t v34 = v17 - v25;
          if (v17 != v25)
          {
            memmove(&v25[-8 * v32], v25, v17 - v25);
            uint64_t v17 = (char *)v16[7];
          }
          float v35 = &v17[8 * v31];
          uint64_t v17 = &v33[v34];
          v16[7] = v35;
          v16[8] = &v33[v34];
          id v12 = v99;
        }
      }
      *(void *)uint64_t v17 = v26;
      v16[8] += 8;
      uint64_t v9 = v101;
      goto LABEL_100;
    }
    id v98 = v3;
    id v100 = v12;
    uint64_t v36 = (char *)v16[9];
    id v37 = (char *)v16[6];
    if (v19 < (unint64_t)((v36 - v37) >> 3))
    {
      id v38 = operator new(0xFF0uLL);
      id v39 = v38;
      if (v36 != v17)
      {
        *(void *)uint64_t v17 = v38;
        id v3 = v98;
LABEL_99:
        v16[8] += 8;
        id v12 = v100;
        goto LABEL_100;
      }
      if (v18 == v37)
      {
        if (v17 == v18) {
          unint64_t v71 = 1;
        }
        else {
          unint64_t v71 = (v36 - v18) >> 2;
        }
        if (v71 >> 61) {
          goto LABEL_104;
        }
        v72 = (char *)operator new(8 * v71);
        uint64_t v54 = &v72[(2 * v71 + 6) & 0xFFFFFFFFFFFFFFF8];
        v73 = v54;
        id v3 = v98;
        if (v17 != v18)
        {
          uint64_t v74 = 8 * v19;
          unint64_t v75 = &v72[(2 * v71 + 6) & 0xFFFFFFFFFFFFFFF8];
          v76 = v18;
          v73 = &v54[8 * v19];
          do
          {
            uint64_t v77 = *(void *)v76;
            v76 += 8;
            *(void *)unint64_t v75 = v77;
            v75 += 8;
            v74 -= 8;
          }
          while (v74);
        }
        v16[6] = v72;
        v16[7] = v54;
        v16[8] = v73;
        v16[9] = &v72[8 * v71];
        if (v18)
        {
          operator delete(v18);
          uint64_t v54 = (char *)v16[7];
        }
      }
      else
      {
        uint64_t v54 = v18;
        id v3 = v98;
      }
      *((void *)v54 - 1) = v39;
      uint64_t v78 = (char *)v16[7];
      id v79 = (char *)v16[8];
      v16[7] = v78 - 8;
      uint64_t v80 = *((void *)v78 - 1);
      v16[7] = v78;
      if (v79 != (char *)v16[9])
      {
LABEL_98:
        *(void *)id v79 = v80;
        goto LABEL_99;
      }
      v81 = (char *)v16[6];
      if (v78 > v81)
      {
        uint64_t v82 = (v78 - v81) >> 3;
        if (v82 >= -1) {
          uint64_t v83 = v82 + 1;
        }
        else {
          uint64_t v83 = v82 + 2;
        }
        uint64_t v84 = -(v83 >> 1);
        uint64_t v85 = v83 >> 1;
        float64x2_t v86 = &v78[-8 * v85];
        size_t v87 = v79 - v78;
        if (v87)
        {
          memmove(&v78[-8 * v85], v78, v87);
          uint64_t v78 = (char *)v16[7];
        }
        id v79 = &v86[v87];
        v16[7] = &v78[8 * v84];
        v16[8] = v79;
        goto LABEL_98;
      }
      if (v79 == v81) {
        unint64_t v88 = 1;
      }
      else {
        unint64_t v88 = (v79 - v81) >> 2;
      }
      if (!(v88 >> 61))
      {
        id v89 = (char *)operator new(8 * v88);
        id v90 = &v89[8 * (v88 >> 2)];
        uint64_t v91 = v79 - v78;
        BOOL v49 = v79 == v78;
        id v79 = v90;
        id v3 = v98;
        if (!v49)
        {
          id v79 = &v90[v91 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v92 = 8 * (v91 >> 3);
          int v93 = &v89[8 * (v88 >> 2)];
          do
          {
            uint64_t v94 = *(void *)v78;
            v78 += 8;
            *(void *)int v93 = v94;
            v93 += 8;
            v92 -= 8;
          }
          while (v92);
        }
        v16[6] = v89;
        v16[7] = v90;
        v16[8] = v79;
        v16[9] = &v89[8 * v88];
        if (v81)
        {
          operator delete(v81);
          id v79 = (char *)v16[8];
        }
        goto LABEL_98;
      }
LABEL_104:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    if (v36 == v37) {
      unint64_t v40 = 1;
    }
    else {
      unint64_t v40 = (v36 - v37) >> 2;
    }
    if (v40 >> 61) {
      goto LABEL_104;
    }
    unint64_t v41 = (char *)operator new(8 * v40);
    long long v42 = operator new(0xFF0uLL);
    long long v43 = &v41[8 * v19];
    long long v44 = &v41[8 * v40];
    if (v19 == v40)
    {
      v97 = v42;
      id v3 = v98;
      if (v20 < 1)
      {
        if (v17 == v18) {
          unint64_t v55 = 1;
        }
        else {
          unint64_t v55 = v20 >> 2;
        }
        if (v55 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        long long v43 = (char *)operator new(8 * v55);
        long long v44 = &v43[8 * v55];
        operator delete(v41);
        uint64_t v18 = (char *)v16[7];
        uint64_t v17 = (char *)v16[8];
        unint64_t v41 = v43;
      }
      else
      {
        unint64_t v45 = v19 + 2;
        if (v19 >= -1) {
          unint64_t v45 = v19 + 1;
        }
        v43 -= 8 * (v45 >> 1);
      }
      long long v42 = v97;
    }
    else
    {
      id v3 = v98;
    }
    *(void *)long long v43 = v42;
    v56 = v43 + 8;
    if (v17 == v18)
    {
      id v69 = v43;
      int v58 = v43 + 8;
    }
    else
    {
      do
      {
        if (v43 == v41)
        {
          if (v56 >= v44)
          {
            if (v44 == v43) {
              unint64_t v61 = 1;
            }
            else {
              unint64_t v61 = (v44 - v43) >> 2;
            }
            if (v61 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v62 = (char *)operator new(8 * v61);
            unint64_t v41 = v62;
            v57 = &v62[(2 * v61 + 6) & 0xFFFFFFFFFFFFFFF8];
            int v58 = v57;
            uint64_t v63 = v56 - v43;
            if (v56 != v43)
            {
              int v58 = &v57[v63 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v64 = 8 * (v63 >> 3);
              v65 = &v62[(2 * v61 + 6) & 0xFFFFFFFFFFFFFFF8];
              uint64_t v66 = v43;
              do
              {
                uint64_t v67 = *(void *)v66;
                v66 += 8;
                *(void *)v65 = v67;
                v65 += 8;
                v64 -= 8;
              }
              while (v64);
            }
            long long v44 = &v62[8 * v61];
            operator delete(v43);
          }
          else
          {
            uint64_t v59 = (v44 - v56) >> 3;
            if (v59 >= -1) {
              unint64_t v60 = v59 + 1;
            }
            else {
              unint64_t v60 = v59 + 2;
            }
            int v58 = &v56[8 * (v60 >> 1)];
            v57 = &v43[8 * (v60 >> 1)];
            if (v56 == v43)
            {
              unint64_t v41 = v56;
            }
            else
            {
              memmove(&v43[8 * (v60 >> 1)], v43, v56 - v43);
              unint64_t v41 = v43;
            }
          }
        }
        else
        {
          v57 = v43;
          int v58 = v56;
        }
        uint64_t v68 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v57 - 1) = v68;
        id v69 = v57 - 8;
        v56 = v58;
        long long v43 = v69;
      }
      while (v17 != (char *)v16[7]);
    }
    dispatch_block_t v70 = (void *)v16[6];
    v16[6] = v41;
    v16[7] = v69;
    v16[8] = v58;
    v16[9] = v44;
    id v12 = v100;
    uint64_t v9 = v101;
    if (v70) {
      operator delete(v70);
    }
  }
LABEL_100:
  unint64_t v95 = v16[11] + v16[10];
  int v96 = (void *)(*(void *)(v16[7] + 8 * (v95 / 0xAA)) + 24 * (v95 % 0xAA));
  *int v96 = v104;
  v96[1] = v103;
  v96[2] = v102;
  ++v16[11];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));

  std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v114);
  if (__p[0]) {
    operator delete(__p[0]);
  }
  _Block_object_dispose(&v116, 8);
}

BOOL __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_8(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) bindPixelBuffer:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) toNetworkBlobName:*(void *)(a1 + 40) error:a2] & 1) != 0&& objc_msgSend(*(id *)(a1 + 32), "bindPixelBuffer:toNetworkBlobName:error:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(a1 + 48), a2)&& (objc_msgSend(*(id *)(a1 + 32), "executePlanAndReturnError:", a2))
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = +[VNEspressoHelpers createCVPixelBufferWithPixelFormat:1278226534 fromImageInEspressoBuffer:*(void *)(a1 + 80) error:a2];
    int v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;
  }
  else
  {
    int v4 = 2;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  return v4 == 0;
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setBytes:a1 + 32 length:8 atIndex:0];
  [v3 setBytes:a1 + 40 length:8 atIndex:1];
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_2_60(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setBytes:a1 + 40 length:4 atIndex:0];
  [v3 setBytes:a1 + 32 length:8 atIndex:1];
}

void __121__VNPersonSegmentationGeneratorLearnedMattingTiled__processTiledImageBuffer_inputMaskObservation_options_qosClass_error___block_invoke_3(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  if (*(void *)(a1 + 48) + 1 == *(void *)(a1 + 72) && *(void *)(a1 + 56) + 1 == *(void *)(a1 + 80))
  {
    v2 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v2);
  }
}

- (optional<std::tuple<std::unordered_map<NSString)processLockedImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNPersonSegmentationGeneratorLearnedMattingTiled *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(__CVBuffer *)a4 qosClass:(id)a5 error:(id)a6
{
  uint64_t v9 = *(void *)&a7;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(VNDetector *)self validatedImageBufferFromOptions:v14 error:a8];
  if (v15)
  {
    LOBYTE(__p) = 0;
    char v61 = 0;
    v16 = (void *)MEMORY[0x1A6257080]();
    id v39 = 0;
    [(VNPersonSegmentationGeneratorLearnedMattingTiled *)self _processTiledImageBuffer:v15 inputMaskObservation:v13 options:v14 qosClass:v9 error:&v39];
    id v17 = v39;
    if (v61 == v50)
    {
      if (v61)
      {
        if (v54)
        {
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v53);
          uint64_t v53 = 0;
          unint64_t v18 = v52;
          if (v52)
          {
            uint64_t v19 = 0;
            do
              *((void *)__p + v19++) = 0;
            while (v18 != v19);
          }
          uint64_t v54 = 0;
        }
        uint64_t v20 = v40;
        unint64_t v40 = 0;
        uint64_t v21 = __p;
        long long __p = v20;
        if (v21) {
          operator delete(v21);
        }
        unint64_t v22 = v41;
        unint64_t v41 = 0;
        uint64_t v53 = (id *)v42;
        uint64_t v54 = v43;
        int v55 = v44;
        unint64_t v52 = v22;
        if (v43)
        {
          unint64_t v23 = *(void *)(v42 + 8);
          if ((v22 & (v22 - 1)) != 0)
          {
            if (v23 >= v22) {
              v23 %= v22;
            }
          }
          else
          {
            v23 &= v22 - 1;
          }
          *((void *)__p + v23) = &v53;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
        }
        if (v59)
        {
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v58);
          int v58 = 0;
          unint64_t v29 = v57;
          if (v57)
          {
            uint64_t v30 = 0;
            do
              *((void *)v56 + v30++) = 0;
            while (v29 != v30);
          }
          uint64_t v59 = 0;
        }
        uint64_t v31 = v45;
        unint64_t v45 = 0;
        uint64_t v32 = v56;
        v56 = v31;
        if (v32) {
          operator delete(v32);
        }
        unint64_t v33 = v46;
        unint64_t v46 = 0;
        int v58 = (id *)v47;
        uint64_t v59 = v48;
        int v60 = v49;
        unint64_t v57 = v33;
        if (v48)
        {
          unint64_t v34 = *(void *)(v47 + 8);
          if ((v33 & (v33 - 1)) != 0)
          {
            if (v34 >= v33) {
              v34 %= v33;
            }
          }
          else
          {
            v34 &= v33 - 1;
          }
          *((void *)v56 + v34) = &v58;
          uint64_t v47 = 0;
          uint64_t v48 = 0;
        }
      }
    }
    else if (v61)
    {
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v58);
      unint64_t v24 = v56;
      v56 = 0;
      if (v24) {
        operator delete(v24);
      }
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v53);
      uint64_t v25 = __p;
      long long __p = 0;
      if (v25) {
        operator delete(v25);
      }
      char v61 = 0;
    }
    else
    {
      uint64_t v26 = v40;
      unint64_t v27 = v41;
      unint64_t v40 = 0;
      unint64_t v41 = 0;
      long long __p = v26;
      unint64_t v52 = v27;
      uint64_t v53 = (id *)v42;
      uint64_t v54 = v43;
      int v55 = v44;
      if (v43)
      {
        unint64_t v28 = *(void *)(v42 + 8);
        if ((v27 & (v27 - 1)) != 0)
        {
          if (v28 >= v27) {
            v28 %= v27;
          }
        }
        else
        {
          v28 &= v27 - 1;
        }
        *((void *)v26 + v28) = &v53;
        uint64_t v42 = 0;
        uint64_t v43 = 0;
      }
      float v35 = v45;
      unint64_t v36 = v46;
      unint64_t v45 = 0;
      unint64_t v46 = 0;
      v56 = v35;
      unint64_t v57 = v36;
      int v58 = (id *)v47;
      uint64_t v59 = v48;
      int v60 = v49;
      if (v48)
      {
        unint64_t v37 = *(void *)(v47 + 8);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v37 >= v36) {
            v37 %= v36;
          }
        }
        else
        {
          v37 &= v36 - 1;
        }
        *((void *)v35 + v37) = &v58;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
      }
      char v61 = 1;
    }
    std::__optional_destruct_base<std::tuple<std::unordered_map<NSString * {__strong},__CVBuffer *>,std::unordered_map<NSString * {__strong},espresso_buffer_t>>,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v40);
    if (v61)
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
      std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)retstr, (uint64_t *)&__p);
      std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)&retstr->var0.var1.var0.var1, (uint64_t *)&v56);
      retstr->var1 = 1;
    }
    else
    {
      if (a8) {
        *a8 = v17;
      }
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
    }
    std::__optional_destruct_base<std::tuple<std::unordered_map<NSString * {__strong},__CVBuffer *>,std::unordered_map<NSString * {__strong},espresso_buffer_t>>,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&__p);
  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
  }

  return result;
}

- (BufferSize)_calculateNumberOfTilesForNetworkInputImageSize:(BufferSize)a3 networkInputMaskSize:(BufferSize)a4 networkOutputMaskSize:(BufferSize)a5 rotated:(BOOL)a6
{
  unint64_t height = a3.height;
  unint64_t width = a3.width;
  uint64_t v8 = [(VNPersonSegmentationGeneratorLearnedMattingTiled *)self outputMaskSize];
  if (a6) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  if (a6) {
    unint64_t v11 = v8;
  }
  else {
    unint64_t v11 = v9;
  }
  unint64_t v12 = vcvtps_u32_f32((float)v10 / (float)width);
  unint64_t v13 = vcvtps_u32_f32((float)v11 / (float)height);
  result.unint64_t height = v13;
  result.unint64_t width = v12;
  return result;
}

- (BufferSize)outputMaskSize
{
  unint64_t v2 = 2016;
  unint64_t v3 = 1512;
  result.unint64_t height = v3;
  result.unint64_t width = v2;
  return result;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)VNPersonSegmentationGeneratorLearnedMattingTiled;
  if (!-[VNSegmentationGenerator completeInitializationForSession:error:](&v17, sel_completeInitializationForSession_error_, a3))return 0; {
  id v6 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStagePostProcessing" error:a4];
  }
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = +[VNComputeDeviceUtilities metalDeviceForComputeDevice:v6];
  +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v7, a4);
  uint64_t v8 = (VNMetalContext *)objc_claimAutoreleasedReturnValue();
  postProcessingMetalContext = self->_postProcessingMetalContext;
  self->_postProcessingMetalContext = v8;

  unint64_t v10 = self->_postProcessingMetalContext;
  if (!v10) {
    goto LABEL_7;
  }
  -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v10, @"learnedMatting_createTileWithScale", (uint64_t)a4);
  unint64_t v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  createTileWithScaleComputePipelineState = self->_createTileWithScaleComputePipelineState;
  self->_createTileWithScaleComputePipelineState = v11;

  if (self->_createTileWithScaleComputePipelineState)
  {
    -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)self->_postProcessingMetalContext, @"learnedMatting_pasteTile", (uint64_t)a4);
    unint64_t v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    pasteTileComputePipelineState = self->_pasteTileComputePipelineState;
    self->_pasteTileComputePipelineState = v13;

    BOOL v15 = self->_pasteTileComputePipelineState != 0;
  }
  else
  {
LABEL_7:
    BOOL v15 = 0;
  }

  return v15;
}

@end