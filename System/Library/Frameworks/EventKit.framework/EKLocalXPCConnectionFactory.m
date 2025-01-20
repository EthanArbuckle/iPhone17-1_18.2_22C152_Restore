@interface EKLocalXPCConnectionFactory
- (EKLocalXPCConnectionFactory)init;
- (EKLocalXPCConnectionFactory)initWithTCCPermissionChecker:(id)a3;
- (id)tryNewConnectionWithExportedObject:(id)a3 interruptionHandler:(id)a4;
@end

@implementation EKLocalXPCConnectionFactory

void __86__EKLocalXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 releaseProxy];
}

- (void).cxx_destruct
{
}

- (id)tryNewConnectionWithExportedObject:(id)a3 interruptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F57818]) initWithWrappedObject:v6];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F569A0]) initWithRemoteObject:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F56A30]) initWithXPCConnection:v9 tccPermissionChecker:self->_tccPermissionChecker];
  id v11 = objc_alloc(MEMORY[0x1E4F569A0]);
  v12 = [v10 cadOperationProxy];
  v13 = (void *)[v11 initWithRemoteObject:v12];

  objc_initWeak(&location, v9);
  objc_initWeak(&from, v10);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __86__EKLocalXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke;
  v18 = &unk_1E5B97240;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  [v13 setInvalidationHandler:&v15];
  objc_msgSend(v9, "resume", v15, v16, v17, v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

- (EKLocalXPCConnectionFactory)initWithTCCPermissionChecker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKLocalXPCConnectionFactory;
  id v6 = [(EKLocalXPCConnectionFactory *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tccPermissionChecker, a3);
  }

  return v7;
}

- (EKLocalXPCConnectionFactory)init
{
  id v3 = objc_opt_new();
  v4 = [(EKLocalXPCConnectionFactory *)self initWithTCCPermissionChecker:v3];

  return v4;
}

@end