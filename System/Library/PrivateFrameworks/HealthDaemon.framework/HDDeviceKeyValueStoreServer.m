@interface HDDeviceKeyValueStoreServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDDeviceKeyValueStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_storageGroupForGroup:(uint64_t)a1;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3 domain:(id)a4;
- (void)remote_fetchEntriesForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 completion:(id)a6;
- (void)remote_mostRecentEntryForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 completion:(id)a6;
- (void)remote_setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7;
- (void)remote_setDate:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7;
- (void)remote_setNumber:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7;
- (void)remote_setString:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7;
- (void)remote_startObservingDeviceKeyValueStoreWithCompletion:(id)a3;
@end

@implementation HDDeviceKeyValueStoreServer

- (HDDeviceKeyValueStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDDeviceKeyValueStoreServer;
  v11 = [(HDStandardTaskServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    configuration = v11->_configuration;
    v11->_configuration = (HKDeviceKeyValueStoreTaskConfiguration *)v12;
  }
  return v11;
}

- (void)dealloc
{
  v3 = [(HDStandardTaskServer *)self profile];
  v4 = [v3 deviceKeyValueStoreManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HDDeviceKeyValueStoreServer;
  [(HDDeviceKeyValueStoreServer *)&v5 dealloc];
}

- (void)remote_fetchEntriesForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 completion:(id)a6
{
  id v10 = (void (**)(id, void *, void))a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [(HDStandardTaskServer *)self profile];
  v14 = [v13 deviceKeyValueStoreManager];
  id v18 = 0;
  objc_super v15 = [v14 fetchEntriesForDomain:v12 key:v11 protectionCategory:a5 error:&v18];

  id v16 = v18;
  if (v15)
  {
    v17 = -[HDDeviceKeyValueStoreServer _storageGroupForGroup:]((uint64_t)self, v15);
    v10[2](v10, v17, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v10)[2](v10, 0, v16);
  }
}

- (id)_storageGroupForGroup:(uint64_t)a1
{
  v3 = 0;
  if (a1 && a2)
  {
    var28[0] = MEMORY[0x1E4F143A8];
    var28[1] = 3221225472;
    var28[2] = __53__HDDeviceKeyValueStoreServer__storageGroupForGroup___block_invoke;
    var28[3] = &unk_1E630D9E0;
    var28[4] = a1;
    v3 = objc_msgSend(a2, "hk_map:", var28);
    uint64_t v2 = var28[6];
  }
  return v3;
}

- (void)remote_mostRecentEntryForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 completion:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = (void (**)(id, void *, void))a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [(HDStandardTaskServer *)self profile];
  v14 = [v13 deviceKeyValueStoreManager];
  id v20 = 0;
  objc_super v15 = [v14 mostRecentEntryForDomain:v12 key:v11 protectionCategory:a5 error:&v20];

  id v16 = v20;
  if (v15)
  {
    v21[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v18 = -[HDDeviceKeyValueStoreServer _storageGroupForGroup:]((uint64_t)self, v17);
    v19 = [v18 firstObject];
    v10[2](v10, v19, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v10)[2](v10, 0, v16);
  }
}

- (void)remote_setNumber:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  id v12 = (void (**)(id, uint64_t, id))a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(HDStandardTaskServer *)self profile];
  v17 = [v16 deviceKeyValueStoreManager];
  id v20 = 0;
  uint64_t v18 = [v17 setNumber:v15 forKey:v14 domainName:v13 protectionCategory:a6 error:&v20];

  id v19 = v20;
  v12[2](v12, v18, v19);
}

- (void)remote_setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  id v12 = (void (**)(id, uint64_t, id))a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(HDStandardTaskServer *)self profile];
  v17 = [v16 deviceKeyValueStoreManager];
  id v20 = 0;
  uint64_t v18 = [v17 setData:v15 forKey:v14 domainName:v13 protectionCategory:a6 error:&v20];

  id v19 = v20;
  v12[2](v12, v18, v19);
}

- (void)remote_setDate:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  id v12 = (void (**)(id, uint64_t, id))a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(HDStandardTaskServer *)self profile];
  v17 = [v16 deviceKeyValueStoreManager];
  id v20 = 0;
  uint64_t v18 = [v17 setDate:v15 forKey:v14 domainName:v13 protectionCategory:a6 error:&v20];

  id v19 = v20;
  v12[2](v12, v18, v19);
}

