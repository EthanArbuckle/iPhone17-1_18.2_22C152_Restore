@interface MRURoutingTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShowVolumeSlider;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityRoutingState;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)accessibilityLabel;
@end

@implementation MRURoutingTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRURoutingTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingTableViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingTableViewCell", @"subtitleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingTableViewCell", @"didTapToExpand", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingTableViewCell", @"routingAccessoryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingTableViewCell", @"volumeController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingAccessoryView", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingSubtitleView", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingTableViewCell", @"volumeSlider", "@", 0);
  [v3 validateClass:@"MRURoutingTableViewCell" hasInstanceVariable:@"_iconImageView" withType:"UIImageView"];
  [v3 validateClass:@"MRURoutingTableViewCell" hasInstanceVariable:@"_routingAccessoryView" withType:"MRURoutingAccessoryView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRURoutingTableViewCell", @"showChevron", "B", 0);
  [v3 validateClass:@"MRURoutingTableViewCell" hasInstanceVariable:@"_outlineImageView" withType:"UIImageView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MRURoutingTableViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [(MRURoutingTableViewCellAccessibility *)self safeValueForKey:@"subtitleView"];
  v5 = [v4 safeValueForKey:@"textLabel"];

  v6 = [(MRURoutingTableViewCellAccessibility *)self safeUIViewForKey:@"_iconImageView"];
  v7 = [v6 accessibilityLabel];

  if ([v7 isAXAttributedString]
    && [v7 hasAttribute:*MEMORY[0x263F21790]])
  {
    if ([v7 isEqualToString:@"speaker.wave.2.fill"])
    {
      v8 = @"speaker.route";
LABEL_7:
      uint64_t v9 = accessibilityLocalizedString(v8);

      v7 = (void *)v9;
      goto LABEL_11;
    }
    if ([v7 isEqualToString:@"headphones"])
    {
      v8 = @"headphones.route";
      goto LABEL_7;
    }
    v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(MRURoutingTableViewCellAccessibility *)(uint64_t)v7 accessibilityLabel];
    }

    v7 = 0;
  }
LABEL_11:
  v11 = [v3 accessibilityLabel];
  v14 = [v5 accessibilityLabel];
  v12 = __UIAXStringForVariables();

  return v12;
}

- (id)accessibilityValue
{
  if ([(MRURoutingTableViewCellAccessibility *)self _accessibilityRoutingState] == 2)
  {
    id v3 = accessibilityLocalizedString(@"route.state.pending.value");
  }
  else
  {
    id v3 = 0;
  }
  if ([(MRURoutingTableViewCellAccessibility *)self _accessibilityShowVolumeSlider])
  {
    v4 = [(MRURoutingTableViewCellAccessibility *)self safeUIViewForKey:@"volumeSlider"];
    v5 = [v4 accessibilityValue];
  }
  else
  {
    v5 = 0;
  }
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)MRURoutingTableViewCellAccessibility;
  unint64_t v3 = [(MRURoutingTableViewCellAccessibility *)&v9 accessibilityTraits];
  if ((unint64_t)([(MRURoutingTableViewCellAccessibility *)self _accessibilityRoutingState]- 3) >= 2)uint64_t v4 = 0; {
  else
  }
    uint64_t v4 = *MEMORY[0x263F1CF38];
  unint64_t v5 = v4 | v3;
  BOOL v6 = [(MRURoutingTableViewCellAccessibility *)self _accessibilityShowVolumeSlider];
  uint64_t v7 = *MEMORY[0x263F1CED8];
  if (!v6) {
    uint64_t v7 = 0;
  }
  return v5 | v7;
}

- (id)accessibilityCustomActions
{
  v12[1] = *MEMORY[0x263EF8340];
  if ([(MRURoutingTableViewCellAccessibility *)self safeBoolForKey:@"showChevron"])
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    uint64_t v4 = accessibilityLocalizedString(@"expand.group.action");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v9[3] = &unk_265130580;
    objc_copyWeak(&v10, &location);
    unint64_t v5 = (void *)[v3 initWithName:v4 actionHandler:v9];

    v12[0] = v5;
    BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MRURoutingTableViewCellAccessibility;
    BOOL v6 = [(MRURoutingTableViewCellAccessibility *)&v8 accessibilityCustomActions];
  }

  return v6;
}

uint64_t __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXPerformSafeBlock();

  return 1;
}

uint64_t __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didTapToExpand];

  return AXPerformBlockOnMainThreadAfterDelay();
}

void __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke_3()
{
}

- (int64_t)_accessibilityRoutingState
{
  v2 = [(MRURoutingTableViewCellAccessibility *)self safeValueForKey:@"routingAccessoryView"];
  int64_t v3 = [v2 safeIntegerForKey:@"state"];

  return v3;
}

- (BOOL)_accessibilityShowVolumeSlider
{
  objc_opt_class();
  int64_t v3 = [(MRURoutingTableViewCellAccessibility *)self safeValueForKey:@"volumeController"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  char v5 = [v4 isVolumeControlAvailable];
  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(MRURoutingTableViewCellAccessibility *)self safeBoolForKey:@"showChevron"])
  {
    int64_t v3 = [(MRURoutingTableViewCellAccessibility *)self safeUIViewForKey:@"_outlineImageView"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MRURoutingTableViewCellAccessibility;
    [(MRURoutingTableViewCellAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)accessibilityIncrement
{
  if ([(MRURoutingTableViewCellAccessibility *)self _accessibilityShowVolumeSlider])
  {
    id v3 = [(MRURoutingTableViewCellAccessibility *)self safeUIViewForKey:@"_volumeSlider"];
    [v3 accessibilityIncrement];
  }
}

- (void)accessibilityDecrement
{
  if ([(MRURoutingTableViewCellAccessibility *)self _accessibilityShowVolumeSlider])
  {
    id v3 = [(MRURoutingTableViewCellAccessibility *)self safeUIViewForKey:@"_volumeSlider"];
    [v3 accessibilityDecrement];
  }
}

- (void)accessibilityLabel
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_242277000, a2, OS_LOG_TYPE_ERROR, "Missing icon type for %@", (uint8_t *)&v2, 0xCu);
}

@end