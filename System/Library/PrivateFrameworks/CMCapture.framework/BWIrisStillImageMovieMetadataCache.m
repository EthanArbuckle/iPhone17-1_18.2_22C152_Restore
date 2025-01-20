@interface BWIrisStillImageMovieMetadataCache
- (id)copyAndClearStillImageTransformDataForSettingsID:(id)a3;
- (void)cacheStillImageTransformDataFromMetadata:(id)a3 transformReferenceDimensions:(id)a4;
- (void)cacheStillImageVideoToPhotoTransform:(id)a3 forSettingsID:(id)a4;
@end

@implementation BWIrisStillImageMovieMetadataCache

- (void)cacheStillImageTransformDataFromMetadata:(id)a3 transformReferenceDimensions:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F55D28];
  uint64_t v8 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F55D28]];
  uint64_t v9 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F52DC0]];
  uint64_t v10 = [a3 objectForKeyedSubscript:@"FinalCropRectForIrisStillImageMovieMetadataCache"];
  if (!v10) {
    uint64_t v10 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F53260]];
  }
  uint64_t v11 = [a3 objectForKeyedSubscript:@"PreviewShiftForIrisStillImageMovieMetadataCache"];
  if (v8) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    uint64_t v13 = v11;
    pthread_mutex_lock((pthread_mutex_t *)self->super._propertyMutex);
    uint64_t v14 = [(NSMutableDictionary *)self->super._cache objectForKeyedSubscript:v9];
    v15 = (void *)v14;
    if (!v14)
    {
      v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->super._cache setObject:v15 forKeyedSubscript:v9];
    }
    [v15 setObject:v8 forKeyedSubscript:v7];
    [v15 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F53260]];
    if (FigCaptureVideoDimensionsAreValid(*(void *)&a4))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a4), @"VitalityTransformReferenceWidth");
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", HIDWORD(*(unint64_t *)&a4)), @"VitalityTransformReferenceHeight");
    }
    [v15 setObject:v13 forKeyedSubscript:@"PreviewShiftTranslation"];
    propertyMutex = self->super._propertyMutex;
    pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
  }
}

- (void)cacheStillImageVideoToPhotoTransform:(id)a3 forSettingsID:(id)a4
{
  if (a3 && a4)
  {
    pthread_mutex_lock((pthread_mutex_t *)self->super._propertyMutex);
    uint64_t v7 = (void *)[(NSMutableDictionary *)self->super._cache objectForKeyedSubscript:a4];
    if (!v7)
    {
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->super._cache setObject:v7 forKeyedSubscript:a4];
    }
    [v7 setObject:a3 forKeyedSubscript:@"VideoToPhotoTransform"];
    propertyMutex = self->super._propertyMutex;
    pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
  }
}

