@interface UIColor(MUXCrossPlatformOperations)
+ (id)_mapsui_colorNamed:()MUXCrossPlatformOperations;
+ (uint64_t)_mapsui_accentColor;
@end

@implementation UIColor(MUXCrossPlatformOperations)

+ (id)_mapsui_colorNamed:()MUXCrossPlatformOperations
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 _mapsuiBundle];
  v6 = [MEMORY[0x1E4FB1618] colorNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (uint64_t)_mapsui_accentColor
{
  return [MEMORY[0x1E4FB1618] _tintColor];
}

@end