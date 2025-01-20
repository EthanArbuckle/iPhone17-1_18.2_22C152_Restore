@interface VCPAudioEmbeddingGenerator
- (VCPAudioEmbeddingGenerator)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5 version:(int)a6;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 embedding:(id)a5;
- (void)request:(id)a3 didProduceResult:(id)a4;
@end

@implementation VCPAudioEmbeddingGenerator

- (VCPAudioEmbeddingGenerator)initWithTrackStart:(id *)a3 threshold:(float)a4 resultsKey:(id)a5 version:(int)a6
{
  id v10 = a5;
  if (v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)VCPAudioEmbeddingGenerator;
    v11 = [(VCPAudioEmbeddingGenerator *)&v17 init];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      results = v11->_results;
      v11->_results = (NSMutableArray *)v12;

      long long v14 = *(_OWORD *)&a3->var0;
      v11->_trackStart.epoch = a3->var3;
      *(_OWORD *)&v11->_trackStart.value = v14;
      objc_storeStrong((id *)&v11->_resultsKey, a5);
      v11->_version = a6;
    }
    self = v11;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 embedding:(id)a5
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  memset(&v26, 0, sizeof(v26));
  CMTime lhs = (CMTime)self->_trackStart;
  CMTime rhs = (CMTime)*a3;
  CMTimeAdd(&start, &lhs, &rhs);
  CMTime lhs = (CMTime)self->_trackStart;
  CMTime rhs = (CMTime)*a4;
  CMTimeAdd(&end, &lhs, &rhs);
  CMTimeRangeFromTimeToTime(&v26, &start, &end);
  if ((v26.start.flags & 1) != 0
    && (v26.duration.flags & 1) != 0
    && !v26.duration.epoch
    && (v26.duration.value & 0x8000000000000000) == 0)
  {
    CMTimeRange range = v26;
    CFDictionaryRef v9 = CMTimeRangeCopyAsDictionary(&range, 0);
    lhs.value = 0;
    *(void *)&lhs.timescale = &lhs;
    lhs.epoch = 0x3032000000;
    v20 = __Block_byref_object_copy__33;
    v21 = __Block_byref_object_dispose__33;
    id v22 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__VCPAudioEmbeddingGenerator_addDetectionFromTime_toTime_embedding___block_invoke;
    v18[3] = &unk_1E6298098;
    v18[4] = &lhs;
    [v8 getBytesWithHandler:v18];
    if ([v8 dataType] == 65568)
    {
      uint64_t v10 = +[VCPTextEncoder convertFloat32ToFloat16:*(void *)(*(void *)&lhs.timescale + 40)];
      v11 = *(void **)(*(void *)&lhs.timescale + 40);
      *(void *)(*(void *)&lhs.timescale + 40) = v10;
    }
    if (*(void *)(*(void *)&lhs.timescale + 40))
    {
      results = self->_results;
      v30[0] = @"start";
      v13 = -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v31[0] = v13;
      v30[1] = @"duration";
      long long v14 = -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v31[1] = v14;
      v30[2] = @"attributes";
      v29[0] = *(void *)(*(void *)&lhs.timescale + 40);
      v28[0] = @"embeddings";
      v28[1] = @"embeddingVersion";
      v15 = [NSNumber numberWithInt:self->_version];
      v29[1] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      v31[2] = v16;
      objc_super v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
      [(NSMutableArray *)results addObject:v17];
    }
    _Block_object_dispose(&lhs, 8);
  }
}

void __68__VCPAudioEmbeddingGenerator_addDetectionFromTime_toTime_embedding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 length:a3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
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
      memset(v14, 0, sizeof(v14));
      long long v13 = 0u;
      [v8 timeRange];
      *(_OWORD *)&v12.value = v13;
      v12.epoch = *(void *)&v14[0];
      memset(&v11, 0, sizeof(v11));
      *(_OWORD *)&lhs.value = v13;
      lhs.epoch = *(void *)&v14[0];
      CMTime rhs = *(CMTime *)((char *)v14 + 8);
      CMTimeAdd(&v11, &lhs, &rhs);
      CMTime v10 = v12;
      if (CMTimeGetSeconds(&v10) >= 0.0)
      {
        CFDictionaryRef v9 = [v8 featureVector];
        [(VCPAudioEmbeddingGenerator *)self addDetectionFromTime:&v12 toTime:&v11 embedding:v9];
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