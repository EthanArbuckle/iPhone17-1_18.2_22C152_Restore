@interface LPLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPlayPause:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_axCaptionText;
- (id)_axITunesPlayButton;
- (id)_axMediaViews;
- (id)_axMuteAction;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_axFollowLink;
@end

@implementation LPLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LPLinkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LPCaptionBarView" hasInstanceVariable:@"_playButton" withType:"LPPlayButtonView"];
  [v3 validateClass:@"LPStreamingAudioPlayButtonControl" hasInstanceVariable:@"_player" withType:"<LPAudioPlayer>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPStreamingAudioPlayer", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPStreamingAudioPlayer", @"progress", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPPlayButtonControl", @"buttonPressed:", "v", "@", 0);
  [v3 validateClass:@"LPPlayButtonView" hasInstanceVariable:@"_button" withType:"LPPlayButtonControl"];
  [v3 validateClass:@"LPVisualMediaView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPVisualMediaView", @"isMuted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPVisualMediaView", @"_muteButtonTapRecognized:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkView", @"metadata", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkView", @"URL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkView", @"_mediaTapRecognized:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkMetadata", @"URL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkMetadata", @"video", "@", 0);
  [v3 validateClass:@"LPImageView" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  [v3 validateClass:@"LPLinkView" hasInstanceVariable:@"_properties" withType:"LPConcretePresentationProperties"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPWebLinkPresentationProperties", @"quotedText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPWebLinkPresentationProperties", @"captionBar", "@", 0);
  [v3 validateClass:@"LPLinkView" hasInstanceVariable:@"_components" withType:"LPLinkViewComponents"];
  [v3 validateClass:@"LPLinkView" hasInstanceVariable:@"_captionButton" withType:"LPCaptionButtonPresentationProperties"];
  [v3 validateClass:@"LPLinkViewComponents"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkViewComponents", @"captionBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPLinkViewComponents", @"media", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionBarView", @"collaborationFooterView", "@", 0);
  [v3 validateClass:@"LPCollaborationFooterView" hasInstanceVariable:@"_optionsView" withType:"LPTextView"];
  [v3 validateClass:@"LPCollaborationFooterView" hasInstanceVariable:@"_subtitleView" withType:"LPTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPTextView", @"attributedString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionBarPresentationProperties", @"top", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionBarPresentationProperties", @"bottom", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionRowPresentationProperties", @"leading", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionRowPresentationProperties", @"trailing", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionPresentationProperties", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionButtonPresentationProperties", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionButtonPresentationProperties", @"attributedText", "@", 0);
  [v3 validateClass:@"LPCaptionBarView" hasInstanceVariable:@"_bottomCaptionView" withType:"LPComponentView<LPTextStyleable><LPSubtitleButtonContainer>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPCaptionBarView", @"button", "@", 0);
  [v3 validateClass:@"LPHorizontalCaptionPairView" isKindOfClass:@"LPComponentView<LPTextStyleable><LPSubtitleButtonContainer>"];
  [v3 validateClass:@"LPHorizontalCaptionPairView" hasInstanceVariable:@"_button" withType:"LPSubtitleButtonView"];
  [v3 validateClass:@"LPCaptionBarButtonView"];
  [v3 validateClass:@"LPCaptionBarButtonView" hasInstanceVariable:@"_button" withType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(LPLinkViewAccessibility *)self _axCaptionText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)accessibilityCustomActions
{
  BOOL v3 = [MEMORY[0x263EFF980] array];
  v4 = [(LPLinkViewAccessibility *)self safeValueForKey:@"metadata"];
  v5 = [v4 safeValueForKey:@"video"];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityLocalizedString(@"OpenURLStr");
    v8 = (void *)[v6 initWithName:v7 target:self selector:sel__axFollowLink];

    [v3 addObject:v8];
  }
  v9 = [(LPLinkViewAccessibility *)self _axITunesPlayButton];
  if ([v9 _accessibilityViewIsVisible])
  {
    NSClassFromString(&cfstr_Lpstreamingaud.isa);
    if (objc_opt_isKindOfClass())
    {
      v10 = [v9 safeValueForKey:@"_player"];
      uint64_t v11 = [v10 safeIntegerForKey:@"state"];

      if (v11 == 2) {
        v12 = @"pause.button";
      }
      else {
        v12 = @"play.button";
      }
      v13 = accessibilityLocalizedString(v12);
      v14 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v13 target:self selector:sel__axPlayPause_];
      [v3 addObject:v14];
    }
    else
    {
      NSClassFromString(&cfstr_Lpplaybuttonco_0.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      v13 = [v9 accessibilityCustomActions];
      [v3 axSafelyAddObjectsFromArray:v13];
    }
  }
LABEL_12:
  v15 = [(LPLinkViewAccessibility *)self _axMuteAction];
  if (v15) {
    [v3 addObject:v15];
  }
  v16 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_captionButton"];
  if (v16)
  {
    v17 = [(LPLinkViewAccessibility *)self _axCaptionText];
    if ([v17 length])
    {
      v18 = [(LPLinkViewAccessibility *)self safeValueForKeyPath:@"_components.captionBar"];
      v19 = [v18 safeValueForKey:@"_bottomCaptionView"];
      NSClassFromString(&cfstr_Lphorizontalca.isa);
      v35 = v4;
      v32 = v19;
      if (objc_opt_isKindOfClass())
      {
        LOBYTE(location) = 0;
        objc_opt_class();
        v20 = [v19 safeValueForKey:@"_button"];
        v21 = __UIAccessibilityCastAsClass();

        objc_initWeak(&location, v21);
        id v22 = objc_alloc(MEMORY[0x263F1C390]);
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke;
        v40[3] = &unk_2650A28D8;
        objc_copyWeak(&v41, &location);
        v23 = (void *)[v22 initWithName:v17 actionHandler:v40];
        [v3 addObject:v23];

        objc_destroyWeak(&v41);
        objc_destroyWeak(&location);

        v4 = v35;
        v19 = v32;
      }
      v24 = objc_msgSend(v18, "safeValueForKey:", @"button", v32, v18, v35);
      NSClassFromString(&cfstr_Lpcaptionbarbu_0.isa);
      if (objc_opt_isKindOfClass())
      {
        LOBYTE(location) = 0;
        objc_opt_class();
        v25 = [v24 safeValueForKeyPath:@"_button"];
        v26 = __UIAccessibilityCastAsClass();

        if ((_BYTE)location) {
          abort();
        }
        if (v26)
        {
          objc_initWeak(&location, v26);
          id v27 = objc_alloc(MEMORY[0x263F1C390]);
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke_2;
          v38[3] = &unk_2650A28D8;
          objc_copyWeak(&v39, &location);
          v28 = (void *)[v27 initWithName:v17 actionHandler:v38];
          [v3 addObject:v28];

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);
        }

        v18 = v34;
        v4 = v36;
        v19 = v33;
      }
    }
  }
  if ([v3 count])
  {
    id v29 = v3;
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)LPLinkViewAccessibility;
    id v29 = [(LPLinkViewAccessibility *)&v37 accessibilityCustomActions];
  }
  v30 = v29;

  return v30;
}

