@interface KMContactStoreBridge
+ (id)_contactFetchKeys;
- (BOOL)_checkAuthorizationAndFetchMeCard;
- (BOOL)enumerateDeltaItemsWithError:(id *)a3 addOrUpdateBlock:(id)a4 removeBlock:(id)a5;
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)wasLastDonationAccepted;
- (KMContactStoreBridge)initWithContactStore:(id)a3 historyLog:(id)a4;
- (KMContactStoreBridge)initWithDirectory:(id)a3;
- (id)_fetchContactsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)lastDonationAcceptedDate;
- (id)originAppId;
- (id)validity;
- (unint64_t)version;
- (unsigned)cascadeItemType;
- (void)recordDonationAccepted;
- (void)recordDonationAttempt;
- (void)resetDeltaState;
@end

@implementation KMContactStoreBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapperAdditionalFields, 0);
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (BOOL)_checkAuthorizationAndFetchMeCard
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
  if (v3 == 3)
  {
    contactStore = self->_contactStore;
    v23[0] = *MEMORY[0x263EFDFE0];
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v16 = 0;
    v6 = [(CNContactStore *)contactStore _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:&v16];
    id v7 = v16;

    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      v11 = KVAdditionalFieldTypeToNumber();
      v17 = v11;
      v12 = [v6 identifier];
      v18 = v12;
      v13 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      mapperAdditionalFields = self->_mapperAdditionalFields;
      self->_mapperAdditionalFields = v13;
    }
    else
    {
      v9 = KMLogContextCore;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[KMContactStoreBridge _checkAuthorizationAndFetchMeCard]";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_error_impl(&dword_22475B000, v9, OS_LOG_TYPE_ERROR, "%s Encountered error when fetching meCard: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v10 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[KMContactStoreBridge _checkAuthorizationAndFetchMeCard]";
      _os_log_error_impl(&dword_22475B000, v10, OS_LOG_TYPE_ERROR, "%s Not Authorized to access contacts using CNContactStore.", buf, 0xCu);
    }
  }
  return v3 == 3;
}

- (BOOL)enumerateDeltaItemsWithError:(id *)a3 addOrUpdateBlock:(id)a4 removeBlock:(id)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  BOOL v8 = (uint64_t (**)(void, void *))a4;
  v9 = (uint64_t (**)(id, void *))a5;
  if (![(KMContactStoreBridge *)self _checkAuthorizationAndFetchMeCard])
  {
    BOOL v17 = 0;
    goto LABEL_66;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFE9F0]);
  [v10 setStartingToken:self->_historyToken];
  contactStore = self->_contactStore;
  id v65 = 0;
  v12 = [(CNContactStore *)contactStore enumeratorForChangeHistoryFetchRequest:v10 error:&v65];
  id v13 = v65;
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v14)
  {
    v15 = v13;
    id v16 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
      __int16 v68 = 2112;
      v69 = v15;
      _os_log_error_impl(&dword_22475B000, v16, OS_LOG_TYPE_ERROR, "%s Unable to fetch contact change history with error: %@", buf, 0x16u);
    }
    KVSetError();
    BOOL v17 = 0;
    goto LABEL_65;
  }
  id v51 = v10;
  v57 = self;
  v18 = objc_alloc_init(KMDeltaContactCollector);
  v58 = v12;
  v19 = [v12 value];
  uint64_t v20 = [v19 nextObject];

  id v56 = 0;
  do
  {
    __int16 v21 = 0;
    id v22 = (void *)v20;
    while (1)
    {
      v23 = (void *)MEMORY[0x22A6168F0]();
      [v22 acceptEventVisitor:v18];
      if ([(KMDeltaContactCollector *)v18 dropEverything] && v57->_historyToken)
      {
        v44 = KMLogContextCore;
        if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
          _os_log_impl(&dword_22475B000, v44, OS_LOG_TYPE_INFO, "%s Received drop everything change history event. Reset is required.", buf, 0xCu);
        }
        goto LABEL_58;
      }
      v24 = [(KMDeltaContactCollector *)v18 contactIdentifier];
      int v25 = [(KMDeltaContactCollector *)v18 deltaType];
      if ((v25 - 1) >= 2)
      {
        if (v25 != 3) {
          goto LABEL_26;
        }
        if (v24)
        {
          if (v9[2](v9, v24)) {
            goto LABEL_26;
          }

LABEL_58:
          BOOL v17 = 0;
LABEL_59:
          v12 = v58;
          id v10 = v51;
          goto LABEL_64;
        }
        v26 = KMLogContextCore;
        if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
      }
      else
      {
        if (!v24)
        {
          v26 = KMLogContextCore;
          if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
LABEL_36:
          *(_DWORD *)buf = 136315394;
          v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
          __int16 v68 = 2112;
          v69 = v22;
          _os_log_error_impl(&dword_22475B000, v26, OS_LOG_TYPE_ERROR, "%s Skipping change history event: %@ missing contact identifier.", buf, 0x16u);
          goto LABEL_26;
        }
        if (!v21) {
          __int16 v21 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:250];
        }
        [v21 addObject:v24];
      }
