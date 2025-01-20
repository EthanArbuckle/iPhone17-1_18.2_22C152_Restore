@interface EDBusinessChatServicesBusinessesGrouping
+ (OS_os_log)log;
- (EDBusinessChatServicesBusinessesGrouping)initWithBusinessPersistence:(id)a3;
- (EDBusinessPersistence)businessPersistence;
- (id)businessConnectGroupingQueue;
- (unint64_t)addressesChecked;
- (unint64_t)addressesToCheck;
- (void)_fetchBusinessMetadataForAddresses:(id)a3 progressHandler:(id)a4;
- (void)setAddressesChecked:(unint64_t)a3;
- (void)setAddressesToCheck:(unint64_t)a3;
- (void)startBusinessConnectGroupingWithCancelationToken:(id)a3 progressHandler:(id)a4 completion:(id)a5;
@end

@implementation EDBusinessChatServicesBusinessesGrouping

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EDBusinessChatServicesBusinessesGrouping_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1) {
    dispatch_once(&log_onceToken_13, block);
  }
  v2 = (void *)log_log_13;

  return (OS_os_log *)v2;
}

void __47__EDBusinessChatServicesBusinessesGrouping_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;
}

- (EDBusinessChatServicesBusinessesGrouping)initWithBusinessPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDBusinessChatServicesBusinessesGrouping;
  v6 = [(EDBusinessChatServicesBusinessesGrouping *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_businessPersistence, a3);
    v7->_addressesChecked = 0;
    v7->_addressesToCheck = 0;
  }

  return v7;
}

- (id)businessConnectGroupingQueue
{
  if (businessConnectGroupingQueue_onceToken != -1) {
    dispatch_once(&businessConnectGroupingQueue_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)businessConnectGroupingQueue_queue;

  return v2;
}

void __72__EDBusinessChatServicesBusinessesGrouping_businessConnectGroupingQueue__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.email.EDBusinessChatServicesBusinessesGrouping", v0);
  v2 = (void *)businessConnectGroupingQueue_queue;
  businessConnectGroupingQueue_queue = (uint64_t)v1;
}

- (void)startBusinessConnectGroupingWithCancelationToken:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EDBusinessChatServicesBusinessesGrouping *)self businessConnectGroupingQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke;
  v15[3] = &unk_1E6BFFBF0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke(id *a1)
{
  v2 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.email.businessesConnectGrouping"];
  id v3 = [a1[4] businessPersistence];
  objc_msgSend(a1[4], "setAddressesToCheck:", objc_msgSend(v3, "countOfAddressesNeedingUpdate"));

  if ([a1[4] addressesToCheck])
  {
    *(void *)v31 = 0;
    v32 = v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    id v36 = (id)0xAAAAAAAAAAAAAAAALL;
    id v36 = (id)objc_opt_new();
    v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [a1[4] businessPersistence];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_7;
    v25[3] = &unk_1E6BFFB78;
    id v6 = a1[5];
    id v28 = a1[6];
    v30 = v31;
    id v7 = v4;
    id v8 = a1[4];
    id v26 = v7;
    id v27 = v8;
    id v29 = a1[7];
    [v5 iterateAddressesNeedingUpdateWithCancelationToken:v6 handler:v25];

    if ([a1[5] isCanceled])
    {
      id v9 = +[EDBusinessChatServicesBusinessesGrouping log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Business grouping canceled. Returning early", buf, 2u);
      }

      [v2 invalidate];
      id v10 = (void (**)(id, void *))a1[6];
      if (!v10) {
        goto LABEL_14;
      }
      v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
      v10[2](v10, v11);
    }
    else
    {
      if ([*((id *)v32 + 5) count])
      {
        id v13 = [MEMORY[0x1E4F60E18] promise];
        id v14 = [v13 future];
        [v7 addObject:v14];

        id v15 = a1[4];
        uint64_t v16 = *((void *)v32 + 5);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_14;
        v21[3] = &unk_1E6BFFBA0;
        id v23 = a1[7];
        id v17 = v13;
        id v22 = v17;
        [v15 _fetchBusinessMetadataForAddresses:v16 progressHandler:v21];
      }
      v11 = [MEMORY[0x1E4F60D70] join:v7];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_2;
      v18[3] = &unk_1E6BFFBC8;
      id v19 = v2;
      id v20 = a1[6];
      [v11 always:v18];
    }
LABEL_14:

    _Block_object_dispose(v31, 8);
    goto LABEL_15;
  }
  id v12 = +[EDBusinessChatServicesBusinessesGrouping log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "No addresses needing an update, exiting.", v31, 2u);
  }

  (*((void (**)(void))a1[6] + 2))();
  [v2 invalidate];
