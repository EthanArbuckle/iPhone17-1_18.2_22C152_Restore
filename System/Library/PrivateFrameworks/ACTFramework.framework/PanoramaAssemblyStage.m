@interface PanoramaAssemblyStage
- (CGRect)cropRect;
- (MTLCommandQueue)metalCommandQueue;
- (NRFProcessor)nrfProcessor;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (PanoramaAssemblyStage)initWithContext:(id)a3 robustPanoParams:(id *)a4;
- (__CVBuffer)output;
- (__n128)panoHomography;
- (__n64)_stagingHomography;
- (int)_addStagingBuffer;
- (int)_bindOutput;
- (int)addHomogToStaging:(float32x4_t)a3;
- (int)addStagingToOutput:(id)a3;
- (int)assemblyMode;
- (int)clearStagingBuffer:(id)a3 withEncoder:(id)a4;
- (int)finishProcessing;
- (int)getMaskAsBuffer:(char *)a3 widthOut:(unint64_t *)a4 heightOut:(unint64_t *)a5;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcessPanoWidth:(unint64_t)a3 panoHeight:(unint64_t)a4;
- (int)prepareToProcessSliceWidth:(unint64_t)a3 sliceHeight:(unint64_t)a4 stagingWidth:(unint64_t)a5 stagingHeight:(unint64_t)a6;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)renderDirtyStagingBuffers;
- (int)resetState;
- (int)setDirection:(int)a3;
- (int)setup;
- (uint64_t)addSlice:(double)a3 metadata:(double)a4 sliceHomography:(double)a5 stitchingMask:(double)a6 motionCue:(double)a7 roi:(double)a8 sliceType:(uint64_t)a9;
- (uint64_t)addSliceToProjectiveGrid:(__n128)a3 atlasHomography:(__n128)a4 panoHomography:(__n128)a5 encoder:(__n128)a6 sliceType:(__n128)a7;
- (uint64_t)addSliceToStagingBuffer:(float32x4_t)a3 sliceLuma:(float32x4_t)a4 sliceChroma:(uint64_t)a5 sliceMask:(void *)a6 sliceGlobalHomography:(void *)a7 encoder:(void *)a8;
- (void)dealloc;
- (void)setAssemblyMode:(int)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setNrfProcessor:(id)a3;
- (void)setOutput:(__CVBuffer *)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation PanoramaAssemblyStage

- (PanoramaAssemblyStage)initWithContext:(id)a3 robustPanoParams:(id *)a4
{
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PanoramaAssemblyStage;
  v8 = [(PanoramaAssemblyStage *)&v27 init];
  v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_metal, a3),
        v10 = [PanoramaAssemblyShaders alloc],
        uint64_t v13 = objc_msgSend_initWithContext_(v10, v11, (uint64_t)v7, v12),
        shaders = v9->_shaders,
        v9->_shaders = (PanoramaAssemblyShaders *)v13,
        shaders,
        v9->_shaders))
  {
    *(_OWORD *)&v9->_sliceBufferAllocSize = xmmword_235A116E0;
    v9->_sliceHomographies = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(0x400uLL, 0x30uLL, 0x1000040EED21634uLL);
    v9->_atlasHomographies = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(v9->_sliceBufferAllocSize, 0x30uLL, 0x1000040EED21634uLL);
    uint64_t v15 = objc_opt_new();
    stagingBufferPool = v9->_stagingBufferPool;
    v9->_stagingBufferPool = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    dirtyStagingBuffers = v9->_dirtyStagingBuffers;
    v9->_dirtyStagingBuffers = (NSMutableArray *)v17;

    v9->_direction = 1;
    outputBoundLuma = v9->_outputBoundLuma;
    v9->_outputBoundLuma = 0;

    outputBoundChroma = v9->_outputBoundChroma;
    v9->_outputBoundChroma = 0;

    uint64_t v21 = MEMORY[0x263EF89A0];
    long long v22 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    *(_OWORD *)v9->_anon_110 = *MEMORY[0x263EF89A0];
    *(_OWORD *)&v9->_anon_110[16] = v22;
    *(_OWORD *)&v9->_anon_110[32] = *(_OWORD *)(v21 + 32);
    long long v24 = *(_OWORD *)&a4->var2;
    long long v23 = *(_OWORD *)&a4->var6;
    *(_OWORD *)&v9->_assemblyParams.frameWidth = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v9->_assemblyParams.enableTranslationCorrection = v24;
    *(_OWORD *)&v9->_assemblyParams.atlasTranslationShiftHighThreshold = v23;
    v9->_lastFilteredValue = 0.0;
    v9->_movingAverageBuffer = (float *)malloc_type_calloc(v9->_assemblyParams.movingAverageFilterSize, 4uLL, 0x100004052888210uLL);
    v25 = v9;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)dealloc
{
  free(self->_sliceHomographies);
  self->_sliceHomographies = 0;
  free(self->_atlasHomographies);
  self->_atlasHomographies = 0;
  self->_sliceBufferAllocSize = 0;
  self->_sliceBufferLength = 0;
  nrfInputPixelBuffer = self->_nrfInputPixelBuffer;
  if (nrfInputPixelBuffer)
  {
    CVPixelBufferRelease(nrfInputPixelBuffer);
    self->_nrfInputPixelBuffer = 0;
  }
  nrfOutputPixelBuffer = self->_nrfOutputPixelBuffer;
  if (nrfOutputPixelBuffer)
  {
    CVPixelBufferRelease(nrfOutputPixelBuffer);
    self->_nrfOutputPixelBuffer = 0;
  }
  free(self->_movingAverageBuffer);
  self->_movingAverageBuffer = 0;
  v5.receiver = self;
  v5.super_class = (Class)PanoramaAssemblyStage;
  [(PanoramaAssemblyStage *)&v5 dealloc];
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)process
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)clearStagingBuffer:(id)a3 withEncoder:(id)a4
{
  shaders = self->_shaders;
  id v7 = a4;
  id v8 = a3;
  uint64_t v12 = objc_msgSend_resetSliceSizedState(shaders, v9, v10, v11);
  getThreadgroupSizeForShader(v12, (unint64_t *)&v65);

  v16 = objc_msgSend_resetSliceSizedState(self->_shaders, v13, v14, v15);
  objc_msgSend_setComputePipelineState_(v7, v17, (uint64_t)v16, v18);

  long long v22 = objc_msgSend_luma(v8, v19, v20, v21);
  objc_msgSend_setTexture_atIndex_(v7, v23, (uint64_t)v22, 0);

  objc_super v27 = objc_msgSend_chroma(v8, v24, v25, v26);
  objc_msgSend_setTexture_atIndex_(v7, v28, (uint64_t)v27, 1);

  v32 = objc_msgSend_weights(v8, v29, v30, v31);
  objc_msgSend_setTexture_atIndex_(v7, v33, (uint64_t)v32, 2);

  v37 = objc_msgSend_chroma(v8, v34, v35, v36);
  uint64_t v41 = objc_msgSend_width(v37, v38, v39, v40);
  v45 = objc_msgSend_chroma(v8, v42, v43, v44);
  v64[0] = v41;
  v64[1] = objc_msgSend_height(v45, v46, v47, v48);
  v64[2] = 1;
  long long v62 = v65;
  uint64_t v63 = v66;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v7, v49, (uint64_t)v64, (uint64_t)&v62);

  long long v60 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v61 = *MEMORY[0x263EF89A0];
  long long v59 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  objc_msgSend_setHomographyToReference_(v8, v50, v51, v52);
  objc_msgSend_setAtlasHomography_(v8, v53, v54, v55, *(double *)&v61, *(double *)&v60, *(double *)&v59);
  objc_msgSend_setDirty_(v8, v56, 0, v57);

  return 0;
}

