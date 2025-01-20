@interface WKAttributedStringWebViewCache
@end

@implementation WKAttributedStringWebViewCache

uint64_t __58___WKAttributedStringWebViewCache_retrieveOrCreateWebView__block_invoke(WTF::MemoryPressureHandler *a1)
{
  uint64_t v2 = WTF::MemoryPressureHandler::singleton(a1);
  uint64_t v3 = *((void *)a1 + 4);
  v4 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v4 = &unk_1EE9C2358;
  v4[1] = v3;
  uint64_t result = *(void *)(v2 + 48);
  *(void *)(v2 + 48) = v4;
  if (result)
  {
    v6 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v6();
  }
  return result;
}

@end