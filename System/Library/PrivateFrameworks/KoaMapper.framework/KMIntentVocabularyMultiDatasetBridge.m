@interface KMIntentVocabularyMultiDatasetBridge
- (KMIntentVocabularyMultiDatasetBridge)init;
- (KMIntentVocabularyMultiDatasetBridge)initWithStoreManager:(id)a3 authorization:(id)a4;
- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4;
@end

@implementation KMIntentVocabularyMultiDatasetBridge

- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, KMIntentVocabularyDatasetBridge *))a4;
  v24 = [(KMIntentVocabularyStoreManager *)self->_storeManager savedCustomVocabularyOverviewDictionary];
  v7 = [v24 allKeys];
  v8 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [v7 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136315394;
    v40 = "-[KMIntentVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
    __int16 v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_22475B000, v9, OS_LOG_TYPE_INFO, "%s Enumerating Intents Custom Vocabulary from all available apps=[%@]", buf, 0x16u);
  }
  *a3 = [v7 count];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x22A6168F0]();
        v14 = [(KMIntentVocabularyStoreManager *)self->_storeManager resolveIntentSlotsForApp:v12 fromAllAppsOverview:v24];
        if ([v14 count])
        {
          v27 = v13;
          uint64_t v28 = v11;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v26 = v14;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = [[KMIntentVocabularyDatasetBridge alloc] initWithAppId:v12 intentSlot:*(void *)(*((void *)&v29 + 1) + 8 * i) storeManager:self->_storeManager authorization:self->_authorization itemMapper:self->_itemMapper];
                if (v20) {
                  v6[2](v6, v20);
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v17);
          }

          v13 = v27;
          uint64_t v11 = v28;
          v14 = v26;
        }
        else
        {
          v21 = KMLogContextCore;
          if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v40 = "-[KMIntentVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
            __int16 v41 = 2112;
            v42 = v12;
            _os_log_debug_impl(&dword_22475B000, v21, OS_LOG_TYPE_DEBUG, "%s Found no intentSlots associated with appId=%@ in custom vocabulary directory.", buf, 0x16u);
          }
        }

        ++v11;
      }
      while (v11 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }
}

- (KMIntentVocabularyMultiDatasetBridge)init
{
  v3 = objc_alloc_init(KMIntentVocabularyStoreManager);
  v4 = objc_alloc_init(KMIntentVocabularyAuthorization);
  v5 = [(KMIntentVocabularyMultiDatasetBridge *)self initWithStoreManager:v3 authorization:v4];

  return v5;
}

- (KMIntentVocabularyMultiDatasetBridge)initWithStoreManager:(id)a3 authorization:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KMIntentVocabularyMultiDatasetBridge;
  v9 = [(KMIntentVocabularyMultiDatasetBridge *)&v18 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v9->_storeManager, a3);
  objc_storeStrong((id *)&v10->_authorization, a4);
  if (!v10->_storeManager || !v10->_authorization)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  id v17 = 0;
  uint64_t v11 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v17];
  id v12 = v17;
  itemMapper = v10->_itemMapper;
  v10->_itemMapper = (KVItemMapper *)v11;

  if (!v10->_itemMapper)
  {
    id v15 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[KMIntentVocabularyMultiDatasetBridge initWithStoreManager:authorization:]";
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_error_impl(&dword_22475B000, v15, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    goto LABEL_10;
  }

LABEL_6:
  v14 = v10;
LABEL_11:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_storeManager, 0);
}

@end