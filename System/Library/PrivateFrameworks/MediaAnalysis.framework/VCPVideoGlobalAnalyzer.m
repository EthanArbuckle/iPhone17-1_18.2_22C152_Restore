@interface VCPVideoGlobalAnalyzer
- (BOOL)checkCameraZoom:(id *)a3 cameraMotionResults:(id)a4;
- (BOOL)hasMeaningfulSceneSegment:(id)a3 withFpsRate:(float)a4;
- (BOOL)isJunkTimeRange:(id *)a3 basedOnResults:(id)a4;
- (float)analyzeOverallQuality:(id)a3 withFpsRate:(float)a4;
- (float)assetActionScoreFromAnalysis:(id)a3;
- (float)assetActivityLevelFromAnalysisResults:(id)a3;
- (float)assetCameraMotionScoreFromAnalysis:(id)a3;
- (float)assetExpressionScoreFromAnalysis:(id)a3;
- (float)assetJunkScoreFromAnalysis:(id)a3;
- (float)assetQualityScoreFromAnalysis:(id)a3 withFpsRate:(float)a4;
- (float)assetVoiceScoreFromAnalysis:(id)a3;
- (float)cameraActivityfromQuality:(float)a3;
- (float)scaleForTimeRange:(id *)a3 basedOnFace:(id)a4;
- (float)subjectActivityInTimeRange:(id *)a3 fromResults:(id)a4;
- (int)generateLivePhotoRecommendationForResults:(id)a3 andPrivateResults:(id)a4 usingFaceAction:(BOOL)a5;
- (int)setActivityLevel:(id)a3;
@end

@implementation VCPVideoGlobalAnalyzer

- (float)analyzeOverallQuality:(id)a3 withFpsRate:(float)a4
{
  id v6 = a3;
  if ((~objc_msgSend(v6, "vcp_types") & 0x98) != 0 || a4 <= 0.0)
  {
    float v9 = -1.0;
  }
  else
  {
    *(float *)&double v7 = a4;
    float v9 = 0.0;
    if ([(VCPVideoGlobalAnalyzer *)self hasMeaningfulSceneSegment:v6 withFpsRate:v7])
    {
      *(float *)&double v8 = a4;
      [(VCPVideoGlobalAnalyzer *)self assetQualityScoreFromAnalysis:v6 withFpsRate:v8];
      float v11 = v10;
      [(VCPVideoGlobalAnalyzer *)self assetActionScoreFromAnalysis:v6];
      float v13 = v12;
      [(VCPVideoGlobalAnalyzer *)self assetExpressionScoreFromAnalysis:v6];
      float v15 = v14;
      [(VCPVideoGlobalAnalyzer *)self assetVoiceScoreFromAnalysis:v6];
      float v17 = v16;
      [(VCPVideoGlobalAnalyzer *)self assetJunkScoreFromAnalysis:v6];
      float v19 = v18;
      float v20 = (float)(v17 * 0.1) + (float)(v11 * 0.4);
      if (v13 >= 0.2 || v15 >= 0.2)
      {
        float v22 = (float)((float)(v15 * 0.25) + (float)(v13 * 0.25)) + v20;
        float v23 = 1.0;
      }
      else
      {
        [(VCPVideoGlobalAnalyzer *)self assetCameraMotionScoreFromAnalysis:v6];
        float v22 = v20 + (float)(v21 * 0.35);
        float v23 = 0.85;
      }
      float v25 = powf(v19 * (float)(v22 / v23), 0.4);
      float v26 = 1.0;
      if (v25 < 1.0) {
        float v26 = v25;
      }
      if (v25 <= 0.0) {
        float v9 = 0.0;
      }
      else {
        float v9 = v26;
      }
    }
  }

  return v9;
}

- (BOOL)checkCameraZoom:(id *)a3 cameraMotionResults:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  memset(&v32, 0, sizeof(v32));
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v32, &range);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v7);
      }
      CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v27 + 1) + 8 * v10);
      memset(&v26, 0, sizeof(v26));
      CMTimeRangeMakeFromDictionary(&v26, v11);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v26.start.value;
      time1.start.epoch = v26.start.epoch;
      CMTime time2 = v32;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
        break;
      }
      CMTimeRange v24 = v26;
      memset(&time1, 0, sizeof(time1));
      long long v12 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v12;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v24, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, CMTime v21 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&duration, &v21)))
      {
        float v13 = [(__CFDictionary *)v11 objectForKey:@"flags"];
        float v14 = v13;
        if (v13)
        {
          int v15 = [v13 intValue];
          BOOL v17 = !(v16 | ((v15 & 0x2FFC0) == 0)) && (v15 & 0x1FC0) == 4096;
          BOOL v18 = v17;

          if (v18)
          {
            BOOL v19 = 1;
            goto LABEL_25;
          }
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
        BOOL v19 = 0;
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_25;
      }
    }
  }
  BOOL v19 = 0;
LABEL_25:

  return v19;
}

