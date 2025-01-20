@interface UILabel(HUAdditions)
+ (id)labelWithText:()HUAdditions font:;
@end

@implementation UILabel(HUAdditions)

+ (id)labelWithText:()HUAdditions font:
{
  v5 = (objc_class *)MEMORY[0x1E4F42B38];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setFont:v6];

  [v9 setText:v7];
  v10 = [v9 traitCollection];
  v11 = [v10 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v11)) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 2;
  }
  [v9 setNumberOfLines:v12];

  return v9;
}

@end