uint64_t __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

uint64_t __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

- (id)automationElements
{
  v20.receiver = self;
  v20.super_class = (Class)LPLinkViewAccessibility;
  BOOL v3 = [(LPLinkViewAccessibility *)&v20 automationElements];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  v8 = [(LPLinkViewAccessibility *)self _axITunesPlayButton];
  if ([v8 _accessibilityViewIsVisible])
  {
    NSClassFromString(&cfstr_Lpstreamingaud.isa);
    if (objc_opt_isKindOfClass()) {
      [v7 axSafelyAddObject:v8];
    }
  }
  v9 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_captionButton"];
  v10 = [(LPLinkViewAccessibility *)self _axCaptionText];
  uint64_t v11 = v10;
  if (v9 && [v10 length])
  {
    v12 = [(LPLinkViewAccessibility *)self safeValueForKeyPath:@"_components.captionBar"];
    v13 = [v12 safeValueForKey:@"_bottomCaptionView"];
    NSClassFromString(&cfstr_Lphorizontalca.isa);
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v14 = [v13 safeValueForKey:@"_button"];
      v15 = __UIAccessibilityCastAsClass();

      [v7 axSafelyAddObject:v15];
    }
    v16 = [v12 safeValueForKey:@"button"];
    NSClassFromString(&cfstr_Lpcaptionbarbu_0.isa);
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v17 = [v16 safeValueForKeyPath:@"_button"];
      v18 = __UIAccessibilityCastAsClass();

      [v7 axSafelyAddObject:v18];
    }
  }

  return v7;
}

