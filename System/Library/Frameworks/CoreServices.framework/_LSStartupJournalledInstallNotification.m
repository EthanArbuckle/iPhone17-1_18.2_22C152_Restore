@interface _LSStartupJournalledInstallNotification
- (BOOL)plugins;
- (NSArray)proxies;
- (_LSStartupJournalledInstallNotification)initWithNotification:(int)a3 appProxies:(id)a4 plugins:(BOOL)a5;
- (int)notification;
- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4;
@end

@implementation _LSStartupJournalledInstallNotification

- (_LSStartupJournalledInstallNotification)initWithNotification:(int)a3 appProxies:(id)a4 plugins:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_LSStartupJournalledInstallNotification;
  v9 = [(_LSStartupJournalledInstallNotification *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_notification = a3;
    uint64_t v11 = [v8 copy];
    proxies = v10->_proxies;
    v10->_proxies = (NSArray *)v11;

    v10->_plugins = a5;
  }

  return v10;
}

- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = _LSProgressLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(_LSStartupJournalledInstallNotification *)self notification];
    v10 = [(_LSStartupJournalledInstallNotification *)self proxies];
    int v13 = 134218242;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_INFO, "Sending notification %lu for proxies %@ to observer.", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(_LSStartupJournalledInstallNotification *)self notification];
  v12 = [(_LSStartupJournalledInstallNotification *)self proxies];
  [v6 directlySendNotification:v11 withProxies:v12 toObserver:v7];
}

- (int)notification
{
  return self->_notification;
}

- (NSArray)proxies
{
  return self->_proxies;
}

- (BOOL)plugins
{
  return self->_plugins;
}

- (void).cxx_destruct
{
}

@end