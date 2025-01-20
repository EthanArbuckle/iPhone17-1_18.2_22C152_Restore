@interface CESRPeopleSuggesterPriorRetriever
- (CESRPeopleSuggesterPriorRetriever)init;
- (id)_convertPeopleSuggesterPriorToPriorInfo:(id)a3;
- (id)_fetchContactPriorsForContactIds:(id)a3;
- (id)allPriorInfoWithThreshold:(unsigned int)a3;
- (id)priorInfoForItemIds:(id)a3;
@end

@implementation CESRPeopleSuggesterPriorRetriever

- (void).cxx_destruct
{
}

- (id)_fetchContactPriorsForContactIds:(id)a3
{
  return (id)[(_PSContactSuggester *)self->_contactSuggester contactPriorsForContactIdentifiers:a3];
}

- (id)_convertPeopleSuggesterPriorToPriorInfo:(id)a3
{
  id v3 = a3;
  v4 = [CESRPriorInfo alloc];
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v3 rank];
    [v3 priorScore];
    v4 = v5;
    uint64_t v8 = v6;
  }
  else
  {
    double v7 = 0.0;
    uint64_t v8 = 0;
  }
  v9 = [(CESRPriorInfo *)v4 initWithOrdinality:v8 score:v7];

  return v9;
}

- (id)allPriorInfoWithThreshold:(unsigned int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  uint64_t v6 = [(CESRPeopleSuggesterPriorRetriever *)self _fetchContactPriorsForContactIds:0];
  double v7 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    *(_DWORD *)buf = 136315650;
    v24 = "-[CESRPeopleSuggesterPriorRetriever allPriorInfoWithThreshold:]";
    __int16 v25 = 1024;
    int v26 = [v6 count];
    __int16 v27 = 1024;
    unsigned int v28 = a3;
    _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s Filtering %u contact priors from PeopleSuggester with threshold: %u", buf, 0x18u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = objc_msgSend(v6, "allValues", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v14 rank] <= a3)
        {
          v15 = [(CESRPeopleSuggesterPriorRetriever *)self _convertPeopleSuggesterPriorToPriorInfo:v14];
          if (v15)
          {
            v16 = [v14 contactIdentifier];
            [v5 setObject:v15 forKey:v16];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v5;
}

- (id)priorInfoForItemIds:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = v5;
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "-[CESRPeopleSuggesterPriorRetriever priorInfoForItemIds:]";
      __int16 v26 = 2048;
      uint64_t v27 = [v4 count];
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Fetching prior info for %lu contacts", buf, 0x16u);
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = [(CESRPeopleSuggesterPriorRetriever *)self _fetchContactPriorsForContactIds:v4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v15 = [v8 objectForKey:v14];
          v16 = [(CESRPeopleSuggesterPriorRetriever *)self _convertPeopleSuggesterPriorToPriorInfo:v15];
          [v7 setValue:v16 forKey:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v4 = v18;
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (CESRPeopleSuggesterPriorRetriever)init
{
  v6.receiver = self;
  v6.super_class = (Class)CESRPeopleSuggesterPriorRetriever;
  v2 = [(CESRPeopleSuggesterPriorRetriever *)&v6 init];
  if (v2)
  {
    id v3 = (_PSContactSuggester *)objc_alloc_init(MEMORY[0x1E4F89C70]);
    contactSuggester = v2->_contactSuggester;
    v2->_contactSuggester = v3;
  }
  return v2;
}

@end