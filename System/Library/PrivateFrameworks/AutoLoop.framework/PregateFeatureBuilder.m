@interface PregateFeatureBuilder
- (ExifMetadataExtractor)irisStillExtractor;
- (IrisVideoMetadataExtractor)irisVideoExtractor;
- (NSArray)facesArray;
- (NSArray)movieMetadata;
- (NSArray)stdProcessInputKeysArray;
- (NSDictionary)stillImageMetadata;
- (NSDictionary)videoTrackMetadataDict;
- (NSMutableDictionary)featuresDict;
- (NSMutableDictionary)fullFeaturesDict;
- (PregateFeatureBuilder)init;
- (id).cxx_construct;
- (int)fillVector:(void *)a3 withPerFrameStats:(id)a4;
- (int)processBlurVectors;
- (int)processFullDictionary:(BOOL)a3;
- (int)processMovieMetadata;
- (int)processOffsetVectors;
- (int)processPresentationTimes;
- (int)processStandardPerFrameKeys;
- (int)processStill;
- (int)processStillImageFaceData;
- (int)processStillImageMetadata;
- (int)processStillInternal;
- (int)processVidTrackMetadata;
- (int)processVideo;
- (int)processVideoFaceInfo;
- (int)processVideoInternal;
- (int)readPerFrameMetadataToArrays;
- (int)standardProcessKey:(id)a3 addToDictionary:(id)a4;
- (vector<CMTime,)frameTimes;
- (vector<FloatPoint,)frameBlurVectors;
- (vector<FloatPoint,)frameOffsets;
- (void)buildFullDictionary;
- (void)setFacesArray:(id)a3;
- (void)setFrameBlurVectors:()vector<FloatPoint;
- (void)setFrameOffsets:()vector<FloatPoint;
- (void)setFrameTimes:()vector<CMTime;
- (void)setIrisStillExtractor:(id)a3;
- (void)setIrisVideoExtractor:(id)a3;
- (void)setMovieMetadata:(id)a3;
- (void)setStdProcessInputKeysArray:(id)a3;
- (void)setStillImageMetadata:(id)a3;
- (void)setVideoTrackMetadataDict:(id)a3;
@end

@implementation PregateFeatureBuilder

- (int)fillVector:(void *)a3 withPerFrameStats:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v29 = a4;
  *((void *)a3 + 1) = *(void *)a3;
  movieMetadata = self->_movieMetadata;
  if (movieMetadata)
  {
    sub_1DD3C604C((void **)a3, [(NSArray *)movieMetadata count]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = self->_movieMetadata;
    int v7 = 0;
    uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v12 = [v11 objectForKeyedSubscript:@"InterpolatedFrame"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v13 = [v12 BOOLValue];
          }
          else {
            int v13 = 0;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [v11 objectForKeyedSubscript:v29];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v14 floatValue];
              int v16 = v15;
              v18 = (_DWORD *)*((void *)a3 + 1);
              unint64_t v17 = *((void *)a3 + 2);
              if ((unint64_t)v18 >= v17)
              {
                v20 = *(_DWORD **)a3;
                uint64_t v21 = ((uint64_t)v18 - *(void *)a3) >> 2;
                unint64_t v22 = v21 + 1;
                if ((unint64_t)(v21 + 1) >> 62) {
                  sub_1DD3A9B50();
                }
                uint64_t v23 = v17 - (void)v20;
                if (v23 >> 1 > v22) {
                  unint64_t v22 = v23 >> 1;
                }
                if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v24 = v22;
                }
                if (v24)
                {
                  v25 = (char *)sub_1DD3B2EF4((uint64_t)a3 + 16, v24);
                  v20 = *(_DWORD **)a3;
                  v18 = (_DWORD *)*((void *)a3 + 1);
                }
                else
                {
                  v25 = 0;
                }
                v26 = &v25[4 * v21];
                *(_DWORD *)v26 = v16;
                v19 = v26 + 4;
                while (v18 != v20)
                {
                  int v27 = *--v18;
                  *((_DWORD *)v26 - 1) = v27;
                  v26 -= 4;
                }
                *(void *)a3 = v26;
                *((void *)a3 + 1) = v19;
                *((void *)a3 + 2) = &v25[4 * v24];
                if (v20) {
                  operator delete(v20);
                }
              }
              else
              {
                _DWORD *v18 = v15;
                v19 = v18 + 1;
              }
              *((void *)a3 + 1) = v19;
            }
            else if (!v13)
            {
              int v7 = -4443998;
            }
          }
          else
          {
            NSLog(&cfstr_ArrayEntryForF.isa);
            int v7 = -4444005;
          }
        }
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v8);
    }
  }
  else
  {
    int v7 = -4444007;
  }

  return v7;
}

- (int)standardProcessKey:(id)a3 addToDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __p = 0;
  v30 = 0;
  uint64_t v31 = 0;
  int v8 = [(PregateFeatureBuilder *)self fillVector:&__p withPerFrameStats:v6];
  uint64_t v9 = __p;
  if (!v8 && v30 != __p)
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    sub_1DD3C5B78((uint64_t)&__p, (float *)&v27, (float *)&v28 + 1, (float *)&v28, (float *)&v27 + 1);
    v10 = [@"pregate_" stringByAppendingString:v6];
    v11 = [v10 stringByAppendingString:@"_mean"];

    LODWORD(v12) = v27;
    int v13 = [NSNumber numberWithFloat:v12];
    [v7 setObject:v13 forKeyedSubscript:v11];

    v14 = [@"pregate_" stringByAppendingString:v6];
    int v15 = [v14 stringByAppendingString:@"_max"];

    LODWORD(v16) = v28;
    unint64_t v17 = [NSNumber numberWithFloat:v16];
    [v7 setObject:v17 forKeyedSubscript:v15];

    v18 = [@"pregate_" stringByAppendingString:v6];
    v19 = [v18 stringByAppendingString:@"_min"];

    LODWORD(v20) = HIDWORD(v28);
    uint64_t v21 = [NSNumber numberWithFloat:v20];
    [v7 setObject:v21 forKeyedSubscript:v19];

    unint64_t v22 = [@"pregate_" stringByAppendingString:v6];
    uint64_t v23 = [v22 stringByAppendingString:@"_sd"];

    LODWORD(v24) = HIDWORD(v27);
    v25 = [NSNumber numberWithFloat:v24];
    [v7 setObject:v25 forKeyedSubscript:v23];

    uint64_t v9 = __p;
  }
  if (v9)
  {
    v30 = v9;
    operator delete(v9);
  }

  return v8;
}

