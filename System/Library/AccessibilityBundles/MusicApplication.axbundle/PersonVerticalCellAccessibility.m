@interface PersonVerticalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PersonVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.PersonVerticalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PersonVerticalCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PersonVerticalCell", @"subtitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PersonVerticalCellAccessibility *)self safeValueForKey:@"title"];
  v6 = [(PersonVerticalCellAccessibility *)self safeValueForKey:@"subtitle"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PersonVerticalCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PersonVerticalCellAccessibility *)&v3 accessibilityTraits];
}

@end