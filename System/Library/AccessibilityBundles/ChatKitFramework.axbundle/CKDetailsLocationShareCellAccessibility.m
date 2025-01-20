@interface CKDetailsLocationShareCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKDetailsLocationShareCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsLocationShareCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsLocationShareCellAccessibility;
  [(CKDetailsLocationShareCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKDetailsLocationShareCellAccessibility *)self safeValueForKey:@"button"];
  [v3 setIsAccessibilityElement:0];

  [(CKDetailsLocationShareCellAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

@end