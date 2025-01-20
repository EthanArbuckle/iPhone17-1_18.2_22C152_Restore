@interface UIColor(FUSystemColorExtensions)
+ (id)fu_platterBlueColor;
+ (id)fu_platterGreenColor;
+ (id)fu_platterMintColor;
+ (id)fu_platterOrangeColor;
+ (id)fu_platterPinkColor;
+ (id)fu_platterPurpleColor;
+ (id)fu_platterRedColor;
+ (id)fu_platterTealBlueColor;
+ (id)fu_platterYellowColor;
+ (uint64_t)fu_platterDaliTealColor;
+ (uint64_t)fu_platterWhiteColor;
+ (uint64_t)fu_systemBlueColor;
+ (uint64_t)fu_systemGreenColor;
+ (uint64_t)fu_systemGreyColor;
+ (uint64_t)fu_systemMintColor;
+ (uint64_t)fu_systemOrangeColor;
+ (uint64_t)fu_systemPinkColor;
+ (uint64_t)fu_systemPurpleColor;
+ (uint64_t)fu_systemRedColor;
+ (uint64_t)fu_systemTealBlueColor;
+ (uint64_t)fu_systemTextGreyColor;
+ (uint64_t)fu_systemYellowColor;
@end

@implementation UIColor(FUSystemColorExtensions)

+ (uint64_t)fu_systemRedColor
{
  return [a1 colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
}

+ (uint64_t)fu_systemYellowColor
{
  return [a1 colorWithRed:1.0 green:0.901960784 blue:0.125490196 alpha:1.0];
}

+ (uint64_t)fu_systemMintColor
{
  return [a1 colorWithRed:0.0 green:0.960784314 blue:0.917647059 alpha:1.0];
}

+ (uint64_t)fu_systemBlueColor
{
  return [a1 colorWithRed:0.125490196 green:0.580392157 blue:0.980392157 alpha:1.0];
}

+ (uint64_t)fu_systemGreenColor
{
  return [a1 colorWithRed:0.0156862745 green:0.870588235 blue:0.443137255 alpha:1.0];
}

+ (uint64_t)fu_systemOrangeColor
{
  return [a1 colorWithRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
}

+ (uint64_t)fu_systemPinkColor
{
  return [a1 colorWithRed:0.980392157 green:0.0666666667 blue:0.309803922 alpha:1.0];
}

+ (uint64_t)fu_systemPurpleColor
{
  return [a1 colorWithRed:0.411764706 green:0.37254902 blue:1.0 alpha:1.0];
}

+ (uint64_t)fu_systemGreyColor
{
  return [a1 colorWithRed:0.607843137 green:0.62745098 blue:0.666666667 alpha:1.0];
}

+ (uint64_t)fu_systemTealBlueColor
{
  return [a1 colorWithRed:0.352941176 green:0.784313725 blue:0.980392157 alpha:1.0];
}

+ (uint64_t)fu_systemTextGreyColor
{
  return [a1 colorWithRed:0.682352941 green:0.705882353 blue:0.749019608 alpha:1.0];
}

+ (uint64_t)fu_platterWhiteColor
{
  return [a1 colorWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.14];
}

+ (id)fu_platterBlueColor
{
  v1 = objc_msgSend(a1, "fu_systemBlueColor");
  v2 = [v1 colorWithAlphaComponent:0.17];

  return v2;
}

+ (id)fu_platterGreenColor
{
  v1 = objc_msgSend(a1, "fu_systemGreenColor");
  v2 = [v1 colorWithAlphaComponent:0.14];

  return v2;
}

+ (id)fu_platterOrangeColor
{
  v1 = objc_msgSend(a1, "fu_systemOrangeColor");
  v2 = [v1 colorWithAlphaComponent:0.15];

  return v2;
}

+ (id)fu_platterRedColor
{
  v1 = objc_msgSend(a1, "fu_systemRedColor");
  v2 = [v1 colorWithAlphaComponent:0.17];

  return v2;
}

+ (id)fu_platterYellowColor
{
  v1 = objc_msgSend(a1, "fu_systemYellowColor");
  v2 = [v1 colorWithAlphaComponent:0.14];

  return v2;
}

+ (id)fu_platterPinkColor
{
  v1 = objc_msgSend(a1, "fu_systemPinkColor");
  v2 = [v1 colorWithAlphaComponent:0.17];

  return v2;
}

+ (id)fu_platterPurpleColor
{
  v1 = objc_msgSend(a1, "fu_systemPurpleColor");
  v2 = [v1 colorWithAlphaComponent:0.2];

  return v2;
}

+ (uint64_t)fu_platterDaliTealColor
{
  return [a1 colorWithRed:0.0 green:0.819607843 blue:0.807843137 alpha:0.15];
}

+ (id)fu_platterTealBlueColor
{
  v1 = objc_msgSend(a1, "fu_systemTealBlueColor");
  v2 = [v1 colorWithAlphaComponent:0.15];

  return v2;
}

+ (id)fu_platterMintColor
{
  v1 = objc_msgSend(a1, "fu_systemMintColor");
  v2 = [v1 colorWithAlphaComponent:0.2];

  return v2;
}

@end