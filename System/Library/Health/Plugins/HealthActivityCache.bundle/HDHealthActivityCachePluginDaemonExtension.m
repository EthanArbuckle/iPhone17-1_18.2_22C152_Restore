@interface HDHealthActivityCachePluginDaemonExtension
- (HDDaemon)daemon;
- (HDHealthActivityCachePluginDaemonExtension)initWithDaemon:(id)a3;
@end

@implementation HDHealthActivityCachePluginDaemonExtension

- (HDHealthActivityCachePluginDaemonExtension)initWithDaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHealthActivityCachePluginDaemonExtension;
  v5 = [(HDHealthActivityCachePluginDaemonExtension *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_daemon, v4);
  }

  return v6;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end