@interface VCPLightVideoAnalyzer
- (NSDictionary)privateResults;
- (NSDictionary)publicResults;
- (VCPLightVideoAnalyzer)initWithAVAsset:(id)a3 forAnalysisTypes:(unint64_t)a4;
- (float)photoOffset;
- (id)findMetaTrackforType:(id)a3;
- (int)analyzeAsset:(id)a3 flags:(unint64_t *)a4;
- (int)checkTimeRangeConsistency;
- (int)postProcessOrientationResults;
- (int)processMetaTrackForType:(id)a3 cancel:(id)a4 flags:(unint64_t *)a5;
- (void)setPhotoOffset:(float)a3;
@end

@implementation VCPLightVideoAnalyzer

- (VCPLightVideoAnalyzer)initWithAVAsset:(id)a3 forAnalysisTypes:(unint64_t)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)VCPLightVideoAnalyzer;
  v8 = [(VCPLightVideoAnalyzer *)&v23 init];
  v9 = v8;
  if (v8)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_storeStrong((id *)&v8->_avAsset, a3);
    v10 = objc_msgSend(v7, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E4F15C18]);
    v11 = v10;
    if (v10)
    {
      [v10 preferredTransform];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
    }
    *(_OWORD *)&v9->_transform.a = v20;
    *(_OWORD *)&v9->_transform.c = v21;
    *(_OWORD *)&v9->_transform.tx = v22;

    v9->_requestedAnalyses = a4;
    metaTracks = v9->_metaTracks;
    v9->_metaTracks = 0;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    publicMutableResults = v9->_publicMutableResults;
    v9->_publicMutableResults = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    privateMutableResults = v9->_privateMutableResults;
    v9->_privateMutableResults = (NSMutableDictionary *)v16;

    if (!v9->_publicMutableResults || (v18 = v9, !v9->_privateMutableResults)) {
LABEL_9:
    }
      v18 = 0;
    v12 = v18;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)findMetaTrackforType:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = self->_metaTracks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v5);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v9 = [v8 formatDescriptions];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = CMMetadataFormatDescriptionGetIdentifiers(*(CMMetadataFormatDescriptionRef *)(*((void *)&v18 + 1) + 8 * j));
              uint64_t v14 = v13;
              if (v13 && ([v13 containsObject:v4] & 1) != 0)
              {
                id v15 = v8;

                goto LABEL_20;
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v15 = 0;
    }
    while (v6);
  }
  else
  {
    id v15 = 0;
  }
LABEL_20:

  return v15;
}

