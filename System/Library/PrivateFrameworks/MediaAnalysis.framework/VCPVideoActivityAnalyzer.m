@interface VCPVideoActivityAnalyzer
- (VCPVideoActivityAnalyzer)init;
- (float)actionScoreInTimeRange:(id *)a3;
- (float)scaleBasedOnFaceForTimeRange:(id *)a3;
- (float)validationScoreOfTimeRange:(id *)a3 fromResult:(id)a4 startIdx:(int *)a5;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7;
- (int)computeActivityScoreAtTime:(id *)a3;
- (int)extractRequiredClassificationInfoFrom:(id)a3 toArray:(id)a4;
- (int)extractRequiredFaceInfoFrom:(id)a3 toArray:(id)a4;
- (int)extractRequiredInfoFrom:(id)a3 toArray:(id)a4;
- (int)finishAnalysisPass:(id *)a3 fpsRate:(float)a4;
- (int)preProcessQualityResults:(id)a3 interestingnessResults:(id)a4 obstructionResults:(id)a5 classificationResults:(id)a6 fineActionResults:(id)a7 faceResults:(id)a8 sceneSwitchFrequency:(float)a9;
- (void)addSceneClassificationContributionToActivityLevel:(float *)a3;
- (void)addSceneSwitchFrequencyConstributionToActivityLevel:(float *)a3;
- (void)generateActivityDescriptor;
- (void)normalizeActivityDescriptor;
- (void)resetActivityStatsAtTime:(id *)a3;
- (void)validateActivityScores;
@end

@implementation VCPVideoActivityAnalyzer

