@interface BWPortraitAutoSuggest
+ (void)initialize;
- (BOOL)portTypeIsFFC;
- (BOOL)runAutoSuggestionWithSampleBuffer:(opaqueCMSampleBuffer *)a3 portraitSceneMonitorStatus:(int *)a4;
- (BOOL)shallowDepthOfFieldRenderingEnabled;
- (BWPortraitAutoSuggest)initWithTuningParameters:(id)a3;
- (id)getFilteredDetectedObjects:(void *)a3 detectedFacesArray:;
- (uint64_t)_adjustMetadataOfSampleBuffer:(uint64_t)result;
- (uint64_t)_updateFrameRateDependantParams:(uint64_t)result;
- (uint64_t)perFrameObjectValidity:(unint64_t)a3 originalFrameWidth:(unint64_t)a4 originalFrameHeight:(unint64_t)a5 frameWidth:(unint64_t)a6 frameHeight:(double)a7 finalCropRect:(double)a8;
- (uint64_t)processSbuf:(unint64_t)a1;
- (uint64_t)temporalObjectValidity:(uint64_t)result;
- (uint64_t)updateAbsentTrackers:(uint64_t)a1;
- (uint64_t)updateTrackers:(void *)a3 currentTracker:;
- (unint64_t)_pruneTrackerArrays:(unint64_t)result;
- (void)dealloc;
- (void)setPortTypeIsFFC:(BOOL)a3;
- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3;
@end

@implementation BWPortraitAutoSuggest

- (BOOL)runAutoSuggestionWithSampleBuffer:(opaqueCMSampleBuffer *)a3 portraitSceneMonitorStatus:(int *)a4
{
  -[BWPortraitAutoSuggest _updateFrameRateDependantParams:]((uint64_t)self, a3);
  -[BWPortraitAutoSuggest processSbuf:]((unint64_t)self, a3);
  if ((*a4 | 8) == 9)
  {
    if (self->_shallowDepthOfFieldRenderingEnabled)
    {
      if (self->_lastDoSuggest) {
        int v7 = 13;
      }
      else {
        int v7 = 14;
      }
      if (self->_lastDoSuggest) {
        int v8 = 13;
      }
      else {
        int v8 = 12;
      }
      if (self->_portTypeIsFFC) {
        int v9 = v8;
      }
      else {
        int v9 = v7;
      }
    }
    else if (self->_lastDoSuggest)
    {
      int v9 = 11;
    }
    else
    {
      int v9 = 12;
    }
    *a4 = v9;
  }
  -[BWPortraitAutoSuggest _adjustMetadataOfSampleBuffer:]((uint64_t)self, a3);
  return 1;
}

- (uint64_t)processSbuf:(unint64_t)a1
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
    v6 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
    CGRect rect = *(CGRect *)ymmword_1A5F0C220;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53260]], &rect);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    size_t Width = CVPixelBufferGetWidth(ImageBuffer);
    int v8 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    size_t Height = CVPixelBufferGetHeight(v8);
    CGSize size = rect.size;
    v60 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (v5)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      obuint64_t j = -[BWPortraitAutoSuggest getFilteredDetectedObjects:detectedFacesArray:](a1, v5, v6);
      uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
      if (v61)
      {
        double v10 = (double)Width;
        double v11 = (double)Height;
        uint64_t v57 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v61; ++i)
          {
            if (*(void *)v73 != v57) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            uint64_t v14 = [v13 combinedTrackerID];
            objc_msgSend(v60, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v14));
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            v15 = *(void **)(a1 + 120);
            uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v78 count:16];
            if (!v16) {
              goto LABEL_18;
            }
            uint64_t v17 = v16;
            uint64_t v62 = i;
            id v18 = 0;
            uint64_t v19 = *(void *)v69;
            int v20 = -1;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v69 != v19) {
                  objc_enumerationMutation(v15);
                }
                v22 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                if ([v22 combinedTrackerID] == v14)
                {
                  int v20 = [*(id *)(a1 + 120) indexOfObject:v22];
                  id v18 = v22;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v68 objects:v78 count:16];
            }
            while (v17);
            uint64_t i = v62;
            if (v20 == -1)
            {
LABEL_18:
              id v18 = (id)objc_opt_new();
              [v18 setCombinedTrackerID:v14];
              int v20 = -1;
            }
            [v13 rect];
            double v24 = v23;
            [v13 rect];
            double v26 = v25;
            [v13 rect];
            double v28 = v27;
            [v13 rect];
            double v30 = v29;
            if (-[BWPortraitAutoSuggest perFrameObjectValidity:originalFrameWidth:originalFrameHeight:frameWidth:frameHeight:finalCropRect:](a1, v13, Width, Height, (unint64_t)(size.width * (double)Width), (unint64_t)(size.height * (double)Height), rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)&& -[BWPortraitAutoSuggest temporalObjectValidity:](a1, v18))
            {
              int v31 = [v18 validObjectCounter];
              int v32 = *(_DWORD *)(a1 + 28);
              if (v31 + 1 < (2 * v32))
              {
                int v33 = 1;
LABEL_25:
                uint64_t v34 = [v18 validObjectCounter] + v33;
                goto LABEL_28;
              }
              uint64_t v34 = (2 * v32);
            }
            else
            {
              if ((int)[v18 validObjectCounter] >= 1)
              {
                int v33 = -1;
                goto LABEL_25;
              }
              uint64_t v34 = 0;
            }
