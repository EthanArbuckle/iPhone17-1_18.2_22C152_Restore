@interface UIStackView(INUICrossPlatform)
+ (id)_inui_stackViewWithArrangedSubviews:()INUICrossPlatform userInteractionEnabled:;
@end

@implementation UIStackView(INUICrossPlatform)

+ (id)_inui_stackViewWithArrangedSubviews:()INUICrossPlatform userInteractionEnabled:
{
  id v6 = a3;
  v7 = (void *)[[a1 alloc] initWithArrangedSubviews:v6];

  [v7 setUserInteractionEnabled:a4];

  return v7;
}

@end