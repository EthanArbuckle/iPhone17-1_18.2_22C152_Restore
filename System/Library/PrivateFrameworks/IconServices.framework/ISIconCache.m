@interface ISIconCache
+ (id)defaultIconCache;
- (BOOL)findStoreUnitForIcon:(id)a3 descriptor:(id)a4 UUID:(id *)a5 validationToken:(id *)a6;
- (ISIconCache)initWithConfiguration:(id)a3;
- (ISIconCache)initWithURL:(id)a3 storeIndex:(id)a4 sandboxExtensionToken:(unint64_t)a5;
- (ISStore)store;
- (ISStoreIndex)storeIndex;
- (NSString)cachePath;
- (NSURL)cacheURL;
- (id)description;
- (id)storeUnitForUUID:(id)a3;
- (unint64_t)sandboxToken;
- (void)dealloc;
@end

@implementation ISIconCache

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(_DWORD *)(a1 + 72) != *(_DWORD *)(a2 + 40)
    || (double v5 = *(double *)(a1 + 48), v5 < *(double *)(a2 + 16))
    || v5 > *(double *)(a2 + 24))
  {
    v6 = _ISDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_6:

    return;
  }
  if (uuid_compare((const unsigned __int8 *)(a2 + 44), *(const unsigned __int8 **)(a1 + 56)))
  {
    v6 = _ISDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_3(v6, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_6;
  }
  if (uuid_compare((const unsigned __int8 *)a2, *(const unsigned __int8 **)(a1 + 64)))
  {
    v6 = _ISDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_2(v6, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_6;
  }
  uint64_t v29 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2 + 60];
  uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 8);
  v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  uint64_t v32 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 + 76 length:40];
  uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8);
  v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v32;

  *a3 = 1;
}

- (id)storeUnitForUUID:(id)a3
{
  id v4 = a3;
  double v5 = [(ISIconCache *)self store];
  v6 = [v5 unitForUUID:v4];

  return v6;
}

- (BOOL)findStoreUnitForIcon:(id)a3 descriptor:(id)a4 UUID:(id *)a5 validationToken:(id *)a6
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v48 = 0;
  v54[0] = 0;
  v54[1] = 0;
  uint64_t v12 = [v10 digest];
  objc_msgSend(v12, "_IF_getUUIDBytes:hash64:", v54, &v48);

  [v11 scale];
  double v14 = v13;
  [v11 size];
  uint64_t v16 = v15;
  uint64_t v17 = [v11 digest];
  v53[0] = 0;
  v53[1] = 0;
  [v17 getUUIDBytes:v53];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  id v41 = 0;
  uint64_t v18 = _ISDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v50 = (const char *)v10;
    __int16 v51 = 2112;
    id v52 = v11;
    _os_log_impl(&dword_1AE771000, v18, OS_LOG_TYPE_INFO, "STORE_LOOKUP: %@ - %@", buf, 0x16u);
  }

  if (v11)
  {
    uint64_t v19 = _ISPrepareISIconSignpostLog();
    BOOL v20 = os_signpost_enabled(v19);

    if (v20)
    {
      uint64_t v21 = [NSString stringWithUTF8String:"STORE_LOOKUP: %@ - %@"];
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", v21, v10, v11);
      [v10 _eventPrepareISIconSignpost:v11 message:v22];
    }
  }
  uint64_t v23 = [(ISIconCache *)self storeIndex];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke;
  v34[3] = &unk_1E5F094C8;
  unsigned int v35 = v14;
  v34[6] = v16;
  v34[7] = v53;
  v34[8] = v54;
  v34[4] = &v42;
  v34[5] = &v36;
  [v23 enumerateValuesForUUID:v54 bock:v34];

  uint64_t v24 = (void *)v43[5];
  if (v24 && v37[5])
  {
    *a5 = (id)[v24 copy];
    *a6 = (id)[(id)v37[5] copy];
    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = 0;
  }
  uint64_t v26 = _ISDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = "not-found";
    if (v25) {
      uint64_t v27 = "found";
    }
    *(_DWORD *)buf = 136315138;
    v50 = v27;
    _os_log_impl(&dword_1AE771000, v26, OS_LOG_TYPE_INFO, "STORE_LOOKUP_RESULT: %s", buf, 0xCu);
  }

  if (v11)
  {
    uint64_t v28 = _ISPrepareISIconSignpostLog();
    BOOL v29 = os_signpost_enabled(v28);

    if (v29)
    {
      uint64_t v30 = [NSString stringWithUTF8String:"STORE_LOOKUP_RESULT: %s"];
      v31 = "not-found";
      if (v25) {
        v31 = "found";
      }
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", v30, v31);
      [v10 _eventPrepareISIconSignpost:v11 message:v32];
    }
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v25;
}

- (ISStore)store
{
  return self->_store;
}

- (ISStoreIndex)storeIndex
{
  return self->_storeIndex;
}

- (NSURL)cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (ISIconCache)initWithConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [v4 sandboxExtension];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [v4 sandboxExtension];
    [v7 UTF8String];
    uint64_t v6 = sandbox_extension_consume();
  }
  uint64_t v8 = [v4 url];
  uint64_t v9 = [v8 URLByAppendingPathComponent:@"store.index" isDirectory:0];
  id v10 = [[ISStoreIndex alloc] initWithStoreFileURL:v9];
  id v11 = [(ISIconCache *)self initWithURL:v8 storeIndex:v10 sandboxExtensionToken:v6];

  return v11;
}

- (ISIconCache)initWithURL:(id)a3 storeIndex:(id)a4 sandboxExtensionToken:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ISIconCache;
  id v11 = [(ISIconCache *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_sandboxToken = a5;
    objc_storeStrong((id *)&v11->_cacheURL, a3);
    objc_storeStrong((id *)&v12->_storeIndex, a4);
    double v13 = [[ISStore alloc] initWithURL:v9];
    store = v12->_store;
    v12->_store = v13;
  }
  return v12;
}

+ (id)defaultIconCache
{
  if (+[ISIconCache defaultIconCache]::onceToken != -1) {
    dispatch_once(&+[ISIconCache defaultIconCache]::onceToken, &__block_literal_global_34);
  }
  v2 = (void *)+[ISIconCache defaultIconCache]::defaultIconCache;
  return v2;
}

void __31__ISIconCache_defaultIconCache__block_invoke()
{
  id v4 = objc_alloc_init(ISIconCacheConfiguration);
  v0 = +[ISDefaults sharedInstance];
  v1 = [v0 cacheURL];
  [(ISIconCacheConfiguration *)v4 setUrl:v1];

  v2 = [[ISIconCache alloc] initWithConfiguration:v4];
  v3 = (void *)+[ISIconCache defaultIconCache]::defaultIconCache;
  +[ISIconCache defaultIconCache]::defaultIconCache = (uint64_t)v2;
}

- (void)dealloc
{
  sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)ISIconCache;
  [(ISIconCache *)&v3 dealloc];
}

- (NSString)cachePath
{
  return [(NSURL *)self->_cacheURL path];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(ISIconCache *)self cachePath];
  [v3 appendFormat:@"Cache path: %@\n", v4];

  [v3 appendFormat:@"%@", self->_storeIndex];
  double v5 = [NSString stringWithString:v3];

  return v5;
}

- (unint64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeIndex, 0);
}

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end