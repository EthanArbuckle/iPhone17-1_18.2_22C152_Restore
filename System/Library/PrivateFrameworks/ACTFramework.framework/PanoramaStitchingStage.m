@interface PanoramaStitchingStage
- (BOOL)isReadyToProcess;
- (CGRect)roi;
- (MTLCommandQueue)metalCommandQueue;
- (MTLTexture)motionMask;
- (MTLTexture)stitchingMask;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (PanoramaStitchingStage)initWithContext:(id)a3;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcessSliceWidth:(unint64_t)a3 sliceHeight:(unint64_t)a4;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setDirection:(int)a3;
- (int)setup;
- (int)stitchingMode;
- (uint64_t)_centralStitchAddSlice:(uint64_t)a3 sliceHomography:(uint64_t)a4 sliceType:(int)a5;
- (uint64_t)_seamStitchAddSlice:(uint64_t)a3 sliceHomography:(int)a4 sliceType:(__n128)a5;
- (uint64_t)addSlice:(uint64_t)a3 sliceHomography:(uint64_t)a4 sliceType:;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setIsReadyToProcess:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setMotionMask:(id)a3;
- (void)setStitchingMode:(int)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation PanoramaStitchingStage

- (PanoramaStitchingStage)initWithContext:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PanoramaStitchingStage;
  v6 = [(PanoramaStitchingStage *)&v15 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [PanoramaStitchingShaders alloc],
        uint64_t v11 = objc_msgSend_initWithContext_(v8, v9, (uint64_t)v5, v10),
        shaders = v7->_shaders,
        v7->_shaders = (PanoramaStitchingShaders *)v11,
        shaders,
        v7->_shaders))
  {
    v7->_direction = 1;
    v7->_isReadyToProcess = 0;
    v13 = v7;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (uint64_t)_centralStitchAddSlice:(uint64_t)a3 sliceHomography:(uint64_t)a4 sliceType:(int)a5
{
  int v65 = *(_DWORD *)(a1 + 80);
  int v66 = a5;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v62 = 0u;
  simd_float3x3 v67 = __invert_f3(a2);
  DWORD2(v62) = v67.columns[0].i32[2];
  DWORD2(v63) = v67.columns[1].i32[2];
  *(void *)&long long v62 = v67.columns[0].i64[0];
  *(void *)&long long v63 = v67.columns[1].i64[0];
  DWORD2(v64) = v67.columns[2].i32[2];
  *(void *)&long long v64 = v67.columns[2].i64[0];
  uint64_t v10 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v7, v8, v9);
  v14 = objc_msgSend_commandBuffer(v10, v11, v12, v13);

  objc_msgSend_setLabel_(v14, v15, @"Panorama:StitchingStage:_centralStitchAddSlice", v16);
  v20 = objc_msgSend_computeCommandEncoder(v14, v17, v18, v19);
  v24 = objc_msgSend_computeCentralStitchingMask(*(void **)(a1 + 16), v21, v22, v23);
  getThreadgroupSizeForShader(v24, (unint64_t *)&v60);

  v28 = objc_msgSend_computeCentralStitchingMask(*(void **)(a1 + 16), v25, v26, v27);
  objc_msgSend_setComputePipelineState_(v20, v29, (uint64_t)v28, v30);

  objc_msgSend_setTexture_atIndex_(v20, v31, *(void *)(a1 + 120), 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v32, (uint64_t)&v66, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v33, (uint64_t)&v65, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v20, v34, (uint64_t)&v62, 48, 2);
  uint64_t v38 = objc_msgSend_width(*(void **)(a1 + 120), v35, v36, v37);
  uint64_t v42 = objc_msgSend_height(*(void **)(a1 + 120), v39, v40, v41);
  v59[0] = v38;
  v59[1] = v42;
  v59[2] = 1;
  long long v57 = v60;
  uint64_t v58 = v61;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v20, v43, (uint64_t)v59, (uint64_t)&v57);
  objc_msgSend_endEncoding(v20, v44, v45, v46);
  objc_msgSend_commit(v14, v47, v48, v49);
  switch(a5)
  {
    case 0:
      if (*(_DWORD *)(a1 + 80) != 1) {
        goto LABEL_6;
      }
      break;
    case 1:
      uint64_t v50 = 0x3FDF5C28F5C28F5CLL;
      goto LABEL_7;
    case 2:
      if (*(_DWORD *)(a1 + 80) == 2)
      {
LABEL_6:
        uint64_t v50 = 0x3FE0000000000000;
LABEL_7:
        *(void *)(a1 + 136) = v50;
      }
      break;
    case 3:
      *(void *)(a1 + 136) = 0;
      *(void *)(a1 + 144) = 0;
      break;
    default:
      break;
  }
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a1 + 152) = _Q0;

  return 0;
}