- (int)generateLivePhotoRecommendationForResults:(id)a3 andPrivateResults:(id)a4 usingFaceAction:(BOOL)a5
{
  BOOL v54 = a5;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v49 = a4;
  {
    CMTimeMake((CMTime *)&-[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength, 2, 15);
  }
  v47 = [MEMORY[0x1E4F1CA48] array];
  memset(&v105, 0, sizeof(v105));
  long long v6 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime duration = start;
  CMTimeRangeMake(&v105, &start, &duration);
  memset(&v102, 0, sizeof(v102));
  CMTime v101 = *v6;
  CMTime v100 = v101;
  CMTimeRangeMake(&v102, &v101, &v100);
  float v99 = 0.0;
  v55 = [v50 objectForKeyedSubscript:@"SceneResults"];
  v48 = [v50 objectForKeyedSubscript:@"FineSubjectMotionResults"];
  v46 = [v50 objectForKeyedSubscript:@"FaceResults"];
  v53 = [v50 objectForKeyedSubscript:@"OrientationResults"];
  v56 = [v49 objectForKeyedSubscript:@"MetaMotionProcessedResults"];
  v52 = [v50 objectForKeyedSubscript:@"CameraMotionResults"];
  if ([v55 count])
  {
    CFDictionaryRef v7 = [v55 lastObject];
    memset(&v98, 0, sizeof(v98));
    CMTimeRangeMakeFromDictionary(&v98, v7);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v98.start.value;
    lhs.start.epoch = v98.start.epoch;
    rhs.CMTime start = v98.duration;
    CMTimeAdd(&v106, &lhs.start, &rhs.start);
    v105.CMTime duration = v106;
    CFDictionaryRef v8 = [v55 firstObject];

    CMTimeRangeMakeFromDictionary(&lhs, v8);
    *(_OWORD *)&v98.start.epoch = *(_OWORD *)&lhs.start.epoch;
    *(_OWORD *)&v105.start.value = *(_OWORD *)&lhs.start.value;
    v105.start.epoch = lhs.start.epoch;
  }
  unint64_t v57 = 0;
  unint64_t v9 = 0;
  while (v57 < [v55 count])
  {
    objc_msgSend(v55, "objectAtIndex:");
    CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v98, 0, sizeof(v98));
    CMTimeRangeMakeFromDictionary(&v98, v10);
    CFDictionaryRef v11 = [(__CFDictionary *)v10 objectForKey:@"quality"];
    [v11 floatValue];
    float v13 = v12;

    long long v96 = 0u;
    long long v95 = 0u;
    long long v94 = 0u;
    long long v93 = 0u;
    id v14 = v53;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v93 objects:v109 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v94;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v94 != v16) {
            objc_enumerationMutation(v14);
          }
          CFDictionaryRef v18 = *(const __CFDictionary **)(*((void *)&v93 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v18);
          memset(&rhs, 0, sizeof(rhs));
          CMTimeRange range = v98;
          CMTimeRange otherRange = lhs;
          CMTimeRangeGetIntersection(&rhs, &range, &otherRange);
          if ((rhs.start.flags & 1) != 0
            && (rhs.duration.flags & 1) != 0
            && !rhs.duration.epoch
            && (rhs.duration.value & 0x8000000000000000) == 0)
          {
            CMTime time1 = rhs.duration;
            CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            if (!CMTimeCompare(&time1, &time2)) {
              continue;
            }
          }
          CMTimeRange v87 = lhs;
          CMTimeRange v86 = v98;
          if (!CMTimeRangeContainsTimeRange(&v87, &v86))
          {

            goto LABEL_27;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v93 objects:v109 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if (v13 >= 0.0)
    {
      CMTimeRange v85 = v98;
      if (![(VCPVideoGlobalAnalyzer *)self checkCameraZoom:&v85 cameraMotionResults:v52])
      {
        while (v9 < [v56 count] && v54)
        {
          memset(&lhs, 0, sizeof(lhs));
          CFDictionaryRef v19 = [v56 objectAtIndex:v9];
          CMTimeRangeMakeFromDictionary(&lhs, v19);

          CMTimeRange v83 = v98;
          CMTimeRangeGetEnd(&v84, &v83);
          rhs.CMTime start = v84;
          CMTime v106 = lhs.start;
          int32_t v20 = CMTimeCompare(&rhs.start, &v106);
          BOOL v21 = v20 > 0;
          if (v20 > 0)
          {
            CMTimeRange v82 = lhs;
            CMTimeRange v81 = v98;
            ++v9;
            if (!CMTimeRangeContainsTimeRange(&v82, &v81)) {
              continue;
            }
          }
          goto LABEL_29;
        }
        BOOL v21 = 0;
LABEL_29:
        if (v13 >= 0.3)
        {
          CMTime time = v98.duration;
          if (CMTimeGetSeconds(&time) >= 1.0)
          {
            if (v21 || !v54) {
              goto LABEL_65;
            }
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v22 = v48;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v108 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v77;
              do
              {
                uint64_t v25 = 0;
                do
                {
                  if (*(void *)v77 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  CFDictionaryRef v26 = *(const __CFDictionary **)(*((void *)&v76 + 1) + 8 * v25);
                  memset(&lhs, 0, sizeof(lhs));
                  CMTimeRangeMakeFromDictionary(&lhs, v26);
                  long long v27 = [(__CFDictionary *)v26 objectForKeyedSubscript:@"quality"];
                  [v27 floatValue];
                  float v29 = v28;

                  memset(&rhs, 0, sizeof(rhs));
                  CMTimeRange v75 = v98;
                  CMTimeRange v74 = lhs;
                  CMTimeRangeGetIntersection(&rhs, &v75, &v74);
                  if ((rhs.start.flags & 1) != 0
                    && (rhs.duration.flags & 1) != 0
                    && !rhs.duration.epoch
                    && (rhs.duration.value & 0x8000000000000000) == 0
                    && v29 >= 0.3)
                  {
                    CMTime v73 = rhs.duration;
                    if (CMTimeGetSeconds(&v73) > 0.0)
                    {

                      goto LABEL_65;
                    }
                  }
                  ++v25;
                }
                while (v23 != v25);
                uint64_t v30 = [v22 countByEnumeratingWithState:&v76 objects:v108 count:16];
                uint64_t v23 = v30;
              }
              while (v30);
            }

            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id v31 = v46;
            uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v107 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v70;
              float v34 = 0.0;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v70 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  v36 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                  v37 = [v36 objectForKey:@"attributes"];
                  v38 = [v37 objectForKey:@"faceBounds"];
                  NSRect v111 = NSRectFromString(v38);
                  double width = v111.size.width;
                  double height = v111.size.height;
                  memset(&lhs, 0, sizeof(lhs));
                  CMTimeRangeMakeFromDictionary(&lhs, (CFDictionaryRef)v36);
                  memset(&rhs, 0, sizeof(rhs));
                  CMTimeRange v68 = v98;
                  CMTimeRange v67 = lhs;
                  CMTimeRangeGetIntersection(&rhs, &v68, &v67);
                  if ((rhs.start.flags & 1) != 0
                    && (rhs.duration.flags & 1) != 0
                    && !rhs.duration.epoch
                    && (rhs.duration.value & 0x8000000000000000) == 0)
                  {
                    CMTime v66 = rhs.duration;
                    float v34 = v34 + width * height * CMTimeGetSeconds(&v66);
                  }
                }
                uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v107 count:16];
              }
              while (v32);
            }
            else
            {
              float v34 = 0.0;
            }

            lhs.CMTime start = v98.duration;
            *(_OWORD *)&rhs.start.value = *MEMORY[0x1E4F1FA48];
            rhs.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            if (CMTimeCompare(&lhs.start, &rhs.start))
            {
              CMTime v65 = v98.duration;
              double v41 = v34 / CMTimeGetSeconds(&v65);
            }
            else
            {
              double v41 = 0.0;
            }
            float v42 = v41;
            if (v42 >= 0.04)
            {
LABEL_65:
              CMTime v64 = v98.duration;
              double Seconds = CMTimeGetSeconds(&v64);
              CMTime v63 = v102.duration;
              if (Seconds > CMTimeGetSeconds(&v63))
              {
                CMTimeRange v102 = v98;
                float v99 = v13;
              }
            }
          }
        }
      }
    }