- (int)processStandardPerFrameKeys
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->stdProcessInputKeysArray;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v3);
      }
      int v7 = -[PregateFeatureBuilder standardProcessKey:addToDictionary:](self, "standardProcessKey:addToDictionary:", *(void *)(*((void *)&v9 + 1) + 8 * v6), self->featuresDict, (void)v9);
      if (v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int v7 = 0;
  }

  return v7;
}

- (int)processVideoFaceInfo
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  movieMetadata = self->_movieMetadata;
  if (movieMetadata)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = movieMetadata;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v4)
    {
      unsigned int v31 = 0;
      uint64_t v5 = 0;
      uint64_t v29 = *(void *)v39;
      uint64_t v30 = v4;
      float v6 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(obj);
          }
          int v7 = [*(id *)(*((void *)&v38 + 1) + 8 * i) objectForKeyedSubscript:@"privDFArray"];
          int v8 = v7;
          long long v32 = v7;
          if (v7)
          {
            int v9 = [v7 count];
            int v10 = v31;
            if ((int)v31 <= v9) {
              int v10 = v9;
            }
            unsigned int v31 = v10;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v11 = v8;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v35;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v35 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  int v15 = [*(id *)(*((void *)&v34 + 1) + 8 * j) objectForKeyedSubscript:@"Rect"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    double v16 = [v15 objectForKeyedSubscript:@"Width"];
                    objc_opt_class();
                    float v17 = 0.0;
                    uint64_t v18 = 4290523293;
                    if (objc_opt_isKindOfClass())
                    {
                      [v16 floatValue];
                      float v17 = v19;
                      uint64_t v18 = v5;
                    }
                    double v20 = [v15 objectForKeyedSubscript:@"Height"];
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();
                    float v22 = 0.0;
                    uint64_t v5 = 4290523293;
                    if (isKindOfClass)
                    {
                      objc_msgSend(v20, "floatValue", 0.0);
                      uint64_t v5 = v18;
                    }
                    float v23 = v17 * v22;
                    if (v6 < v23) {
                      float v6 = v23;
                    }
                  }
                  else
                  {
                    uint64_t v5 = 4290523293;
                  }
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
              }
              while (v12);
            }
          }
        }
        uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v30);
    }
    else
    {
      unsigned int v31 = 0;
      LODWORD(v5) = 0;
      float v6 = 0.0;
    }
  }
  else
  {
    unsigned int v31 = 0;
    LODWORD(v5) = -4444007;
    float v6 = 0.0;
  }
  *(float *)&double v2 = v6;
  double v24 = [NSNumber numberWithFloat:v2];
  [(NSMutableDictionary *)self->featuresDict setObject:v24 forKeyedSubscript:@"PREGATE_VIDEO_FACE_MAX_SIZE"];

  v25 = [NSNumber numberWithInt:v31];
  [(NSMutableDictionary *)self->featuresDict setObject:v25 forKeyedSubscript:@"PREGATE_VIDEO_FACE_MAX_COUNT"];

  return v5;
}

