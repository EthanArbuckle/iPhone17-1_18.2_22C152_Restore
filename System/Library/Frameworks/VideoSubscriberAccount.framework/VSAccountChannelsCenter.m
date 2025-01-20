@interface VSAccountChannelsCenter
+ (id)_accountChannelsWithProviderID:(id)a3;
+ (id)_defaultDirectoryURL;
+ (id)_defaultFileName;
+ (id)sharedCenter;
+ (void)_startOperationAndWaitForCompletion:(id)a3;
- (NSString)fileName;
- (NSURL)directoryURL;
- (NSURL)fileURL;
- (NSUndoManager)undoManager;
- (OS_dispatch_queue)serialQueue;
- (VSAccountChannelsCenter)init;
- (VSAccountChannelsCenter)initWithAccountStore:(id)a3;
- (VSAccountStore)accountStore;
- (id)_removeLocallySavedAccountChannels;
- (id)_removeSavedAccountChannels;
- (id)_saveAccountChannels:(id)a3;
- (id)_savedAccountChannels;
- (id)_savedAccountChannelsForIdentityProviderID:(id)a3 storeIdentityProvider:(id)a4;
- (id)_storeIdentityProviderForAccount:(id)a3;
- (id)identityProviderFetchOperationBlock;
- (void)_enqueueRemoveSavedAccountChannelsAndWait;
- (void)_enqueueSaveAccountChannelsAndWait:(id)a3;
- (void)_removeLocallySavedAccountChannels;
- (void)_removeSavedAccountChannelsWithCompletionHandler:(id)a3;
- (void)_saveAccountChannels:(id)a3 withCompletionHandler:(id)a4;
- (void)_snapshotPreviousChannels;
- (void)fetchAccountChannelsWithCompletionHandler:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setDirectoryURL:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setIdentityProviderFetchOperationBlock:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setUndoManager:(id)a3;
@end

@implementation VSAccountChannelsCenter

- (VSAccountChannelsCenter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSAccountChannelsCenter)initWithAccountStore:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accountStore parameter must not be nil."];
  }
  v11.receiver = self;
  v11.super_class = (Class)VSAccountChannelsCenter;
  v6 = [(VSAccountChannelsCenter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    dispatch_queue_t v8 = dispatch_queue_create("VSAccountChannelsCenter Serial Queue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

+ (id)sharedCenter
{
  if (sharedCenter___vs_lazy_init_predicate_0 != -1) {
    dispatch_once(&sharedCenter___vs_lazy_init_predicate_0, &__block_literal_global_33);
  }
  v2 = (void *)sharedCenter___vs_lazy_init_variable_0;

  return v2;
}

void __39__VSAccountChannelsCenter_sharedCenter__block_invoke()
{
  v0 = [VSAccountChannelsCenter alloc];
  id v3 = +[VSAccountStore sharedAccountStore];
  uint64_t v1 = [(VSAccountChannelsCenter *)v0 initWithAccountStore:v3];
  v2 = (void *)sharedCenter___vs_lazy_init_variable_0;
  sharedCenter___vs_lazy_init_variable_0 = v1;
}

- (void)_snapshotPreviousChannels
{
  id v3 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(VSAccountChannelsCenter *)self undoManager];
  if (v4)
  {
    id v5 = [(VSAccountChannelsCenter *)self _savedAccountChannels];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke;
    v9[3] = &unk_1E6BD3D78;
    id v10 = v4;
    objc_super v11 = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke_2;
    v6[3] = &unk_1E6BD3DA0;
    id v7 = v10;
    dispatch_queue_t v8 = self;
    [v5 unwrapObject:v9 error:v6];
  }
}

void __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 prepareWithInvocationTarget:v3];
  [v5 _enqueueSaveAccountChannelsAndWait:v4];
}

void __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) prepareWithInvocationTarget:*(void *)(a1 + 40)];
  [v1 _enqueueRemoveSavedAccountChannelsAndWait];
}

