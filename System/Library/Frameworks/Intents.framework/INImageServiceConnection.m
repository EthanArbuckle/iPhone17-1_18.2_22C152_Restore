@interface INImageServiceConnection
+ (id)sharedConnection;
- (BOOL)accessBundleContentForBundleIdentifiers:(id)a3 withBlock:(id)a4 error:(id *)a5;
- (BOOL)canLoadImageDataForImage:(id)a3;
- (BOOL)canStoreImage:(id)a3;
- (INImageServiceConnection)init;
- (NSString)serviceIdentifier;
- (id)_availableBundleIdentifiers;
- (id)_localStorageCache;
- (id)availableSchemasWithError:(id *)a3;
- (id)fetchShareExtensionIntentForExtensionContextUUID:(id)a3;
- (id)imageServiceSchemaURLsForBundleIdentifiers:(id)a3 error:(id *)a4;
- (id)loadDataImageFromImage:(id)a3 scaledSize:(id)a4 error:(id *)a5;
- (id)loadSchemasForBundleIdentifiers:(id)a3 error:(id *)a4;
- (id)schemaURLsForBundleIdentifiers:(id)a3;
- (id)securityScopedURLsForBundleIdentifiers:(id)a3 error:(id *)a4;
- (id)serviceProxyWithErrorHandler:(id)a3;
- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7;
- (id)synchronousServiceProxyWithErrorHandler:(id)a3;
- (unint64_t)servicePriority;
- (void)dealloc;
- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5;
- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6;
- (void)loadImageDataAndSizeForImage:(id)a3 reply:(id)a4;
- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation INImageServiceConnection

- (INImageServiceConnection)init
{
  v16.receiver = self;
  v16.super_class = (Class)INImageServiceConnection;
  v2 = [(INImageServiceConnection *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = [v3 initWithServiceName:INHelperServiceName];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    v6 = v2->_connection;
    v7 = INHelperServingXPCInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    LODWORD(v6) = [(NSXPCConnection *)v2->_connection processIdentifier];
    v8 = v2->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __32__INImageServiceConnection_init__block_invoke;
    v14[3] = &__block_descriptor_36_e5_v8__0l;
    int v15 = (int)v6;
    [(NSXPCConnection *)v8 setInterruptionHandler:v14];
    v9 = v2->_connection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__INImageServiceConnection_init__block_invoke_2;
    v12[3] = &__block_descriptor_36_e5_v8__0l;
    int v13 = (int)v6;
    [(NSXPCConnection *)v9 setInvalidationHandler:v12];
    [(NSXPCConnection *)v2->_connection resume];
    v10 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localStorageCache, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    v12 = "-[INImageServiceConnection storeUserContext:forBundleIdentifier:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s Storing UserContext:%@ for bundle:%@ over XPC in intents_helper", (uint8_t *)&v11, 0x20u);
  }
  v9 = [(INImageServiceConnection *)self serviceProxyWithErrorHandler:&__block_literal_global_78];
  v10 = v9;
  if (v9) {
    [v9 storeUserContext:v6 forBundleIdentifier:v7];
  }
}

void __65__INImageServiceConnection_storeUserContext_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[INImageServiceConnection storeUserContext:forBundleIdentifier:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_ERROR, "%s Error storing UserContext - %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[INImageServiceConnection purgeImageWithIdentifier:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s Purging image with identifier %@ over XPC in intents_helper", buf, 0x16u);
  }
  v9 = [(INImageServiceConnection *)self serviceProxyWithErrorHandler:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__INImageServiceConnection_purgeImageWithIdentifier_completion___block_invoke;
  v12[3] = &unk_1E551AE60;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 purgeImageWithIdentifier:v11 completion:v12];
}

