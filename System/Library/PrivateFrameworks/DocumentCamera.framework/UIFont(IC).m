@interface UIFont(IC)
+ (id)dc_preferredFontForTextStyle:()IC adjustedForDefaultSize:maxSize:;
+ (uint64_t)dc_preferredFontForTextStyle:()IC adjustedForDefaultSize:;
@end

@implementation UIFont(IC)

+ (uint64_t)dc_preferredFontForTextStyle:()IC adjustedForDefaultSize:
{
  return objc_msgSend(a1, "dc_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", a3, 1.79769313e308);
}

+ (id)dc_preferredFontForTextStyle:()IC adjustedForDefaultSize:maxSize:
{
  id v7 = a5;
  v8 = (void *)CTFontDescriptorCreateWithTextStyle();
  [v8 pointSize];
  double v10 = a1 - v9;
  v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v7];

  [v11 pointSize];
  double v13 = v10 + v12;
  if (v13 >= a2) {
    double v13 = a2;
  }
  v14 = [v11 fontWithSize:ceil(v13)];

  return v14;
}

@end