- (int)processMetaTrackForType:(id)a3 cancel:(id)a4 flags:(unint64_t *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (uint64_t (**)(void))a4;
  v9 = [(VCPLightVideoAnalyzer *)self findMetaTrackforType:v7];
  v35 = v9;
  if (!v9)
  {
    uint64_t v17 = 0;
    long long v18 = 0;
LABEL_13:
    LODWORD(v14) = 0;
    goto LABEL_36;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v10 = [v9 formatDescriptions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(const opaqueCMFormatDescription **)(*((void *)&v37 + 1) + 8 * i);
        id v15 = CMMetadataFormatDescriptionGetIdentifiers(v14);
        uint64_t v16 = v15;
        if (v15 && ([v15 containsObject:v7] & 1) != 0)
        {

          goto LABEL_15;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_15:

  long long v18 = [[VCPMetaTrackDecoder alloc] initWithTrack:v35];
  if (!v18)
  {
    uint64_t v17 = 0;
    LODWORD(v14) = -50;
    goto LABEL_36;
  }
  long long v19 = *(_OWORD *)&self->_transform.c;
  v36[0] = *(_OWORD *)&self->_transform.a;
  v36[1] = v19;
  v36[2] = *(_OWORD *)&self->_transform.tx;
  uint64_t v17 = +[VCPVideoMetaAnalyzer analyzerForTrackType:v7 withTransform:v36 requestAnalyses:self->_requestedAnalyses formatDescription:v14];
  [(VCPLightVideoAnalyzer *)self photoOffset];
  uint64_t v20 = objc_msgSend(v17, "setPhotoOffset:");
  if (!v17)
  {
    LODWORD(v14) = -108;
    goto LABEL_36;
  }
  do
  {
    long long v21 = (void *)MEMORY[0x1C186D320](v20);
    if (v8[2](v8))
    {
      LODWORD(v14) = -128;
      int v22 = 1;
    }
    else
    {
      id v23 = [(VCPMetaTrackDecoder *)v18 copyNextMetadataGroup];
      if (v23)
      {
        int v24 = [v17 processMetadataGroup:v23 flags:a5];
        int v22 = v24 != 0;
        if (v24) {
          LODWORD(v14) = v24;
        }
      }
      else
      {
        int v22 = 11;
      }
    }
  }
  while (!v22);
  if (v22 == 11)
  {
    if ([(VCPMetaTrackDecoder *)v18 status] != 2)
    {
      LODWORD(v14) = -19;
      goto LABEL_36;
    }
    LODWORD(v14) = [v17 finalizeAnalysis];
    if (!v14)
    {
      long long v25 = [v17 publicResults];
      BOOL v26 = v25 == 0;

      if (!v26)
      {
        publicMutableResults = self->_publicMutableResults;
        uint64_t v28 = [v17 publicResults];
        [(NSMutableDictionary *)publicMutableResults addEntriesFromDictionary:v28];
      }
      v29 = objc_msgSend(v17, "privateResults", a5);
      BOOL v30 = v29 == 0;

      if (!v30)
      {
        privateMutableResults = self->_privateMutableResults;
        v32 = [v17 privateResults];
        [(NSMutableDictionary *)privateMutableResults addEntriesFromDictionary:v32];
      }
      goto LABEL_13;
    }
  }
LABEL_36:

  return (int)v14;
}

- (int)checkTimeRangeConsistency
{
  v3 = [(AVAsset *)self->_avAsset vcp_firstEnabledTrackWithMediaType:*MEMORY[0x1E4F15C18]];
  uint64_t v4 = [(NSMutableDictionary *)self->_privateMutableResults objectForKey:@"OrientationResults"];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    memset(v22, 0, sizeof(v22));
    long long v21 = 0u;
    [v3 timeRange];
    memset(&v20, 0, sizeof(v20));
    CMTimeRangeMakeFromDictionary(&v20, (CFDictionaryRef)[v5 firstObject]);
    memset(&v19, 0, sizeof(v19));
    CMTimeRangeMakeFromDictionary(&v19, (CFDictionaryRef)[v5 lastObject]);
    memset(&v18, 0, sizeof(v18));
    CMTime start = v20.start;
    CMTimeRange range = v19;
    CMTimeRangeGetEnd(&v15, &range);
    CMTime lhs = v15;
    CMTime rhs = v20.start;
    CMTimeSubtract(&duration, &lhs, &rhs);
    CMTimeRangeMake(&v18, &start, &duration);
    CMTime time = *(CMTime *)((char *)v22 + 8);
    double Seconds = CMTimeGetSeconds(&time);
    CMTime v12 = v18.duration;
    double v8 = CMTimeGetSeconds(&v12);
    float v9 = Seconds;
    if (v9 != 0.0)
    {
      float v10 = v8;
      if ((float)(vabds_f32(v9, v10) / v9) >= 0.25) {
        [(NSMutableDictionary *)self->_privateMutableResults removeObjectForKey:@"OrientationResults"];
      }
    }
  }

  return 0;
}

- (int)postProcessOrientationResults
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CMTime v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_privateMutableResults, "objectForKeyedSubscript:");
  if (v15)
  {
    v2 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    obuint64_t j = v15;
    uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v18 != v4) {
            objc_enumerationMutation(obj);
          }
          BOOL v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v7 = (void *)[v6 mutableCopy];
          double v8 = [v6 objectForKeyedSubscript:@"attributes"];
          float v9 = [v8 objectForKeyedSubscript:@"orientation"];

          if ((int)[v9 intValue] <= 8) {
            uint64_t v10 = kQuickTimeVideoOrientationToVCPOrientation[(int)[v9 intValue]];
          }
          else {
            uint64_t v10 = 0;
          }
          long long v21 = @"orientation";
          uint64_t v11 = [NSNumber numberWithInt:v10];
          int v22 = v11;
          CMTime v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          [v7 setObject:v12 forKeyedSubscript:@"attributes"];

          [v2 addObject:v7];
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v3);
    }

    [(NSMutableDictionary *)self->_publicMutableResults setObject:v2 forKeyedSubscript:@"OrientationResults"];
  }

  return 0;
}

