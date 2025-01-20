@interface VSAccountSerializationCenter
+ (id)defaultSerializationCenter;
- (NSOperationQueue)serializationQueue;
- (NSUndoManager)undoManager;
- (VSAccountSerializationCenter)init;
- (VSPersistentStorage)storage;
- (id)exportDataWithCompletionHandler:(id)a3;
- (id)importData:(id)a3 withCompletionHandler:(id)a4;
- (void)setSerializationQueue:(id)a3;
- (void)setStorage:(id)a3;
- (void)setUndoManager:(id)a3;
@end

@implementation VSAccountSerializationCenter

+ (id)defaultSerializationCenter
{
  if (defaultSerializationCenter___vs_lazy_init_predicate != -1) {
    dispatch_once(&defaultSerializationCenter___vs_lazy_init_predicate, &__block_literal_global_5);
  }
  v2 = (void *)defaultSerializationCenter___vs_lazy_init_variable;

  return v2;
}

uint64_t __58__VSAccountSerializationCenter_defaultSerializationCenter__block_invoke()
{
  defaultSerializationCenter___vs_lazy_init_variable = objc_alloc_init(VSAccountSerializationCenter);

  return MEMORY[0x1F41817F8]();
}

- (VSAccountSerializationCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSAccountSerializationCenter;
  v2 = [(VSAccountSerializationCenter *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    serializationQueue = v2->_serializationQueue;
    v2->_serializationQueue = v3;

    [(NSOperationQueue *)v2->_serializationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_serializationQueue setName:@"VSAccountSerializationCenter"];
  }
  return v2;
}

- (VSPersistentStorage)storage
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_storage;
  if (!v3)
  {
    v3 = objc_alloc_init(VSPersistentStorage);
    objc_storeStrong((id *)&v2->_storage, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (NSUndoManager)undoManager
{
  v2 = [(VSAccountSerializationCenter *)self storage];
  v3 = [v2 channelsCenter];
  v4 = [v3 undoManager];

  return (NSUndoManager *)v4;
}

- (void)setUndoManager:(id)a3
{
  id v4 = a3;
  id v6 = [(VSAccountSerializationCenter *)self storage];
  v5 = [v6 channelsCenter];
  [v5 setUndoManager:v4];
}

- (id)exportDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  id v6 = [(VSAccountSerializationCenter *)self storage];
  v7 = [v6 channelsCenter];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6BD2E40;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  [v7 fetchAccountChannelsWithCompletionHandler:v10];

  return v5;
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F28B48];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E6BD2CD8;
  id v5 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  v7 = [v4 blockOperationWithBlock:v9];
  id v8 = [*(id *)(a1 + 32) serializationQueue];
  [v8 addOperation:v7];
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_2(id *a1)
{
  v2 = [a1[4] storage];
  id v3 = [v2 accountStore];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E6BD2E18;
  id v5 = a1[5];
  id v6 = a1[6];
  [v3 fetchAccountsWithCompletionHandler:v4];
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E6BD2DF0;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_11;
  v4[3] = &unk_1E6BD2DA0;
  id v5 = *(id *)(a1 + 40);
  [a2 unwrapObject:v6 error:v4];
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(VSAccountsArchive);
    [(VSAccountsArchive *)v4 setChannels:*(void *)(a1 + 32)];
    [(VSAccountsArchive *)v4 setAccounts:v3];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [(VSAccountsArchive *)v4 encodeWithCoder:v5];
    id v6 = [v5 encodedData];
    id v7 = [MEMORY[0x1E4F29248] valueTransformerForName:@"VSDataCompressionValueTransformer"];
    id v8 = [v7 transformedValue:v6];
    if (v8)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_5;
      v16[3] = &unk_1E6BD2D78;
      v9 = &v17;
      id v17 = *(id *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_7;
      v14[3] = &unk_1E6BD2DA0;
      id v15 = *(id *)(a1 + 40);
      [v8 unwrapObject:v16 error:v14];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_9;
      v12[3] = &unk_1E6BD2DC8;
      v9 = &v13;
      id v13 = *(id *)(a1 + 40);
      VSPerformCompletionHandler(v12);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_10;
    v10[3] = &unk_1E6BD2DC8;
    id v11 = (VSAccountsArchive *)*(id *)(a1 + 40);
    VSPerformCompletionHandler(v10);
    id v4 = v11;
  }
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_6;
  v6[3] = &unk_1E6BD2C88;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  VSPerformCompletionHandler(v6);
}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_8;
  v6[3] = &unk_1E6BD2C88;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  VSPerformCompletionHandler(v6);
}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_12;
  v6[3] = &unk_1E6BD2C88;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  VSPerformCompletionHandler(v6);
}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)importData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The data parameter must not be nil."];
    if (v8) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
LABEL_3:
  id v9 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  if ([v6 length])
  {
    id v10 = [MEMORY[0x1E4F29248] valueTransformerForName:@"VSDataCompressionValueTransformer"];
    id v11 = [v10 reverseTransformedValue:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E6BD2EB8;
    v15[4] = self;
    id v17 = v8;
    id v16 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_82;
    v13[3] = &unk_1E6BD2DA0;
    v14 = v17;
    [v11 unwrapObject:v15 error:v13];
  }
  else
  {
    v8[2](v8, 1, 0);
  }

  return v9;
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v42 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v42];
  id v5 = v42;
  if (v4)
  {
    id v32 = v3;
    id v6 = v4;
    [v6 setDecodingFailurePolicy:1];
    v30 = v6;
    id v7 = [[VSAccountsArchive alloc] initWithCoder:v6];
    id v8 = [(VSAccountsArchive *)v7 channels];
    id v9 = objc_alloc_init(VSAccountChannels);
    id v31 = v5;
    v29 = v8;
    if (v8)
    {
      id v10 = v8;

      id v9 = v10;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v12 = [(VSAccountsArchive *)v7 accounts];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v17 isSynchronizable]) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v14);
    }

    if ([v11 count])
    {
      v18 = [VSAccountSaveOperation alloc];
      v19 = [(VSAccountsArchive *)v7 accounts];
      v20 = [*(id *)(a1 + 32) storage];
      v21 = [(VSAccountSaveOperation *)v18 initWithUnsavedAccounts:v19 channels:v9 storage:v20];

      v22 = (void *)MEMORY[0x1E4F28B48];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_2;
      v35[3] = &unk_1E6BD2E90;
      v23 = v21;
      v36 = v23;
      id v37 = *(id *)(a1 + 48);
      v24 = [v22 blockOperationWithBlock:v35];
      [v24 addDependency:v23];
      VSEnqueueCompletionOperation(v24);
      v25 = *(void **)(a1 + 40);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_5;
      v33[3] = &unk_1E6BD29A8;
      v34 = v23;
      v26 = v23;
      [v25 setCancellationHandler:v33];
      v27 = [*(id *)(a1 + 32) serializationQueue];
      [v27 addOperation:v26];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    id v5 = v31;
    id v3 = v32;
  }
  else
  {
    v28 = VSErrorLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_cold_1((uint64_t)v5, v28);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E6BD2E68;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_4;
  v4[3] = &unk_1E6BD2DA0;
  id v5 = *(id *)(a1 + 40);
  [v3 unwrapObject:v6 error:v4];
}

uint64_t __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_82_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSOperationQueue)serializationQueue
{
  return self->_serializationQueue;
}

- (void)setSerializationQueue:(id)a3
{
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_serializationQueue, 0);
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive data: %@", (uint8_t *)&v2, 0xCu);
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_82_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Failed to decompress data: %@", (uint8_t *)&v2, 0xCu);
}

@end