- (int)resetState
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  uint64_t v150 = 1056964608;
  objc_super v5 = objc_msgSend_commandQueue(self->_metal, a2, v2, v3);
  v9 = objc_msgSend_commandBuffer(v5, v6, v7, v8);

  objc_msgSend_setLabel_(v9, v10, @"Panorama:AssemblyStage:resetState", v11);
  uint64_t v15 = objc_msgSend_computeCommandEncoder(v9, v12, v13, v14);
  self->_sliceBufferLength = 0;
  uint64_t v16 = MEMORY[0x263EF89A0];
  long long v17 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)self->_anon_110 = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self->_anon_110[16] = v17;
  *(_OWORD *)&self->_anon_110[32] = *(_OWORD *)(v16 + 32);
  uint64_t v21 = objc_msgSend_resetPanoSizedState(self->_shaders, v18, v19, v20);
  getThreadgroupSizeForShader(v21, (unint64_t *)&v148);

  if (self->_projectiveGrid)
  {
    uint64_t v25 = objc_msgSend_resetPanoSizedState(self->_shaders, v22, v23, v24);
    objc_msgSend_setComputePipelineState_(v15, v26, (uint64_t)v25, v27);

    objc_msgSend_setTexture_atIndex_(v15, v28, (uint64_t)self->_projectiveGrid, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v29, (uint64_t)&v150 + 4, 4, 0);
    uint64_t v33 = objc_msgSend_width(self->_projectiveGrid, v30, v31, v32);
    uint64_t v37 = objc_msgSend_height(self->_projectiveGrid, v34, v35, v36);
    v147[0] = v33;
    v147[1] = v37;
    v147[2] = 1;
    long long v145 = v148;
    uint64_t v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v38, (uint64_t)v147, (uint64_t)&v145);
    v42 = objc_msgSend_resetPanoSizedState(self->_shaders, v39, v40, v41);
    objc_msgSend_setComputePipelineState_(v15, v43, (uint64_t)v42, v44);

    objc_msgSend_setTexture_atIndex_(v15, v45, (uint64_t)self->_outputMask, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v46, (uint64_t)&v150 + 4, 4, 0);
    uint64_t v50 = objc_msgSend_width(self->_outputMask, v47, v48, v49);
    uint64_t v54 = objc_msgSend_height(self->_outputMask, v51, v52, v53);
    v144[0] = v50;
    v144[1] = v54;
    v144[2] = 1;
    long long v145 = v148;
    uint64_t v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v55, (uint64_t)v144, (uint64_t)&v145);
  }
  if (self->_outputBoundLuma)
  {
    v56 = objc_msgSend_resetPanoSizedState(self->_shaders, v22, v23, v24);
    objc_msgSend_setComputePipelineState_(v15, v57, (uint64_t)v56, v58);

    objc_msgSend_setTexture_atIndex_(v15, v59, (uint64_t)self->_outputBoundLuma, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v60, (uint64_t)&v150 + 4, 4, 0);
    uint64_t v64 = objc_msgSend_width(self->_outputBoundLuma, v61, v62, v63);
    uint64_t v68 = objc_msgSend_height(self->_outputBoundLuma, v65, v66, v67);
    v143[0] = v64;
    v143[1] = v68;
    v143[2] = 1;
    long long v145 = v148;
    uint64_t v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v69, (uint64_t)v143, (uint64_t)&v145);
  }
  if (self->_outputBoundChroma)
  {
    v70 = objc_msgSend_resetPanoSizedState(self->_shaders, v22, v23, v24);
    objc_msgSend_setComputePipelineState_(v15, v71, (uint64_t)v70, v72);

    objc_msgSend_setTexture_atIndex_(v15, v73, (uint64_t)self->_outputBoundChroma, 0);
    objc_msgSend_setBytes_length_atIndex_(v15, v74, (uint64_t)&v150, 4, 0);
    uint64_t v78 = objc_msgSend_width(self->_outputBoundChroma, v75, v76, v77);
    uint64_t v82 = objc_msgSend_height(self->_outputBoundChroma, v79, v80, v81);
    v142[0] = v78;
    v142[1] = v82;
    v142[2] = 1;
    long long v145 = v148;
    uint64_t v146 = v149;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v83, (uint64_t)v142, (uint64_t)&v145);
  }
  v84 = objc_msgSend_resetSliceSizedState(self->_shaders, v22, v23, v24);
  getThreadgroupSizeForShader(v84, (unint64_t *)&v145);
  long long v148 = v145;
  uint64_t v149 = v146;

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  v85 = self->_dirtyStagingBuffers;
  uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v138, (uint64_t)v151, 16);
  if (v87)
  {
    uint64_t v91 = v87;
    uint64_t v92 = *(void *)v139;
    do
    {
      for (uint64_t i = 0; i != v91; ++i)
      {
        if (*(void *)v139 != v92) {
          objc_enumerationMutation(v85);
        }
        v94 = *(void **)(*((void *)&v138 + 1) + 8 * i);
        v95 = objc_msgSend_resetSliceSizedState(self->_shaders, v88, v89, v90);
        objc_msgSend_setComputePipelineState_(v15, v96, (uint64_t)v95, v97);

        v101 = objc_msgSend_luma(v94, v98, v99, v100);
        objc_msgSend_setTexture_atIndex_(v15, v102, (uint64_t)v101, 0);

        v106 = objc_msgSend_chroma(v94, v103, v104, v105);
        objc_msgSend_setTexture_atIndex_(v15, v107, (uint64_t)v106, 1);

        v111 = objc_msgSend_weights(v94, v108, v109, v110);
        objc_msgSend_setTexture_atIndex_(v15, v112, (uint64_t)v111, 2);

        v116 = objc_msgSend_chroma(v94, v113, v114, v115);
        uint64_t v120 = objc_msgSend_width(v116, v117, v118, v119);
        v124 = objc_msgSend_chroma(v94, v121, v122, v123);
        uint64_t v128 = objc_msgSend_height(v124, v125, v126, v127);
        v137[0] = v120;
        v137[1] = v128;
        v137[2] = 1;
        long long v145 = v148;
        uint64_t v146 = v149;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v129, (uint64_t)v137, (uint64_t)&v145);
      }
      uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v138, (uint64_t)v151, 16);
    }
    while (v91);
  }

  objc_msgSend_endEncoding(v15, v130, v131, v132);
  objc_msgSend_commit(v9, v133, v134, v135);
  self->_sliceBufferLength = 0;
  *(void *)&self->_startingMean = 0;
  bzero(self->_movingAverageBuffer, 4 * self->_assemblyParams.movingAverageFilterSize);

  return 0;
}

