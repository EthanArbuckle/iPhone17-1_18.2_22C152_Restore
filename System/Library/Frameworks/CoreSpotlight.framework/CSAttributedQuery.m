@interface CSAttributedQuery
+ (BOOL)supportsSecureCoding;
+ (float)_computeThresholdWithScale:(float)a3 bias:(float)a4 cutoffOffset:(float)a5;
+ (void)_updateAttributedQuery:(id)a3 withAttributedParses:(id)a4;
+ (void)_updateAttributedQuery:(id)a3 withOutputTokenInfo:(id)a4;
- (BOOL)isUnsafeQuery;
- (CSAttributedQuery)initWithAttributedParses:(id)a3 outputTokenInfo:(id)a4 embedding:(id)a5 embeddingScale:(float)a6 embeddingBias:(float)a7 isUnsafeQuery:(BOOL)a8 error:(__CFError *)a9;
- (CSAttributedQuery)initWithAttributedQuery:(id)a3;
- (CSAttributedQuery)initWithAttributedQuery:(id)a3 embedding:(id)a4;
- (CSAttributedQuery)initWithCoder:(id)a3;
- (NSAttributedString)query;
- (NSError)error;
- (_CSEmbedding)queryEmbedding;
- (float)highPrecisionDistanceThresh;
- (float)veryHighPrecisionDistanceThresh;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHighPrecisionDistanceThresh:(float)a3;
- (void)setVeryHighPrecisionDistanceThresh:(float)a3;
@end

@implementation CSAttributedQuery

- (CSAttributedQuery)initWithAttributedQuery:(id)a3 embedding:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSAttributedQuery;
  v9 = [(CSAttributedQuery *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    objc_storeStrong((id *)&v10->_queryEmbedding, a4);
  }

  return v10;
}

- (CSAttributedQuery)initWithAttributedQuery:(id)a3
{
  return [(CSAttributedQuery *)self initWithAttributedQuery:a3 embedding:0];
}

- (CSAttributedQuery)initWithAttributedParses:(id)a3 outputTokenInfo:(id)a4 embedding:(id)a5 embeddingScale:(float)a6 embeddingBias:(float)a7 isUnsafeQuery:(BOOL)a8 error:(__CFError *)a9
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  if ([v16 count])
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28E48]);
    v20 = [v16 firstObject];
    v21 = [v20 string];
    v22 = (void *)[v19 initWithString:v21];

    +[CSAttributedQuery _updateAttributedQuery:v22 withOutputTokenInfo:v17];
    +[CSAttributedQuery _updateAttributedQuery:v22 withAttributedParses:v16];
    LODWORD(v23) = -1093689934;
    *(float *)&double v24 = a6;
    *(float *)&double v25 = a7;
    +[CSAttributedQuery _computeThresholdWithScale:v24 bias:v25 cutoffOffset:v23];
    float v27 = v26;
    LODWORD(v28) = 1060457624;
    *(float *)&double v29 = a6;
    *(float *)&double v30 = a7;
    +[CSAttributedQuery _computeThresholdWithScale:v29 bias:v30 cutoffOffset:v28];
    float v32 = v31;
    v33 = [(CSAttributedQuery *)self initWithAttributedQuery:v22 embedding:v18];
    v35 = v33;
    if (v33)
    {
      if (v32 == 3.4028e38) {
        float v32 = 1.4;
      }
      LODWORD(v34) = 1070386381;
      if (v27 != 3.4028e38) {
        *(float *)&double v34 = v27;
      }
      [(CSAttributedQuery *)v33 setHighPrecisionDistanceThresh:v34];
      *(float *)&double v36 = v32;
      [(CSAttributedQuery *)v35 setVeryHighPrecisionDistanceThresh:v36];
    }
    v35->_isUnsafeQuery = a8;
    objc_storeStrong((id *)&v35->_error, a9);
    v37 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      error = v35->_error;
      if (v35->_isUnsafeQuery) {
        v39 = @"YES";
      }
      else {
        v39 = @"NO";
      }
      int v42 = 138412546;
      v43 = v39;
      __int16 v44 = 2112;
      v45 = error;
      _os_log_impl(&dword_18D0E3000, v37, OS_LOG_TYPE_INFO, "Attributed Query has the following variables set isUnsafeQuery:%@ error:%@", (uint8_t *)&v42, 0x16u);
    }

    v40 = v35;
  }
  else
  {
    v40 = [(CSAttributedQuery *)self initWithAttributedQuery:0 embedding:0];
  }

  return v40;
}

