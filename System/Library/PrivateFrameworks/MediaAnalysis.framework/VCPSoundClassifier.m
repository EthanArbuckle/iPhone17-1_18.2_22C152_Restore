@interface VCPSoundClassifier
- (VCPSoundClassifier)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 confidence:(float)a5;
- (void)request:(id)a3 didProduceResult:(id)a4;
@end

@implementation VCPSoundClassifier

- (VCPSoundClassifier)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5
{
  id v9 = a5;
  if (v9)
  {
    v20.receiver = self;
    v20.super_class = (Class)VCPSoundClassifier;
    v10 = [(VCPSoundClassifier *)&v20 init];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      v12 = (void *)*((void *)v10 + 1);
      *((void *)v10 + 1) = v11;

      uint64_t v13 = MEMORY[0x1E4F1F9F8];
      uint64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v15 = *MEMORY[0x1E4F1F9F8];
      *((_OWORD *)v10 + 1) = *MEMORY[0x1E4F1F9F8];
      *((void *)v10 + 4) = v14;
      *(_OWORD *)(v10 + 40) = v15;
      *((void *)v10 + 7) = *(void *)(v13 + 16);
      *((_DWORD *)v10 + 16) = 0;
      long long v16 = *(_OWORD *)&a3->var0;
      *((void *)v10 + 11) = a3->var3;
      *(_OWORD *)(v10 + 72) = v16;
      *((_DWORD *)v10 + 24) = 0;
      *((float *)v10 + 25) = a4;
      v17 = (void *)*((void *)v10 + 14);
      *((void *)v10 + 14) = @"aggregated";

      objc_storeStrong((id *)v10 + 15, a5);
    }
    self = v10;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 confidence:(float)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  memset(&v18, 0, sizeof(v18));
  CMTime lhs = (CMTime)self->_trackStart;
  CMTime rhs = (CMTime)*a3;
  CMTimeAdd(&start, &lhs, &rhs);
  CMTime lhs = (CMTime)self->_trackStart;
  CMTime rhs = (CMTime)*a4;
  CMTimeAdd(&end, &lhs, &rhs);
  CMTimeRangeFromTimeToTime(&v18, &start, &end);
  if ((v18.start.flags & 1) != 0
    && (v18.duration.flags & 1) != 0
    && !v18.duration.epoch
    && (v18.duration.value & 0x8000000000000000) == 0)
  {
    CMTimeRange v15 = v18;
    CFDictionaryRef v8 = CMTimeRangeCopyAsDictionary(&v15, 0);
    results = self->_results;
    v21[0] = @"start";
    v10 = -[__CFDictionary objectForKey:](v8, "objectForKey:");
    v22[0] = v10;
    v21[1] = @"duration";
    uint64_t v11 = -[__CFDictionary objectForKey:](v8, "objectForKey:");
    v22[1] = v11;
    v21[2] = @"quality";
    *(float *)&double v12 = a5;
    uint64_t v13 = [NSNumber numberWithFloat:v12];
    v22[2] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    [(NSMutableArray *)results addObject:v14];
  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      long long v19 = 0u;
      memset(v20, 0, sizeof(v20));
      [v8 timeRange];
      *(_OWORD *)&v18.value = v19;
      v18.epoch = *(void *)&v20[0];
      memset(&v17, 0, sizeof(v17));
      *(_OWORD *)&lhs.value = v19;
      lhs.epoch = *(void *)&v20[0];
      CMTime rhs = *(CMTime *)((char *)v20 + 8);
      CMTimeAdd(&v17, &lhs, &rhs);
      CMTime time = v18;
      if (CMTimeGetSeconds(&time) < 0.0) {
        goto LABEL_13;
      }
      id v9 = [v8 classificationForIdentifier:self->_audioQualityAggregated];

      if (!v9) {
        goto LABEL_13;
      }
      v10 = [v8 classificationForIdentifier:self->_audioQualityAggregated];
      [v10 confidence];
      float v12 = 1.0 - v11;

      p_activeStart = &self->_activeStart;
      if (self->_activeStart.flags)
      {
        *(float *)&Float64 Seconds = self->_activeScore;
        if (vabds_f32(*(float *)&Seconds, v12) < 0.001)
        {
          CMTime lhs = v18;
          CMTime rhs = (CMTime)self->_activeEnd;
          CMTimeSubtract(&v15, &lhs, &rhs);
          Float64 Seconds = CMTimeGetSeconds(&v15);
          if (Seconds < 0.5)
          {
            self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
LABEL_13:

            goto LABEL_14;
          }
          *(float *)&Float64 Seconds = self->_activeScore;
        }
        [(VCPSoundClassifier *)self addDetectionFromTime:&self->_activeStart toTime:&self->_activeEnd confidence:Seconds];
        *(_OWORD *)&p_activeStart->value = *(_OWORD *)&v18.value;
        self->_activeStart.epoch = v18.epoch;
        self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
      }
      else
      {
        *(_OWORD *)&p_activeStart->value = *(_OWORD *)&v18.value;
        self->_activeStart.epoch = v18.epoch;
        self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
      }
      self->_activeScore = v12;
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  if (self->_activeStart.flags)
  {
    *(float *)&double v3 = self->_activeScore;
    [(VCPSoundClassifier *)self addDetectionFromTime:&self->_activeStart toTime:&self->_activeEnd confidence:v3];
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    int64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v7 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_activeStart.value = *MEMORY[0x1E4F1F9F8];
    self->_activeStart.epoch = v6;
    *(_OWORD *)&self->_activeEnd.value = v7;
    self->_activeEnd.epoch = *(void *)(v5 + 16);
  }
  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  resultsKey = self->_resultsKey;
  v6[0] = results;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&resultsKey count:1];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsKey, 0);
  objc_storeStrong((id *)&self->_audioQualityAggregated, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end