- (int)setup
{
  return 0;
}

- (int)prepareToProcessPanoWidth:(unint64_t)a3 panoHeight:(unint64_t)a4
{
  if (self->_projectiveGrid)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, 125, a3 >> 6, a4 >> 6, 0);
    objc_msgSend_setUsage_(v8, v9, 3, v10);
    uint64_t v14 = objc_msgSend_device(self->_metal, v11, v12, v13);
    long long v17 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v14, v15, (uint64_t)v8, v16);
    projectiveGrid = self->_projectiveGrid;
    self->_projectiveGrid = v17;

    if (!self->_projectiveGrid) {
      goto LABEL_12;
    }
    uint64_t v7 = v8;
  }
  if (!self->_outputMask)
  {
    uint64_t v8 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, 10, a3 >> 1, a4 >> 1, 0);

    objc_msgSend_setUsage_(v8, v19, 3, v20);
    uint64_t v24 = objc_msgSend_device(self->_metal, v21, v22, v23);
    uint64_t v27 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v24, v25, (uint64_t)v8, v26);
    outputMask = self->_outputMask;
    self->_outputMask = v27;

    if (self->_outputMask) {
      goto LABEL_8;
    }
LABEL_12:
    int v33 = 2;
    goto LABEL_11;
  }
  uint64_t v8 = v7;
LABEL_8:
  int v29 = objc_msgSend_resetState(self, a2, a3, a4);
  if (!v29) {
    int v29 = objc_msgSend__bindOutput(self, v30, v31, v32);
  }
  int v33 = v29;
LABEL_11:

  return v33;
}

- (int)_bindOutput
{
  output = self->_output;
  if (!output) {
    return 2;
  }
  int v4 = 3;
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, a2, (uint64_t)output, 10, 3, 0);
  objc_super v5 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  outputBoundLuma = self->_outputBoundLuma;
  self->_outputBoundLuma = v5;

  if (self->_outputBoundLuma)
  {
    int v4 = 3;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v7, (uint64_t)self->_output, 30, 3, 1);
    uint64_t v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    outputBoundChroma = self->_outputBoundChroma;
    self->_outputBoundChroma = v8;

    if (self->_outputBoundChroma)
    {
      int v4 = 0;
      uint64_t v10 = MEMORY[0x263EF89A0];
      long long v11 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)self->_anon_110 = *MEMORY[0x263EF89A0];
      *(_OWORD *)&self->_anon_110[16] = v11;
      *(_OWORD *)&self->_anon_110[32] = *(_OWORD *)(v10 + 32);
      __asm { FMOV            V1.2D, #1.0 }
      self->_cropRect.origin = (CGPoint)xmmword_235A116F0;
      self->_cropRect.size = _Q1;
    }
  }
  return v4;
}

- (int)_addStagingBuffer
{
  if (objc_msgSend_count(self->_stagingBufferPool, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_lastObject(self->_stagingBufferPool, v5, v6, v7);
    objc_msgSend_removeLastObject(self->_stagingBufferPool, v9, v10, v11);
  }
  else
  {
    uint64_t v14 = [StagingBuffer alloc];
    uint64_t v8 = objc_msgSend_initWithContext_stagingWidth_stagingHeight_homography_atlasHomography_(v14, v15, (uint64_t)self->_metal, self->_stagingWidth, self->_stagingHeight, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
    if (!v8) {
      return 2;
    }
  }
  objc_msgSend_addObject_(self->_dirtyStagingBuffers, v12, (uint64_t)v8, v13);
  uint64_t v19 = objc_msgSend_commandQueue(self->_metal, v16, v17, v18);
  uint64_t v23 = objc_msgSend_commandBuffer(v19, v20, v21, v22);

  objc_msgSend_setLabel_(v23, v24, @"Panorama:AssemblyStage:_addStagingBuffer", v25);
  int v29 = objc_msgSend_computeCommandEncoder(v23, v26, v27, v28);
  objc_msgSend_clearStagingBuffer_withEncoder_(self, v30, (uint64_t)v8, (uint64_t)v29);
  objc_msgSend_endEncoding(v29, v31, v32, v33);
  objc_msgSend_commit(v23, v34, v35, v36);
  unint64_t sliceBufferLength = self->_sliceBufferLength;
  if (sliceBufferLength)
  {
    objc_msgSend_setHomographyToReference_(v8, v37, v38, v39, *((double *)self->_sliceHomographies + 6 * sliceBufferLength - 6), *((double *)self->_sliceHomographies + 6 * sliceBufferLength - 4), *((double *)self->_sliceHomographies + 6 * sliceBufferLength - 2));
    uint64_t v41 = (double *)((char *)self->_atlasHomographies + 48 * self->_sliceBufferLength);
    objc_msgSend_setAtlasHomography_(v8, v42, v43, v44, *(v41 - 6), *(v41 - 4), *(v41 - 2));
  }
  else
  {
    long long v50 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    long long v51 = *MEMORY[0x263EF89A0];
    long long v49 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
    objc_msgSend_setHomographyToReference_(v8, v37, v38, v39);
    objc_msgSend_setAtlasHomography_(v8, v45, v46, v47, *(double *)&v51, *(double *)&v50, *(double *)&v49);
  }

  return 0;
}

- (int)prepareToProcessSliceWidth:(unint64_t)a3 sliceHeight:(unint64_t)a4 stagingWidth:(unint64_t)a5 stagingHeight:(unint64_t)a6
{
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v35 = *MEMORY[0x263F04130];
  v36[0] = MEMORY[0x263EFFA78];
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v36, (uint64_t)&v35, 1);
  self->_sliceWidth = a3;
  self->_sliceHeight = a4;
  self->_stagingWidth = a5;
  self->_stagingHeight = a6;
  if (!objc_msgSend_count(self->_dirtyStagingBuffers, v12, v13, v14))
  {
    int v18 = objc_msgSend__addStagingBuffer(self, v15, v16, v17);
    if (v18) {
      goto LABEL_10;
    }
  }
  p_nrfOutputPixelBuffer = (uint64_t *)&self->_nrfOutputPixelBuffer;
  if (!self->_nrfOutputPixelBuffer)
  {
    CVPixelBufferCreate(0, a5, a6, 0x34323066u, (CFDictionaryRef)v11, &self->_nrfOutputPixelBuffer);
    if (!*p_nrfOutputPixelBuffer) {
      goto LABEL_12;
    }
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v20, *p_nrfOutputPixelBuffer, 10, 3, 0);
    uint64_t v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    nrfOutputLuma = self->_nrfOutputLuma;
    self->_nrfOutputLuma = v21;

    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v23, (uint64_t)self->_nrfOutputPixelBuffer, 30, 3, 1);
    uint64_t v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    nrfOutputChroma = self->_nrfOutputChroma;
    self->_nrfOutputChroma = v24;
  }
  p_nrfInputPixelBuffer = (uint64_t *)&self->_nrfInputPixelBuffer;
  if (!self->_nrfInputPixelBuffer)
  {
    CVPixelBufferCreate(0, a5, a6, 0x34323066u, (CFDictionaryRef)v11, &self->_nrfInputPixelBuffer);
    if (*p_nrfInputPixelBuffer)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v27, *p_nrfInputPixelBuffer, 10, 3, 0);
      uint64_t v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      nrfInputLuma = self->_nrfInputLuma;
      self->_nrfInputLuma = v28;

      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v30, (uint64_t)self->_nrfInputPixelBuffer, 30, 3, 1);
      uint64_t v31 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      nrfInputChroma = self->_nrfInputChroma;
      self->_nrfInputChroma = v31;

      self->_nrfInputSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      goto LABEL_9;
    }
