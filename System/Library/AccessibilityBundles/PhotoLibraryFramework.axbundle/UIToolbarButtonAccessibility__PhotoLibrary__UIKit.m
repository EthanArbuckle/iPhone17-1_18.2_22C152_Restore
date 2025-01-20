@interface UIToolbarButtonAccessibility__PhotoLibrary__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation UIToolbarButtonAccessibility__PhotoLibrary__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(UIToolbarButtonAccessibility__PhotoLibrary__UIKit *)self isAccessibilityUserDefinedElement];

  if (v3)
  {
    v4 = [(UIToolbarButtonAccessibility__PhotoLibrary__UIKit *)self isAccessibilityUserDefinedElement];
    LOBYTE(v5) = [v4 BOOLValue];
  }
  else
  {
    v4 = [(UIToolbarButtonAccessibility__PhotoLibrary__UIKit *)self safeValueForKey:@"isHidden"];
    int v5 = [v4 BOOLValue] ^ 1;
  }

  return v5;
}

- (id)accessibilityLabel
{
  v3 = [(UIToolbarButtonAccessibility__PhotoLibrary__UIKit *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(UIToolbarButtonAccessibility__PhotoLibrary__UIKit *)self accessibilityUserDefinedLabel];
  }
  else
  {
    int v5 = [(UIToolbarButtonAccessibility__PhotoLibrary__UIKit *)self accessibilityIdentification];
    int v6 = [v5 isEqualToString:@"playButton"];

    if (v6)
    {
      v4 = accessibilityLocalizedString(@"play.slideshow.button.text");
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)UIToolbarButtonAccessibility__PhotoLibrary__UIKit;
      v4 = [(UIToolbarButtonAccessibility__PhotoLibrary__UIKit *)&v8 accessibilityLabel];
    }
  }

  return v4;
}

@end