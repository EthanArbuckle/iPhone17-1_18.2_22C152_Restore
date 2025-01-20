@interface EKEventDetailTitleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityImageLabelforAttributedLocationName:(id)a3 andLocationStatus:(int64_t)a4;
- (id)_accessibilityImageLabelforStatus:(int64_t)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_addCustomActionToActionsArray:(id)a3 forControl:(id)a4 actionBlock:(id)a5;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateLocationViewsIfNeeded;
- (void)addLocation:(id)a3;
@end

@implementation EKEventDetailTitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventDetailTitleCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_titleView" withType:"UILabel"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_locationItems" withType:"NSMutableArray"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_dateTimeViews" withType:"NSMutableArray"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_recurrenceView" withType:"UILabel"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_statusView" withType:"UILabel"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_travelTimeView" withType:"UILabel"];
  [v3 validateClass:@"EKEventDetailLocationItem" hasInstanceVariable:@"_locationView" withType:"EKTextViewWithLabelTextMetrics"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_suggestedLocationCell" withType:"EKEventDetailSuggestedLocationCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDetailTitleCell", @"editButtonTapped", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDetailTitleCell", @"addLocation:", "v", "@", 0);
  [v3 validateClass:@"EKEventDetailLocationItem" hasInstanceVariable:@"_locationStatus" withType:"q"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_conferenceDetailView" withType:"EKEventDetailConferenceCell"];
  [v3 validateClass:@"EKEventDetailConferenceCell" hasInstanceVariable:@"_openURLButton" withType:"UIButton"];
  [v3 validateClass:@"EKEventDetailConferenceCell" hasInstanceVariable:@"_shareButton" withType:"UIButton"];
  [v3 validateClass:@"EKEventDetailConferenceCell" hasInstanceVariable:@"_event" withType:"EKEvent"];
  [v3 validateClass:@"EKEventDetailConferenceCell" hasInstanceVariable:@"_listView" withType:"UIListContentView"];
  [v3 validateClass:@"EKEventDetailConferenceCell" hasInstanceVariable:@"_actionButtonType" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDetailConferenceCell", @"_openURL", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDetailConferenceCell", @"_share:", "v", "@", 0);
}

- (void)_axAnnotateLocationViewsIfNeeded
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(EKEventDetailTitleCellAccessibility *)self safeArrayForKey:@"_locationItems"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        char v22 = 0;
        objc_opt_class();
        v8 = [v7 safeValueForKey:@"_locationView"];
        v9 = __UIAccessibilityCastAsSafeCategory();

        char v10 = [v9 accessibilityIsLocationLink];
        if (v10)
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v2;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "safeValueForKey:", @"_locationView", (void)v18);
        [v17 setIsAccessibilityElement:v11];
        [v17 _accessibilitySetTextViewShouldBreakUpParagraphs:0];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v14);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailTitleCellAccessibility;
  [(EKEventDetailTitleCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(EKEventDetailTitleCellAccessibility *)self _axAnnotateLocationViewsIfNeeded];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomActions
{
  v41.receiver = self;
  v41.super_class = (Class)EKEventDetailTitleCellAccessibility;
  objc_super v3 = [(EKEventDetailTitleCellAccessibility *)&v41 accessibilityCustomActions];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(EKEventDetailTitleCellAccessibility *)self safeUIViewForKey:@"_editButton"];
  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke;
  v38[3] = &unk_26511E4A0;
  objc_copyWeak(&v39, &location);
  v6 = [(EKEventDetailTitleCellAccessibility *)self _addCustomActionToActionsArray:v4 forControl:v5 actionBlock:v38];

  v7 = [(EKEventDetailTitleCellAccessibility *)self safeUIViewForKey:@"_conferenceDetailView"];
  v8 = [v7 safeUIViewForKey:@"_openURLButton"];
  uint64_t v9 = [v7 safeUIViewForKey:@"_shareButton"];
  char v37 = 0;
  objc_opt_class();
  char v10 = [(EKEventDetailTitleCellAccessibility *)self safeValueForKey:@"_event"];
  uint64_t v11 = __UIAccessibilityCastAsClass();

  v30 = (void *)v5;
  v31 = (void *)v9;
  id v12 = [v11 virtualConference];
  uint64_t v13 = [v12 safeArrayForKey:@"joinMethods"];
  uint64_t v14 = [v13 firstObject];

  uint64_t v15 = [v14 URL];
  v16 = [v15 absoluteString];
  v17 = [v16 lowercaseString];

  if ([v17 containsString:@"facetime.apple.com"])
  {
    uint64_t v18 = [v8 accessibilityLabel];
    long long v19 = (void *)v18;
    long long v20 = &stru_26F6960F0;
    if (v18) {
      long long v20 = (__CFString *)v18;
    }
    long long v21 = v20;

    char v22 = accessibilityLocalizedString(@"application.name.facetime");
    if (([(__CFString *)v21 containsString:v22] & 1) == 0)
    {
      long long v23 = __UIAXStringForVariables();
      objc_msgSend(v8, "setAccessibilityLabel:", v23, v22, @"__AXStringForVariablesSentinel");
    }
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_2;
  v35[3] = &unk_26511E348;
  id v24 = v7;
  id v36 = v24;
  long long v25 = [(EKEventDetailTitleCellAccessibility *)self _addCustomActionToActionsArray:v6 forControl:v8 actionBlock:v35];

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_3;
  v32[3] = &unk_26511E4C8;
  id v26 = v24;
  id v33 = v26;
  id v27 = v31;
  id v34 = v27;
  v28 = [(EKEventDetailTitleCellAccessibility *)self _addCustomActionToActionsArray:v25 forControl:v27 actionBlock:v32];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  return v28;
}

void __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained editButtonTapped];
}

