@interface ARPersonOcclusionTechnique
- (ARPersonOcclusionTechnique)init;
- (id).cxx_construct;
- (id)_fullDescription;
- (int)_minFilterDepthMap:(__CVBuffer *)a3 kernelSize:(unint64_t)a4 pResultBuffer:(__CVBuffer *)a5;
- (int)postProcessSegmentation:(__CVBuffer *)a3 depthData:(id)a4 depthDataSource:(int64_t)a5 detectionData:(id)a6 pResultingDepthBuffer:(__CVBuffer *)a7;
- (void)dealloc;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
@end

@implementation ARPersonOcclusionTechnique

- (ARPersonOcclusionTechnique)init
{
  v15.receiver = self;
  v15.super_class = (Class)ARPersonOcclusionTechnique;
  id v2 = [(ARTechnique *)&v15 init];
  if (v2)
  {
    uint64_t v12 = 0x3FB999999999999ALL;
    uint64_t v13 = 0x3FB999999999999ALL;
    uint64_t v10 = 0x3FC999999999999ALL;
    uint64_t v11 = 0x3FC0000000000000;
    uint64_t v8 = 0x4000000000000000;
    uint64_t v9 = 0x3FE0000000000000;
    uint64_t v7 = 0x3FD3333333333333;
    uint64_t v6 = 0x3FA999999999999ALL;
    std::allocate_shared[abi:ne180100]<arkit::RobustExpFilter<float>,std::allocator<arkit::RobustExpFilter<float>>,double,double,double,double,double,double,double,double,void>((double *)&v13, (double *)&v12, (double *)&v11, (double *)&v10, (double *)&v9, (uint64_t)&v8, (double *)&v7, &v14, (double *)&v6);
    long long v3 = v14;
    long long v14 = 0uLL;
    v4 = (std::__shared_weak_count *)*((void *)v2 + 9);
    *((_OWORD *)v2 + 4) = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      if (*((void *)&v14 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
      }
    }
    *((void *)v2 + 10) = 0;
    *((void *)v2 + 11) = 0;
    *((void *)v2 + 12) = 0;
    *((unsigned char *)v2 + 104) = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.appleDepth.useExpFilter"];
    *((unsigned char *)v2 + 105) = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.appleDepth.averageDepthBoundingBox"];
  }
  return (ARPersonOcclusionTechnique *)v2;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_depthPixelBufferPool);
  minFilterIntermediatePooledBuffer = self->_minFilterIntermediatePooledBuffer;
  if (minFilterIntermediatePooledBuffer) {
    free(minFilterIntermediatePooledBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)ARPersonOcclusionTechnique;
  [(ARPersonOcclusionTechnique *)&v4 dealloc];
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 resultDataOfClass:objc_opt_class()];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [v6 resultDataOfClass:objc_opt_class()];
  uint64_t v10 = [v9 firstObject];

  uint64_t v11 = [v6 resultDataOfClass:objc_opt_class()];
  v74 = [v11 firstObject];

  uint64_t v12 = [v6 resultDataOfClass:objc_opt_class()];
  uint64_t v13 = [v12 firstObject];

  if ([v8 segmentationBuffer] && objc_msgSend(v10, "depthBuffer") && v74 && !v13)
  {
    [v8 timestamp];
    double v15 = v14;
    [v10 timestamp];
    if (v15 != v16)
    {
      [v10 timestamp];
      double v18 = v17;
      [v74 timestamp];
      if (v18 != v19)
      {
        [v8 timestamp];
        [v10 timestamp];
        [v74 timestamp];
        kdebug_trace();
        v20 = _ARLogTechnique();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          [v8 timestamp];
          uint64_t v24 = v23;
          [v10 timestamp];
          uint64_t v26 = v25;
          [v74 timestamp];
          *(_DWORD *)buf = 138544386;
          id v80 = v22;
          __int16 v81 = 2048;
          v82 = self;
          __int16 v83 = 2048;
          uint64_t v84 = v24;
          __int16 v85 = 2048;
          uint64_t v86 = v26;
          __int16 v87 = 2048;
          uint64_t v88 = v27;
          _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Mismatched timestamps. (Segmentation data: %f, Depth data: %f, Detection data: %f) ", buf, 0x34u);
        }
        v28 = [(ARTechnique *)self delegate];
        [v28 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];

        goto LABEL_55;
      }
    }
    [v8 timestamp];
    kdebug_trace();
    CVPixelBufferRef texture = 0;
    v36 = (__CVBuffer *)[v8 segmentationBuffer];
    v37 = v36;
    if (v36)
    {
      size_t Width = CVPixelBufferGetWidth(v36);
      size_t Height = CVPixelBufferGetHeight(v37);
      double v40 = (double)Width;
      double v41 = (double)Height;
    }
    else
    {
      double v40 = *MEMORY[0x1E4F1DB30];
      double v41 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    CVPixelBufferRef texture = ARCreateCVPixelBufferFromPool(&self->_depthPixelBufferPool, 1717855600, self, @"Result Depth Map", v40, v41);
    if (texture)
    {
      v73 = [v6 imageData];
      if ([v73 deviceOrientation] != self->_lastDeviceOrientation)
      {
        v49 = _ARLogTechnique();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v50 = (objc_class *)objc_opt_class();
          v51 = NSStringFromClass(v50);
          *(_DWORD *)buf = 138543618;
          id v80 = v51;
          __int16 v81 = 2048;
          v82 = self;
          _os_log_impl(&dword_1B88A2000, v49, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Resetting exponential filter due to device rotation.", buf, 0x16u);
        }
        ptr = self->_varExpFilter.__ptr_;
        ptr[1] = *ptr;
        ptr[4] = ptr[3];
      }
      self->_lastDeviceOrientation = [v73 deviceOrientation];
      uint64_t v53 = [v10 singleFrameDepthBuffer];
      if ([v10 source] == 2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v74 timestamp];
          kdebug_trace();
          CVPixelBufferRef v75 = 0;
          int v54 = [(ARPersonOcclusionTechnique *)self _minFilterDepthMap:v53 kernelSize:3 pResultBuffer:&v75];
          [v74 timestamp];
          kdebug_trace();
          if (v54)
          {
            v55 = _ARLogTechnique();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v56 = (objc_class *)objc_opt_class();
              v57 = NSStringFromClass(v56);
              *(_DWORD *)buf = 138543618;
              id v80 = v57;
              __int16 v81 = 2048;
              v82 = self;
              _os_log_impl(&dword_1B88A2000, v55, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating result depth buffer", buf, 0x16u);
            }
            v58 = [(ARTechnique *)self delegate];
            [v58 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];

            [v8 timestamp];
            kdebug_trace();
            CVPixelBufferRelease(texture);
LABEL_54:

            goto LABEL_55;
          }
          v63 = [ARMLDepthData alloc];
          [v10 timestamp];
          v65 = -[ARMLDepthData initWithTimestamp:depthBuffer:confidenceBuffer:source:](v63, "initWithTimestamp:depthBuffer:confidenceBuffer:source:", v75, [v10 singleFrameConfidenceBuffer], 2, v64);

          CVPixelBufferRelease(v75);
          uint64_t v10 = v65;
        }
      }
      if (-[ARPersonOcclusionTechnique postProcessSegmentation:depthData:depthDataSource:detectionData:pResultingDepthBuffer:](self, "postProcessSegmentation:depthData:depthDataSource:detectionData:pResultingDepthBuffer:", [v8 segmentationBuffer], v10, objc_msgSend(v10, "source"), v74, &texture))
      {
        v66 = _ARLogTechnique();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v67 = (objc_class *)objc_opt_class();
          v68 = NSStringFromClass(v67);
          *(_DWORD *)buf = 138543618;
          id v80 = v68;
          __int16 v81 = 2048;
          v82 = self;
          _os_log_impl(&dword_1B88A2000, v66, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Processing segmentation and depth buffer failed", buf, 0x16u);
        }
        v69 = [(ARTechnique *)self delegate];
        [(ARFilteredMLDepthData *)v69 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];
      }
      else
      {
        v70 = [ARFilteredMLDepthData alloc];
        v69 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:](v70, "initWithTimestamp:depthBuffer:source:", texture, [v10 source], a3);
        v71 = [(ARTechnique *)self delegate];
        if (v69)
        {
          v78 = v69;
          v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
        }
        else
        {
          v72 = (void *)MEMORY[0x1E4F1CBF0];
        }
        [v71 technique:self didOutputResultData:v72 timestamp:v6 context:a3];
        if (v69) {
      }
        }
      CVPixelBufferRelease(texture);
      [v8 timestamp];
      kdebug_trace();
      goto LABEL_54;
    }
    v59 = _ARLogTechnique();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = (objc_class *)objc_opt_class();
      v61 = NSStringFromClass(v60);
      *(_DWORD *)buf = 138543618;
      id v80 = v61;
      __int16 v81 = 2048;
      v82 = self;
      _os_log_impl(&dword_1B88A2000, v59, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating result depth buffer", buf, 0x16u);
    }
    v62 = [(ARTechnique *)self delegate];
    [v62 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];

    [v8 timestamp];
    kdebug_trace();
  }
  else if ([v8 segmentationBuffer] && v13)
  {
    v29 = (__CVBuffer *)[v8 segmentationBuffer];
    v30 = v29;
    if (v29)
    {
      size_t v31 = CVPixelBufferGetWidth(v29);
      size_t v32 = CVPixelBufferGetHeight(v30);
      double v33 = (double)v31;
      double v34 = (double)v32;
    }
    else
    {
      double v33 = *MEMORY[0x1E4F1DB30];
      double v34 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    v42 = ARCreateCVPixelBufferFromPool(&self->_depthPixelBufferPool, 1717855600, self, @"Result Depth Map", v33, v34);
    v43 = v42;
    if (v42)
    {
      CVPixelBufferLockBaseAddress(v42, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(v43);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v43);
      bzero(BaseAddress, (unint64_t)(v34 * (double)BytesPerRow));
      CVPixelBufferUnlockBaseAddress(v43, 0);
      v46 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:]([ARFilteredMLDepthData alloc], "initWithTimestamp:depthBuffer:source:", v43, [v13 source], a3);
      CVPixelBufferRelease(v43);
    }
    else
    {
      v46 = 0;
    }
    v47 = [(ARTechnique *)self delegate];
    if (v46)
    {
      v77 = v46;
      v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    }
    else
    {
      v48 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [v47 technique:self didOutputResultData:v48 timestamp:v6 context:a3];
    if (v46) {
  }
    }
  else
  {
    kdebug_trace();
    v35 = [(ARTechnique *)self delegate];
    [v35 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];

    kdebug_trace();
  }
LABEL_55:
}

