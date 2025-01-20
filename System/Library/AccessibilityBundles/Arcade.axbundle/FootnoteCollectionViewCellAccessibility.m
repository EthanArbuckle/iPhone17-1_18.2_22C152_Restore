@interface FootnoteCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FootnoteCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.FootnoteCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(FootnoteCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityFootnoteView"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FootnoteCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FootnoteCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end