- (uint64_t)_seamStitchAddSlice:(uint64_t)a3 sliceHomography:(int)a4 sliceType:(__n128)a5
{
  *(__n128 *)&v181[16] = a6;
  *(__n128 *)&v181[32] = a7;
  *(__n128 *)v181 = a5;
  int v201 = *(_DWORD *)(a1 + 80);
  long long v199 = 0uLL;
  uint64_t v200 = 0;
  uint64_t v10 = 3;
  uint64_t v12 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), a2, a3, 10, 3, 0);
  if (v12)
  {
    uint64_t v10 = 3;
    uint64_t v16 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v11, a3, 30, 3, 1);
    if (v16)
    {
      v17 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v13, v14, v15);
      v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

      objc_msgSend_setLabel_(v21, v22, @"Panorama:StitchingStage:_seamStitchAddSlice", v23);
      uint64_t v30 = objc_msgSend_computeCommandEncoder(v21, v24, v25, v26);
      if (a4 == 1)
      {
        long long v196 = 0u;
        long long v197 = 0u;
        long long v195 = 0u;
        simd_float3x3 v202 = __invert_f3(*(simd_float3x3 *)v181);
        DWORD2(v195) = v202.columns[0].i32[2];
        DWORD2(v196) = v202.columns[1].i32[2];
        *(void *)&long long v195 = v202.columns[0].i64[0];
        *(void *)&long long v196 = v202.columns[1].i64[0];
        DWORD2(v197) = v202.columns[2].i32[2];
        *(void *)&long long v197 = v202.columns[2].i64[0];
        v56 = objc_msgSend_computeSeamCost(*(void **)(a1 + 16), v53, v54, v55);
        getThreadgroupSizeForShader(v56, (unint64_t *)&v199);

        long long v60 = objc_msgSend_computeSeamCost(*(void **)(a1 + 16), v57, v58, v59);
        objc_msgSend_setComputePipelineState_(v30, v61, (uint64_t)v60, v62);

        objc_msgSend_setTexture_atIndex_(v30, v63, *(void *)(a1 + 24), 0);
        objc_msgSend_setTexture_atIndex_(v30, v64, *(void *)(a1 + 32), 1);
        objc_msgSend_setTexture_atIndex_(v30, v65, (uint64_t)v12, 2);
        objc_msgSend_setTexture_atIndex_(v30, v66, (uint64_t)v16, 3);
        objc_msgSend_setTexture_atIndex_(v30, v67, *(void *)(a1 + 72), 4);
        objc_msgSend_setTexture_atIndex_(v30, v68, *(void *)(a1 + 128), 5);
        objc_msgSend_setBytes_length_atIndex_(v30, v69, (uint64_t)&v195, 48, 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v70, (uint64_t)&v201, 4, 1);
        v194[0] = objc_msgSend_width(v16, v71, v72, v73);
        v194[1] = objc_msgSend_height(v16, v74, v75, v76);
        v194[2] = 1;
        long long v192 = v199;
        uint64_t v193 = v200;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v77, (uint64_t)v194, (uint64_t)&v192);
        v81 = objc_msgSend_seamCutDescend(*(void **)(a1 + 16), v78, v79, v80);
        objc_msgSend_setComputePipelineState_(v30, v82, (uint64_t)v81, v83);

        objc_msgSend_setTexture_atIndex_(v30, v84, *(void *)(a1 + 72), 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v85, (uint64_t)&v201, 4, 0);
        long long v190 = xmmword_235A116B0;
        uint64_t v191 = 1;
        long long v188 = xmmword_235A116B0;
        uint64_t v189 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v86, (uint64_t)&v190, (uint64_t)&v188);
        v90 = objc_msgSend_seamCutAscend(*(void **)(a1 + 16), v87, v88, v89);
        objc_msgSend_setComputePipelineState_(v30, v91, (uint64_t)v90, v92);

        objc_msgSend_setTexture_atIndex_(v30, v93, *(void *)(a1 + 72), 0);
        objc_msgSend_setTexture_atIndex_(v30, v94, *(void *)(a1 + 120), 1);
        objc_msgSend_setBytes_length_atIndex_(v30, v95, (uint64_t)&v201, 4, 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v96, (uint64_t)&v195, 48, 1);
        long long v186 = xmmword_235A116B0;
        uint64_t v187 = 1;
        long long v184 = xmmword_235A116B0;
        uint64_t v185 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v97, (uint64_t)&v186, (uint64_t)&v184);
        v101 = objc_msgSend_initializeSeamPreviousSliceWithMask(*(void **)(a1 + 16), v98, v99, v100);
        getThreadgroupSizeForShader(v101, (unint64_t *)&v192);
        long long v199 = v192;
        uint64_t v200 = v193;

        v105 = objc_msgSend_initializeSeamPreviousSliceWithMask(*(void **)(a1 + 16), v102, v103, v104);
        objc_msgSend_setComputePipelineState_(v30, v106, (uint64_t)v105, v107);

        objc_msgSend_setTexture_atIndex_(v30, v108, (uint64_t)v12, 0);
        objc_msgSend_setTexture_atIndex_(v30, v109, (uint64_t)v16, 1);
        objc_msgSend_setTexture_atIndex_(v30, v110, *(void *)(a1 + 120), 2);
        objc_msgSend_setTexture_atIndex_(v30, v111, *(void *)(a1 + 24), 3);
        objc_msgSend_setTexture_atIndex_(v30, v112, *(void *)(a1 + 32), 4);
        objc_msgSend_setTexture_atIndex_(v30, v113, *(void *)(a1 + 40), 5);
        objc_msgSend_setTexture_atIndex_(v30, v114, *(void *)(a1 + 48), 6);
        objc_msgSend_setTexture_atIndex_(v30, v115, *(void *)(a1 + 56), 7);
        objc_msgSend_setTexture_atIndex_(v30, v116, *(void *)(a1 + 64), 8);
        objc_msgSend_setBytes_length_atIndex_(v30, v117, (uint64_t)&v195, 48, 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v118, (uint64_t)&v201, 4, 1);
        v183[0] = objc_msgSend_width(v16, v119, v120, v121);
        v183[1] = objc_msgSend_height(v16, v122, v123, v124);
        v183[2] = 1;
        long long v192 = v199;
        uint64_t v193 = v200;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v125, (uint64_t)v183, (uint64_t)&v192);
        id v126 = *(id *)(a1 + 24);
        objc_storeStrong((id *)(a1 + 24), *(id *)(a1 + 40));
        v127 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v126;
        id v128 = v126;

        id v129 = *(id *)(a1 + 32);
        objc_storeStrong((id *)(a1 + 32), *(id *)(a1 + 48));
        v130 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v129;
      }
      else if (!a4)
      {
        uint64_t v31 = objc_msgSend__centralStitchAddSlice_sliceHomography_sliceType_((void *)a1, v27, a3, 3, *(double *)v181, *(double *)&v181[16], *(double *)&v181[32]);
        if (v31)
        {
          uint64_t v10 = v31;
          goto LABEL_9;
        }
        v35 = objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v32, v33, v34);
        getThreadgroupSizeForShader(v35, (unint64_t *)&v199);

        v39 = objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v36, v37, v38);
        objc_msgSend_setComputePipelineState_(v30, v40, (uint64_t)v39, v41);

        objc_msgSend_setTexture_atIndex_(v30, v42, (uint64_t)v12, 0);
        objc_msgSend_setTexture_atIndex_(v30, v43, (uint64_t)v16, 1);
        objc_msgSend_setTexture_atIndex_(v30, v44, *(void *)(a1 + 24), 2);
        objc_msgSend_setTexture_atIndex_(v30, v45, *(void *)(a1 + 32), 3);
        v198[0] = objc_msgSend_width(v16, v46, v47, v48);
        v198[1] = objc_msgSend_height(v16, v49, v50, v51);
        v198[2] = 1;
        long long v195 = v199;
        *(void *)&long long v196 = v200;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v52, (uint64_t)v198, (uint64_t)&v195);
      }
      objc_msgSend_endEncoding(v30, v27, v28, v29);
      objc_msgSend_commit(v21, v131, v132, v133);
      v137 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v134, v135, v136);
      v141 = objc_msgSend_commandBuffer(v137, v138, v139, v140);

      objc_msgSend_setLabel_(v141, v142, @"Panorama:StitchingStage:initializeSeamPreviousSlice", v143);
      v147 = objc_msgSend_computeCommandEncoder(v141, v144, v145, v146);

      v151 = objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v148, v149, v150);
      getThreadgroupSizeForShader(v151, (unint64_t *)&v195);
      long long v199 = v195;
      uint64_t v200 = v196;

      v155 = objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v152, v153, v154);
      objc_msgSend_setComputePipelineState_(v147, v156, (uint64_t)v155, v157);

      objc_msgSend_setTexture_atIndex_(v147, v158, (uint64_t)v12, 0);
      objc_msgSend_setTexture_atIndex_(v147, v159, (uint64_t)v16, 1);
      objc_msgSend_setTexture_atIndex_(v147, v160, *(void *)(a1 + 56), 2);
      objc_msgSend_setTexture_atIndex_(v147, v161, *(void *)(a1 + 64), 3);
      v182[0] = objc_msgSend_width(v16, v162, v163, v164);
      v182[1] = objc_msgSend_height(v16, v165, v166, v167);
      v182[2] = 1;
      long long v195 = v199;
      *(void *)&long long v196 = v200;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v147, v168, (uint64_t)v182, (uint64_t)&v195);
      objc_msgSend_endEncoding(v147, v169, v170, v171);
      objc_msgSend_commit(v141, v172, v173, v174);
      uint64_t v10 = 0;
      *(void *)(a1 + 136) = 0;
      *(void *)(a1 + 144) = 0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)(a1 + 152) = _Q0;
      uint64_t v30 = v147;
      v21 = v141;
    }
    else
    {
      uint64_t v30 = 0;
      v21 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v30 = 0;
    v21 = 0;
  }
