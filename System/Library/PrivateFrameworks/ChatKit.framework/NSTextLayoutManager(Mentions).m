@interface NSTextLayoutManager(Mentions)
- (uint64_t)ck_animatingMentionsGlyphCount;
@end

@implementation NSTextLayoutManager(Mentions)

- (uint64_t)ck_animatingMentionsGlyphCount
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v2 = [a1 documentRange];
  v3 = [v2 location];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__NSTextLayoutManager_Mentions__ck_animatingMentionsGlyphCount__block_invoke;
  v7[3] = &unk_1E5621AA8;
  v7[4] = &v8;
  id v4 = (id)[a1 enumerateTextLayoutFragmentsFromLocation:v3 options:4 usingBlock:v7];

  uint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end