- (id)_storeIdentityProviderForAccount:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 identityProviderID];

  id v7 = [v6 forceUnwrapObject];

  id v24 = 0;
  int v8 = VSLoadInterfaceFramework((uint64_t)&v24);
  id v9 = v24;
  if (v8)
  {
    id v10 = [objc_alloc(NSClassFromString((NSString *)@"VSIdentityProviderFetchOperation")) initWithIdentityProviderID:v7];
    [v10 setFetchFromStoreOnly:1];
    objc_super v11 = [(VSAccountChannelsCenter *)self identityProviderFetchOperationBlock];

    if (v11)
    {
      v12 = [(VSAccountChannelsCenter *)self identityProviderFetchOperationBlock];
      uint64_t v13 = v12[2]();

      id v10 = v13;
    }
    v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1DA674000, v14, OS_LOG_TYPE_DEFAULT, "Fetching store identity provider for ID: %@", buf, 0xCu);
    }

    [(id)objc_opt_class() _startOperationAndWaitForCompletion:v10];
    v15 = [v10 result];
    v16 = [v15 forceUnwrapObject];

    v17 = [v16 object];
    v18 = VSDefaultLogObject();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        v20 = "Successfully fetched identity provider for ID: %@";
        v21 = v18;
        uint32_t v22 = 12;
LABEL_14:
        _os_log_impl(&dword_1DA674000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else if (v19)
    {
      *(_WORD *)buf = 0;
      v20 = "Unable to fetch store identity provider for provider ID. Adam ID will be set to nil";
      v21 = v18;
      uint32_t v22 = 2;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  id v10 = VSErrorLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[VSAccountChannelsCenter _storeIdentityProviderForAccount:]();
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (id)_savedAccountChannelsForIdentityProviderID:(id)a3 storeIdentityProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__10;
  v35 = __Block_byref_object_dispose__10;
  id v36 = 0;
  id v9 = [(VSAccountChannelsCenter *)self _savedAccountChannels];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke;
  v27[3] = &unk_1E6BD3DC8;
  v29 = self;
  v30 = &v31;
  id v28 = v6;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint32_t v22 = __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_19;
  v23 = &unk_1E6BD3DF0;
  id v24 = self;
  v26 = &v31;
  id v10 = v28;
  id v25 = v10;
  [v9 unwrapObject:v27 error:&v20];
  objc_super v11 = (void *)v32[5];
  v12 = objc_msgSend(v7, "uniqueID", v20, v21, v22, v23, v24);
  uint64_t v13 = [v12 forceUnwrapObject];
  [v11 setAdamID:v13];

  v14 = (void *)v32[5];
  v15 = [v7 providerInfo];
  v16 = [v15 forceUnwrapObject];
  [v14 setProviderInfo:v16];

  v17 = (void *)v32[5];
  if (!v17)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accountChannels parameter must not be nil."];
    v17 = (void *)v32[5];
  }
  id v18 = v17;

  _Block_object_dispose(&v31, 8);

  return v18;
}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 providerID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 channelIDs];
      int v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Serialized account channels successfuly loaded and the provider matches the account provider. Channels: %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v3;
    id v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v4, v10);
    }

    id v11 = (id)[*(id *)(a1 + 40) _removeSavedAccountChannels];
    uint64_t v12 = [(id)objc_opt_class() _accountChannelsWithProviderID:*(void *)(a1 + 32)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_19(uint64_t a1)
{
  v2 = VSErrorLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_19_cold_1();
  }

  id v3 = (id)[*(id *)(a1 + 32) _removeSavedAccountChannels];
  uint64_t v4 = [(id)objc_opt_class() _accountChannelsWithProviderID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_savedAccountChannels
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[VSAccountChannelsCenter _savedAccountChannels]";
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__10;
  id v36 = __Block_byref_object_dispose__10;
  id v37 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  id v30 = 0;
  uint64_t v5 = [(VSAccountChannelsCenter *)self accountStore];
  id v6 = [v5 firstAccount];

  if (v6)
  {
    uint64_t v7 = [(VSAccountChannelsCenter *)self accountStore];
    id v8 = [v7 firstAccount];
    id v9 = [v8 channelsData];
    id v10 = +[VSOptional optionalWithObject:v9];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke;
    v24[3] = &unk_1E6BD3E18;
    v24[4] = self;
    v24[5] = &buf;
    [v10 conditionallyUnwrapObject:v24];
  }
  id v11 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v11)
  {
    uint64_t v12 = [(VSAccountChannelsCenter *)self fileURL];
    uint64_t v13 = objc_alloc_init(VSFileReadOperation);
    [(VSFileReadOperation *)v13 setSource:v12];
    int v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v31 = 138412290;
      v32 = v12;
      _os_log_impl(&dword_1DA674000, v14, OS_LOG_TYPE_DEFAULT, "Reading account channels archive at: %@", v31, 0xCu);
    }

    [(id)objc_opt_class() _startOperationAndWaitForCompletion:v13];
    v15 = [(VSFileReadOperation *)v13 result];
    uint64_t v16 = [v15 forceUnwrapObject];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_26;
    v23[3] = &unk_1E6BD3E40;
    v23[4] = &buf;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2;
    v22[3] = &unk_1E6BD2A20;
    v22[4] = &v25;
    [v16 unwrapObject:v23 error:v22];

    id v11 = *(void **)(*((void *)&buf + 1) + 40);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_28;
  v21[3] = &unk_1E6BD3E40;
  v21[4] = &v25;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_32;
  v20[3] = &unk_1E6BD37D0;
  v20[4] = &v25;
  [v11 conditionallyUnwrapObject:v21 otherwise:v20];
  v17 = (void *)v26[5];
  if (!v17)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
    v17 = (void *)v26[5];
  }
  id v18 = v17;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&buf, 8);

  return v18;
}

