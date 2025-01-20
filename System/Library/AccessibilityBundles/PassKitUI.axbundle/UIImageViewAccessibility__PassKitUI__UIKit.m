@interface UIImageViewAccessibility__PassKitUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGRect)accessibilityFrame;
@end

@implementation UIImageViewAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  v3 = [(UIImageViewAccessibility__PassKitUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"LogoImage"];

  if (v4)
  {
    v5 = [(UIImageViewAccessibility__PassKitUI__UIKit *)self _accessibilityValueForKey:@"LogoRect"];
    [v5 rectValue];
    CGRectInset(v23, -20.0, -20.0);
    UIAccessibilityFrameForBounds();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)UIImageViewAccessibility__PassKitUI__UIKit;
    [(UIImageViewAccessibility__PassKitUI__UIKit *)&v22 accessibilityFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end