LABEL_12:
    int v33 = 2;
    goto LABEL_11;
  }
LABEL_9:
  int v18 = objc_msgSend_resetState(self, v15, v16, v17);
LABEL_10:
  int v33 = v18;
LABEL_11:

  return v33;
}

- (int)addHomogToStaging:(float32x4_t)a3
{
  int v4 = (void **)result;
  objc_super v5 = (float32x4_t *)MEMORY[0x263EF89A0];
  int v6 = *(_DWORD *)(MEMORY[0x263EF89A0] + 12);
  int v7 = *(_DWORD *)(MEMORY[0x263EF89A0] + 28);
  int v8 = *(_DWORD *)(MEMORY[0x263EF89A0] + 44);
  uint64_t v9 = *((void *)result + 15);
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *((void *)result + 16);
    uint64_t v12 = v11 + 48 * v9;
    long long v13 = *(_OWORD *)(v12 - 32);
    long long v14 = *(_OWORD *)(v12 - 16);
    long long v55 = *(_OWORD *)(v12 - 48);
    long long v56 = v13;
    long long v57 = v14;
    float32x4_t v58 = 0u;
    float32x4_t v59 = 0u;
    float32x4_t v60 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v10) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v55 + v10))), a3, *(float32x2_t *)((char *)&v55 + v10), 1), a4, *(float32x4_t *)((char *)&v55 + v10), 2);
      v10 += 16;
    }
    while (v10 != 48);
    float32x4_t v16 = v58;
    float32x4_t v15 = v59;
    float32x4_t v17 = v60;
  }
  else
  {
    float32x4_t v15 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
    float32x4_t v17 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
    float32x4_t v16 = *(float32x4_t *)MEMORY[0x263EF89A0];
    uint64_t v11 = *((void *)result + 16);
  }
  float32x4_t v18 = *v5;
  float32x4_t v19 = v5[1];
  uint64_t v20 = v11 + 48 * v9;
  *(void *)uint64_t v20 = v16.i64[0];
  *(_DWORD *)(v20 + 8) = v16.i32[2];
  *(_DWORD *)(v20 + 12) = v6;
  *(void *)(v20 + 16) = v15.i64[0];
  *(_DWORD *)(v20 + 24) = v15.i32[2];
  *(_DWORD *)(v20 + 28) = v7;
  *(void *)(v20 + 32) = v17.i64[0];
  *(_DWORD *)(v20 + 40) = v17.i32[2];
  *(_DWORD *)(v20 + 44) = v8;
  unint64_t v21 = *((void *)result + 15);
  if (v21)
  {
    v22.i64[0] = 0x3F0000003F000000;
    v22.i64[1] = 0x3F0000003F000000;
    int32x4_t v23 = (int32x4_t)vaddq_f32(a4, vmlaq_f32(vmulq_f32(a2, v22), v22, a3));
    *(float32x2_t *)a3.f32 = vadd_f32(vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)vdup_laneq_s32(v23, 2)), (float32x2_t)0xBF000000BF000000);
    float32x4_t v24 = a3;
    v24.i32[2] = 1.0;
    if (*((unsigned char *)result + 80))
    {
      unint64_t v25 = result[21];
      float v26 = *((float *)result + 57);
      if (v21 <= v25)
      {
        *((float *)result + 57) = a3.f32[0] + v26;
        *(_DWORD *)(*((void *)result + 29) + 4 * ((v21 - 1) % v25)) = a3.i32[0];
        float v30 = *((float *)result + 57) / (float)v21;
      }
      else
      {
        uint64_t v27 = *((void *)result + 29);
        unint64_t v28 = (v21 - 1) % v25;
        float v29 = a3.f32[0] + (float)(v26 - *(float *)(v27 + 4 * v28));
        *((float *)result + 57) = v29;
        float v30 = v29 / (float)(int)v25;
        *(_DWORD *)(v27 + 4 * v28) = a3.i32[0];
      }
      unint64_t v33 = result[22];
      if (v21 == v33) {
        *((float *)result + 56) = v30;
      }
      if (v21 >= v33)
      {
        uint64_t v34 = 0;
        uint64_t v35 = *((void *)result + 17) + 48 * v21;
        long long v36 = *(_OWORD *)(v35 - 32);
        long long v37 = *(_OWORD *)(v35 - 16);
        long long v55 = *(_OWORD *)(v35 - 48);
        long long v56 = v36;
        long long v57 = v37;
        float32x4_t v58 = 0u;
        float32x4_t v59 = 0u;
        float32x4_t v60 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v58 + v34) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(long long *)((char *)&v55 + v34))), v19, *(float32x2_t *)((char *)&v55 + v34), 1), v24, *(float32x4_t *)((char *)&v55 + v34), 2);
          v34 += 16;
        }
        while (v34 != 48);
        float v38 = fabsf(v60.f32[0]);
        if (v38 > *((float *)result + 23) && v38 < *((float *)result + 24))
        {
          a3.f32[0] = a3.f32[0] - (float)(*((float *)result + 25) * v30);
          a3.i32[1] = v24.i32[1];
          a3.i32[2] = 1.0;
          float32x4_t v24 = a3;
        }
      }
    }
    uint64_t v39 = 0;
    uint64_t v32 = *((void *)result + 17);
    uint64_t v40 = v32 + 48 * v21;
    long long v41 = *(_OWORD *)(v40 - 32);
    long long v42 = *(_OWORD *)(v40 - 16);
    long long v55 = *(_OWORD *)(v40 - 48);
    long long v56 = v41;
    long long v57 = v42;
    float32x4_t v58 = 0u;
    float32x4_t v59 = 0u;
    float32x4_t v60 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v58 + v39) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(long long *)((char *)&v55 + v39))), v19, *(float32x2_t *)((char *)&v55 + v39), 1), v24, *(float32x4_t *)((char *)&v55 + v39), 2);
      v39 += 16;
    }
    while (v39 != 48);
    float32x4_t v18 = v58;
    float32x4_t v19 = v59;
    float32x4_t v31 = v60;
  }
  else
  {
    float32x4_t v31 = v5[2];
    uint64_t v32 = *((void *)result + 17);
  }
  uint64_t v43 = (float32x4_t *)(v32 + 48 * v21);
  *uint64_t v43 = v18;
  v43[1] = v19;
  v43[2] = v31;
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v49 = vadd_f32(*(float32x2_t *)v31.f32, _D1);
  float64x2_t v50 = *((float64x2_t *)result + 23);
  float32x2_t v51 = vcvt_f32_f64(vminnmq_f64(vcvtq_f64_f32(*(float32x2_t *)v31.f32), v50));
  float32x2_t v52 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(v49), vaddq_f64(v50, *((float64x2_t *)result + 24))));
  *((double *)result + 46) = v51.f32[0];
  *((double *)result + 47) = v51.f32[1];
  *((float64x2_t *)result + 24) = vcvtq_f64_f32(vsub_f32(v52, v51));
  uint64_t v53 = *((void *)result + 14);
  uint64_t v54 = *((void *)result + 15) + 1;
  *((void *)result + 15) = v54;
  if (v54 == v53)
  {
    *((void *)result + 14) = 2 * v54;
    *((void *)result + 16) = malloc_type_realloc(*((void **)result + 16), 96 * v54, 0x1000040EED21634uLL);
    result = (int *)malloc_type_realloc(v4[17], 48 * (void)v4[14], 0x1000040EED21634uLL);
    v4[17] = result;
  }
  return result;
}

