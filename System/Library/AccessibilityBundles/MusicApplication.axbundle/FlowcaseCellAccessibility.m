@interface FlowcaseCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FlowcaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.FlowcaseCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FlowcaseCell", @"headline", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FlowcaseCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FlowcaseCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FlowcaseCell", @"descriptionText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(FlowcaseCellAccessibility *)self safeValueForKey:@"headline"];
  v4 = [(FlowcaseCellAccessibility *)self safeValueForKey:@"title"];
  v5 = [(FlowcaseCellAccessibility *)self safeValueForKey:@"subtitle"];
  v8 = [(FlowcaseCellAccessibility *)self safeValueForKey:@"descriptionText"];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FlowcaseCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FlowcaseCellAccessibility *)&v3 accessibilityTraits];
}

@end