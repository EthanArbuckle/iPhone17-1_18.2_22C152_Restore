@interface VCPEmbeddingSummarizationAnalyzer
- (id)summarizedEmbeddings;
- (int)findSummarizedEmbeddings:(id)a3;
@end

@implementation VCPEmbeddingSummarizationAnalyzer

- (int)findSummarizedEmbeddings:(id)a3
{
  v31[16] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v4 = [v20 embeddingsArray];
  videoEmbeddings = self->_videoEmbeddings;
  self->_videoEmbeddings = v4;

  self->_embeddingSize = [v20 embeddingSize];
  if (![(NSArray *)self->_videoEmbeddings count])
  {
    int v14 = 0;
    goto LABEL_21;
  }
  v6 = [MEMORY[0x1E4F1CA48] array];
  summarizedEmbeddingIds = self->_summarizedEmbeddingIds;
  self->_summarizedEmbeddingIds = v6;

  v19[1] = v19;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  v25 = 0;
  v26 = 0;
  uint64_t v27 = 0;
  memset(&v24, 0, sizeof(v24));
  MEMORY[0x1F4188790]();
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v23, 0, sizeof(v23));
  v21 = self->_videoEmbeddings;
  if ([(NSArray *)v21 countByEnumeratingWithState:v23 objects:v31 count:16])
  {
    v10 = [*(id *)v23[1] objectForKeyedSubscript:@"attributes"];
    v11 = [v10 objectForKeyedSubscript:@"embeddings"];

    uint64_t v12 = [v11 length];
    if (v12 == 4 * self->_embeddingSize)
    {
      [v11 getBytes:v9 length:v12];
      dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix((uint64_t *)&v22);
    }

    std::vector<int>::pointer begin = 0;
    int v14 = -18;
LABEL_9:
    if (begin) {
      operator delete(begin);
    }
    goto LABEL_18;
  }

  if (v29 != v28)
  {
    if (0xAAAAAAAAAAAAAAABLL * ((v29 - v28) >> 3) <= 0x3E8) {
      partitionEmbeddingsBySpectralClustering();
    }
    partitionEmbeddingsByKmeansWithSilhouetteScore(&v28, &v22);
    std::vector<int> v24 = v22;
    if (v26 != v25)
    {
      pickRepresentativesByDistribution(&v28, &v25, &v22);
      std::vector<int>::pointer begin = v22.__begin_;
      if (v26 != v25)
      {
        unint64_t v15 = 0;
        do
        {
          v16 = self->_summarizedEmbeddingIds;
          v17 = [NSNumber numberWithInt:begin[v15]];
          [(NSMutableArray *)v16 addObject:v17];

          ++v15;
        }
        while (0xAAAAAAAAAAAAAAABLL * (v26 - v25) > v15);
      }
      int v14 = 0;
      goto LABEL_9;
    }
  }
  int v14 = -18;
LABEL_18:
  if (v24.__begin_) {
    operator delete(v24.__begin_);
  }
  v24.__begin_ = (std::vector<int>::pointer)&v25;
  std::vector<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  v25 = (void **)&v28;
  std::vector<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100](&v25);
LABEL_21:

  return v14;
}

- (id)summarizedEmbeddings
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)self->_videoEmbeddings count]
    && [(NSMutableArray *)self->_summarizedEmbeddingIds count])
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&v26.start.value = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&v26.start.epoch = v4;
    *(_OWORD *)&v26.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v5 = self->_summarizedEmbeddingIds;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unsigned int v10 = [v9 unsignedIntValue];
          if ([(NSArray *)self->_videoEmbeddings count] > v10)
          {
            memset(&v21, 0, sizeof(v21));
            -[NSArray objectAtIndexedSubscript:](self->_videoEmbeddings, "objectAtIndexedSubscript:", [v9 unsignedIntValue]);
            CFDictionaryRef v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            CMTimeRangeMakeFromDictionary(&v21, v11);

            CMTimeRange range = v21;
            CMTimeRange v18 = v26;
            CMTimeRangeGetUnion(&v20, &range, &v18);
            CMTimeRange v26 = v20;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v6);
    }

    v29[0] = @"start";
    *(_OWORD *)&v21.start.value = *(_OWORD *)&v26.start.value;
    v21.start.epoch = v26.start.epoch;
    CFDictionaryRef v12 = CMTimeCopyAsDictionary(&v21.start, 0);
    v30[0] = v12;
    v29[1] = @"duration";
    v21.start = v26.duration;
    CFDictionaryRef v13 = CMTimeCopyAsDictionary(&v21.start, 0);
    v30[1] = v13;
    v29[2] = @"attributes";
    summarizedEmbeddingIds = self->_summarizedEmbeddingIds;
    uint64_t v27 = @"embeddingIds";
    uint64_t v28 = summarizedEmbeddingIds;
    unint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v30[2] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
    [v3 addObject:v16];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarizedEmbeddingIds, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
}

@end