LABEL_28:
            float v35 = v24 * v10;
            float v36 = v26 * v11;
            float v37 = v28 * v10;
            float v38 = v30 * v11;
            [v18 setValidObjectCounter:v34];
            v67[0] = (float)((float)(v37 * 0.5) + v35);
            v67[1] = (float)((float)(v38 * 0.5) + v36);
            v39 = (void *)[v18 centersIn];
            objc_msgSend(v39, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", v67, "{CGPoint=dd}"));
            v40 = (void *)[v18 objectAreaIn];
            *(float *)&double v41 = v37 * v38;
            objc_msgSend(v40, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v41));
            [v13 rect];
            objc_msgSend(v18, "setRect:");
            -[BWPortraitAutoSuggest updateTrackers:currentTracker:](a1, v20, v18);
          }
          uint64_t v61 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
        }
        while (v61);
      }
    }
    -[BWPortraitAutoSuggest updateAbsentTrackers:](a1, v60);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v42 = *(void **)(a1 + 120);
    uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v77 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      unsigned int v45 = 0;
      uint64_t v46 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v64 != v46) {
            objc_enumerationMutation(v42);
          }
          v48 = *(void **)(*((void *)&v63 + 1) + 8 * k);
          if ((int)[v48 validObjectCounter] > (int)v45) {
            unsigned int v45 = [v48 validObjectCounter];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v63 objects:v77 count:16];
      }
      while (v44);
      unsigned int v49 = *(_DWORD *)(a1 + 84);
      if (*(_DWORD *)(a1 + 16) < v45)
      {
        if (v45 <= v49) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      if (v45 > v49)
      {
        if (v45 != 2 * *(_DWORD *)(a1 + 28))
        {
          int v50 = *(_DWORD *)(a1 + 12);
LABEL_51:
          *(_DWORD *)(a1 + 12) = v50;
          if (v50 <= (int)(*(_DWORD *)(a1 + 88) - v49))
          {
            char v52 = *(unsigned char *)(a1 + 11);
          }
          else
          {
            *(_DWORD *)(a1 + 20) = 0;
            char v52 = 1;
          }
          goto LABEL_54;
        }
LABEL_45:
        int v50 = *(_DWORD *)(a1 + 12) + 1;
        goto LABEL_51;
      }
    }
    else
    {
      unsigned int v45 = 0;
    }
LABEL_46:
    unsigned int v51 = *(_DWORD *)(a1 + 20) + 1;
    *(_DWORD *)(a1 + 20) = v51;
    if (v51 > *(_DWORD *)(a1 + 92))
    {
      char v52 = 0;
      int v53 = *(_DWORD *)(a1 + 36);
      *(_DWORD *)(a1 + 84) = *(_DWORD *)(a1 + 28);
      *(_DWORD *)(a1 + 88) = v53;
      *(_DWORD *)(a1 + 12) = 0;
      *(unsigned char *)(a1 + 10) = 0;
LABEL_55:
      *(unsigned char *)(a1 + 11) = v52;
      *(_DWORD *)(a1 + 16) = v45;
      return 0;
    }
    char v52 = *(unsigned char *)(a1 + 11);
    if (v52)
    {
      int v54 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)(a1 + 84) = v54;
      *(_DWORD *)(a1 + 88) = v54;
    }
