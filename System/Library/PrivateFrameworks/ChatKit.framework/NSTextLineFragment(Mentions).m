@interface NSTextLineFragment(Mentions)
- (uint64_t)ck_animatingMentionsGlyphCount;
- (void)ck_enumerateRunsWithBlock:()Mentions;
@end

@implementation NSTextLineFragment(Mentions)

- (uint64_t)ck_animatingMentionsGlyphCount
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__NSTextLineFragment_Mentions__ck_animatingMentionsGlyphCount__block_invoke;
  v3[3] = &unk_1E562A500;
  v3[4] = &v4;
  objc_msgSend(a1, "ck_enumerateRunsWithBlock:", v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)ck_enumerateRunsWithBlock:()Mentions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  v5 = (const __CTLine *)[a1 lineRef];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = CTLineGetGlyphRuns(v5);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, v6, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

@end