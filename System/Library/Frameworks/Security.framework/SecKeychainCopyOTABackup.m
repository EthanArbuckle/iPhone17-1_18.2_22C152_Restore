@interface SecKeychainCopyOTABackup
@end

@implementation SecKeychainCopyOTABackup

uint64_t ___SecKeychainCopyOTABackup_block_invoke(uint64_t a1)
{
  if (gSecurityd && (v2 = *(uint64_t (**)(uint64_t, void, void, void, void))(gSecurityd + 56)) != 0)
  {
    uint64_t v3 = SecSecurityClientGet();
    uint64_t result = v2(v3, 0, 0, 0, 0);
  }
  else
  {
    SecSecurityClientGet();
    uint64_t result = client_data_data_BOOL_to_data_error_request(0, 0, 0);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end