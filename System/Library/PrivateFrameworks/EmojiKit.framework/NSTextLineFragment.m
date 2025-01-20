@interface NSTextLineFragment
@end

@implementation NSTextLineFragment

uint64_t __58__NSTextLineFragment_Helper___emk_enumerateRunsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

CFIndex __53__NSTextLineFragment_Helper__animatingGlyphCount_emk__block_invoke(uint64_t a1, uint64_t a2, const __CTRun *a3)
{
  CFIndex result = _EMKShouldDrawCTRun(a3);
  if (result)
  {
    CFIndex result = CTRunGetGlyphCount(a3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  }
  return result;
}

@end