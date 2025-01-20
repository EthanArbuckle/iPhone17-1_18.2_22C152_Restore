@interface CRKFetchClassroomConfigurationOperation
+ (id)defaultSourcesByTypeWithStudentDaemonProxy:(id)a3;
- (BOOL)isAsynchronous;
- (CRKFeatureFlags)featureFlags;
- (CRKFetchClassroomConfigurationOperation)init;
- (CRKFetchClassroomConfigurationOperation)initWithStudentDaemonProxy:(id)a3;
- (CRKFetchClassroomConfigurationOperation)initWithStudentDaemonProxy:(id)a3 sourcesByType:(id)a4;
- (void)cancel;
- (void)fetchConfiguration;
- (void)main;
@end

@implementation CRKFetchClassroomConfigurationOperation

+ (id)defaultSourcesByTypeWithStudentDaemonProxy:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_26D81A318;
  id v3 = a3;
  v4 = [CRKCurrentPlatformProfileConfigurationSource alloc];
  v5 = [(CRKCurrentPlatformProfileConfigurationSource *)v4 initWithStudentDaemonProxy:v3 callbackQueue:MEMORY[0x263EF83A0]];

  v9[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (CRKFetchClassroomConfigurationOperation)init
{
  return [(CRKFetchClassroomConfigurationOperation *)self initWithStudentDaemonProxy:0];
}

- (CRKFetchClassroomConfigurationOperation)initWithStudentDaemonProxy:(id)a3
{
  return [(CRKFetchClassroomConfigurationOperation *)self initWithStudentDaemonProxy:a3 sourcesByType:0];
}

- (CRKFetchClassroomConfigurationOperation)initWithStudentDaemonProxy:(id)a3 sourcesByType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKFetchClassroomConfigurationOperation;
  v8 = [(CRKFetchClassroomConfigurationOperation *)&v16 init];
  if (v8)
  {
    v9 = v6;
    if (!v6) {
      v9 = objc_opt_new();
    }
    objc_storeStrong((id *)&v8->mStudentDaemonProxy, v9);
    if (!v6) {

    }
    v10 = objc_opt_new();
    uint64_t v11 = [v10 makeFeatureFlags];
    featureFlags = v8->_featureFlags;
    v8->_featureFlags = (CRKFeatureFlags *)v11;

    v13 = (void *)[v7 copy];
    v14 = v13;
    if (!v13)
    {
      v14 = [(id)objc_opt_class() defaultSourcesByTypeWithStudentDaemonProxy:v8->mStudentDaemonProxy];
    }
    objc_storeStrong((id *)&v8->mSourcesByType, v14);
    if (!v13) {
  }
    }
  return v8;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__CRKFetchClassroomConfigurationOperation_cancel__block_invoke;
  v2[3] = &unk_2646F35C0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v2);
}

uint64_t __49__CRKFetchClassroomConfigurationOperation_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 392) cancel];
}

- (void)main
{
}

- (void)fetchConfiguration
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  id v17 = 0;
  id v3 = objc_opt_new();
  dispatch_group_t v4 = dispatch_group_create();
  mSourcesByType = self->mSourcesByType;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke;
  v12[3] = &unk_2646F5180;
  id v6 = v4;
  v13 = v6;
  v15 = v16;
  id v7 = v3;
  id v14 = v7;
  [(NSDictionary *)mSourcesByType enumerateKeysAndObjectsUsingBlock:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_4;
  v9[3] = &unk_2646F51A8;
  id v10 = v7;
  uint64_t v11 = v16;
  v9[4] = self;
  id v8 = v7;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], v9);

  _Block_object_dispose(v16, 8);
}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = a3;
  dispatch_group_enter(v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_2;
  v10[3] = &unk_2646F5158;
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  id v11 = v8;
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  id v9 = v5;
  [v7 fetchConfiguration:v10];
}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_3;
  v10[3] = &unk_2646F5130;
  uint64_t v7 = *(void *)(a1 + 56);
  id v11 = v6;
  uint64_t v16 = v7;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v2);
  }
  [*(id *)(a1 + 40) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 48)];
  id v3 = *(NSObject **)(a1 + 64);

  dispatch_group_leave(v3);
}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "endOperationWithError:");
  }
  else
  {
    id v3 = (id)[*(id *)(a1 + 40) copy];
    [v1 endOperationWithResultObject:v3];
  }
}

- (CRKFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->mFetchConfigurationOperation, 0);
  objc_storeStrong((id *)&self->mSourcesByType, 0);

  objc_storeStrong((id *)&self->mStudentDaemonProxy, 0);
}

@end