- (__n128)panoHomography
{
  long long v10 = *MEMORY[0x263EF89A0];
  float v9 = (float)(unint64_t)objc_msgSend_width(*(void **)(a1 + 240), a2, a3, a4)
     / (float)*(unint64_t *)(a1 + 24);
  objc_msgSend_height(*(void **)(a1 + 240), v5, v6, v7);
  result.n128_f32[0] = v9;
  *(unint64_t *)((char *)result.n128_u64 + 4) = *(void *)((char *)&v10 + 4);
  return result;
}

- (uint64_t)addSliceToProjectiveGrid:(__n128)a3 atlasHomography:(__n128)a4 panoHomography:(__n128)a5 encoder:(__n128)a6 sliceType:(__n128)a7
{
  v56[0] = a2;
  v56[1] = a3;
  v56[2] = a4;
  v55[0] = a5;
  v55[1] = a6;
  v55[2] = a7;
  v54[0] = a15;
  v54[1] = a16;
  v54[2] = a17;
  float32x4_t v19 = *(void **)(a1 + 16);
  id v20 = a9;
  float32x4_t v24 = objc_msgSend_addSliceToProjectiveGrid(v19, v21, v22, v23);
  getThreadgroupSizeForShader(v24, (unint64_t *)&v52);

  int v50 = *(_DWORD *)(a1 + 40);
  int v51 = a10;
  unint64_t v28 = objc_msgSend_addSliceToProjectiveGrid(*(void **)(a1 + 16), v25, v26, v27);
  objc_msgSend_setComputePipelineState_(v20, v29, (uint64_t)v28, v30);

  objc_msgSend_setTexture_atIndex_(v20, v31, *(void *)(a1 + 144), 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v32, (uint64_t)v56, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v33, (uint64_t)v55, 48, 1);
  objc_msgSend_setBytes_length_atIndex_(v20, v34, (uint64_t)v54, 48, 2);
  objc_msgSend_setBytes_length_atIndex_(v20, v35, (uint64_t)&v51, 4, 3);
  objc_msgSend_setBytes_length_atIndex_(v20, v36, (uint64_t)&v50, 4, 4);
  uint64_t v40 = objc_msgSend_width(*(void **)(a1 + 144), v37, v38, v39);
  uint64_t v44 = objc_msgSend_height(*(void **)(a1 + 144), v41, v42, v43);
  v49[0] = v40;
  v49[1] = v44;
  v49[2] = 1;
  long long v47 = v52;
  uint64_t v48 = v53;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v20, v45, (uint64_t)v49, (uint64_t)&v47);

  return 0;
}

- (__n64)_stagingHomography
{
  result.n64_f32[0] = (float)*(unint64_t *)(a1 + 48) / (float)*(unint64_t *)(a1 + 24);
  __asm { FMOV            V1.4S, #1.0 }
  result.n64_u32[1] = HIDWORD(*MEMORY[0x263EF89A0]);
  return result;
}

- (uint64_t)addSliceToStagingBuffer:(float32x4_t)a3 sliceLuma:(float32x4_t)a4 sliceChroma:(uint64_t)a5 sliceMask:(void *)a6 sliceGlobalHomography:(void *)a7 encoder:(void *)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  objc_msgSend_homographyToReference(v15, v20, v21, v22);
  simd_float3x3 v104 = __invert_f3(v103);
  uint64_t v26 = 0;
  simd_float3x3 v99 = v104;
  simd_float3 v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v100 + v26 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)&v99.columns[v26])), a3, *(float32x2_t *)v99.columns[v26].f32, 1), a4, (float32x4_t)v99.columns[v26], 2);
    ++v26;
  }
  while (v26 != 3);
  float32x4_t v97 = 0u;
  float32x4_t v98 = 0u;
  float32x4_t v96 = 0u;
  v96.i32[2] = v100.i32[2];
  v97.i32[2] = DWORD2(v101);
  v96.i64[0] = v100.i64[0];
  v97.i64[0] = v101;
  v98.i32[2] = DWORD2(v102);
  v98.i64[0] = v102;
  objc_msgSend__stagingHomography(a1, v23, v24, v25);
  uint64_t v30 = 0;
  float32x4_t v31 = v96;
  float32x4_t v32 = v97;
  float32x4_t v33 = v98;
  v99.columns[0] = v34;
  v99.columns[1] = v35;
  v99.columns[2] = v36;
  simd_float3 v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v100 + v30 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(_OWORD *)&v99.columns[v30])), v32, *(float32x2_t *)v99.columns[v30].f32, 1), v33, (float32x4_t)v99.columns[v30], 2);
    ++v30;
  }
  while (v30 != 3);
  v96.i32[2] = v100.i32[2];
  v97.i32[2] = DWORD2(v101);
  v96.i64[0] = v100.i64[0];
  v97.i64[0] = v101;
  v98.i32[2] = DWORD2(v102);
  v98.i64[0] = v102;
  int v95 = objc_msgSend_dirty(v15, v27, v28, v29);
  int v94 = objc_msgSend_assemblyMode(a1, v37, v38, v39);
  uint64_t v43 = objc_msgSend_addSliceToStaging(a1[2], v40, v41, v42);
  getThreadgroupSizeForShader(v43, (unint64_t *)&v100);

  long long v47 = objc_msgSend_addSliceToStaging(a1[2], v44, v45, v46);
  objc_msgSend_setComputePipelineState_(v19, v48, (uint64_t)v47, v49);

  objc_msgSend_setTexture_atIndex_(v19, v50, (uint64_t)v16, 0);
  objc_msgSend_setTexture_atIndex_(v19, v51, (uint64_t)v17, 1);
  objc_msgSend_setTexture_atIndex_(v19, v52, (uint64_t)v18, 2);
  long long v56 = objc_msgSend_luma(v15, v53, v54, v55);
  objc_msgSend_setTexture_atIndex_(v19, v57, (uint64_t)v56, 3);

  long long v61 = objc_msgSend_chroma(v15, v58, v59, v60);
  objc_msgSend_setTexture_atIndex_(v19, v62, (uint64_t)v61, 4);

  uint64_t v66 = objc_msgSend_weights(v15, v63, v64, v65);
  objc_msgSend_setTexture_atIndex_(v19, v67, (uint64_t)v66, 5);

  objc_msgSend_setBytes_length_atIndex_(v19, v68, (uint64_t)&v96, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v19, v69, (uint64_t)&v94, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v19, v70, (uint64_t)&v95, 4, 2);
  v74 = objc_msgSend_chroma(v15, v71, v72, v73);
  uint64_t v78 = objc_msgSend_width(v74, v75, v76, v77);
  uint64_t v82 = objc_msgSend_chroma(v15, v79, v80, v81);
  v93[0] = v78;
  v93[1] = objc_msgSend_height(v82, v83, v84, v85);
  v93[2] = 1;
  v99.columns[0] = v100;
  v99.columns[1].i64[0] = v101;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v19, v86, (uint64_t)v93, (uint64_t)&v99);

  objc_msgSend_setDirty_(v15, v87, 1, v88);
  return 0;
}

