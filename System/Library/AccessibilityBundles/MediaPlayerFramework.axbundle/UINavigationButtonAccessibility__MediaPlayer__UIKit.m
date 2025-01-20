@interface UINavigationButtonAccessibility__MediaPlayer__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation UINavigationButtonAccessibility__MediaPlayer__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UINavigationButtonAccessibility__MediaPlayer__UIKit *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"scaleButton"])
  {
    uint64_t v4 = accessibilityLocalizedString(@"scaleButton.text");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationButtonAccessibility__MediaPlayer__UIKit;
    uint64_t v4 = [(UINavigationButtonAccessibility__MediaPlayer__UIKit *)&v7 accessibilityLabel];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(UINavigationButtonAccessibility__MediaPlayer__UIKit *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"scaleButton"])
  {
    uint64_t v4 = [(UINavigationButtonAccessibility__MediaPlayer__UIKit *)self safeValueForKey:@"image"];
    v5 = [v4 accessibilityIdentification];
    if (([v5 hasPrefix:@"zoomin_icon"] & 1) != 0
      || ([v5 hasPrefix:@"wildcat-widescreen-mode-icon"] & 1) != 0)
    {
      v6 = @"sizeToFit.scale.text";
    }
    else
    {
      if (([v5 hasPrefix:@"zoomout_icon"] & 1) == 0
        && ![v5 hasPrefix:@"wildcat-fullscreen-mode-icon"])
      {
        objc_super v7 = 0;
        goto LABEL_6;
      }
      v6 = @"fullScreen.scale.text";
    }
    objc_super v7 = accessibilityLocalizedString(v6);
LABEL_6:

    goto LABEL_8;
  }
  v9.receiver = self;
  v9.super_class = (Class)UINavigationButtonAccessibility__MediaPlayer__UIKit;
  objc_super v7 = [(UINavigationButtonAccessibility__MediaPlayer__UIKit *)&v9 accessibilityValue];
LABEL_8:

  return v7;
}

@end