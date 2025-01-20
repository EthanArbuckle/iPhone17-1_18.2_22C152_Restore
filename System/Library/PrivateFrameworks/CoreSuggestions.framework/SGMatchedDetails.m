@interface SGMatchedDetails
+ (BOOL)supportsSecureCoding;
+ (id)matchedDetailsWithContact:(id)a3 matchinfoData:(id)a4 tokens:(id)a5;
+ (int64_t)tokenMatchedDetailTypeForContact:(id)a3 contactEntityId:(id)a4 detailEntityId:(id)a5 matchedDetailReader:(id)a6 phraseNumber:(unsigned int)a7 token:(id)a8;
+ (int64_t)tokenMatchedDetailTypeForContact:(id)a3 matchedDetailReader:(id)a4 phraseNumber:(unsigned int)a5 token:(id)a6;
+ (int64_t)tokensMatchedDetailTypeForContact:(id)a3 contactEntityId:(id)a4 detailEntityId:(id)a5 matchinfoData:(id)a6 tokens:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMatchedDetails:(id)a3;
- (SGMatchedDetails)initWithCoder:(id)a3;
- (SGMatchedDetails)initWithContact:(id)a3 matchinfoData:(id)a4 tokens:(id)a5;
- (id)description;
- (id)matchedDetailsForToken:(id)a3;
- (id)tokensForDetail:(id)a3;
- (unint64_t)hash;
- (void)_addToTokenDetailMap:(id)a3 token:(id)a4 detail:(id)a5;
- (void)_initilizeDictionariesFromTokenDetailMap:(id)a3;
- (void)_processRawData:(id)a3 tokens:(id)a4 contact:(id)a5 tokenDetailMap:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGMatchedDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTokenMap, 0);

  objc_storeStrong((id *)&self->_tokenDetailMap, 0);
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGMatchedDetails map=%@>", self->_tokenDetailMap];

  return v2;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_tokenDetailMap hash];
}

- (void)encodeWithCoder:(id)a3
{
}

- (SGMatchedDetails)initWithCoder:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SGMatchedDetails;
  v6 = [(SGMatchedDetails *)&v23 init];
  if (v6)
  {
    SEL v19 = a2;
    context = (void *)MEMORY[0x1A6265250]();
    id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v20 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v21, "initWithObjects:", v20, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v16 = [v5 decodeObjectOfClasses:v15 forKey:@"tokenDetailMap"];
    if (!v16)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:v19, v6, @"SGMatchedDetails.m", 342, @"Invalid parameter not satisfying: %@", @"tokenDetailMap" object file lineNumber description];
    }
    [(SGMatchedDetails *)v6 _initilizeDictionariesFromTokenDetailMap:v16];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGMatchedDetails *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGMatchedDetails *)self isEqualToMatchedDetails:v5];

  return v6;
}

- (BOOL)isEqualToMatchedDetails:(id)a3
{
  return [(NSDictionary *)self->_tokenDetailMap isEqual:*((void *)a3 + 1)];
}

