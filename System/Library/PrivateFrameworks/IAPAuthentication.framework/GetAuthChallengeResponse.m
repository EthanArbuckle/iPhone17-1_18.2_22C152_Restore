@interface GetAuthChallengeResponse
@end

@implementation GetAuthChallengeResponse

void ___GetAuthChallengeResponse_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x23ECA9E00](a2) == MEMORY[0x263EF8708])
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2000000000;
    uint64_t v15 = 0;
    size_t length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(a2, "outData", &length);
    if (length)
    {
      v5 = data;
      syslog(4, "%s:%s-%d got data from authd, len=%d\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_GetAuthChallengeResponse_block_invoke", 563, length);
      CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, length);
      v13[3] = (uint64_t)v6;
      if (v6) {
        syslog(4, "%s:%s-%d iPod signature created!\n");
      }
      else {
        syslog(4, "%s:%s-%d iPod signature failed!\n");
      }
    }
    else
    {
      syslog(4, "%s:%s-%d len is 0!\n");
    }
    v7 = (const void *)v13[3];
    if (v7) {
      CFRetain(v7);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___GetAuthChallengeResponse_block_invoke_2;
    block[3] = &unk_264DB5270;
    v8 = *(NSObject **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    block[5] = &v12;
    dispatch_async(v8, block);
    xpc_release(*(xpc_object_t *)(a1 + 48));
    v9 = (const void *)v13[3];
    if (v9) {
      CFRelease(v9);
    }
    _Block_object_dispose(&v12, 8);
  }
}

void ___GetAuthChallengeResponse_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
  }
}

@end