@interface VenueFloorPickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)_axVenueFloorViewController;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VenueFloorPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VenueFloorPickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorPickerCell", @"floorName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorPickerCell", @"floorOrdinal", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorPickerCell", @"isUserLocation", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorPickerCell", @"lacksSearchResults", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorViewController", @"isOpen", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorViewController", @"venue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKVenueFeatureMarker", @"buildings", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKVenueBuildingFeatureMarker", @"floorNames", "@", 0);
}

- (id)_axVenueFloorViewController
{
  objc_opt_class();
  id v3 = [(VenueFloorPickerCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _accessibilityViewController];

  return v5;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(VenueFloorPickerCellAccessibility *)self _axVenueFloorViewController];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  if ([v2 safeBoolForKey:@"isOpen"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isSelected];
  }

  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  return ![(VenueFloorPickerCellAccessibility *)self isAccessibilityElement];
}

- (id)accessibilityLabel
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(VenueFloorPickerCellAccessibility *)self _axVenueFloorViewController];
  char v4 = [v3 safeValueForKey:@"venue"];

  char v29 = 0;
  objc_opt_class();
  v23 = v4;
  v5 = [v4 safeValueForKey:@"buildings"];
  v6 = __UIAccessibilityCastAsClass();

  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        char v29 = 0;
        objc_opt_class();
        v12 = [v11 safeValueForKey:@"floorNames"];
        v13 = __UIAccessibilityCastAsClass();

        if (v29) {
LABEL_22:
        }
          abort();
        v14 = [(VenueFloorPickerCellAccessibility *)self safeValueForKey:@"floorOrdinal"];
        if (v14)
        {
          char v29 = 0;
          objc_opt_class();
          v15 = [v13 objectForKeyedSubscript:v14];
          v16 = __UIAccessibilityCastAsClass();

          if (v29) {
            goto LABEL_22;
          }
          if (v16)
          {

            goto LABEL_15;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v16 = [(VenueFloorPickerCellAccessibility *)self safeStringForKey:@"floorName"];
LABEL_15:
  if ([(VenueFloorPickerCellAccessibility *)self safeBoolForKey:@"isUserLocation"])
  {
    v20 = AXMapsLocString(@"CURRENT_FLOOR");
    v22 = @"__AXStringForVariablesSentinel";
    uint64_t v17 = __AXStringForVariables();

    v16 = (void *)v17;
  }
  if ([(VenueFloorPickerCellAccessibility *)self safeBoolForKey:@"lacksSearchResults", v20, v22])
  {
    v21 = AXMapsLocString(@"NO_POIS_ON_FLOOR");
    uint64_t v18 = __AXStringForVariables();

    v16 = (void *)v18;
  }

  return v16;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)VenueFloorPickerCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(VenueFloorPickerCellAccessibility *)&v8 accessibilityTraits];
  char v4 = [(VenueFloorPickerCellAccessibility *)self _axVenueFloorViewController];
  int v5 = [v4 safeBoolForKey:@"isOpen"];

  if (v5) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = ~*MEMORY[0x263F1CF38];
  }
  return v6 & v3;
}

@end