- (int)processPresentationTimes
{
  CMTime v43 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  begin = self->_frameTimes.__begin_;
  unint64_t v4 = (self->_frameTimes.__end_ - begin) / 24;
  int v5 = 0;
  if (self->_frameTimes.__end_ != begin)
  {
    if (v4 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = (self->_frameTimes.__end_ - begin) / 24;
    }
    int v7 = (int *)((char *)begin + 12);
    do
    {
      int v8 = *v7;
      v7 += 6;
      if ((v8 & 0x1D) != 1) {
        int v5 = -4443999;
      }
      --v6;
    }
    while (v6);
  }
  if (v4 > 1)
  {
    memset(&v42, 0, sizeof(v42));
    CMTime lhs = *(CMTime *)((unsigned char *)begin + 1);
    CMTimeEpoch v9 = *((void *)begin + 2);
    *(_OWORD *)&rhs.value = *(_OWORD *)begin;
    rhs.epoch = v9;
    CMTimeSubtract(&v42, &lhs, &rhs);
    CMTime v43 = v42;
    CMTime v44 = v42;
    CMTime v45 = v42;
    int v10 = self->_frameTimes.__begin_;
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((self->_frameTimes.__end_ - v10) >> 3);
    if (v11 >= 3)
    {
      uint64_t v12 = 0;
      unint64_t v13 = 2;
      do
      {
        memset(&v42, 0, sizeof(v42));
        uint64_t v14 = (char *)v10 + v12;
        long long v15 = *((_OWORD *)v14 + 3);
        v39.epoch = *((void *)v14 + 8);
        *(_OWORD *)&v39.value = v15;
        long long v16 = *(_OWORD *)(v14 + 24);
        v38.epoch = *((void *)v14 + 5);
        *(_OWORD *)&v38.value = v16;
        CMTimeSubtract(&v42, &v39, &v38);
        CMTime time1 = v42;
        CMTime time2 = v45;
        if (CMTimeCompare(&time1, &time2) < 0) {
          CMTime v45 = v42;
        }
        CMTime v35 = v42;
        CMTime v34 = v44;
        if (CMTimeCompare(&v35, &v34) >= 1) {
          CMTime v44 = v42;
        }
        CMTime v33 = v43;
        CMTime v32 = v42;
        CMTimeAdd(&v43, &v33, &v32);
        ++v13;
        int v10 = self->_frameTimes.__begin_;
        unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((self->_frameTimes.__end_ - v10) >> 3);
        v12 += 24;
      }
      while (v11 > v13);
    }
    CMTime time = v43;
    CMTimeMultiplyByRatio(&v43, &time, 1, v11 - 1);
    float v17 = NSNumber;
    CMTime v30 = v44;
    Float64 Seconds = CMTimeGetSeconds(&v30);
    *(float *)&Float64 Seconds = Seconds;
    float v19 = [v17 numberWithFloat:Seconds];
    [(NSMutableDictionary *)self->featuresDict setObject:v19 forKeyedSubscript:@"PREGATE_GAP_MAX"];

    double v20 = NSNumber;
    CMTime v29 = v45;
    Float64 v21 = CMTimeGetSeconds(&v29);
    *(float *)&Float64 v21 = v21;
    float v22 = [v20 numberWithFloat:v21];
    [(NSMutableDictionary *)self->featuresDict setObject:v22 forKeyedSubscript:@"PREGATE_GAP_MIN"];

    float v23 = NSNumber;
    CMTime v28 = v43;
    Float64 v24 = CMTimeGetSeconds(&v28);
    *(float *)&Float64 v24 = v24;
    v25 = [v23 numberWithFloat:v24];
    [(NSMutableDictionary *)self->featuresDict setObject:v25 forKeyedSubscript:@"PREGATE_GAP_MEAN"];

    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((self->_frameTimes.__end_ - self->_frameTimes.__begin_) >> 3);
  }
  v26 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)self->featuresDict setObject:v26 forKeyedSubscript:@"PREGATE_NUM_FRAMES"];

  return v5;
}

- (int)processOffsetVectors
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  float32x2_t v53 = 0;
  float32x2_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v56 = 0;
  int64_t v3 = self->_frameOffsets.__end_ - self->_frameOffsets.__begin_;
  if ((int)(v3 >> 3) >= 1)
  {
    float v5 = 0.0;
    float v6 = 0.0;
    float v7 = 0.0;
    float v8 = 0.0;
    if ((v3 >> 3) != 1)
    {
      unint64_t v9 = (v3 >> 3) - 1;
      sub_1DD3B3678(v52, v9);
      sub_1DD3C8D54(__p, v9);
      begin = self->_frameOffsets.__begin_;
      float v12 = *(float *)begin;
      float v13 = *((float *)begin + 1);
      unint64_t v11 = (float *)((char *)begin + 12);
      uint64_t v14 = (float *)((char *)__p[0] + 4);
      uint64_t v15 = ((unint64_t)v3 >> 3) - 1;
      long long v16 = (float *)v52[0];
      float v8 = v13;
      float v7 = v13;
      float v6 = v12;
      float v5 = v12;
      do
      {
        float v17 = *(v11 - 1);
        float v18 = *v11;
        if (v5 < v17) {
          float v5 = *(v11 - 1);
        }
        if (v7 < v18) {
          float v7 = *v11;
        }
        if (v17 < v6) {
          float v6 = *(v11 - 1);
        }
        float v19 = v17 - v12;
        float v20 = v18 - v13;
        *(v14 - 1) = v19;
        float *v14 = v20;
        *v16++ = sqrtf((float)(v20 * v20) + (float)(v19 * v19));
        if (v18 < v8) {
          float v8 = v18;
        }
        float v12 = *(v11 - 1);
        float v13 = *v11;
        v11 += 2;
        v14 += 2;
        --v15;
      }
      while (v15);
      sub_1DD3C5B78((uint64_t)v52, (float *)&v55 + 1, (float *)&v54 + 1, (float *)&v55, (float *)&v54);
      sub_1DD3C59DC((uint64_t)__p, &v53, &v57, (float *)&v56);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v52[0])
      {
        v52[1] = v52[0];
        operator delete(v52[0]);
      }
    }
    *(float *)&double v2 = v5;
    Float64 v21 = [NSNumber numberWithFloat:v2];
    [(NSMutableDictionary *)self->featuresDict setObject:v21 forKeyedSubscript:@"PREGATE_MOTION_OFFSET_MAX_X"];

    *(float *)&double v22 = v7;
    float v23 = [NSNumber numberWithFloat:v22];
    [(NSMutableDictionary *)self->featuresDict setObject:v23 forKeyedSubscript:@"PREGATE_MOTION_OFFSET_MAX_Y"];

    *(float *)&double v24 = v6;
    v25 = [NSNumber numberWithFloat:v24];
    [(NSMutableDictionary *)self->featuresDict setObject:v25 forKeyedSubscript:@"PREGATE_MOTION_OFFSET_MIN_X"];

    *(float *)&double v26 = v8;
    uint64_t v27 = [NSNumber numberWithFloat:v26];
    [(NSMutableDictionary *)self->featuresDict setObject:v27 forKeyedSubscript:@"PREGATE_MOTION_OFFSET_MIN_Y"];

    LODWORD(v28) = v53.i32[0];
    CMTime v29 = [NSNumber numberWithFloat:v28];
    [(NSMutableDictionary *)self->featuresDict setObject:v29 forKeyedSubscript:@"PREGATE_MOTION_DELTA_MEAN_X"];

    LODWORD(v30) = v53.i32[1];
    unsigned int v31 = [NSNumber numberWithFloat:v30];
    [(NSMutableDictionary *)self->featuresDict setObject:v31 forKeyedSubscript:@"PREGATE_MOTION_DELTA_MEAN_Y"];

    LODWORD(v32) = v57.i32[0];
    CMTime v33 = [NSNumber numberWithFloat:v32];
    [(NSMutableDictionary *)self->featuresDict setObject:v33 forKeyedSubscript:@"PREGATE_MOTION_DELTA_COVAR_X"];

    LODWORD(v34) = HIDWORD(v58);
    CMTime v35 = [NSNumber numberWithFloat:v34];
    [(NSMutableDictionary *)self->featuresDict setObject:v35 forKeyedSubscript:@"PREGATE_MOTION_DELTA_COVAR_Y"];

    LODWORD(v36) = v57.i32[1];
    long long v37 = [NSNumber numberWithFloat:v36];
    [(NSMutableDictionary *)self->featuresDict setObject:v37 forKeyedSubscript:@"PREGATE_MOTION_DELTA_COVAR_XY"];

    LODWORD(v38) = v56;
    CMTime v39 = [NSNumber numberWithFloat:v38];
    [(NSMutableDictionary *)self->featuresDict setObject:v39 forKeyedSubscript:@"PREGATE_MOTION_DELTA_EIGEN_1"];

    LODWORD(v40) = HIDWORD(v56);
    long long v41 = [NSNumber numberWithFloat:v40];
    [(NSMutableDictionary *)self->featuresDict setObject:v41 forKeyedSubscript:@"PREGATE_MOTION_DELTA_EIGEN_2"];

    LODWORD(v42) = HIDWORD(v55);
    CMTime v43 = [NSNumber numberWithFloat:v42];
    [(NSMutableDictionary *)self->featuresDict setObject:v43 forKeyedSubscript:@"PREGATE_MOTION_DELTA_MAG_MEAN"];

    LODWORD(v44) = HIDWORD(v54);
    CMTime v45 = [NSNumber numberWithFloat:v44];
    [(NSMutableDictionary *)self->featuresDict setObject:v45 forKeyedSubscript:@"PREGATE_MOTION_DELTA_MAG_MIN"];

    LODWORD(v46) = v55;
    v47 = [NSNumber numberWithFloat:v46];
    [(NSMutableDictionary *)self->featuresDict setObject:v47 forKeyedSubscript:@"PREGATE_MOTION_DELTA_MAG_MAX"];

    LODWORD(v48) = v54;
    v49 = [NSNumber numberWithFloat:v48];
    [(NSMutableDictionary *)self->featuresDict setObject:v49 forKeyedSubscript:@"PREGATE_MOTION_DELTA_MAG_STDDEV"];
  }
  return 0;
}