- (uint64_t)addSlice:(double)a3 metadata:(double)a4 sliceHomography:(double)a5 stitchingMask:(double)a6 motionCue:(double)a7 roi:(double)a8 sliceType:(uint64_t)a9
{
  id v21 = a11;
  id v154 = a12;
  size_t Width = CVPixelBufferGetWidth(a10);
  size_t Height = CVPixelBufferGetHeight(a10);
  uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v21, v24, @"SliceNumber", v25);
  int v30 = objc_msgSend_intValue(v26, v27, v28, v29);

  float32x4_t v31 = (void **)(a1 + 160);
  if (!objc_msgSend_count(*(void **)(a1 + 160), v32, v33, v34))
  {
    uint64_t v38 = objc_msgSend_width(*(void **)(a1 + 240), v35, v36, v37);
    uint64_t v40 = objc_msgSend_prepareToProcessSliceWidth_sliceHeight_stagingWidth_stagingHeight_((void *)a1, v39, Width, Height, v38, Height);
    if (v40)
    {
      uint64_t v130 = v40;
      long long v140 = 0;
      uint64_t v120 = 0;
      long long v52 = 0;
      uint64_t v128 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
      v144 = 0;
      goto LABEL_25;
    }
  }
  objc_msgSend_addHomogToStaging_((void *)a1, v35, v36, v37, a2, a3, a4);
  objc_msgSend_panoHomography((void *)a1, v41, v42, v43);
  long long v162 = v44;
  long long v158 = v46;
  long long v160 = v45;
  uint64_t v47 = 48 * *(void *)(a1 + 120) - 48;
  uint64_t v48 = (simd_float3x3 *)(*(void *)(a1 + 128) + v47);
  simd_float3x3 v170 = *v48;
  double v148 = *(double *)v170.columns[1].i64;
  simd_float3 v149 = v48->columns[0];
  double v147 = *(double *)v170.columns[2].i64;
  simd_float3x3 v171 = __invert_f3(*v48);
  double v156 = *(double *)v171.columns[1].i64;
  double v157 = *(double *)v171.columns[0].i64;
  double v155 = *(double *)v171.columns[2].i64;
  uint64_t v49 = (long long *)(*(void *)(a1 + 136) + v47);
  long long v167 = v49[1];
  long long v169 = *v49;
  long long v165 = v49[2];
  long long v52 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v50, (uint64_t)a10, 10, 1, 0);
  if (!v52
    || (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v51, (uint64_t)a10, 30, 1, 1), (uint64_t v153 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v140 = 0;
    uint64_t v120 = 0;
    uint64_t v128 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    v144 = 0;
    uint64_t v130 = 3;
LABEL_25:
    uint64_t v127 = v154;
    goto LABEL_22;
  }
  long long v56 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v53, v54, v55);
  uint64_t v60 = objc_msgSend_commandBuffer(v56, v57, v58, v59);

  objc_msgSend_setLabel_(v60, v61, @"Panorama:AssemblyStage:addSlice", v62);
  uint64_t v152 = v60;
  v151 = objc_msgSend_computeCommandEncoder(v60, v63, v64, v65);
  uint64_t v66 = objc_opt_new();
  uint64_t v67 = objc_opt_new();
  if (objc_msgSend_count(*(void **)(a1 + 160), v68, v69, v70))
  {
    uint64_t v73 = 0;
    float v74 = 0.0;
    while (1)
    {
      v75 = objc_msgSend_objectAtIndexedSubscript_(*v31, v71, v73, v72);
      objc_msgSend_overlapWithAtlasHomography_roi_(v75, v76, v77, v78, *(double *)&v169, *(double *)&v167, *(double *)&v165, a5, a6, a7, a8);
      float v82 = v81;
      if (v81 <= 0.25)
      {
        uint64_t v87 = objc_msgSend_addStagingToOutput_((void *)a1, v79, (uint64_t)v75, v80);
        if (v87)
        {
          uint64_t v130 = v87;

          v144 = 0;
          uint64_t v128 = (void *)v153;
          uint64_t v127 = v154;
          uint64_t v120 = v151;
          long long v140 = v152;
          goto LABEL_22;
        }
        objc_msgSend_addObject_(*(void **)(a1 + 152), v88, (uint64_t)v75, v89);
        double HostTime = getHostTime();
        panoLog(32, "FrameID:%04d time %.3f: assembly commits staging buffer %zu to output\n", v30, HostTime, v73);
      }
      else
      {
        objc_msgSend_addObject_(v66, v79, (uint64_t)v75, v80);
      }
      float v74 = fmaxf(v82, v74);
      *(float *)&double v86 = v82;
      uint64_t v91 = objc_msgSend_numberWithFloat_(NSNumber, v83, v84, v85, v86);
      objc_msgSend_addObject_(v67, v92, (uint64_t)v91, v93);

      if (++v73 >= (unint64_t)objc_msgSend_count(*v31, v94, v95, v96)) {
        goto LABEL_14;
      }
    }
  }
  float v74 = 0.0;
