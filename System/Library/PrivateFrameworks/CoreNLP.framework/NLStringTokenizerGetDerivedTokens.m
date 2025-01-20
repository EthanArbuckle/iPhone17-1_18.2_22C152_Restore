@interface NLStringTokenizerGetDerivedTokens
@end

@implementation NLStringTokenizerGetDerivedTokens

void ___NLStringTokenizerGetDerivedTokens_block_invoke(uint64_t a1, uint64_t a2, CFStringRef theString, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    *(_OWORD *)(v8 + 16 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) = *(_OWORD *)a2;
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    *(void *)(v9 + 8 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) = *(void *)(a2 + 16);
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v10 = *(void *)(a1 + 72);
    if (v10) {
      *(void *)(v10 + 8 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) = a4;
    }
    if (theString)
    {
      CFIndex Length = CFStringGetLength(theString);
      v12 = (void *)(*(void *)(a1 + 80) + 16 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
      void *v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v12[1] = Length;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += Length;
      CFStringAppend(*(CFMutableStringRef *)(a1 + 64), theString);
    }
    else
    {
      v13 = (void *)(*(void *)(a1 + 80) + 16 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
      void *v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v13[1] = 0;
    }
  }
  if (++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == *(void *)(a1 + 88)) {
    *a5 = 1;
  }
}

@end