@interface UITextViewAccessibility__Social__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UITextViewAccessibility__Social__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)UITextViewAccessibility__Social__UIKit;
  id v3 = [(UITextViewAccessibility__Social__UIKit *)&v7 accessibilityTraits];
  v4 = [(UITextViewAccessibility__Social__UIKit *)self accessibilityIdentification];
  int v5 = [v4 isEqualToString:@"FacebookTextView"];

  if (v5) {
    return _AXTraitsRemoveTrait();
  }
  return (unint64_t)v3;
}

- (id)accessibilityLabel
{
  id v3 = [(UITextViewAccessibility__Social__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"FacebookTextView"];

  if (v4)
  {
    int v5 = accessibilityLocalizedString(@"post.composition");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextViewAccessibility__Social__UIKit;
    int v5 = [(UITextViewAccessibility__Social__UIKit *)&v7 accessibilityLabel];
  }

  return v5;
}

@end