@interface MLKeyManager
+ (BOOL)isModelEncrypted:(id)a3;
+ (id)createPersistentKeyBlobForKeyID:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 error:(id *)a5;
+ (id)decryptSessionForModelAtURL:(id)a3 error:(id *)a4;
+ (id)extractKeyIdentifierFromModelAtURL:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL *)a4 error:(id *)a5;
+ (id)loadDecryptionKeyForModelAtURL:(id)a3 retUsesCodeSigningIdentityForEncryption:(BOOL *)a4 error:(id *)a5;
+ (id)syncQueue;
@end

@implementation MLKeyManager

+ (BOOL)isModelEncrypted:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 URLByAppendingPathComponent:@"encryptionInfo"];
  v6 = [v5 path];
  char v7 = [v4 fileExistsAtPath:v6];

  return v7;
}

+ (id)decryptSessionForModelAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v11 = 0;
  v6 = +[MLKeyManager loadDecryptionKeyForModelAtURL:v5 retUsesCodeSigningIdentityForEncryption:&v11 error:a4];
  if (v6)
  {
    char v7 = [v5 filePathURL];
    v8 = [v7 path];
    v9 = +[MLFairPlayDecryptSession decryptSessionForModelAtPath:v8 usesCodeSigningIdentityForEncryption:v11 keyBlob:v6 error:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)loadDecryptionKeyForModelAtURL:(id)a3 retUsesCodeSigningIdentityForEncryption:(BOOL *)a4 error:(id *)a5
{
  BOOL v11 = 0;
  char v7 = objc_msgSend(a1, "extractKeyIdentifierFromModelAtURL:usesCodeSigningIdentityForEncryption:error:", a3, &v11);
  if (v7)
  {
    if (a4) {
      *a4 = v11;
    }
    v8 = +[MLPersistentKeyStorage retrieveKeyBlobForKeyIdentifier:v7];
    if (v8
      || (+[MLKeyManager createPersistentKeyBlobForKeyID:usesCodeSigningIdentityForEncryption:error:](MLKeyManager, "createPersistentKeyBlobForKeyID:usesCodeSigningIdentityForEncryption:error:", v7, v11, a5), (v8 = objc_claimAutoreleasedReturnValue()) != 0)&& +[MLPersistentKeyStorage storeKeyBlob:v8 forKeyIdentifier:v7 error:a5])
    {
      id v9 = v8;
      v8 = v9;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)createPersistentKeyBlobForKeyID:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__19653;
  v22 = __Block_byref_object_dispose__19654;
  id v23 = 0;
  id v9 = [a1 syncQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke;
  v13[3] = &unk_1E59A4E68;
  v15 = &v18;
  v16 = a5;
  BOOL v17 = a4;
  id v14 = v8;
  id v10 = v8;
  dispatch_sync(v9, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CoreMLModelSecurityService"];
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF14E7D0];
  [v2 setRemoteObjectInterface:v3];

  [v2 setInterruptionHandler:&__block_literal_global_93];
  [v2 setInvalidationHandler:&__block_literal_global_97];
  [v2 resume];
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__19653;
  uint64_t v20 = __Block_byref_object_dispose__19654;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_98;
  v15[3] = &unk_1E59A5008;
  v15[4] = &v16;
  v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v5 = (void *)v17[5];
  if (v5)
  {
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v5;
    }
    v6 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    uint64_t v7 = v17[5];
    *(_DWORD *)buf = 138412546;
    id v23 = @"com.apple.CoreMLModelSecurityService";
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    id v8 = "Could not create connection to %@ : error=%@";
LABEL_13:
    _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_100;
  v14[3] = &unk_1E59A4E40;
  uint64_t v10 = *(void *)(a1 + 32);
  v14[4] = *(void *)(a1 + 40);
  v14[5] = &v16;
  [v4 createPersistentKeyBlobForKeyID:v10 usesCodeSigningIdentityForEncryption:v9 completionBlock:v14];
  id v11 = (void *)v17[5];
  if (v11)
  {
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v11;
    }
    v6 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v12 = *(__CFString **)(a1 + 32);
    uint64_t v13 = v17[5];
    *(_DWORD *)buf = 138412546;
    id v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    id v8 = "Could not create persistent key blob for %@ : error=%@";
    goto LABEL_13;
  }
LABEL_11:
  [v2 invalidate];

  _Block_object_dispose(&v16, 8);
}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_98(uint64_t a1, void *a2)
{
}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_100(uint64_t a1, void *a2, void *a3)
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

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_95()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered invalidationHandler!", v1, 2u);
  }
}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_2()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered interruptionHandler!", v1, 2u);
  }
}

+ (id)syncQueue
{
  if (+[MLKeyManager syncQueue]::onceToken != -1) {
    dispatch_once(&+[MLKeyManager syncQueue]::onceToken, &__block_literal_global_19668);
  }
  v2 = (void *)+[MLKeyManager syncQueue]::_syncQueue;

  return v2;
}

void __25__MLKeyManager_syncQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.coreml.KeyManager", 0);
  v1 = (void *)+[MLKeyManager syncQueue]::_syncQueue;
  +[MLKeyManager syncQueue]::_syncQueue = (uint64_t)v0;
}

+ (id)extractKeyIdentifierFromModelAtURL:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL *)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = [v6 URLByAppendingPathComponent:@"encryptionInfo"];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v7 fileSystemRepresentation]);
  IArchive::IArchive(&v15, (uint64_t)&__p, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  operator>>((uint64_t)&v15, &__p);
  (*(void (**)(void))(**(void **)(v15 + 32) + 16))(*(void *)(v15 + 32));
  if (std::istream::peek() != -1)
  {
    (*(void (**)(void))(**(void **)(v15 + 32) + 16))(*(void *)(v15 + 32));
    id v8 = (void *)std::istream::read();
    if ((*((unsigned char *)v8 + *(void *)(*v8 - 24) + 32) & 5) != 0)
    {
      exception = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
      uint64_t v13 = std::iostream_category();
      *(void *)&__ec.__val_ = 1;
      __ec.__cat_ = v13;
      std::ios_base::failure::failure(exception, "Error reading from archive.", &__ec);
      __cxa_throw(exception, MEMORY[0x1E4FBA300], MEMORY[0x1E4FBA298]);
    }
  }
  *a4 = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v10 = [NSString stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v17);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }

  return v10;
}

@end