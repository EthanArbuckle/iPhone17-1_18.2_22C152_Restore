@interface CFICUCopyVariableNameForHeapPointer
@end

@implementation CFICUCopyVariableNameForHeapPointer

void _____CFICUCopyVariableNameForHeapPointer_block_invoke(uint64_t a1)
{
  if (variableNamesByHeapPointer)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)variableNamesByHeapPointer, *(const void **)(a1 + 40));
    v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v2)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFRetain(v2);
      CFStringRef v3 = CFStringCreateWithCString(0, *(const char **)(a1 + 48), 0x8000100u);
      if (!CFStringHasPrefix(*(CFStringRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v3))
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)variableNamesByHeapPointer, *(const void **)(a1 + 40));
        CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      CFRelease(v3);
    }
  }
}

@end