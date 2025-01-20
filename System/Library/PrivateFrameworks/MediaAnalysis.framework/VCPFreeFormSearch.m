@interface VCPFreeFormSearch
+ (BOOL)getSearchTesting;
+ (float)getHighSimilarityThreshold;
+ (float)getMaxSimilarityDiffFor1UP;
+ (float)getMinSimilarity;
+ (float)getMinSimilarityHighRecall;
- (VCPFreeFormSearch)init;
- (id)searchForQuery:(id)a3 matchingScoreOnly:(BOOL)a4 topK:(int)a5;
- (int)loadEmbeddings:(id)a3;
- (void)dealloc;
- (void)reset;
@end

@implementation VCPFreeFormSearch

+ (float)getMinSimilarity
{
  if (+[VCPVideoTransformerBackbone revision] == 3)
  {
    +[VCPFreeFormSearch getMinSimilarity]::minSimilarity = 1057803469;
    return 0.55;
  }
  else if (+[VCPVideoTransformerBackbone revision] == 4)
  {
    +[VCPFreeFormSearch getMinSimilarity]::minSimilarity = 1053609165;
    return 0.4;
  }
  else if (+[VCPVideoTransformerBackbone revision] == 5)
  {
    +[VCPFreeFormSearch getMinSimilarity]::minSimilarity = 1053273620;
    return 0.39;
  }
  else
  {
    return *(float *)&+[VCPFreeFormSearch getMinSimilarity]::minSimilarity;
  }
}

+ (float)getMinSimilarityHighRecall
{
  if (+[VCPVideoTransformerBackbone revision] == 3)
  {
    +[VCPFreeFormSearch getMinSimilarityHighRecall]::minSimilarity = 1048576000;
    return 0.25;
  }
  else if (+[VCPVideoTransformerBackbone revision] == 4)
  {
    +[VCPFreeFormSearch getMinSimilarityHighRecall]::minSimilarity = 1036831949;
    return 0.1;
  }
  else if (+[VCPVideoTransformerBackbone revision] == 5)
  {
    +[VCPFreeFormSearch getMinSimilarityHighRecall]::minSimilarity = 1049582633;
    return 0.28;
  }
  else
  {
    return *(float *)&+[VCPFreeFormSearch getMinSimilarityHighRecall]::minSimilarity;
  }
}

+ (float)getMaxSimilarityDiffFor1UP
{
  if (+[VCPVideoTransformerBackbone revision] != 3
    && +[VCPVideoTransformerBackbone revision] != 4
    && +[VCPVideoTransformerBackbone revision] != 5)
  {
    return *(float *)&+[VCPFreeFormSearch getMaxSimilarityDiffFor1UP]::maxSimilarityDiff;
  }
  +[VCPFreeFormSearch getMaxSimilarityDiffFor1UP]::maxSimilarityDiff = 1045220557;
  return 0.2;
}

+ (float)getHighSimilarityThreshold
{
  if (+[VCPVideoTransformerBackbone revision] == 3)
  {
    +[VCPFreeFormSearch getHighSimilarityThreshold]::threshold = 1059481190;
    return 0.65;
  }
  else if (+[VCPVideoTransformerBackbone revision] == 4)
  {
    +[VCPFreeFormSearch getHighSimilarityThreshold]::threshold = 1056964608;
    return 0.5;
  }
  else if (+[VCPVideoTransformerBackbone revision] == 5)
  {
    +[VCPFreeFormSearch getHighSimilarityThreshold]::threshold = 1058642330;
    return 0.6;
  }
  else
  {
    return *(float *)&+[VCPFreeFormSearch getHighSimilarityThreshold]::threshold;
  }
}

+ (BOOL)getSearchTesting
{
  return 0;
}