- (void)_processRawData:(id)a3 tokens:(id)a4 contact:(id)a5 tokenDetailMap:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v37 = v11;
  id v38 = a6;
  if ([v11 count] == 1
    && ([v10 matchinfoData],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 length],
        v13,
        !v14))
  {
    v33 = [v10 detailEntityId];
    v34 = +[SGRecordId recordIdWithNumericValue:](SGRecordId, "recordIdWithNumericValue:", [v33 longLongValue]);
    v35 = [v12 detailForRecordId:v34];

    v36 = [v11 objectAtIndexedSubscript:0];
    [(SGMatchedDetails *)self _addToTokenDetailMap:v38 token:v36 detail:v35];
  }
  else
  {
    v15 = [SGMatchedDetailsReader alloc];
    v16 = [v10 matchinfoData];
    v17 = [(SGMatchedDetailsReader *)v15 initWithMatchedDetails:v16];

    if ([(SGMatchedDetailsReader *)v17 phraseCount] >= 1)
    {
      uint64_t v18 = [v11 count];
      if (v18 == [(SGMatchedDetailsReader *)v17 phraseCount])
      {
        if ([(SGMatchedDetailsReader *)v17 phraseCount] >= 1)
        {
          uint64_t v19 = 0;
          unsigned int v20 = 1;
          do
          {
            id v21 = [v37 objectAtIndexedSubscript:v19];
            v22 = objc_opt_class();
            objc_super v23 = [v10 entityId];
            v24 = [v10 detailEntityId];
            uint64_t v25 = [v22 tokenMatchedDetailTypeForContact:v12 contactEntityId:v23 detailEntityId:v24 matchedDetailReader:v17 phraseNumber:v20 - 1 token:v21];

            if (v25 == 1
              || ([v12 name],
                  v26 = objc_claimAutoreleasedReturnValue(),
                  [(SGMatchedDetails *)self _addToTokenDetailMap:v38 token:v21 detail:v26], v26, v25))
            {
              v27 = [v10 detailEntityId];
              v28 = +[SGRecordId recordIdWithInternalEntityId:](SGRecordId, "recordIdWithInternalEntityId:", [v27 longLongValue]);

              v29 = [v12 detailForRecordId:v28];
              [(SGMatchedDetails *)self _addToTokenDetailMap:v38 token:v21 detail:v29];
            }
            uint64_t v19 = v20;
          }
          while ([(SGMatchedDetailsReader *)v17 phraseCount] > v20++);
        }
      }
      else
      {
        v31 = sgLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138739971;
          id v40 = v11;
          _os_log_debug_impl(&dword_1A4D8C000, v31, OS_LOG_TYPE_DEBUG, "tokens.count != phraseCount: %{sensitive}@", buf, 0xCu);
        }

        v32 = sgLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1A4D8C000, v32, OS_LOG_TYPE_FAULT, "tokens.count != phraseCount", buf, 2u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
          abort();
        }
      }
    }
  }
}

- (void)_addToTokenDetailMap:(id)a3 token:(id)a4 detail:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  if (a5)
  {
    id v8 = a5;
    uint64_t v9 = [v12 objectForKeyedSubscript:v7];

    if (!v9)
    {
      id v10 = objc_opt_new();
      [v12 setObject:v10 forKeyedSubscript:v7];
    }
    id v11 = [v12 objectForKeyedSubscript:v7];
    [v11 addObject:v8];
  }
}

- (id)tokensForDetail:(id)a3
{
  v3 = [(NSDictionary *)self->_detailTokenMap objectForKeyedSubscript:a3];
  v4 = [v3 allObjects];

  return v4;
}

- (id)matchedDetailsForToken:(id)a3
{
  v3 = [(NSDictionary *)self->_tokenDetailMap objectForKeyedSubscript:a3];
  v4 = [v3 allObjects];

  return v4;
}

- (void)_initilizeDictionariesFromTokenDetailMap:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__SGMatchedDetails__initilizeDictionariesFromTokenDetailMap___block_invoke;
  v11[3] = &unk_1E5B8FA18;
  id v12 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];
  id v7 = (NSDictionary *)[v6 copy];
  detailTokenMap = self->_detailTokenMap;
  self->_detailTokenMap = v7;

  uint64_t v9 = (NSDictionary *)[v4 copy];
  tokenDetailMap = self->_tokenDetailMap;
  self->_tokenDetailMap = v9;
}

void __61__SGMatchedDetails__initilizeDictionariesFromTokenDetailMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];

        if (!v12)
        {
          uint64_t v13 = objc_opt_new();
          [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v11];
        }
        uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
        [v14 addObject:v5];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (SGMatchedDetails)initWithContact:(id)a3 matchinfoData:(id)a4 tokens:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SGMatchedDetails;
  uint64_t v11 = [(SGMatchedDetails *)&v23 init];
  if (v11)
  {
    id v12 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          -[SGMatchedDetails _processRawData:tokens:contact:tokenDetailMap:](v11, "_processRawData:tokens:contact:tokenDetailMap:", *(void *)(*((void *)&v19 + 1) + 8 * v17++), v10, v8, v12, (void)v19);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }

    [(SGMatchedDetails *)v11 _initilizeDictionariesFromTokenDetailMap:v12];
  }

  return v11;
}

+ (int64_t)tokenMatchedDetailTypeForContact:(id)a3 contactEntityId:(id)a4 detailEntityId:(id)a5 matchedDetailReader:(id)a6 phraseNumber:(unsigned int)a7 token:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  if ([a4 isEqual:a5]) {
    int64_t v16 = [(id)objc_opt_class() tokenMatchedDetailTypeForContact:v13 matchedDetailReader:v14 phraseNumber:v9 token:v15];
  }
  else {
    int64_t v16 = 1;
  }

  return v16;
}