- (VCPVideoActivityAnalyzer)init
{
  v48.receiver = self;
  v48.super_class = (Class)VCPVideoActivityAnalyzer;
  v2 = [(VCPVideoActivityAnalyzer *)&v48 init];
  if (!v2) {
    goto LABEL_23;
  }
  BOOL v47 = +[VCPCNNMetalContext supportGPU];
  v3 = objc_alloc_init(VCPVideoActivityDescriptor);
  v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v5;

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = (void *)*((void *)v2 + 4);
  *((void *)v2 + 4) = v9;

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = (void *)*((void *)v2 + 5);
  *((void *)v2 + 5) = v11;

  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = (void *)*((void *)v2 + 6);
  *((void *)v2 + 6) = v13;

  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  v16 = (void *)*((void *)v2 + 7);
  *((void *)v2 + 7) = v15;

  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  v18 = (void *)*((void *)v2 + 8);
  *((void *)v2 + 8) = v17;

  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  v20 = (void *)*((void *)v2 + 9);
  *((void *)v2 + 9) = v19;

  uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
  v22 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = v21;

  *((_DWORD *)v2 + 22) = 0;
  *((void *)v2 + 12) = 0;
  uint64_t v23 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(_OWORD *)(v2 + 104) = *MEMORY[0x1E4F1FA48];
  *((void *)v2 + 15) = v23;
  *((_DWORD *)v2 + 32) = 0;
  v24 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
  uint64_t v25 = objc_msgSend(v24, "mad_extendedSceneIdFromSceneName:", @"sport");
  v26 = (void *)*((void *)v2 + 19);
  *((void *)v2 + 19) = v25;

  v27 = (void *)*((void *)v2 + 1);
  if (v27)
  {
    v27 = (void *)*((void *)v2 + 2);
    if (v27)
    {
      v27 = (void *)*((void *)v2 + 3);
      if (v27)
      {
        v27 = (void *)*((void *)v2 + 4);
        if (v27)
        {
          v27 = (void *)*((void *)v2 + 5);
          if (v27)
          {
            v27 = (void *)*((void *)v2 + 6);
            if (v27)
            {
              v27 = (void *)*((void *)v2 + 7);
              if (v27)
              {
                v27 = (void *)*((void *)v2 + 8);
                if (v27)
                {
                  v27 = (void *)*((void *)v2 + 9);
                  if (v27)
                  {
                    v27 = (void *)*((void *)v2 + 10);
                    if (v27)
                    {
                      v28 = [[VCPCNNModel alloc] initWithParameters:1 useGPU:v47];
                      v29 = (void *)*((void *)v2 + 17);
                      *((void *)v2 + 17) = v28;

                      v30 = (void *)*((void *)v2 + 17);
                      if (!v30) {
                        goto LABEL_22;
                      }
                      v31 = [v30 getGPUContext];
                      uint64_t v32 = +[VCPCNNData cnnDataWithPlane:1 height:10 width:1 context:v31];
                      v33 = (void *)*((void *)v2 + 18);
                      *((void *)v2 + 18) = v32;

                      [*((id *)v2 + 18) allocBuffers:1];
                      v34 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:16 NeuronType:1];
                      int v35 = [*((id *)v2 + 17) add:v34];
                      if (!v35)
                      {
                        v36 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:8 NeuronType:1];
                        int v35 = [*((id *)v2 + 17) add:v36];
                        if (!v35)
                        {
                          v37 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:4 NeuronType:1];
                          int v35 = [*((id *)v2 + 17) add:v37];
                          if (!v35)
                          {
                            v38 = +[VCPCNNFullConnectionBlock fcBlockWithNumNeurons:3 NeuronType:0];
                            int v35 = [*((id *)v2 + 17) add:v38];
                            if (!v35)
                            {
                              v39 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
                              uint64_t v40 = [v39 resourceURL];

                              v41 = (void *)v40;
                              v42 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_activitylevel.dat" relativeToURL:v40];
                              v43 = (void *)*((void *)v2 + 17);
                              v44 = [*((id *)v2 + 18) size];
                              int v35 = [v43 prepareNetworkFromURL:v42 withInputSize:v44];
                            }
                          }
                        }
                      }

                      if (v35)
                      {
LABEL_22:
                        v27 = 0;
                        goto LABEL_24;
                      }
LABEL_23:
                      v27 = v2;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_24:
  v45 = v27;

  return v45;
}

- (void)generateActivityDescriptor
{
  if (self->_numOfFrames < 1)
  {
    activityDescriptor = self->_activityDescriptor;
    [(VCPVideoActivityDescriptor *)activityDescriptor reset];
  }
  else
  {
    for (uint64_t i = 0; i != 10; ++i)
    {
      float numOfFrames = (float)self->_numOfFrames;
      uint64_t v5 = [(VCPVideoActivityDescriptor *)self->_activityDescriptor descriptors];
      v5[i] = v5[i] / numOfFrames;
    }
    [(VCPVideoActivityAnalyzer *)self normalizeActivityDescriptor];
  }
}

- (void)normalizeActivityDescriptor
{
  for (uint64_t i = 0; i != 10; ++i)
  {
    float v4 = (float)([(VCPVideoActivityDescriptor *)self->_activityDescriptor descriptors][i * 4]
               - *(float *)&-[VCPVideoActivityAnalyzer normalizeActivityDescriptor]::kCenter[i])
       / *(float *)&-[VCPVideoActivityAnalyzer normalizeActivityDescriptor]::kScaler[i];
    [(VCPVideoActivityDescriptor *)self->_activityDescriptor descriptors][i * 4] = v4;
  }
}

- (void)resetActivityStatsAtTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_lastProcessTime.value = *(_OWORD *)&a3->var0;
  self->_lastProcessTime.epoch = var3;
  self->_float numOfFrames = 0;
  [(VCPVideoActivityDescriptor *)self->_activityDescriptor reset];
}

- (int)computeActivityScoreAtTime:(id *)a3
{
  p_lastProcessTime = (CMTime *)&self->_lastProcessTime;
  time1.CMTime start = (CMTime)*a3;
  CMTime time2 = (CMTime)self->_lastProcessTime;
  if (CMTimeCompare(&time1.start, &time2) < 0) {
    return -50;
  }
  for (uint64_t i = 0; i != 40; i += 4)
  {
    int v7 = (int)[(VCPVideoActivityDescriptor *)self->_activityDescriptor descriptors][i];
    *(_DWORD *)([(VCPCNNData *)self->_input data] + i) = v7;
  }
  int v8 = [(VCPCNNModel *)self->_model forward:self->_input];
  if (!v8)
  {
    uint64_t v9 = [(VCPCNNModel *)self->_model output];
    int v8 = [v9 softmax];

    if (!v8)
    {
      uint64_t v10 = 0;
      float v11 = 0.0;
      do
      {
        v12 = [(VCPCNNModel *)self->_model output];
        float v11 = v11 + *(float *)([v12 data] + v10);

        v10 += 4;
      }
      while (v10 != 12);
      float v13 = 0.0;
      if (v11 != 0.0)
      {
        for (uint64_t j = 0; j != 3; ++j)
        {
          uint64_t v15 = [(VCPCNNModel *)self->_model output];
          float v13 = v13
              + (float)((float)(*(float *)([v15 data] + j * 4)
                              * *(float *)&-[VCPVideoActivityAnalyzer computeActivityScoreAtTime:]::kClassScore[j])
                      / v11);
        }
      }
      memset(&time1, 0, sizeof(time1));
      float v16 = 1.0;
      if (v13 < 1.0) {
        float v16 = v13;
      }
      if (v13 <= 0.0) {
        float v17 = 0.0;
      }
      else {
        float v17 = v16;
      }
      CMTime start = *p_lastProcessTime;
      CMTime time2 = (CMTime)*a3;
      CMTime rhs = *p_lastProcessTime;
      CMTimeSubtract(&duration, &time2, &rhs);
      CMTimeRangeMake(&time1, &start, &duration);
      activityScores = self->_activityScores;
      uint64_t v19 = [VCPCompactResult alloc];
      CMTimeRange v22 = time1;
      v20 = [(VCPCompactResult *)v19 initWithTimerange:&v22 andScore:COERCE_DOUBLE(__PAIR64__(time1.duration.flags, LODWORD(v17)))];
      [(NSMutableArray *)activityScores addObject:v20];

      return 0;
    }
  }
  return v8;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v10 = v9;
  if (!v9)
  {
    float v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v18 = objc_opt_class();
      -[VCPVideoActivityAnalyzer analyzeFrame:timestamp:duration:frameStats:flags:](v18, (uint64_t)&lhs);
    }
    goto LABEL_13;
  }
  float v11 = [v9 videoActivityDescriptor];

  if (!v11)
  {
    float v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v19 = objc_opt_class();
      -[VCPVideoActivityAnalyzer analyzeFrame:timestamp:duration:frameStats:flags:](v19, (uint64_t)&lhs);
    }
LABEL_13:

    int v16 = -18;
    goto LABEL_14;
  }
  for (uint64_t i = 0; i != 10; ++i)
  {
    float v13 = [v10 videoActivityDescriptor];
    float v14 = *(float *)([v13 descriptors] + i * 4);
    uint64_t v15 = [(VCPVideoActivityDescriptor *)self->_activityDescriptor descriptors];
    v15[i] = v14 + v15[i];
  }
  ++self->_numOfFrames;
  CMTime lhs = (CMTime)*a4;
  CMTime rhs = (CMTime)self->_lastProcessTime;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < 1.0) {
    goto LABEL_8;
  }
  [(VCPVideoActivityAnalyzer *)self generateActivityDescriptor];
  long long v23 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  int v16 = [(VCPVideoActivityAnalyzer *)self computeActivityScoreAtTime:&v23];
  if (!v16)
  {
    long long v21 = *(_OWORD *)&a4->var0;
    int64_t v22 = a4->var3;
    [(VCPVideoActivityAnalyzer *)self resetActivityStatsAtTime:&v21];
LABEL_8:
    int v16 = 0;
  }
LABEL_14:

  return v16;
}

- (int)preProcessQualityResults:(id)a3 interestingnessResults:(id)a4 obstructionResults:(id)a5 classificationResults:(id)a6 fineActionResults:(id)a7 faceResults:(id)a8 sceneSwitchFrequency:(float)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  int v21 = [(VCPVideoActivityAnalyzer *)self extractRequiredInfoFrom:a3 toArray:self->_qualityResults];
  if (!v21)
  {
    int v21 = [(VCPVideoActivityAnalyzer *)self extractRequiredInfoFrom:v16 toArray:self->_interestingnessResults];
    if (!v21)
    {
      int v21 = [(VCPVideoActivityAnalyzer *)self extractRequiredInfoFrom:v17 toArray:self->_obstructionResults];
      if (!v21)
      {
        int v21 = [(VCPVideoActivityAnalyzer *)self extractRequiredClassificationInfoFrom:v18 toArray:self->_classificationResults];
        if (!v21)
        {
          int v21 = [(VCPVideoActivityAnalyzer *)self extractRequiredInfoFrom:v19 toArray:self->_fineActionResults];
          if (!v21)
          {
            int v21 = [(VCPVideoActivityAnalyzer *)self extractRequiredFaceInfoFrom:v20 toArray:self->_faceResults];
            if (!v21) {
              self->_sceneSwitchFrequency = a9;
            }
          }
        }
      }
    }
  }

  return v21;
}

- (int)extractRequiredInfoFrom:(id)a3 toArray:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v20 + 1) + 8 * i);
        memset(&v19, 0, sizeof(v19));
        CMTimeRangeMakeFromDictionary(&v19, v11);
        v12 = [(__CFDictionary *)v11 objectForKeyedSubscript:@"quality"];
        [v12 floatValue];
        unsigned int v14 = v13;

        uint64_t v15 = [VCPCompactResult alloc];
        CMTimeRange v18 = v19;
        id v16 = [(VCPCompactResult *)v15 initWithTimerange:&v18 andScore:COERCE_DOUBLE(__PAIR64__(v19.duration.flags, v14))];
        if (!v16)
        {
          LODWORD(v8) = -50;
          goto LABEL_11;
        }
        [v6 addObject:v16];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (int)extractRequiredFaceInfoFrom:(id)a3 toArray:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v22 + 1) + 8 * i);
        memset(&v21, 0, sizeof(v21));
        CMTimeRangeMakeFromDictionary(&v21, v11);
        v12 = [(__CFDictionary *)v11 objectForKeyedSubscript:@"attributes"];
        unsigned int v13 = [v12 objectForKeyedSubscript:@"faceBounds"];
        NSRect v28 = NSRectFromString(v13);
        double width = v28.size.width;
        double height = v28.size.height;

        id v16 = [VCPCompactResult alloc];
        double v17 = width * height;
        *(float *)&double v17 = width * height;
        CMTimeRange v20 = v21;
        CMTimeRange v18 = [(VCPCompactResult *)v16 initWithTimerange:&v20 andScore:v17];
        if (!v18)
        {

          LODWORD(v8) = -50;
          goto LABEL_11;
        }
        [v6 addObject:v18];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (int)extractRequiredClassificationInfoFrom:(id)a3 toArray:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CMTimeRange v21 = v6;
  if (self->_sportsSceneId)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = v6;
    uint64_t v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v6);
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          CFDictionaryRef v11 = *(const __CFDictionary **)(*((void *)&v25 + 1) + 8 * i);
          memset(&v24, 0, sizeof(v24));
          CMTimeRangeMakeFromDictionary(&v24, v11);
          v12 = [(__CFDictionary *)v11 objectForKeyedSubscript:@"attributes"];
          unsigned int v13 = [(NSNumber *)self->_sportsSceneId stringValue];
          unsigned int v14 = [v12 objectForKeyedSubscript:v13];

          if (v14)
          {
            [v14 floatValue];
            unsigned int v16 = v15;
            double v17 = [VCPCompactResult alloc];
            CMTimeRange v23 = v24;
            CMTimeRange v18 = [(VCPCompactResult *)v17 initWithTimerange:&v23 andScore:COERCE_DOUBLE(__PAIR64__(v24.duration.flags, v16))];
            if (!v18)
            {

              int v19 = -50;
              goto LABEL_15;
            }
            [v7 addObject:v18];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    int v19 = 0;
LABEL_15:
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (float)validationScoreOfTimeRange:(id *)a3 fromResult:(id)a4 startIdx:(int *)a5
{
  id v7 = a4;
  int v8 = *a5;
  memset(&v31, 0, sizeof(v31));
  long long v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v31, &range);
  unint64_t v10 = v8;
  float v11 = 0.0;
  v12 = (CMTime *)MEMORY[0x1E4F1FA48];
  float v13 = 0.0;
  while ([v7 count] > v10)
  {
    memset(&v29, 0, sizeof(v29));
    unsigned int v14 = [v7 objectAtIndexedSubscript:v10];
    unsigned int v15 = v14;
    if (v14) {
      [v14 timerange];
    }
    else {
      memset(&v29, 0, sizeof(v29));
    }

    *(_OWORD *)&time1.start.value = *(_OWORD *)&v29.start.value;
    time1.start.epoch = v29.start.epoch;
    CMTime time2 = v31;
    if (CMTimeCompare(&time1.start, &time2) >= 1) {
      break;
    }
    long long v16 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v27.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v27.start.epoch = v16;
    *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a3->var1.var1;
    memset(&time1, 0, sizeof(time1));
    CMTimeRange otherRange = v29;
    CMTimeRangeGetIntersection(&time1, &v27, &otherRange);
    if ((time1.start.flags & 1) == 0
      || (time1.duration.flags & 1) == 0
      || time1.duration.epoch
      || time1.duration.value < 0
      || (CMTime v25 = time1.duration, v24 = *v12, CMTimeCompare(&v25, &v24)))
    {
      CMTime duration = time1.duration;
      Float64 Seconds = CMTimeGetSeconds(&duration);
      CMTimeRange v18 = [v7 objectAtIndexedSubscript:v10];
      [v18 score];
      float v20 = v19;
      *(float *)&Float64 Seconds = Seconds;

      float v11 = v11 + (float)(*(float *)&Seconds * v20);
      float v13 = v13 + *(float *)&Seconds;
      int v8 = v10;
    }
    ++v10;
  }
  *a5 = v8;
  if (v13 == 0.0) {
    float v21 = 0.0;
  }
  else {
    float v21 = v11 / v13;
  }

  return v21;
}

