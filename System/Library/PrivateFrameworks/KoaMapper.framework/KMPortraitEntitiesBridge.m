@interface KMPortraitEntitiesBridge
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMPortraitEntitiesBridge)init;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation KMPortraitEntitiesBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F5D4B0]);
  [v6 setLimit:500];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__435;
  v32[4] = __Block_byref_object_dispose__436;
  id v33 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__435;
  v26 = __Block_byref_object_dispose__436;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  v7 = objc_opt_new();
  v9 = (id *)(v23 + 5);
  v8 = (void *)v23[5];
  v18 = &v28;
  id obj = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__KMPortraitEntitiesBridge_enumerateItemsWithError_usingBlock___block_invoke;
  v13[3] = &unk_2646DBA10;
  v15 = v32;
  v16 = v20;
  v13[4] = self;
  v17 = &v22;
  id v10 = v5;
  id v14 = v10;
  [v7 iterRankedNamedEntitiesWithQuery:v6 error:&obj block:v13];
  objc_storeStrong(v9, obj);

  int v11 = *((unsigned __int8 *)v29 + 24);
  if (*((unsigned char *)v29 + 24)) {
    KVSetError();
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);

  return v11 == 0;
}

void __63__KMPortraitEntitiesBridge_enumerateItemsWithError_usingBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x22A6168F0]();
  uint64_t v29 = *(void *)(a1[4] + 16);
  v7 = NSString;
  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(unsigned int *)(v8 + 24);
  *(_DWORD *)(v8 + 24) = v9 + 1;
  id v10 = objc_msgSend(v7, "stringWithFormat:", @"%ld", v9);
  v30[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v12 = *(void *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = *(void **)(a1[4] + 8);
  uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v16 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v16 + 40);
  v17 = [v14 mapObject:v5 additionalFields:v15 error:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);
  if ([v17 count] == 1)
  {
    uint64_t v18 = a1[5];
    v19 = [v17 firstObject];
    LOBYTE(v18) = (*(uint64_t (**)(uint64_t, void *))(v18 + 16))(v18, v19);

    if (v18) {
      goto LABEL_7;
    }
  }
  else
  {
    v20 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(*(void *)(a1[8] + 8) + 40);
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = "-[KMPortraitEntitiesBridge enumerateItemsWithError:usingBlock:]_block_invoke";
      __int16 v25 = 2112;
      v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      _os_log_error_impl(&dword_22475B000, v20, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
    }
  }
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  *a3 = 1;
LABEL_7:
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51088];
}

- (unsigned)cascadeItemType
{
  return *MEMORY[0x263F316D0];
}

- (KMPortraitEntitiesBridge)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)KMPortraitEntitiesBridge;
  v2 = [(KMPortraitEntitiesBridge *)&v12 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v11 = 0;
  uint64_t v3 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v11];
  id v4 = v11;
  itemMapper = v2->_itemMapper;
  v2->_itemMapper = (KVItemMapper *)v3;

  if (v2->_itemMapper)
  {
    uint64_t v6 = KVAdditionalFieldTypeToNumber();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v6;

LABEL_4:
    uint64_t v8 = v2;
    goto LABEL_8;
  }
  uint64_t v9 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[KMPortraitEntitiesBridge init]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_error_impl(&dword_22475B000, v9, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

@end