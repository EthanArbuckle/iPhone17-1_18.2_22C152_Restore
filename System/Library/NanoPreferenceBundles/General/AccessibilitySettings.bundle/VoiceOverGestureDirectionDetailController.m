@interface VoiceOverGestureDirectionDetailController
- (VoiceOverGestureDirectionDetailController)init;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTableCheckedSelection:(id)a3;
@end

@implementation VoiceOverGestureDirectionDetailController

- (VoiceOverGestureDirectionDetailController)init
{
  v11.receiver = self;
  v11.super_class = (Class)VoiceOverGestureDirectionDetailController;
  v2 = [(AccessibilityBridgeBaseController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = __Block_byref_object_copy_;
    v9[4] = __Block_byref_object_dispose_;
    v4 = v2;
    v10 = v4;
    v5 = [MEMORY[0x263F22938] sharedInstance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__VoiceOverGestureDirectionDetailController_init__block_invoke;
    v8[3] = &unk_2651F2520;
    v8[4] = v9;
    [v5 registerUpdateBlock:v8 forRetrieveSelector:sel_voiceOverNavigationDirectionMode withListener:v4];

    v6 = v4;
    _Block_object_dispose(v9, 8);
  }
  return v3;
}

uint64_t __49__VoiceOverGestureDirectionDetailController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"GestureDirectionMode" name:0];
    [v5 addObject:v6];
    v7 = (void *)MEMORY[0x263F5FC40];
    v8 = settingsLocString(@"VOICEOVER_RTL_GESTURE_DIRECTION", @"VoiceOverSettings");
    v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v9 setProperty:&unk_26FB00658 forKey:@"GestureDirectionMode"];
    [v5 addObject:v9];
    v10 = (void *)MEMORY[0x263F5FC40];
    objc_super v11 = settingsLocString(@"VOICEOVER_LTR_GESTURE_DIRECTION", @"VoiceOverSettings");
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setProperty:&unk_26FB00670 forKey:@"GestureDirectionMode"];
    [v5 addObject:v12];
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverGestureDirectionDetailController;
  id v5 = [(VoiceOverGestureDirectionDetailController *)&v12 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v7 = [v6 objectForKey:@"VoiceOverNavigationDirectionMode"];

  if (v7) {
    v8 = (void *)v7;
  }
  else {
    v8 = &unk_26FB00658;
  }
  v9 = [v5 specifier];
  v10 = [v9 propertyForKey:@"GestureDirectionMode"];

  if (v10) {
    objc_msgSend(v5, "setChecked:", objc_msgSend(v8, "isEqual:", v10));
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverGestureDirectionDetailController;
  id v7 = a4;
  v8 = [(VoiceOverGestureDirectionDetailController *)&v12 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = objc_msgSend(v8, "specifier", v12.receiver, v12.super_class);
  v10 = [v9 propertyForKey:@"GestureDirectionMode"];

  if (v10) {
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v10 forKey:@"VoiceOverNavigationDirectionMode"];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
  [(VoiceOverGestureDirectionDetailController *)self updateTableCheckedSelection:v7];

  objc_super v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"AXVoiceOverReloadNotification" object:0];
}

- (void)updateTableCheckedSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (int)*MEMORY[0x263F5FDD0];
  id v11 = v4;
  uint64_t v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "numberOfRowsInSection:", objc_msgSend(v4, "section"));
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", i, objc_msgSend(v11, "section"));
      v10 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) cellForRowAtIndexPath:v9];
      objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v11));
    }
  }
}

@end