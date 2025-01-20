@interface ACDKeychainLogSystem
@end

@implementation ACDKeychainLogSystem

uint64_t ___ACDKeychainLogSystem_block_invoke()
{
  _ACDKeychainLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "keychain");

  return MEMORY[0x270F9A758]();
}

@end