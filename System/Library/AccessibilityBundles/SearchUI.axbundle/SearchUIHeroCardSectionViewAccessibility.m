@interface SearchUIHeroCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPerformCustomAction:(id)a3;
- (BOOL)_axWatchListStateForButton:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCachedBundleIdentifiers;
- (id)_axCommandButtons;
- (id)_axLocalizedKeyForBundleID:(id)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_axApplicationForBundleIdentifier:(id)a3;
- (void)_axSetCachedBundleIdentifiers:(id)a3;
- (void)buttonPressed:(id)a3;
@end

@implementation SearchUIHeroCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIHeroCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCachedBundleIdentifiers
{
}

- (void)_axSetCachedBundleIdentifiers:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIHeroCardSectionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIHeroCardSectionView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIHeroCardSectionView", @"buttonPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIHeroCardSectionView", @"punchoutIndicatorImageView", "@", 0);
  [v3 validateClass:@"SearchUIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIImageView", @"currentImage", "@", 0);
  [v3 validateClass:@"SearchUIAppIconImage"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIAppIconImage", @"bundleIdentifier", "@", 0);
  [v3 validateClass:@"SearchUIHeroButton"];
  [v3 validateClass:@"SearchUICommandButton"];
  [v3 validateProtocol:@"SearchUICommandButton" hasRequiredInstanceMethod:@"buttonItem"];
  [v3 validateProtocol:@"SFCommandButtonItem" hasRequiredInstanceMethod:@"command"];
  [v3 validateClass:@"SearchUIHeroButton" conformsToProtocol:@"SearchUICommandButton"];
  [v3 validateClass:@"SearchUICommandButton" conformsToProtocol:@"SearchUICommandButton"];
  [v3 validateClass:@"SFToggleWatchListStatusCommand"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICommandButton", @"watchListState", "@", 0);
  [v3 validateClass:@"SearchUIWatchListState"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIWatchListState", @"isWatchListed", "B", 0);
  [v3 validateClass:@"SearchUIUtilities"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SearchUIUtilities", @"bundleIdentifierForApp:", "@", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SearchUIHeroCardSectionViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel"];
}

- (id)accessibilityValue
{
  id v3 = [(SearchUIHeroCardSectionViewAccessibility *)self safeValueForKey:@"punchoutIndicatorImageView"];
  v4 = [v3 safeValueForKey:@"currentImage"];
  v5 = [v4 safeValueForKey:@"bundleIdentifier"];
  if (v5)
  {
    v6 = [(SearchUIHeroCardSectionViewAccessibility *)self _axLocalizedKeyForBundleID:v5];
    v7 = accessibilityLocalizedString(v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIHeroCardSectionViewAccessibility;
    v7 = [(SearchUIHeroCardSectionViewAccessibility *)&v9 accessibilityValue];
  }

  return v7;
}

- (id)accessibilityCustomActions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(SearchUIHeroCardSectionViewAccessibility *)self _axCommandButtons];
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = @"buttonItem.command";
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 safeValueForKeyPath:v6];
        NSClassFromString(&cfstr_Sftogglewatchl.isa);
        if (objc_opt_isKindOfClass())
        {
          if ([(SearchUIHeroCardSectionViewAccessibility *)self _axWatchListStateForButton:v9])
          {
            v11 = @"watchlist.remove";
          }
          else
          {
            v11 = @"watchlist.add";
          }
          v12 = accessibilityLocalizedString(v11);
          v13 = v6;
          v14 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v12 target:self selector:sel__axPerformCustomAction_];
          [v14 _accessibilitySetRetainedValue:v9 forKey:@"AXHeroCommandButtonKey"];
          [v16 axSafelyAddObject:v14];

          v6 = v13;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  return v16;
}