- (int)processBlurVectors
{
  begin = self->_frameBlurVectors.__begin_;
  end = self->_frameBlurVectors.__end_;
  p_frameBlurVectors = (uint64_t *)&self->_frameBlurVectors;
  if (end != begin)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    sub_1DD3C5C40(p_frameBlurVectors, (float *)&v16 + 1, (float *)&v16, (float *)&v15 + 1, (float *)&v15);
    LODWORD(v6) = v16;
    float v7 = [NSNumber numberWithFloat:v6];
    [(NSMutableDictionary *)self->featuresDict setObject:v7 forKeyedSubscript:@"PREGATE_BLUR_MIN"];

    LODWORD(v8) = HIDWORD(v15);
    unint64_t v9 = [NSNumber numberWithFloat:v8];
    [(NSMutableDictionary *)self->featuresDict setObject:v9 forKeyedSubscript:@"PREGATE_BLUR_MAX"];

    LODWORD(v10) = HIDWORD(v16);
    unint64_t v11 = [NSNumber numberWithFloat:v10];
    [(NSMutableDictionary *)self->featuresDict setObject:v11 forKeyedSubscript:@"PREGATE_BLUR_MEAN"];

    LODWORD(v12) = v15;
    float v13 = [NSNumber numberWithFloat:v12];
    [(NSMutableDictionary *)self->featuresDict setObject:v13 forKeyedSubscript:@"PREGATE_BLUR_STDDEV"];
  }
  return 0;
}

