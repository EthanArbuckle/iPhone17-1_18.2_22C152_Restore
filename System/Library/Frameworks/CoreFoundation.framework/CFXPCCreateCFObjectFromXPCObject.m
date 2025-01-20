@interface CFXPCCreateCFObjectFromXPCObject
@end

@implementation CFXPCCreateCFObjectFromXPCObject

BOOL ___CFXPCCreateCFObjectFromXPCObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject(a3);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void *)(v6 + 24);
    *(void *)(v6 + 24) = v7 + 1;
    *(void *)(v5 + 8 * v7) = v4;
  }
  return v4 != 0;
}

uint64_t ___CFXPCCreateCFObjectFromXPCObject_block_invoke_2(void *a1, const char *a2, uint64_t a3)
{
  uint64_t result = _CFXPCCreateCFObjectFromXPCObject(a3);
  if (result)
  {
    uint64_t v6 = (const void *)result;
    CFStringRef v7 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, a2, 0x8000100u);
    if (v7)
    {
      *(void *)(a1[5] + 8 * *(void *)(*(void *)(a1[4] + 8) + 24)) = v7;
      uint64_t v9 = a1[5];
      uint64_t v8 = a1[6];
      uint64_t v10 = *(void *)(a1[4] + 8);
      uint64_t v11 = *(void *)(v10 + 24);
      *(void *)(v10 + 24) = v11 + 1;
      *(void *)(v9 + 8 * (v11 + v8)) = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

@end