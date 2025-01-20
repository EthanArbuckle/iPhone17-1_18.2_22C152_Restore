@interface VoiceOverHandGesturesController
- (BOOL)canShowAction:(id)a3 forDetailController:(id)a4;
- (id)_actionValueForSpecifier:(id)a3;
- (id)_greyEventActionCustomizations;
- (id)activationGestureTitle;
- (id)handGesturesEnabled:(id)a3;
- (id)selectedActionForDetailController:(id)a3;
- (id)specifiers;
- (void)_didTapLearnMore;
- (void)_updateGreyEventActionCustomizations:(id)a3;
- (void)resetGreyCustomizations;
- (void)setAction:(id)a3 forDetailController:(id)a4;
- (void)setHandGestures:(id)a3 specifier:(id)a4;
@end

@implementation VoiceOverHandGesturesController

- (id)specifiers
{
  v2 = self;
  v56[3] = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v54 = (int)*MEMORY[0x263F5FDB8];
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    unint64_t v5 = 0x263F5F000uLL;
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 setProperty:v8 forKey:*MEMORY[0x263F600C0]];

    v9 = (void *)v4;
    v10 = settingsLocString(@"GREY_GESTURE_EDUCATION_ACTION", @"AccessibilitySettings-watchcontrol");
    NSUInteger v11 = [v10 rangeOfString:v10];
    NSUInteger v13 = v12;
    v52 = v10;
    [v6 setProperty:v10 forKey:*MEMORY[0x263F600E8]];
    v58.location = v11;
    v58.length = v13;
    v14 = NSStringFromRange(v58);
    [v6 setProperty:v14 forKey:*MEMORY[0x263F600D0]];

    v15 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v2];
    [v6 setProperty:v15 forKey:*MEMORY[0x263F600E0]];

    v16 = NSStringFromSelector(sel__didTapLearnMore);
    [v6 setProperty:v16 forKey:*MEMORY[0x263F600C8]];

    v53 = v6;
    [v9 addObject:v6];
    v17 = (void *)MEMORY[0x263F5FC40];
    v18 = settingsLocString(@"HAND_GESTURES", @"VoiceOverSettings");
    uint64_t v19 = [v17 preferenceSpecifierNamed:v18 target:v2 set:sel_setHandGestures_specifier_ get:sel_handGesturesEnabled_ detail:0 cell:6 edit:0];

    v51 = (void *)v19;
    [v9 addObject:v19];
    v20 = (void *)MEMORY[0x263F5FC40];
    v21 = settingsLocString(@"GREY_CUSTOMIZATIONS_TITLE", @"AccessibilitySettings-watchcontrol");
    uint64_t v22 = [v20 groupSpecifierWithName:v21];

    v50 = (void *)v22;
    [v9 addObject:v22];
    v23 = [(VoiceOverHandGesturesController *)v2 _greyEventActionCustomizations];
    uint64_t v24 = *MEMORY[0x263F84DA0];
    v25 = (void *)MEMORY[0x263F84DA8];
    if (*MEMORY[0x263F84DA0] <= *MEMORY[0x263F84DA8])
    {
      do
      {
        v26 = *(void **)(v5 + 3136);
        WCGreyEventForAXHandGestureEventUsage();
        v27 = WCNameForGreyEvent();
        [v26 preferenceSpecifierNamed:v27 target:v2 set:0 get:sel__actionValueForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
        v29 = unint64_t v28 = v5;

        v30 = [NSNumber numberWithLong:v24];
        v31 = [v23 objectForKeyedSubscript:v30];

        v55[0] = @"VoiceOverHandGesturesGreyEventKey";
        v32 = [NSNumber numberWithLong:v24];
        v56[0] = v32;
        v56[1] = v31;
        v55[1] = @"VoiceOverHandGesturesActionKey";
        v55[2] = @"VoiceOverHandGesturesActionDetailDelegate";
        v56[2] = v2;
        [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
        v33 = v2;
        v34 = v23;
        v36 = v35 = v9;
        [v29 setUserInfo:v36];

        v9 = v35;
        v23 = v34;
        v2 = v33;

        [v9 addObject:v29];
        unint64_t v5 = v28;
      }
      while (v24++ < *v25);
    }
    v38 = [*(id *)(v5 + 3136) emptyGroupSpecifier];
    [v9 addObject:v38];

    v39 = *(void **)(v5 + 3136);
    v40 = settingsLocString(@"GREY_RESET_CUSTOMIZATIONS_TITLE", @"AccessibilitySettings-watchcontrol");
    v41 = [v39 preferenceSpecifierNamed:v40 target:v2 set:0 get:0 detail:0 cell:13 edit:0];

    [v41 setButtonAction:sel_resetGreyCustomizations];
    [v9 addObject:v41];
    v42 = [*(id *)(v5 + 3136) emptyGroupSpecifier];
    v43 = settingsLocString(@"HAND_GESTURE_TO_START_FOOTER", @"AccessibilitySettings-watchcontrol");
    [v42 setProperty:v43 forKey:*MEMORY[0x263F600F8]];

    [v9 addObject:v42];
    v44 = *(void **)(v5 + 3136);
    v45 = settingsLocString(@"GREY_GESTURE_TO_START_TITLE", @"AccessibilitySettings-watchcontrol");
    v46 = [v44 preferenceSpecifierNamed:v45 target:v2 set:0 get:sel_activationGestureTitle detail:objc_opt_class() cell:2 edit:0];

    [v9 addObject:v46];
    uint64_t v47 = [v9 copy];
    v48 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v54);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v54) = (Class)v47;

    v3 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v54);
  }

  return v3;
}