- (VCPFreeFormSearch)init
{
  v17.receiver = self;
  v17.super_class = (Class)VCPFreeFormSearch;
  v2 = [(VCPFreeFormSearch *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    fileNames = v2->_fileNames;
    v2->_fileNames = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    timeRanges = v2->_timeRanges;
    v2->_timeRanges = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    embeddings = v2->_embeddings;
    v2->_embeddings = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    fileIndices = v2->_fileIndices;
    v2->_fileIndices = (NSMutableArray *)v9;

    int64_t v11 = +[VCPVideoTransformerBackbone revision];
    if ((unint64_t)(v11 - 3) >= 3)
    {
      if (v11 == 2) {
        int v14 = 768;
      }
      else {
        int v14 = 512;
      }
      v2->_embeddingDim = v14;
      textEmbeddingThreshold = v2->_textEmbeddingThreshold;
      v2->_textEmbeddingThreshold = 0;
    }
    else
    {
      uint64_t v12 = +[MADTextEmbeddingThreshold createForEmbeddingVersion:](MADTextEmbeddingThreshold, "createForEmbeddingVersion:", +[VCPVideoTransformerBackbone embeddingVersion]);
      v13 = v2->_textEmbeddingThreshold;
      v2->_textEmbeddingThreshold = (MADTextEmbeddingThreshold *)v12;

      v2->_embeddingDim = 512;
    }
  }
  return v2;
}

- (int)loadEmbeddings:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  [(VCPFreeFormSearch *)self reset];
  if (v54 && [v54 count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = [v54 allKeys];
    uint64_t v49 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v49)
    {
      unsigned int v56 = 0;
      uint64_t v50 = *(void *)v63;
      *(void *)&long long v4 = 138412802;
      long long v48 = v4;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v63 != v50) {
            objc_enumerationMutation(obj);
          }
          CMTimeValue v5 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          -[NSMutableArray addObject:](self->_fileNames, "addObject:", v5, v48);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          CMTimeValue v52 = v5;
          id v55 = [v54 objectForKeyedSubscript:v5];
          uint64_t v6 = [v55 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v59;
            while (2)
            {
              for (uint64_t j = 0; j != v6; ++j)
              {
                if (*(void *)v59 != v7) {
                  objc_enumerationMutation(v55);
                }
                CFDictionaryRef v9 = *(const __CFDictionary **)(*((void *)&v58 + 1) + 8 * j);
                memset(&v57, 0, sizeof(v57));
                CMTimeRangeMakeFromDictionary(&v57, v9);
                v10 = [(__CFDictionary *)v9 objectForKeyedSubscript:@"attributes"];
                int64_t v11 = [v10 objectForKeyedSubscript:@"embeddings"];

                uint64_t v12 = [(__CFDictionary *)v9 objectForKeyedSubscript:@"attributes"];
                v13 = [v12 objectForKeyedSubscript:@"embeddingVersion"];

                if (v13)
                {
                  unint64_t v14 = +[VCPVideoTransformerBackbone embeddingVersion];
                  if (v14 != (int)[v13 intValue]) {
                    goto LABEL_27;
                  }
                }
                else if (+[VCPVideoTransformerBackbone embeddingVersion] != 2)
                {
LABEL_27:
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    v20 = VCPLogInstance();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      CMTimeFlags v21 = +[VCPVideoTransformerBackbone embeddingVersion];
                      int v22 = [v13 intValue];
                      LODWORD(range.start.value) = v48;
                      *(CMTimeValue *)((char *)&range.start.value + 4) = v52;
                      LOWORD(range.start.flags) = 1024;
                      *(CMTimeFlags *)((char *)&range.start.flags + 2) = v21;
                      WORD1(range.start.epoch) = 1024;
                      HIDWORD(range.start.epoch) = v22;
                      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "[%@] Video embedding version mismatch skip. Expect %d, Got %d", (uint8_t *)&range, 0x18u);
                    }
                  }
                  goto LABEL_32;
                }
                if (self->_embeddingDim != (unint64_t)[v11 length] >> 1)
                {
                  if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    v46 = VCPLogInstance();
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                    {
                      LOWORD(range.start.value) = 0;
                      _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_ERROR, "Video embedding dimension doesn't match with requirement", (uint8_t *)&range, 2u);
                    }
                  }
                  int v45 = -50;
                  goto LABEL_60;
                }
                if (v11)
                {
                  fileIndices = self->_fileIndices;
                  v16 = [NSNumber numberWithInt:v56];
                  [(NSMutableArray *)fileIndices addObject:v16];

                  timeRanges = self->_timeRanges;
                  CMTimeRange range = v57;
                  CFDictionaryRef v18 = CMTimeRangeCopyAsDictionary(&range, 0);
                  [(NSMutableArray *)timeRanges addObject:v18];

                  [(NSMutableArray *)self->_embeddings addObject:v11];
                }
                else if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  v19 = VCPLogInstance();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(range.start.value) = 138412290;
                    *(CMTimeValue *)((char *)&range.start.value + 4) = v52;
                    _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "Missing embedding for %@", (uint8_t *)&range, 0xCu);
                  }
                }
              }
              uint64_t v6 = [v55 countByEnumeratingWithState:&v58 objects:v66 count:16];
              if (v6) {
                continue;
              }
              break;
            }
          }
