@interface ZoomController
- (id)areZoomHandGesturesEnabled;
- (id)instructionsText;
- (id)specifiers;
- (id)zoomEnabled:(id)a3;
- (void)setZoomEnabled:(id)a3 specifier:(id)a4;
@end

@implementation ZoomController

- (id)specifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v21 = (int)*MEMORY[0x263F5FDB8];
    v4 = [(ZoomController *)self loadSpecifiersFromPlistName:@"ZoomSettings" target:self];
    v5 = (void *)[v4 mutableCopy];

    v22 = self;
    v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26FAF8CF0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    uint64_t v7 = *MEMORY[0x263F60138];
    v23 = v6;
    [v6 setProperty:@"ZoomPreferredMaxZoomLevel" forKey:*MEMORY[0x263F60138]];
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
          if (([MEMORY[0x263F88150] isZoomGreyFeatureOn] & 1) != 0
            || ([v14 propertyForKey:v7],
                v15 = objc_claimAutoreleasedReturnValue(),
                char v16 = [v15 hasPrefix:@"HandGestures"],
                v15,
                (v16 & 1) == 0))
          {
            [v8 addObject:v14];
            v17 = [v14 propertyForKey:v7];
            int v18 = [v17 hasPrefix:@"ZoomPreferredMaxZoomLevel"];

            if (v18) {
              [v8 addObject:v23];
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    v19 = *(Class *)((char *)&v22->super.super.super.super.super.super.isa + v21);
    *(Class *)((char *)&v22->super.super.super.super.super.super.isa + v21) = (Class)v8;

    v3 = *(Class *)((char *)&v22->super.super.super.super.super.super.isa + v21);
  }

  return v3;
}

- (void)setZoomEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  int v6 = [v5 BOOLValue];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __43__ZoomController_setZoomEnabled_specifier___block_invoke;
  v15 = &unk_2651F2158;
  char v16 = self;
  id v17 = v5;
  id v7 = v5;
  id v8 = (void (**)(void))MEMORY[0x24C53FB60](&v12);
  id v9 = [(ZoomController *)self areZoomHandGesturesEnabled];
  int v10 = [v9 BOOLValue];

  if (AXActivePairedDeviceSupportsHasEltonEnabled() && v6 && v10)
  {
    uint64_t v11 = settingsLocString(@"GREY_FEATURE_NAME_ZOOM", @"AccessibilitySettings-elton");
    [(AccessibilityBridgeBaseController *)self presentDisableEltonAlert:v11 greyOptional:1 confirmBlock:v8 disableGreyBlock:&__block_literal_global_5];
  }
  else
  {
    v8[2](v8);
  }
}

uint64_t __43__ZoomController_setZoomEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setGizmoAccessibilityPref:*(void *)(a1 + 40) forKey:@"ZoomTouchEnabled"];
}

void __43__ZoomController_setZoomEnabled_specifier___block_invoke_2()
{
  id v0 = [MEMORY[0x263F85B10] sharedInstance];
  [v0 setZoomHandGestures:0];
}

- (id)zoomEnabled:(id)a3
{
  v3 = NSNumber;
  v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", @"ZoomTouchEnabled"));

  return v5;
}

- (id)areZoomHandGesturesEnabled
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F85B10] sharedInstance];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "zoomHandGesturesEnabled"));

  return v4;
}

- (id)instructionsText
{
  v2 = NSString;
  v3 = settingsLocString(@"ZOOM_INTRO", @"ZoomSettings");
  v4 = settingsLocString(@"ZOOM_INSTRUCTIONS", @"ZoomSettings");
  id v5 = settingsLocString(@"PAN_INSTRUCTIONS", @"ZoomSettings");
  int v6 = settingsLocString(@"ADJUST_MAG_INSTRUCTIONS", @"ZoomSettings");
  id v7 = [v2 stringWithFormat:@"%@\n%@\n%@\n%@", v3, v4, v5, v6];

  return v7;
}

@end