LABEL_27:

    ++v57;
  }
  if ((v102.start.flags & 1) == 0)
  {
LABEL_68:
    int v44 = 0;
    goto LABEL_69;
  }
  int v44 = 0;
  if ((v102.duration.flags & 1) != 0 && !v102.duration.epoch && (v102.duration.value & 0x8000000000000000) == 0)
  {
    v98.CMTime start = v102.duration;
    *(_OWORD *)&lhs.start.value = *MEMORY[0x1E4F1FA48];
    lhs.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    if (CMTimeCompare(&v98.start, &lhs.start))
    {
      CMTime v62 = v105.duration;
      if (CMTimeGetSeconds(&v62) >= 2.29999995) {
        goto LABEL_84;
      }
      *(_OWORD *)&v98.start.value = *(_OWORD *)&v102.start.value;
      v98.start.epoch = v102.start.epoch;
      *(_OWORD *)&lhs.start.value = *(_OWORD *)&v105.start.value;
      lhs.start.epoch = v105.start.epoch;
      if (!CMTimeCompare(&v98.start, &lhs.start))
      {
        *(_OWORD *)&v98.start.value = *(_OWORD *)&v105.start.value;
        v98.start.epoch = v105.start.epoch;
        *(_OWORD *)&lhs.start.value = -[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength;
        lhs.start.epoch = qword_1EB723720;
        CMTimeAdd(&rhs.start, &v98.start, &lhs.start);
        *(_OWORD *)&v102.start.value = *(_OWORD *)&rhs.start.value;
        v102.start.epoch = rhs.start.epoch;
        v98.CMTime start = v102.duration;
        *(_OWORD *)&lhs.start.value = -[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength;
        lhs.start.epoch = qword_1EB723720;
        CMTimeSubtract(&rhs.start, &v98.start, &lhs.start);
        v102.CMTime duration = rhs.start;
      }
      CMTimeRange v61 = v102;
      CMTimeRangeGetEnd(&rhs.start, &v61);
      CMTimeRange v60 = v105;
      CMTimeRangeGetEnd(&v106, &v60);
      *(_OWORD *)&v98.start.value = *(_OWORD *)&rhs.start.value;
      v98.start.epoch = rhs.start.epoch;
      lhs.CMTime start = v106;
      if (!CMTimeCompare(&v98.start, &lhs.start))
      {
        v98.CMTime start = v102.duration;
        *(_OWORD *)&lhs.start.value = -[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength;
        lhs.start.epoch = qword_1EB723720;
        CMTimeSubtract(&rhs.start, &v98.start, &lhs.start);
        v102.CMTime duration = rhs.start;
      }
      if ((v102.start.flags & 1) == 0
        || (v102.duration.flags & 1) == 0
        || v102.duration.epoch
        || v102.duration.value < 0
        || (v59 = v102.duration, CMTime v58 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v59, &v58)))
      {
LABEL_84:
        int v44 = AddResultDictionary(&v102.start, &v102.duration, &v99, 0, 0, v47);
        if (v44) {
          goto LABEL_69;
        }
        [v50 setObject:v47 forKey:@"IrisRecommendResults"];
      }
    }
    goto LABEL_68;
  }
LABEL_69:

  return v44;
}

- (float)assetQualityScoreFromAnalysis:(id)a3 withFpsRate:(float)a4
{
  id v5 = a3;
  long long v6 = [v5 objectForKey:@"metadataRanges"];
  float v31 = a4;
  CFDictionaryRef v7 = [v6 objectForKey:@"QualityResults"];

  unint64_t v8 = 0;
  float v9 = 1.0;
  float v10 = 0.0;
  float v11 = 1.0;
  float v12 = 0.0;
  float v13 = 0.0;
  float v14 = 0.0;
  while (v8 < [v7 count])
  {
    CFDictionaryRef v15 = [v7 objectAtIndex:v8];
    memset(&v33, 0, sizeof(v33));
    CMTimeRangeMakeFromDictionary(&v33, v15);
    CMTime time = v33.duration;
    double Seconds = CMTimeGetSeconds(&time);
    BOOL v17 = [(__CFDictionary *)v15 objectForKey:@"quality"];
    [v17 floatValue];
    float v19 = v18;

    uint64_t v20 = [v7 count];
    float v21 = Seconds;
    BOOL v22 = v11 > 0.3;
    BOOL v23 = v11 <= 0.3;
    if (v19 <= 0.3) {
      BOOL v23 = 0;
    }
    else {
      BOOL v22 = 0;
    }
    int v24 = v22 || v23;
    float v25 = 0.0;
    if (v19 > 0.3) {
      float v25 = 1.0;
    }
    if (v24) {
      float v12 = v12 + 1.0;
    }
    float v10 = v10 + (float)(v25 * v21);
    float v14 = v14 + (float)(v19 * v21);
    float v13 = v13 + v21;
    if (v9 > v21 && v8 < v20 - 1) {
      float v9 = Seconds;
    }

    ++v8;
    float v11 = v19;
  }
  if (v13 == 0.0)
  {
    float v29 = 0.0;
  }
  else
  {
    float v27 = (float)((float)((float)((float)(v9 * (float)(v12 * -0.4)) / v13) + 1.0)
                * (float)((float)(v10 * (float)(v14 / v13)) / v13))
        * (float)(erff((float)((float)(v13 / v31) + -10.0) / 424.26) + 1.0);
    if (v27 < 1.0) {
      float v28 = v27;
    }
    else {
      float v28 = 1.0;
    }
    if (v27 <= 0.0) {
      float v29 = 0.0;
    }
    else {
      float v29 = v28;
    }
  }

  return v29;
}

- (float)assetActionScoreFromAnalysis:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v40 = [a3 objectForKey:@"metadataRanges"];
  v3 = objc_msgSend(v40, "objectForKey:");
  uint64_t v39 = [v3 count];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = [v40 objectForKey:@"QualityResults"];
  uint64_t v4 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v4)
  {
    uint64_t v41 = v4;
    uint64_t v38 = *(void *)v67;
    float v5 = 0.0;
    float v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v7 = *(const __CFDictionary **)(*((void *)&v66 + 1) + 8 * i);
        memset(&v65, 0, sizeof(v65));
        CMTimeRangeMakeFromDictionary(&v65, v7);
        memset(&v64, 0, sizeof(v64));
        CMTimeRange range = v65;
        CMTimeRangeGetEnd(&v64, &range);
        if (v39)
        {
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          unint64_t v8 = [v40 objectForKey:@"FineSubjectMotionResults"];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v60;
LABEL_9:
            uint64_t v11 = 0;
            while (1)
            {
              if (*(void *)v60 != v10) {
                objc_enumerationMutation(v8);
              }
              CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v59 + 1) + 8 * v11);
              memset(&v58, 0, sizeof(v58));
              CMTimeRangeMakeFromDictionary(&v58, v12);
              *(_OWORD *)&time1.start.value = *(_OWORD *)&v58.start.value;
              time1.start.epoch = v58.start.epoch;
              CMTime time2 = v64;
              if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
                break;
              }
              CMTimeRange v56 = v58;
              memset(&time1, 0, sizeof(time1));
              CMTimeRange otherRange = v65;
              CMTimeRangeGetIntersection(&time1, &v56, &otherRange);
              if ((time1.start.flags & 1) == 0
                || (time1.duration.flags & 1) == 0
                || time1.duration.epoch
                || time1.duration.value < 0
                || (CMTime duration = time1.duration,
                    CMTime v53 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
                    CMTimeCompare(&duration, &v53)))
              {
                float v13 = [(__CFDictionary *)v12 objectForKey:@"quality"];
                [v13 floatValue];
                float v15 = v14;

                uint64_t v16 = [(__CFDictionary *)v7 objectForKey:@"quality"];
                [v16 floatValue];
                float v18 = v17;

                CMTime time = time1.duration;
                float Seconds = CMTimeGetSeconds(&time);
                if (v15 < 0.3) {
                  float v20 = 0.0;
                }
                else {
                  float v20 = 1.0;
                }
                float v6 = v6 + (float)((float)(v18 * v20) * Seconds);
                float v5 = v5 + Seconds;
              }
              if (v9 == ++v11)
              {
                uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
                if (v9) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }
        }
        else
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          unint64_t v8 = [v40 objectForKey:@"SubjectMotionResults"];
          uint64_t v21 = [v8 countByEnumeratingWithState:&v48 objects:v71 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v49;
LABEL_27:
            uint64_t v23 = 0;
            while (1)
            {
              if (*(void *)v49 != v22) {
                objc_enumerationMutation(v8);
              }
              CFDictionaryRef v24 = *(const __CFDictionary **)(*((void *)&v48 + 1) + 8 * v23);
              memset(&v58, 0, sizeof(v58));
              CMTimeRangeMakeFromDictionary(&v58, v24);
              *(_OWORD *)&time1.start.value = *(_OWORD *)&v58.start.value;
              time1.start.epoch = v58.start.epoch;
              CMTime time2 = v64;
              if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
                break;
              }
              memset(&time1, 0, sizeof(time1));
              CMTimeRange v47 = v58;
              CMTimeRange v46 = v65;
              CMTimeRangeGetIntersection(&time1, &v47, &v46);
              if ((time1.start.flags & 1) == 0
                || (time1.duration.flags & 1) == 0
                || time1.duration.epoch
                || time1.duration.value < 0
                || (v45 = time1.duration, CMTime v44 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&v45, &v44)))
              {
                float v25 = [(__CFDictionary *)v7 objectForKey:@"quality"];
                [v25 floatValue];
                float v27 = v26;

                float v28 = [(__CFDictionary *)v24 objectForKey:@"flags"];
                int v29 = [v28 unsignedIntegerValue];

                CMTime v43 = time1.duration;
                double v30 = CMTimeGetSeconds(&v43);
                if ((*(void *)&v29 & 0x20000) != 0) {
                  float v31 = 1.0;
                }
                else {
                  float v31 = 0.0;
                }
                float v32 = v30;
                float v6 = v6 + (float)((float)(v27 * v31) * v32);
                float v5 = v5 + v32;
              }
              if (v21 == ++v23)
              {
                uint64_t v21 = [v8 countByEnumeratingWithState:&v48 objects:v71 count:16];
                if (v21) {
                  goto LABEL_27;
                }
                break;
              }
            }
          }
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v41);
  }
  else
  {
    float v5 = 0.0;
    float v6 = 0.0;
  }

  float v33 = (float)(erff((float)((float)(v6 / fmaxf(v5, 1.0)) * 12.0) + -1.8) * 0.5) + 0.5;
  if (v33 < 1.0) {
    float v34 = v33;
  }
  else {
    float v34 = 1.0;
  }
  if (v33 <= 0.0) {
    float v35 = 0.0;
  }
  else {
    float v35 = v34;
  }

  return v35;
}