- (void)validateActivityScores
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = self->_activityScores;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = *(void *)v30;
    id v6 = &OBJC_IVAR___VCPCNNModelEspresso__context;
    id v7 = &OBJC_IVAR___VCPCNNModelEspresso__context;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        memset(&v28, 0, sizeof(v28));
        if (v9) {
          [v9 timerange];
        }
        memset(&v27, 0, sizeof(v27));
        CMTimeRange range = v28;
        CMTimeRangeGetEnd(&v27, &range);
        CMTimeRange v25 = v28;
        [(VCPVideoActivityAnalyzer *)self validationScoreOfTimeRange:&v25 fromResult:*(Class *)((char *)&self->super.super.isa + v6[586]) startIdx:(char *)&v33 + 4];
        if (v10 > 0.35)
        {
          CMTimeRange v24 = v28;
          [(VCPVideoActivityAnalyzer *)self validationScoreOfTimeRange:&v24 fromResult:*(Class *)((char *)&self->super.super.isa + v7[587]) startIdx:&v33];
          if (v11 > 0.343)
          {
            v12 = v6;
            unint64_t v13 = v4;
            float v14 = 0.0;
            while ([(NSMutableArray *)self->_obstructionResults count] > v13)
            {
              memset(&v23, 0, sizeof(v23));
              unsigned int v15 = [(NSMutableArray *)self->_obstructionResults objectAtIndexedSubscript:v13];
              long long v16 = v15;
              if (v15) {
                [v15 timerange];
              }
              else {
                memset(&v23, 0, sizeof(v23));
              }

              *(_OWORD *)&time1.start.value = *(_OWORD *)&v23.start.value;
              time1.start.epoch = v23.start.epoch;
              CMTime time2 = v27;
              if (CMTimeCompare(&time1.start, &time2) >= 1) {
                break;
              }
              CMTimeRange v21 = v28;
              memset(&time1, 0, sizeof(time1));
              CMTimeRange otherRange = v23;
              CMTimeRangeGetIntersection(&time1, &v21, &otherRange);
              CMTime time = time1.duration;
              int v4 = v13;
              float v14 = CMTimeGetSeconds(&time) + v14;
              ++v13;
            }
            if (v14 <= 0.2) {
              [(NSMutableArray *)self->_validActivityScores addObject:v9];
            }
            id v6 = v12;
            uint64_t v5 = v17;
            id v7 = &OBJC_IVAR___VCPCNNModelEspresso__context;
          }
        }
      }
      uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v3);
  }
}

