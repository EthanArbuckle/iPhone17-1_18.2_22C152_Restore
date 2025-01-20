@interface VoiceOverAudioController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverAudioController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(VoiceOverAudioController *)self loadSpecifiersFromPlistName:@"VoiceOverAudioSettings" target:self];
    v6 = [v5 specifierForID:@"VOICEOVER_VOLUME_SLIDER_ID"];
    v7 = AXVolumeMinImage();
    [v6 setProperty:v7 forKey:*MEMORY[0x263F60240]];

    v8 = AXVolumeMaxImage();
    [v6 setProperty:v8 forKey:*MEMORY[0x263F60250]];

    [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60148]];
    v9 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    v10 = [v9 objectForKey:*MEMORY[0x263F22B50]];
    uint64_t v11 = [v10 integerValue];

    if (v11) {
      v12 = &unk_26FB00860;
    }
    else {
      v12 = &unk_26FB00850;
    }
    [v6 setProperty:v12 forKey:*MEMORY[0x263F60030]];
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VoiceOverAudioController;
  v8 = [(VoiceOverAudioController *)&v24 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = [(VoiceOverAudioController *)self specifierAtIndexPath:v7];
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 propertyForKey:*MEMORY[0x263F60138]];
    int v12 = [v11 isEqualToString:@"VOICEOVER_VOLUME_SLIDER_ID"];

    if (v12)
    {
      v13 = [v10 control];
      objc_initWeak(&location, v13);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __60__VoiceOverAudioController_tableView_cellForRowAtIndexPath___block_invoke;
      v21[3] = &unk_2651F2390;
      objc_copyWeak(&v22, &location);
      [v13 setAccessibilityValueBlock:v21];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __60__VoiceOverAudioController_tableView_cellForRowAtIndexPath___block_invoke_2;
      v18[3] = &unk_2651F23B8;
      objc_copyWeak(&v19, &location);
      int v20 = 1028443341;
      [v10 _setAccessibilityIncrementBlock:v18];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __60__VoiceOverAudioController_tableView_cellForRowAtIndexPath___block_invoke_3;
      v15[3] = &unk_2651F23B8;
      objc_copyWeak(&v16, &location);
      int v17 = 1028443341;
      [v10 _setAccessibilityDecrementBlock:v15];
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }

  return v10;
}

id __60__VoiceOverAudioController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained value];
  v2 = AXFormatFloatWithPercentage();

  return v2;
}

void __60__VoiceOverAudioController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained value];
  float v5 = v4 + *(float *)(a1 + 40);

  id v7 = objc_loadWeakRetained(v2);
  *(float *)&double v6 = v5;
  [v7 setValue:0 animated:v6];
}

void __60__VoiceOverAudioController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained value];
  float v5 = v4 - *(float *)(a1 + 40);

  id v7 = objc_loadWeakRetained(v2);
  *(float *)&double v6 = v5;
  [v7 setValue:0 animated:v6];
}

@end