- (id)copyAndClearStillImageTransformDataForSettingsID:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v3 = [(BWSimpleCache *)self copyAndClearObjectForKey:a3];
  v4 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F55D28]];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"VideoToPhotoTransform"];
  uint64_t v6 = [v3 objectForKeyedSubscript:@"PreviewShiftTranslation"];
  if (v4)
  {
    CFDictionaryRef v7 = (const __CFDictionary *)v6;
    if (v5 | v6)
    {
      long long v74 = 0u;
      float64x2_t v75 = 0u;
      int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
      __asm { FMOV            V0.2D, #1.0 }
      if (!CGRectIfPresent)
      {
        long long v74 = 0uLL;
        float64x2_t v75 = _Q0;
      }
      float64x2_t v64 = _Q0;
      unsigned int v14 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"VitalityTransformReferenceWidth"), "intValue");
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"VitalityTransformReferenceHeight"), "intValue");
      uint64_t v16 = v15 << 32;
      uint64_t v17 = v14;
      if (FigCaptureVideoDimensionsAreValid(v14 | ((unint64_t)v15 << 32)))
      {
        uint64_t v18 = v16;
      }
      else
      {
        uint64_t v17 = 1920;
        uint64_t v18 = 0x5A000000000;
      }
      unint64_t v19 = [v4 length];
      v20 = (float32x4_t *)MEMORY[0x1E4F14998];
      if (v19 <= 0x23)
      {
        float32x4_t v29 = *(float32x4_t *)(MEMORY[0x1E4F14998] + 16);
        float32x4_t v76 = *(float32x4_t *)MEMORY[0x1E4F14998];
        float32x4_t v77 = v29;
        float32x4_t v78 = *(float32x4_t *)(MEMORY[0x1E4F14998] + 32);
      }
      else
      {
        uint64_t v21 = [v4 bytes];
        float32x4_t v22 = v20[1];
        float32x4_t v76 = *v20;
        float32x4_t v77 = v22;
        float32x4_t v78 = v20[2];
        if (v21)
        {
          for (uint64_t i = 0; i != 3; ++i)
          {
            uint64_t v24 = 0;
            v25 = (_OWORD *)&v76.f32[4 * i];
            long long v26 = *v25;
            v27 = (int *)v21;
            do
            {
              int v28 = *v27;
              v27 += 3;
              long long v72 = v26;
              *(_DWORD *)((unint64_t)&v72 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3))) = v28;
              long long v26 = v72;
              ++v24;
            }
            while (v24 != 3);
            *((_DWORD *)v25 + 2) = DWORD2(v72);
            *(void *)v25 = v26;
            v21 += 4;
          }
        }
      }
      float32x4_t v30 = v76;
      float32x4_t v31 = v77;
      float32x4_t v32 = v78;
      v30.i32[3] = 0;
      v31.i32[3] = 0;
      v32.i32[3] = 0;
      if (v5)
      {
        float32x4_t v65 = v31;
        float32x4_t v67 = v30;
        float32x4_t v69 = v32;
        uint64_t v33 = 0;
        float32x4_t v34 = v20[1];
        float32x4_t v76 = *v20;
        float32x4_t v77 = v34;
        float32x4_t v78 = v20[2];
        do
        {
          uint64_t v35 = 0;
          uint64_t v36 = v33;
          do
          {
            objc_msgSend((id)objc_msgSend((id)v5, "objectAtIndexedSubscript:", v36), "floatValue");
            v76.i32[4 * v33 + v35++] = v37;
            v36 += 3;
          }
          while (v35 != 3);
          ++v33;
        }
        while (v33 != 3);
        float32x4_t v38 = v76;
        float32x4_t v39 = v77;
        float32x4_t v40 = v78;
        v38.i32[3] = 0;
        v39.i32[3] = 0;
        v40.i32[3] = 0;
        *(double *)v41.i64 = scaleHomography(v38, v39, v40, v75.f64[0], v75.f64[1]);
        *(double *)v44.i64 = bwsc_convertHomographyToPixelCoordinates(v18 | v17, v41, v42, v43);
        uint64_t v47 = 0;
        float32x4_t v79 = v67;
        float32x4_t v80 = v65;
        float32x4_t v81 = v69;
        float32x4_t v76 = 0u;
        float32x4_t v77 = 0u;
        float32x4_t v78 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v76 + v47 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)((char *)&v79 + v47 * 4))), v45, *(float32x2_t *)&v79.f32[v47], 1), v46, *(float32x4_t *)((char *)&v79 + v47 * 4), 2);
          v47 += 4;
        }
        while (v47 != 12);
        float32x4_t v30 = v76;
        float32x4_t v31 = v77;
        float32x4_t v32 = v78;
      }
      if (v7)
      {
        float32x4_t v63 = v20[2];
        float32x4_t v68 = v30;
        float32x4_t v70 = v32;
        CGPoint point = (CGPoint)*MEMORY[0x1E4F1DAD8];
        float32x4_t v66 = v31;
        CGPointMakeWithDictionaryRepresentation(v7, &point);
        v48.i64[1] = *(void *)&point.y;
        *(float32x2_t *)v48.f32 = vcvt_f32_f64((float64x2_t)point);
        v49.i64[0] = vnegq_f32(v48).u64[0];
        v49.i64[1] = v63.i64[1];
        float64x2_t v75 = vdivq_f64(v64, v75);
        *(double *)v50.i64 = scaleHomography(*v20, v20[1], v49, v75.f64[0], v75.f64[1]);
        *(double *)v53.i64 = bwsc_convertHomographyToPixelCoordinates(v18 | v17, v50, v51, v52);
        uint64_t v56 = 0;
        float32x4_t v79 = v68;
        float32x4_t v80 = v66;
        float32x4_t v81 = v70;
        float32x4_t v76 = 0u;
        float32x4_t v77 = 0u;
        float32x4_t v78 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v76 + v56 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(_OWORD *)((char *)&v79 + v56 * 4))), v54, *(float32x2_t *)&v79.f32[v56], 1), v55, *(float32x4_t *)((char *)&v79 + v56 * 4), 2);
          v56 += 4;
        }
        while (v56 != 12);
        float32x4_t v30 = v76;
        float32x4_t v31 = v77;
        float32x4_t v32 = v78;
      }
      uint64_t v57 = 0;
      float32x4_t v76 = v30;
      float32x4_t v77 = v31;
      v58 = &v79;
      float32x4_t v78 = v32;
      do
      {
        uint64_t v59 = 0;
        long long v60 = *((_OWORD *)&v76 + v57);
        v61 = v58;
        do
        {
          long long v71 = v60;
          v61->i32[0] = *(_DWORD *)((unint64_t)&v71 & 0xFFFFFFFFFFFFFFF3 | (4 * (v59 & 3)));
          v61 = (float32x4_t *)((char *)v61 + 12);
          ++v59;
        }
        while (v59 != 3);
        ++v57;
        v58 = (float32x4_t *)((char *)v58 + 4);
      }
      while (v57 != 3);
      v4 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v79 length:36];
    }
  }
  return v4;
}

@end