@interface SOSCCTryUserCredentialsAndDSID
@end

@implementation SOSCCTryUserCredentialsAndDSID

uint64_t __SOSCCTryUserCredentialsAndDSID_internal_block_invoke(uint64_t a1)
{
  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(gSecurityd + 192);
    if (v1)
    {
      uint64_t v2 = *(void *)(a1 + 40);
      uint64_t v3 = *(void *)(a1 + 48);
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 32);
      return v1(v5, v2, v3, v4);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7)
  {
    SOSErrorCreate(1045, *(CFTypeRef **)(a1 + 56), 0, @"user_label is nil");
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    SOSErrorCreate(1045, *(CFTypeRef **)(a1 + 56), 0, @"user_password is nil");
    return 0;
  }
  v9 = *(CFTypeRef **)(a1 + 56);
  if (*(void *)(a1 + 48)) {
    v10 = *(__CFString **)(a1 + 48);
  }
  else {
    v10 = &stru_1ED84D0B0;
  }

  return label_and_password_and_dsid_to_BOOL_error_request(0x2Cu, v7, v8, (uint64_t)v10, v9);
}

@end