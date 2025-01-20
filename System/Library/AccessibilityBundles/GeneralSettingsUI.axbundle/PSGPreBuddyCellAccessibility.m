@interface PSGPreBuddyCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PSGPreBuddyCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSGPreBuddyCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (id)accessibilityLabel
{
  return (id)[(PSGPreBuddyCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:0 exclusions:0];
}

@end