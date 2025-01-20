@interface LNInProcessConnection
- (BOOL)refreshWithOptions:(id)a3;
- (LNInProcessConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8;
- (id)connectionInterface;
- (void)acquireAssertionsForConnectionOperation:(id)a3;
- (void)connectWithOptions:(id)a3;
@end

@implementation LNInProcessConnection

- (void).cxx_destruct
{
}

- (void)acquireAssertionsForConnectionOperation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(LNConnection *)self logPrefix];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ Assertion is not required for in-process connection", (uint8_t *)&v7, 0xCu);
  }
}

- (id)connectionInterface
{
  connectionInterface = self->_connectionInterface;
  if (connectionInterface)
  {
    v3 = connectionInterface;
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v5 = (void *)getLNAppContextClass_softClass;
    uint64_t v23 = getLNAppContextClass_softClass;
    if (!getLNAppContextClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getLNAppContextClass_block_invoke;
      v18 = &unk_1E5B39E50;
      v19 = &v20;
      __getLNAppContextClass_block_invoke((uint64_t)&v15);
      v5 = (void *)v21[3];
    }
    v6 = v5;
    _Block_object_dispose(&v20, 8);
    id v7 = objc_alloc_init(v6);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v8 = (void *)getLNClientConnectionClass_softClass;
    uint64_t v23 = getLNClientConnectionClass_softClass;
    if (!getLNClientConnectionClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getLNClientConnectionClass_block_invoke;
      v18 = &unk_1E5B39E50;
      v19 = &v20;
      __getLNClientConnectionClass_block_invoke((uint64_t)&v15);
      v8 = (void *)v21[3];
    }
    uint64_t v9 = v8;
    _Block_object_dispose(&v20, 8);
    id v10 = [v9 alloc];
    v11 = [(LNConnection *)self queue];
    v12 = (LNConnectionHostInterface *)[v10 initWithConnection:0 connectionListener:0 queue:v11 appContext:v7];
    v13 = self->_connectionInterface;
    self->_connectionInterface = v12;

    v3 = self->_connectionInterface;
  }
  return v3;
}

- (BOOL)refreshWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNInProcessConnection;
  BOOL v4 = [(LNConnection *)&v6 refreshWithOptions:a3];
  if (v4) {
    [(LNConnection *)self setConnected];
  }
  return v4;
}

- (void)connectWithOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LNInProcessConnection;
  [(LNConnection *)&v4 connectWithOptions:a3];
  [(LNConnection *)self setConnected];
}

- (LNInProcessConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8
{
  v16.receiver = self;
  v16.super_class = (Class)LNInProcessConnection;
  v8 = [(LNConnection *)&v16 initWithEffectiveBundleIdentifier:a3 appBundleIdentifier:a4 processInstanceIdentifier:a5 appIntentsEnabledOnly:a6 userIdentity:a7 error:a8];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28F80] processInfo];
    id v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "if_auditToken");
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }
    v13[0] = v14;
    v13[1] = v15;
    [(LNConnection *)v8 setAuditToken:v13];

    v11 = v8;
  }

  return v8;
}

@end