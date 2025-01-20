@interface VideoRanker
- (VideoRanker)initWithCorpus:(id)a3;
- (id)rankingScores;
- (int)fit;
- (int)termAndDocumentFrequencies;
@end

@implementation VideoRanker

- (VideoRanker)initWithCorpus:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 count])
  {
    v17.receiver = self;
    v17.super_class = (Class)VideoRanker;
    v7 = [(VideoRanker *)&v17 init];
    v8 = v7;
    if (!v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&v7->_corpus, a3);
    v9 = [(NSDictionary *)v8->_corpus allKeys];
    v8->_corpusSize = [v9 count];

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tfs = v8->_tfs;
    v8->_tfs = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    maxSegments = v8->_maxSegments;
    v8->_maxSegments = v12;

    *(void *)&v8->_b = 0x3FC000003F400000;
    v8->_topK = 20;
    if (![(VideoRanker *)v8 fit])
    {
      if ([(VideoRanker *)v8 termAndDocumentFrequencies]) {
        v14 = 0;
      }
      else {
        v14 = v8;
      }
    }
    else
    {
LABEL_5:
      v14 = 0;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
    v8 = self;
  }

  return v15;
}

- (int)fit
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v35 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = [(NSDictionary *)self->_corpus allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v2)
  {
    int v38 = 0;
    uint64_t v34 = *(void *)v46;
    while (2)
    {
      uint64_t v33 = v2;
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v39 = [(NSDictionary *)self->_corpus objectForKeyedSubscript:v4];
        if (![v39 count])
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            objc_super v17 = VCPLogInstance();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v4;
              _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "No segments found for %@", buf, 0xCu);
            }
          }
          int v18 = -23803;
          goto LABEL_34;
        }
        int v36 = [v39 count];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v5 = v39;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v55 count:16];
        v37 = v4;
        v7 = 0;
        if (v6)
        {
          uint64_t v8 = *(void *)v42;
          v9 = &unk_1F15EADB8;
          do
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (*(void *)v42 != v8) {
                objc_enumerationMutation(v5);
              }
              v11 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              v12 = [v11 objectForKeyedSubscript:@"quality"];
              BOOL v13 = v12 < v9;

              if (!v13)
              {
                uint64_t v14 = [v11 objectForKeyedSubscript:@"quality"];

                id v15 = v11;
                v9 = (void *)v14;
                v7 = v15;
              }
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v55 count:16];
          }
          while (v6);
        }
        else
        {
          v9 = &unk_1F15EADB8;
        }

        [v35 addObject:v9];
        [(NSMutableDictionary *)self->_maxSegments setObject:v7 forKey:v37];

        v38 += v36;
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      if (v2) {
        continue;
      }
      break;
    }
    float v16 = (float)v38;
  }
  else
  {
    float v16 = 0.0;
  }

  self->_avgDocumentLength = v16 / (float)self->_corpusSize;
  [v35 sortUsingComparator:&__block_literal_global_85];
  int topK = self->_topK;
  int v20 = [v35 count];
  if (topK >= v20) {
    int v21 = v20;
  }
  else {
    int v21 = topK;
  }
  self->_int topK = v21;
  v22 = [v35 objectAtIndexedSubscript:v21];
  [v22 floatValue];
  self->_similarityThreshold = v23;

  v24 = v35;
  if ((int)MediaAnalysisLogLevel() < 7)
  {
    int v18 = 0;
  }
  else
  {
    obuint64_t j = VCPLogInstance();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
    {
      v25 = [NSNumber numberWithInt:self->_topK];
      *(float *)&double v26 = self->_similarityThreshold;
      v27 = [NSNumber numberWithFloat:v26];
      v28 = NSNumber;
      v29 = [(NSMutableDictionary *)self->_maxSegments allKeys];
      v30 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
      *(_DWORD *)buf = 138412802;
      v50 = v25;
      __int16 v51 = 2112;
      v52 = v27;
      __int16 v53 = 2112;
      v54 = v30;
      _os_log_impl(&dword_1BBEDA000, obj, OS_LOG_TYPE_DEBUG, "BM25: fit top_k %@, with threshold %@, maxSeg count %@", buf, 0x20u);
    }
    int v18 = 0;
LABEL_34:

    v24 = v35;
  }

  return v18;
}

