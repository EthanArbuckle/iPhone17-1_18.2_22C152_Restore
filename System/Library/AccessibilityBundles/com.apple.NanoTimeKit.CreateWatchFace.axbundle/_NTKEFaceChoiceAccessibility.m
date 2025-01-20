@interface _NTKEFaceChoiceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _NTKEFaceChoiceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NTKEFaceChoice";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)_objc_opt_class(UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKEFaceChoice", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKEFaceChoice", @"_selected", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(_NTKEFaceChoiceAccessibility *)self _accessibilityStringForLabelKeyValues:@"title"];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

@end