LABEL_54:
    *(unsigned char *)(a1 + 10) = v52;
    goto LABEL_55;
  }
  return 0;
}

- (uint64_t)updateAbsentTrackers:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 120) count];
    if (v4 - 1 >= 0)
    {
      uint64_t v5 = v4;
      do
      {
        if ((objc_msgSend(a2, "containsObject:", objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", --v5), "combinedTrackerID"))) & 1) == 0)
        {
          if ((int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "validObjectCounter") < 2)uint64_t v6 = 0; {
          else
          }
            uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "validObjectCounter")- 1;
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "setValidObjectCounter:", v6);
          if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "objectAtIndexedSubscript:", v5), "validObjectCounter"))objc_msgSend(*(id *)(a1 + 120), "removeObjectAtIndex:", v5); {
        }
          }
      }
      while (v5 > 0);
    }
  }
  return 0;
}

- (uint64_t)_updateFrameRateDependantParams:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v4 = *MEMORY[0x1E4F53DA0];
    result = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DA0]), "intValue");
    LODWORD(v5) = 12.0;
    if ((int)result >= 13)
    {
      result = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4, v5), "intValue");
      *(float *)&double v5 = (float)result;
    }
    unsigned int v6 = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 24));
    *(_DWORD *)(v2 + 28) = v6;
    if (!*(_DWORD *)(v2 + 84)) {
      unsigned int v6 = 0;
    }
    *(_DWORD *)(v2 + 84) = v6;
    *(_DWORD *)(v2 + 36) = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 32));
    *(_DWORD *)(v2 + 44) = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 40));
    *(int32x2_t *)(v2 + 88) = vrev64_s32((int32x2_t)vcvt_u32_f32(vrndp_f32(vmul_n_f32(*(float32x2_t *)(v2 + 48), *(float *)&v5))));
    unsigned int v7 = vcvtps_u32_f32(*(float *)&v5 * *(float *)(v2 + 96));
    if (v7 <= 2) {
      unsigned int v7 = 2;
    }
    *(_DWORD *)(v2 + 100) = v7;
  }
  return result;
}

- (uint64_t)_adjustMetadataOfSampleBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC8]);
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F538A8]];
    uint64_t v5 = *MEMORY[0x1E4F538F8];
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F538F8]];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v7 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F538B8]];
    return [v7 setObject:v6 forKeyedSubscript:v5];
  }
  return result;
}

