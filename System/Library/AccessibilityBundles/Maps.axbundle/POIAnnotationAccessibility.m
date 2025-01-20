@interface POIAnnotationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation POIAnnotationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"POIAnnotation";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"POIAnnotation" hasInstanceVariable:@"_subtext" withType:"NSString"];
  [v3 validateClass:@"POIAnnotation" hasInstanceVariable:@"_compoundItem" withType:"PersonalizedCompoundItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PersonalizedCompoundItem", @"items", "@", 0);
  [v3 validateClass:@"DroppedPinMapItem"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MKAnnotationView", @"droppedPinTitle", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(POIAnnotationAccessibility *)self safeValueForKey:@"_compoundItem"];
  v4 = [v3 safeValueForKey:@"items"];
  v5 = __UIAccessibilityCastAsClass();

  if ([v5 count] == 1
    && ([v5 firstObject],
        v6 = objc_claimAutoreleasedReturnValue(),
        MEMORY[0x245653010](@"DroppedPinMapItem"),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v8 = [MEMORY[0x263F10890] safeStringForKey:@"droppedPinTitle"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end