LABEL_14:
  long long v97 = v162;
  HIDWORD(v97) = 0;
  long long v163 = v97;
  long long v98 = v160;
  HIDWORD(v98) = 0;
  long long v161 = v98;
  long long v99 = v158;
  HIDWORD(v99) = 0;
  long long v159 = v99;
  objc_storeStrong((id *)(a1 + 160), v66);
  simd_float3x3 v103 = objc_msgSend_description(v67, v100, v101, v102);
  uint64_t v105 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v103, v104, @"\n", @", ");

  double v106 = getHostTime();
  id v146 = v105;
  uint64_t v110 = (const char *)objc_msgSend_UTF8String(v146, v107, v108, v109);
  uint64_t v114 = objc_msgSend_count(*v31, v111, v112, v113);
  panoLog(32, "FrameID:%04d time %.3f: assembly overlaps %s maxOverlap %f _dirtyStagingBuffers.count %lu isLastSlice %d\n", v30, v106, v110, v74, v114, a14 == 2);
  if (v74 <= 0.85 || (uint64_t v118 = objc_msgSend_count(*v31, v115, v116, v117), a14 == 2) || !v118)
  {
    objc_msgSend__addStagingBuffer((void *)a1, v115, v116, v117);
    double v119 = getHostTime();
    panoLog(32, "FrameID:%04d time %.3f: assembly new staging buffer added\n", v30, v119);
  }
  uint64_t v120 = v151;
  uint64_t v121 = objc_msgSend_addSliceToProjectiveGrid_atlasHomography_panoHomography_encoder_sliceType_((void *)a1, v115, (uint64_t)v151, a14, v157, v156, v155, *(double *)&v169, *(double *)&v167, *(double *)&v165, v163, v161, v159);
  if (v121)
  {
    uint64_t v130 = v121;
    uint64_t v128 = (void *)v153;
    uint64_t v127 = v154;
    goto LABEL_27;
  }
  v125 = objc_msgSend_lastObject(*(void **)(a1 + 160), v122, v123, v124);
  uint64_t v126 = (void *)a1;
  uint64_t v128 = (void *)v153;
  uint64_t v127 = v154;
  uint64_t v130 = objc_msgSend_addSliceToStagingBuffer_sliceLuma_sliceChroma_sliceMask_sliceGlobalHomography_encoder_(v126, v129, (uint64_t)v125, (uint64_t)v52, v153, v154, v151, *(double *)v149.i64, v148, v147);

  if (v130)
  {
LABEL_27:
    long long v140 = v152;
    goto LABEL_21;
  }
  uint64_t v134 = objc_msgSend_lastObject(*v31, v131, v132, v133);
  objc_msgSend_setMetadata_(v134, v135, (uint64_t)v21, v136);

  objc_msgSend_endEncoding(v151, v137, v138, v139);
  long long v140 = v152;
  objc_msgSend_commit(v152, v141, v142, v143);
LABEL_21:
  v144 = v146;
LABEL_22:

  return v130;
}

- (int)addStagingToOutput:(id)a3
{
  id v4 = a3;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v185 = 0u;
  objc_msgSend_homographyToReference(v4, v5, v6, v7);
  DWORD2(v185) = v8;
  DWORD2(v186) = v9;
  *(void *)&long long v185 = v10;
  *(void *)&long long v186 = v11;
  DWORD2(v187) = v12;
  *(void *)&long long v187 = v13;
  uint64_t v184 = 0;
  id v17 = objc_msgSend_commandQueue(self->_metal, v14, v15, v16);
  id v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

  objc_msgSend_setLabel_(v21, v22, @"Panorama:AssemblyStage:prepareForDenoising", v23);
  uint64_t v27 = objc_msgSend_computeCommandEncoder(v21, v24, v25, v26);
  float32x4_t v31 = objc_msgSend_prepareForDenoising(self->_shaders, v28, v29, v30);
  getThreadgroupSizeForShader(v31, (unint64_t *)&v182);

  simd_float3 v35 = objc_msgSend_prepareForDenoising(self->_shaders, v32, v33, v34);
  objc_msgSend_setComputePipelineState_(v27, v36, (uint64_t)v35, v37);

  uint64_t v41 = objc_msgSend_luma(v4, v38, v39, v40);
  objc_msgSend_setTexture_atIndex_(v27, v42, (uint64_t)v41, 0);

  long long v46 = objc_msgSend_chroma(v4, v43, v44, v45);
  objc_msgSend_setTexture_atIndex_(v27, v47, (uint64_t)v46, 1);

  objc_msgSend_setTexture_atIndex_(v27, v48, (uint64_t)self->_nrfInputLuma, 2);
  objc_msgSend_setTexture_atIndex_(v27, v49, (uint64_t)self->_nrfInputChroma, 3);
  uint64_t v53 = objc_msgSend_weights(v4, v50, v51, v52);
  objc_msgSend_setTexture_atIndex_(v27, v54, (uint64_t)v53, 4);

  uint64_t v58 = objc_msgSend_width(self->_nrfInputChroma, v55, v56, v57);
  uint64_t v62 = objc_msgSend_height(self->_nrfInputChroma, v59, v60, v61);
  v181[0] = v58;
  v181[1] = v62;
  v181[2] = 1;
  long long v189 = v182;
  *(void *)&long long v190 = v183;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v27, v63, (uint64_t)v181, (uint64_t)&v189);
  objc_msgSend_endEncoding(v27, v64, v65, v66);
  objc_msgSend_commit(v21, v67, v68, v69);
  objc_msgSend_waitUntilCompleted(v21, v70, v71, v72);
  nrfInputSampleBuffer = self->_nrfInputSampleBuffer;
  uint64_t v77 = objc_msgSend_metadata(v4, v74, v75, v76);
  float v81 = objc_msgSend_copy(v77, v78, v79, v80);
  CMSetAttachment(nrfInputSampleBuffer, @"MetadataDictionary", v81, 0);

  NSClassFromString(&cfstr_Nrfpreparedesc.isa);
  float v82 = objc_opt_new();
  objc_msgSend_setWidth_(v82, v83, LODWORD(self->_stagingWidth), v84);
  objc_msgSend_setHeight_(v82, v85, LODWORD(self->_stagingHeight), v86);
  objc_msgSend_setPixelFormat_(v82, v87, 875704422, v88);
  objc_msgSend_prepareToProcess_prepareDescriptor_(self->_nrfProcessor, v89, 8 * self->_assemblyParams.useNRFTypePano, (uint64_t)v82);
  NSClassFromString(&cfstr_Nrfubfusionout.isa);
  uint64_t v90 = objc_opt_new();
  objc_msgSend_setPixelBuffer_(v90, v91, (uint64_t)self->_nrfOutputPixelBuffer, v92);
  uint64_t v93 = objc_opt_new();
  objc_msgSend_setMetadata_(v90, v94, (uint64_t)v93, v95);

  objc_msgSend_setOutput_(self->_nrfProcessor, v96, (uint64_t)v90, v97);
  objc_msgSend_addFrame_(self->_nrfProcessor, v98, (uint64_t)self->_nrfInputSampleBuffer, v99);
  objc_msgSend_process(self->_nrfProcessor, v100, v101, v102);
  objc_msgSend_finishScheduling(self->_nrfProcessor, v103, v104, v105);
  objc_msgSend_resetState(self->_nrfProcessor, v106, v107, v108);
  objc_msgSend__stagingHomography(self, v109, v110, v111);
  simd_float3x3 v193 = __invert_f3(v192);
  uint64_t v115 = 0;
  v188[0] = v185;
  v188[1] = v186;
  v188[2] = v187;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  do
  {
    *(long long *)((char *)&v189 + v115 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v193.columns[0], COERCE_FLOAT(v188[v115])), (float32x4_t)v193.columns[1], *(float32x2_t *)&v188[v115], 1), (float32x4_t)v193.columns[2], (float32x4_t)v188[v115], 2);
    ++v115;
  }
  while (v115 != 3);
  DWORD2(v185) = DWORD2(v189);
  DWORD2(v186) = DWORD2(v190);
  *(void *)&long long v185 = v189;
  *(void *)&long long v186 = v190;
  DWORD2(v187) = DWORD2(v191);
  *(void *)&long long v187 = v191;
  uint64_t v116 = objc_msgSend_commandQueue(self->_metal, v112, v113, v114);
  uint64_t v120 = objc_msgSend_commandBuffer(v116, v117, v118, v119);

  objc_msgSend_setLabel_(v120, v121, @"Panorama:AssemblyStage:addStagingToOutput", v122);
  uint64_t v126 = objc_msgSend_computeCommandEncoder(v120, v123, v124, v125);

  objc_msgSend_atlasHomography(v4, v127, v128, v129);
  uint64_t v184 = v130;
  *((float *)&v184 + 1) = *((float *)&v130 + 1)
                        / (float)((float)(unint64_t)objc_msgSend_height(self->_outputBoundLuma, v131, v132, v133)
                                / (float)self->_sliceHeight);
  float v137 = (float)(unint64_t)objc_msgSend_width(self->_outputBoundLuma, v134, v135, v136);
  shaders = self->_shaders;
  *(float *)&uint64_t v184 = *(float *)&v184 / (float)(v137 / (float)self->_sliceWidth);
  uint64_t v142 = objc_msgSend_addStagingToOutput(shaders, v139, v140, v141);
  getThreadgroupSizeForShader(v142, (unint64_t *)&v189);
  long long v182 = v189;
  uint64_t v183 = v190;

  id v146 = objc_msgSend_addStagingToOutput(self->_shaders, v143, v144, v145);
  objc_msgSend_setComputePipelineState_(v126, v147, (uint64_t)v146, v148);

  objc_msgSend_setTexture_atIndex_(v126, v149, (uint64_t)self->_nrfOutputLuma, 0);
  objc_msgSend_setTexture_atIndex_(v126, v150, (uint64_t)self->_nrfOutputChroma, 1);
  id v154 = objc_msgSend_weights(v4, v151, v152, v153);
  objc_msgSend_setTexture_atIndex_(v126, v155, (uint64_t)v154, 2);

  objc_msgSend_setTexture_atIndex_(v126, v156, (uint64_t)self->_projectiveGrid, 3);
  objc_msgSend_setBytes_length_atIndex_(v126, v157, (uint64_t)&v185, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v126, v158, (uint64_t)self->_anon_110, 48, 1);
  objc_msgSend_setBytes_length_atIndex_(v126, v159, (uint64_t)&v184, 8, 2);
  objc_msgSend_setBytes_length_atIndex_(v126, v160, (uint64_t)&self->_direction, 8, 3);
  objc_msgSend_setTexture_atIndex_(v126, v161, (uint64_t)self->_outputBoundLuma, 4);
  objc_msgSend_setTexture_atIndex_(v126, v162, (uint64_t)self->_outputBoundChroma, 5);
  objc_msgSend_setTexture_atIndex_(v126, v163, (uint64_t)self->_outputMask, 6);
  uint64_t v167 = objc_msgSend_width(self->_outputBoundChroma, v164, v165, v166);
  uint64_t v171 = objc_msgSend_height(self->_outputBoundChroma, v168, v169, v170);
  v180[0] = v167;
  v180[1] = v171;
  v180[2] = 1;
  long long v189 = v182;
  *(void *)&long long v190 = v183;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v126, v172, (uint64_t)v180, (uint64_t)&v189);
  objc_msgSend_endEncoding(v126, v173, v174, v175);
  objc_msgSend_commit(v120, v176, v177, v178);

  return 0;
}

