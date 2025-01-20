@interface SecKeychainRestoreBackup
@end

@implementation SecKeychainRestoreBackup

uint64_t ___SecKeychainRestoreBackup_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___SecKeychainRestoreBackup_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_14;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___SecKeychainRestoreBackup_block_invoke_2(void *a1, CFTypeRef *a2)
{
  if (gSecurityd && *(void *)(gSecurityd + 64))
  {
    uint64_t v4 = a1[4];
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, CFTypeRef *))(gSecurityd + 64);
    uint64_t v5 = SecSecurityClientGet();
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    return v10(v4, v5, v6, v7, a2);
  }
  else
  {
    uint64_t v9 = a1[4];
    SecSecurityClientGet();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 0x40000000;
    v11[2] = __data_client_data_data_to_error_request_block_invoke;
    v11[3] = &__block_descriptor_tmp_35_10260;
    v11[4] = v9;
    long long v12 = *(_OWORD *)(a1 + 5);
    return securityd_send_sync_and_do(0xAu, a2, (uint64_t)v11, 0);
  }
}

@end