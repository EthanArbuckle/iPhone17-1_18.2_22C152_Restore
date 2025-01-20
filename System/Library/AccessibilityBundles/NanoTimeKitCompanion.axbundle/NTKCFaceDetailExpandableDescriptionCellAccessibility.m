@interface NTKCFaceDetailExpandableDescriptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (NTKCFaceDetailExpandableDescriptionCellAccessibility)init;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NTKCFaceDetailExpandableDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailExpandableDescriptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKCFaceDetailExpandableDescriptionCell" isKindOfClass:@"NTKCCFaceDetailDescriptionCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailDescriptionCell", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailExpandableDescriptionCell", @"init", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailExpandableDescriptionCell", @"setExpanded:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)NTKCFaceDetailExpandableDescriptionCellAccessibility;
  [(NTKCFaceDetailExpandableDescriptionCellAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  if (UIAccessibilityIsVoiceOverRunning()) {
    AXPerformSafeBlock();
  }
}

id __98__NTKCFaceDetailExpandableDescriptionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExpanded:1];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v9 = 0;
  objc_opt_class();
  id v3 = [(NTKCFaceDetailExpandableDescriptionCellAccessibility *)self safeValueForKey:@"text"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKCFaceDetailExpandableDescriptionCellAccessibility;
    id v5 = [(NTKCFaceDetailExpandableDescriptionCellAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

- (NTKCFaceDetailExpandableDescriptionCellAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailExpandableDescriptionCellAccessibility;
  objc_super v2 = [(NTKCFaceDetailExpandableDescriptionCellAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(NTKCFaceDetailExpandableDescriptionCellAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

@end