- (float)assetExpressionScoreFromAnalysis:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  float v33 = [a3 objectForKey:@"metadataRanges"];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = [v33 objectForKey:@"QualityResults"];
  uint64_t v3 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v3)
  {
    uint64_t v34 = v3;
    uint64_t v32 = *(void *)v52;
    float v4 = 0.0;
    float v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v6 = *(const __CFDictionary **)(*((void *)&v51 + 1) + 8 * i);
        memset(&v50, 0, sizeof(v50));
        CMTimeRangeMakeFromDictionary(&v50, v6);
        memset(&v49, 0, sizeof(v49));
        CMTimeRange range = v50;
        CMTimeRangeGetEnd(&v49, &range);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v36 = [v33 objectForKey:@"FaceResults"];
        uint64_t v7 = [v36 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v45;
LABEL_8:
          uint64_t v9 = 0;
          while (1)
          {
            if (*(void *)v45 != v8) {
              objc_enumerationMutation(v36);
            }
            CFDictionaryRef v10 = *(const __CFDictionary **)(*((void *)&v44 + 1) + 8 * v9);
            memset(&v43, 0, sizeof(v43));
            CMTimeRangeMakeFromDictionary(&v43, v10);
            *(_OWORD *)&time1.start.value = *(_OWORD *)&v43.start.value;
            time1.start.epoch = v43.start.epoch;
            CMTime time2 = v49;
            if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
              break;
            }
            CMTimeRange v41 = v43;
            memset(&time1, 0, sizeof(time1));
            CMTimeRange otherRange = v50;
            CMTimeRangeGetIntersection(&time1, &v41, &otherRange);
            if ((time1.start.flags & 1) == 0
              || (time1.duration.flags & 1) == 0
              || time1.duration.epoch
              || time1.duration.value < 0
              || (CMTime duration = time1.duration,
                  CMTime v38 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
                  CMTimeCompare(&duration, &v38)))
            {
              uint64_t v11 = [(__CFDictionary *)v10 objectForKey:@"attributes"];
              CFDictionaryRef v12 = [v11 objectForKey:@"faceBounds"];
              float v13 = [(__CFDictionary *)v10 objectForKey:@"flags"];
              char v14 = [v13 intValue];
              NSRect v59 = NSRectFromString(v12);
              float v15 = v59.size.width * v59.size.height + -0.170000002;
              float v16 = -[VCPVideoGlobalAnalyzer assetExpressionScoreFromAnalysis:]::kAreaSigma[v15 > 0.0];
              CMTime time = time1.duration;
              double Seconds = CMTimeGetSeconds(&time);
              float v18 = expf((float)-(float)(v15 * v15) / v16);
              if ((v14 & 2) != 0) {
                float v19 = 0.3;
              }
              else {
                float v19 = 0.0;
              }
              float v20 = v19 + v18;
              if (v20 < 1.0) {
                float v21 = v20;
              }
              else {
                float v21 = 1.0;
              }
              if (v20 <= 0.0) {
                float v22 = 0.0;
              }
              else {
                float v22 = v21;
              }
              uint64_t v23 = [(__CFDictionary *)v6 objectForKey:@"quality"];
              [v23 floatValue];
              float v25 = v24;

              float v26 = Seconds;
              float v5 = v5 + (float)(sqrtf(v22 * v25) * v26);
              float v4 = v4 + v26;
            }
            if (v7 == ++v9)
            {
              uint64_t v7 = [v36 countByEnumeratingWithState:&v44 objects:v56 count:16];
              if (v7) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v34);
  }
  else
  {
    float v4 = 0.0;
    float v5 = 0.0;
  }

  float v27 = 1.0;
  float v28 = v5 / fmaxf(v4, 1.0);
  if (v28 < 1.0) {
    float v27 = v28;
  }
  if (v28 <= 0.0) {
    float v29 = 0.0;
  }
  else {
    float v29 = v27;
  }

  return v29;
}