- (BOOL)_axPerformCustomAction:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v6 = [v3 _accessibilityValueForKey:@"AXHeroCommandButtonKey"];
  AXPerformSafeBlock();
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __67__SearchUIHeroCardSectionViewAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) buttonPressed:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIHeroCardSectionViewAccessibility;
  [(SearchUIHeroCardSectionViewAccessibility *)&v9 buttonPressed:v4];
  uint64_t v5 = [v4 safeValueForKey:@"command"];
  NSClassFromString(&cfstr_Sftogglewatchl.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(SearchUIHeroCardSectionViewAccessibility *)self _axWatchListStateForButton:v4])
    {
      uint64_t v7 = @"watchlist.did.remove";
    }
    else
    {
      uint64_t v7 = @"watchlist.did.add";
    }
    v8 = accessibilityLocalizedString(v7);
    UIAccessibilitySpeak();
  }
}

- (id)_axCommandButtons
{
  if (_axCommandButtons_onceToken != -1) {
    dispatch_once(&_axCommandButtons_onceToken, &__block_literal_global_4);
  }

  return (id)[(SearchUIHeroCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_363];
}

Class __61__SearchUIHeroCardSectionViewAccessibility__axCommandButtons__block_invoke()
{
  _axCommandButtons_heroButton = (uint64_t)NSClassFromString(&cfstr_Searchuiherobu.isa);
  Class result = NSClassFromString(&cfstr_Searchuicomman.isa);
  _axCommandButtons_commandButton = (uint64_t)result;
  return result;
}

uint64_t __61__SearchUIHeroCardSectionViewAccessibility__axCommandButtons__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_axWatchListStateForButton:(id)a3
{
  id v3 = a3;
  id v4 = [v3 safeValueForKey:@"command"];
  NSClassFromString(&cfstr_Sftogglewatchl.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 safeValueForKey:@"watchListState"];
    char v6 = [v5 safeBoolForKey:@"isWatchListed"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_axLocalizedKeyForBundleID:(id)a3
{
  unint64_t v3 = [(SearchUIHeroCardSectionViewAccessibility *)self _axApplicationForBundleIdentifier:a3];
  if (v3 - 1 > 0x15) {
    return @"app.generic";
  }
  else {
    return off_26514D708[v3 - 1];
  }
}

- (unint64_t)_axApplicationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SearchUIHeroCardSectionViewAccessibility *)self _axCachedBundleIdentifiers];
  char v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v4];
    unint64_t v8 = (int)[v7 intValue];

    goto LABEL_12;
  }
  if (_axApplicationForBundleIdentifier__onceToken == -1)
  {
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  dispatch_once(&_axApplicationForBundleIdentifier__onceToken, &__block_literal_global_434);
  if (!v5)
  {
LABEL_5:
    objc_super v9 = objc_opt_new();
    [(SearchUIHeroCardSectionViewAccessibility *)self _axSetCachedBundleIdentifiers:v9];
  }
LABEL_6:
  uint64_t v10 = 0;
  do
  {
    char v21 = 0;
    objc_opt_class();
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__0;
    long long v19 = __Block_byref_object_dispose__0;
    id v20 = 0;
    AXPerformSafeBlock();
    id v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    v12 = __UIAccessibilityCastAsClass();

    if (v21) {
      abort();
    }
    if ([v12 isEqualToString:v4])
    {
      v13 = [NSNumber numberWithInt:v10];
      [v5 setObject:v13 forKeyedSubscript:v4];
    }
    uint64_t v10 = (v10 + 1);
  }
  while (v10 != 23);
  unint64_t v8 = 0;
LABEL_12:

  return v8;
}

Class __78__SearchUIHeroCardSectionViewAccessibility__axApplicationForBundleIdentifier___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Searchuiutilit.isa);
  _axApplicationForBundleIdentifier__searchUIUtilities = (uint64_t)result;
  return result;
}

uint64_t __78__SearchUIHeroCardSectionViewAccessibility__axApplicationForBundleIdentifier___block_invoke_437(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)_axApplicationForBundleIdentifier__searchUIUtilities bundleIdentifierForApp:*(int *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end