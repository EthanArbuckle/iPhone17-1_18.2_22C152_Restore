@interface MPHomeMonitor
+ (BOOL)isCurrentDeviceValidHomeAccessory;
+ (MPHomeMonitor)sharedMonitor;
+ (void)setupIfNecessary;
- (BOOL)isSoundCheckEnabled;
- (MPHomeMonitor)init;
- (void)_postNotificationWithName:(id)a3;
- (void)currentHomeDidChange;
- (void)currentUserDidChange;
- (void)homeUsersDidChange;
- (void)setSoundCheckEnabled:(BOOL)a3;
- (void)soundCheckSettingDidUpdate:(BOOL)a3;
@end

@implementation MPHomeMonitor

+ (BOOL)isCurrentDeviceValidHomeAccessory
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
    char v4 = [v3 isAudioAccessory];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)soundCheckSettingDidUpdate:(BOOL)a3
{
}

- (void)homeUsersDidChange
{
}

- (void)currentUserDidChange
{
}

- (void)currentHomeDidChange
{
}

- (void)_postNotificationWithName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<MPHomeMonitor %p> Posting Notification: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:v4 object:self];
}

- (void)setSoundCheckEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[MPHomeManagerObserver sharedObserver];
  [v4 setSoundCheckEnabled:v3];
}

- (BOOL)isSoundCheckEnabled
{
  int v2 = +[MPHomeManagerObserver sharedObserver];
  char v3 = [v2 isSoundCheckEnabled];

  return v3;
}

- (MPHomeMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPHomeMonitor;
  int v2 = [(MPHomeMonitor *)&v7 init];
  if (v2)
  {
    char v3 = +[MPHomeManagerObserver sharedObserver];
    [v3 setDelegate:v2];

    if (!+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
    {
      id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_FAULT, "MPHomeMonitor initialized for non-valid accessory", v6, 2u);
      }
    }
  }
  return v2;
}

+ (MPHomeMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_51193);
  }
  int v2 = (void *)sharedMonitor___sharedMonitor;

  return (MPHomeMonitor *)v2;
}

void __30__MPHomeMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(MPHomeMonitor);
  v1 = (void *)sharedMonitor___sharedMonitor;
  sharedMonitor___sharedMonitor = (uint64_t)v0;
}

+ (void)setupIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
  {
    int v2 = +[MPHomeMonitor sharedMonitor];
    char v3 = +[MPHomeManagerObserver sharedObserver];
    id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [v3 setupDidComplete];
      v6 = @"Setting up";
      if (v5) {
        v6 = @"Setup complete";
      }
      int v7 = 134218242;
      v8 = v2;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeMonitor setupIfNecessary:] <MPHomeMonitor %p> %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    int v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeMonitor setupIfNecessary:] Ignoring - Device is not valid home accessory", (uint8_t *)&v7, 2u);
    }
  }
}

@end