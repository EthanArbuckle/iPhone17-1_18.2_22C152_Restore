@interface UIButtonAccessibility__SpotlightUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGRect)accessibilityFrame;
@end

@implementation UIButtonAccessibility__SpotlightUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  v17.receiver = self;
  v17.super_class = (Class)UIButtonAccessibility__SpotlightUI__UIKit;
  [(UIButtonAccessibility__SpotlightUI__UIKit *)&v17 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UIButtonAccessibility__SpotlightUI__UIKit *)self accessibilityIdentifier];
  int v12 = [v11 isEqualToString:@"SPUIShowMoreButton"];

  if (v12) {
    double v13 = v10 + -30.0;
  }
  else {
    double v13 = v10;
  }
  if (v12) {
    double v14 = v6 + 15.0;
  }
  else {
    double v14 = v6;
  }
  double v15 = v4;
  double v16 = v8;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

@end