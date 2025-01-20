@interface UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityCustomRotors;
@end

@implementation UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityCustomRotors
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit;
  v2 = [(UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit *)&v5 accessibilityCustomRotors];
  v3 = addFirstResponderRotorsToRotorArray(v2);

  return v3;
}

@end