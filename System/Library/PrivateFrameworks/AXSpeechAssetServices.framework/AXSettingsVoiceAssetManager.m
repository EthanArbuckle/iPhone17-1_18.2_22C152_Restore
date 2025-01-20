@interface AXSettingsVoiceAssetManager
+ (id)sharedInstance;
- (BOOL)allowedToDownloadVoiceAssets;
- (void)_updateAllowedToDownload;
- (void)dealloc;
@end

@implementation AXSettingsVoiceAssetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_Manager;

  return v2;
}

uint64_t __45__AXSettingsVoiceAssetManager_sharedInstance__block_invoke()
{
  sharedInstance_Manager = objc_alloc_init(AXSettingsVoiceAssetManager);

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    v4 = self->_reachability;
    if (v4)
    {
      CFRelease(v4);
      self->_reachability = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AXSettingsVoiceAssetManager;
  [(AXSettingsVoiceAssetManager *)&v5 dealloc];
}

- (void)_updateAllowedToDownload
{
  AllowedToDownloadIsSet = 0;
}

- (BOOL)allowedToDownloadVoiceAssets
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (AllowedToDownloadIsSet == 1)
  {
    int v2 = AllowedToDownload;
    return v2 != 0;
  }
  reachability = self->_reachability;
  if (reachability)
  {
    *(_DWORD *)&address.sa_len = 0;
  }
  else
  {
    sockaddr address = (sockaddr)xmmword_222E477F0;
    objc_super v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    self->_reachability = v5;
    v9.version = 0;
    v9.info = self;
    v9.retain = 0;
    v9.release = 0;
    v9.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x263EFF380];
    SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)__ReachabilityCallback_0, &v9);
    SCNetworkReachabilitySetDispatchQueue(self->_reachability, MEMORY[0x263EF83A0]);
    reachability = self->_reachability;
    *(_DWORD *)&address.sa_len = 0;
    if (!reachability)
    {
      unsigned int v6 = 0;
      goto LABEL_7;
    }
  }
  SCNetworkReachabilityGetFlags(reachability, (SCNetworkReachabilityFlags *)&address.sa_len);
  unsigned int v6 = *(_DWORD *)&address.sa_len;
LABEL_7:
  v7 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(v9.version) = 67109120;
    HIDWORD(v9.version) = (v6 >> 1) & 1;
    _os_log_impl(&dword_222E44000, v7, OS_LOG_TYPE_INFO, "PREMIUM: Is reachable: %d", (uint8_t *)&v9, 8u);
  }

  AllowedToDownload = (v6 & 2) != 0;
  AllowedToDownloadIsSet = 1;
  int v2 = v6 & 2;
  return v2 != 0;
}

@end