- (int)analyzeAsset:(id)a3 flags:(unint64_t *)a4
{
  id v6 = a3;
  if ([(NSMutableDictionary *)self->_publicMutableResults count]
    && [(NSMutableDictionary *)self->_privateMutableResults count])
  {
    int v7 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = 0;
  double v8 = [(AVAsset *)self->_avAsset vcp_enabledTracksWithMediaType:*MEMORY[0x1E4F15BE0]];
  metaTracks = self->_metaTracks;
  self->_metaTracks = v8;

  if (!self->_metaTracks)
  {
LABEL_23:
    int v7 = 0;
    *a4 |= v12;
    goto LABEL_24;
  }
  int v7 = [(VCPLightVideoAnalyzer *)self processMetaTrackForType:*MEMORY[0x1E4F1F168] cancel:v6 flags:&v12];
  if (v7) {
    goto LABEL_24;
  }
  unint64_t requestedAnalyses = self->_requestedAnalyses;
  if ((requestedAnalyses & 0xC) == 4)
  {
    int v7 = [(VCPLightVideoAnalyzer *)self processMetaTrackForType:*MEMORY[0x1E4F15D68] cancel:v6 flags:&v12];
    if (v7) {
      goto LABEL_24;
    }
    unint64_t requestedAnalyses = self->_requestedAnalyses;
  }
  if ((requestedAnalyses & 0xC0) != 0)
  {
    int v7 = [(VCPLightVideoAnalyzer *)self processMetaTrackForType:*MEMORY[0x1E4F15D98] cancel:v6 flags:&v12];
    if (v7) {
      goto LABEL_24;
    }
    int v7 = [(VCPLightVideoAnalyzer *)self checkTimeRangeConsistency];
    if (v7) {
      goto LABEL_24;
    }
    unint64_t requestedAnalyses = self->_requestedAnalyses;
    if ((requestedAnalyses & 0xC0) == 0x40)
    {
      int v7 = [(VCPLightVideoAnalyzer *)self postProcessOrientationResults];
      if (v7) {
        goto LABEL_24;
      }
      unint64_t requestedAnalyses = self->_requestedAnalyses;
    }
  }
  if ((requestedAnalyses & 0x40000140300002C0) != 0)
  {
    int v7 = [(VCPLightVideoAnalyzer *)self processMetaTrackForType:*MEMORY[0x1E4F52790] cancel:v6 flags:a4];
    if (v7) {
      goto LABEL_24;
    }
    unint64_t requestedAnalyses = self->_requestedAnalyses;
  }
  if ((requestedAnalyses & 0x10000000000) != 0)
  {
    int v7 = [(VCPLightVideoAnalyzer *)self processMetaTrackForType:*MEMORY[0x1E4F218A0] cancel:v6 flags:a4];
    if (v7) {
      goto LABEL_24;
    }
    unint64_t requestedAnalyses = self->_requestedAnalyses;
  }
  if ((requestedAnalyses & 0x20000000) == 0) {
    goto LABEL_23;
  }
  int v7 = [(VCPLightVideoAnalyzer *)self processMetaTrackForType:@"mdta/com.apple.quicktime.smartstyle-info" cancel:v6 flags:a4];
  if (!v7) {
    goto LABEL_23;
  }
LABEL_24:

  return v7;
}

- (NSDictionary)publicResults
{
  return (NSDictionary *)self->_publicMutableResults;
}

- (NSDictionary)privateResults
{
  return (NSDictionary *)self->_privateMutableResults;
}

- (float)photoOffset
{
  return self->_photoOffset;
}

- (void)setPhotoOffset:(float)a3
{
  self->_photoOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMutableResults, 0);
  objc_storeStrong((id *)&self->_publicMutableResults, 0);
  objc_storeStrong((id *)&self->_metaTracks, 0);
  objc_storeStrong((id *)&self->_avAsset, 0);
}

@end