- (int)readPerFrameMetadataToArrays
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  p_frameTimes = &self->_frameTimes;
  self->_frameTimes.__end_ = self->_frameTimes.__begin_;
  p_frameOffsets = &self->_frameOffsets;
  self->_frameOffsets.__end_ = self->_frameOffsets.__begin_;
  p_frameBlurVectors = &self->_frameBlurVectors;
  self->_frameBlurVectors.__end_ = self->_frameBlurVectors.__begin_;
  movieMetadata = self->_movieMetadata;
  if (!movieMetadata) {
    return -4444007;
  }
  sub_1DD3ABBB0((void **)&p_frameTimes->__begin_, [(NSArray *)movieMetadata count]);
  sub_1DD3B8438((void **)&p_frameOffsets->__begin_, [(NSArray *)self->_movieMetadata count]);
  sub_1DD3B8438((void **)&p_frameBlurVectors->__begin_, [(NSArray *)self->_movieMetadata count]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = self->_movieMetadata;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v7)
  {
    float32x2_t v57 = p_frameBlurVectors;
    uint64_t v58 = p_frameOffsets;
    uint64_t v59 = p_frameTimes;
    int v8 = 0;
    uint64_t v9 = *(void *)v63;
    p_end_cap = &self->_frameBlurVectors.__end_cap_;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v63 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        double v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"InterpolatedFrame", p_end_cap);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ([v12 BOOLValue] & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFDictionaryRef v13 = [v11 objectForKeyedSubscript:@"PresentationTime"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              CMTimeMakeFromDictionary(&v61, v13);
              end = self->_frameTimes.__end_;
              value = self->_frameTimes.__end_cap_.__value_;
              if (end >= value)
              {
                unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((end - v59->__begin_) >> 3);
                unint64_t v19 = v18 + 1;
                if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  sub_1DD3A9B50();
                }
                unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((value - v59->__begin_) >> 3);
                if (2 * v20 > v19) {
                  unint64_t v19 = 2 * v20;
                }
                if (v20 >= 0x555555555555555) {
                  unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v21 = v19;
                }
                if (v21) {
                  double v22 = (char *)sub_1DD3A9BF8((uint64_t)&self->_frameTimes.__end_cap_, v21);
                }
                else {
                  double v22 = 0;
                }
                float v23 = &v22[24 * v18];
                long long v24 = *(_OWORD *)&v61.value;
                *((void *)v23 + 2) = v61.epoch;
                *(_OWORD *)float v23 = v24;
                begin = self->_frameTimes.__begin_;
                v25 = self->_frameTimes.__end_;
                uint64_t v27 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v23;
                if (v25 != begin)
                {
                  do
                  {
                    long long v28 = *(_OWORD *)((char *)v25 - 24);
                    *((void *)v27 - 1) = *((void *)v25 - 1);
                    *(_OWORD *)((char *)v27 - 24) = v28;
                    uint64_t v27 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v27 - 24);
                    v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v25 - 24);
                  }
                  while (v25 != begin);
                  v25 = v59->__begin_;
                }
                float v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v23 + 24);
                self->_frameTimes.__begin_ = v27;
                self->_frameTimes.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v23 + 24);
                self->_frameTimes.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v22[24 * v21];
                if (v25) {
                  operator delete(v25);
                }
              }
              else
              {
                long long v16 = *(_OWORD *)&v61.value;
                *((void *)end + 2) = v61.epoch;
                *(_OWORD *)end = v16;
                float v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 24);
              }
              self->_frameTimes.__end_ = v17;
            }
            else
            {
              int v8 = -4444002;
            }
            CMTime v29 = [v11 objectForKeyedSubscript:@"privECMVct"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v29 getBytes:&v61 length:8];
              unsigned int v31 = self->_frameOffsets.__end_;
              double v30 = self->_frameOffsets.__end_cap_.__value_;
              if (v31 >= v30)
              {
                uint64_t v33 = (v31 - v58->__begin_) >> 3;
                if ((unint64_t)(v33 + 1) >> 61) {
                  sub_1DD3A9B50();
                }
                uint64_t v34 = v30 - v58->__begin_;
                uint64_t v35 = v34 >> 2;
                if (v34 >> 2 <= (unint64_t)(v33 + 1)) {
                  uint64_t v35 = v33 + 1;
                }
                if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v36 = v35;
                }
                if (v36) {
                  long long v37 = (char *)sub_1DD3B19D0((uint64_t)&self->_frameOffsets.__end_cap_, v36);
                }
                else {
                  long long v37 = 0;
                }
                double v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[8 * v33];
                *(void *)double v38 = v61.value;
                double v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 + 8);
                double v40 = self->_frameOffsets.__begin_;
                CMTime v39 = self->_frameOffsets.__end_;
                if (v39 != v40)
                {
                  do
                  {
                    uint64_t v41 = *((void *)v39 - 1);
                    CMTime v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 - 8);
                    *((void *)v38 - 1) = v41;
                    double v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 - 8);
                  }
                  while (v39 != v40);
                  CMTime v39 = v58->__begin_;
                }
                self->_frameOffsets.__begin_ = v38;
                self->_frameOffsets.__end_ = v32;
                self->_frameOffsets.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[8 * v36];
                if (v39) {
                  operator delete(v39);
                }
              }
              else
              {
                *(void *)unsigned int v31 = v61.value;
                double v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 + 8);
              }
              self->_frameOffsets.__end_ = v32;
            }
            else
            {
              int v8 = -4444001;
            }
            double v42 = [v11 objectForKeyedSubscript:@"privEMBVct"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v42 getBytes:&v61 length:8];
              double v44 = self->_frameBlurVectors.__end_;
              CMTime v43 = self->_frameBlurVectors.__end_cap_.__value_;
              if (v44 >= v43)
              {
                uint64_t v46 = (v44 - v57->__begin_) >> 3;
                if ((unint64_t)(v46 + 1) >> 61) {
                  sub_1DD3A9B50();
                }
                uint64_t v47 = v43 - v57->__begin_;
                uint64_t v48 = v47 >> 2;
                if (v47 >> 2 <= (unint64_t)(v46 + 1)) {
                  uint64_t v48 = v46 + 1;
                }
                if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v49 = v48;
                }
                if (v49) {
                  v50 = (char *)sub_1DD3B19D0((uint64_t)p_end_cap, v49);
                }
                else {
                  v50 = 0;
                }
                v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v50[8 * v46];
                *(void *)v51 = v61.value;
                CMTime v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v51 + 8);
                float32x2_t v53 = self->_frameBlurVectors.__begin_;
                v52 = self->_frameBlurVectors.__end_;
                if (v52 != v53)
                {
                  do
                  {
                    uint64_t v54 = *((void *)v52 - 1);
                    v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v52 - 8);
                    *((void *)v51 - 1) = v54;
                    v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v51 - 8);
                  }
                  while (v52 != v53);
                  v52 = v57->__begin_;
                }
                self->_frameBlurVectors.__begin_ = v51;
                self->_frameBlurVectors.__end_ = v45;
                self->_frameBlurVectors.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v50[8 * v49];
                if (v52) {
                  operator delete(v52);
                }
              }
              else
              {
                *(void *)double v44 = v61.value;
                CMTime v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v44 + 8);
              }
              self->_frameBlurVectors.__end_ = v45;
            }
            else
            {
              int v8 = -4444000;
            }
          }
          else
          {
            int v8 = -4444005;
          }
        }
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)processVidTrackMetadata
{
  videoTrackMetadataDict = self->_videoTrackMetadataDict;
  if (!videoTrackMetadataDict) {
    return -4444006;
  }
  unint64_t v4 = [(NSDictionary *)videoTrackMetadataDict objectForKeyedSubscript:@"vidTrackTotalDur"];
  [(NSMutableDictionary *)self->featuresDict setObject:v4 forKeyedSubscript:@"vidTrackTotalDur"];

  float v5 = [(NSDictionary *)self->_videoTrackMetadataDict objectForKeyedSubscript:@"vidTrackNaturalW"];
  [(NSMutableDictionary *)self->featuresDict setObject:v5 forKeyedSubscript:@"vidTrackNaturalW"];

  double v6 = [(NSDictionary *)self->_videoTrackMetadataDict objectForKeyedSubscript:@"vidTrackNaturalH"];
  [(NSMutableDictionary *)self->featuresDict setObject:v6 forKeyedSubscript:@"vidTrackNaturalH"];

  uint64_t v7 = [(NSDictionary *)self->_videoTrackMetadataDict objectForKeyedSubscript:@"vidTrackCleanW"];
  [(NSMutableDictionary *)self->featuresDict setObject:v7 forKeyedSubscript:@"vidTrackCleanW"];

  int v8 = [(NSDictionary *)self->_videoTrackMetadataDict objectForKeyedSubscript:@"vidTrackCleanH"];
  [(NSMutableDictionary *)self->featuresDict setObject:v8 forKeyedSubscript:@"vidTrackCleanH"];

  uint64_t v9 = [(NSDictionary *)self->_videoTrackMetadataDict objectForKeyedSubscript:@"vidTrackStillFrameTime"];
  [(NSMutableDictionary *)self->featuresDict setObject:v9 forKeyedSubscript:@"vidTrackStillFrameTime"];

  return 0;
}

