@interface VCPVideoEmbeddings
- (NSArray)embeddingsArray;
- (VCPVideoEmbeddings)initWithEmbeddingType:(int64_t)a3 version:(id)a4;
- (id)convertToFloat16:(id)a3;
- (id)getEmbeddingsForRange:(id *)a3 useFP16:(BOOL)a4;
- (id)videoEmbeddingsFp16;
- (int)addEmbeddings:(id)a3 startTime:(id *)a4 duration:(id *)a5;
- (int64_t)embeddingType;
- (unint64_t)embeddingSize;
- (void)dealloc;
@end

@implementation VCPVideoEmbeddings

- (NSArray)embeddingsArray
{
  return (NSArray *)self->_videoEmbeddings;
}

- (VCPVideoEmbeddings)initWithEmbeddingType:(int64_t)a3 version:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VCPVideoEmbeddings;
  v8 = [(VCPVideoEmbeddings *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_embeddingType = a3;
    v8->_embeddingSize = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    videoEmbeddings = v9->_videoEmbeddings;
    v9->_videoEmbeddings = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    summarizedEmbeddingIds = v9->_summarizedEmbeddingIds;
    v9->_summarizedEmbeddingIds = (NSMutableArray *)v12;

    v9->_averageEmbedding = 0;
    v9->_currentEmbedding = 0;
    objc_storeStrong((id *)&v9->_version, a4);
    v14 = v9;
  }

  return v9;
}

- (int)addEmbeddings:(id)a3 startTime:(id *)a4 duration:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  unint64_t embeddingSize = self->_embeddingSize;
  if (embeddingSize && embeddingSize != (unint64_t)[v8 length] >> 2)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.var0) = 0;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEFAULT, "Embedding sizes don't match, skip calculating embeddings for scene results.", (uint8_t *)&buf, 2u);
      }
    }
    [(NSMutableArray *)self->_videoEmbeddings removeAllObjects];
    [(NSMutableArray *)self->_summarizedEmbeddingIds removeAllObjects];
    int v15 = -18;
  }
  else
  {
    unint64_t v11 = [v9 length];
    unint64_t v12 = v11;
    self->_unint64_t embeddingSize = v11 >> 2;
    if (self->_embeddingType == 2 && v11 >> 2 >= 0x7D1)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v15 = -50;
        goto LABEL_23;
      }
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unint64_t v14 = self->_embeddingSize;
        LODWORD(buf.var0) = 67109376;
        HIDWORD(buf.var0) = v14;
        LOWORD(buf.var1) = 1024;
        *(int *)((char *)&buf.var1 + 2) = 2000;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Embedding size %d exceeds max %d", (uint8_t *)&buf, 0xEu);
      }
      int v15 = -50;
      goto LABEL_16;
    }
    averageEmbedding = self->_averageEmbedding;
    if (!averageEmbedding)
    {
      averageEmbedding = (float *)operator new[](v11 & 0xFFFFFFFFFFFFFFFCLL, MEMORY[0x1E4FBA2D0]);
      self->_averageEmbedding = averageEmbedding;
    }
    currentEmbedding = self->_currentEmbedding;
    if (!currentEmbedding)
    {
      currentEmbedding = (float *)operator new[](v12 & 0xFFFFFFFFFFFFFFFCLL, MEMORY[0x1E4FBA2D0]);
      self->_currentEmbedding = currentEmbedding;
    }
    int v15 = -108;
    if (averageEmbedding && currentEmbedding)
    {
      videoEmbeddings = self->_videoEmbeddings;
      v26[0] = @"start";
      $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
      v13 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
      v27[0] = v13;
      v26[1] = @"duration";
      $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a5;
      CFDictionaryRef v19 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
      v27[1] = v19;
      v26[2] = @"attributes";
      v24 = @"embeddings";
      v25 = v9;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v27[2] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
      [(NSMutableArray *)videoEmbeddings addObject:v21];

      int v15 = 0;
LABEL_16:
    }
  }
LABEL_23:

  return v15;
}

- (id)videoEmbeddingsFp16
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v18 = (void *)[(NSMutableArray *)self->_videoEmbeddings mutableCopy];
  unint64_t v2 = 0;
  objc_super v16 = @"embeddingVersion";
  while (1)
  {
    if (v2 >= objc_msgSend(v18, "count", v16))
    {
      unint64_t v12 = v18;
      id v13 = v18;
      goto LABEL_13;
    }
    v3 = [v18 objectAtIndexedSubscript:v2];
    v4 = [v3 objectForKeyedSubscript:@"attributes"];
    v5 = [v4 objectForKeyedSubscript:@"embeddings"];
    v6 = [(VCPVideoEmbeddings *)self convertToFloat16:v5];

    if (!v6) {
      break;
    }
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:v6 forKeyedSubscript:@"embeddings"];
    version = self->_version;
    if (version) {
      [v7 setObject:version forKeyedSubscript:v16];
    }
    v20[0] = @"start";
    v9 = [v3 objectForKeyedSubscript:@"start"];
    v21[0] = v9;
    v20[1] = @"duration";
    uint64_t v10 = [v3 objectForKeyedSubscript:@"duration"];
    v20[2] = @"attributes";
    v21[1] = v10;
    v21[2] = v7;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    [v18 setObject:v11 atIndexedSubscript:v2];

    ++v2;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unint64_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 0;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Failed to convert fp32 embedding to fp16", buf, 2u);
    }
  }
  id v13 = 0;
  unint64_t v12 = v18;