- (float)assetVoiceScoreFromAnalysis:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"metadataRanges"];
  float v4 = [v3 objectForKey:@"QualityResults"];
  CFDictionaryRef v5 = [v4 lastObject];

  memset(&v27, 0, sizeof(v27));
  CMTimeRangeMakeFromDictionary(&v27, v5);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&v27.start.value;
  lhs.start.epoch = v27.start.epoch;
  CMTime rhs = v27.duration;
  CMTimeAdd(&time, &lhs.start, &rhs);
  float Seconds = CMTimeGetSeconds(&time);
  if (Seconds == 0.0)
  {
    float v13 = 0.0;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [v3 objectForKey:@"VoiceResults"];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      float v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v7);
          }
          CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v22 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v12);
          CMTime duration = lhs.duration;
          float v10 = CMTimeGetSeconds(&duration) + v10;
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v8);
    }
    else
    {
      float v10 = 0.0;
    }

    float v14 = (float)(Seconds - v10) / Seconds;
    if (v14 < 1.0) {
      float v15 = (float)(Seconds - v10) / Seconds;
    }
    else {
      float v15 = 1.0;
    }
    if (v14 <= 0.0) {
      float v16 = 0.0;
    }
    else {
      float v16 = v15;
    }
    float v17 = expf((float)(v16 * v16) * -4.0);
    if (v17 < 1.0) {
      float v18 = v17;
    }
    else {
      float v18 = 1.0;
    }
    if (v17 <= 0.0) {
      float v13 = 0.0;
    }
    else {
      float v13 = v18;
    }
  }

  return v13;
}