+ (float)_computeThresholdWithScale:(float)a3 bias:(float)a4 cutoffOffset:(float)a5
{
  if (a3 == 0.0) {
    return 3.4028e38;
  }
  else {
    return (float)(1.0 - (float)((float)(a5 - a4) / a3)) + (float)(1.0 - (float)((float)(a5 - a4) / a3));
  }
}

+ (void)_updateAttributedQuery:(id)a3 withOutputTokenInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 = [v9 objectForKeyedSubscript:@"kQPQUOutputTokenRange"];
        uint64_t v11 = [v10 rangeValue];
        uint64_t v13 = v12;

        v14 = [v9 objectForKeyedSubscript:@"kQPQUOutputTokenArgLabels"];
        v15 = [v9 objectForKeyedSubscript:@"kQPQUOutputTokenArgScores"];
        uint64_t v16 = [v14 count];
        if (v16 == [v15 count])
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __64__CSAttributedQuery__updateAttributedQuery_withOutputTokenInfo___block_invoke;
          v19[3] = &unk_1E5548E38;
          id v20 = v15;
          id v21 = v17;
          uint64_t v22 = v11;
          uint64_t v23 = v13;
          [v14 enumerateObjectsUsingBlock:v19];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
}

void __64__CSAttributedQuery__updateAttributedQuery_withOutputTokenInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v5 floatValue];
  double v7 = v6;

  if (v7 >= 0.2)
  {
    if (([v9 isEqualToString:@"ARG_LOCATION"] & 1) != 0
      || ([v9 isEqualToString:@"ARG_GENERIC_LOCATION"] & 1) != 0)
    {
      id v8 = @"kMDItemPhotosLocationKeywords";
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v8, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 48), *(void *)(a1 + 56));
      goto LABEL_9;
    }
    if (([v9 isEqualToString:@"ARG_PERSON"] & 1) != 0
      || ([v9 isEqualToString:@"ARG_PERSON_SENDER"] & 1) != 0)
    {
      id v8 = @"kMDItemPhotosPeopleNames";
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"ARG_MEDIA_TYPE"])
    {
      id v8 = @"kMDItemPhotosMediaTypes";
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"ARG_TIME"])
    {
      id v8 = @"kMDItemContentCreationDate";
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"ARG_EVENT"])
    {
      id v8 = @"kMDItemPhotosEventNames";
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"ARG_FAVORITED"])
    {
      id v8 = @"kMDItemPhotosFavorited";
      goto LABEL_8;
    }
  }
LABEL_9:
}

+ (void)_updateAttributedQuery:(id)a3 withAttributedParses:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v21 = v5;
  double v7 = [v5 string];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"InRange\\(kMDItemContentCreationDate,\\$time\\.iso\\(([0-9-]+T[0-9:]+)\\),\\$time\\.iso\\(([0-9-]+T[0-9:]+)\\)\\)" options:0 error:0];
  id v19 = objc_opt_new();
  [v19 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"kMDItemPhotosPeoplePersonIdentifiers=\\\"([A-Z0-9-]+)\\\"" options:0 error:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 = [v14 string];
        int v16 = [v7 isEqualToString:v15];

        if (v16)
        {
          id v17 = [v14 string];
          uint64_t v18 = [v17 length];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke;
          v22[3] = &unk_1E5548E60;
          id v23 = v21;
          id v24 = v20;
          id v25 = v19;
          id v26 = v8;
          objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v18, 0, v22);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }
}

