@interface MKTransitDeparturesCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsInActivate;
- (BOOL)_axIsCountdownCell;
- (id)tableTextAccessibleLabel:(id)a3;
- (void)_accessibilitySetIsInActivate:(BOOL)a3;
@end

@implementation MKTransitDeparturesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKTransitDeparturesCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsInActivate
{
  return MEMORY[0x270F0A438](self, &__MKTransitDeparturesCellAccessibility___accessibilityIsInActivate);
}

- (void)_accessibilitySetIsInActivate:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MKTransitDeparturesCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKTransitDeparturesCell", @"delegate", "@", 0);
  [v3 validateClass:@"MKTransitDeparturesCell" hasInstanceVariable:@"_primaryLabel" withType:"_MKUILabel"];
  [v3 validateClass:@"MKThemeMultiPartLabel"];
  [v3 validateClass:@"MKTransitDeparturesCell" hasInstanceVariable:@"_secondaryLabel" withType:"MKThemeMultiPartLabel"];
  [v3 validateClass:@"MKTransitDeparturesCell" hasInstanceVariable:@"_lineImageView" withType:"UIImageView"];
  [v3 validateClass:@"MKTransitDeparturesCell" hasInstanceVariable:@"_showIncidentIcon" withType:"B"];
  [v3 validateClass:@"MKTransitDeparturesCell" hasInstanceVariable:@"_departureLabel" withType:"_MKUILabel"];
  [v3 validateClass:@"MKTransitDeparturesCell" hasInstanceVariable:@"_tertiaryLabel" withType:"MKThemeMultiPartLabel"];
}

- (BOOL)_axIsCountdownCell
{
  return [(MKTransitDeparturesCellAccessibility *)self safeIntegerForKey:@"_departureLabelStyle"] == 1;
}

- (id)tableTextAccessibleLabel:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MKTransitDeparturesCellAccessibility *)self safeValueForKey:@"_lineImageView"];
  v6 = [v5 accessibilityLabel];

  if ([(MKTransitDeparturesCellAccessibility *)self _axIsCountdownCell])
  {
    v7 = [(MKTransitDeparturesCellAccessibility *)self safeValueForKey:@"_primaryLabel"];
    v8 = [v7 accessibilityLabel];

    v9 = [(MKTransitDeparturesCellAccessibility *)self safeValueForKey:@"_secondaryLabel"];
    v10 = [v9 accessibilityLabel];

    if ([(MKTransitDeparturesCellAccessibility *)self safeBoolForKey:@"_showIncidentIcon"])
    {
      v11 = AXMapKitLocString(@"HAS_INCIDENT");
    }
    else
    {
      v11 = 0;
    }
    v13 = [(MKTransitDeparturesCellAccessibility *)self safeValueForKey:@"_departureLabel"];
    v14 = [v13 accessibilityLabel];

    v15 = [(MKTransitDeparturesCellAccessibility *)self safeValueForKey:@"_tertiaryLabel"];
    v16 = [v15 accessibilityLabel];

    if ([v14 length] && objc_msgSend(v16, "length"))
    {
      v22[0] = v14;
      v22[1] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
      v18 = [v17 componentsJoinedByString:@" "];
    }
    else
    {
      if ([v14 length]) {
        id v19 = v14;
      }
      else {
        id v19 = v16;
      }
      v18 = v19;
    }
    v12 = __UIAXStringForVariables();
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MKTransitDeparturesCellAccessibility;
    v8 = [(MKTransitDeparturesCellAccessibility *)&v21 tableTextAccessibleLabel:v4];
    v12 = __UIAXStringForVariables();
  }

  return v12;
}

@end