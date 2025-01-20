@interface NSTextLineFragment(Helper)
- (uint64_t)animatingGlyphCount_emk;
- (void)_emk_enumerateRunsWithBlock:()Helper;
@end

@implementation NSTextLineFragment(Helper)

- (void)_emk_enumerateRunsWithBlock:()Helper
{
  id v4 = a3;
  v5 = (const __CTLine *)[a1 lineRef];
  if (v5)
  {
    v6 = v5;
    v7 = CTLineGetGlyphRuns(v5);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__NSTextLineFragment_Helper___emk_enumerateRunsWithBlock___block_invoke;
    v8[3] = &unk_1E6E97200;
    id v9 = v4;
    v10 = v6;
    _EMKEnumerateRuns(v7, v8);
  }
}

- (uint64_t)animatingGlyphCount_emk
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__NSTextLineFragment_Helper__animatingGlyphCount_emk__block_invoke;
  v3[3] = &unk_1E6E97228;
  v3[4] = &v4;
  objc_msgSend(a1, "_emk_enumerateRunsWithBlock:", v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

@end