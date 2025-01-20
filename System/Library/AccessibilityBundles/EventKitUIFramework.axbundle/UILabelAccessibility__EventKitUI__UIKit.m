@interface UILabelAccessibility__EventKitUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
@end

@implementation UILabelAccessibility__EventKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id v4 = a3;
  v5 = [(UILabelAccessibility__EventKitUI__UIKit *)self accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"AllDayLabel"];

  if (v6)
  {
    unsigned __int8 v8 = (id)*MEMORY[0x263F1D180] != v4 && *MEMORY[0x263F1D138] != (void)v4 && *MEMORY[0x263F1D130] != (void)v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UILabelAccessibility__EventKitUI__UIKit;
    unsigned __int8 v8 = [(UILabelAccessibility__EventKitUI__UIKit *)&v10 _accessibilitySupportsContentSizeCategory:v4];
  }

  return v8;
}

@end