@interface UILabelAccessibility__MusicApplication__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation UILabelAccessibility__MusicApplication__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(UILabelAccessibility__MusicApplication__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"AXUIButtonLabelEmptyLabel"];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UILabelAccessibility__MusicApplication__UIKit;
  return [(UILabelAccessibility__MusicApplication__UIKit *)&v6 isAccessibilityElement];
}

@end