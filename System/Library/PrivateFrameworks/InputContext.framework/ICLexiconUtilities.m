@interface ICLexiconUtilities
@end

@implementation ICLexiconUtilities

void __54___ICLexiconUtilities_lexiconContainsEntry_forString___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFStringRef v5 = (const __CFString *)LXEntryCopyString();
  if (CFEqual(v5, *(CFStringRef *)(a1 + 40)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  CFRelease(v5);
}

void __52___ICLexiconUtilities_sortKeyEquivalents_forString___block_invoke(uint64_t a1)
{
  v2 = (const void *)LXEntryCopyString();
  [*(id *)(a1 + 32) addObject:v2];
  CFRelease(v2);
}

void __43___ICLexiconUtilities_copyEntry_forString___block_invoke(uint64_t a1, const void *a2, unsigned char *a3)
{
  CFStringRef v6 = (const __CFString *)LXEntryCopyString();
  if (CFEqual(v6, *(CFStringRef *)(a1 + 40)))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFRetain(a2);
    *a3 = 1;
  }
  CFRelease(v6);
}

@end