LABEL_26:
      [(KMDeltaContactCollector *)v18 reset];
      v27 = [v58 value];
      uint64_t v20 = [v27 nextObject];

      uint64_t v28 = [v21 count];
      BOOL v29 = v28 && v20 == 0;
      BOOL v30 = v29;
      if (v28 == 250 || v30) {
        break;
      }

      id v22 = (void *)v20;
      if (!v20) {
        goto LABEL_63;
      }
    }
    v50 = a3;
    id v64 = v56;
    v31 = [(KMContactStoreBridge *)v57 _fetchContactsWithIdentifiers:v21 error:&v64];
    id v32 = v64;

    if (!v31)
    {

      id v45 = v32;
      goto LABEL_62;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v31;
    uint64_t v54 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v54)
    {
      v49 = v9;
      v55 = v8;
      uint64_t v53 = *(void *)v61;
      v33 = v32;
      while (2)
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v61 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          v36 = (void *)MEMORY[0x22A6168F0]();
          itemMapper = v57->_itemMapper;
          mapperAdditionalFields = v57->_mapperAdditionalFields;
          id v59 = v33;
          v39 = [(KVItemMapper *)itemMapper mapObject:v35 additionalFields:mapperAdditionalFields error:&v59];
          id v56 = v59;

          if ([v39 count] != 1)
          {
            v43 = KMLogContextCore;
            v9 = v49;
            if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
              __int16 v68 = 2112;
              v69 = v39;
              __int16 v70 = 2112;
              id v71 = v56;
              _os_log_error_impl(&dword_22475B000, v43, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
            }

            int v42 = 1;
            BOOL v8 = v55;
            goto LABEL_52;
          }
          v40 = [v39 firstObject];
          int v41 = v55[2](v55, v40);

          if (!v41)
          {

            BOOL v17 = 0;
            id v22 = (void *)v20;
            BOOL v8 = v55;
            v9 = v49;
            id v10 = v51;
            v12 = v58;
            goto LABEL_64;
          }
          v33 = v56;
        }
        v33 = v56;
        uint64_t v54 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
        if (v54) {
          continue;
        }
        break;
      }
      int v42 = 0;
      BOOL v8 = v55;
      v9 = v49;
    }
    else
    {
      int v42 = 0;
      id v56 = v32;
    }
LABEL_52:
    a3 = v50;
  }
  while (v20 && (v42 & 1) == 0);
  __int16 v21 = 0;
  id v45 = v56;
  if (v42)
  {
LABEL_62:
    id v56 = v45;
    KVSetError();
    BOOL v17 = 0;
    id v22 = (void *)v20;
    goto LABEL_59;
  }
LABEL_63:
  v12 = v58;
  id v10 = v51;
  uint64_t v46 = objc_msgSend(v58, "currentHistoryToken", v49);
  historyToken = v57->_historyToken;
  v57->_historyToken = (NSData *)v46;

  BOOL v17 = 1;
  id v22 = (void *)v20;
LABEL_64:

  v15 = v56;
LABEL_65:

LABEL_66:
  return v17;
}

- (id)_fetchContactsWithIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFE9F8] predicateForContactsWithIdentifiers:v5];
  contactStore = self->_contactStore;
  BOOL v8 = [(id)objc_opt_class() _contactFetchKeys];
  id v17 = 0;
  v9 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v6 keysToFetch:v8 error:&v17];
  id v10 = v17;

  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = (void *)KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = NSNumber;
      v15 = v12;
      id v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      *(_DWORD *)buf = 136315650;
      v19 = "-[KMContactStoreBridge _fetchContactsWithIdentifiers:error:]";
      __int16 v20 = 2112;
      __int16 v21 = v16;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_error_impl(&dword_22475B000, v15, OS_LOG_TYPE_ERROR, "%s Unable to fetch contacts from identifiers in batch (%@) error: %@", buf, 0x20u);
    }
    KVSetError();
  }

  return v9;
}

- (id)lastDonationAcceptedDate
{
  return [(KMProviderHistoryLog *)self->_log getDonationEndTime];
}

- (void)recordDonationAccepted
{
}

- (void)recordDonationAttempt
{
}

- (void)resetDeltaState
{
  self->_historyToken = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)wasLastDonationAccepted
{
  uint64_t v3 = [(KMProviderHistoryLog *)self->_log getDonationStartTime];
  v4 = [(KMProviderHistoryLog *)self->_log getDonationEndTime];
  BOOL v5 = [v4 compare:v3] == 1;

  return v5;
}

- (unint64_t)version
{
  return self->_version;
}