- (id)getFilteredDetectedObjects:(void *)a3 detectedFacesArray:
{
  obuint64_t j = a3;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  memset(&rect, 0, sizeof(rect));
  id v44 = (id)[MEMORY[0x1E4F1CA48] array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v36 = [a2 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v58;
    uint64_t v33 = *MEMORY[0x1E4F538F8];
    uint64_t v4 = *MEMORY[0x1E4F54180];
    uint64_t v5 = *MEMORY[0x1E4F538C8];
    uint64_t v41 = *MEMORY[0x1E4F538A8];
    uint64_t v40 = *MEMORY[0x1E4F538B8];
    uint64_t v39 = *MEMORY[0x1E4F53888];
    uint64_t v38 = *MEMORY[0x1E4F53E70];
    uint64_t v42 = *MEMORY[0x1E4F53D80];
    float v35 = a2;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v58 != v34) {
          objc_enumerationMutation(a2);
        }
        uint64_t v37 = v6;
        unsigned int v7 = *(void **)(*((void *)&v57 + 1) + 8 * v6);
        int v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v7, obj), "objectForKeyedSubscript:", v33);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v54 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              if ([v13 objectForKeyedSubscript:v4])
              {
                id v14 = (id)objc_opt_new();
                if ([v7 compare:v5])
                {
                  if ([v7 compare:v41])
                  {
                    if ([v7 compare:v40]) {
                      continue;
                    }
                    uint64_t v15 = 5;
                  }
                  else
                  {
                    uint64_t v15 = 3;
                  }
                  uint64_t v16 = v39;
                }
                else
                {
                  uint64_t v15 = 1;
                  uint64_t v16 = v38;
                }
                [v14 setObjectType:v15];
                objc_msgSend(v14, "setTrackerID:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", v16), "intValue"));
                objc_msgSend(v14, "setCombinedTrackerID:", (int)objc_msgSend(v14, "trackerID") | (unint64_t)(objc_msgSend(v14, "objectType") << 32));
                objc_msgSend(v14, "setConfidenceLevel:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", v42), "intValue"));
                CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v13 objectForKeyedSubscript:v4], &rect);
                objc_msgSend(v14, "setRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
                [v44 addObject:v14];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v64 count:16];
          }
          while (v10);
        }
        uint64_t v6 = v37 + 1;
        a2 = v35;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v36);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16, obj);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v50;
    uint64_t v20 = *MEMORY[0x1E4F53E70];
    uint64_t v43 = *MEMORY[0x1E4F53D80];
    uint64_t v21 = *MEMORY[0x1E4F54180];
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(obja);
        }
        double v23 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        int v24 = objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", v20), "intValue");
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v25 = [v44 countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v46;
LABEL_32:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v46 != v27) {
              objc_enumerationMutation(v44);
            }
            if ([*(id *)(*((void *)&v45 + 1) + 8 * v28) trackerID] == v24) {
              break;
            }
            if (v26 == ++v28)
            {
              uint64_t v26 = [v44 countByEnumeratingWithState:&v45 objects:v62 count:16];
              if (v26) {
                goto LABEL_32;
              }
              goto LABEL_38;
            }
          }
        }
        else
        {
LABEL_38:
          id v29 = (id)objc_opt_new();
          [v29 setObjectType:1];
          objc_msgSend(v29, "setTrackerID:", objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", v20), "intValue"));
          objc_msgSend(v29, "setCombinedTrackerID:", (int)objc_msgSend(v29, "trackerID") | (unint64_t)(objc_msgSend(v29, "objectType") << 32));
          objc_msgSend(v29, "setConfidenceLevel:", objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", v43), "intValue"));
          CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v23 objectForKeyedSubscript:v21], &rect);
          objc_msgSend(v29, "setRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          [v44 addObject:v29];
        }
      }
      uint64_t v18 = [obja countByEnumeratingWithState:&v49 objects:v63 count:16];
    }
    while (v18);
  }
  return v44;
}

- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3
{
  self->_shallowDepthOfFieldRenderingEnabled = a3;
}

- (void)setPortTypeIsFFC:(BOOL)a3
{
  self->_portTypeIsFFC = a3;
}