- (float)assetCameraMotionScoreFromAnalysis:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  float v33 = [a3 objectForKey:@"metadataRanges"];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = [v33 objectForKey:@"QualityResults"];
  uint64_t v3 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v3)
  {
    uint64_t v34 = v3;
    uint64_t v32 = *(void *)v52;
    float v4 = 0.0;
    float v5 = 0.0;
    float v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v7 = *(const __CFDictionary **)(*((void *)&v51 + 1) + 8 * i);
        memset(&v50, 0, sizeof(v50));
        CMTimeRangeMakeFromDictionary(&v50, v7);
        memset(&v49, 0, sizeof(v49));
        CMTimeRange range = v50;
        CMTimeRangeGetEnd(&v49, &range);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v36 = [v33 objectForKey:@"CameraMotionResults"];
        uint64_t v8 = [v36 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v45;
LABEL_8:
          uint64_t v10 = 0;
          while (1)
          {
            if (*(void *)v45 != v9) {
              objc_enumerationMutation(v36);
            }
            CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v44 + 1) + 8 * v10);
            memset(&v43, 0, sizeof(v43));
            CMTimeRangeMakeFromDictionary(&v43, v11);
            *(_OWORD *)&time1.start.value = *(_OWORD *)&v43.start.value;
            time1.start.epoch = v43.start.epoch;
            CMTime time2 = v49;
            if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0) {
              break;
            }
            CMTimeRange v41 = v43;
            memset(&time1, 0, sizeof(time1));
            CMTimeRange otherRange = v50;
            CMTimeRangeGetIntersection(&time1, &v41, &otherRange);
            if ((time1.start.flags & 1) == 0
              || (time1.duration.flags & 1) == 0
              || time1.duration.epoch
              || time1.duration.value < 0
              || (CMTime duration = time1.duration,
                  CMTime v38 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
                  CMTimeCompare(&duration, &v38)))
            {
              CFDictionaryRef v12 = [(__CFDictionary *)v11 objectForKey:@"flags"];
              int v13 = [v12 intValue];
              int v14 = v13 & 0x3FFC0;
              unsigned int v15 = __clz(__rbit32(v13 & 0x2FFC0));
              if (v16 | ((v13 & 0x2FFC0) == 0)) {
                unsigned int v17 = 0;
              }
              else {
                unsigned int v17 = v15;
              }
              CMTime time = time1.duration;
              double Seconds = CMTimeGetSeconds(&time);
              float v19 = [(__CFDictionary *)v7 objectForKey:@"quality"];
              [v19 floatValue];
              float v21 = v20;

              if ((v14 & 0x10000) != 0
                || (v17 - 7 >= 4 ? (BOOL v22 = v17 == 12) : (BOOL v22 = 1),
                    !v22
                 || ((float v23 = Seconds, (float)(v21 + 0.2) < 1.0) ? (v24 = v21 + 0.2) : (v24 = 1.0),
                     (float)(v21 + 0.2) <= 0.0 ? (float v25 = 0.0) : (float v25 = v24),
                     float v6 = v6 + (float)(v23 * v25),
                     float v5 = v5 + v23,
                     v4 >= v23)))
              {
                float v23 = v4;
              }

              float v4 = v23;
            }
            if (v8 == ++v10)
            {
              uint64_t v8 = [v36 countByEnumeratingWithState:&v44 objects:v56 count:16];
              if (v8) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v34);
  }
  else
  {
    float v4 = 0.0;
    float v5 = 0.0;
    float v6 = 0.0;
  }

  BOOL v26 = v5 == 0.0 || v4 < 0.5;
  float v27 = v6 / v5;
  if (v26) {
    float v27 = 0.0;
  }
  float v28 = 1.0;
  if (v27 < 1.0) {
    float v28 = v27;
  }
  if (v27 <= 0.0) {
    float v29 = 0.0;
  }
  else {
    float v29 = v28;
  }

  return v29;
}

- (BOOL)hasMeaningfulSceneSegment:(id)a3 withFpsRate:(float)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  float v5 = [a3 objectForKey:@"metadataRanges"];
  float v6 = [v5 objectForKey:@"SceneResults"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    double v10 = a4;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v20 + 1) + 8 * i);
        memset(&v19, 0, sizeof(v19));
        CMTimeRangeMakeFromDictionary(&v19, v12);
        int v13 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"quality"];
        [v13 floatValue];
        float v15 = v14;

        CMTime duration = v19.duration;
        Float64 Seconds = CMTimeGetSeconds(&duration);
        if (v15 >= 0.3)
        {
          Float64 Seconds = Seconds / v10;
          *(float *)&Float64 Seconds = Seconds;
          if (*(float *)&Seconds >= 3.0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, Seconds);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

- (float)assetJunkScoreFromAnalysis:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKey:@"metadataRanges"];
  float v4 = [v3 objectForKey:@"InterestingnessResults"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {

LABEL_13:
    float v17 = 1.0;
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)v24;
  float v8 = 0.0;
  float v9 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(v5);
      }
      CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v23 + 1) + 8 * i);
      memset(&v22, 0, sizeof(v22));
      CMTimeRangeMakeFromDictionary(&v22, v11);
      CMTime duration = v22.duration;
      double Seconds = CMTimeGetSeconds(&duration);
      int v13 = [(__CFDictionary *)v11 objectForKey:@"quality"];
      [v13 floatValue];
      float v15 = v14;

      float v16 = Seconds;
      float v8 = v8 + (float)(v15 * v16);
      float v9 = v9 + v16;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v6);

  if (v9 == 0.0) {
    goto LABEL_13;
  }
  float v17 = (float)((float)(v8 / v9) * (float)(erff((float)(v9 * 3.0) + -2.0) + 1.0)) * 0.5;
  if (v17 >= *(float *)&-[VCPVideoGlobalAnalyzer assetJunkScoreFromAnalysis:]::kThreshold[4 * (v9 > 2.0)]) {
    float v17 = 1.0;
  }
LABEL_14:
  float v18 = 1.0;
  if (v17 < 1.0) {
    float v18 = v17;
  }
  if (v17 <= 0.0) {
    float v19 = 0.0;
  }
  else {
    float v19 = v18;
  }

  return v19;
}

- (float)scaleForTimeRange:(id *)a3 basedOnFace:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v45;
    float v8 = 0.0;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v5);
        }
        CFDictionaryRef v10 = *(const __CFDictionary **)(*((void *)&v44 + 1) + 8 * v9);
        memset(&v43, 0, sizeof(v43));
        CMTimeRangeMakeFromDictionary(&v43, v10);
        CMTimeRange range = v43;
        long long v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v11;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v42, &range, &otherRange);
        if ((v42.start.flags & 1) == 0) {
          goto LABEL_9;
        }
        CMTimeRange v38 = v43;
        long long v12 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v37.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v37.start.epoch = v12;
        *(_OWORD *)&v37.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v39, &v38, &v37);
        if ((v39.duration.flags & 1) == 0) {
          goto LABEL_9;
        }
        CMTimeRange v35 = v43;
        long long v13 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v34.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v34.start.epoch = v13;
        *(_OWORD *)&v34.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v36, &v35, &v34);
        if (v36.duration.epoch) {
          goto LABEL_9;
        }
        CMTimeRange v32 = v43;
        long long v19 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v31.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v31.start.epoch = v19;
        *(_OWORD *)&v31.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v33, &v32, &v31);
        if (v33.duration.value < 0) {
          goto LABEL_9;
        }
        CMTimeRange v28 = v43;
        long long v20 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v27.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v27.start.epoch = v20;
        *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v29, &v28, &v27);
        CMTime time1 = v29.duration;
        CMTime v26 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (CMTimeCompare(&time1, &v26))
        {
LABEL_9:
          float v14 = [(__CFDictionary *)v10 objectForKey:@"attributes"];
          float v15 = [v14 objectForKey:@"faceBounds"];
          NSRect v50 = NSRectFromString(v15);
          double width = v50.size.width;
          double height = v50.size.height;

          float v18 = width * height;
          if (v8 < v18) {
            float v8 = width * height;
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v21 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v6 = v21;
    }
    while (v21);

    float v22 = 1.0;
    if (v8 > 0.05)
    {
      float v23 = 1.0;
      float v24 = 1.0 - sqrtf(v8);
      if (v24 < 1.0) {
        float v23 = v24;
      }
      if (v24 <= 0.0) {
        float v22 = 0.0;
      }
      else {
        float v22 = v23;
      }
    }
  }
  else
  {

    float v22 = 1.0;
  }

  return v22;
}

