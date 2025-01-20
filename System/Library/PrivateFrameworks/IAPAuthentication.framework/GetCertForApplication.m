@interface GetCertForApplication
@end

@implementation GetCertForApplication

void ___GetCertForApplication_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x23ECA9E00](a2) == MEMORY[0x263EF8708])
  {
    size_t length = 0;
    xpc_dictionary_get_data(a2, "certData", &length);
    if (length)
    {
      syslog(4, "%s:%s-%d got data from authd, len=%d\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_GetCertForApplication_block_invoke", 297, length);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SecCertificateCreateWithBytes();
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        syslog(4, "cert created!\n", v8, v9, v10);
      }
      else {
        syslog(4, "cert FAILED!\n");
      }
    }
    else
    {
      syslog(4, "%s:%s-%d len is 0!\n");
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(const void **)(*(void *)(v4 + 8) + 24);
  if (v5)
  {
    CFRetain(v5);
    uint64_t v4 = *(void *)(a1 + 40);
  }
  v6 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___GetCertForApplication_block_invoke_2;
  block[3] = &unk_264DB5220;
  block[4] = *(void *)(a1 + 32);
  block[5] = v4;
  dispatch_async(v6, block);
  v7 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v7) {
    CFRelease(v7);
  }
  xpc_release(*(xpc_object_t *)(a1 + 56));
}

void ___GetCertForApplication_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
  }
}

@end