- (id)accessibilityLabel
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  BOOL v3 = [(LPLinkViewAccessibility *)self safeValueForKey:@"metadata"];
  v4 = [v3 safeValueForKey:@"video"];
  v5 = [(LPLinkViewAccessibility *)self safeValueForKeyPath:@"_properties.captionBar"];
  id v6 = v5;
  if (!v5)
  {
    v19 = [(LPLinkViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
    objc_super v20 = AXLabelForElements();

    goto LABEL_35;
  }
  v77 = self;
  v73 = v3;
  v79 = [v5 safeValueForKey:@"top"];
  v75 = [v79 safeValueForKey:@"leading"];
  v7 = [v75 safeStringForKey:@"text"];
  v74 = [v6 safeValueForKey:@"top"];
  v8 = [v74 safeValueForKey:@"trailing"];
  [v8 safeStringForKey:@"text"];
  v9 = v78 = v4;
  v10 = [v6 safeValueForKey:@"bottom"];
  uint64_t v11 = [v10 safeValueForKey:@"leading"];
  uint64_t v12 = [v11 safeStringForKey:@"text"];
  v13 = v6;
  v14 = (void *)v12;
  v72 = v13;
  v15 = [v13 safeValueForKey:@"bottom"];
  v16 = [v15 safeValueForKey:@"trailing"];
  v71 = [v16 safeStringForKey:@"text"];
  v17 = __UIAXStringForVariables();

  v4 = v78;
  if (v78)
  {
    v18 = accessibilityLocalizedString(@"VideoStr");
  }
  else
  {
    v18 = 0;
  }
  v21 = __AXStringForVariables();

  if (v78) {
  id v22 = v77;
  }
  v23 = [(LPLinkViewAccessibility *)v77 safeValueForKey:@"_properties", v17, @"__AXStringForVariablesSentinel", v71, @"__AXStringForVariablesSentinel"];
  v24 = [v23 safeStringForKey:@"quotedText"];

  if ([v24 length])
  {
    v25 = NSString;
    v26 = accessibilityLocalizedString(@"quoted.text");
    v67 = objc_msgSend(v25, "stringWithFormat:", v26, v24);
    v69 = @"__AXStringForVariablesSentinel";
    uint64_t v27 = __UIAXStringForVariables();

    v21 = (void *)v27;
  }
  [(LPLinkViewAccessibility *)v77 _axMediaViews];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v28 countByEnumeratingWithState:&v81 objects:v85 count:16];
  v80 = v28;
  if (!v29)
  {
LABEL_32:
    v54 = v21;

    goto LABEL_34;
  }
  uint64_t v30 = v29;
  v76 = v24;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = *(void *)v82;
  do
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v82 != v33) {
        objc_enumerationMutation(v28);
      }
      v35 = *(void **)(*((void *)&v81 + 1) + 8 * i);
      NSClassFromString(&cfstr_Lpimageview.isa);
      if (objc_opt_isKindOfClass())
      {
        v36 = [v35 safeValueForKey:@"_imageView"];
        objc_super v37 = [v36 accessibilityLabel];
        if ([v37 length] && (AXStringIsSymbolName(v37) & 1) == 0)
        {
          uint64_t v38 = v31;
          id v39 = NSString;
          v40 = accessibilityLocalizedString(@"caption.image");
          v68 = objc_msgSend(v39, "stringWithFormat:", v40, v37);
          v70 = @"__AXStringForVariablesSentinel";
          uint64_t v41 = __UIAXStringForVariables();
          v42 = v21;
          v21 = (void *)v41;

          uint64_t v31 = v38;
          id v28 = v80;
        }
        ++v32;
      }
      else
      {
        NSClassFromString(&cfstr_Lpvisualmediav.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        v36 = [v35 accessibilityLabel];
        if ([v36 length] && (AXStringIsSymbolName(v36) & 1) == 0)
        {
          v43 = NSString;
          accessibilityLocalizedString(@"caption.video");
          v45 = uint64_t v44 = v31;
          v68 = objc_msgSend(v43, "stringWithFormat:", v45, v36);
          v70 = @"__AXStringForVariablesSentinel";
          uint64_t v46 = __UIAXStringForVariables();

          id v28 = v80;
          uint64_t v31 = v44;
          v21 = (void *)v46;
        }
        ++v31;
      }
    }
    uint64_t v30 = [v28 countByEnumeratingWithState:&v81 objects:v85 count:16];
  }
  while (v30);

  if (v32 >= 1)
  {
    v47 = NSString;
    accessibilityLocalizedString(@"images.count.description");
    v49 = uint64_t v48 = v31;
    v68 = objc_msgSend(v47, "localizedStringWithFormat:", v49, v32);
    v70 = @"__AXStringForVariablesSentinel";
    uint64_t v50 = __UIAXStringForVariables();

    uint64_t v31 = v48;
    v21 = (void *)v50;
  }
  id v22 = v77;
  v4 = v78;
  v24 = v76;
  if (v31 >= 1)
  {
    uint64_t v51 = v31;
    v52 = NSString;
    accessibilityLocalizedString(@"videos.count.description");
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v52, "localizedStringWithFormat:", v28, v51);
    v70 = @"__AXStringForVariablesSentinel";
    uint64_t v53 = __UIAXStringForVariables();

    v21 = (void *)v53;
    goto LABEL_32;
  }
  v54 = v21;