uint64_t __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openURL];
}

uint64_t __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _share:*(void *)(a1 + 40)];
}

- (id)_addCustomActionToActionsArray:(id)a3 forControl:(id)a4 actionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v8 _accessibilityViewIsVisible];
  if (v9 && v10)
  {
    if (!v7)
    {
      id v7 = [MEMORY[0x263EFF980] array];
    }
    id v11 = objc_alloc(MEMORY[0x263F1C390]);
    id v12 = [v8 accessibilityLabel];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __93__EKEventDetailTitleCellAccessibility__addCustomActionToActionsArray_forControl_actionBlock___block_invoke;
    v15[3] = &unk_26511E518;
    id v16 = v9;
    uint64_t v13 = (void *)[v11 initWithName:v12 actionHandler:v15];

    [v7 addObject:v13];
  }

  return v7;
}

uint64_t __93__EKEventDetailTitleCellAccessibility__addCustomActionToActionsArray_forControl_actionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __93__EKEventDetailTitleCellAccessibility__addCustomActionToActionsArray_forControl_actionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)accessibilityCustomContent
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v65 = [MEMORY[0x263EFF980] array];
  v63 = self;
  [(EKEventDetailTitleCellAccessibility *)self safeArrayForKey:@"_locationItems"];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v72 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        id v8 = [v7 safeValueForKey:@"_locationView"];
        id v9 = v8;
        if (v8 && ([v8 isAccessibilityElement] & 1) == 0)
        {
          uint64_t v10 = [v7 safeIntegerForKey:@"_locationStatus"];
          id v11 = [v9 accessibilityAttributedValue];
          id v12 = [(EKEventDetailTitleCellAccessibility *)v63 _accessibilityImageLabelforAttributedLocationName:v11 andLocationStatus:v10];

          id AXCustomContentClass = getAXCustomContentClass();
          uint64_t v14 = accessibilityLocalizedString(@"location.title");
          uint64_t v15 = [v9 accessibilityValue];
          id v16 = __UIAXStringForVariables();
          v17 = objc_msgSend(AXCustomContentClass, "customContentWithLabel:value:", v14, v16, v12, @"__AXStringForVariablesSentinel");

          [v65 addObject:v17];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v4);
  }

  uint64_t v18 = [(EKEventDetailTitleCellAccessibility *)v63 safeUIViewForKey:@"_conferenceDetailView"];
  if ([v18 _accessibilityViewIsVisible])
  {
    char v70 = 0;
    objc_opt_class();
    long long v19 = [v18 safeValueForKey:@"_listView"];
    long long v20 = __UIAccessibilityCastAsClass();

    if ([v18 safeIntegerForKey:@"_actionButtonType"] == 3)
    {
      long long v21 = [v20 configuration];
      char v22 = [v21 text];
      uint64_t v23 = [v22 length];

      if (v23)
      {
        id v24 = (void *)MEMORY[0x263F21660];
        long long v25 = [v20 configuration];
        id v26 = [v25 text];
        id v27 = [v24 axAttributedStringWithString:v26];

        [v27 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21818]];
        id v28 = getAXCustomContentClass();
        id v29 = objc_alloc(MEMORY[0x263F086A0]);
        v30 = accessibilityLocalizedString(@"phone.title");
        v31 = (void *)[v29 initWithString:v30];
        v32 = [v27 attributedString];
        id v33 = [v28 customContentWithAttributedLabel:v31 attributedValue:v32];

        [v65 addObject:v33];
      }
    }
  }
  v62 = v18;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v34 = [(EKEventDetailTitleCellAccessibility *)v63 safeArrayForKey:@"_dateTimeViews"];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = 0;
    uint64_t v38 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(v34);
        }
        v40 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        if (!(v37 + j))
        {
          objc_super v41 = @"date.title";
          goto LABEL_25;
        }
        if (v37 + j == 1)
        {
          objc_super v41 = @"time.title";
LABEL_25:
          v42 = accessibilityLocalizedString(v41);
          goto LABEL_27;
        }
        v42 = 0;
