@interface HDSharedSummaryCloudSyncManagerServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDSharedSummaryCloudSyncManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchAccountInfoWithCompletion:(id)a3;
- (void)remote_pullWithCompletion:(id)a3;
- (void)remote_pushWithCompletion:(id)a3;
@end

@implementation HDSharedSummaryCloudSyncManagerServer

- (HDSharedSummaryCloudSyncManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HDSharedSummaryCloudSyncManagerServer;
  v6 = [(HDStandardTaskServer *)&v10 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (void)remote_fetchAccountInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(HDStandardTaskServer *)self profile];
  v5 = [v6 cloudSyncManager];
  [v5 fetchCloudKitAccountInfoWithCompletion:v4];
}

- (void)remote_pushWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 cloudSyncManager];
  uint64_t v7 = [v6 sharedSummaryManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HDSharedSummaryCloudSyncManagerServer_remote_pushWithCompletion___block_invoke;
  v10[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v8 = v4;
  id v9 = (id)[v7 push:v10];
}

void __67__HDSharedSummaryCloudSyncManagerServer_remote_pushWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_pullWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 cloudSyncManager];
  uint64_t v7 = [v6 sharedSummaryManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HDSharedSummaryCloudSyncManagerServer_remote_pullWithCompletion___block_invoke;
  v10[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v8 = v4;
  id v9 = (id)[v7 pull:v10];
}

void __67__HDSharedSummaryCloudSyncManagerServer_remote_pullWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B4A8] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B4A8] clientInterface];
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B4A8] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void).cxx_destruct
{
}

@end