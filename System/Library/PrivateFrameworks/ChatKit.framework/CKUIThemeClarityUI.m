@interface CKUIThemeClarityUI
- (id)gray_balloonColors;
- (id)transcriptBackgroundColor;
- (id)transcriptTextColor;
@end

@implementation CKUIThemeClarityUI

- (id)transcriptBackgroundColor
{
  if (transcriptBackgroundColor_once_2039 != -1) {
    dispatch_once(&transcriptBackgroundColor_once_2039, &__block_literal_global_2041);
  }
  v2 = (void *)transcriptBackgroundColor_sBehavior_2038;

  return v2;
}

void __47__CKUIThemeClarityUI_transcriptBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] clearColor];
  v1 = (void *)transcriptBackgroundColor_sBehavior_2038;
  transcriptBackgroundColor_sBehavior_2038 = v0;
}

- (id)transcriptTextColor
{
  int v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)transcriptTextColor_sBehavior_2042;
  if (transcriptTextColor_sBehavior_2042) {
    BOOL v4 = transcriptTextColor_sIsIncreaseContrastEnabled_transcriptTextColor == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E4F428B8];
    v6 = [MEMORY[0x1E4F428B8] colorWithRed:0.333333333 green:0.333333333 blue:0.345098039 alpha:1.0];
    v7 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
    uint64_t v8 = [v5 dynamicColorWithLightColor:v6 darkColor:v7];
    v9 = (void *)transcriptTextColor_sBehavior_2042;
    transcriptTextColor_sBehavior_2042 = v8;

    transcriptTextColor_sIsIncreaseContrastEnabled_transcriptTextColor = v2;
    v3 = (void *)transcriptTextColor_sBehavior_2042;
  }

  return v3;
}

- (id)gray_balloonColors
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CKUIThemeClarityUI_gray_balloonColors__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (gray_balloonColors_once_2044 != -1) {
    dispatch_once(&gray_balloonColors_once_2044, block);
  }
  return (id)gray_balloonColors_sBehavior_2043;
}

void __40__CKUIThemeClarityUI_gray_balloonColors__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F1CA48] array];
  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)CKUIThemeClarityUI;
  v3 = objc_msgSendSuper2(&v17, sel_gray_balloonColors);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1E4F428B8];
        v10 = [MEMORY[0x1E4F428B8] systemWhiteColor];
        v11 = [v9 dynamicColorWithLightColor:v10 darkColor:v8];

        [v2 addObject:v11];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }

  v12 = (void *)gray_balloonColors_sBehavior_2043;
  gray_balloonColors_sBehavior_2043 = (uint64_t)v2;
}

@end