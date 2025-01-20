@interface TLKAuxilliaryTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TLKAuxilliaryTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKAuxilliaryTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKAuxilliaryTextView", @"topLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKAuxilliaryTextView", @"middleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKAuxilliaryTextView", @"bottomLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(TLKAuxilliaryTextViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"topLabel, middleLabel, bottomLabel"];
}

@end