+ (int64_t)tokenMatchedDetailTypeForContact:(id)a3 matchedDetailReader:(id)a4 phraseNumber:(unsigned int)a5 token:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = a5;
  id v12 = a4;
  int v13 = [v12 matchAtPhraseIndex:a5 columnIndex:2];
  int64_t v14 = 1;
  LODWORD(v11) = [v12 matchAtPhraseIndex:v11 columnIndex:1];

  if (v11)
  {
    id v15 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789+-()"];
    int64_t v16 = [v15 invertedSet];

    if ([v10 rangeOfCharacterFromSet:v16] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789+-"];
      long long v18 = [v9 name];
      long long v19 = [v18 fullName];
      uint64_t v20 = [v19 rangeOfCharacterFromSet:v17];

      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        LOBYTE(v13) = 1;
      }

      if ((v13 & 1) == 0) {
        goto LABEL_6;
      }
    }
    else
    {

      if (!v13)
      {
LABEL_6:
        int64_t v14 = 0;
        goto LABEL_9;
      }
    }
    int64_t v14 = 2;
  }
LABEL_9:

  return v14;
}

+ (int64_t)tokensMatchedDetailTypeForContact:(id)a3 contactEntityId:(id)a4 detailEntityId:(id)a5 matchinfoData:(id)a6 tokens:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if ([a4 isEqual:a5])
  {
    int64_t v16 = [[SGMatchedDetailsReader alloc] initWithMatchedDetails:v14];
    if ([(SGMatchedDetailsReader *)v16 phraseCount])
    {
      uint64_t v17 = [v15 count];
      if (v17 != [(SGMatchedDetailsReader *)v16 phraseCount])
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, a1, @"SGMatchedDetails.m", 226, @"Invalid parameter not satisfying: %@", @"tokens.count == matchedDetailReader.phraseCount" object file lineNumber description];
      }
      if ([(SGMatchedDetailsReader *)v16 phraseCount] >= 1)
      {
        id v33 = v14;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        int v20 = 0;
        int v21 = 0;
        int v22 = 1;
        char v23 = 1;
        do
        {
          int v34 = v21;
          int v35 = v22;
          while (1)
          {
            v24 = objc_opt_class();
            uint64_t v25 = [v15 objectAtIndexedSubscript:v18];
            uint64_t v26 = [v24 tokenMatchedDetailTypeForContact:v13 matchedDetailReader:v16 phraseNumber:v19 token:v25];

            if (v26 != 1) {
              break;
            }
            uint64_t v18 = (v19 + 1);
            char v23 = 0;
            int v20 = 1;
            uint64_t v19 = v18;
            if ([(SGMatchedDetailsReader *)v16 phraseCount] <= v18)
            {
              LOBYTE(v21) = v34;
              LOBYTE(v22) = v35;
LABEL_31:
              uint64_t v30 = 4;
              if ((v21 & 1) == 0) {
                uint64_t v30 = 1;
              }
              if (v22) {
                int64_t v29 = v30;
              }
              else {
                int64_t v29 = 5;
              }
              id v14 = v33;
              goto LABEL_37;
            }
          }
          int v22 = v35;
          if (v26 == 2) {
            int v27 = 1;
          }
          else {
            int v27 = v34;
          }
          if (v26 == 2) {
            int v28 = 1;
          }
          else {
            int v28 = v20;
          }
          if (v26)
          {
            int v21 = v27;
          }
          else
          {
            int v22 = 0;
            int v21 = 1;
          }
          if (v26) {
            int v20 = v28;
          }
          uint64_t v18 = (v19 + 1);
          uint64_t v19 = v18;
        }
        while ([(SGMatchedDetailsReader *)v16 phraseCount] > v18);
        if ((v23 & 1) == 0) {
          goto LABEL_31;
        }
        if (v20) {
          int64_t v29 = 3;
        }
        else {
          int64_t v29 = 0;
        }
        id v14 = v33;
        if ((v22 & 1) == 0) {
          goto LABEL_37;
        }
      }
      int64_t v29 = 2;
    }
    else
    {
      int64_t v29 = 1;
    }
LABEL_37:
  }
  else
  {
    int64_t v29 = 1;
  }

  return v29;
}

+ (id)matchedDetailsWithContact:(id)a3 matchinfoData:(id)a4 tokens:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithContact:v10 matchinfoData:v9 tokens:v8];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end