- (int)processMovieMetadata
{
  int result = [(PregateFeatureBuilder *)self processStandardPerFrameKeys];
  if (!result)
  {
    int result = [(PregateFeatureBuilder *)self readPerFrameMetadataToArrays];
    if (!result)
    {
      int result = [(PregateFeatureBuilder *)self processBlurVectors];
      if (!result)
      {
        int result = [(PregateFeatureBuilder *)self processOffsetVectors];
        if (!result)
        {
          int result = [(PregateFeatureBuilder *)self processPresentationTimes];
          if (!result)
          {
            return MEMORY[0x1F4181798](self, sel_processVideoFaceInfo);
          }
        }
      }
    }
  }
  return result;
}

- (int)processStillImageFaceData
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  facesArray = self->_facesArray;
  float v3 = 0.0;
  if (facesArray && (uint64_t v4 = [(NSArray *)facesArray count], v4))
  {
    uint64_t v37 = v4;
    CMTime v39 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(int)v4];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    float v5 = self->_facesArray;
    uint64_t v6 = 0;
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v45;
      float v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v12 = [v11 objectForKeyedSubscript:@"Width"];
            objc_opt_class();
            float v13 = 0.0;
            uint64_t v14 = 4290523292;
            if (objc_opt_isKindOfClass())
            {
              [v12 floatValue];
              float v13 = v15;
              uint64_t v14 = v6;
            }
            long long v16 = [v11 objectForKeyedSubscript:@"Height"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            double v18 = 0.0;
            uint64_t v6 = 4290523292;
            if (isKindOfClass)
            {
              objc_msgSend(v16, "floatValue", 0.0);
              uint64_t v6 = v14;
            }
            float v19 = v13 * *(float *)&v18;
            if (v9 <= v19) {
              float v9 = v19;
            }
            *(float *)&double v18 = v19;
            unint64_t v20 = [NSNumber numberWithFloat:v18];
            [v39 addObject:v20];

            float v3 = v3 + v19;
          }
          else
          {
            uint64_t v6 = 4290523292;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v7);
    }
    else
    {
      float v9 = 0.0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v23 = v39;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
    float v22 = v3 / (float)(int)v37;
    if (v24)
    {
      uint64_t v25 = *(void *)v41;
      float v26 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * j) floatValue];
          float v26 = v26 + (float)((float)(v22 - v28) * (float)(v22 - v28));
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v24);
    }
    else
    {
      float v26 = 0.0;
    }

    float v3 = sqrtf(v26 / (float)(int)v37);
    uint64_t v21 = v37;
  }
  else
  {
    LODWORD(v6) = 0;
    uint64_t v21 = 0;
    float v22 = 0.0;
    float v9 = 0.0;
  }
  CMTime v29 = [NSNumber numberWithInt:v21];
  [(NSMutableDictionary *)self->featuresDict setObject:v29 forKeyedSubscript:@"PREGATE_STILL_FACECOUNT"];

  *(float *)&double v30 = v22;
  unsigned int v31 = [NSNumber numberWithFloat:v30];
  [(NSMutableDictionary *)self->featuresDict setObject:v31 forKeyedSubscript:@"PREGATE_STILL_FACEMEANSIZE"];

  *(float *)&double v32 = v3;
  uint64_t v33 = [NSNumber numberWithFloat:v32];
  [(NSMutableDictionary *)self->featuresDict setObject:v33 forKeyedSubscript:@"PREGATE_STILL_FACESTDDEV"];

  *(float *)&double v34 = v9;
  uint64_t v35 = [NSNumber numberWithFloat:v34];
  [(NSMutableDictionary *)self->featuresDict setObject:v35 forKeyedSubscript:@"PREGATE_STILL_FACEMAXSIZE"];

  return v6;
}