- (void)remote_setString:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  id v12 = (void (**)(id, uint64_t, id))a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(HDStandardTaskServer *)self profile];
  v17 = [v16 deviceKeyValueStoreManager];
  id v20 = 0;
  uint64_t v18 = [v17 setString:v15 forKey:v14 domainName:v13 protectionCategory:a6 error:&v20];

  id v19 = v20;
  v12[2](v12, v18, v19);
}

- (void)remote_startObservingDeviceKeyValueStoreWithCompletion:(id)a3
{
  v6 = (void (**)(id, uint64_t, void))a3;
  v4 = [(HDStandardTaskServer *)self profile];
  objc_super v5 = [v4 deviceKeyValueStoreManager];
  [v5 addObserver:self];

  v6[2](v6, 1, 0);
}

id __53__HDDeviceKeyValueStoreServer__storageGroupForGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) profile];
  objc_super v5 = [v4 syncIdentityManager];
  v6 = [v5 currentSyncIdentity];
  v7 = [v6 identity];

  id v24 = objc_alloc(MEMORY[0x1E4F2AF00]);
  v26 = [v3 deviceContext];
  uint64_t v23 = [v26 type];
  v25 = [v3 deviceContext];
  v8 = [v25 syncIdentity];
  v27 = v7;
  uint64_t v9 = [v7 isEqual:v8];
  id v10 = [v3 deviceContext];
  id v11 = [v10 productTypeName];
  id v12 = [v3 deviceContext];
  id v13 = [v12 currentOSName];
  id v14 = [v3 deviceContext];
  id v15 = v14;
  if (v14) {
    [v14 currentOSVersion];
  }
  else {
    memset(v28, 0, sizeof(v28));
  }
  id v16 = [v3 deviceContext];
  v17 = [v16 modificationDate];
  uint64_t v18 = (void *)[v24 initWithType:v23 localDevice:v9 productTypeName:v11 currentOSName:v13 currentOSVersion:v28 modificationDate:v17];

  id v19 = [v3 storageEntries];
  id v20 = objc_msgSend(v19, "hk_map:", &__block_literal_global_238);

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F2AF18]) initWithDeviceContext:v18 storageEntries:v20];

  return v21;
}

id __53__HDDeviceKeyValueStoreServer__storageGroupForGroup___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F2AF10];
  id v3 = a2;
  id v4 = [v2 alloc];
  objc_super v5 = [v3 domain];
  v6 = [v3 key];
  v7 = [v3 value];
  v8 = [v3 modificationDate];

  uint64_t v9 = (void *)[v4 initWithDomain:v5 key:v6 value:v7 modificationDate:v8];

  return v9;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F299C8];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  return [a3 hasRequiredArrayEntitlement:*MEMORY[0x1E4F2A558] containing:*MEMORY[0x1E4F29B00] error:a4];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  v6 = [a3 domain];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Missing domain for the Key Value Store");
  }
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AF20] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AF20] clientInterface];
}

- (void)connectionInvalidated
{
  id v4 = [(HDStandardTaskServer *)self profile];
  id v3 = [v4 deviceKeyValueStoreManager];
  [v3 removeObserver:self];
}

- (void)deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3 domain:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HDDeviceKeyValueStoreServer_deviceKeyValueStoreDidUpdateForStorageGroup_domain___block_invoke;
  v15[3] = &unk_1E630DA08;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  id v10 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v15];
  id v11 = [(HKDeviceKeyValueStoreTaskConfiguration *)self->_configuration domain];
  int v12 = [v11 isEqual:v9];

  if (v12)
  {
    _HKInitializeLogging();
    id v13 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v9;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, "%{public}@: Notify client of domain %{public}@ updated device key value pairs for storageGroup %{public}@", buf, 0x20u);
    }
    id v14 = -[HDDeviceKeyValueStoreServer _storageGroupForGroup:]((uint64_t)self, v8);
    objc_msgSend(v10, "clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup:", v14);
  }
}

void __82__HDDeviceKeyValueStoreServer_deviceKeyValueStoreDidUpdateForStorageGroup_domain___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client domain %{public}@ for updated device key value pairs for storageGroup %{public}@: %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void).cxx_destruct
{
}

@end