- (float)subjectActivityInTimeRange:(id *)a3 fromResults:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v38 = a4;
  uint64_t v6 = [v38 objectForKey:@"FaceResults"];
  uint64_t v7 = [v38 objectForKey:@"FineSubjectMotionResults"];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    long long v59 = 0uLL;
    long long v60 = 0uLL;
    long long v57 = 0uLL;
    long long v58 = 0uLL;
    uint64_t v9 = [v38 objectForKey:@"FineSubjectMotionResults"];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v58;
      float v12 = 0.0;
      float v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v58 != v11) {
            objc_enumerationMutation(v9);
          }
          CFDictionaryRef v15 = *(const __CFDictionary **)(*((void *)&v57 + 1) + 8 * i);
          memset(&v56, 0, sizeof(v56));
          CMTimeRangeMakeFromDictionary(&v56, v15);
          long long v16 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&range.start.epoch = v16;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
          memset(&v55, 0, sizeof(v55));
          CMTimeRange otherRange = v56;
          CMTimeRangeGetIntersection(&v55, &range, &otherRange);
          if ((v55.start.flags & 1) != 0
            && (v55.duration.flags & 1) != 0
            && !v55.duration.epoch
            && (v55.duration.value & 0x8000000000000000) == 0)
          {
            CMTime time1 = v55.duration;
            CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            if (!CMTimeCompare(&time1, &time2)) {
              continue;
            }
          }
          float v17 = [(__CFDictionary *)v15 objectForKey:@"quality"];
          [v17 floatValue];
          float v19 = v18;

          if ([v6 count])
          {
            CMTimeRange v50 = v55;
            [(VCPVideoGlobalAnalyzer *)self scaleForTimeRange:&v50 basedOnFace:v6];
            float v21 = v20;
          }
          else
          {
            float v21 = 1.0;
          }
          CMTime time = v55.duration;
          float Seconds = CMTimeGetSeconds(&time);
          float v13 = v13 + (float)((float)(v19 * v21) * Seconds);
          float v12 = v12 + Seconds;
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v10);
      goto LABEL_40;
    }
LABEL_39:
    float v12 = 0.0;
    float v13 = 0.0;
    goto LABEL_40;
  }
  long long v47 = 0uLL;
  long long v48 = 0uLL;
  long long v45 = 0uLL;
  long long v46 = 0uLL;
  uint64_t v9 = [v38 objectForKey:@"SubjectMotionResults"];
  uint64_t v23 = [v9 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (!v23) {
    goto LABEL_39;
  }
  uint64_t v24 = *(void *)v46;
  float v12 = 0.0;
  float v13 = 0.0;
  do
  {
    for (uint64_t j = 0; j != v23; ++j)
    {
      if (*(void *)v46 != v24) {
        objc_enumerationMutation(v9);
      }
      CFDictionaryRef v26 = *(const __CFDictionary **)(*((void *)&v45 + 1) + 8 * j);
      memset(&v56, 0, sizeof(v56));
      CMTimeRangeMakeFromDictionary(&v56, v26);
      memset(&v55, 0, sizeof(v55));
      long long v27 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v44.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v44.start.epoch = v27;
      *(_OWORD *)&v44.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRange v43 = v56;
      CMTimeRangeGetIntersection(&v55, &v44, &v43);
      if ((v55.start.flags & 1) != 0
        && (v55.duration.flags & 1) != 0
        && !v55.duration.epoch
        && (v55.duration.value & 0x8000000000000000) == 0)
      {
        CMTime duration = v55.duration;
        CMTime v41 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (!CMTimeCompare(&duration, &v41)) {
          continue;
        }
      }
      CMTimeRange v28 = [(__CFDictionary *)v26 objectForKey:@"flags"];
      if (([v28 unsignedIntegerValue] & 0x20000) != 0) {
        float v29 = 0.5;
      }
      else {
        float v29 = 0.0;
      }

      if ([v6 count])
      {
        CMTimeRange v40 = v55;
        [(VCPVideoGlobalAnalyzer *)self scaleForTimeRange:&v40 basedOnFace:v6];
        float v31 = v30;
      }
      else
      {
        float v31 = 1.0;
      }
      CMTime v39 = v55.duration;
      float v32 = CMTimeGetSeconds(&v39);
      float v13 = v13 + (float)((float)(v29 * v31) * v32);
      float v12 = v12 + v32;
    }
    uint64_t v23 = [v9 countByEnumeratingWithState:&v45 objects:v61 count:16];
  }
  while (v23);
LABEL_40:

  if (v12 == 0.0) {
    float v33 = 1.0;
  }
  else {
    float v33 = v12;
  }
  float v34 = 1.0 - expf((float)((float)(v13 / v33) * (float)(v13 / v33)) / -0.15);
  if (v34 < 1.0) {
    float v35 = v34;
  }
  else {
    float v35 = 1.0;
  }
  if (v34 <= 0.0) {
    float v36 = 0.0;
  }
  else {
    float v36 = v35;
  }

  return v36;
}

- (float)cameraActivityfromQuality:(float)a3
{
  float v3 = (float)(a3 + -1.0) * -1.25;
  float v4 = 1.0;
  if (v3 < 1.0) {
    float v4 = v3;
  }
  BOOL v5 = v3 > 0.0;
  float result = 0.0;
  if (v5) {
    return v4;
  }
  return result;
}