- (int)renderDirtyStagingBuffers
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = self->_dirtyStagingBuffers;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        int v12 = objc_msgSend_addStagingToOutput_(self, v6, v11, v7, (void)v22);
        if (v12)
        {
          int v20 = v12;

          return v20;
        }
        objc_msgSend_addObject_(self->_stagingBufferPool, v13, v11, v14);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = (NSMutableArray *)objc_opt_new();
  dirtyStagingBuffers = self->_dirtyStagingBuffers;
  self->_dirtyStagingBuffers = v15;

  objc_msgSend_removeAllObjects(self->_stagingBufferPool, v17, v18, v19);
  return 0;
}

- (int)getMaskAsBuffer:(char *)a3 widthOut:(unint64_t *)a4 heightOut:(unint64_t *)a5
{
  uint64_t v9 = objc_msgSend_width(self->_outputMask, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v13 = objc_msgSend_height(self->_outputMask, v10, v11, v12);
  uint64_t v14 = (char *)malloc_type_calloc(v13 * v9, 1uLL, 0x100004077774924uLL);
  if (!v14) {
    return 2;
  }
  uint64_t v18 = v14;
  objc_msgSend_waitForIdle(self->_metal, v15, v16, v17);
  outputMask = self->_outputMask;
  uint64_t v23 = objc_msgSend_width(outputMask, v20, v21, v22);
  uint64_t v27 = objc_msgSend_width(self->_outputMask, v24, v25, v26);
  uint64_t v31 = objc_msgSend_height(self->_outputMask, v28, v29, v30) * v27;
  uint64_t v35 = objc_msgSend_width(self->_outputMask, v32, v33, v34);
  uint64_t v39 = objc_msgSend_height(self->_outputMask, v36, v37, v38);
  memset(v49, 0, 24);
  void v49[3] = v35;
  v49[4] = v39;
  v49[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_(outputMask, v40, (uint64_t)v18, v23, v31, v49, 0, 0);
  *a3 = v18;
  *a4 = objc_msgSend_width(self->_outputMask, v41, v42, v43);
  unint64_t v47 = objc_msgSend_height(self->_outputMask, v44, v45, v46);
  int result = 0;
  *a5 = v47;
  return result;
}

- (int)setDirection:(int)a3
{
  self->_direction = a3;
  return a3;
}

- (int)finishProcessing
{
  return ((uint64_t (*)(PanoramaAssemblyStage *, char *))MEMORY[0x270F9A6D0])(self, sel_renderDirtyStagingBuffers);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (__CVBuffer)output
{
  return self->_output;
}

- (void)setOutput:(__CVBuffer *)a3
{
  self->_output = a3;
}

- (int)assemblyMode
{
  return self->_assemblyMode;
}

- (void)setAssemblyMode:(int)a3
{
  self->_assemblyMode = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (NRFProcessor)nrfProcessor
{
  return self->_nrfProcessor;
}

- (void)setNrfProcessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrfProcessor, 0);
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_outputMask, 0);
  objc_storeStrong((id *)&self->_outputBoundChroma, 0);
  objc_storeStrong((id *)&self->_outputBoundLuma, 0);
  objc_storeStrong((id *)&self->_nrfOutputChroma, 0);
  objc_storeStrong((id *)&self->_nrfOutputLuma, 0);
  objc_storeStrong((id *)&self->_nrfInputChroma, 0);
  objc_storeStrong((id *)&self->_nrfInputLuma, 0);
  objc_storeStrong((id *)&self->_dirtyStagingBuffers, 0);
  objc_storeStrong((id *)&self->_stagingBufferPool, 0);
  objc_storeStrong((id *)&self->_projectiveGrid, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end