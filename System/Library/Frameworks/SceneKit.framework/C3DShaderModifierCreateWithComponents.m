@interface C3DShaderModifierCreateWithComponents
@end

@implementation C3DShaderModifierCreateWithComponents

void ___C3DShaderModifierCreateWithComponents_block_invoke(uint64_t a1, const __CFString *a2, const void *a3)
{
  if (CFStringFind((CFStringRef)*(void *)(*(void *)(a1 + 32) + 24), a2, 0).location != -1
    || (CFStringRef v7 = *(const __CFString **)(*(void *)(a1 + 32) + 16)) != 0 && CFStringFind(v7, a2, 0).location != -1)
  {
    v6 = *(__CFDictionary **)(a1 + 40);
    CFDictionarySetValue(v6, a3, @"2");
  }
}

@end