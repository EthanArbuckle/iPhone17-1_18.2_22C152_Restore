@interface ZoomHandGesturesController
- (NPSDomainAccessor)zoomDomainAccessor;
- (ZoomHandGesturesController)init;
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
- (void)setZoomDomainAccessor:(id)a3;
@end

@implementation ZoomHandGesturesController

- (ZoomHandGesturesController)init
{
  v7.receiver = self;
  v7.super_class = (Class)ZoomHandGesturesController;
  v2 = [(AccessibilityBridgeBaseController *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F57520]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x263F8B448]];
    zoomDomainAccessor = v2->_zoomDomainAccessor;
    v2->_zoomDomainAccessor = (NPSDomainAccessor *)v4;
  }
  return v2;
}

- (id)specifiers
{
  v2 = self;
  v56[3] = *MEMORY[0x263EF8340];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v54 = (int)*MEMORY[0x263F5FDB8];
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    unint64_t v5 = 0x263F5F000uLL;
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    objc_super v7 = (objc_class *)objc_opt_class();
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
    v18 = settingsLocString(@"HAND_GESTURES", @"ZoomSettings");
    uint64_t v19 = [v17 preferenceSpecifierNamed:v18 target:v2 set:sel_setHandGestures_specifier_ get:sel_handGesturesEnabled_ detail:0 cell:6 edit:0];

    v51 = (void *)v19;
    [v9 addObject:v19];
    v20 = (void *)MEMORY[0x263F5FC40];
    v21 = settingsLocString(@"GREY_CUSTOMIZATIONS_TITLE", @"AccessibilitySettings-watchcontrol");
    uint64_t v22 = [v20 groupSpecifierWithName:v21];

    v50 = (void *)v22;
    [v9 addObject:v22];
    v23 = [(ZoomHandGesturesController *)v2 _greyEventActionCustomizations];
    uint64_t v24 = *MEMORY[0x263F88130];
    v25 = (void *)MEMORY[0x263F88138];
    if (*MEMORY[0x263F88130] <= *MEMORY[0x263F88138])
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

        v55[0] = @"ZoomHandGesturesGreyEventKey";
        v32 = [NSNumber numberWithLong:v24];
        v56[0] = v32;
        v56[1] = v31;
        v55[1] = @"ZoomHandGesturesActionKey";
        v55[2] = @"ZoomHandGesturesActionDetailDelegate";
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

    id v3 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v54);
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
  objc_super v7 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  int v8 = [v7 BOOLForKey:@"ZoomTouchEnabled"];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __56__ZoomHandGesturesController_setHandGestures_specifier___block_invoke;
  v15 = &unk_2651F2158;
  v16 = self;
  id v17 = v5;
  id v9 = v5;
  v10 = (void (**)(void))MEMORY[0x24C53FB60](&v12);
  if (AXActivePairedDeviceSupportsHasEltonEnabled() && v6 && v8)
  {
    NSUInteger v11 = settingsLocString(@"GREY_FEATURE_NAME_ZOOM", @"AccessibilitySettings-elton");
    -[AccessibilityBridgeBaseController presentDisableEltonAlert:greyOptional:confirmBlock:disableGreyBlock:](self, "presentDisableEltonAlert:greyOptional:confirmBlock:disableGreyBlock:", v11, 1, v10, 0, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    v10[2](v10);
  }
}

void __56__ZoomHandGesturesController_setHandGestures_specifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *MEMORY[0x263F22BE8];
  id v4 = [v1 zoomDomainAccessor];
  [v1 setGizmoPref:v2 forKey:v3 domainAccessor:v4];
}

- (id)handGesturesEnabled:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F22BE8];
  id v5 = [(ZoomHandGesturesController *)self zoomDomainAccessor];
  int v6 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v4 domainAccessor:v5];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)MEMORY[0x263EFFA80];
  }

  return v7;
}

- (id)_actionValueForSpecifier:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"ZoomHandGesturesActionKey"];

  if (v4)
  {
    uint64_t v5 = [v4 unsignedIntegerValue];
    int v6 = [MEMORY[0x263F88150] nameForAction:v5];
    id v7 = settingsLocString(v6, @"ZoomSettings");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)resetGreyCustomizations
{
  uint64_t v3 = [MEMORY[0x263F88150] defaultCustomizeGestures];
  [(ZoomHandGesturesController *)self _updateGreyEventActionCustomizations:v3];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ZoomHandGesturesController_resetGreyCustomizations__block_invoke;
  block[3] = &unk_2651F24D8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__ZoomHandGesturesController_resetGreyCustomizations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)_greyEventActionCustomizations
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v4 = [MEMORY[0x263F88150] defaultCustomizeGestures];
  uint64_t v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = *MEMORY[0x263F22BF0];
  id v7 = [(ZoomHandGesturesController *)self zoomDomainAccessor];
  int v8 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v6 domainAccessor:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x263F08928];
    uint64_t v10 = objc_opt_class();
    NSUInteger v11 = [v9 unarchivedDictionaryWithKeysOfClass:v10 objectsOfClass:objc_opt_class() fromData:v8 error:0];
    if ([v11 count]) {
      [v5 addEntriesFromDictionary:v11];
    }
  }
  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

- (void)_updateGreyEventActionCustomizations:(id)a3
{
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v4 = *MEMORY[0x263F22BF0];
  uint64_t v5 = [(ZoomHandGesturesController *)self zoomDomainAccessor];
  [(AccessibilityBridgeBaseController *)self setGizmoPref:v6 forKey:v4 domainAccessor:v5];
}

- (id)activationGestureTitle
{
  uint64_t v2 = [MEMORY[0x263F85B10] sharedInstance];
  [v2 greyActivationGesture];
  uint64_t v3 = WCNameForGreyEvent();

  return v3;
}

- (id)selectedActionForDetailController:(id)a3
{
  uint64_t v4 = [a3 specifier];
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"ZoomHandGesturesGreyEventKey"];

  id v7 = [(ZoomHandGesturesController *)self _greyEventActionCustomizations];
  int v8 = [v7 objectForKey:v6];

  return v8;
}

- (void)setAction:(id)a3 forDetailController:(id)a4
{
  id v6 = a3;
  id v7 = [a4 specifier];
  int v8 = [v7 userInfo];
  id v12 = [v8 objectForKeyedSubscript:@"ZoomHandGesturesGreyEventKey"];

  id v9 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v10 = [(ZoomHandGesturesController *)self _greyEventActionCustomizations];
  NSUInteger v11 = [v9 dictionaryWithDictionary:v10];

  [v11 setObject:v6 forKeyedSubscript:v12];
  [(ZoomHandGesturesController *)self _updateGreyEventActionCustomizations:v11];
}

- (NPSDomainAccessor)zoomDomainAccessor
{
  return (NPSDomainAccessor *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setZoomDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end