@interface MKTransitInfoLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axLabelFromLabelItems:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MKTransitInfoLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKTransitInfoLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"GEOPDTransitLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOPDTransitLabel", @"hasLabelArtwork", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOPDTransitLabel", @"labelArtwork", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOPBTransitArtwork", @"hasAccessibilityString", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOPBTransitArtwork", @"accessibilityString", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axLabelFromLabelItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {
    v6 = 0;
    goto LABEL_32;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 dataType] == 1)
        {
          switch([v10 dataValue])
          {
            case 0u:
              v11 = @"ACCESS_TYPE_DOOR";
              goto LABEL_25;
            case 1u:
              v11 = @"ACCESS_TYPE_EASEMENT";
              goto LABEL_25;
            case 2u:
              v11 = @"ACCESS_TYPE_ELEVATOR";
              goto LABEL_25;
            case 3u:
              v11 = @"ACCESS_TYPE_ESCALATOR";
              goto LABEL_25;
            case 4u:
              v11 = @"ACCESS_TYPE_UP_ESCALATOR";
              goto LABEL_25;
            case 5u:
              v11 = @"ACCESS_TYPE_DOWN_ESCALATOR";
              goto LABEL_25;
            case 6u:
              v11 = @"ACCESS_TYPE_RAMP";
              goto LABEL_25;
            case 7u:
              v11 = @"ACCESS_TYPE_STAIR";
LABEL_25:
              v14 = AXMapKitLocString(v11);
              break;
            default:
              _AXAssert();
              v14 = 0;
              break;
          }
          uint64_t v15 = __AXStringForVariables();

          v6 = (void *)v15;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = __AXStringForVariables();

          v6 = (void *)v12;
          continue;
        }
        NSClassFromString(&cfstr_Geopdtransitla.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          _AXLogWithFacility();
          continue;
        }
        if (![v9 safeBoolForKey:@"hasLabelArtwork"]) {
          continue;
        }
        id v10 = [v9 safeValueForKey:@"labelArtwork"];
        if ([v10 safeBoolForKey:@"hasAccessibilityString"])
        {
          v17 = [v10 safeValueForKey:@"accessibilityString"];
          uint64_t v13 = __AXStringForVariables();

          v6 = (void *)v13;
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v5);
LABEL_32:

  return v6;
}

- (id)accessibilityLabel
{
  id v3 = [(MKTransitInfoLabelViewAccessibility *)self labelItems];
  if (v3)
  {
    uint64_t v4 = [(MKTransitInfoLabelViewAccessibility *)self _axLabelFromLabelItems:v3];
  }
  else
  {
    _AXAssert();
    uint64_t v4 = 0;
  }

  return v4;
}

@end