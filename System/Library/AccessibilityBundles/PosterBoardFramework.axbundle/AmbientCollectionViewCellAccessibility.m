@interface AmbientCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)axSetHideOrDeleteButtonLabel:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation AmbientCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.AmbientCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PosterBoard.AmbientCollectionViewCell" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PREditingHideButton"];
  [v3 validateClass:@"PosterBoard.AmbientCollectionViewCell" hasSwiftField:@"hideOrDeleteButton" withSwiftType:"Optional<PREditingCloseBoxButton>"];
  [v3 validateClass:@"PosterBoard.AmbientCollectionViewCell" hasSwiftField:@"editingButton" withSwiftType:"Optional<UIButton>"];
  [v3 validateClass:@"PREditingHideButton"];
  [v3 validateClass:@"PREditingHideButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"PosterBoard.AmbientCollectionViewCell" hasSwiftField:@"ambientPosterViewController" withSwiftType:"Optional<PRUISAmbientPosterViewController>"];
  [v3 validateClass:@"PRUISAmbientPosterViewController" hasInstanceVariable:@"_configuration" withType:"PRSPosterConfiguration"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRSPosterConfiguration", @"providerBundleIdentifier", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v29.receiver = self;
  v29.super_class = (Class)AmbientCollectionViewCellAccessibility;
  [(AmbientCollectionViewCellAccessibility *)&v29 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AmbientCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"hideOrDeleteButton"];
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v24[3] = &unk_265145488;
  objc_copyWeak(&v25, &from);
  objc_copyWeak(&v26, &location);
  [v3 _setAccessibilityLabelBlock:v24];
  v4 = [(AmbientCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"editingButton"];
  v5 = [(AmbientCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"ambientPosterViewController"];
  v6 = [v5 safeValueForKey:@"_configuration"];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_308;
  v15 = &unk_2651454B0;
  v17 = &v18;
  id v7 = v6;
  id v16 = v7;
  AXPerformSafeBlock();
  id v8 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v10[3] = &unk_2651454D8;
  id v9 = v8;
  id v11 = v9;
  [v4 setAccessibilityLabelBlock:v10];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

id __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained axSetHideOrDeleteButtonLabel:v3];

  return v4;
}

uint64_t __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_308(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) providerBundleIdentifier];

  return MEMORY[0x270F9A758]();
}

id __84__AmbientCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"])v1 = @"people.picker"; {
  else
  }
    v1 = @"standby.color.picker";
  v2 = accessibilityLocalizedString(v1);

  return v2;
}

- (id)axSetHideOrDeleteButtonLabel:(id)a3
{
  id v4 = a3;
  v5 = [(AmbientCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"posterModel"];
  v6 = [v5 safeSwiftStringForKey:@"localizedTitle"];

  MEMORY[0x24565BD30](@"PREditingHideButton");
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = &stru_26F77E3F0;
  }
  if (isKindOfClass)
  {
    int v9 = [v4 safeBoolForKey:@"isSelected"];
    v10 = NSString;
    if (v9) {
      id v11 = @"editing.unhide.button.label";
    }
    else {
      id v11 = @"editing.hide.button.label";
    }
  }
  else
  {
    v10 = NSString;
    id v11 = @"editing.minus.close.button.label";
  }
  uint64_t v12 = accessibilityLocalizedString(v11);
  uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v8);

  return v13;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AmbientCollectionViewCellAccessibility;
  [(AmbientCollectionViewCellAccessibility *)&v3 layoutSubviews];
  [(AmbientCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end