LABEL_32:

          ++v56;
        }
        uint64_t v49 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v49);
    }

    int v23 = [(NSMutableArray *)self->_fileIndices count];
    self->_numVideos = v23;
    uint64_t embeddingDim = self->_embeddingDim;
    if ((int)embeddingDim * v23 < 0) {
      size_t v25 = -1;
    }
    else {
      size_t v25 = 4 * (int)embeddingDim * v23;
    }
    v26 = (float *)operator new[](v25, MEMORY[0x1E4FBA2D0]);
    self->_videoEmbedings = v26;
    if (!v26
      || ((int)embeddingDim < 0 ? (size_t v27 = -1) : (size_t v27 = 2 * embeddingDim),
          (v28 = (__int16 *)operator new[](v27, MEMORY[0x1E4FBA2D0])) == 0))
    {
      int v45 = -108;
      goto LABEL_60;
    }
    v29 = v28;
    if (v23 >= 1)
    {
      uint64_t v30 = 0;
      do
      {
        v31 = [(NSMutableArray *)self->_embeddings objectAtIndexedSubscript:v30];
        videoEmbedings = self->_videoEmbedings;
        uint64_t v33 = self->_embeddingDim;
        [v31 getBytes:v29 length:2 * v33];
        uint64_t v34 = self->_embeddingDim;
        if ((int)v34 >= 1)
        {
          v35 = &videoEmbedings[(int)v33 * (int)v30];
          v36 = v29;
          do
          {
            __int16 v37 = *v36++;
            _H0 = v37;
            __asm { FCVT            S0, H0 }
            *(_DWORD *)v35++ = _S0;
            --v34;
          }
          while (v34);
        }

        ++v30;
      }
      while (v30 < self->_numVideos);
    }
    MEMORY[0x1C186C790](v29, 0x1000C80BDFB0063);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v44 = VCPLogInstance();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(range.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEFAULT, "No video embedding results", (uint8_t *)&range, 2u);
    }
  }
  int v45 = 0;
LABEL_60:

  return v45;
}

- (void)reset
{
  [(NSMutableArray *)self->_fileNames removeAllObjects];
  [(NSMutableArray *)self->_timeRanges removeAllObjects];
  [(NSMutableArray *)self->_embeddings removeAllObjects];
  [(NSMutableArray *)self->_fileIndices removeAllObjects];
  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
    self->_inputData = 0;
  }
  videoEmbedings = self->_videoEmbedings;
  if (videoEmbedings)
  {
    MEMORY[0x1C186C790](videoEmbedings, 0x1000C8052888210);
    self->_videoEmbedings = 0;
  }
  self->_numVideos = 0;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  videoEmbedings = self->_videoEmbedings;
  if (videoEmbedings) {
    MEMORY[0x1C186C790](videoEmbedings, 0x1000C8052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPFreeFormSearch;
  [(VCPFreeFormSearch *)&v5 dealloc];
}

- (id)searchForQuery:(id)a3 matchingScoreOnly:(BOOL)a4 topK:(int)a5
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v19 = self;
  if (self->_embeddingDim == (unint64_t)[v18 length] >> 2)
  {
    int v21 = 1065353216;
    v22[0] = 0;
    int v20 = 0;
    if (self->_textEmbeddingThreshold)
    {
      uint64_t v6 = +[VCPTextEncoder convertFloat32ToFloat16:v18];
      id v7 = objc_alloc(MEMORY[0x1E4F745B8]);
      unint64_t v8 = +[VCPVideoTransformerBackbone embeddingVersion];
      v24[0] = &unk_1F15EDB48;
      CFDictionaryRef v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v6, "length") >> 1);
      v24[1] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      int64_t v11 = (void *)[v7 initWithVersion:v8 data:v6 type:1 shape:v10];

      int v12 = [(MADTextEmbeddingThreshold *)v19->_textEmbeddingThreshold processEmbedding:v11 bias:v22 scale:&v21 threshold:&v20];
      if (v12)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v12;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "MD4 Failed to get calibration bias/scale with Error %d", buf, 8u);
          }
        }
        goto LABEL_13;
      }
    }
    +[VCPFreeFormSearch getMinSimilarity];
    [MEMORY[0x1E4F1CA60] dictionary];
    objc_claimAutoreleasedReturnValue();
    operator new[]();
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unint64_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = [v18 length];
      int embeddingDim = self->_embeddingDim;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v15 >> 2;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = embeddingDim;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Query embedding dimension %d doesn't match with requirement %d", buf, 0xEu);
    }
  }
LABEL_13:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEmbeddingThreshold, 0);
  objc_storeStrong((id *)&self->_embeddings, 0);
  objc_storeStrong((id *)&self->_timeRanges, 0);
  objc_storeStrong((id *)&self->_fileIndices, 0);
  objc_storeStrong((id *)&self->_fileNames, 0);
}

@end