- (void)_didTapLearnMore
{
}

- (void)setHandGestures:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  int v6 = [v5 BOOLValue];
  uint64_t v7 = *MEMORY[0x263F8B3F8];
  v8 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v9 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v7 domainAccessor:v8];
  int v10 = [v9 BOOLValue];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __61__VoiceOverHandGesturesController_setHandGestures_specifier___block_invoke;
  v17 = &unk_2651F2158;
  v18 = self;
  id v19 = v5;
  id v11 = v5;
  NSUInteger v12 = (void (**)(void))MEMORY[0x24C53FB60](&v14);
  if (AXActivePairedDeviceSupportsHasEltonEnabled() && v6 && v10)
  {
    NSUInteger v13 = settingsLocString(@"GREY_FEATURE_NAME_VOICEOVER", @"AccessibilitySettings-elton");
    -[AccessibilityBridgeBaseController presentDisableEltonAlert:greyOptional:confirmBlock:disableGreyBlock:](self, "presentDisableEltonAlert:greyOptional:confirmBlock:disableGreyBlock:", v13, 1, v12, 0, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v12[2](v12);
  }
}

uint64_t __61__VoiceOverHandGesturesController_setHandGestures_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setGizmoAccessibilityPref:*(void *)(a1 + 40) forKey:*MEMORY[0x263F22BD8]];
}

- (id)handGesturesEnabled:(id)a3
{
  v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x263F22BD8]];

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA80];
  }

  return v5;
}

- (id)_actionValueForSpecifier:(id)a3
{
  v3 = [a3 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"VoiceOverHandGesturesActionKey"];

  if (v4)
  {
    id v5 = [MEMORY[0x263F84DC8] nameForAction:v4];
    int v6 = settingsLocString(v5, @"VoiceOverSettings");
    if (([v5 isEqualToString:*MEMORY[0x263F84E00]] & 1) != 0
      || [v5 isEqualToString:*MEMORY[0x263F84DF8]])
    {
      uint64_t v7 = WCNameForAction();

      int v6 = (void *)v7;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)resetGreyCustomizations
{
  v3 = [MEMORY[0x263F84DC8] defaultCustomizeGestures];
  [(VoiceOverHandGesturesController *)self _updateGreyEventActionCustomizations:v3];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__VoiceOverHandGesturesController_resetGreyCustomizations__block_invoke;
  block[3] = &unk_2651F24D8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__VoiceOverHandGesturesController_resetGreyCustomizations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)_greyEventActionCustomizations
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v4 = [MEMORY[0x263F84DC8] defaultCustomizeGestures];
  id v5 = [v3 dictionaryWithDictionary:v4];

  int v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x263F22BE0]];

  if (v7)
  {
    v8 = (void *)MEMORY[0x263F08928];
    uint64_t v9 = objc_opt_class();
    int v10 = [v8 unarchivedDictionaryWithKeysOfClass:v9 objectsOfClass:objc_opt_class() fromData:v7 error:0];
    if ([v10 count]) {
      [v5 addEntriesFromDictionary:v10];
    }
  }
  id v11 = (void *)[v5 copy];

  return v11;
}

- (void)_updateGreyEventActionCustomizations:(id)a3
{
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v4 forKey:*MEMORY[0x263F22BE0]];
}

- (id)activationGestureTitle
{
  v2 = [MEMORY[0x263F85B10] sharedInstance];
  [v2 greyActivationGesture];
  v3 = WCNameForGreyEvent();

  return v3;
}

- (id)selectedActionForDetailController:(id)a3
{
  id v4 = [a3 specifier];
  id v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:@"VoiceOverHandGesturesGreyEventKey"];

  uint64_t v7 = [(VoiceOverHandGesturesController *)self _greyEventActionCustomizations];
  v8 = [v7 objectForKey:v6];

  return v8;
}

- (BOOL)canShowAction:(id)a3 forDetailController:(id)a4
{
  return 1;
}

- (void)setAction:(id)a3 forDetailController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 specifier];
  v8 = [v7 userInfo];
  id v12 = [v8 objectForKeyedSubscript:@"VoiceOverHandGesturesGreyEventKey"];

  uint64_t v9 = (void *)MEMORY[0x263EFF9A0];
  int v10 = [(VoiceOverHandGesturesController *)self _greyEventActionCustomizations];
  id v11 = [v9 dictionaryWithDictionary:v10];

  [v11 setObject:v6 forKeyedSubscript:v12];
  [(VoiceOverHandGesturesController *)self _updateGreyEventActionCustomizations:v11];
}

@end