LABEL_13:

  return v13;
}

- (void)dealloc
{
  averageEmbedding = self->_averageEmbedding;
  if (averageEmbedding) {
    MEMORY[0x1C186C790](averageEmbedding, 0x1000C8052888210);
  }
  currentEmbedding = self->_currentEmbedding;
  if (currentEmbedding) {
    MEMORY[0x1C186C790](currentEmbedding, 0x1000C8052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoEmbeddings;
  [(VCPVideoEmbeddings *)&v5 dealloc];
}

- (id)getEmbeddingsForRange:(id *)a3 useFP16:(BOOL)a4
{
  BOOL v26 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  bzero(self->_averageEmbedding, 4 * self->_embeddingSize);
  bzero(self->_currentEmbedding, 4 * self->_embeddingSize);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->_videoEmbeddings;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v6)
  {

LABEL_23:
    id obja = 0;
    goto LABEL_24;
  }
  uint64_t v7 = *(void *)v37;
  float v8 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v37 != v7) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v10 = *(const __CFDictionary **)(*((void *)&v36 + 1) + 8 * i);
      memset(&v35, 0, sizeof(v35));
      CMTimeRangeMakeFromDictionary(&v35, v10);
      long long v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&range.start.epoch = v11;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
      memset(&v34, 0, sizeof(v34));
      CMTimeRange otherRange = v35;
      CMTimeRangeGetIntersection(&v34, &range, &otherRange);
      if ((v34.start.flags & 1) != 0
        && (v34.duration.flags & 1) != 0
        && !v34.duration.epoch
        && (v34.duration.value & 0x8000000000000000) == 0)
      {
        CMTime time1 = v34.duration;
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (!CMTimeCompare(&time1, &time2)) {
          continue;
        }
      }
      unint64_t v12 = [(__CFDictionary *)v10 objectForKeyedSubscript:@"attributes"];
      id v13 = [v12 objectForKeyedSubscript:@"embeddings"];

      [v13 getBytes:self->_currentEmbedding length:4 * self->_embeddingSize];
      CMTime time = v34.duration;
      float Seconds = CMTimeGetSeconds(&time);
      unint64_t embeddingSize = self->_embeddingSize;
      if (embeddingSize)
      {
        averageEmbedding = self->_averageEmbedding;
        currentEmbedding = self->_currentEmbedding;
        do
        {
          float v18 = *currentEmbedding++;
          float *averageEmbedding = *averageEmbedding + (float)(v18 * Seconds);
          ++averageEmbedding;
          --embeddingSize;
        }
        while (embeddingSize);
      }

      float v8 = v8 + Seconds;
    }
    uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v6);

  if (v8 <= 0.0) {
    goto LABEL_23;
  }
  id obja = [MEMORY[0x1E4F1CA58] dataWithCapacity:0];
  unint64_t v19 = self->_embeddingSize;
  v20 = self->_averageEmbedding;
  if (v19)
  {
    unint64_t v21 = self->_embeddingSize;
    v22 = self->_averageEmbedding;
    do
    {
      float *v22 = *v22 / v8;
      ++v22;
      --v21;
    }
    while (v21);
  }
  [obja appendBytes:v20 length:4 * v19];
LABEL_24:
  if (v26)
  {
    id v23 = [(VCPVideoEmbeddings *)self convertToFloat16:obja];
    v24 = obja;
  }
  else
  {
    v24 = obja;
    id v23 = obja;
  }

  return v23;
}

- (id)convertToFloat16:(id)a3
{
  id v4 = a3;
  int64_t embeddingSize = self->_embeddingSize;
  if ((unint64_t)embeddingSize >> 62) {
    size_t v6 = -1;
  }
  else {
    size_t v6 = 4 * embeddingSize;
  }
  uint64_t v7 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
  float v8 = (int *)operator new[](v6, MEMORY[0x1E4FBA2D0]);
  if (embeddingSize < 0) {
    size_t v9 = -1;
  }
  else {
    size_t v9 = 2 * embeddingSize;
  }
  CFDictionaryRef v10 = operator new[](v9, v7);
  if (v8) {
    _ZF = v10 == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unint64_t v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v24[0] = 0;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Embedding conversion error - out of memory", (uint8_t *)v24, 2u);
      }
    }
    id v13 = 0;
  }
  else
  {
    unint64_t v14 = v10;
    [v4 getBytes:v8 length:4 * embeddingSize];
    unint64_t v15 = self->_embeddingSize;
    if (v15)
    {
      objc_super v16 = v8;
      v17 = v14;
      do
      {
        int v18 = *v16++;
        _S0 = v18;
        __asm { FCVT            H0, S0 }
        *v17++ = _S0;
        --v15;
      }
      while (v15);
    }
    id v13 = [MEMORY[0x1E4F1CA58] dataWithCapacity:0];
    [v13 appendBytes:v14 length:2 * self->_embeddingSize];
    MEMORY[0x1C186C790](v14, 0x1000C80BDFB0063);
    MEMORY[0x1C186C790](v8, 0x1000C8052888210);
  }

  return v13;
}

- (int64_t)embeddingType
{
  return self->_embeddingType;
}

- (unint64_t)embeddingSize
{
  return self->_embeddingSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_summarizedEmbeddingIds, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
}

@end