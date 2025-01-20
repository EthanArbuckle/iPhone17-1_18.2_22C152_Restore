@interface CFBundleCreateMutableArrayOfFallbackLanguages
@end

@implementation CFBundleCreateMutableArrayOfFallbackLanguages

void *___CFBundleCreateMutableArrayOfFallbackLanguages_block_invoke(int a1, CFArrayRef theArray, uint64_t a3)
{
  usedBufLen[1] = *(void *)off_1ECE0A5B0;
  CFIndex Count = CFArrayGetCount(theArray);
  if (!Count) {
    return 0;
  }
  uint64_t v6 = Count;
  uint64_t v7 = 157 * Count;
  v8 = (char *)malloc_type_malloc(157 * Count, 0xA1D4934EuLL);
  v9 = v8;
  if (v8 && v6 >= 1)
  {
    CFIndex v10 = 0;
    v11 = &v8[v7];
    v12 = (UInt8 *)v8;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v10);
      CFTypeID v14 = CFGetTypeID(ValueAtIndex);
      if (v14 == CFStringGetTypeID())
      {
        usedBufLen[0] = 0;
        uint64_t Length = CFStringGetLength(ValueAtIndex);
        if (Length >= 156) {
          v16.length = 156;
        }
        else {
          v16.length = Length;
        }
        v16.location = 0;
        if (CFStringGetBytes(ValueAtIndex, v16, 0x600u, 0, 0, v12, (CFIndex)&v11[~(unint64_t)v12], usedBufLen) != Length)
        {
          free(v9);
          return 0;
        }
        *(void *)(a3 + 8 * v10) = v12;
        v17 = &v12[usedBufLen[0]];
        UInt8 *v17 = 0;
        v12 = v17 + 1;
      }
      ++v10;
    }
    while (v6 != v10);
  }
  return v9;
}

@end