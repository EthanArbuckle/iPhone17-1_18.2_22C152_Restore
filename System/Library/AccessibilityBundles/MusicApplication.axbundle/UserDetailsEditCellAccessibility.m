@interface UserDetailsEditCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UserDetailsEditCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.UserDetailsEditCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.UserDetailsEditCell", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.UserDetailsEditCell", @"nickname", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(UserDetailsEditCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"name, nickname"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UserDetailsEditCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(UserDetailsEditCellAccessibility *)&v3 accessibilityTraits];
}

@end