id __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[VSOptional optionalWithObject:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return (id)[*(id *)(a1 + 32) _removeLocallySavedAccountChannels];
}

uint64_t __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_26(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[VSOptional optionalWithObject:a2];

  return MEMORY[0x1F41817F8]();
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_cold_1();
  }

  uint64_t v5 = +[VSFailable failableWithError:v3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_28(uint64_t a1, uint64_t a2)
{
  id v3 = +[VSAccountChannels deserializationResultWithData:a2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_30;
  v5[3] = &unk_1E6BD3E68;
  uint64_t v6 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_31;
  v4[3] = &unk_1E6BD2A20;
  v4[4] = v6;
  [v3 unwrapObject:v5 error:v4];
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_30(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Successfully read and deserialized account channels: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = +[VSFailable failableWithObject:v3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_31_cold_1();
  }

  uint64_t v5 = +[VSFailable failableWithError:v3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_32(uint64_t a1)
{
  v2 = VSErrorLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_32_cold_1();
  }

  id v3 = VSPrivateError(-24, 0);
  uint64_t v4 = +[VSFailable failableWithError:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_enqueueRemoveSavedAccountChannelsAndWait
{
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Will enqueue removing saved account channels.", buf, 2u);
  }

  uint64_t v4 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v5 = objc_alloc_init(VSSemaphore);
  uint64_t v6 = [(VSAccountChannelsCenter *)self serialQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __68__VSAccountChannelsCenter__enqueueRemoveSavedAccountChannelsAndWait__block_invoke;
  id v11 = &unk_1E6BD2C38;
  uint64_t v12 = self;
  uint64_t v13 = v5;
  uint64_t v7 = v5;
  dispatch_async(v6, &v8);

  [(VSSemaphore *)v7 wait];
}

uint64_t __68__VSAccountChannelsCenter__enqueueRemoveSavedAccountChannelsAndWait__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _removeSavedAccountChannels];
  id v3 = *(void **)(a1 + 40);

  return [v3 signal];
}

- (id)_removeSavedAccountChannels
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[VSAccountChannelsCenter _removeSavedAccountChannels]";
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v11, 0xCu);
  }

  [(VSAccountChannelsCenter *)self _snapshotPreviousChannels];
  uint64_t v5 = [(VSAccountChannelsCenter *)self accountStore];
  uint64_t v6 = [v5 firstAccount];

  if (v6)
  {
    uint64_t v7 = [(VSAccountChannelsCenter *)self accountStore];
    uint64_t v8 = [v7 firstAccount];
    [v8 setChannelsData:0];
  }
  uint64_t v9 = [(VSAccountChannelsCenter *)self _removeLocallySavedAccountChannels];

  return v9;
}

- (id)_removeLocallySavedAccountChannels
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [(VSAccountChannelsCenter *)self fileURL];
  id v3 = objc_alloc_init(VSFileRemoveOperation);
  [(VSFileRemoveOperation *)v3 setFileURL:v2];
  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = v2;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Removing account channels archive at: %@", (uint8_t *)&v8, 0xCu);
  }

  [(id)objc_opt_class() _startOperationAndWaitForCompletion:v3];
  uint64_t v5 = [(VSFileRemoveOperation *)v3 error];
  if (v5)
  {
    uint64_t v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VSAccountChannelsCenter _removeLocallySavedAccountChannels]();
    }
  }
  else
  {
    uint64_t v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Account channels archive successfully removed", (uint8_t *)&v8, 2u);
    }
  }

  return v5;
}

