@interface SIMStatusIndicator
- (CoreTelephonyClient)coreTelephonyClient;
- (OS_dispatch_queue)queue;
- (SIMStatusIndicator)init;
- (void)applicationContext;
- (void)callback;
- (void)createConnection;
- (void)setApplicationContext:(void *)a3;
- (void)setCallback:(void *)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation SIMStatusIndicator

- (SIMStatusIndicator)init
{
  v7.receiver = self;
  v7.super_class = (Class)SIMStatusIndicator;
  v2 = [(SIMStatusIndicator *)&v7 init];
  if (v2)
  {
    v3 = EAPLogGetLogHandle();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2106D5000, v3, v4, "SIMStatusIndicator initialized.", v6, 2u);
    }
  }
  return v2;
}

- (void)createConnection
{
  dispatch_queue_t v3 = dispatch_queue_create("SIM status indicator queue", 0);
  [(SIMStatusIndicator *)self setQueue:v3];

  id v4 = objc_alloc(MEMORY[0x263F02D30]);
  v5 = [(SIMStatusIndicator *)self queue];
  v6 = (void *)[v4 initWithQueue:v5];
  [(SIMStatusIndicator *)self setCoreTelephonyClient:v6];

  id v7 = [(SIMStatusIndicator *)self coreTelephonyClient];
  [v7 setDelegate:self];
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    uint64_t v7 = [v11 userDataPreferred];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [v11 userDataPreferred];
      int v10 = [v9 BOOLValue];

      if (v10)
      {
        if (([v6 isEqualToString:simStatusDidChange_status__lastStatus] & 1) == 0)
        {
          objc_storeStrong((id *)&simStatusDidChange_status__lastStatus, a4);
          ((void (*)(SIMStatusIndicator *, id, void *))[(SIMStatusIndicator *)self callback])(self, v6, [(SIMStatusIndicator *)self applicationContext]);
        }
      }
    }
  }
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(void *)a3
{
  self->_applicationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end