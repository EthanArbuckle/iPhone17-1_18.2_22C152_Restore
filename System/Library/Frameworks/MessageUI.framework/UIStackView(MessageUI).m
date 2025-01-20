@interface UIStackView(MessageUI)
+ (id)mf_baselineAlignedHorizontalStackView;
+ (id)mf_baselineAlignedVerticalStackView;
+ (id)mf_equalSpacingHorizontalStackView;
+ (id)mf_equallyFilledHorizontalStackView;
+ (id)mf_equallyFilledVerticalStackView;
- (void)mf_addArrangedSubviews:()MessageUI;
@end

@implementation UIStackView(MessageUI)

+ (id)mf_baselineAlignedHorizontalStackView
{
  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setAxis:0];
  [v0 setAlignment:2];
  [v0 setDistribution:2];

  return v0;
}

+ (id)mf_baselineAlignedVerticalStackView
{
  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setAxis:1];
  [v0 setAlignment:0];
  [v0 setBaselineRelativeArrangement:1];

  return v0;
}

+ (id)mf_equallyFilledVerticalStackView
{
  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v0 setAxis:1];
  [v0 setAlignment:0];
  [v0 setDistribution:1];

  return v0;
}

+ (id)mf_equallyFilledHorizontalStackView
{
  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v0 setAxis:0];
  [v0 setAlignment:0];
  [v0 setDistribution:1];

  return v0;
}

+ (id)mf_equalSpacingHorizontalStackView
{
  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v0 setAxis:0];
  [v0 setDistribution:3];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v0;
}

- (void)mf_addArrangedSubviews:()MessageUI
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "addArrangedSubview:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end