- (float)scaleBasedOnFaceForTimeRange:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  int v4 = self->_faceResults;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    float v7 = 0.0;
    int v8 = (CMTime *)MEMORY[0x1E4F1FA48];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        float v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        if (v10) {
          [*(id *)(*((void *)&v36 + 1) + 8 * v9) timerange];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        long long v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v11;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v35, &range, &otherRange);
        if ((v35.start.flags & 1) == 0) {
          goto LABEL_18;
        }
        if (v10) {
          [v10 timerange];
        }
        else {
          memset(&v31, 0, sizeof(v31));
        }
        long long v12 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v30.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v30.start.epoch = v12;
        *(_OWORD *)&v30.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v32, &v31, &v30);
        if ((v32.duration.flags & 1) == 0) {
          goto LABEL_18;
        }
        if (v10) {
          [v10 timerange];
        }
        else {
          memset(&v28, 0, sizeof(v28));
        }
        long long v13 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v27.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v27.start.epoch = v13;
        *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v29, &v28, &v27);
        if (v29.duration.epoch) {
          goto LABEL_18;
        }
        if (v10) {
          [v10 timerange];
        }
        else {
          memset(&v25, 0, sizeof(v25));
        }
        long long v15 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v24.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v24.start.epoch = v15;
        *(_OWORD *)&v24.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v26, &v25, &v24);
        if (v26.duration.value < 0) {
          goto LABEL_18;
        }
        if (v10) {
          [v10 timerange];
        }
        else {
          memset(&v21, 0, sizeof(v21));
        }
        long long v16 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v20.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v20.start.epoch = v16;
        *(_OWORD *)&v20.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v22, &v21, &v20);
        CMTime time1 = v22.duration;
        CMTime v19 = *v8;
        if (CMTimeCompare(&time1, &v19))
        {
LABEL_18:
          [v10 score];
          if (v7 < v14) {
            float v7 = v14;
          }
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v17 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
      uint64_t v5 = v17;
    }
    while (v17);
  }
  else
  {
    float v7 = 0.0;
  }

  float result = 0.8;
  if (v7 <= 0.1) {
    return 1.0;
  }
  return result;
}