uint64_t __64__INImageServiceConnection_purgeImageWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3 && *(void *)(a1 + 32))
  {
    int v4 = [*(id *)(a1 + 40) _localStorageCache];
    [v4 removeObjectForKey:*(void *)(a1 + 32)];

    id v3 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    id v7 = v3;
    uint64_t v5 = (*(uint64_t (**)(void))(v5 + 16))();
    id v3 = v7;
  }

  return MEMORY[0x1F41817F8](v5, v3);
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    uint64_t v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[INImageServiceConnection retrieveImageWithIdentifier:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s Retrieving image with identifier %@ over XPC in intents_helper", buf, 0x16u);
    }
    v9 = [(INImageServiceConnection *)self _localStorageCache];
    id v10 = [v9 objectForKey:v6];

    if (v10)
    {
      id v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = "-[INImageServiceConnection retrieveImageWithIdentifier:completion:]";
        __int16 v21 = 2112;
        id v22 = v10;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Found image %@ in the local cache with identifier %@, returning it", buf, 0x20u);
      }
      v7[2](v7, v10, 0);
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke;
      v17[3] = &unk_1E551AD18;
      v12 = v7;
      id v18 = v12;
      id v13 = [(INImageServiceConnection *)self serviceProxyWithErrorHandler:v17];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke_2;
      v14[3] = &unk_1E551BBB0;
      void v14[4] = self;
      id v15 = v6;
      id v16 = v12;
      [v13 retrieveImageWithIdentifier:v15 completion:v14];
    }
  }
}

uint64_t __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8 && !v5)
  {
    id v6 = [*(id *)(a1 + 32) _localStorageCache];
    [v6 setObject:v8 forKey:*(void *)(a1 + 40)];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  BOOL v8 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[INImageServiceConnection storeImage:scaled:qualityOfService:storeType:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Storing image %@ over XPC in intents_helper", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  v12 = [(INImageServiceConnection *)self _localStorageCache];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__68186;
  v60 = __Block_byref_object_dispose__68187;
  id v61 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__68186;
  v50 = __Block_byref_object_dispose__68187;
  id v51 = 0;
  id v13 = [v12 mapTableRepresentation];
  id v14 = [v13 keyEnumerator];
  id v15 = [v14 allObjects];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke;
  v41[3] = &unk_1E551AE10;
  v44 = buf;
  id v16 = v12;
  id v42 = v16;
  id v17 = v10;
  id v43 = v17;
  v45 = &v46;
  [v15 enumerateObjectsUsingBlock:v41];

  id v18 = (void *)v47[5];
  if (v18)
  {
    id v19 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v52 = 136315650;
      v53 = "-[INImageServiceConnection storeImage:scaled:qualityOfService:storeType:error:]";
      __int16 v54 = 2112;
      id v55 = v17;
      __int16 v56 = 2112;
      v57 = v18;
      _os_log_impl(&dword_18CB2F000, v19, OS_LOG_TYPE_INFO, "%s Found image %@ in the local cache with identifier %@, returning w/ optimistic success", v52, 0x20u);
      uint64_t v20 = (void *)v47[5];
    }
    else
    {
      uint64_t v20 = v18;
    }
    id v13 = v20;
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(buf, 8);

  if (!v18)
  {
LABEL_11:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v21 = [v10 imageURL];
      id v22 = v21;
      if (v21)
      {
        if ([v21 isFileURL])
        {
          __int16 v23 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v24 = [v22 path];
          int v25 = [v23 fileExistsAtPath:v24];

          if (v25)
          {
            id v26 = [v22 path];
            [v26 fileSystemRepresentation];
            v27 = (const char *)sandbox_extension_issue_file();

            if (v27)
            {
              v28 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v27 length:strlen(v27) + 1];
              [v10 _setSandboxExtensionData:v28];
            }
            else
            {
              v29 = (void *)INSiriLogContextIntents;
              if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
              {
                v33 = v29;
                v34 = [v22 path];
                v35 = __error();
                v36 = strerror(*v35);
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "-[INImageServiceConnection storeImage:scaled:qualityOfService:storeType:error:]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v34;
                *(_WORD *)&buf[22] = 2080;
                v59 = (uint64_t (*)(uint64_t, uint64_t))v36;
                _os_log_error_impl(&dword_18CB2F000, v33, OS_LOG_TYPE_ERROR, "%s Couldn't issue sandbox extension for '%@': %s", buf, 0x20u);
              }
            }
          }
        }
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__68186;
    v60 = __Block_byref_object_dispose__68187;
    id v61 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__68186;
    v50 = __Block_byref_object_dispose__68187;
    id v51 = 0;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_75;
    v40[3] = &unk_1E551ACA0;
    v40[4] = &v46;
    v30 = [(INImageServiceConnection *)self synchronousServiceProxyWithErrorHandler:v40];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_2;
    v39[3] = &unk_1E551AE38;
    v39[4] = buf;
    v39[5] = &v46;
    [v30 storeImage:v10 scaled:v8 qualityOfService:a5 storeType:a6 completion:v39];

    if (*(void *)(*(void *)&buf[8] + 40) && !v47[5])
    {
      v31 = [(INImageServiceConnection *)self _localStorageCache];
      [v31 setObject:v10 forKey:*(void *)(*(void *)&buf[8] + 40)];
    }
    if (a7) {
      *a7 = (id) v47[5];
    }
    id v13 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(buf, 8);
  }

  return v13;
}

void __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _identifier];
  id v11 = [*(id *)(a1 + 40) _identifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  *a4 = v12;
}