LABEL_27:
        id v43 = getAXCustomContentClass();
        v44 = [v40 accessibilityLabel];
        v45 = [v43 customContentWithLabel:v42 value:v44];

        [v45 setImportance:1];
        [v65 addObject:v45];
      }
      v37 += v36;
      uint64_t v36 = [v34 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v36);
  }

  v46 = [(EKEventDetailTitleCellAccessibility *)v63 safeValueForKey:@"_travelTimeView"];
  v47 = [v46 accessibilityLabel];

  if (v47)
  {
    id v48 = getAXCustomContentClass();
    v49 = accessibilityLocalizedString(@"travel.time.title");
    v50 = [v48 customContentWithLabel:v49 value:v47];

    [v65 addObject:v50];
  }
  v51 = [(EKEventDetailTitleCellAccessibility *)v63 safeValueForKey:@"_recurrenceView"];
  v52 = [v51 accessibilityLabel];

  if (v52)
  {
    id v53 = getAXCustomContentClass();
    v54 = accessibilityLocalizedString(@"recurrence.title");
    v55 = [v53 customContentWithLabel:v54 value:v52];

    [v65 addObject:v55];
  }
  v56 = [(EKEventDetailTitleCellAccessibility *)v63 safeValueForKey:@"_statusView"];
  v57 = [v56 accessibilityLabel];

  if (v57)
  {
    id v58 = getAXCustomContentClass();
    v59 = accessibilityLocalizedString(@"status.title");
    v60 = [v58 customContentWithLabel:v59 value:v57];

    [v65 addObject:v60];
  }

  return v65;
}

- (id)accessibilityLabel
{
  id v2 = [(EKEventDetailTitleCellAccessibility *)self safeValueForKey:@"_titleView"];
  uint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)addLocation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCellAccessibility;
  [(EKEventDetailTitleCellAccessibility *)&v4 addLocation:a3];
  [(EKEventDetailTitleCellAccessibility *)self _axAnnotateLocationViewsIfNeeded];
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v3 = [(EKEventDetailTitleCellAccessibility *)self safeUIViewForKey:@"_suggestedLocationCell"];
  objc_super v4 = [v3 accessibilityLabel];

  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  }
  else
  {
    v6 = [(EKEventDetailTitleCellAccessibility *)self safeArrayForKey:@"_locationItems"];
    uint64_t v5 = objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_4);
  }

  return v5;
}

uint64_t __77__EKEventDetailTitleCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 safeValueForKey:@"_locationView"];
}

- (id)_accessibilityImageLabelforAttributedLocationName:(id)a3 andLocationStatus:(int64_t)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v7 = *MEMORY[0x263F216E0];
  uint64_t v8 = [v6 length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __107__EKEventDetailTitleCellAccessibility__accessibilityImageLabelforAttributedLocationName_andLocationStatus___block_invoke;
  v11[3] = &unk_26511E560;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a4;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v11);
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __107__EKEventDetailTitleCellAccessibility__accessibilityImageLabelforAttributedLocationName_andLocationStatus___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 40) = [*(id *)(result + 32) _accessibilityImageLabelforStatus:*(void *)(result + 48)];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)_accessibilityImageLabelforStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    return accessibilityLocalizedString(@"location.status.pending");
  }
  else {
    return accessibilityLocalizedString(off_26511E5E0[a3 - 2]);
  }
}

@end