@interface FigNote
@end

@implementation FigNote

uint64_t __FigNote_ChangeValue_block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)gFigNoteVariableRegistry_1, *(const void **)(a1 + 32));
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, *(const void **)(a1 + 40));
    if (result)
    {
      CFArrayRef v3 = (const __CFArray *)result;
      uint64_t result = CFArrayGetCount((CFArrayRef)result);
      if (result >= 1)
      {
        uint64_t v4 = result;
        for (CFIndex i = 0; i != v4; ++i)
        {
          uint64_t result = (uint64_t)CFArrayGetValueAtIndex(v3, i);
          **(_DWORD **)(result + 8) = *(_DWORD *)(a1 + 56);
        }
      }
      **(_DWORD **)(a1 + 48) = 0;
    }
  }
  return result;
}

uint64_t __FigNote_GetValue_block_invoke(uint64_t a1)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)gFigNoteVariableRegistry_1, *(const void **)(a1 + 32));
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, *(const void **)(a1 + 40));
    if (result)
    {
      CFArrayRef v3 = (const __CFArray *)result;
      uint64_t result = CFArrayGetCount((CFArrayRef)result);
      if (result >= 1)
      {
        uint64_t result = (uint64_t)CFArrayGetValueAtIndex(v3, 0);
        uint64_t v4 = *(_DWORD **)(a1 + 56);
        **(_DWORD **)(a1 + 48) = **(_DWORD **)(result + 8);
        *uint64_t v4 = 0;
      }
    }
  }
  return result;
}

void __FigNote_CopyKeys_block_invoke(uint64_t a1)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)gFigNoteVariableRegistry_1, *(const void **)(a1 + 40));
  if (Value)
  {
    CFDictionaryRef v3 = Value;
    CFIndex Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      v6 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v3, v6, 0);
      uint64_t v7 = 0;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      do
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v6[v7++]);
      while (v5 != v7);
      free(v6);
    }
  }
}

@end