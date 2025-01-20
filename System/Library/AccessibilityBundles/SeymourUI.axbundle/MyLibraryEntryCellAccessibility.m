@interface MyLibraryEntryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MyLibraryEntryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.MyLibraryEntryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MyLibraryEntryCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MyLibraryEntryCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end