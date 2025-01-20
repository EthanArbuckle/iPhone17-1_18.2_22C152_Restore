@interface SecKeychainForceUpgradeIfNeeded
@end

@implementation SecKeychainForceUpgradeIfNeeded

void ___SecKeychainForceUpgradeIfNeeded_block_invoke_46(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4 = secLogObjForScope("xpc");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "upgradeIfNeeded result: %i", (uint8_t *)v5, 8u);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

void ___SecKeychainForceUpgradeIfNeeded_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "xpc: failure to obtain XPC proxy object for upgradeIfNeeded, %@", (uint8_t *)&v4, 0xCu);
  }
}

@end