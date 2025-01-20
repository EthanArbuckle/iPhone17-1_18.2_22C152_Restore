@interface HDDeviceContextStoreServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchEntriesWithCompletion:(id)a3;
- (void)remote_numberOfDeviceContextsPerDeviceType:(id)a3;
@end

@implementation HDDeviceContextStoreServer

- (void)remote_fetchEntriesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 deviceContextManager];
  id v11 = 0;
  v7 = [v6 fetchAllEntriesWithError:&v11];
  id v8 = v11;

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__HDDeviceContextStoreServer_remote_fetchEntriesWithCompletion___block_invoke;
    v10[3] = &unk_1E6306D08;
    v10[4] = self;
    v9 = objc_msgSend(v7, "hk_map:", v10);
    v4[2](v4, v9, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v8);
  }
}

id __64__HDDeviceContextStoreServer_remote_fetchEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v16 = objc_alloc(MEMORY[0x1E4F2AF00]);
  uint64_t v15 = [v3 type];
  v4 = [v3 syncIdentity];
  v5 = [*(id *)(a1 + 32) profile];
  v6 = [v5 syncIdentityManager];
  v7 = [v6 currentSyncIdentity];
  id v8 = [v7 identity];
  uint64_t v9 = [v4 isEqual:v8];
  v10 = [v3 productTypeName];
  id v11 = [v3 currentOSName];
  if (v3) {
    [v3 currentOSVersion];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  v12 = [v3 modificationDate];
  v13 = (void *)[v16 initWithType:v15 localDevice:v9 productTypeName:v10 currentOSName:v11 currentOSVersion:v17 modificationDate:v12];

  return v13;
}

- (void)remote_numberOfDeviceContextsPerDeviceType:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 deviceContextManager];
  id v11 = 0;
  v7 = [v6 numberOfDeviceContextsPerDeviceType:&v11];
  id v8 = v11;

  if (v7)
  {
    uint64_t v9 = v7;
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = v8;
  }
  v4[2](v4, v9, v10);
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F299C0];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  return [a3 hasRequiredArrayEntitlement:*MEMORY[0x1E4F2A558] containing:*MEMORY[0x1E4F29B00] error:a4];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AF08] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AF08] clientInterface];
}

@end