- (int)postProcessSegmentation:(__CVBuffer *)a3 depthData:(id)a4 depthDataSource:(int64_t)a5 detectionData:(id)a6 pResultingDepthBuffer:(__CVBuffer *)a7
{
  buf[5] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  double v14 = v13;
  CVPixelBufferRef pixelBuffer = a3;
  if (!a3)
  {
    double v18 = _ARLogTechnique();
    double v19 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      LODWORD(buf[0]) = 138543618;
      *(void *)((char *)buf + 4) = v21;
      WORD2(buf[1]) = 2048;
      *(void *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing segmentation buffer", (uint8_t *)buf, 0x16u);
    }
    goto LABEL_20;
  }
  v195 = v12;
  if (!v12)
  {
    double v18 = _ARLogTechnique();
    double v19 = 0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      LODWORD(buf[0]) = 138543618;
      *(void *)((char *)buf + 4) = v23;
      WORD2(buf[1]) = 2048;
      *(void *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing depth data", (uint8_t *)buf, 0x16u);
    }
    goto LABEL_20;
  }
  if (!v13)
  {
    double v18 = _ARLogTechnique();
    double v19 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      LODWORD(buf[0]) = 138543618;
      *(void *)((char *)buf + 4) = v29;
      WORD2(buf[1]) = 2048;
      *(void *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing detection data", (uint8_t *)buf, 0x16u);
    }
    goto LABEL_20;
  }
  if (!a7 || !*a7)
  {
    uint64_t v24 = _ARLogTechnique();
    double v19 = v12;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      uint64_t v26 = NSStringFromClass(v25);
      LODWORD(buf[0]) = 138543618;
      *(void *)((char *)buf + 4) = v26;
      WORD2(buf[1]) = 2048;
      *(void *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing resulting depth buffer", (uint8_t *)buf, 0x16u);
    }
    int v27 = -6662;
    goto LABEL_21;
  }
  v192 = (__CVBuffer *)[v12 singleFrameDepthBuffer];
  if (!v192)
  {
    double v18 = _ARLogTechnique();
    double v19 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      size_t v31 = (objc_class *)objc_opt_class();
      size_t v32 = NSStringFromClass(v31);
      LODWORD(buf[0]) = 138543618;
      *(void *)((char *)buf + 4) = v32;
      WORD2(buf[1]) = 2048;
      *(void *)((char *)&buf[1] + 6) = self;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Missing depth buffer", (uint8_t *)buf, 0x16u);
    }
LABEL_20:

    int v27 = -6661;
    goto LABEL_21;
  }
  if (self->_useBoundingBoxes)
  {
    double v15 = [v14 detectedObjects];
    double v16 = v14;
    BOOL v17 = [v15 count] != 0;
  }
  else
  {
    double v16 = v14;
    BOOL v17 = 0;
  }
  BOOL v33 = a5 != 2 && self->_doExpFiltering;
  double v19 = v195;
  CVPixelBufferRef v185 = *a7;
  CVPixelBufferLockBaseAddress(*a7, 0);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockFlags unlockFlags = !v33;
  CVPixelBufferLockBaseAddress(v192, unlockFlags);
  memset(buf, 0, 32);
  ARWrapCVPixelBufferVImage(v192, (void **)buf);
  memset(v204, 0, sizeof(v204));
  ARWrapCVPixelBufferVImage(a3, (void **)v204);
  memset(v203, 0, sizeof(v203));
  ARWrapCVPixelBufferVImage(v185, v203);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&buf[1], *(int64x2_t *)&v203[1]), (int32x4_t)vceqq_s64(*(int64x2_t *)&buf[1], *(int64x2_t *)((char *)v204 + 8)))), 0xFuLL))) & 1) == 0)
  {
    double v34 = _ARLogTechnique();
    double v14 = v16;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      *(_DWORD *)v205 = 138543618;
      *(void *)&v205[4] = v36;
      *(_WORD *)&v205[12] = 2048;
      *(void *)&v205[14] = self;
      _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Dimensions of depth buffer, segmentation buffer and resulting depth buffer are not equal", v205, 0x16u);
    }
    int v27 = -6681;
    goto LABEL_21;
  }
  v37 = (void *)buf[1];
  if (v33)
  {
    [v16 timestamp];
    kdebug_trace();
    size_t v38 = 4 * buf[2] * buf[1];
    v39 = arkit::RobustExpFilter<float>::filter((uint64_t)self->_varExpFilter.__ptr_, (float *)buf[0], v38);
    memcpy((void *)buf[0], v39, v38);
    [v16 timestamp];
    kdebug_trace();
    v37 = v203[1];
  }
  bzero(v203[0], (void)v37 * (uint64_t)v203[3]);
  if (v17)
  {
    __p = 0;
    v201 = 0;
    uint64_t v202 = 0;
    uint64_t v197 = 0;
    uint64_t v198 = 0;
    uint64_t v199 = 0;
    *(void *)&long long v40 = -1;
    *((void *)&v40 + 1) = -1;
    *(_OWORD *)v205 = v40;
    *(_OWORD *)&v205[16] = 0uLL;
    double v14 = v16;
    arkit::computeBoundingBoxes((uint64_t)v204, v16, (char **)&__p, &v197, (uint64x2_t *)v205);
    arkit::fillInstanceDepthBufferOutsideAllDetections(buf, (unsigned __int8 **)v204, v203, (uint64_t *)v205);
    v182 = (__CVBuffer *)[v195 singleFrameConfidenceBuffer];
    if (v182)
    {
      CVPixelBufferLockBaseAddress(v182, 1uLL);
      ARWrapCVPixelBufferVImage(v182, v196);
      double v41 = (char *)v196[0];
      v42 = v196[3];
    }
    else
    {
      v42 = 0;
      double v41 = 0;
    }
    v56 = v201;
    v180 = __p;
    v184 = v201;
    if (__p == v201) {
      goto LABEL_82;
    }
    uint64_t v57 = v204[0].i64[0];
    uint64_t v58 = v204[1].i64[1];
    uint64_t v59 = buf[0];
    uint64_t v60 = buf[3];
    v61 = (char *)v203[0];
    v62 = v203[3];
    v63 = __p;
    do
    {
      long long v65 = *v63;
      long long v64 = v63[1];
      unint64_t v66 = *((void *)v63 + 1);
      unint64_t v67 = *((void *)v63 + 3);
      if (v66 >= v67) {
        goto LABEL_81;
      }
      unint64_t v68 = 0;
      unint64_t v69 = 0;
      uint64_t v70 = v64 - v65;
      v71 = (float *)&v41[4 * v65 + (unint64_t)v42 * v66];
      v72 = (float *)(v59 + v60 * v66 + 4 * v65);
      v73 = (unsigned __int8 *)(v57 + v65 + v58 * v66);
      float v74 = 0.0;
      uint64_t v75 = *((void *)v63 + 1);
      float v76 = 0.0;
      do
      {
        if ((unint64_t)v64 > *(void *)v63)
        {
          v77 = v73;
          v78 = v72;
          v79 = v71;
          for (uint64_t i = v70; i; --i)
          {
            if (*v77++)
            {
              float v82 = *v78;
              if (v41)
              {
                float v76 = v76 + v82;
                ++v68;
                if (*v79 <= 0.4) {
                  goto LABEL_60;
                }
              }
              else
              {
                float v76 = v76 + v82;
                ++v68;
              }
              float v74 = v74 + v82;
              ++v69;
            }
LABEL_60:
            ++v79;
            ++v78;
          }
        }
        ++v75;
        v71 = (float *)((char *)v42 + (void)v71);
        v72 = (float *)((char *)v72 + v60);
        v73 += v58;
      }
      while (v75 != v67);
      if (v68)
      {
        float v83 = (float)v68;
        double v19 = v195;
        v56 = v184;
        if ((float)((float)v68 * 0.75) >= (float)v69 || (v76 = v74, float v83 = (float)v69, v69)) {
          float v84 = v76 / v83;
        }
        else {
          float v84 = 3.4028e38;
        }
      }
      else
      {
        float v84 = 0.0;
        double v19 = v195;
        v56 = v184;
      }
      uint64_t v85 = buf[3];
      uint64_t v86 = &v61[(void)v62 * v66];
      uint64_t v87 = v57 + v58 * v66;
      uint64_t v88 = buf[0] + v66 * buf[3];
      do
      {
        if (v68)
        {
          uint64_t v89 = *(void *)v63;
          uint64_t v90 = v64 - *(void *)v63;
          if ((unint64_t)v64 > *(void *)v63)
          {
            v91 = (float *)&v86[4 * v89];
            v92 = (unsigned __int8 *)(v87 + v89);
            do
            {
              if (*v92++) {
                float *v91 = v84;
              }
              ++v91;
              --v90;
            }
            while (v90);
          }
        }
        else
        {
          uint64_t v94 = *(void *)v63;
          if (*(void *)v63 < (unint64_t)v64)
          {
            do
            {
              if (*(unsigned char *)(v87 + v94)) {
                *(_DWORD *)&v86[4 * v94] = *(_DWORD *)(v88 + 4 * v94);
              }
              ++v94;
            }
            while ((void)v64 != v94);
          }
        }
        ++v66;
        long long v64 = v63[1];
        uint64_t v86 = (char *)v62 + (void)v86;
        v87 += v58;
        v88 += v85;
      }
      while (v66 < *((void *)v63 + 3));
LABEL_81:
      v63 += 2;
    }
    while (v63 != v56);
LABEL_82:
    uint64_t v181 = v197;
    uint64_t v193 = v198;
    if (v197 == v198) {
      goto LABEL_174;
    }
    v95 = v203[3];
    uint64_t v96 = v197;
    uint64_t v190 = v204[0].i64[0];
    v191 = v14;
    v188 = (char *)v203[0];
    uint64_t v189 = v204[1].i64[1];
    uint64_t v186 = buf[3];
    uint64_t v187 = buf[0];
LABEL_84:
    v98 = *(uint64x2_t **)v96;
    v97 = *(uint64x2_t **)(v96 + 8);
    if (*(uint64x2_t **)v96 == v97) {
      goto LABEL_124;
    }
    unint64_t v99 = 0;
    uint64_t v100 = v204[0].i64[0];
    uint64_t v101 = v204[1].i64[1];
    uint64_t v102 = buf[0];
    uint64_t v103 = buf[3];
    v104 = *(uint64x2_t **)v96;
    v105 = (char *)v203[0];
    v106 = v203[3];
LABEL_86:
    unint64_t v107 = v104->u64[1];
    uint64x2_t v108 = v104[1];
    if (v107 >= v104[1].i64[1]) {
      goto LABEL_107;
    }
LABEL_87:
    uint64_t v109 = v104->i64[0];
    uint64_t v110 = v108.i64[0];
    if (v104->i64[0] >= (unint64_t)v108.i64[0]) {
      goto LABEL_106;
    }
    v111 = &v105[(void)v106 * v107];
    while (!*(unsigned char *)(v100 + v101 * v107 + v109))
    {
LABEL_104:
      if (++v109 == v110)
      {
        uint64x2_t v108 = v104[1];
LABEL_106:
        if (++v107 >= v108.i64[1])
        {
LABEL_107:
          unint64_t v120 = v104[2].u64[1];
          if (v120)
          {
            unint64_t v121 = v104[3].u64[1];
            float v122 = (float)v121;
            float v123 = (float)v120;
            if ((float)((float)v120 * 0.75) >= (float)v121)
            {
              i32 = (float *)v104[2].i32;
LABEL_112:
              float v125 = *i32 / v123;
            }
            else
            {
              if (v121)
              {
                i32 = (float *)v104[3].i32;
                float v123 = v122;
                goto LABEL_112;
              }
              float v125 = 3.4028e38;
            }
            *(float *)v104[4].i32 = v125;
          }
          unint64_t v126 = v104[6].u64[0];
          float v127 = (float)v126;
          unint64_t v128 = v104[5].u64[0];
          if ((float)((float)v128 * 0.75) >= (float)v126)
          {
            if (!v128) {
              goto LABEL_120;
            }
            v129 = (float *)&v104[4].i32[2];
            float v127 = (float)v128;
LABEL_119:
            float v130 = *v129 / v127;
          }
          else
          {
            if (v126)
            {
              v129 = (float *)&v104[5].i32[2];
              goto LABEL_119;
            }
LABEL_120:
            float v130 = 3.4028e38;
          }
          *(float *)&v104[6].i32[2] = v130;
          v104 += 7;
          ++v99;
          if (v104 == v97)
          {
LABEL_124:
            unint64_t v131 = *(void *)(v96 + 40);
            long long v132 = *(_OWORD *)(v96 + 48);
            if (v131 >= *(void *)(v96 + 56)) {
              goto LABEL_153;
            }
            while (2)
            {
              unint64_t v133 = *(void *)(v96 + 32);
              uint64_t v134 = v132;
              if (v133 >= (unint64_t)v132) {
                goto LABEL_152;
              }
              v135 = &v188[(void)v95 * v131];
              while (2)
              {
                if (*(unsigned char *)(v190 + v189 * v131 + v133) && *(float *)&v135[4 * v133] == -3.4028e38)
                {
                  if (v41) {
                    float v136 = *(float *)&v41[4 * v133 + v131 * (void)v42];
                  }
                  else {
                    float v136 = 1.0;
                  }
                  float v137 = *(float *)(v187 + v186 * v131 + 4 * v133);
                  v138 = v98;
                  if (v98 != v97)
                  {
                    v139.i64[0] = v133;
                    v139.i64[1] = v131;
                    float v140 = 3.4028e38;
                    v138 = v98;
                    v141 = v98;
                    do
                    {
                      int64x2_t v142 = (int64x2_t)vandq_s8((int8x16_t)vcgtq_u64(v141[1], v139), (int8x16_t)vcgeq_u64(v139, *v141));
                      if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v142, 1), (int8x16_t)v142).u64[0] & 0x8000000000000000) != 0)
                      {
                        v143 = v141 + 2;
                        if (!v141[2].i64[1]) {
                          v143 = (uint64x2_t *)((char *)v141 + 72);
                        }
                        float v144 = vabds_f32(v137, *(float *)v143[2].i32);
                        if (v144 <= v140)
                        {
                          v138 = v141;
                          float v140 = v144;
                        }
                      }
                      v141 += 7;
                    }
                    while (v141 != v97);
                  }
                  float v145 = v137 + *(float *)v138[2].i32;
                  *(float *)v138[2].i32 = v145;
                  uint64_t v146 = v138[2].i64[1] + 1;
                  v138[2].i64[1] = v146;
                  if (v136 <= 0.4)
                  {
                    uint64_t v147 = v138[3].i64[1];
                  }
                  else
                  {
                    *(float *)v138[3].i32 = v137 + *(float *)v138[3].i32;
                    uint64_t v147 = v138[3].i64[1] + 1;
                    v138[3].i64[1] = v147;
                  }
                  float v148 = (float)(unint64_t)v146;
                  if ((float)((float)(unint64_t)v146 * 0.75) >= (float)(unint64_t)v147)
                  {
                    if (!v146) {
                      goto LABEL_148;
                    }
LABEL_147:
                    float v149 = v145 / v148;
                  }
                  else
                  {
                    if (v147)
                    {
                      float v145 = *(float *)v138[3].i32;
                      float v148 = (float)(unint64_t)v147;
                      goto LABEL_147;
                    }
LABEL_148:
                    float v149 = 3.4028e38;
                  }
                  *(float *)v138[4].i32 = v149;
                  *(float *)&v135[4 * v133] = -1.0 - (float)(0x6DB6DB6DB6DB6DB7 * (v138 - v98));
                }
                if (++v133 != v134) {
                  continue;
                }
                break;
              }
              long long v132 = *(_OWORD *)(v96 + 48);
LABEL_152:
              if (++v131 < *((void *)&v132 + 1)) {
                continue;
              }
              break;
            }
LABEL_153:
            double v19 = v195;
            double v14 = v191;
            if (v98 == v97) {
              goto LABEL_163;
            }
            v150 = v98 + 2;
            v151 = v98;
            while (2)
            {
              unint64_t v152 = v150[1].u64[1];
              float v153 = (float)v152;
              unint64_t v154 = v150->u64[1];
              float v155 = (float)v154;
              if ((float)((float)v154 * 0.75) >= (float)v152)
              {
                v156 = (float *)v150;
                if (!v154) {
                  goto LABEL_160;
                }
LABEL_159:
                float v157 = *v156 / v155;
              }
              else
              {
                if (v152)
                {
                  v156 = (float *)v151[3].i32;
                  float v155 = v153;
                  goto LABEL_159;
                }
LABEL_160:
                float v157 = 3.4028e38;
              }
              *(float *)v150[2].i32 = v157;
              v151 += 7;
              v158 = v150 + 5;
              v150 += 7;
              if (v158 != v97) {
                continue;
              }
              break;
            }
            long long v132 = *(_OWORD *)(v96 + 48);
LABEL_163:
            unint64_t v159 = *(void *)(v96 + 40);
            if (v159 < *((void *)&v132 + 1))
            {
              v160 = &v188[(void)v95 * v159];
              uint64_t v161 = v190 + v189 * v159;
              do
              {
                unint64_t v162 = *(void *)(v96 + 32);
                uint64_t v163 = v132 - v162;
                if ((unint64_t)v132 > v162)
                {
                  v164 = (float *)&v160[4 * v162];
                  v165 = (unsigned __int8 *)(v161 + v162);
                  do
                  {
                    int v166 = *v165++;
                    if (v166 && *v164 != 0.0) {
                      float *v164 = *(float *)v98[7 * (unint64_t)fabs(*v164 + 1.0) + 4].i32;
                    }
                    ++v164;
                    --v163;
                  }
                  while (v163);
                  long long v132 = *(_OWORD *)(v96 + 48);
                }
                ++v159;
                v160 = (char *)v95 + (void)v160;
                v161 += v189;
              }
              while (v159 < *((void *)&v132 + 1));
            }
            v96 += 64;
            if (v96 == v193)
            {
LABEL_174:
              if (v193 != v181 || (unint64_t)((char *)v184 - v180) > 0x20)
              {
                unint64_t v167 = *(void *)&v205[8];
                long long v168 = *(_OWORD *)&v205[16];
                if (*(void *)&v205[8] < *(void *)&v205[24])
                {
                  uint64_t v169 = v204[1].i64[1];
                  uint64_t v170 = buf[3];
                  v171 = (char *)v203[3];
                  uint64_t v172 = buf[0] + *(void *)&v205[8] * buf[3];
                  v173 = (char *)v203[0] + *(void *)&v205[8] * (uint64_t)v203[3];
                  uint64_t v174 = v204[0].i64[0] + *(void *)&v205[8] * v204[1].i64[1];
                  do
                  {
                    uint64_t v175 = v168 - *(void *)v205;
                    if ((unint64_t)v168 > *(void *)v205)
                    {
                      v176 = (float *)(v172 + 4 * *(void *)v205);
                      v177 = (unsigned __int8 *)(v174 + *(void *)v205);
                      v178 = (float *)&v173[4 * *(void *)v205];
                      do
                      {
                        int v179 = *v177++;
                        if (v179 && *v178 == 0.0) {
                          float *v178 = *v176;
                        }
                        ++v176;
                        ++v178;
                        --v175;
                      }
                      while (v175);
                      long long v168 = *(_OWORD *)&v205[16];
                    }
                    ++v167;
                    v172 += v170;
                    v173 = &v171[(void)v173];
                    v174 += v169;
                  }
                  while (v167 < *((void *)&v168 + 1));
                }
              }
              if (v182) {
                CVPixelBufferUnlockBaseAddress(v182, 1uLL);
              }
              CVPixelBufferUnlockBaseAddress(v192, unlockFlags);
              CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
              CVPixelBufferUnlockBaseAddress(v185, 0);
              *(void *)v205 = &v197;
              std::vector<arkit::BoundingBoxGroup>::__destroy_vector::operator()[abi:ne180100]((void ***)v205);
              if (__p)
              {
                v201 = __p;
                operator delete(__p);
              }
              int v27 = 0;
              goto LABEL_21;
            }
            goto LABEL_84;
          }
          goto LABEL_86;
        }
        goto LABEL_87;
      }
    }
    float v112 = *(float *)(v102 + v103 * v107 + 4 * v109);
    if (v41)
    {
      float v113 = *(float *)&v41[4 * v109 + v107 * (void)v42];
      *(float *)&v104[4].i32[2] = v112 + *(float *)&v104[4].i32[2];
      ++v104[5].i64[0];
      if (v113 <= 0.4)
      {
        int v114 = 0;
        goto LABEL_95;
      }
    }
    else
    {
      *(float *)&v104[4].i32[2] = v112 + *(float *)&v104[4].i32[2];
      ++v104[5].i64[0];
    }
    *(float *)&v104[5].i32[2] = v112 + *(float *)&v104[5].i32[2];
    ++v104[6].i64[0];
    int v114 = 1;