void __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_75(uint64_t a1, void *a2)
{
}

void __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)canStoreImage:(id)a3
{
  return a3 != 0;
}

- (id)fetchShareExtensionIntentForExtensionContextUUID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__68186;
  id v13 = __Block_byref_object_dispose__68187;
  id v14 = 0;
  id v5 = [(INImageServiceConnection *)self synchronousServiceProxyWithErrorHandler:&__block_literal_global_69];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__INImageServiceConnection_fetchShareExtensionIntentForExtensionContextUUID___block_invoke_70;
  v8[3] = &unk_1E551ADE8;
  v8[4] = &v9;
  [v5 fetchShareExtensionIntentForExtensionContextUUID:v4 completion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __77__INImageServiceConnection_fetchShareExtensionIntentForExtensionContextUUID___block_invoke_70(uint64_t a1, void *a2)
{
}

void __77__INImageServiceConnection_fetchShareExtensionIntentForExtensionContextUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[INImageServiceConnection fetchShareExtensionIntentForExtensionContextUUID:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_ERROR, "%s Error in XPC connection when fetching selected share extension suggestion intent, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)securityScopedURLsForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__68186;
    __int16 v23 = __Block_byref_object_dispose__68187;
    id v24 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__68186;
    id v17 = __Block_byref_object_dispose__68187;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke;
    v12[3] = &unk_1E551ACA0;
    void v12[4] = &v19;
    id v7 = [(INImageServiceConnection *)self synchronousServiceProxyWithErrorHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke_2;
    v11[3] = &unk_1E551AD40;
    v11[4] = &v13;
    v11[5] = &v19;
    [v7 loadBundleURLsForBundleIdentifiers:v6 completion:v11];

    uint64_t v8 = (void *)v14[5];
    if (v8)
    {
      uint64_t v9 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_67);
    }
    else
    {
      uint64_t v9 = 0;
      if (a4) {
        *a4 = (id) v20[5];
      }
    }
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

void __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke_3(int a1, id a2, void *a3, void *a4, void *a5)
{
  *a4 = a2;
  id result = [a3 url];
  *a5 = result;
  return result;
}

- (BOOL)accessBundleContentForBundleIdentifiers:(id)a3 withBlock:(id)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if ([v7 count])
  {
    uint64_t v9 = +[INBundleAccessManager sharedManager];
    id v10 = [v7 allObjects];
    id v11 = [v9 grantForBundleIdentifiers:v10 error:a5];

    BOOL v12 = v11 != 0;
    if (v11)
    {
      [v11 acquire];
      v8[2](v8);
      [v11 relinquish];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)loadSchemasForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 count])
  {
    id v11 = 0;
    goto LABEL_9;
  }
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 isReadableFileAtPath:@"/private/var/containers/Bundle/"];

  if (v8)
  {
    uint64_t v9 = [(INImageServiceConnection *)self schemaURLsForBundleIdentifiers:v6];
    id v10 = 0;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v13 = 0;
  uint64_t v9 = [(INImageServiceConnection *)self imageServiceSchemaURLsForBundleIdentifiers:v6 error:&v13];
  id v10 = v13;
  if (a4) {
LABEL_7:
  }
    *a4 = v10;
LABEL_8:
  id v11 = _INSchemasByIdentifierWithSchemaURLsByIdentifier(v9);

LABEL_9:

  return v11;
}