LABEL_9:

  return v10;
}

- (uint64_t)addSlice:(uint64_t)a3 sliceHomography:(uint64_t)a4 sliceType:
{
  if (!*(unsigned char *)(a1 + 84)) {
    return 2;
  }
  int v4 = *(_DWORD *)(a1 + 88);
  if (v4 != 1)
  {
    if (!v4) {
      return objc_msgSend__centralStitchAddSlice_sliceHomography_sliceType_((void *)a1, a2, a3, a4);
    }
    return 2;
  }
  return MEMORY[0x270F9A6D0](a1, sel__seamStitchAddSlice_sliceHomography_sliceType_, a3, a4);
}

- (int)prepareToProcessSliceWidth:(unint64_t)a3 sliceHeight:(unint64_t)a4
{
  unint64_t v7 = a3 >> 1;
  unint64_t v8 = a4 >> 1;
  uint64_t v9 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, 25, a3 >> 1, a4 >> 1, 0);
  objc_msgSend_setUsage_(v9, v10, 3, v11);
  uint64_t v15 = objc_msgSend_device(self->_metal, v12, v13, v14);
  uint64_t v18 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v15, v16, (uint64_t)v9, v17);
  stitchingMask = self->_stitchingMask;
  self->_stitchingMask = v18;

  if (!self->_stitchingMask) {
    goto LABEL_12;
  }
  v21 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v20, 25, a3, a4, 0);

  objc_msgSend_setUsage_(v21, v22, 3, v23);
  uint64_t v27 = objc_msgSend_device(self->_metal, v24, v25, v26);
  uint64_t v30 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v27, v28, (uint64_t)v21, v29);
  seamStagingLuma = self->_seamStagingLuma;
  self->_seamStagingLuma = v30;

  if (!self->_seamStagingLuma) {
    goto LABEL_13;
  }
  v35 = objc_msgSend_device(self->_metal, v32, v33, v34);
  uint64_t v38 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v35, v36, (uint64_t)v21, v37);
  seamStagingLumaDst = self->_seamStagingLumaDst;
  self->_seamStagingLumaDst = v38;

  if (!self->_seamStagingLumaDst
    || (objc_msgSend_device(self->_metal, v40, v41, v42),
        v43 = objc_claimAutoreleasedReturnValue(),
        uint64_t v46 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v43, v44, (uint64_t)v21, v45),
        prevLuma = self->_prevLuma,
        self->_prevLuma = v46,
        prevLuma,
        v43,
        !self->_prevLuma))
  {
LABEL_13:
    int v87 = 2;
    uint64_t v9 = v21;
    goto LABEL_11;
  }
  uint64_t v9 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v48, 65, v7, v8, 0);

  objc_msgSend_setUsage_(v9, v49, 3, v50);
  uint64_t v54 = objc_msgSend_device(self->_metal, v51, v52, v53);
  long long v57 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v54, v55, (uint64_t)v9, v56);
  seamStagingChroma = self->_seamStagingChroma;
  self->_seamStagingChroma = v57;

  if (!self->_seamStagingChroma) {
    goto LABEL_12;
  }
  uint64_t v62 = objc_msgSend_device(self->_metal, v59, v60, v61);
  int v65 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v62, v63, (uint64_t)v9, v64);
  seamStagingChromaDst = self->_seamStagingChromaDst;
  self->_seamStagingChromaDst = v65;

  if (!self->_seamStagingChromaDst) {
    goto LABEL_12;
  }
  v70 = objc_msgSend_device(self->_metal, v67, v68, v69);
  uint64_t v73 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v70, v71, (uint64_t)v9, v72);
  prevChroma = self->_prevChroma;
  self->_prevChroma = v73;

  if (self->_prevChroma)
  {
    uint64_t v76 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v75, 25, v7, v8, 0);

    objc_msgSend_setUsage_(v76, v77, 3, v78);
    v82 = objc_msgSend_device(self->_metal, v79, v80, v81);
    v85 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v82, v83, (uint64_t)v76, v84);
    seamCost = self->_seamCost;
    self->_seamCost = v85;

    if (self->_seamCost)
    {
      int v87 = 0;
      self->_isReadyToProcess = 1;
    }
    else
    {
      int v87 = 2;
    }
    uint64_t v9 = v76;
  }
  else
  {
LABEL_12:
    int v87 = 2;
  }
