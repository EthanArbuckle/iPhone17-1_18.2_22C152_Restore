@interface SecSystemKeychainAlwaysIsEnabled
@end

@implementation SecSystemKeychainAlwaysIsEnabled

void ___SecSystemKeychainAlwaysIsEnabled_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _SecSystemKeychainAlwaysIsEnabled_ffSystemKeychainAlwaysSupported = _os_feature_enabled_impl();
  v0 = secLogObjForScope("keychain");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (_SecSystemKeychainAlwaysIsEnabled_ffSystemKeychainAlwaysSupported) {
      v1 = "enabled";
    }
    else {
      v1 = "disabled";
    }
    int v2 = 136315138;
    v3 = v1;
    _os_log_impl(&dword_18B299000, v0, OS_LOG_TYPE_DEFAULT, "System Keychain Always Supported set via feature flag to %s", (uint8_t *)&v2, 0xCu);
  }
}

@end