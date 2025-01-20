@interface ATXCloudStorageSettingsListener
+ (ATXCloudStorageSettingsListener)sharedInstance;
+ (BOOL)isBackupForContactsEnabled;
+ (BOOL)isBackupForSiriEnabled;
- (ATXCloudStorageSettingsDelegate)delegate;
- (ATXCloudStorageSettingsListener)init;
- (void)handleBackupPreferencesDidChange;
- (void)handleDeleteDataRequest;
- (void)registerForCloudStorageDeletedByUserNotification;
- (void)registerForCloudStorageSettingsNotifications;
- (void)registerForCloudSyncPreferenceDidChangeNotification;
- (void)setDelegate:(id)a3;
@end

@implementation ATXCloudStorageSettingsListener

+ (ATXCloudStorageSettingsListener)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ATXCloudStorageSettingsListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance_instance_0;
  return (ATXCloudStorageSettingsListener *)v2;
}

uint64_t __49__ATXCloudStorageSettingsListener_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (ATXCloudStorageSettingsListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXCloudStorageSettingsListener;
  uint64_t v2 = [(ATXCloudStorageSettingsListener *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ATXCloudStorageSettingsListener *)v2 registerForCloudStorageSettingsNotifications];
  }
  return v3;
}

- (void)registerForCloudStorageSettingsNotifications
{
  [(ATXCloudStorageSettingsListener *)self registerForCloudSyncPreferenceDidChangeNotification];
  [(ATXCloudStorageSettingsListener *)self registerForCloudStorageDeletedByUserNotification];
}

- (void)registerForCloudStorageDeletedByUserNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleDeleteDataRequest name:@"com.apple.siri.cloud.storage.deleted" object:0];
}

- (void)registerForCloudSyncPreferenceDidChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleBackupPreferencesDidChange name:@"com.apple.siri.cloud.synch.changed" object:0];
}

- (void)handleDeleteDataRequest
{
}

- (void)handleBackupPreferencesDidChange
{
  if (([(id)objc_opt_class() isBackupForSiriEnabled] & 1) == 0)
  {
    [(ATXCloudStorageSettingsListener *)self handleDeleteDataRequest];
  }
}

+ (BOOL)isBackupForSiriEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  char v4 = [v3 isEnabledForDataclass:*MEMORY[0x1E4F17630]];

  return v4;
}

+ (BOOL)isBackupForContactsEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  char v4 = [v3 isEnabledForDataclass:*MEMORY[0x1E4F17A90]];

  return v4;
}

- (ATXCloudStorageSettingsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end