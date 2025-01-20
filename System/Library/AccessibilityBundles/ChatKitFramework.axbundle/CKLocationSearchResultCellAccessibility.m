@interface CKLocationSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axContact;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetContact:(id)a3;
@end

@implementation CKLocationSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKLocationSearchResultCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axContact
{
}

- (void)_axSetContact:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(CKLocationSearchResultCellAccessibility *)self _axContact];
  v4 = AXCKLocalizedFromStringWithContact(v3);

  objc_opt_class();
  v5 = [(CKLocationSearchResultCellAccessibility *)self safeValueForKey:@"placeLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 accessibilityLabel];

  v10 = accessibilityLocalizedString(@"map.attachment");
  v8 = __UIAXStringForVariables();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end