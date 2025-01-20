@interface CFPrefsOversizedPlistDescription
@end

@implementation CFPrefsOversizedPlistDescription

void __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke(uint64_t a1, const __CFString *a2, __CFString *cf)
{
  cfa[1] = *(CFTypeRef *)off_1ECE0A5B0;
  cfa[0] = 0;
  uint64_t v5 = _approximateSizeOfPlistValue(cf, cfa, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v5;
  if (cfa[0])
  {
    v6 = (const void *)v5;
    if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)) > 9) {
      v7.length = 10;
    }
    else {
      v7.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
    }
    v7.location = 0;
    uint64_t v8 = CFArrayBSearchValues(*(CFArrayRef *)(a1 + 40), v7, v6, (CFComparatorFunction)_compareSizes, 0);
    if (v8 <= 9)
    {
      CFIndex v9 = v8;
      CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 40), v8, v6);
      if (*(unsigned char *)(a1 + 56))
      {
        CFIndex Length = CFStringGetLength(a2);
        CFIndex v11 = Length;
        CFIndex v12 = Length - 1;
        if (Length > 1)
        {
          uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
          uint64_t v16 = CharacterAtIndex;
          CFIndex v17 = v11 - 2;
          if (v17)
          {
            uint64_t v19 = CFStringGetCharacterAtIndex(a2, v12);
            CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%C{%ld}%C", v16, v17, v19);
          }
          else
          {
            CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%C{1}", CharacterAtIndex);
          }
        }
        else
        {
          CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"{%ld}", Length);
        }
        CFTypeRef v14 = v13;
      }
      else
      {
        CFTypeRef v14 = CFRetain(a2);
      }
      CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@: %@", v14, cfa[0]);
      CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 48), v9, v18);
      CFRelease(v18);
      CFRelease(v14);
    }
    CFRelease(cfa[0]);
  }
}

void __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke_2(uint64_t a1, const __CFString *a2)
{
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), a2);
  v3 = *(__CFString **)(a1 + 32);

  CFStringAppend(v3, @"\n");
}

@end