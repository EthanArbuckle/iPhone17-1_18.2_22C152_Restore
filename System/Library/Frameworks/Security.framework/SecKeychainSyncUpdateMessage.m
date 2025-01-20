@interface SecKeychainSyncUpdateMessage
@end

@implementation SecKeychainSyncUpdateMessage

CFTypeRef ___SecKeychainSyncUpdateMessage_block_invoke(void *a1)
{
  if (gSecurityd && (v2 = *(uint64_t (**)(void, void))(gSecurityd + 504)) != 0)
  {
    CFTypeRef result = (CFTypeRef)v2(a1[5], a1[6]);
  }
  else
  {
    uint64_t v4 = a1[5];
    v5 = (CFTypeRef *)a1[6];
    CFTypeRef cf = 0;
    int v6 = cftype_to_BOOL_cftype_error_request(0x12u, v4, (uint64_t)&cf, v5);
    CFTypeRef result = cf;
    if (v6)
    {
      if (!cf || (v7 = CFGetTypeID(cf), TypeID = CFArrayGetTypeID(), CFTypeRef result = cf, v7 != TypeID))
      {
        SecError(-4, (__CFString **)v5, @"Unexpected nonarray returned: %@", result);
        CFTypeRef result = cf;
        if (cf)
        {
          CFTypeRef cf = 0;
          CFRelease(result);
          CFTypeRef result = cf;
        }
      }
    }
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

@end