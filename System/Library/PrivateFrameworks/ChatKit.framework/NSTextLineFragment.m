@interface NSTextLineFragment
@end

@implementation NSTextLineFragment

CFIndex __62__NSTextLineFragment_Mentions__ck_animatingMentionsGlyphCount__block_invoke(uint64_t a1, uint64_t a2, const __CTRun *a3)
{
  CFIndex result = _CKShouldDrawMentionsCTRun(a3);
  if (result)
  {
    CFIndex result = CTRunGetGlyphCount(a3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  }
  return result;
}

@end