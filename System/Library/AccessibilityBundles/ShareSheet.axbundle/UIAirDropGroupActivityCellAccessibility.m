@interface UIAirDropGroupActivityCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axAppNameForSuggestionCell;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilitySubtitleSlotID;
- (unsigned)_accessibilityTextSlotID;
- (unsigned)_accessibilityTransportSlotID;
@end

@implementation UIAirDropGroupActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAirDropGroupActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAirDropGroupActivityCell", @"progress", "d", 0);
  [v3 validateClass:@"UIAirDropGroupActivityCell" hasProperty:@"textSlotID" withType:"I"];
  [v3 validateClass:@"UIAirDropGroupActivityCell" hasProperty:@"subtitleSlotID" withType:"I"];
  [v3 validateClass:@"UIAirDropGroupActivityCell" hasProperty:@"transportSlotID" withType:"I"];
  [v3 validateClass:@"UIAirDropGroupActivityCell" hasProperty:@"displayName" withType:"@"];
  [v3 validateClass:@"UIAirDropGroupActivityCell" hasProperty:@"subtitle" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAirDropGroupActivityCell", @"node", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAirDropNode", @"peopleSuggestion", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPeopleSuggestion", @"transportBundleIdentifier", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UIAirDropGroupActivityCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(UIAirDropGroupActivityCellAccessibility *)&v3 accessibilityTraits];
}

- (unsigned)_accessibilityTextSlotID
{
  return [(UIAirDropGroupActivityCellAccessibility *)self safeUnsignedIntForKey:@"textSlotID"];
}

- (unsigned)_accessibilitySubtitleSlotID
{
  return [(UIAirDropGroupActivityCellAccessibility *)self safeUnsignedIntForKey:@"subtitleSlotID"];
}

- (unsigned)_accessibilityTransportSlotID
{
  return [(UIAirDropGroupActivityCellAccessibility *)self safeUnsignedIntForKey:@"transportSlotID"];
}

- (id)accessibilityLabel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(UIAirDropGroupActivityCellAccessibility *)self safeStringForKey:@"displayName"];
  uint64_t v4 = [(UIAirDropGroupActivityCellAccessibility *)self safeStringForKey:@"subtitle"];
  if ([(UIAirDropGroupActivityCellAccessibility *)self _accessibilityTextSlotID])
  {
    id v5 = objc_alloc(MEMORY[0x263F21660]);
    v6 = accessibilityLocalizedString(@"sharing.person");
    v7 = (void *)[v5 initWithString:v6];

    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UIAirDropGroupActivityCellAccessibility _accessibilityTextSlotID](self, "_accessibilityTextSlotID"));
    [v7 setAttribute:v8 forKey:*MEMORY[0x263F21870]];

    v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UIAirDropGroupActivityCellAccessibility _accessibilityTextSlotID](self, "_accessibilityTextSlotID"));
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v3;
      _os_log_impl(&dword_242512000, v9, OS_LOG_TYPE_DEFAULT, "Returning slot id %@ for %@", buf, 0x16u);
    }
  }
  else
  {
    if (v3 | v4)
    {
      uint64_t v11 = __UIAXStringForVariables();
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)UIAirDropGroupActivityCellAccessibility;
      uint64_t v11 = [(UIAirDropGroupActivityCellAccessibility *)&v13 accessibilityLabel];
    }
    v7 = (void *)v11;
  }

  return v7;
}

- (id)accessibilityValue
{
  uint64_t v3 = [(UIAirDropGroupActivityCellAccessibility *)self _accessibilityTransportSlotID];
  uint64_t v4 = [(UIAirDropGroupActivityCellAccessibility *)self _axAppNameForSuggestionCell];
  id v5 = objc_alloc(MEMORY[0x263F21660]);
  v6 = accessibilityLocalizedString(@"sharing.sugggestion");
  v7 = (void *)[v5 initWithString:v6];

  if (v3)
  {
    v8 = [NSNumber numberWithUnsignedInt:v3];
    [v7 setAttribute:v8 forKey:*MEMORY[0x263F21878]];
  }
  else
  {
    if (![v4 length]) {
      goto LABEL_6;
    }
    v8 = v7;
    v7 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithString:v4];
  }

LABEL_6:
  id v9 = objc_alloc(MEMORY[0x263F21660]);
  v10 = accessibilityLocalizedString(@" ");
  uint64_t v11 = (void *)[v9 initWithString:v10];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UIAirDropGroupActivityCellAccessibility _accessibilitySubtitleSlotID](self, "_accessibilitySubtitleSlotID"));
  [v11 setAttribute:v12 forKey:*MEMORY[0x263F21870]];

  [(UIAirDropGroupActivityCellAccessibility *)self safeFloatForKey:@"progress"];
  if (v13 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    v14 = AXFormatFloatWithPercentage();
  }
  v15 = __AXStringForVariables();

  return v15;
}

- (id)_axAppNameForSuggestionCell
{
  v2 = [(UIAirDropGroupActivityCellAccessibility *)self valueForKey:@"node"];
  uint64_t v3 = [v2 safeValueForKey:@"peopleSuggestion"];
  uint64_t v4 = [v3 safeStringForKey:@"transportBundleIdentifier"];

  id v5 = AXAppNameForBundleId();

  return v5;
}

@end