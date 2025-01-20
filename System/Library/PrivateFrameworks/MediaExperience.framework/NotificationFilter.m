@interface NotificationFilter
@end

@implementation NotificationFilter

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke(uint64_t a1)
{
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 64), *(const void **)(a1 + 40)))
  {
    v2 = *(const void **)(a1 + 40);
    v3 = *(__CFDictionary **)(*(void *)(a1 + 32) + 64);
    v4 = *(const void **)(a1 + 48);
    CFDictionarySetValue(v3, v2, v4);
  }
}

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke_2(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 32) + 56);
  v6.length = CFArrayGetCount(v2);
  v6.location = 0;
  if (CFArrayGetFirstIndexOfValue(v2, v6, *(const void **)(a1 + 40)) == -1)
  {
    v3 = *(const void **)(a1 + 40);
    v4 = *(__CFArray **)(*(void *)(a1 + 32) + 56);
    CFArrayAppendValue(v4, v3);
  }
}

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke_3(uint64_t a1)
{
}

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke_4(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 32) + 56);
  v7.length = CFArrayGetCount(v2);
  v7.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v7, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
  {
    CFIndex v4 = FirstIndexOfValue;
    v5 = *(__CFArray **)(*(void *)(a1 + 32) + 56);
    CFArrayRemoveValueAtIndex(v5, v4);
  }
}

@end