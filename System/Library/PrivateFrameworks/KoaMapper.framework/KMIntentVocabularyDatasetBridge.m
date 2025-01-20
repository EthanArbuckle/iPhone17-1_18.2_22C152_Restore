@interface KMIntentVocabularyDatasetBridge
- (BOOL)_resolveCascadeItemType;
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMIntentVocabularyDatasetBridge)initWithAppId:(id)a3 intentSlot:(id)a4 storeManager:(id)a5 authorization:(id)a6 itemMapper:(id)a7;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation KMIntentVocabularyDatasetBridge

- (id)originAppId
{
  return self->_appId;
}

- (unsigned)cascadeItemType
{
  return self->_cascadeItemType;
}

- (KMIntentVocabularyDatasetBridge)initWithAppId:(id)a3 intentSlot:(id)a4 storeManager:(id)a5 authorization:(id)a6 itemMapper:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v32 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)KMIntentVocabularyDatasetBridge;
  v17 = [(KMIntentVocabularyDatasetBridge *)&v33 init];
  v18 = v17;
  if (!v17)
  {
LABEL_8:
    v24 = v18;
    goto LABEL_12;
  }
  id v31 = v13;
  objc_storeStrong((id *)&v17->_appId, a3);
  p_intentSlot = &v18->_intentSlot;
  objc_storeStrong((id *)&v18->_intentSlot, a4);
  p_storeManager = &v18->_storeManager;
  objc_storeStrong((id *)&v18->_storeManager, a5);
  p_authorization = &v18->_authorization;
  objc_storeStrong((id *)&v18->_authorization, a6);
  p_itemMapper = &v18->_itemMapper;
  objc_storeStrong((id *)&v18->_itemMapper, a7);
  appId = v18->_appId;
  if (appId && *p_intentSlot && *p_storeManager && *p_authorization && *p_itemMapper)
  {
    id v13 = v31;
    if (![(KMIntentVocabularyDatasetBridge *)v18 _resolveCascadeItemType])
    {
      v24 = 0;
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  v25 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    v27 = *p_intentSlot;
    v28 = *p_storeManager;
    v29 = *p_authorization;
    v30 = *p_itemMapper;
    *(_DWORD *)buf = 136316418;
    v35 = "-[KMIntentVocabularyDatasetBridge initWithAppId:intentSlot:storeManager:authorization:itemMapper:]";
    __int16 v36 = 2112;
    v37 = appId;
    __int16 v38 = 2112;
    v39 = v27;
    __int16 v40 = 2112;
    v41 = v28;
    __int16 v42 = 2112;
    v43 = v29;
    __int16 v44 = 2112;
    v45 = v30;
    _os_log_error_impl(&dword_22475B000, v25, OS_LOG_TYPE_ERROR, "%s Cannot initialize with appId: %@ intentSlot: %@ storeManager: %@ authorization: %@ itemMapper: %@", buf, 0x3Eu);
  }
  v24 = 0;
  id v13 = v31;
LABEL_12:

  return v24;
}

