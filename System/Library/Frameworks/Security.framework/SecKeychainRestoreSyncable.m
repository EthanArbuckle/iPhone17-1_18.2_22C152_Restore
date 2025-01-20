@interface SecKeychainRestoreSyncable
@end

@implementation SecKeychainRestoreSyncable

uint64_t ___SecKeychainRestoreSyncable_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___SecKeychainRestoreSyncable_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_21_10278;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___SecKeychainRestoreSyncable_block_invoke_2(void *a1, CFTypeRef *a2)
{
  if (gSecurityd && (v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(gSecurityd + 128)) != 0)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[4];
    return v3(v6, v4, v5, a2);
  }
  else
  {
    uint64_t v8 = a1[6];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 0x40000000;
    v9[2] = __dict_data_data_to_error_request_block_invoke;
    v9[3] = &__block_descriptor_tmp_41_10279;
    long long v10 = *((_OWORD *)a1 + 2);
    uint64_t v11 = v8;
    return securityd_send_sync_and_do(0xCu, a2, (uint64_t)v9, 0);
  }
}

@end