LABEL_15:
}

void __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = +[EDBusinessChatServicesBusinessesGrouping log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v9, "ef_publicDescription");
      __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_7_cold_1(v11, buf, v10);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v9);
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v8 forKey:v7];
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] >= 0xA)
    {
      *(void *)buf = 0;
      v24 = buf;
      uint64_t v25 = 0x3032000000;
      id v26 = __Block_byref_object_copy__0;
      id v27 = __Block_byref_object_dispose__0;
      id v28 = (id)0xAAAAAAAAAAAAAAAALL;
      id v28 = [MEMORY[0x1E4F60E18] promise];
      id v13 = *(void **)(a1 + 32);
      id v14 = [*((id *)v24 + 5) future];
      [v13 addObject:v14];

      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_9;
      id v20 = &unk_1E6BFFB50;
      id v21 = *(id *)(a1 + 56);
      id v22 = buf;
      [v15 _fetchBusinessMetadataForAddresses:v16 progressHandler:&v17];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "removeAllObjects", v17, v18, v19, v20);

      _Block_object_dispose(buf, 8);
    }
  }
}

void __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_9(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [MEMORY[0x1E4F1CA98] null];
  objc_msgSend(v2, "finishWithResult:");
}

void __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_14(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1CA98] null];
  objc_msgSend(v2, "finishWithResult:");
}

uint64_t __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_fetchBusinessMetadataForAddresses:(id)a3 progressHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDBusinessChatServicesBusinessesGrouping *)self businessConnectGroupingQueue];
  dispatch_assert_queue_V2(v8);

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = (void *)[v6 copy];
  v11 = +[EDBusinessChatServicesBusinessesGrouping log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 allValues];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v12;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Fetching Business Connect metadata for addresses: %{public}@", buf, 0xCu);
  }
  id v13 = [(EDBusinessChatServicesBusinessesGrouping *)self businessPersistence];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __95__EDBusinessChatServicesBusinessesGrouping__fetchBusinessMetadataForAddresses_progressHandler___block_invoke;
  id v23 = &unk_1E6BFFC18;
  id v14 = v10;
  id v24 = v14;
  id v15 = v9;
  uint64_t v25 = v15;
  id v26 = self;
  id v16 = v7;
  id v27 = v16;
  [v13 fetchBusinessMetadataForAddresses:v14 completionHandler:&v20];

  dispatch_time_t v17 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v15, v17))
  {
    uint64_t v18 = +[EDBusinessChatServicesBusinessesGrouping log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v14 allValues];
      -[EDBusinessChatServicesBusinessesGrouping _fetchBusinessMetadataForAddresses:progressHandler:](v19, buf, v18);
    }
  }
}

uint64_t __95__EDBusinessChatServicesBusinessesGrouping__fetchBusinessMetadataForAddresses_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = +[EDBusinessChatServicesBusinessesGrouping log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    int v7 = 134218240;
    uint64_t v8 = a2;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Updated %ld/%ld addresses with Business Connect.", (uint8_t *)&v7, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setAddressesChecked:", objc_msgSend(*(id *)(a1 + 48), "addressesChecked") + objc_msgSend(*(id *)(a1 + 32), "count"));
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [*(id *)(a1 + 48) addressesChecked], objc_msgSend(*(id *)(a1 + 48), "addressesToCheck"));
}

- (EDBusinessPersistence)businessPersistence
{
  return self->_businessPersistence;
}

- (unint64_t)addressesChecked
{
  return self->_addressesChecked;
}

- (void)setAddressesChecked:(unint64_t)a3
{
  self->_addressesChecked = a3;
}

- (unint64_t)addressesToCheck
{
  return self->_addressesToCheck;
}

- (void)setAddressesToCheck:(unint64_t)a3
{
  self->_addressesToCheck = a3;
}

- (void).cxx_destruct
{
}

void __120__EDBusinessChatServicesBusinessesGrouping_startBusinessConnectGroupingWithCancelationToken_progressHandler_completion___block_invoke_7_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Business Connect query failed with error %{public}@", buf, 0xCu);
}

- (void)_fetchBusinessMetadataForAddresses:(os_log_t)log progressHandler:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Business Connect took longer than 5 seconds to return the results for addresses: %{public}@", buf, 0xCu);
}

@end