- (BOOL)_resolveCascadeItemType
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  switch(+[KMMapper_INVocabularyItem fieldTypeForIntentSlotName:self->_intentSlot])
  {
    case 0:
      v3 = KMLogContextCore;
      BOOL v4 = os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO);
      if (v4)
      {
        appId = self->_appId;
        intentSlot = self->_intentSlot;
        int v14 = 136315650;
        id v15 = "-[KMIntentVocabularyDatasetBridge _resolveCascadeItemType]";
        __int16 v16 = 2112;
        v17 = intentSlot;
        __int16 v18 = 2112;
        v19 = appId;
        _os_log_impl(&dword_22475B000, v3, OS_LOG_TYPE_INFO, "%s Skipping unrecognized intent slot: %@ while enumerating data set from app: %@", (uint8_t *)&v14, 0x20u);
        goto LABEL_4;
      }
      return v4;
    case 1:
      unsigned __int16 v12 = -4184;
      goto LABEL_24;
    case 2:
      unsigned __int16 v12 = -2167;
      goto LABEL_24;
    case 3:
      unsigned __int16 v12 = 13884;
      goto LABEL_24;
    case 4:
      unsigned __int16 v12 = -12054;
      goto LABEL_24;
    case 5:
      unsigned __int16 v12 = -20601;
      goto LABEL_24;
    case 6:
      unsigned __int16 v12 = 14816;
      goto LABEL_24;
    case 7:
      unsigned __int16 v12 = 800;
      goto LABEL_24;
    case 8:
      unsigned __int16 v12 = 16251;
      goto LABEL_24;
    case 9:
      unsigned __int16 v12 = 25883;
      goto LABEL_24;
    case 10:
      unsigned __int16 v12 = 26512;
      goto LABEL_24;
    case 11:
      unsigned __int16 v12 = 5595;
      goto LABEL_24;
    case 12:
      unsigned __int16 v12 = -32571;
      goto LABEL_24;
    case 13:
      unsigned __int16 v12 = 7719;
      goto LABEL_24;
    case 14:
      unsigned __int16 v12 = 14706;
      goto LABEL_24;
    case 15:
      unsigned __int16 v12 = -27285;
      goto LABEL_24;
    case 16:
      unsigned __int16 v12 = 15572;
      goto LABEL_24;
    case 17:
      unsigned __int16 v12 = 30598;
LABEL_24:
      self->_cascadeItemType = v12;
      LOBYTE(v4) = 1;
      break;
    default:
      v7 = (void *)KMLogContextCore;
      BOOL v4 = os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        v9 = self->_appId;
        v8 = self->_intentSlot;
        v10 = v7;
        v11 = KVFieldTypeDescription();
        int v14 = 136315906;
        id v15 = "-[KMIntentVocabularyDatasetBridge _resolveCascadeItemType]";
        __int16 v16 = 2112;
        v17 = v8;
        __int16 v18 = 2112;
        v19 = v9;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_error_impl(&dword_22475B000, v10, OS_LOG_TYPE_ERROR, "%s Skipping intent slot: %@ from app: %@ mapped to fieldType: %@ not supported by Cascade", (uint8_t *)&v14, 0x2Au);

LABEL_4:
        LOBYTE(v4) = 0;
      }
      break;
  }
  return v4;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  v5 = (uint64_t (**)(id, void *))a4;
  if ([(KMIntentVocabularyAuthorization *)self->_authorization isAuthorizedApp:self->_appId])
  {
    v6 = KVAdditionalFieldTypeToNumber();
    intentSlot = self->_intentSlot;
    v37 = v6;
    v38[0] = intentSlot;
    BOOL v8 = 1;
    v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(KMIntentVocabularyStoreManager *)self->_storeManager storedVocabularyForApp:self->_appId intentSlot:self->_intentSlot];
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        uint64_t v13 = 0;
        int v14 = v11;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
          __int16 v16 = (void *)MEMORY[0x22A6168F0]();
          itemMapper = self->_itemMapper;
          id v25 = v14;
          __int16 v18 = [(KVItemMapper *)itemMapper mapObject:v15 additionalFields:v24 error:&v25];
          id v11 = v25;

          if ([v18 count] != 1)
          {
            v21 = KMLogContextCore;
            if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              id v31 = "-[KMIntentVocabularyDatasetBridge enumerateItemsWithError:usingBlock:]";
              __int16 v32 = 2112;
              objc_super v33 = v18;
              __int16 v34 = 2112;
              id v35 = v11;
              _os_log_error_impl(&dword_22475B000, v21, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
            }
            KVSetError();

LABEL_16:
            BOOL v8 = 0;
            goto LABEL_17;
          }
          v19 = [v18 firstObject];
          int v20 = v5[2](v5, v19);

          if (!v20) {
            goto LABEL_16;
          }
          ++v13;
          int v14 = v11;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      BOOL v8 = 1;
LABEL_17:
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_storeManager, 0);
  objc_storeStrong((id *)&self->_intentSlot, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end