LABEL_95:
    if (*(float *)&v111[4 * v109] != -3.4028e38)
    {
      if (&v104[7] == v97)
      {
LABEL_100:
        *(float *)v104[2].i32 = v112 + *(float *)v104[2].i32;
        ++v104[2].i64[1];
        float v119 = -1.0 - (float)v99;
        if (v114)
        {
          *(float *)v104[3].i32 = v112 + *(float *)v104[3].i32;
          ++v104[3].i64[1];
          float v119 = -1.0 - (float)v99;
        }
      }
      else
      {
        v115.i64[0] = v109;
        v115.i64[1] = v107;
        uint64_t v116 = 7;
        while (1)
        {
          v117 = &v104[v116];
          int64x2_t v118 = (int64x2_t)vandq_s8((int8x16_t)vcgtq_u64(v104[v116 + 1], v115), (int8x16_t)vcgeq_u64(v115, v104[v116]));
          if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v118, 1), (int8x16_t)v118).u64[0] & 0x8000000000000000) != 0) {
            break;
          }
          v116 += 7;
          if (&v117[7] == v97) {
            goto LABEL_100;
          }
        }
        float v119 = -3.4028e38;
      }
      *(float *)&v111[4 * v109] = v119;
    }
    goto LABEL_104;
  }
  uint64_t v43 = v204[0].i64[1];
  if (v204[0].i64[1])
  {
    uint64_t v44 = 0;
    int64x2_t v45 = v204[1];
    v46 = (_DWORD *)buf[0];
    uint64_t v47 = buf[3];
    v48 = (char *)v203[0];
    v49 = (char *)v203[3];
    uint64_t v50 = v204[0].i64[0];
    do
    {
      if (v45.i64[0])
      {
        v51 = (unsigned __int8 *)v50;
        v52 = v46;
        uint64_t v53 = v48;
        uint64_t v54 = v45.i64[0];
        do
        {
          if (*v51++) {
            *(_DWORD *)uint64_t v53 = *v52;
          }
          v53 += 4;
          ++v52;
          --v54;
        }
        while (v54);
      }
      ++v44;
      v48 = &v49[(void)v48];
      v46 = (_DWORD *)((char *)v46 + v47);
      v50 += v45.i64[1];
    }
    while (v44 != v43);
  }
  CVPixelBufferUnlockBaseAddress(v192, unlockFlags);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(v185, 0);
  int v27 = 0;
  double v14 = v16;
