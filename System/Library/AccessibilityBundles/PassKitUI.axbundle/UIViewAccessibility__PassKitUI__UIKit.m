@interface UIViewAccessibility__PassKitUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (CGRect)accessibilityFrame;
@end

@implementation UIViewAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  v3 = [(UIViewAccessibility__PassKitUI__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:kAXPriceViewIdentifier];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__PassKitUI__UIKit;
  return [(UIViewAccessibility__PassKitUI__UIKit *)&v6 _accessibilityUseAccessibilityFrameForHittest];
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  v3 = [(UIViewAccessibility__PassKitUI__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:kAXPriceViewIdentifier];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__PassKitUI__UIKit;
  return [(UIViewAccessibility__PassKitUI__UIKit *)&v6 _accessibilityOverridesInvalidFrames];
}

- (CGRect)accessibilityFrame
{
  v3 = [(UIViewAccessibility__PassKitUI__UIKit *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:kAXPriceViewIdentifier];

  if (v4
    && ([(UIViewAccessibility__PassKitUI__UIKit *)self _accessibilityFindSubviewDescendant:&__block_literal_global_8], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v6 = v5;
    [v5 accessibilityFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UIViewAccessibility__PassKitUI__UIKit;
    [(UIViewAccessibility__PassKitUI__UIKit *)&v23 accessibilityFrame];
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
    double v14 = v18;
  }
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end