@interface SOSCCBailFromCircle
@end

@implementation SOSCCBailFromCircle

uint64_t __SOSCCBailFromCircle_BestEffort_block_invoke(uint64_t a1)
{
  if (gSecurityd && (v1 = *(uint64_t (**)(uint64_t, uint64_t))(gSecurityd + 352)) != 0)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 32);
    return v1(v3, v2);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v5 = *(CFTypeRef **)(a1 + 40);
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __uint64_t_to_BOOL_error_request_block_invoke;
    v9[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v9[4] = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __uint64_t_to_BOOL_error_request_block_invoke_2;
    v8[3] = &unk_1E547F420;
    v8[4] = &v10;
    securityd_send_sync_and_do(0x3Cu, v5, (uint64_t)v9, (uint64_t)v8);
    uint64_t v7 = *((unsigned __int8 *)v11 + 24);
    _Block_object_dispose(&v10, 8);
    return v7;
  }
}

@end