- (void)_enqueueSaveAccountChannelsAndWait:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Will enqueue saving account channels.", buf, 2u);
  }

  uint64_t v6 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_not_V2(v6);

  uint64_t v7 = objc_alloc_init(VSSemaphore);
  int v8 = [(VSAccountChannelsCenter *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VSAccountChannelsCenter__enqueueSaveAccountChannelsAndWait___block_invoke;
  block[3] = &unk_1E6BD2EE0;
  block[4] = self;
  id v12 = v4;
  uint64_t v13 = v7;
  uint64_t v9 = v7;
  id v10 = v4;
  dispatch_async(v8, block);

  [(VSSemaphore *)v9 wait];
}

uint64_t __62__VSAccountChannelsCenter__enqueueSaveAccountChannelsAndWait___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _saveAccountChannels:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);

  return [v3 signal];
}

- (id)_saveAccountChannels:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(VSAccountChannelsCenter *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[VSAccountChannelsCenter _saveAccountChannels:]";
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  [(VSAccountChannelsCenter *)self _snapshotPreviousChannels];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  uint64_t v7 = [v4 serializationResult];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke;
  v11[3] = &unk_1E6BD3530;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_42;
  v10[3] = &unk_1E6BD2A20;
  v10[4] = &buf;
  [v7 unwrapObject:v11 error:v10];
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accountStore];
  uint64_t v5 = [v4 firstAccount];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) accountStore];
    uint64_t v7 = [v6 firstAccount];

    [v7 setChannelsData:v3];
    id v8 = [*(id *)(a1 + 32) accountStore];
    v11[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v8 saveAccounts:v9 withCompletionHandler:&__block_literal_global_41];

    id v10 = (id)[*(id *)(a1 + 32) _removeLocallySavedAccountChannels];
  }
  else
  {
    uint64_t v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_cold_1();
    }
  }
}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountChannels save to keychain: success %d, error %@", (uint8_t *)v6, 0x12u);
  }
}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_42(uint64_t a1, void *a2)
{
}

- (NSURL)fileURL
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__10;
  int v11 = __Block_byref_object_dispose__10;
  id v12 = +[VSOptional optionalWithObject:self->_fileURL];
  id v3 = (void *)v8[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __34__VSAccountChannelsCenter_fileURL__block_invoke_2;
  v6[3] = &unk_1E6BD3ED0;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 conditionallyUnwrapObject:&__block_literal_global_45 otherwise:v6];
  id v4 = [(id)v8[5] forceUnwrapObject];
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

void __34__VSAccountChannelsCenter_fileURL__block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) directoryURL];
  id v2 = [*(id *)(a1 + 32) fileName];
  id v3 = [v7 URLByAppendingPathComponent:v2];
  uint64_t v4 = +[VSOptional optionalWithObject:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (void)_startOperationAndWaitForCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(VSSemaphore);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __63__VSAccountChannelsCenter__startOperationAndWaitForCompletion___block_invoke;
  v6[3] = &unk_1E6BD29A8;
  id v7 = v4;
  uint64_t v5 = v4;
  [v3 setCompletionBlock:v6];
  [v3 start];

  [(VSSemaphore *)v5 wait];
}

uint64_t __63__VSAccountChannelsCenter__startOperationAndWaitForCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

+ (id)_accountChannelsWithProviderID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(VSAccountChannels);
  [(VSAccountChannels *)v4 setProviderID:v3];

  return v4;
}

- (void)_saveAccountChannels:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[VSAccountChannelsCenter _saveAccountChannels:withCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  uint64_t v9 = [(VSAccountChannelsCenter *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke;
  block[3] = &unk_1E6BD2CD8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _saveAccountChannels:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E6BD2C88;
    id v6 = v3;
    id v5 = v2;
    VSPerformCompletionHandler(v4);
  }
}

uint64_t __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_removeSavedAccountChannelsWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v11 = "-[VSAccountChannelsCenter _removeSavedAccountChannelsWithCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v6 = [(VSAccountChannelsCenter *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BD2E90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _removeSavedAccountChannels];
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E6BD2C88;
    id v6 = v3;
    id v5 = v2;
    VSPerformCompletionHandler(v4);
  }
}