LABEL_21:

  return v27;
}

- (int)_minFilterDepthMap:(__CVBuffer *)a3 kernelSize:(unint64_t)a4 pResultBuffer:(__CVBuffer *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_depthPixelBufferPool = &self->_depthPixelBufferPool;
  if (a3)
  {
    double Width = (double)CVPixelBufferGetWidth(a3);
    double Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  CVPixelBufferRef v12 = ARCreateCVPixelBufferFromPool(p_depthPixelBufferPool, 1717855600, self, @"Result Depth Map", Width, Height);
  if (!v12) {
    return -6662;
  }
  id v13 = v12;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(v13, 0);
  memset(&src, 0, sizeof(src));
  ARWrapCVPixelBufferVImage(a3, &src.data);
  memset(&v23, 0, sizeof(v23));
  ARWrapCVPixelBufferVImage(v13, &v23.data);
  kdebug_trace();
  vImage_Error v14 = vImageMin_PlanarF(&src, &v23, 0, 0, 0, a4, a4, 0x80u);
  if (v14 == self->_minFilterIntermediateBufferSize)
  {
    minFilterIntermediatePooledBuffer = self->_minFilterIntermediatePooledBuffer;
  }
  else
  {
    BOOL v17 = _ARLogTechnique();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = (objc_class *)objc_opt_class();
      double v19 = NSStringFromClass(v18);
      unint64_t minFilterIntermediateBufferSize = self->_minFilterIntermediateBufferSize;
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v19;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2048;
      unint64_t v30 = minFilterIntermediateBufferSize;
      __int16 v31 = 2048;
      vImage_Error v32 = v14;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Changing minFilter buffer from size (%ti) to size (%ti)", buf, 0x2Au);
    }
    v21 = self->_minFilterIntermediatePooledBuffer;
    if (v21) {
      free(v21);
    }
    self->_unint64_t minFilterIntermediateBufferSize = v14;
    minFilterIntermediatePooledBuffer = (char *)malloc_type_malloc(v14, 0x3B85704BuLL);
    self->_minFilterIntermediatePooledBuffer = minFilterIntermediatePooledBuffer;
  }
  vImage_Error v22 = vImageMin_PlanarF(&src, &v23, minFilterIntermediatePooledBuffer, 0, 0, a4, a4, 0x10u);
  kdebug_trace();
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(v13, 0);
  if (v22)
  {
    CVPixelBufferRelease(v13);
    return -6660;
  }
  else
  {
    int result = 0;
    *a5 = v13;
  }
  return result;
}

- (id)_fullDescription
{
  long long v3 = (void *)MEMORY[0x1E4F28E78];
  v11.receiver = self;
  v11.super_class = (Class)ARPersonOcclusionTechnique;
  objc_super v4 = [(ARTechnique *)&v11 _fullDescription];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  id v6 = CVPixelBufferPoolGetPixelBufferAttributes(self->_depthPixelBufferPool);
  uint64_t v7 = [v6 description];
  uint64_t v8 = [v7 description];
  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v5 appendFormat:@"\tDepthPixelBufferPool attr: %@\n", v9];

  return v5;
}

- (void).cxx_destruct
{
  cntrl = self->_varExpFilter.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end