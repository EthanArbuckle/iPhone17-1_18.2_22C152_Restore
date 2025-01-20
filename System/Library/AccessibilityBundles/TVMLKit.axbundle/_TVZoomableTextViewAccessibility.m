@interface _TVZoomableTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (unint64_t)_accessibilityScanningBehaviorTraits;
@end

@implementation _TVZoomableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVZoomableTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVFocusableTextView"];
  [v3 validateClass:@"_TVZoomableTextView" isKindOfClass:@"TVFocusableTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVFocusableTextView", @"moreLabel", "@", 0);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  v2 = [(_TVZoomableTextViewAccessibility *)self safeValueForKey:@"moreLabel"];
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 0;
}

@end