uint64_t __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSURL)directoryURL
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_directoryURL;
  if (!v3)
  {
    id v3 = [(id)objc_opt_class() _defaultDirectoryURL];
    objc_storeStrong((id *)&v2->_directoryURL, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (NSString)fileName
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_fileName;
  if (!v3)
  {
    id v3 = [(id)objc_opt_class() _defaultFileName];
    objc_storeStrong((id *)&v2->_fileName, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

+ (id)_defaultDirectoryURL
{
  return +[VSPersistentStorage defaultStorageDirectoryURL];
}

+ (id)_defaultFileName
{
  return @"VideoSubscriberAccountChannels.data";
}

- (NSUndoManager)undoManager
{
  id v2 = [(VSAccountChannelsCenter *)self accountStore];
  id v3 = [v2 undoManager];

  return (NSUndoManager *)v3;
}

- (void)setUndoManager:(id)a3
{
  id v4 = a3;
  id v5 = [(VSAccountChannelsCenter *)self accountStore];
  [v5 setUndoManager:v4];
}

- (void)fetchAccountChannelsWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v11 = "-[VSAccountChannelsCenter fetchAccountChannelsWithCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
  }
  id v6 = [(VSAccountChannelsCenter *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BD2E90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accountStore];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E6BD2E18;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 fetchAccountsWithCompletionHandler:v4];
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E6BD2CD8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E6BD2DF0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_58;
  v4[3] = &unk_1E6BD2DA0;
  id v5 = *(id *)(a1 + 48);
  [v2 unwrapObject:v6 error:v4];
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndex:0];
    id v5 = [v4 identityProviderID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_5;
    v13[3] = &unk_1E6BD3EF8;
    id v6 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v4;
    id v15 = v6;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_54;
    v11[3] = &unk_1E6BD2DC8;
    id v12 = *(id *)(a1 + 40);
    id v7 = v4;
    [v5 conditionallyUnwrapObject:v13 otherwise:v11];
  }
  else
  {
    id v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4_cold_1();
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_56;
    v9[3] = &unk_1E6BD2DC8;
    id v10 = *(id *)(a1 + 40);
    VSPerformCompletionHandler(v9);
    id v7 = v10;
  }
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 _storeIdentityProviderForAccount:v4];
  id v7 = [*(id *)(a1 + 32) _savedAccountChannelsForIdentityProviderID:v5 storeIdentityProvider:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_6;
  v9[3] = &unk_1E6BD2E90;
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  id v8 = v7;
  VSPerformCompletionHandler(v9);
}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning account channels: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_54(uint64_t a1)
{
  id v2 = VSErrorLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_54_cold_1();
  }

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_55;
  v3[3] = &unk_1E6BD2DC8;
  id v4 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v3);
}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_55(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning nil account channels due to no identity provider ID.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_56(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning nil account channels due to no first account.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_58_cold_1();
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_59;
  v5[3] = &unk_1E6BD2DC8;
  id v6 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v5);
}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_59(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning nil account channels due to error.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setFileURL:(id)a3
{
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void)setFileName:(id)a3
{
}

- (void)setDirectoryURL:(id)a3
{
}

- (id)identityProviderFetchOperationBlock
{
  return self->_identityProviderFetchOperationBlock;
}

- (void)setIdentityProviderFetchOperationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identityProviderFetchOperationBlock, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_storeIdentityProviderForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to load interface framework: %@", v2, v3, v4, v5, v6);
}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Serialized account channels successfuly loaded but provider IDs (%@ vs %@) do not match those expected. Removing serialized account channels file and returning account channels object containing just the provider ID.", (uint8_t *)&v4, 0x16u);
}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Error deserializing account channels. Removing serialized account channels file and returning account channels object containing just the provider ID.", v2, v3, v4, v5, v6);
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to read account channels archive. %@", v2, v3, v4, v5, v6);
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to deserialize account channels archive. %@", v2, v3, v4, v5, v6);
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Serialized account channels data was nil.", v2, v3, v4, v5, v6);
}

- (void)_removeLocallySavedAccountChannels
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error removing archived account channels: %@", v2, v3, v4, v5, v6);
}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "No account found, cannot save channels.", v2, v3, v4, v5, v6);
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Unable to fetch channels as there is no account", v2, v3, v4, v5, v6);
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_54_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Unable to fetch channels as there is an account with a nil provider ID", v2, v3, v4, v5, v6);
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to fetch channels:%@", v2, v3, v4, v5, v6);
}

@end