uint64_t __18__VideoRanker_fit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (int)termAndDocumentFrequencies
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [(NSDictionary *)self->_corpus allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v3)
  {
    uint64_t v27 = *(void *)v34;
    while (2)
    {
      uint64_t v4 = 0;
      uint64_t v26 = v3;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v33 + 1) + 8 * v4);
        uint64_t v6 = [(NSDictionary *)self->_corpus objectForKeyedSubscript:v5];
        if (![v6 count])
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            float v23 = VCPLogInstance();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              int v38 = v5;
              _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "No segments found for %@", buf, 0xCu);
            }
          }
          int v22 = -23803;
          goto LABEL_25;
        }
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v43 count:16];
        v28 = v5;
        int v9 = 0;
        if (v8)
        {
          uint64_t v10 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v30 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = [*(id *)(*((void *)&v29 + 1) + 8 * i) objectForKeyedSubscript:@"quality"];
              [v12 floatValue];
              int v14 = v13 > self->_similarityThreshold;

              v9 += v14;
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v43 count:16];
          }
          while (v8);
        }

        tfs = self->_tfs;
        float v16 = NSNumber;
        *(float *)&double v17 = (float)v9 / (float)(unint64_t)[v7 count];
        int v18 = [v16 numberWithFloat:v17];
        [(NSMutableDictionary *)tfs setObject:v18 forKey:v28];

        self->_df += v9;
        ++v4;
      }
      while (v4 != v26);
      uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  self->_idf = (int)log(((double)(self->_corpusSize - self->_df) + 0.5) / ((double)self->_df + 0.5) + 1.0);
  if ((int)MediaAnalysisLogLevel() < 7) {
    return 0;
  }
  obuint64_t j = VCPLogInstance();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
  {
    v19 = [NSNumber numberWithInt:self->_idf];
    int v20 = [NSNumber numberWithInt:self->_df];
    int v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_tfs, "count"));
    *(_DWORD *)buf = 138412802;
    int v38 = v19;
    __int16 v39 = 2112;
    v40 = v20;
    __int16 v41 = 2112;
    long long v42 = v21;
    _os_log_impl(&dword_1BBEDA000, obj, OS_LOG_TYPE_DEBUG, "BM25: term And DocumentFrequencies _idf %@, _df %@, _tfs count %@", buf, 0x20u);
  }
  int v22 = 0;
LABEL_25:

  return v22;
}

- (id)rankingScores
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(NSDictionary *)self->_corpus allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v3)
  {
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v6 = [(NSDictionary *)self->_corpus objectForKeyedSubscript:v5];
        int v7 = [v6 count];

        uint64_t v8 = [(NSMutableDictionary *)self->_tfs objectForKeyedSubscript:v5];
        [(id)v8 floatValue];
        float v10 = v9;

        int idf = self->_idf;
        float b = self->_b;
        float k1 = self->_k1;
        float avgDocumentLength = self->_avgDocumentLength;
        id v15 = [(NSMutableDictionary *)self->_maxSegments objectForKeyedSubscript:v5];
        LOBYTE(v8) = v15 == 0;

        if (v8)
        {
          int v18 = &unk_1F15EB228;
        }
        else
        {
          double v17 = [(NSMutableDictionary *)self->_maxSegments objectForKeyedSubscript:v5];
          int v18 = [v17 objectForKeyedSubscript:@"quality"];
        }
        *(float *)&double v16 = (float)((float)(k1 + 1.0) * (float)(idf * (int)v10))
                       / (float)((float)(int)v10
                               + (float)(k1
                                       * (float)((float)(1.0 - b) + (float)((float)(b * (float)v7) / avgDocumentLength))));
        v29[0] = @"BM25Rank";
        v19 = [NSNumber numberWithFloat:v16];
        v29[1] = @"SimilarityScore";
        v30[0] = v19;
        v30[1] = v18;
        int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

        [v24 setObject:v20 forKey:v5];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v3);
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSegments, 0);
  objc_storeStrong((id *)&self->_tfs, 0);
  objc_storeStrong((id *)&self->_corpus, 0);
}

@end