- (id)availableSchemasWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 isReadableFileAtPath:@"/private/var/containers/Bundle/"];

  if (!v6)
  {
    id v12 = 0;
    int v8 = [(INImageServiceConnection *)self imageServiceSchemaURLsForBundleIdentifiers:0 error:&v12];
    id v9 = v12;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v7 = [(INImageServiceConnection *)self _availableBundleIdentifiers];
  int v8 = [(INImageServiceConnection *)self schemaURLsForBundleIdentifiers:v7];

  id v9 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v9;
LABEL_6:
  id v10 = _INSchemasByIdentifierWithSchemaURLsByIdentifier(v8);

  return v10;
}

- (id)imageServiceSchemaURLsForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__68186;
  __int16 v23 = __Block_byref_object_dispose__68187;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke;
  v18[3] = &unk_1E551ACA0;
  v18[4] = &v19;
  id v7 = [(INImageServiceConnection *)self synchronousServiceProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__68186;
  id v16 = __Block_byref_object_dispose__68187;
  id v17 = 0;
  if ([v6 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_3;
    v10[3] = &unk_1E551AD40;
    v10[4] = &v12;
    v10[5] = &v19;
    [v7 loadSchemaURLsForBundleIdentifiers:v6 completion:v10];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_2;
    v11[3] = &unk_1E551AD40;
    v11[4] = &v12;
    v11[5] = &v19;
    [v7 loadSchemaURLsWithCompletion:v11];
  }
  if (a4) {
    *a4 = (id) v20[5];
  }
  int v8 = objc_msgSend((id)v13[5], "if_compactMap:", &__block_literal_global_58);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v19, 8);

  return v8;
}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_4(int a1, id a2, void *a3, void *a4, void *a5)
{
  id v8 = a2;
  *a4 = v8;
  uint64_t v9 = (void *)MEMORY[0x1E4F4B7E0];
  id v10 = a3;
  id v11 = [v9 applicationWithBundleIdentifier:v8];
  LODWORD(v9) = [v11 isHidden];

  if (v9) {
    *a4 = 0;
  }
  uint64_t v12 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_62);

  id v13 = v12;
  *a5 = v13;
}

uint64_t __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 url];
}

- (id)schemaURLsForBundleIdentifiers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v16 = v3;
    id v17 = (id)objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v9 = (void *)MEMORY[0x192F98250]();
          id v10 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
          if (([v10 appProtectionHidden] & 1) == 0)
          {
            id v11 = (void *)MEMORY[0x1E4F1CAD0];
            if (v10)
            {
              uint64_t v12 = [v10 intentDefinitionURLs];
              id v13 = [v12 allValues];
              uint64_t v14 = [v11 setWithArray:v13];
            }
            else
            {
              uint64_t v12 = [_INVCIntentDefinitionManagerClass() intentDefinitionURLsForBundleID:v8];
              uint64_t v14 = [v11 setWithArray:v12];
            }

            if ([v14 count]) {
              [v17 setObject:v14 forKey:v8];
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }

    id v3 = v16;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_availableBundleIdentifiers
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x192F98250]();
        id v10 = [v8 bundleIdentifier];
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F22448]) initWithIdentifier:@"com.apple.intents-service" error:0];
  id v11 = objc_msgSend(MEMORY[0x1E4F223A0], "enumeratorWithExtensionPointRecord:options:");
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        id v17 = (void *)MEMORY[0x192F98250]();
        id v18 = [v16 containingBundleRecord];
        long long v19 = [v18 bundleIdentifier];
        char v20 = [v2 containsObject:v19];

        if ((v20 & 1) == 0)
        {
          long long v21 = [v16 bundleIdentifier];
          [v2 addObject:v21];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }

  long long v22 = [_INVCIntentDefinitionManagerClass() allBundleIdentifiers];
  if (v22) {
    [v2 addObjectsFromArray:v22];
  }

  return v2;
}

- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (INPortableImageLoader *)a4;
  id v10 = a5;
  if (v10)
  {
    if (!v9) {
      uint64_t v9 = objc_alloc_init(INPortableImageLoader);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__INImageServiceConnection_filePathForImage_usingPortableImageLoader_completion___block_invoke;
    v13[3] = &unk_1E551AD18;
    id v11 = v10;
    id v14 = v11;
    uint64_t v12 = [(INImageServiceConnection *)self serviceProxyWithErrorHandler:v13];
    [v12 filePathForImage:v8 usingPortableImageLoader:v9 completion:v11];
  }
}

uint64_t __81__INImageServiceConnection_filePathForImage_usingPortableImageLoader_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v11 = a3;
  uint64_t v12 = (INPortableImageLoader *)a4;
  id v13 = a6;
  if (v13)
  {
    if (!v12) {
      uint64_t v12 = objc_alloc_init(INPortableImageLoader);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __98__INImageServiceConnection_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke;
    v16[3] = &unk_1E551AD18;
    id v14 = v13;
    id v17 = v14;
    uint64_t v15 = [(INImageServiceConnection *)self serviceProxyWithErrorHandler:v16];
    [v15 loadDataImageForImage:v11 scaledWidth:v12 scaledHeight:v14 usingPortableImageLoader:var0 completion:var1];
  }
}

uint64_t __98__INImageServiceConnection_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canLoadImageDataForImage:(id)a3
{
  return a3 != 0;
}

- (unint64_t)servicePriority
{
  if (INThisProcessIsSiri_onceToken != -1) {
    dispatch_once(&INThisProcessIsSiri_onceToken, &__block_literal_global_40);
  }
  if (INThisProcessIsSiri_isSiri) {
    return 25;
  }
  if (INThisProcessIsCarousel_onceToken != -1) {
    dispatch_once(&INThisProcessIsCarousel_onceToken, &__block_literal_global_43);
  }
  if (INThisProcessIsCarousel_isCarousel) {
    return 25;
  }
  else {
    return 75;
  }
}

- (NSString)serviceIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__INImageServiceConnection_serviceIdentifier__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  if (serviceIdentifier_onceToken != -1) {
    dispatch_once(&serviceIdentifier_onceToken, block);
  }
  return (NSString *)(id)serviceIdentifier_sServiceIdentifier;
}

void __45__INImageServiceConnection_serviceIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSString;
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:v0];
  id v2 = [v6 bundleIdentifier];
  id v3 = NSStringFromClass(v0);
  uint64_t v4 = [v1 stringWithFormat:@"%@.%@", v2, v3];
  uint64_t v5 = (void *)serviceIdentifier_sServiceIdentifier;
  serviceIdentifier_sServiceIdentifier = v4;
}

- (id)_localStorageCache
{
  localStorageCache = self->_localStorageCache;
  if (!localStorageCache)
  {
    uint64_t v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v5 = self->_localStorageCache;
    self->_localStorageCache = v4;

    localStorageCache = self->_localStorageCache;
  }

  return localStorageCache;
}

- (id)serviceProxyWithErrorHandler:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_connection;
  pid_t v6 = [(NSXPCConnection *)self->_connection processIdentifier];
  uint64_t v7 = [(NSXPCConnection *)v5 serviceName];
  connection = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__INImageServiceConnection_serviceProxyWithErrorHandler___block_invoke;
  v18[3] = &unk_1E551ACF0;
  uint64_t v9 = v5;
  long long v19 = v9;
  pid_t v21 = v6;
  id v10 = v4;
  id v20 = v10;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
  if ([v11 conformsToProtocol:&unk_1EDC315C8])
  {
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
    if (v10 && v11)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28228];
      id v14 = [NSString stringWithFormat:@"Unable to get a valid service proxy for service %@", v7];
      v23[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v16 = [v13 errorWithDomain:@"IntentsErrorDomain" code:6000 userInfo:v15];
      (*((void (**)(id, void *))v10 + 2))(v10, v16);

      id v12 = 0;
    }
  }

  return v12;
}

