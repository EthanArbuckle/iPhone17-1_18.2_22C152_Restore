@interface SKUIBrowseHeaderCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIBrowseHeaderCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIBrowseHeaderCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (id)accessibilityLabel
{
  return (id)[(SKUIBrowseHeaderCollectionViewCellAccessibility *)self safeValueForKey:@"title"];
}

@end