- (int)processStillImageMetadata
{
  float v3 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:@"AEAverage"];
  [(NSMutableDictionary *)self->featuresDict setObject:v3 forKeyedSubscript:@"PREGATE_STILL_AEAVERAGE"];
  uint64_t v4 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:@"AESTable"];

  [(NSMutableDictionary *)self->featuresDict setObject:v4 forKeyedSubscript:@"PREGATE_STILL_AESTABLE"];
  float v5 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:@"AFStable"];

  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = -4444008;
  if (v6 || v5 == 0) {
    int v9 = -4444008;
  }
  else {
    int v9 = 0;
  }
  [(NSMutableDictionary *)self->featuresDict setObject:v5 forKeyedSubscript:@"PREGATE_STILL_AFSTABLE"];
  double v10 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:*MEMORY[0x1E4F2F878]];

  int v11 = -4444008;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v10;
      if ([v12 count])
      {
        float v13 = [v12 objectAtIndex:0];
        [(NSMutableDictionary *)self->featuresDict setObject:v13 forKeyedSubscript:@"PREGATE_STILL_ISO"];

        int v11 = v9;
      }
    }
  }
  uint64_t v14 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:*MEMORY[0x1E4F2F7B0]];

  [(NSMutableDictionary *)self->featuresDict setObject:v14 forKeyedSubscript:@"PREGATE_STILL_BRIGHTNESS"];
  float v15 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:*MEMORY[0x1E4F2F828]];

  [(NSMutableDictionary *)self->featuresDict setObject:v15 forKeyedSubscript:@"PREGATE_STILL_EXPOSURETIME"];
  long long v16 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:*MEMORY[0x1E4F2F808]];

  [(NSMutableDictionary *)self->featuresDict setObject:v16 forKeyedSubscript:@"PREGATE_STILL_DIGITALZOOM"];
  float v17 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:*MEMORY[0x1E4F2F838]];

  if (v14) {
    BOOL v18 = v15 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18 || v16 == 0 || v17 == 0) {
    int v21 = -4444008;
  }
  else {
    int v21 = v11;
  }
  float v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "integerValue") & 1);
  [(NSMutableDictionary *)self->featuresDict setObject:v22 forKeyedSubscript:@"PREGATE_STILL_DIDFLASH"];

  id v23 = [(NSDictionary *)self->_stillImageMetadata objectForKeyedSubscript:*MEMORY[0x1E4F2F890]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v24 = [v23 rangeOfString:@"front" options:1] != 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v25 = [NSNumber numberWithBool:v24];
    [(NSMutableDictionary *)self->featuresDict setObject:v25 forKeyedSubscript:@"PREGATE_STILL_IS_FRONT_FACING_CAMERA"];

    int v7 = v21;
  }

  return v7;
}

- (PregateFeatureBuilder)init
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PregateFeatureBuilder;
  double v2 = [(PregateFeatureBuilder *)&v6 init];
  v7[0] = @"privET";
  v7[1] = @"privTZF";
  v7[2] = @"privImgG";
  v7[3] = @"privAFS";
  v7[4] = @"privAFSt";
  v7[5] = @"privFM";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  stdProcessInputKeysArray = v2->stdProcessInputKeysArray;
  v2->stdProcessInputKeysArray = (NSArray *)v3;

  return v2;
}

- (int)processStillInternal
{
  irisStillExtractor = self->irisStillExtractor;
  if (!irisStillExtractor) {
    return -4443997;
  }
  int result = [(ExifMetadataExtractor *)irisStillExtractor processFile];
  if (!result)
  {
    float v5 = [(ExifMetadataExtractor *)self->irisStillExtractor metadataDictionary];
    stillImageMetadata = self->_stillImageMetadata;
    self->_stillImageMetadata = v5;

    if (self->_stillImageMetadata)
    {
      int result = [(PregateFeatureBuilder *)self processStillImageMetadata];
      if (!result)
      {
        int v7 = [(ExifMetadataExtractor *)self->irisStillExtractor facesArray];
        facesArray = self->_facesArray;
        self->_facesArray = v7;

        return MEMORY[0x1F4181798](self, sel_processStillImageFaceData);
      }
    }
    else
    {
      return -4444008;
    }
  }
  return result;
}

- (int)processVideoInternal
{
  irisVideoExtractor = self->irisVideoExtractor;
  if (!irisVideoExtractor) {
    return -4443997;
  }
  int result = [(IrisVideoMetadataExtractor *)irisVideoExtractor processFile];
  if (!result)
  {
    float v5 = [(IrisVideoMetadataExtractor *)self->irisVideoExtractor framesMetadataArray];
    movieMetadata = self->_movieMetadata;
    self->_movieMetadata = v5;

    if (self->_movieMetadata)
    {
      int result = [(PregateFeatureBuilder *)self processMovieMetadata];
      if (!result)
      {
        int v7 = [(IrisVideoMetadataExtractor *)self->irisVideoExtractor videoTrackMetadataDict];
        videoTrackMetadataDict = self->_videoTrackMetadataDict;
        self->_videoTrackMetadataDict = v7;

        if (self->_videoTrackMetadataDict)
        {
          return MEMORY[0x1F4181798](self, sel_processVidTrackMetadata);
        }
        else
        {
          return -4444006;
        }
      }
    }
    else
    {
      return -4444007;
    }
  }
  return result;
}

- (int)processStill
{
  if (!self->featuresDict)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    featuresDict = self->featuresDict;
    self->featuresDict = v3;
  }
  if (!self->irisStillExtractor) {
    return 0;
  }

  return [(PregateFeatureBuilder *)self processStillInternal];
}

