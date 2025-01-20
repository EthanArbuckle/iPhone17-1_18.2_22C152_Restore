@interface IMDSyncedSettingsServiceManager
- (IMDSyncedSettingsServiceManager)init;
- (IMDSyncedSettingsServiceManager)initWithLocalDomain:(id)a3 remoteDomain:(id)a4 localStorageDelegate:(id)a5 remoteStorageDelegate:(id)a6;
- (IMDSyncedSettingsServiceManager_Impl)impl;
- (id)settingValueForKey:(int64_t)a3;
- (void)setSettingValue:(id)a3 forKey:(int64_t)a4;
@end

@implementation IMDSyncedSettingsServiceManager

- (IMDSyncedSettingsServiceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDSyncedSettingsServiceManager;
  v2 = [(IMDSyncedSettingsServiceManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IMDSyncedSettingsServiceManager_Impl);
    impl = v2->_impl;
    v2->_impl = v3;
  }
  return v2;
}

- (IMDSyncedSettingsServiceManager)initWithLocalDomain:(id)a3 remoteDomain:(id)a4 localStorageDelegate:(id)a5 remoteStorageDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IMDSyncedSettingsServiceManager;
  v14 = [(IMDSyncedSettingsServiceManager *)&v18 init];
  if (v14)
  {
    v15 = [[IMDSyncedSettingsServiceManager_Impl alloc] initWithLocalDomain:v10 remoteDomain:v11 localStorageDelegate:v12 remoteStorageDelegate:v13];
    impl = v14->_impl;
    v14->_impl = v15;
  }
  return v14;
}

- (id)settingValueForKey:(int64_t)a3
{
  return [(IMDSyncedSettingsServiceManager_Impl *)self->_impl settingValueForKey:a3];
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
}

- (IMDSyncedSettingsServiceManager_Impl)impl
{
  return (IMDSyncedSettingsServiceManager_Impl *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end