@interface ActionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ActionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.ActionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(ActionCellAccessibility *)self safeValueForKey:@"title"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ActionCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ActionCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end