LABEL_34:
  v55 = [(LPLinkViewAccessibility *)v22 safeValueForKey:@"_components", v68, v70];
  v56 = [v55 safeValueForKey:@"captionBar"];
  v57 = [v56 safeValueForKey:@"collaborationFooterView"];

  v58 = [v57 safeValueForKey:@"_optionsView"];
  v59 = [v57 safeValueForKey:@"_subtitleView"];
  objc_opt_class();
  v60 = [v58 safeValueForKey:@"attributedString"];
  v61 = __UIAccessibilityCastAsClass();

  v62 = [v61 string];

  objc_opt_class();
  v63 = [v59 safeValueForKey:@"attributedString"];
  v64 = __UIAccessibilityCastAsClass();

  v65 = [v64 string];

  objc_super v20 = __UIAXStringForVariables();

  id v6 = v72;
  BOOL v3 = v73;
LABEL_35:

  return v20;
}

uint64_t __45__LPLinkViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Lptextview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityHint
{
  BOOL v3 = [(LPLinkViewAccessibility *)self safeValueForKey:@"metadata"];
  v4 = v3;
  if (!v3)
  {
    id v6 = @"link.load.hint";
    goto LABEL_5;
  }
  v5 = [v3 safeValueForKey:@"video"];

  if (v5)
  {
    id v6 = @"link.video.hint";
LABEL_5:
    uint64_t v7 = accessibilityLocalizedString(v6);
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LPLinkViewAccessibility;
  uint64_t v7 = [(LPLinkViewAccessibility *)&v10 accessibilityHint];
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)accessibilityTraits
{
  BOOL v3 = [(LPLinkViewAccessibility *)self accessibilityUserDefinedTraits];

  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)LPLinkViewAccessibility;
    return [(LPLinkViewAccessibility *)&v8 accessibilityTraits];
  }
  else
  {
    v5 = [(LPLinkViewAccessibility *)self safeValueForKey:@"metadata"];
    id v6 = [v5 safeValueForKey:@"video"];

    if (v6) {
      unint64_t v4 = *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
    }
    else {
      unint64_t v4 = *MEMORY[0x263F1CF10];
    }
  }
  return v4;
}

- (id)accessibilityValue
{
  BOOL v3 = [(LPLinkViewAccessibility *)self _axITunesPlayButton];
  NSClassFromString(&cfstr_Lpstreamingaud.isa);
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = [v3 safeValueForKey:@"_player"];
    uint64_t v5 = [v4 safeIntegerForKey:@"state"];

    if ([v3 _accessibilityViewIsVisible] && v5 == 2)
    {
      id v6 = [v3 safeValueForKey:@"_player"];
      [v6 safeDoubleForKey:@"progress"];

      uint64_t v7 = AXFormatFloatWithPercentage();
      goto LABEL_7;
    }
  }
  else
  {
    [v3 _accessibilityViewIsVisible];
  }
  v10.receiver = self;
  v10.super_class = (Class)LPLinkViewAccessibility;
  uint64_t v7 = [(LPLinkViewAccessibility *)&v10 accessibilityValue];
LABEL_7:
  objc_super v8 = (void *)v7;

  return v8;
}

