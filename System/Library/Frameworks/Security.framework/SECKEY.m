@interface SECKEY
@end

@implementation SECKEY

uint64_t ___SECKEY_LOG_block_invoke()
{
  _SECKEY_LOG_log = (uint64_t)os_log_create("com.apple.security", "seckey");

  return MEMORY[0x1F41817F8]();
}

uint64_t ___SECKEY_LOG_block_invoke_9313()
{
  _SECKEY_LOG_log_9310 = (uint64_t)os_log_create("com.apple.security", "seckey");

  return MEMORY[0x1F41817F8]();
}

uint64_t ___SECKEY_LOG_block_invoke_9736()
{
  _SECKEY_LOG_log_9733 = (uint64_t)os_log_create("com.apple.security", "seckey");

  return MEMORY[0x1F41817F8]();
}

uint64_t ___SECKEY_LOG_block_invoke_10980()
{
  _SECKEY_LOG_log_10977 = (uint64_t)os_log_create("com.apple.security", "seckey");

  return MEMORY[0x1F41817F8]();
}

uint64_t ___SECKEY_LOG_block_invoke_11773()
{
  _SECKEY_LOG_log_11770 = (uint64_t)os_log_create("com.apple.security", "seckey");

  return MEMORY[0x1F41817F8]();
}

@end