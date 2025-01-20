@interface LA
@end

@implementation LA

uint64_t __LA_LOG_LAUIAuthenticationView_block_invoke()
{
  LA_LOG_LAUIAuthenticationView_log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "LAUIAuthenticationView");
  return MEMORY[0x270F9A758]();
}

uint64_t __LA_LOG_LAUIPKGlyphWrapper_block_invoke()
{
  LA_LOG_LAUIPKGlyphWrapper_log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "LAUIPKGlyphWrapper");
  return MEMORY[0x270F9A758]();
}

uint64_t __LA_LOG_LAUIAuthenticationCore_block_invoke()
{
  LA_LOG_LAUIAuthenticationCore_log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "LAUIAuthenticationCore");
  return MEMORY[0x270F9A758]();
}

@end