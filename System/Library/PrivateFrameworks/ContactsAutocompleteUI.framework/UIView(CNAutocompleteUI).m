@interface UIView(CNAutocompleteUI)
- (double)cnaui_currentScreenScale;
- (void)abSetLayoutDebuggingColor:()CNAutocompleteUI;
@end

@implementation UIView(CNAutocompleteUI)

- (void)abSetLayoutDebuggingColor:()CNAutocompleteUI
{
  id v4 = a3;
  uint64_t v5 = [v4 CGColor];
  v6 = [a1 layer];
  [v6 setBorderColor:v5];

  v7 = [a1 layer];
  [v7 setBorderWidth:1.0];

  v8 = [v4 colorWithAlphaComponent:0.25];

  id v11 = v8;
  uint64_t v9 = [v11 CGColor];
  v10 = [a1 layer];
  [v10 setBackgroundColor:v9];
}

- (double)cnaui_currentScreenScale
{
  v1 = [a1 window];
  v2 = [v1 screen];

  if (!v2)
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
  }
  [v2 scale];
  double v4 = v3;

  return v4;
}

@end