- (BOOL)accessibilityActivate
{
  v14.receiver = self;
  v14.super_class = (Class)LPLinkViewAccessibility;
  BOOL v3 = [(LPLinkViewAccessibility *)&v14 accessibilityActivate];
  if ([(LPLinkViewAccessibility *)self safeBoolForKey:@"_hasVideo"])
  {
    unint64_t v4 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_player"];
    [v4 safeFloatForKey:@"rate"];
    uint64_t v5 = (void *)MEMORY[0x263F21660];
    if (v6 == 0.0) {
      uint64_t v7 = @"PlayingStr";
    }
    else {
      uint64_t v7 = @"PausedStr";
    }
    objc_super v8 = accessibilityLocalizedString(v7);
    v9 = [v5 axAttributedStringWithString:v8];

    [v9 setAttribute:&unk_26F413BA8 forKey:*MEMORY[0x263F216D8]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
  }
  objc_super v10 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_components"];
  uint64_t v11 = [v10 safeValueForKey:@"media"];
  NSClassFromString(&cfstr_Lpvisualmediav.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 safeBoolForKey:@"isMuted"])
  {
    id v13 = v11;
    AXPerformSafeBlock();
  }
  return v3;
}

uint64_t __48__LPLinkViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _muteButtonTapRecognized:0];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  BOOL v3 = [(LPLinkViewAccessibility *)self _axMediaViews];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)LPLinkViewAccessibility;
  return [(LPLinkViewAccessibility *)&v6 _accessibilityMediaAnalysisOptions] | 0x10000;
}

- (id)_axITunesPlayButton
{
  id v2 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_components"];
  BOOL v3 = [v2 safeValueForKey:@"captionBar"];
  uint64_t v4 = [v3 safeValueForKey:@"_playButton"];
  uint64_t v5 = [v4 safeValueForKey:@"_button"];

  NSClassFromString(&cfstr_Lpplaybuttonco_0.isa);
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_axMuteAction
{
  id v2 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_components"];
  BOOL v3 = [v2 safeValueForKey:@"media"];
  NSClassFromString(&cfstr_Lpvisualmediav.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, v3);
    if ([v3 safeBoolForKey:@"isMuted"]) {
      uint64_t v4 = @"unmute.action.name";
    }
    else {
      uint64_t v4 = @"mute.action.name";
    }
    uint64_t v5 = accessibilityLocalizedString(v4);
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__LPLinkViewAccessibility__axMuteAction__block_invoke;
    v9[3] = &unk_2650A28D8;
    objc_copyWeak(&v10, &location);
    uint64_t v7 = (void *)[v6 initWithName:v5 actionHandler:v9];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __40__LPLinkViewAccessibility__axMuteAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __40__LPLinkViewAccessibility__axMuteAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _muteButtonTapRecognized:0];
}

- (BOOL)_axPlayPause:(id)a3
{
  id v5 = [(LPLinkViewAccessibility *)self _axITunesPlayButton];
  id v3 = v5;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __40__LPLinkViewAccessibility__axPlayPause___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) buttonPressed:0];
}

- (void)_axFollowLink
{
}

uint64_t __40__LPLinkViewAccessibility__axFollowLink__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mediaTapRecognized:0];
}

- (id)_axMediaViews
{
  id v3 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_components"];
  uint64_t v4 = [v3 safeValueForKey:@"captionBar"];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__LPLinkViewAccessibility__axMediaViews__block_invoke;
  v8[3] = &unk_2650A2948;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(LPLinkViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:v8];

  return v6;
}

uint64_t __40__LPLinkViewAccessibility__axMediaViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = __UIAccessibilityCastAsClass();
  [*(id *)(a1 + 32) accessibilityFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 accessibilityFrame];
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  if (CGRectContainsRect(v19, v20))
  {
    char isKindOfClass = 0;
  }
  else
  {
    NSClassFromString(&cfstr_Lpimageview.isa);
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      NSClassFromString(&cfstr_Lpvisualmediav.isa);
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

- (id)_axCaptionText
{
  id v2 = [(LPLinkViewAccessibility *)self safeValueForKey:@"_captionButton"];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 safeStringForKey:@"text"];
    if (![v4 length])
    {
      objc_opt_class();
      double v5 = [v3 safeValueForKey:@"attributedText"];
      CGFloat v6 = __UIAccessibilityCastAsClass();

      uint64_t v7 = [v6 string];

      uint64_t v4 = (void *)v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end