- (void)addSceneSwitchFrequencyConstributionToActivityLevel:(float *)a3
{
  float v3 = *a3;
  float v4 = 0.9;
  if (*a3 < 0.9)
  {
    float v5 = 0.9 - v3;
    if ((float)(0.9 - v3) < 0.0) {
      float v5 = 0.0;
    }
    float v6 = v3 + (float)(v5 * self->_sceneSwitchFrequency);
    if (v6 < 0.9) {
      float v4 = v6;
    }
    if (v6 <= 0.0) {
      float v7 = 0.0;
    }
    else {
      float v7 = v4;
    }
    *a3 = v7;
  }
}

- (float)actionScoreInTimeRange:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  memset(&v30, 0, sizeof(v30));
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v30, &range);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  float v6 = self->_fineActionResults;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    float v9 = 0.0;
    float v10 = (CMTime *)MEMORY[0x1E4F1FA48];
    float v11 = 0.0;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      if (v13) {
        [*(id *)(*((void *)&v25 + 1) + 8 * v12) timerange];
      }
      else {
        memset(&v24, 0, sizeof(v24));
      }
      CMTime time1 = v24.start;
      CMTime time2 = v30;
      if (CMTimeCompare(&time1, &time2) > 0) {
        break;
      }
      long long v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v23.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v23.start.epoch = v14;
      *(_OWORD *)&v23.duration.timescale = *(_OWORD *)&a3->var1.var1;
      memset(&v24, 0, sizeof(v24));
      if (v13) {
        [v13 timerange];
      }
      else {
        memset(&otherRange, 0, sizeof(otherRange));
      }
      CMTimeRangeGetIntersection(&v24, &v23, &otherRange);
      if ((v24.start.flags & 1) == 0
        || (v24.duration.flags & 1) == 0
        || v24.duration.epoch
        || v24.duration.value < 0
        || (CMTime v21 = v24.duration, v20 = *v10, CMTimeCompare(&v21, &v20)))
      {
        CMTime duration = v24.duration;
        double Seconds = CMTimeGetSeconds(&duration);
        [v13 score];
        float v16 = Seconds;
        float v11 = v11 + (float)(v16 * v17);
        float v9 = v9 + v16;
      }
      if (v7 == ++v12)
      {
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    float v9 = 0.0;
    float v11 = 0.0;
  }

  float result = v11 / v9;
  if (v9 == 0.0) {
    return 0.0;
  }
  return result;
}

