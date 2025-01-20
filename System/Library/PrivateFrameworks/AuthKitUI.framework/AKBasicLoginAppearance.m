@interface AKBasicLoginAppearance
+ (UIColor)tableCellBackgroundColor;
+ (int64_t)tableViewStyle;
@end

@implementation AKBasicLoginAppearance

+ (UIColor)tableCellBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] tertiarySystemGroupedBackgroundColor];
}

+ (int64_t)tableViewStyle
{
  return 2;
}

@end