void __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"kQPKind"];
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    v73[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:1];
    objc_msgSend(v10, "addAttribute:value:range:", @"kMDItemPhotosMediaTypes", v11, a3, a4);
  }
  uint64_t v12 = [v7 objectForKeyedSubscript:@"kQPPerson"];
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    v14 = *(void **)(a1 + 32);
    uint64_t v72 = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    objc_msgSend(v14, "addAttribute:value:range:", @"kMDItemPhotosPeopleNames", v15, a3, a4);
  }
  uint64_t v16 = [v7 objectForKeyedSubscript:@"kQPGroundedPerson"];
  id v17 = (void *)v16;
  if (v16)
  {
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v71 = v16;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    objc_msgSend(v18, "addAttribute:value:range:", @"kMDItemPhotosPeopleNames", v19, a3, a4);
  }
  v57 = v17;
  uint64_t v20 = [v7 objectForKeyedSubscript:@"kQPLocation"];
  id v21 = (void *)v20;
  if (v20)
  {
    uint64_t v22 = *(void **)(a1 + 32);
    uint64_t v70 = v20;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    objc_msgSend(v22, "addAttribute:value:range:", @"kMDItemPhotosLocationKeywords", v23, a3, a4);
  }
  id v24 = [v7 objectForKeyedSubscript:@"kQPDescription"];
  id v25 = v24;
  if (v24)
  {
    id v26 = objc_msgSend(*(id *)(a1 + 40), "firstMatchInString:options:range:", v24, 0, 0, objc_msgSend(v24, "length"));
    long long v27 = v26;
    v54 = v13;
    v55 = v9;
    v56 = v26;
    if (v26)
    {
      uint64_t v53 = a4;
      uint64_t v28 = [v26 rangeAtIndex:1];
      v49.length = v29;
      v52 = objc_msgSend(v25, "substringWithRange:", v28, v29);
      uint64_t v30 = objc_msgSend(*(id *)(a1 + 48), "dateFromString:");
      NSUInteger v31 = [v27 rangeAtIndex:2];
      NSUInteger v33 = v32;
      v51 = objc_msgSend(v25, "substringWithRange:", v31, v32);
      uint64_t v34 = objc_msgSend(*(id *)(a1 + 48), "dateFromString:");
      v35 = (void *)v34;
      if (v30 && v34)
      {
        double v36 = *(void **)(a1 + 32);
        v69[0] = v30;
        v69[1] = v34;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
        v38 = v37 = (void *)v30;
        objc_msgSend(v36, "addAttribute:value:range:", @"kMDItemContentCreationDate", v38, a3, v53);
      }
      else
      {
        v49.location = v28;
        v37 = (void *)v30;
        v38 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v50 = NSStringFromRange(v49);
          v74.location = v31;
          v74.length = v33;
          v48 = NSStringFromRange(v74);
          *(_DWORD *)buf = 138413314;
          v60 = v37;
          __int16 v61 = 2112;
          v62 = v35;
          __int16 v63 = 2112;
          v64 = v25;
          __int16 v65 = 2112;
          v66 = v50;
          __int16 v67 = 2112;
          v68 = v48;
          _os_log_error_impl(&dword_18D0E3000, v38, OS_LOG_TYPE_ERROR, "startDate: %@, endDate: %@ from description: %@ startDateRange: %@, endDateRange: %@", buf, 0x34u);
        }
      }
      uint64_t v13 = v54;
      id v9 = v55;

      long long v27 = v56;
      a4 = v53;
    }
    v39 = objc_msgSend(*(id *)(a1 + 56), "firstMatchInString:options:range:", v25, 0, 0, objc_msgSend(v25, "length", v49.location));
    v40 = v39;
    if (v39)
    {
      NSUInteger v41 = [v39 rangeAtIndex:1];
      NSUInteger v43 = v42;
      uint64_t v44 = objc_msgSend(v25, "substringWithRange:", v41, v42);
      v45 = (void *)v44;
      if (v44)
      {
        uint64_t v46 = *(void **)(a1 + 32);
        uint64_t v58 = v44;
        v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        objc_msgSend(v46, "addAttribute:value:range:", @"kMDItemPhotosPeoplePersonIdentifiers", v47, a3, a4);
      }
      else
      {
        v47 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v75.location = v41;
          v75.length = v43;
          __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke_cold_1((uint64_t)v25, v75, v47);
        }
      }
      uint64_t v13 = v54;
      id v9 = v55;

      long long v27 = v56;
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
}

- (CSAttributedQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSAttributedQuery;
  id v5 = [(CSAttributedQuery *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
    query = v5->_query;
    v5->_query = (NSAttributedString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSAttributedQuery alloc];
  id v5 = [(CSAttributedQuery *)self query];
  uint64_t v6 = [(CSAttributedQuery *)self queryEmbedding];
  id v7 = [(CSAttributedQuery *)v4 initWithAttributedQuery:v5 embedding:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSAttributedString)query
{
  return self->_query;
}

- (_CSEmbedding)queryEmbedding
{
  return self->_queryEmbedding;
}

- (float)highPrecisionDistanceThresh
{
  return self->_highPrecisionDistanceThresh;
}

- (void)setHighPrecisionDistanceThresh:(float)a3
{
  self->_highPrecisionDistanceThresh = a3;
}

- (float)veryHighPrecisionDistanceThresh
{
  return self->_veryHighPrecisionDistanceThresh;
}

- (void)setVeryHighPrecisionDistanceThresh:(float)a3
{
  self->_veryHighPrecisionDistanceThresh = a3;
}

- (BOOL)isUnsafeQuery
{
  return self->_isUnsafeQuery;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

void __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke_cold_1(uint64_t a1, NSRange range, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromRange(range);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  objc_super v9 = v5;
  _os_log_error_impl(&dword_18D0E3000, a3, OS_LOG_TYPE_ERROR, "personIdString: nil from description: %@, personIdRange: %@", (uint8_t *)&v6, 0x16u);
}

@end