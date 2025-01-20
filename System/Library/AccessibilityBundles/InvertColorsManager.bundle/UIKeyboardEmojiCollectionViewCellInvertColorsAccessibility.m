@interface UIKeyboardEmojiCollectionViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation UIKeyboardEmojiCollectionViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end