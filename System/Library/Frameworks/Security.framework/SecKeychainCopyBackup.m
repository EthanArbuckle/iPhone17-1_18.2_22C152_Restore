@interface SecKeychainCopyBackup
@end

@implementation SecKeychainCopyBackup

uint64_t ___SecKeychainCopyBackup_block_invoke(void *a1)
{
  if (gSecurityd && (v2 = *(uint64_t (**)(uint64_t, void, void, void, void))(gSecurityd + 56)) != 0)
  {
    uint64_t v3 = SecSecurityClientGet();
    uint64_t result = v2(v3, a1[5], a1[6], 0, 0);
  }
  else
  {
    SecSecurityClientGet();
    uint64_t result = client_data_data_BOOL_to_data_error_request(a1[5], a1[6], 0);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

@end