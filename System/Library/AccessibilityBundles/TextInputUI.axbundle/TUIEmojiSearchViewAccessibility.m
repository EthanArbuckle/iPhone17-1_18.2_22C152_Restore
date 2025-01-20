@interface TUIEmojiSearchViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axInstallAccessibilityLabels;
- (void)addButtons;
- (void)updatePlaceholder;
@end

@implementation TUIEmojiSearchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIEmojiSearchView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIEmojiSearchView", @"addButtons", "v", 0);
  [v3 validateClass:@"TUIEmojiSearchView" hasInstanceVariable:@"_searchTextField" withType:"TUIEmojiSearchTextField"];
  [v3 validateClass:@"_UIScenePresentationView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIEmojiSearchView", @"updatePlaceholder", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchViewAccessibility;
  [(TUIEmojiSearchViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(TUIEmojiSearchViewAccessibility *)self _axInstallAccessibilityLabels];
}

- (void)_axInstallAccessibilityLabels
{
  objc_opt_class();
  objc_super v3 = [(TUIEmojiSearchViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityLocalizedString(@"create.emoji");
  [v4 setAccessibilityLabel:v5];
}

uint64_t __64__TUIEmojiSearchViewAccessibility__axInstallAccessibilityLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 configuration];
  v5 = [v4 image];
  v6 = [v5 safeValueForKey:@"_imageAsset"];
  v7 = [v6 safeValueForKey:@"assetName"];
  uint64_t v8 = [v7 isEqualToString:@"emoji.face.grinning"];

  return v8;
}

- (void)updatePlaceholder
{
  v10.receiver = self;
  v10.super_class = (Class)TUIEmojiSearchViewAccessibility;
  [(TUIEmojiSearchViewAccessibility *)&v10 updatePlaceholder];
  objc_super v3 = [(TUIEmojiSearchViewAccessibility *)self safeValueForKey:@"_searchTextField"];
  v4 = [(TUIEmojiSearchViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_303];
  objc_initWeak(&location, v3);
  objc_initWeak(&from, v4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__TUIEmojiSearchViewAccessibility_updatePlaceholder__block_invoke_2;
  v5[3] = &unk_26515FA08;
  objc_copyWeak(&v6, &from);
  objc_copyWeak(&v7, &location);
  [v4 _setAccessibilityFrameForSortingBlock:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

uint64_t __52__TUIEmojiSearchViewAccessibility_updatePlaceholder__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 accessibilityContainer];
  v4 = [(id)v3 accessibilityContainer];

  MEMORY[0x245666FF0](@"_UIScenePresentationView");
  LOBYTE(v3) = objc_opt_isKindOfClass();

  if (v3)
  {
    v5 = [v4 _accessibilityViewController];
    MEMORY[0x245666FF0](@"STKStickerRemoteSearchViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

double __52__TUIEmojiSearchViewAccessibility_updatePlaceholder__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 accessibilityFrame];
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  CGRectGetMaxY(v13);
  return v5;
}

- (void)addButtons
{
  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchViewAccessibility;
  [(TUIEmojiSearchViewAccessibility *)&v3 addButtons];
  [(TUIEmojiSearchViewAccessibility *)self _axInstallAccessibilityLabels];
}

@end