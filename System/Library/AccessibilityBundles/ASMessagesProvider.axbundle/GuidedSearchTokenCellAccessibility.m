@interface GuidedSearchTokenCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation GuidedSearchTokenCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.GuidedSearchTokenCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)GuidedSearchTokenCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(GuidedSearchTokenCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

@end