- (BWPortraitAutoSuggest)initWithTuningParameters:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)BWPortraitAutoSuggest;
  uint64_t v4 = [(BWPortraitAutoSuggest *)&v26 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", objc_msgSend(a3, "objectForKeyedSubscript:", @"PortraitAutoSuggest"));
    *(_WORD *)&v4->_doSuggest = 0;
    v4->_validityCounter = 0;
    v4->_invalidityCounter = 0;
    if ([v5 objectForKeyedSubscript:@"ObjectFrameRatio"]) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ObjectFrameRatio"), "floatValue");
    }
    else {
      float v6 = 3.0;
    }
    v4->_objectFrameRatio = v6;
    if ([v5 objectForKeyedSubscript:@"MarginInRatioWidth"]) {
      int v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"MarginInRatioWidth"), "intValue");
    }
    else {
      int v7 = 13;
    }
    v4->_marginInRatiosize_t Width = v7;
    if ([v5 objectForKeyedSubscript:@"MarginInRatioHeight"]) {
      int v8 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"MarginInRatioHeight"), "intValue");
    }
    else {
      int v8 = 13;
    }
    v4->_marginInRatiosize_t Height = v8;
    if ([v5 objectForKeyedSubscript:@"MarginOutRatioWidth"]) {
      int v9 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"MarginOutRatioWidth"), "intValue");
    }
    else {
      int v9 = 77;
    }
    v4->_marginOutRatiosize_t Width = v9;
    if ([v5 objectForKeyedSubscript:@"MarginOutRatioHeight"]) {
      int v10 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"MarginOutRatioHeight"), "intValue");
    }
    else {
      int v10 = 77;
    }
    v4->_marginOutRatiosize_t Height = v10;
    if ([v5 objectForKeyedSubscript:@"FadeValidThCst"]) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"FadeValidThCst"), "floatValue");
    }
    else {
      float v11 = 0.5;
    }
    v4->_fadeValidThCst = v11;
    if ([v5 objectForKeyedSubscript:@"FadeInvalidThCst"]) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"FadeInvalidThCst"), "floatValue");
    }
    else {
      float v12 = 2.0;
    }
    v4->_fadeInvalidThCst = v12;
    uint64_t v13 = [v5 objectForKeyedSubscript:@"xObjectCenterStdTh"];
    int v14 = 973279855;
    LODWORD(v15) = 973279855;
    if (v13) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"xObjectCenterStdTh", v15), "floatValue");
    }
    v4->_xObjectCenterStdTh = *(float *)&v15;
    if ([v5 objectForKeyedSubscript:@"yObjectCenterStdTh"])
    {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"yObjectCenterStdTh"), "floatValue");
      int v14 = v16;
    }
    LODWORD(v4->_yObjectCenterStdTh) = v14;
    if ([v5 objectForKeyedSubscript:@"MaxMotionThreshold"]) {
      int v17 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"MaxMotionThreshold"), "intValue");
    }
    else {
      int v17 = 30;
    }
    v4->_maxMotionThreshold = v17;
    if ([v5 objectForKeyedSubscript:@"MinMotionThreshold"]) {
      int v18 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"MinMotionThreshold"), "intValue");
    }
    else {
      int v18 = 15;
    }
    v4->_minMotionThreshold = v18;
    if ([v5 objectForKeyedSubscript:@"FadeValidThInvalidityActive"]) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"FadeValidThInvalidityActive"), "floatValue");
    }
    else {
      float v19 = 0.5;
    }
    v4->_fadeValidThInvalidityActiveSec = v19;
    if ([v5 objectForKeyedSubscript:@"FadeValidThInvalidityBuild"]) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"FadeValidThInvalidityBuild"), "floatValue");
    }
    else {
      float v20 = 0.0;
    }
    v4->_fadeValidThInvalidityBuildSec = v20;
    if ([v5 objectForKeyedSubscript:@"ValidObjectIntervalTh"]) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ValidObjectIntervalTh"), "floatValue");
    }
    else {
      int v21 = 1051372203;
    }
    LODWORD(v4->_validObjectIntervalThSec) = v21;
    if ([v5 objectForKeyedSubscript:@"ObjectCentersLookbackInterval"]) {
      objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ObjectCentersLookbackInterval"), "floatValue");
    }
    else {
      int v22 = 1042983595;
    }
    LODWORD(v4->_objectCentersLookbackIntervalSec) = v22;
    if ([v5 objectForKeyedSubscript:@"ObjectBoxFrameAreaValidityRatio"]) {
      int v23 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ObjectBoxFrameAreaValidityRatio"), "intValue");
    }
    else {
      int v23 = 250;
    }
    v4->_objectBoxFrameAreaValidityRatio = v23;
    if ([v5 objectForKeyedSubscript:@"ObjectBoxFrameAreaValidityRatioWhenOn"]) {
      int v24 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"ObjectBoxFrameAreaValidityRatioWhenOn"), "intValue");
    }
    else {
      int v24 = 260;
    }
    v4->_objectBoxFrameAreaValidityRatioWhenOn = v24;
    v4->_validObjectCounterOld = 0;
    v4->_trackers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_temporalValidityTh = 1000;
  }
  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  self->_trackers = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWPortraitAutoSuggest;
  [(BWPortraitAutoSuggest *)&v3 dealloc];
}