- (BOOL)isJunkTimeRange:(id *)a3 basedOnResults:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v5 = [a4 objectForKey:@"InterestingnessResults"];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    float v8 = 0.0;
    uint64_t v9 = (CMTime *)MEMORY[0x1E4F1FA48];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v23 + 1) + 8 * i);
        memset(&v22, 0, sizeof(v22));
        CMTimeRangeMakeFromDictionary(&v22, v11);
        long long v12 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = v12;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        memset(&v21, 0, sizeof(v21));
        CMTimeRange otherRange = v22;
        CMTimeRangeGetIntersection(&v21, &range, &otherRange);
        if ((v21.start.flags & 1) != 0
          && (v21.duration.flags & 1) != 0
          && !v21.duration.epoch
          && (v21.duration.value & 0x8000000000000000) == 0)
        {
          CMTime time1 = v21.duration;
          CMTime time2 = *v9;
          if (!CMTimeCompare(&time1, &time2)) {
            continue;
          }
        }
        [(__CFDictionary *)v11 vcp_quality];
        if (v13 < 0.342999995)
        {
          CMTime time = v21.duration;
          float v8 = CMTimeGetSeconds(&time) + v8;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
  else
  {
    float v8 = 0.0;
  }

  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
  return v8 / CMTimeGetSeconds((CMTime *)&var1) > 0.300000012;
}

- (float)assetActivityLevelFromAnalysisResults:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  BOOL v5 = [v4 objectForKey:@"QualityResults"];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v6)
  {

LABEL_28:
    float v27 = 0.0;
    goto LABEL_29;
  }
  uint64_t v7 = *(void *)v36;
  float v8 = (CMTime *)MEMORY[0x1E4F1FA48];
  float v9 = 0.0;
  float v10 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v36 != v7) {
        objc_enumerationMutation(v5);
      }
      CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v35 + 1) + 8 * i);
      memset(&v34, 0, sizeof(v34));
      CMTimeRangeMakeFromDictionary(&v34, v12);
      [(__CFDictionary *)v12 vcp_quality];
      double v14 = v13;
      if ((v34.start.flags & 1) != 0
        && (v34.duration.flags & 1) != 0
        && !v34.duration.epoch
        && (v34.duration.value & 0x8000000000000000) == 0)
      {
        CMTime time1 = v34.duration;
        CMTime time2 = *v8;
        if (!CMTimeCompare(&time1, &time2)) {
          continue;
        }
      }
      if (v14 >= 0.200000003)
      {
        CMTimeRange v31 = v34;
        if (![(VCPVideoGlobalAnalyzer *)self isJunkTimeRange:&v31 basedOnResults:v4])
        {
          CMTimeRange v30 = v34;
          [(VCPVideoGlobalAnalyzer *)self subjectActivityInTimeRange:&v30 fromResults:v4];
          float v16 = v15;
          *(float *)&double v17 = v14;
          [(VCPVideoGlobalAnalyzer *)self cameraActivityfromQuality:v17];
          float v19 = v18;
          CMTime duration = v34.duration;
          double Seconds = CMTimeGetSeconds(&duration);
          float v21 = (float)(v19 * 0.4) + (float)(v16 * 0.6);
          if (v21 < 1.0) {
            float v22 = (float)(v19 * 0.4) + (float)(v16 * 0.6);
          }
          else {
            float v22 = 1.0;
          }
          BOOL v23 = v21 > 0.0;
          float v24 = 0.0;
          if (v23) {
            float v24 = v22;
          }
          float v25 = Seconds;
          float v9 = v9 + (float)(v24 * v25);
          float v10 = v10 + v25;
        }
      }
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  }
  while (v6);

  if (v10 == 0.0) {
    goto LABEL_28;
  }
  float v26 = 1.0;
  if ((float)(v9 / v10) < 1.0) {
    float v26 = v9 / v10;
  }
  if ((float)(v9 / v10) <= 0.0) {
    float v27 = 0.0;
  }
  else {
    float v27 = v26;
  }
LABEL_29:

  return v27;
}

- (int)setActivityLevel:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  float v35 = 0.0;
  if ((int)SocType() >= 247)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ActivityLevelResults"];
    if ((unint64_t)[v6 count] < 2)
    {
      int v7 = 0;
LABEL_17:

      goto LABEL_20;
    }
    memset(&v34, 0, sizeof(v34));
    CFDictionaryRef v9 = [v6 firstObject];
    CMTimeRangeMakeFromDictionary(&v34, v9);

    memset(&v33, 0, sizeof(v33));
    CFDictionaryRef v10 = [v6 lastObject];
    CMTimeRangeMakeFromDictionary(&v33, v10);

    memset(&v32, 0, sizeof(v32));
    CMTime start = v34.start;
    CMTimeRange range = v33;
    CMTimeRangeGetEnd(&v29, &range);
    lhs.CMTime start = v29;
    CMTime rhs = v34.start;
    CMTimeSubtract(&duration, &lhs.start, &rhs);
    CMTimeRangeMake(&v32, &start, &duration);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      float v14 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          CFDictionaryRef v16 = *(const __CFDictionary **)(*((void *)&v24 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v16);
          [(__CFDictionary *)v16 vcp_quality];
          double v18 = v17;
          CMTime time = lhs.duration;
          Float64 Seconds = CMTimeGetSeconds(&time);
          *(float *)&Float64 Seconds = v35 + v18 * Seconds;
          float v35 = *(float *)&Seconds;
          CMTime v21 = lhs.duration;
          float v14 = CMTimeGetSeconds(&v21) + v14;
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v37 count:16];
      }
      while (v12);

      if (v14 != 0.0) {
        float v35 = v35 / v14;
      }
    }
    else
    {
    }
    int v7 = AddResultDictionary(&v32.start, &v32.duration, &v35, 0, 0, v5);
    if (v7) {
      goto LABEL_17;
    }

LABEL_19:
    [v4 setObject:v5 forKey:@"ActivityLevelResults"];
    int v7 = 0;
    goto LABEL_20;
  }
  [(VCPVideoGlobalAnalyzer *)self assetActivityLevelFromAnalysisResults:v4];
  float v35 = v8;
  int v7 = AddResultDictionary(0, 0, &v35, 0, 0, v5);
  if (!v7) {
    goto LABEL_19;
  }
LABEL_20:

  return v7;
}

@end