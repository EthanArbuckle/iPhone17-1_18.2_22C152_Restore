@interface EMDaemonBooster
+ (OS_os_log)log;
- (EMDaemonBooster)initWithConnection:(id)a3 description:(id)a4;
- (EMRemoteConnection)connection;
- (NSProgress)remoteBoost;
- (NSString)loggingDescription;
- (id)_newRemoteBoost;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setLoggingDescription:(id)a3;
- (void)setRemoteBoost:(id)a3;
@end

@implementation EMDaemonBooster

- (EMDaemonBooster)initWithConnection:(id)a3 description:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)EMDaemonBooster;
  v9 = [(EMDaemonBooster *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_loggingDescription, a4);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    uint64_t v11 = [(EMDaemonBooster *)v10 _newRemoteBoost];
    remoteBoost = v10->_remoteBoost;
    v10->_remoteBoost = (NSProgress *)v11;

    connection = v10->_connection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__EMDaemonBooster_initWithConnection_description___block_invoke;
    v18[3] = &unk_1E63E2688;
    objc_copyWeak(&v19, &location);
    [(EMRemoteConnection *)connection addResetHandler:v18];
    v14 = v10->_connection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__EMDaemonBooster_initWithConnection_description___block_invoke_2;
    v16[3] = &unk_1E63E2688;
    objc_copyWeak(&v17, &location);
    [(EMRemoteConnection *)v14 addRecoveryHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)_newRemoteBoost
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(EMDaemonBooster *)self connection];
  v4 = [v3 remoteObjectProxy];

  v5 = [(EMDaemonBooster *)self loggingDescription];
  v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = self;
    __int16 v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "%ld: Acquired Daemon Boost for: %{public}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__EMDaemonBooster__newRemoteBoost__block_invoke;
  v11[3] = &unk_1E63E3088;
  v12 = v6;
  v14 = self;
  id v7 = v5;
  id v13 = v7;
  id v8 = v6;
  v9 = [v4 giveBoostWithCompletionBlock:v11];

  return v9;
}

- (NSString)loggingDescription
{
  return self->_loggingDescription;
}

- (EMRemoteConnection)connection
{
  return self->_connection;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__EMDaemonBooster_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1) {
    dispatch_once(&log_onceToken_10, block);
  }
  v2 = (void *)log_log_10;
  return (OS_os_log *)v2;
}

void __22__EMDaemonBooster_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;
}

void __50__EMDaemonBooster_initWithConnection_description___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = [WeakRetained remoteBoost];
  [v1 cancel];

  [WeakRetained setRemoteBoost:0];
}

void __50__EMDaemonBooster_initWithConnection_description___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = [WeakRetained remoteBoost];
  [v1 cancel];

  v2 = (void *)[WeakRetained _newRemoteBoost];
  [WeakRetained setRemoteBoost:v2];
}

void __34__EMDaemonBooster__newRemoteBoost__block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = a1[4];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[5];
    uint64_t v3 = a1[6];
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "%ld: Released Daemon Boost for: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)dealloc
{
  uint64_t v3 = [(EMDaemonBooster *)self remoteBoost];
  [v3 cancel];

  remoteBoost = self->_remoteBoost;
  self->_remoteBoost = 0;

  v5.receiver = self;
  v5.super_class = (Class)EMDaemonBooster;
  [(EMDaemonBooster *)&v5 dealloc];
}

- (void)setConnection:(id)a3
{
}

- (void)setLoggingDescription:(id)a3
{
}

- (NSProgress)remoteBoost
{
  return self->_remoteBoost;
}

- (void)setRemoteBoost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteBoost, 0);
  objc_storeStrong((id *)&self->_loggingDescription, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end