- (uint64_t)perFrameObjectValidity:(unint64_t)a3 originalFrameWidth:(unint64_t)a4 originalFrameHeight:(unint64_t)a5 frameWidth:(unint64_t)a6 frameHeight:(double)a7 finalCropRect:(double)a8
{
  if (result)
  {
    uint64_t v17 = result;
    [a2 rect];
    double v19 = (double)a3;
    float v20 = (v18 - a7) * (double)a3;
    [a2 rect];
    double v22 = v21;
    [a2 rect];
    double v24 = v23;
    [a2 rect];
    double v26 = v25;
    [a2 rect];
    double v28 = v27;
    [a2 rect];
    result = 0;
    if (v20 >= 0.0)
    {
      float v50 = v20;
      double v30 = (double)a4;
      float v31 = (v26 - a8) * (double)a4;
      if (v31 >= 0.0)
      {
        float v32 = (v22 + v24 - a7) * v19;
        if (a9 * v19 >= v32)
        {
          float v33 = (v28 + v29 - a8) * v30;
          if (a10 * v30 >= v33)
          {
            objc_msgSend(a2, "rect", v33, a10 * v30);
            double v35 = v34;
            [a2 rect];
            float v37 = v36 * v30;
            unsigned int v38 = a6 / *(_DWORD *)(v17 + 72);
            uint64_t v39 = 68;
            if (*(unsigned char *)(v17 + 11)) {
              uint64_t v39 = 76;
            }
            uint64_t v40 = 64;
            if (!*(unsigned char *)(v17 + 11)) {
              uint64_t v40 = 60;
            }
            unsigned int v41 = a5 / *(_DWORD *)(v17 + v39);
            if (v50 <= (float)v41 || v31 <= (float)v38)
            {
              BOOL v44 = 0;
            }
            else
            {
              float v43 = (float)(a6 - v38);
              BOOL v44 = v32 < (float)(a5 - v41);
              if (v33 >= v43) {
                BOOL v44 = 0;
              }
            }
            float v45 = *(float *)(v17 + 56);
            if ((float)((float)a6 / v45) <= v37)
            {
              if (!*(unsigned char *)(v17 + 9)) {
                goto LABEL_31;
              }
            }
            else
            {
              float v46 = v35 * v19;
              BOOL v47 = (float)(v46 * v37) < (float)((float)(a6 * a5) / (float)*(unsigned int *)(v17 + v40));
              float v48 = (float)a5 / v45;
              int v49 = !v47 && v44;
              if (*(unsigned char *)(v17 + 9))
              {
                result = 0;
                if (v48 <= v46 || ((v49 ^ 1) & 1) != 0) {
                  return result;
                }
                goto LABEL_31;
              }
              if (v48 <= v46) {
                int v49 = 1;
              }
              if (v49 == 1)
              {
LABEL_31:
                if ([a2 objectType] == 1
                  || [a2 objectType] == 3
                  || [a2 objectType] == 5)
                {
                  return 1;
                }
              }
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)temporalObjectValidity:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", objc_msgSend(a2, "centersIn"));
    if (*(_DWORD *)(v3 + 100) < 2u) {
      return 1;
    }
    uint64_t v5 = v4;
    if ([v4 count] < (unint64_t)*(unsigned int *)(v3 + 100))
    {
      objc_msgSend((id)objc_msgSend(a2, "centerVx"), "addObject:", &unk_1EFAFF588);
      objc_msgSend((id)objc_msgSend(a2, "centerVy"), "addObject:", &unk_1EFAFF588);
      objc_msgSend((id)objc_msgSend(a2, "centerDx"), "addObject:", &unk_1EFAFF588);
      objc_msgSend((id)objc_msgSend(a2, "centerDy"), "addObject:", &unk_1EFAFF588);
      return 0;
    }
    float v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    int v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        double v56 = 0.0;
        objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v8, 0), "getValue:", &v55);
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v55));
        objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v56));
        ++v8;
      }
      while ([v5 count] > v8);
    }
    float v9 = stdDeviation(v6);
    float v10 = stdDeviation(v7);
    float v11 = (void *)[a2 centerVx];
    *(float *)&double v12 = v9;
    objc_msgSend(v11, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v12));
    uint64_t v13 = (void *)[a2 centerVy];
    *(float *)&double v14 = v10;
    objc_msgSend(v13, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v14));
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 1), "floatValue");
    float v16 = v15;
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 2), "floatValue");
    float v18 = vabds_f32(v16, v17);
    objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 1), "floatValue");
    float v20 = v19;
    objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 2), "floatValue");
    float v22 = vabds_f32(v20, v21);
    double v23 = (void *)[a2 centerDx];
    *(float *)&double v24 = v18;
    objc_msgSend(v23, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v24));
    double v25 = (void *)[a2 centerDy];
    *(float *)&double v26 = v22;
    objc_msgSend(v25, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v26));
    float v27 = (float)*(unsigned int *)(v3 + 108);
    float v28 = (float)*(unsigned int *)(v3 + 104);
    float v29 = *(float *)(v3 + 112);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
    if ((float)(v29 * v30) <= v28)
    {
      float v32 = *(float *)(v3 + 112);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
      float v31 = v32 * v33;
    }
    else
    {
      float v31 = (float)*(unsigned int *)(v3 + 104);
    }
    if (v31 >= v27)
    {
      float v35 = (float)*(unsigned int *)(v3 + 104);
      float v36 = *(float *)(v3 + 112);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
      if ((float)(v36 * v37) <= v35)
      {
        float v39 = *(float *)(v3 + 112);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
        float v38 = v39 * v40;
LABEL_17:
        float v41 = (float)*(unsigned int *)(v3 + 108);
        float v42 = (float)*(unsigned int *)(v3 + 104);
        float v43 = *(float *)(v3 + 116);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
        if ((float)(v43 * v44) <= v42)
        {
          float v46 = *(float *)(v3 + 116);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
          float v45 = v46 * v47;
        }
        else
        {
          float v45 = (float)*(unsigned int *)(v3 + 104);
        }
        if (v45 >= v41)
        {
          float v49 = (float)*(unsigned int *)(v3 + 104);
          float v50 = *(float *)(v3 + 116);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
          if ((float)(v50 * v51) <= v49)
          {
            float v53 = *(float *)(v3 + 116);
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "lastObject"), "floatValue");
            float v52 = v53 * v54;
            return v10 <= v52 && v9 <= v38;
          }
          unsigned int v48 = *(_DWORD *)(v3 + 104);
        }
        else
        {
          unsigned int v48 = *(_DWORD *)(v3 + 108);
        }
        float v52 = (float)v48;
        return v10 <= v52 && v9 <= v38;
      }
      unsigned int v34 = *(_DWORD *)(v3 + 104);
    }
    else
    {
      unsigned int v34 = *(_DWORD *)(v3 + 108);
    }
    float v38 = (float)v34;
    goto LABEL_17;
  }
  return result;
}

