@interface CFHTTPServerRequestCreateResponseMessage
@end

@implementation CFHTTPServerRequestCreateResponseMessage

void ___CFHTTPServerRequestCreateResponseMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  CFGetAllocator((CFTypeRef)(a2 - 16));
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
  }
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v6 = Instance;
  if (Instance)
  {
    Instance[1] = 0u;
    v6 = Instance + 1;
    Instance[18] = 0u;
    Instance[19] = 0u;
    Instance[16] = 0u;
    Instance[17] = 0u;
    Instance[14] = 0u;
    Instance[15] = 0u;
    Instance[12] = 0u;
    Instance[13] = 0u;
    Instance[10] = 0u;
    Instance[11] = 0u;
    Instance[8] = 0u;
    Instance[9] = 0u;
    Instance[6] = 0u;
    Instance[7] = 0u;
    Instance[4] = 0u;
    Instance[5] = 0u;
    Instance[2] = 0u;
    Instance[3] = 0u;
  }
  v7 = *(const void **)(a2 + 224);
  if (v7) {
    CFTypeRef v8 = CFRetain(v7);
  }
  else {
    CFTypeRef v8 = 0;
  }
  CFTypeRef cf = v8;
  HTTPMessage::HTTPMessage(v6, "httpresponse", v8);
  *(void *)v6 = &unk_1ECF9FD98;
  *((void *)v6 + 1) = &unk_1ECF9FE08;
  *((void *)v6 + 2) = &unk_1ECF9FE28;
  *((_DWORD *)v6 + 32) = v4 & 0x3FF;
  *((void *)v6 + 17) = 0;
  v6[10] = 0u;
  v6[11] = 0u;
  v6[12] = 0u;
  v6[13] = 0u;
  v6[14] = 0u;
  v6[15] = 0u;
  v6[16] = 0u;
  v6[17] = 0u;
  *((unsigned char *)v6 + 296) = 0;
  if (cf) {
    CFRelease(cf);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6 - 1;
}

@end