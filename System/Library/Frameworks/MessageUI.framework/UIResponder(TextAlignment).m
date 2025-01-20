@interface UIResponder(TextAlignment)
- (uint64_t)mf_textAlignmentForActiveInputLanguage;
@end

@implementation UIResponder(TextAlignment)

- (uint64_t)mf_textAlignmentForActiveInputLanguage
{
  v1 = [a1 textInputMode];
  uint64_t v2 = [v1 primaryLanguage];

  v3 = (void *)v2;
  if (!v2)
  {
    v4 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    v5 = [v4 currentInputMode];
    uint64_t v6 = [v5 primaryLanguage];

    v3 = (void *)v6;
  }
  uint64_t v7 = 2 * ([MEMORY[0x1E4FB0850] defaultWritingDirectionForLanguage:v3] != 0);

  return v7;
}

@end