- (uint64_t)updateTrackers:(void *)a3 currentTracker:
{
  if (a1)
  {
    -[BWPortraitAutoSuggest _pruneTrackerArrays:](a1, a3);
    float v6 = *(void **)(a1 + 120);
    if (a2 == -1) {
      [v6 addObject:a3];
    }
    else {
      [v6 setObject:a3 atIndexedSubscript:a2];
    }
  }
  return 0;
}

- (unint64_t)_pruneTrackerArrays:(unint64_t)result
{
  if (result)
  {
    unint64_t v3 = result;
    if (objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "count") > (unint64_t)*(unsigned int *)(result + 100)) {
      objc_msgSend(a2, "setObjectAreaIn:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "objectAreaIn"), "count") - *(unsigned int *)(v3 + 100))));
    }
    if (objc_msgSend((id)objc_msgSend(a2, "centersIn"), "count") > (unint64_t)*(unsigned int *)(v3 + 100)) {
      objc_msgSend(a2, "setCentersIn:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centersIn"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centersIn"), "count") - *(unsigned int *)(v3 + 100))));
    }
    result = objc_msgSend((id)objc_msgSend(a2, "centerVx"), "count");
    if (result > *(unsigned int *)(v3 + 100))
    {
      objc_msgSend(a2, "setCenterVx:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerVx"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerVx"), "count") - *(unsigned int *)(v3 + 100))));
      objc_msgSend(a2, "setCenterVy:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerVy"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerVy"), "count") - *(unsigned int *)(v3 + 100))));
      objc_msgSend(a2, "setCenterDx:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerDx"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerDx"), "count") - *(unsigned int *)(v3 + 100))));
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "centerDy"), "subarrayWithRange:", objc_msgSend((id)objc_msgSend(a2, "centerDy"), "count") - *(unsigned int *)(v3 + 100)));
      return [a2 setCenterDy:v4];
    }
  }
  return result;
}

- (BOOL)shallowDepthOfFieldRenderingEnabled
{
  return self->_shallowDepthOfFieldRenderingEnabled;
}

- (BOOL)portTypeIsFFC
{
  return self->_portTypeIsFFC;
}

@end