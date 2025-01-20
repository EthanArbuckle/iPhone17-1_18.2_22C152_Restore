@interface SODaemonKerberosSettingsManager
- (SODaemonKerberosSettingsManager)initWithConfigurationHost:(id)a3 settingsManager:(id)a4;
- (void)configurationChanged:(id)a3;
- (void)dealloc;
- (void)listenForConfigurationChanges;
- (void)saveKerberosValuesForPlugins;
@end

@implementation SODaemonKerberosSettingsManager

- (SODaemonKerberosSettingsManager)initWithConfigurationHost:(id)a3 settingsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SODaemonKerberosSettingsManager;
  v9 = [(SODaemonKerberosSettingsManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationHost, a3);
    objc_storeStrong((id *)&v10->_settingsManager, a4);
    v10->_observingConfigurationChanges = 0;
  }

  return v10;
}

- (void)listenForConfigurationChanges
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"configurationChanged:" name:SONotificationConfigurationChanged object:0];

  self->_observingConfigurationChanges = 1;
}

- (void)dealloc
{
  if (self->_observingConfigurationChanges)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)SODaemonKerberosSettingsManager;
  [(SODaemonKerberosSettingsManager *)&v4 dealloc];
}

- (void)configurationChanged:(id)a3
{
  objc_super v4 = sub_1000036A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[SODaemonKerberosSettingsManager configurationChanged:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v5 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000036FC;
  block[3] = &unk_1000103D8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)saveKerberosValuesForPlugins
{
  v3 = sub_1000036A8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[SODaemonKerberosSettingsManager saveKerberosValuesForPlugins]";
    __int16 v16 = 2112;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  [(SOKerberosSettingsManager *)self->_settingsManager createKerberosSettingsCache];
  objc_super v4 = [(SOConfigurationHost *)self->_configurationHost profilesWithExtensionBundleIdentifier:@"com.apple.AppSSOKerberos.KerberosExtension"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SOKerberosSettingsManager *)self->_settingsManager saveKerberosValuesForProfile:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_configurationHost, 0);
}

@end