void __57__INImageServiceConnection_serviceProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(_DWORD *)(a1 + 48);
    int v8 = 136315906;
    uint64_t v9 = "-[INImageServiceConnection serviceProxyWithErrorHandler:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_error_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_ERROR, "%s Error (from connection %@; pid: %d) when using image service: %@",
      (uint8_t *)&v8,
      0x26u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)synchronousServiceProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_connection;
  pid_t v6 = [(NSXPCConnection *)self->_connection processIdentifier];
  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__INImageServiceConnection_synchronousServiceProxyWithErrorHandler___block_invoke;
  v12[3] = &unk_1E551ACF0;
  pid_t v15 = v6;
  int v13 = v5;
  id v14 = v4;
  id v8 = v4;
  uint64_t v9 = v5;
  __int16 v10 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];

  return v10;
}

void __68__INImageServiceConnection_synchronousServiceProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(_DWORD *)(a1 + 48);
    int v7 = 136315906;
    id v8 = "-[INImageServiceConnection synchronousServiceProxyWithErrorHandler:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_error_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_ERROR, "%s Error (from connection %@; pid: %d) when using image service: %@",
      (uint8_t *)&v7,
      0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)loadDataImageFromImage:(id)a3 scaledSize:(id)a4 error:(id *)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = NSNumber;
    int v12 = v10;
    __int16 v13 = [v11 numberWithDouble:var0];
    id v14 = [NSNumber numberWithDouble:var1];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[INImageServiceConnection loadDataImageFromImage:scaledSize:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    long long v28 = v13;
    LOWORD(v29) = 2112;
    *(void *)((char *)&v29 + 2) = v14;
    _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s Loading image %@ over XPC in intents_helper (scaledWidth = %@, scaledHeight = %@)", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v28 = __Block_byref_object_copy__68186;
  *(void *)&long long v29 = __Block_byref_object_dispose__68187;
  *((void *)&v29 + 1) = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__68186;
  long long v25 = __Block_byref_object_dispose__68187;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke;
  v20[3] = &unk_1E551ACA0;
  v20[4] = &v21;
  uint64_t v15 = [(INImageServiceConnection *)self synchronousServiceProxyWithErrorHandler:v20];
  uint64_t v16 = objc_alloc_init(INPortableImageLoader);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke_2;
  v19[3] = &unk_1E551ACC8;
  v19[4] = buf;
  v19[5] = &v21;
  [v15 loadDataImageForImage:v9 scaledWidth:v16 scaledHeight:v19 usingPortableImageLoader:var0 completion:var1];

  if (a5) {
    *a5 = (id) v22[5];
  }
  id v17 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(buf, 8);

  return v17;
}

void __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke(uint64_t a1, void *a2)
{
}

void __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)loadImageDataAndSizeForImage:(id)a3 reply:(id)a4
{
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)INImageServiceConnection;
  [(INImageServiceConnection *)&v3 dealloc];
}

void __32__INImageServiceConnection_init__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    int v4 = 136315650;
    id v5 = "-[INImageServiceConnection init]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = INHelperServiceName;
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_error_impl(&dword_18CB2F000, v2, OS_LOG_TYPE_ERROR, "%s INImageServiceConnection to %@ interrupted; pid: %d",
      (uint8_t *)&v4,
      0x1Cu);
  }
}

void __32__INImageServiceConnection_init__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    int v4 = 136315650;
    id v5 = "-[INImageServiceConnection init]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = INHelperServiceName;
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_18CB2F000, v2, OS_LOG_TYPE_INFO, "%s INImageServiceConnection to %@ invalidated; pid: %d",
      (uint8_t *)&v4,
      0x1Cu);
  }
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_68261);
  }
  id v2 = (void *)sharedConnection_sImageServiceConnection;

  return v2;
}

uint64_t __44__INImageServiceConnection_sharedConnection__block_invoke()
{
  v0 = objc_alloc_init(INImageServiceConnection);
  uint64_t v1 = sharedConnection_sImageServiceConnection;
  sharedConnection_sImageServiceConnection = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end