@interface VCPSoundDetector
- (VCPSoundDetector)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 confidence:(float)a5;
- (void)request:(id)a3 didProduceResult:(id)a4;
@end

@implementation VCPSoundDetector

- (VCPSoundDetector)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5
{
  id v9 = a5;
  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)VCPSoundDetector;
    v10 = [(VCPSoundDetector *)&v19 init];
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
      *((_DWORD *)v10 + 26) = 2;
      objc_storeStrong((id *)v10 + 14, a5);
    }
    self = v10;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
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
    && (v18.duration.value & 0x8000000000000000) == 0
    && self->_length >= self->_minDetections)
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
      [v8 confidence];
      double v10 = v9;
      memset(v20, 0, sizeof(v20));
      long long v19 = 0u;
      [v8 timeRange];
      *(_OWORD *)&v18.value = v19;
      v18.epoch = *(void *)&v20[0];
      memset(&v17, 0, sizeof(v17));
      *(_OWORD *)&lhs.value = v19;
      lhs.epoch = *(void *)&v20[0];
      CMTime rhs = *(CMTime *)((char *)v20 + 8);
      CMTimeAdd(&v17, &lhs, &rhs);
      $95D729B680665BEAEFA1D6FCA8238556 v16 = v18;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v16);
      if (Seconds <= 0.0 || (float activeConfidence = v10, self->_threshold >= activeConfidence))
      {
        if (self->_activeStart.flags)
        {
          *(float *)&Float64 Seconds = self->_activeConfidence;
          [(VCPSoundDetector *)self addDetectionFromTime:&self->_activeStart toTime:&self->_activeEnd confidence:Seconds];
        }
        uint64_t v13 = MEMORY[0x1E4F1F9F8];
        int64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        long long v15 = *MEMORY[0x1E4F1F9F8];
        *(_OWORD *)&self->_activeStart.value = *MEMORY[0x1E4F1F9F8];
        self->_activeStart.epoch = v14;
        *(_OWORD *)&self->_activeEnd.value = v15;
        self->_activeEnd.epoch = *(void *)(v13 + 16);
        self->_length = 0;
        self->_float activeConfidence = 0.0;
      }
      else
      {
        if (self->_activeStart.flags)
        {
          self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
          if (self->_activeConfidence >= activeConfidence) {
            float activeConfidence = self->_activeConfidence;
          }
        }
        else
        {
          self->_activeStart = v18;
          self->_activeEnd = ($95D729B680665BEAEFA1D6FCA8238556)v17;
        }
        self->_float activeConfidence = activeConfidence;
        ++self->_length;
      }
    }
  }
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  if (self->_activeStart.flags)
  {
    *(float *)&double v3 = self->_activeConfidence;
    [(VCPSoundDetector *)self addDetectionFromTime:&self->_activeStart toTime:&self->_activeEnd confidence:v3];
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    int64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v7 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_activeStart.value = *MEMORY[0x1E4F1F9F8];
    self->_activeStart.epoch = v6;
    *(_OWORD *)&self->_activeEnd.value = v7;
    self->_activeEnd.epoch = *(void *)(v5 + 16);
    self->_float activeConfidence = 0.0;
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
  objc_storeStrong((id *)&self->_results, 0);
}

@end