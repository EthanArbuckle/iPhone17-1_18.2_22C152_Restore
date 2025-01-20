@interface KMAppGlobalVocabularyMultiDatasetBridge
- (KMAppGlobalVocabularyMultiDatasetBridge)init;
- (KMAppGlobalVocabularyMultiDatasetBridge)initWithModifiedOriginAppIds:(id)a3 languageCode:(id)a4;
- (id)_extractAllAppIntentVocabularyForApp:(id)a3 languageCode:(id)a4;
- (id)_extractAllAppIntentVocabularyFromBundle:(__CFBundle *)a3 languageCode:(id)a4;
- (id)_sortAppIntentVocabularyByCascadeItemType:(id)a3;
- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4;
@end

@implementation KMAppGlobalVocabularyMultiDatasetBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_modifiedAppIds, 0);
}

- (id)_sortAppIntentVocabularyByCascadeItemType:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __85__KMAppGlobalVocabularyMultiDatasetBridge__sortAppIntentVocabularyByCascadeItemType___block_invoke;
        v12[3] = &unk_2646DBAC8;
        id v13 = v4;
        v14 = v10;
        [v10 enumerateFieldsUsingBlock:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

void __85__KMAppGlobalVocabularyMultiDatasetBridge__sortAppIntentVocabularyByCascadeItemType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = [a2 fieldType] - 600;
  if (v6 <= 4)
  {
    uint64_t v7 = word_22477B9B0[v6];
    if (v7 != (unsigned __int16)*MEMORY[0x263F316D0])
    {
      uint64_t v8 = *(void **)(a1 + 32);
      v9 = [NSNumber numberWithUnsignedShort:word_22477B9B0[v6]];
      id v12 = [v8 objectForKey:v9];

      if (!v12)
      {
        id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
        v10 = *(void **)(a1 + 32);
        v11 = [NSNumber numberWithUnsignedShort:v7];
        [v10 setObject:v12 forKey:v11];
      }
      [v12 addObject:*(void *)(a1 + 40)];
      *a4 = 1;
    }
  }
}

- (id)_extractAllAppIntentVocabularyFromBundle:(__CFBundle *)a3 languageCode:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v6 = (__CFString *)a4;
  CFURLRef v7 = CFBundleCopyResourceURLForLocalization(a3, @"AppIntentVocabulary", @"plist", 0, v6);
  if (!v7)
  {
    uint64_t v8 = v6;
    if ([(__CFString *)v8 length])
    {
      v9 = [(__CFString *)v8 componentsSeparatedByString:@"-"];
      v10 = [v9 firstObject];
    }
    else
    {
      v10 = 0;
    }

    CFURLRef v7 = CFBundleCopyResourceURLForLocalization(a3, @"AppIntentVocabulary", @"plist", 0, v10);
    if (!v7)
    {
      v11 = [(__CFString *)v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      id v12 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v11];

      CFURLRef v7 = CFBundleCopyResourceURLForLocalization(a3, @"AppIntentVocabulary", @"plist", 0, (CFStringRef)[v12 localeIdentifier]);
      if (!v7)
      {

        long long v15 = 0;
        goto LABEL_18;
      }
    }
  }
  id v13 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v7];
  if (v13)
  {
    itemMapper = self->_itemMapper;
    id v21 = 0;
    long long v15 = [(KVItemMapper *)itemMapper mapObject:v13 error:&v21];
    CFURLRef v16 = (const __CFURL *)v21;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      v19 = KMLogContextCore;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyFromBundle:languageCode:]";
        __int16 v24 = 2112;
        CFURLRef v25 = v16;
        _os_log_error_impl(&dword_22475B000, v19, OS_LOG_TYPE_ERROR, "%s Failed to map appIntentVocabulary with error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    long long v18 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyFromBundle:languageCode:]";
      __int16 v24 = 2112;
      CFURLRef v25 = v7;
      _os_log_error_impl(&dword_22475B000, v18, OS_LOG_TYPE_ERROR, "%s Failed to initialize appIntentVocabulary dictionary from URL: %@", buf, 0x16u);
    }
    CFURLRef v16 = 0;
    long long v15 = 0;
  }

LABEL_18:
  return v15;
}

- (id)_extractAllAppIntentVocabularyForApp:(id)a3 languageCode:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v16 = 0;
    uint64_t v8 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v16];
    id v9 = v16;
    [v8 URL];
    uint64_t Unique = _CFBundleCreateUnique();
    if (Unique)
    {
      v11 = (const void *)Unique;
      id v12 = [(KMAppGlobalVocabularyMultiDatasetBridge *)self _extractAllAppIntentVocabularyFromBundle:Unique languageCode:v7];
      _CFBundleFlushBundleCaches();
      CFRelease(v11);
    }
    else
    {
      v14 = KMLogContextCore;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v18 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyForApp:languageCode:]";
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_error_impl(&dword_22475B000, v14, OS_LOG_TYPE_ERROR, "%s Cannot create a bundle instance with appId: %@", buf, 0x16u);
      }
      id v12 = 0;
    }
  }
  else
  {
    id v13 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v18 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyForApp:languageCode:]";
      _os_log_error_impl(&dword_22475B000, v13, OS_LOG_TYPE_ERROR, "%s nil languageCode", buf, 0xCu);
    }
    id v12 = 0;
  }

  return v12;
}

- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, KMAppGlobalVocabularyBridge *))a4;
  id v6 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    id v7 = NSNumber;
    modifiedAppIds = self->_modifiedAppIds;
    id v9 = v6;
    v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[NSSet count](modifiedAppIds, "count"));
    *(_DWORD *)buf = 136315394;
    v45 = "-[KMAppGlobalVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
    __int16 v46 = 2112;
    v47 = v10;
    _os_log_impl(&dword_22475B000, v9, OS_LOG_TYPE_INFO, "%s Scanning app global terms for %@ modified apps", buf, 0x16u);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = self->_modifiedAppIds;
  uint64_t v29 = [(NSSet *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  unint64_t v11 = 0;
  if (v29)
  {
    uint64_t v28 = *(void *)v39;
    v27 = self;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x22A6168F0]();
        long long v15 = [(KMAppGlobalVocabularyMultiDatasetBridge *)self _extractAllAppIntentVocabularyForApp:v13 languageCode:self->_languageCode];
        if (v15)
        {
          v31 = v14;
          uint64_t v32 = i;
          v30 = v15;
          id v16 = [(KMAppGlobalVocabularyMultiDatasetBridge *)self _sortAppIntentVocabularyByCascadeItemType:v15];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v35;
            do
            {
              unint64_t v33 = v11;
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v35 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                v22 = [v16 objectForKey:v21];
                v23 = -[KMAppGlobalVocabularyBridge initWithOriginAppId:cascadeItemType:items:]([KMAppGlobalVocabularyBridge alloc], "initWithOriginAppId:cascadeItemType:items:", v13, [v21 unsignedShortValue], v22);
                __int16 v24 = KMLogContextCore;
                if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v45 = "-[KMAppGlobalVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
                  __int16 v46 = 2112;
                  v47 = v13;
                  _os_log_impl(&dword_22475B000, v24, OS_LOG_TYPE_INFO, "%s Extracting app global terms for app: %@", buf, 0x16u);
                }
                v5[2](v5, v23);
              }
              unint64_t v11 = v33 + v18;
              uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v18);
          }

          self = v27;
          v14 = v31;
          uint64_t i = v32;
          long long v15 = v30;
        }
      }
      uint64_t v29 = [(NSSet *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v29);
  }

  *a3 = v11;
}

- (KMAppGlobalVocabularyMultiDatasetBridge)initWithModifiedOriginAppIds:(id)a3 languageCode:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KMAppGlobalVocabularyMultiDatasetBridge;
  id v9 = [(KMAppGlobalVocabularyMultiDatasetBridge *)&v22 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v9->_modifiedAppIds, a3);
  p_languageCode = &v10->_languageCode;
  objc_storeStrong((id *)&v10->_languageCode, a4);
  modifiedAppIds = v10->_modifiedAppIds;
  if (!modifiedAppIds || !*p_languageCode)
  {
    uint64_t v17 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *p_languageCode;
      *(_DWORD *)buf = 136315650;
      __int16 v24 = "-[KMAppGlobalVocabularyMultiDatasetBridge initWithModifiedOriginAppIds:languageCode:]";
      __int16 v25 = 2112;
      uint64_t v26 = modifiedAppIds;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_error_impl(&dword_22475B000, v17, OS_LOG_TYPE_ERROR, "%s Invalid {modified: %@ language: %@}", buf, 0x20u);
    }
    goto LABEL_12;
  }
  id v21 = 0;
  uint64_t v13 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v21];
  v14 = (NSSet *)v21;
  itemMapper = v10->_itemMapper;
  v10->_itemMapper = (KVItemMapper *)v13;

  if (!v10->_itemMapper)
  {
    uint64_t v19 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "-[KMAppGlobalVocabularyMultiDatasetBridge initWithModifiedOriginAppIds:languageCode:]";
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_error_impl(&dword_22475B000, v19, OS_LOG_TYPE_ERROR, "%s Cannot initialize item mapper with error: %@", buf, 0x16u);
    }

LABEL_12:
    id v16 = 0;
    goto LABEL_13;
  }

LABEL_6:
  id v16 = v10;
LABEL_13:

  return v16;
}

- (KMAppGlobalVocabularyMultiDatasetBridge)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

@end