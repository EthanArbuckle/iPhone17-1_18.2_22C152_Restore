@interface NSTextLayoutManager
@end

@implementation NSTextLayoutManager

uint64_t __63__NSTextLayoutManager_Mentions__ck_animatingMentionsGlyphCount__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += objc_msgSend(a2, "ck_animatingMentionsGlyphCount");
  return 1;
}

@end