- (void)addSceneClassificationContributionToActivityLevel:(float *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*a3 < 0.9)
  {
    float v5 = 0.0;
    if ((float)(0.9 - *a3) >= 0.0) {
      float v6 = 0.9 - *a3;
    }
    else {
      float v6 = 0.0;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = self->_classificationResults;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          float v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "score", v20, v21, v22, (void)v23);
          float v13 = v12;
          if (v11)
          {
            [v11 timerange];
          }
          else
          {
            long long v21 = 0u;
            long long v22 = 0u;
            long long v20 = 0u;
          }
          [(VCPVideoActivityAnalyzer *)self actionScoreInTimeRange:&v20];
          float v15 = sqrtf(v13 * v14);
          if (v5 < v15) {
            float v5 = v15;
          }
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    float v16 = *a3 + (float)(v6 * v5);
    if (v16 < 0.9) {
      float v17 = *a3 + (float)(v6 * v5);
    }
    else {
      float v17 = 0.9;
    }
    BOOL v18 = v16 > 0.0;
    float v19 = 0.0;
    if (v18) {
      float v19 = v17;
    }
    *a3 = v19;
  }
}

- (int)finishAnalysisPass:(id *)a3 fpsRate:(float)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    CMTime time1 = (CMTime)a3->var1;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (!CMTimeCompare(&time1, &time2)) {
      return -50;
    }
  }
  float v37 = 0.0;
  CMTime time = (CMTime)a3->var1;
  p_var1 = &a3->var1;
  if (CMTimeGetSeconds(&time) / a4 >= 3.0)
  {
    [(VCPVideoActivityAnalyzer *)self validateActivityScores];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v8 = self->_validActivityScores;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      float v11 = 0.0;
      float v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v8);
          }
          float v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (v14) {
            [*(id *)(*((void *)&v32 + 1) + 8 * i) timerange];
          }
          else {
            memset(v30, 0, sizeof(v30));
          }
          CMTime v31 = v30[1];
          double Seconds = CMTimeGetSeconds(&v31);
          if (v14) {
            [v14 timerange];
          }
          else {
            memset(v29, 0, sizeof(v29));
          }
          [(VCPVideoActivityAnalyzer *)self scaleBasedOnFaceForTimeRange:v29];
          float v17 = v16;
          [v14 score];
          float v18 = Seconds;
          float v11 = v11 + (float)((float)(v17 * v19) * v18);
          float v37 = v11;
          float v12 = v12 + v18;
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v9);

      if (v12 != 0.0) {
        float v37 = v11 / v12;
      }
    }
    else
    {

      float v12 = 0.0;
    }
    *(_OWORD *)&v28.value = *(_OWORD *)&p_var1->var0;
    v28.epoch = a3->var1.var3;
    float v20 = v12 / CMTimeGetSeconds(&v28);
    if (v20 <= 0.15)
    {
      float v37 = 0.0;
    }
    else
    {
      [(VCPVideoActivityAnalyzer *)self addSceneSwitchFrequencyConstributionToActivityLevel:&v37];
      [(VCPVideoActivityAnalyzer *)self addSceneClassificationContributionToActivityLevel:&v37];
    }
  }
  results = self->_results;
  v40[0] = @"start";
  v30[0] = (CMTime)a3->var0;
  CFDictionaryRef v22 = CMTimeCopyAsDictionary(v30, 0);
  v41[0] = v22;
  v40[1] = @"duration";
  *(_OWORD *)&v30[0].value = *(_OWORD *)&p_var1->var0;
  v30[0].epoch = a3->var1.var3;
  CFDictionaryRef v23 = CMTimeCopyAsDictionary(v30, 0);
  v41[1] = v23;
  v40[2] = @"quality";
  *(float *)&double v24 = v37;
  long long v25 = [NSNumber numberWithFloat:v24];
  v41[2] = v25;
  long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
  [(NSMutableArray *)results addObject:v26];

  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  if (results)
  {
    float v5 = @"ActivityLevelResults";
    v6[0] = results;
    float v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    float v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsSceneId, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_fineActionResults, 0);
  objc_storeStrong((id *)&self->_classificationResults, 0);
  objc_storeStrong((id *)&self->_obstructionResults, 0);
  objc_storeStrong((id *)&self->_interestingnessResults, 0);
  objc_storeStrong((id *)&self->_qualityResults, 0);
  objc_storeStrong((id *)&self->_validActivityScores, 0);
  objc_storeStrong((id *)&self->_activityScores, 0);
  objc_storeStrong((id *)&self->_activityDescriptor, 0);
}

- (void)analyzeFrame:(void *)a1 timestamp:(uint64_t)a2 duration:frameStats:flags:.cold.1(void *a1, uint64_t a2)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  id v2 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1BBEDA000, v3, v4, "[%@] frameStats is nil");
}

- (void)analyzeFrame:(void *)a1 timestamp:(uint64_t)a2 duration:frameStats:flags:.cold.2(void *a1, uint64_t a2)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  id v2 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1BBEDA000, v3, v4, "[%@] frameStats.videoActivityDescriptor is nil");
}

@end