- (int)processVideo
{
  if (!self->featuresDict)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    featuresDict = self->featuresDict;
    self->featuresDict = v3;
  }
  if (!self->irisVideoExtractor) {
    return -4443997;
  }

  return [(PregateFeatureBuilder *)self processVideoInternal];
}

- (void)buildFullDictionary
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  uint64_t v4 = [(IrisVideoMetadataExtractor *)self->irisVideoExtractor allMetadata];
  [v12 setObject:v4 forKeyedSubscript:@"FullMetadata"];

  float v5 = [(IrisVideoMetadataExtractor *)self->irisVideoExtractor framesMetadataArray];
  [v12 setObject:v5 forKeyedSubscript:@"framesMetadata"];

  objc_super v6 = [(IrisVideoMetadataExtractor *)self->irisVideoExtractor videoTrackMetadataDict];
  [v12 setObject:v6 forKeyedSubscript:@"videoTrackMetadata"];

  [(NSMutableDictionary *)v3 setObject:v12 forKeyedSubscript:@"videoMetadata"];
  int v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  uint64_t v8 = [(ExifMetadataExtractor *)self->irisStillExtractor allMetadata];
  [v7 setObject:v8 forKeyedSubscript:@"fullMetadata"];

  int v9 = [(ExifMetadataExtractor *)self->irisStillExtractor metadataDictionary];
  [v7 setObject:v9 forKeyedSubscript:@"stillFrameData"];

  double v10 = [(ExifMetadataExtractor *)self->irisStillExtractor facesArray];
  [v7 setObject:v10 forKeyedSubscript:@"facesArray"];

  [(NSMutableDictionary *)v3 setObject:v7 forKeyedSubscript:@"stillMetadata"];
  fullFeaturesDict = self->fullFeaturesDict;
  self->fullFeaturesDict = v3;
}

- (int)processFullDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  fullFeaturesDict = self->fullFeaturesDict;
  self->fullFeaturesDict = 0;

  if (!self->featuresDict)
  {
    objc_super v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    featuresDict = self->featuresDict;
    self->featuresDict = v6;
  }
  irisStillExtractor = self->irisStillExtractor;
  if (irisStillExtractor)
  {
    [(ExifMetadataExtractor *)irisStillExtractor setSaveAllMetadata:1];
    int v9 = [(PregateFeatureBuilder *)self processStillInternal];
    if (v9 && !v3) {
      goto LABEL_10;
    }
  }
  else
  {
    int v9 = 0;
  }
  irisVideoExtractor = self->irisVideoExtractor;
  if (irisVideoExtractor)
  {
    [(IrisVideoMetadataExtractor *)irisVideoExtractor setSaveAllMetadata:1];
    int v9 = [(PregateFeatureBuilder *)self processVideoInternal];
  }
LABEL_10:
  [(PregateFeatureBuilder *)self buildFullDictionary];
  return v9;
}

- (NSMutableDictionary)featuresDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)stdProcessInputKeysArray
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStdProcessInputKeysArray:(id)a3
{
}

- (IrisVideoMetadataExtractor)irisVideoExtractor
{
  return (IrisVideoMetadataExtractor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIrisVideoExtractor:(id)a3
{
}

- (ExifMetadataExtractor)irisStillExtractor
{
  return (ExifMetadataExtractor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIrisStillExtractor:(id)a3
{
}

- (NSMutableDictionary)fullFeaturesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (vector<CMTime,)frameTimes
{
  objc_copyCppObjectAtomic(retstr, &self->_frameTimes, (void (__cdecl *)(void *, const void *))sub_1DD3C892C);
  return result;
}

- (void)setFrameTimes:()vector<CMTime
{
}

- (vector<FloatPoint,)frameOffsets
{
  objc_copyCppObjectAtomic(retstr, &self->_frameOffsets, (void (__cdecl *)(void *, const void *))sub_1DD3C89B8);
  return result;
}

- (void)setFrameOffsets:()vector<FloatPoint
{
}

- (vector<FloatPoint,)frameBlurVectors
{
  objc_copyCppObjectAtomic(retstr, &self->_frameBlurVectors, (void (__cdecl *)(void *, const void *))sub_1DD3C8A2C);
  return result;
}

- (void)setFrameBlurVectors:()vector<FloatPoint
{
}

- (NSDictionary)stillImageMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStillImageMetadata:(id)a3
{
}

- (NSArray)facesArray
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFacesArray:(id)a3
{
}

- (NSArray)movieMetadata
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMovieMetadata:(id)a3
{
}

- (NSDictionary)videoTrackMetadataDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVideoTrackMetadataDict:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->_frameBlurVectors.__begin_;
  if (begin)
  {
    self->_frameBlurVectors.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v4 = self->_frameOffsets.__begin_;
  if (v4)
  {
    self->_frameOffsets.__end_ = v4;
    operator delete(v4);
  }
  float v5 = self->_frameTimes.__begin_;
  if (v5)
  {
    self->_frameTimes.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_videoTrackMetadataDict, 0);
  objc_storeStrong((id *)&self->_movieMetadata, 0);
  objc_storeStrong((id *)&self->_facesArray, 0);
  objc_storeStrong((id *)&self->_stillImageMetadata, 0);
  objc_storeStrong((id *)&self->fullFeaturesDict, 0);
  objc_storeStrong((id *)&self->irisStillExtractor, 0);
  objc_storeStrong((id *)&self->irisVideoExtractor, 0);
  objc_storeStrong((id *)&self->stdProcessInputKeysArray, 0);

  objc_storeStrong((id *)&self->featuresDict, 0);
}

- (id).cxx_construct
{
  *((void *)self + 18) = 0;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

@end