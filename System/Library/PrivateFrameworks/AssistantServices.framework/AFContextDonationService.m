@interface AFContextDonationService
+ (id)defaultService;
- (id)_connection;
- (id)_init;
- (void)deviceContextConnectionDidInvalidate:(id)a3;
- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5;
- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5 completion:(id)a6;
- (void)registerContextTransformer:(id)a3 forType:(id)a4;
- (void)setDonationService:(id)a3;
@end

@implementation AFContextDonationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_donationService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_transformersByType, 0);
}

- (void)deviceContextConnectionDidInvalidate:(id)a3
{
  connection = self->_connection;
  self->_connection = 0;
}

- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v11 type];
  if (v13)
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke;
    v15[3] = &unk_1E592C400;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    BOOL v20 = a5;
    id v19 = v12;
    id v18 = v13;
    dispatch_async(queue, v15);
  }
}

void __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke(uint64_t a1)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    [v3 donateContext:*(void *)(a1 + 40) withMetadata:*(void *)(a1 + 48) pushToRemote:*(unsigned __int8 *)(a1 + 72)];
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__47377;
    v39 = __Block_byref_object_dispose__47378;
    id v40 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__47377;
    v33 = __Block_byref_object_dispose__47378;
    id v34 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_5;
    v23[3] = &unk_1E592C388;
    v23[4] = v2;
    v26 = &v35;
    v27 = &v29;
    id v24 = *(id *)(a1 + 56);
    char v28 = *(unsigned char *)(a1 + 72);
    id v25 = *(id *)(a1 + 64);
    v6 = (void (**)(void))MEMORY[0x19F3A50D0](v23);
    v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 56)];
    v8 = [*(id *)(a1 + 40) serializedBackingStore];
    v9 = v8;
    if (v7)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_3;
      v17[3] = &unk_1E592C3D8;
      v17[4] = *(void *)(a1 + 32);
      v21 = &v35;
      id v18 = v8;
      v22 = &v29;
      id v19 = *(id *)(a1 + 48);
      BOOL v20 = v6;
      [v7 getRedactedContextForContextSnapshot:v10 metadata:v11 privacyPolicy:50 completion:v17];
    }
    else
    {
      v43 = &unk_1EEE98648;
      v44[0] = v8;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
      v13 = (void *)v36[5];
      v36[5] = v12;

      uint64_t v14 = *(void *)(a1 + 48);
      v41 = &unk_1EEE98648;
      uint64_t v42 = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v16 = (void *)v30[5];
      v30[5] = v15;

      v6[2](v6);
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
}

void __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_2;
  v7[3] = &unk_1E592C360;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v2 donateSerializedContextMapByPrivacyClass:v3 withMetadataMap:v4 forType:v6 pushToRemote:v5 completion:v7];
}

void __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_4;
  block[3] = &unk_1E592C3B0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v18 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 72);
  id v15 = v8;
  uint64_t v19 = v9;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_4(void *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = a1[4];
    uint64_t v25 = a1[5];
    *(_DWORD *)buf = 136315650;
    uint64_t v35 = "-[AFContextDonationService donateContext:withMetadata:pushToRemote:completion:]_block_invoke_4";
    __int16 v36 = 2112;
    uint64_t v37 = v24;
    __int16 v38 = 2112;
    uint64_t v39 = v25;
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s #hal redacted: %@ %@", buf, 0x20u);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3 && a1[5])
  {
    uint64_t v4 = a1[6];
    v32[0] = &unk_1EEE98648;
    v32[1] = &unk_1EEE98660;
    v33[0] = v4;
    id v5 = [v3 serializedBackingStore];
    v33[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    uint64_t v7 = *(void *)(a1[9] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = a1[7];
    v30[0] = &unk_1EEE98648;
    v30[1] = &unk_1EEE98660;
    uint64_t v10 = a1[5];
    v31[0] = v9;
    v31[1] = v10;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = v31;
    id v13 = (void **)v30;
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v15 = a1[6];
    char v28 = &unk_1EEE98648;
    uint64_t v29 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v17 = *(void *)(a1[9] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = a1[7];
    v26 = &unk_1EEE98648;
    uint64_t v27 = v19;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v12 = &v27;
    id v13 = &v26;
    uint64_t v14 = 1;
  }
  uint64_t v20 = objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14, v26, v27);
  uint64_t v21 = *(void *)(a1[10] + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

uint64_t __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5
{
}

- (void)registerContextTransformer:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AFContextDonationService_registerContextTransformer_forType___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __63__AFContextDonationService_registerContextTransformer_forType___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(void *)(v1 + 24)) {
    return [*(id *)(v1 + 24) registerContextTransformer:a1[5] forType:a1[6]];
  }
  else {
    return [*(id *)(v1 + 8) setObject:a1[5] forKey:a1[6]];
  }
}

- (void)setDonationService:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AFContextDonationService_setDonationService___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__AFContextDonationService_setDonationService___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 24))
    {
      id v7 = [*(id *)(v2 + 8) keyEnumerator];
      uint64_t v3 = [v7 nextObject];
      if (v3)
      {
        id v4 = (void *)v3;
        do
        {
          id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v4];
          [*(id *)(*(void *)(a1 + 32) + 24) registerContextTransformer:v5 forType:v4];

          uint64_t v6 = [v7 nextObject];

          id v4 = (void *)v6;
        }
        while (v6);
      }
    }
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = [AFDeviceContextConnection alloc];
    queue = self->_queue;
    uint64_t v6 = +[AFInstanceContext currentContext];
    id v7 = [(AFDeviceContextConnection *)v4 initWithQueue:queue instanceContext:v6 delegate:self];
    id v8 = self->_connection;
    self->_connection = v7;

    connection = self->_connection;
  }
  return connection;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)AFContextDonationService;
  uint64_t v2 = [(AFContextDonationService *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AFContextDonationService", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    transformersByType = v2->_transformersByType;
    v2->_transformersByType = (NSMapTable *)v5;
  }
  return v2;
}

+ (id)defaultService
{
  if (defaultService_onceToken != -1) {
    dispatch_once(&defaultService_onceToken, &__block_literal_global_47397);
  }
  uint64_t v2 = (void *)defaultService_sDonation;
  return v2;
}

void __42__AFContextDonationService_defaultService__block_invoke()
{
  id v0 = [[AFContextDonationService alloc] _init];
  uint64_t v1 = (void *)defaultService_sDonation;
  defaultService_sDonation = (uint64_t)v0;
}

@end