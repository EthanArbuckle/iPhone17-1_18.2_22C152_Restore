@interface CFICUCreateVariableNameForStackPointerIfNeeded
@end

@implementation CFICUCreateVariableNameForStackPointerIfNeeded

void _____CFICUCreateVariableNameForStackPointerIfNeeded_block_invoke(uint64_t a1)
{
  v3 = *(const char **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  CFStringRef v4 = CFStringCreateWithCString(0, v3, 0x8000100u);
  if (stackPointersByPrefix) {
    CFDictionaryGetValue((CFDictionaryRef)stackPointersByPrefix, v4);
  }
  if (v2 || (Value = CFDictionaryGetValue((CFDictionaryRef)lastStackPointerVariableNamesByPrefix, v4)) == 0)
  {
    CFStringRef v5 = 0;
  }
  else
  {
    CFStringRef v5 = (const __CFString *)CFRetain(Value);
    CFStringRef v7 = CFStringCreateWithCString(0, v3, 0x8000100u);
    if (!CFStringHasPrefix(v5, v7))
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)variableNamesByHeapPointer, 0);
      CFRelease(v5);
      CFStringRef v5 = 0;
    }
    CFRelease(v7);
  }
  CFRelease(v4);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ___CFICUCreateVariableNameForStackPointerLocked(*(char **)(a1 + 40), *(const void **)(a1 + 48));
    v8 = *(unsigned char **)(a1 + 56);
    if (v8) {
      unsigned char *v8 = 1;
    }
  }
}

@end