LABEL_11:

  return v87;
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

- (int)finishProcessing
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)setDirection:(int)a3
{
  self->_direction = a3;
  return 0;
}

- (int)setup
{
  return 0;
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

- (MTLTexture)stitchingMask
{
  return self->_stitchingMask;
}

- (CGRect)roi
{
  double x = self->_roi.origin.x;
  double y = self->_roi.origin.y;
  double width = self->_roi.size.width;
  double height = self->_roi.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isReadyToProcess
{
  return self->_isReadyToProcess;
}

- (void)setIsReadyToProcess:(BOOL)a3
{
  self->_isReadyToProcess = a3;
}

- (int)stitchingMode
{
  return self->_stitchingMode;
}

- (void)setStitchingMode:(int)a3
{
  self->_stitchingMode = a3;
}

- (MTLTexture)motionMask
{
  return self->_motionMask;
}

- (void)setMotionMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionMask, 0);
  objc_storeStrong((id *)&self->_stitchingMask, 0);
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_seamCost, 0);
  objc_storeStrong((id *)&self->_prevChroma, 0);
  objc_storeStrong((id *)&self->_prevLuma, 0);
  objc_storeStrong((id *)&self->_seamStagingChromaDst, 0);
  objc_storeStrong((id *)&self->_seamStagingLumaDst, 0);
  objc_storeStrong((id *)&self->_seamStagingChroma, 0);
  objc_storeStrong((id *)&self->_seamStagingLuma, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end