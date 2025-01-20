@interface HDStandardTaskServer
+ (NSString)taskIdentifier;
+ (id)requiredEntitlements;
- (HDHealthStoreClient)client;
- (HDProfile)profile;
- (HDStandardTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HDTaskServerDelegate)delegate;
- (NSUUID)taskUUID;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)remote_unitTesting_createTaskServerNoOpWithCompletion:(id)a3;
@end

@implementation HDStandardTaskServer

+ (NSString)taskIdentifier
{
  return (NSString *)@"<INVALID>";
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (HDStandardTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDStandardTaskServer;
  v12 = [(HDStandardTaskServer *)&v18 init];
  if (v12)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, "%{public}@: Initialized for task %{public}@.", buf, 0x16u);
    }
    uint64_t v14 = [v9 copy];
    taskUUID = v12->_taskUUID;
    v12->_taskUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v12->_client, a5);
    v16 = [v10 profile];
    objc_storeWeak((id *)&v12->_profile, v16);

    objc_storeWeak((id *)&v12->_delegate, v11);
  }

  return v12;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HDStandardTaskServer *)self client];
  v6 = [v5 connection];
  v7 = [v6 remoteObjectProxyWithErrorHandler:v4];

  return v7;
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return 0;
}

- (void)remote_unitTesting_createTaskServerNoOpWithCompletion:(id)a3
{
  if (_HDIsUnitTesting)
  {
    v3 = (void (*)(void))*((void *)a3 + 2);
    id v9 = a3;
    v3();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F28B00];
    v7 = (void (**)(id, void))a3;
    v8 = [v6 currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HDStandardTaskServer.m" lineNumber:78 description:@"This method can only be called while unit testing"];

    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"This method can only be called while unit testing");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0);
  }
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HDTaskServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDTaskServerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end