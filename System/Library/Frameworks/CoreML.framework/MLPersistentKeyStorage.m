@interface MLPersistentKeyStorage
+ (BOOL)storeKeyBlob:(id)a3 forKeyIdentifier:(id)a4 error:(id *)a5;
+ (id)persistentKeyStorageURL;
+ (id)retrieveKeyBlobForKeyIdentifier:(id)a3;
+ (id)syncQueue;
@end

@implementation MLPersistentKeyStorage

+ (id)retrieveKeyBlobForKeyIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__7132;
    v19 = __Block_byref_object_dispose__7133;
    id v20 = 0;
    v5 = [a1 persistentKeyStorageURL];
    v6 = [NSString stringWithFormat:@"%@.bin", v4];
    v7 = [v5 URLByAppendingPathComponent:v6];

    v8 = [a1 syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MLPersistentKeyStorage_retrieveKeyBlobForKeyIdentifier___block_invoke;
    block[3] = &unk_1E59A5300;
    id v13 = v7;
    v14 = &v15;
    id v9 = v7;
    dispatch_sync(v8, block);

    id v10 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __58__MLPersistentKeyStorage_retrieveKeyBlobForKeyIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (BOOL)storeKeyBlob:(id)a3 forKeyIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    if (a5)
    {
      *a5 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0 format:@"keyBlob is nil"];
    }
    v18 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    *(_WORD *)v27 = 0;
    v19 = "Key blob is nil";
    goto LABEL_18;
  }
  if (!v9)
  {
    if (a5)
    {
      *a5 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0 format:@"keyIdentifier is nil"];
    }
    v18 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    *(_WORD *)v27 = 0;
    v19 = "Key Identifier is nil";
LABEL_18:
    _os_log_impl(&dword_19E58B000, v18, OS_LOG_TYPE_INFO, v19, v27, 2u);
LABEL_19:

    BOOL v16 = 0;
    goto LABEL_20;
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  *(void *)v27 = 0;
  v28 = v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__7132;
  v31 = __Block_byref_object_dispose__7133;
  id v32 = 0;
  v11 = [a1 persistentKeyStorageURL];
  v12 = [NSString stringWithFormat:@"%@.bin", v10];
  id v13 = [v11 URLByAppendingPathComponent:v12];

  v14 = [a1 syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MLPersistentKeyStorage_storeKeyBlob_forKeyIdentifier_error___block_invoke;
  block[3] = &unk_1E59A4EF0;
  v25 = &v33;
  id v23 = v8;
  id v15 = v13;
  id v24 = v15;
  v26 = v27;
  dispatch_sync(v14, block);

  BOOL v16 = *((unsigned char *)v34 + 24) != 0;
  if (!*((unsigned char *)v34 + 24))
  {
    if (a5)
    {
      *a5 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:*((void *)v28 + 5) format:@"Failed to persist Key Blob"];
    }
    uint64_t v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E58B000, v17, OS_LOG_TYPE_INFO, "Failed to persist Key Blob", buf, 2u);
    }
  }
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(&v33, 8);
LABEL_20:

  return v16;
}

void __62__MLPersistentKeyStorage_storeKeyBlob_forKeyIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 writeToURL:v3 options:1 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    v6 = (void *)a1[5];
    uint64_t v7 = *MEMORY[0x1E4F1C630];
    uint64_t v8 = *(void *)(a1[7] + 8);
    id v10 = *(id *)(v8 + 40);
    char v9 = [v6 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v7 error:&v10];
    objc_storeStrong((id *)(v8 + 40), v10);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
  }
}

+ (id)syncQueue
{
  if (+[MLPersistentKeyStorage syncQueue]::onceTokenForSyncQueue != -1) {
    dispatch_once(&+[MLPersistentKeyStorage syncQueue]::onceTokenForSyncQueue, &__block_literal_global_57);
  }
  uint64_t v2 = (void *)+[MLPersistentKeyStorage syncQueue]::_syncQueue;

  return v2;
}

void __35__MLPersistentKeyStorage_syncQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.coreml.PersistentKeyStore", 0);
  v1 = (void *)+[MLPersistentKeyStorage syncQueue]::_syncQueue;
  +[MLPersistentKeyStorage syncQueue]::_syncQueue = (uint64_t)v0;
}

+ (id)persistentKeyStorageURL
{
  if (+[MLPersistentKeyStorage persistentKeyStorageURL]::onceTokenForPersistentKeyStorageURL != -1) {
    dispatch_once(&+[MLPersistentKeyStorage persistentKeyStorageURL]::onceTokenForPersistentKeyStorageURL, &__block_literal_global_7153);
  }
  uint64_t v2 = (void *)+[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL;

  return v2;
}

void __49__MLPersistentKeyStorage_persistentKeyStorageURL__block_invoke()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [v0 URLsForDirectory:5 inDomains:1];
  id v6 = [v1 lastObject];

  uint64_t v2 = [v6 URLByAppendingPathComponent:@"com.apple.coreml"];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"PersistentKeyStorage_v2"];
  uint64_t v4 = (void *)+[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL;
  +[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL = v3;

  char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 createDirectoryAtURL:+[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL withIntermediateDirectories:1 attributes:0 error:0];
}

@end