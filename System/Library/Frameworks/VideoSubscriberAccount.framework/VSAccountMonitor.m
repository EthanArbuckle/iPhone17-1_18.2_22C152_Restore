@interface VSAccountMonitor
+ (id)sharedInstance;
- (ACMonitoredAccountStore)monitoredAccountStore;
- (VSAccountMonitor)init;
- (void)_sendNotification;
- (void)accountCredentialChanged:(id)a3;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)setMonitoredAccountStore:(id)a3;
@end

@implementation VSAccountMonitor

+ (id)sharedInstance
{
  if (sharedInstance___vs_lazy_init_predicate_1 != -1) {
    dispatch_once(&sharedInstance___vs_lazy_init_predicate_1, &__block_literal_global_46);
  }
  v2 = (void *)sharedInstance___vs_lazy_init_variable_1;

  return v2;
}

uint64_t __34__VSAccountMonitor_sharedInstance__block_invoke()
{
  sharedInstance___vs_lazy_init_variable_1 = objc_alloc_init(VSAccountMonitor);

  return MEMORY[0x1F41817F8]();
}

- (VSAccountMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSAccountMonitor;
  v2 = [(VSAccountMonitor *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F17890]];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F179E8]) initWithAccountTypes:v3 delegate:v2];
    monitoredAccountStore = v2->_monitoredAccountStore;
    v2->_monitoredAccountStore = (ACMonitoredAccountStore *)v4;

    [(ACMonitoredAccountStore *)v2->_monitoredAccountStore registerWithCompletion:&__block_literal_global_6];
  }
  return v2;
}

void __24__VSAccountMonitor_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - ACMonitoredAccountStore registration found accounts: %@ with error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_sendNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VSAccountMonitorAccountDidChange" object:0];
}

- (void)accountWasAdded:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountWasAdded: %@", (uint8_t *)&v6, 0xCu);
  }

  [(VSAccountMonitor *)self _sendNotification];
}

- (void)accountWasModified:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountWasModified: %@", (uint8_t *)&v6, 0xCu);
  }

  [(VSAccountMonitor *)self _sendNotification];
}

- (void)accountWasRemoved:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountWasRemoved: %@", (uint8_t *)&v6, 0xCu);
  }

  [(VSAccountMonitor *)self _sendNotification];
}

- (void)accountCredentialChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountCredentialChanged: %@", (uint8_t *)&v6, 0xCu);
  }

  [(VSAccountMonitor *)self _sendNotification];
}

- (ACMonitoredAccountStore)monitoredAccountStore
{
  return self->_monitoredAccountStore;
}

- (void)setMonitoredAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end