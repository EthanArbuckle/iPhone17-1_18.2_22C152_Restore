@interface UIColor(MKTransitExtras)
+ (id)_mapkit_colorForTransitLine:()MKTransitExtras;
@end

@implementation UIColor(MKTransitExtras)

+ (id)_mapkit_colorForTransitLine:()MKTransitExtras
{
  id v4 = a3;
  if ([v4 hasLineColorString])
  {
    v5 = [v4 lineColorString];
    VKShieldColorsFromHexString();
    float v7 = v6;
    float v9 = v8;
    float v11 = v10;
    float v13 = v12;
  }
  else
  {
    VKShieldColorsFromHexString();
    float v7 = v14;
    float v9 = v15;
    float v11 = v16;
    float v13 = v17;
  }
  v18 = [a1 colorWithRed:v7 green:v9 blue:v11 alpha:v13];

  return v18;
}

@end