- (id)validity
{
  return &stru_26D798048;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5 = a4;
  if ([(KMContactStoreBridge *)self _checkAuthorizationAndFetchMeCard])
  {
    id v6 = objc_alloc(MEMORY[0x263EFEA18]);
    id v7 = [(id)objc_opt_class() _contactFetchKeys];
    BOOL v8 = (void *)[v6 initWithKeysToFetch:v7];

    uint64_t v20 = 0;
    __int16 v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__1420;
    v18[4] = __Block_byref_object_dispose__1421;
    id v19 = 0;
    contactStore = self->_contactStore;
    id v16 = &v20;
    id obj = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__KMContactStoreBridge_enumerateItemsWithError_usingBlock___block_invoke;
    v13[3] = &unk_2646DBAF0;
    v13[4] = self;
    v15 = v18;
    id v14 = v5;
    BOOL v10 = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v8 error:&obj usingBlock:v13];
    objc_storeStrong(&v19, obj);
    if (v10 && !*((unsigned char *)v21 + 24))
    {
      BOOL v11 = 1;
    }
    else
    {
      KVSetError();
      BOOL v11 = 0;
    }

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __59__KMContactStoreBridge_enumerateItemsWithError_usingBlock___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 16);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v8 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v8 + 40);
  v9 = [v6 mapObject:a2 additionalFields:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if ([v9 count] == 1)
  {
    uint64_t v10 = a1[5];
    BOOL v11 = [v9 firstObject];
    LOBYTE(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    v12 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 136315650;
      id v16 = "-[KMContactStoreBridge enumerateItemsWithError:usingBlock:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_error_impl(&dword_22475B000, v12, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
    }
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  *a3 = 1;
LABEL_7:
}

- (KMContactStoreBridge)initWithContactStore:(id)a3 historyLog:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KMContactStoreBridge;
  v9 = [(KMContactStoreBridge *)&v22 init];
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v9->_log, a4);
  if (!v10->_log)
  {
    __int16 v17 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = "-[KMContactStoreBridge initWithContactStore:historyLog:]";
      v18 = "%s nil history log.";
LABEL_11:
      _os_log_error_impl(&dword_22475B000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    }
LABEL_15:
    id v16 = 0;
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v10->_contactStore, a3);
  if (!v10->_contactStore)
  {
    __int16 v17 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = "-[KMContactStoreBridge initWithContactStore:historyLog:]";
      v18 = "%s nil contactStore.";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  id v21 = 0;
  uint64_t v11 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v21];
  id v12 = v21;
  itemMapper = v10->_itemMapper;
  v10->_itemMapper = (KVItemMapper *)v11;

  if (!v10->_itemMapper)
  {
    __int16 v19 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[KMContactStoreBridge initWithContactStore:historyLog:]";
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_error_impl(&dword_22475B000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  uint64_t v14 = [(KMProviderHistoryLog *)v10->_log getHistoryToken];
  historyToken = v10->_historyToken;
  v10->_historyToken = (NSData *)v14;

  v10->_version = [(KMProviderHistoryLog *)v10->_log getVersion] + 1;
LABEL_6:
  id v16 = v10;
LABEL_16:

  return v16;
}

- (KMContactStoreBridge)initWithDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [KMProviderHistoryLog alloc];
  id v6 = [(KMProviderHistoryLog *)v5 initWithDirectory:v4 originAppId:*MEMORY[0x263F51060]];

  id v7 = objc_alloc_init(MEMORY[0x263EFEA58]);
  id v8 = [(KMContactStoreBridge *)self initWithContactStore:v7 historyLog:v6];

  return v8;
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51060];
}

- (unsigned)cascadeItemType
{
  return 19668;
}

+ (id)_contactFetchKeys
{
  v14[21] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFDFC8];
  v14[0] = *MEMORY[0x263EFE040];
  v14[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFDFB8];
  v14[2] = *MEMORY[0x263EFE038];
  v14[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFE048];
  v14[4] = *MEMORY[0x263EFE0B8];
  v14[5] = v4;
  uint64_t v5 = *MEMORY[0x263EFE068];
  v14[6] = *MEMORY[0x263EFE050];
  v14[7] = v5;
  uint64_t v6 = *MEMORY[0x263EFE018];
  v14[8] = *MEMORY[0x263EFDF70];
  v14[9] = v6;
  uint64_t v7 = *MEMORY[0x263EFDF80];
  v14[10] = *MEMORY[0x263EFE070];
  v14[11] = v7;
  uint64_t v8 = *MEMORY[0x263EFE150];
  v14[12] = *MEMORY[0x263EFE0A0];
  v14[13] = v8;
  uint64_t v9 = *MEMORY[0x263EFE010];
  v14[14] = *MEMORY[0x263EFE110];
  v14[15] = v9;
  uint64_t v10 = *MEMORY[0x263EFE088];
  v14[16] = *MEMORY[0x263EFE0F8];
  v14[17] = v10;
  uint64_t v11 = *MEMORY[0x263EFE080];
  v14[18] = *MEMORY[0x263EFE090];
  v14[19] = v11;
  v14[20] = *MEMORY[0x263EFE098];
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:21];
  return v12;
}

@end