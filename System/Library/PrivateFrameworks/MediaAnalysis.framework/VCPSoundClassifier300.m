@interface VCPSoundClassifier300
- (VCPSoundClassifier300)initWithTrackStart:(id *)a3 resultsKey:(id)a4;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 classification:(id)a5;
- (void)request:(id)a3 didProduceResult:(id)a4;
@end

@implementation VCPSoundClassifier300

- (VCPSoundClassifier300)initWithTrackStart:(id *)a3 resultsKey:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPSoundClassifier300;
    v8 = [(VCPSoundClassifier300 *)&v14 init];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      results = v8->_results;
      v8->_results = (NSMutableArray *)v9;

      long long v11 = *(_OWORD *)&a3->var0;
      v8->_trackStart.epoch = a3->var3;
      *(_OWORD *)&v8->_trackStart.value = v11;
      objc_storeStrong((id *)&v8->_resultsKey, a4);
    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 classification:(id)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  memset(&v17, 0, sizeof(v17));
  CMTime lhs = (CMTime)self->_trackStart;
  CMTime rhs = (CMTime)*a3;
  CMTimeAdd(&start, &lhs, &rhs);
  CMTime lhs = (CMTime)self->_trackStart;
  CMTime rhs = (CMTime)*a4;
  CMTimeAdd(&end, &lhs, &rhs);
  CMTimeRangeFromTimeToTime(&v17, &start, &end);
  if ((v17.start.flags & 1) != 0
    && (v17.duration.flags & 1) != 0
    && !v17.duration.epoch
    && (v17.duration.value & 0x8000000000000000) == 0)
  {
    CMTimeRange v14 = v17;
    CFDictionaryRef v9 = CMTimeRangeCopyAsDictionary(&v14, 0);
    results = self->_results;
    v20[0] = @"start";
    long long v11 = -[__CFDictionary objectForKey:](v9, "objectForKey:");
    v21[0] = v11;
    v20[1] = @"duration";
    v12 = -[__CFDictionary objectForKey:](v9, "objectForKey:");
    v20[2] = @"attributes";
    v21[1] = v12;
    v21[2] = v8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    [(NSMutableArray *)results addObject:v13];
  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = self;
      id v19 = v7;
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      CFDictionaryRef v9 = [v19 classifications];
      v10 = objc_msgSend(v9, "subarrayWithRange:", 0, 10);

      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v10);
            }
            CMTimeRange v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v15 = NSNumber;
            objc_msgSend(v14, "confidence", v18);
            v16 = objc_msgSend(v15, "numberWithDouble:");
            CMTimeRange v17 = [v14 identifier];
            [v8 setObject:v16 forKey:v17];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v11);
      }

      memset(v24, 0, sizeof(v24));
      long long v23 = 0u;
      [v19 timeRange];
      *(_OWORD *)&v22.value = v23;
      v22.epoch = *(void *)&v24[0];
      memset(&v21, 0, sizeof(v21));
      *(_OWORD *)&lhs.value = v23;
      lhs.epoch = *(void *)&v24[0];
      CMTime rhs = *(CMTime *)((char *)v24 + 8);
      CMTimeAdd(&v21, &lhs, &rhs);
      CMTime time = v22;
      if (CMTimeGetSeconds(&time) >= 0.0) {
        [(VCPSoundClassifier300 *)v18 addDetectionFromTime:&v22 toTime:&v21 classification:v8];
      }
    }
  }
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  resultsKey = self->_resultsKey;
  v6[0] = results;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&resultsKey count:1];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsKey, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end