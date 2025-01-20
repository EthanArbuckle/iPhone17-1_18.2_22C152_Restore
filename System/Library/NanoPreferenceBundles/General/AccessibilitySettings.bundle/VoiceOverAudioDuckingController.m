@interface VoiceOverAudioDuckingController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_selectedDuckingMode;
- (void)reloadSpecifiers;
- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTableCheckedSelection:(id)a3;
@end

@implementation VoiceOverAudioDuckingController

- (void)reloadSpecifiers
{
  v2.receiver = self;
  v2.super_class = (Class)VoiceOverAudioDuckingController;
  [(VoiceOverAudioDuckingController *)&v2 reloadSpecifiers];
}

- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)VoiceOverAudioDuckingController;
  [(AccessibilityBridgeBaseController *)&v6 setGizmoPref:a3 forKey:a4 domainAccessor:a5];
  [(VoiceOverAudioDuckingController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v21 = (int)*MEMORY[0x263F5FDB8];
    v22 = self;
    -[VoiceOverAudioDuckingController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", @"VoiceOverAudioDuckingSettings");
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v24 = *(void *)v26;
      uint64_t v6 = *MEMORY[0x263F60138];
      uint64_t v7 = *MEMORY[0x263F60160];
      uint64_t v8 = *MEMORY[0x263F601E0];
      uint64_t v9 = *MEMORY[0x263F60070];
      uint64_t v10 = MEMORY[0x263EFFA88];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v24) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v13 = [v12 identifier];
          int v14 = [v13 isEqualToString:@"AUDIO_DUCKING_MODE_OFF"];

          if (v14)
          {
            [v12 setProperty:&unk_26FB00448 forKey:@"DuckingModeValue"];
            [v12 setProperty:@"DuckingModeOffIdentifier" forKey:v6];
          }
          v15 = [v12 identifier];
          int v16 = [v15 isEqualToString:@"AUDIO_DUCKING_MODE_WHEN_SPEAKING"];

          if (v16)
          {
            [v12 setProperty:&unk_26FB00460 forKey:@"DuckingModeValue"];
            [v12 setProperty:@"DuckingModeOnlySpeakingIdentifier" forKey:v6];
          }
          v17 = [v12 identifier];
          int v18 = [v17 isEqualToString:@"AUDIO_DUCKING_MODE_ALWAYS"];

          if (v18)
          {
            [v12 setProperty:&unk_26FB00478 forKey:@"DuckingModeValue"];
            [v12 setProperty:@"DuckingModeAlwaysSpeakingIdentifier" forKey:v6];
          }
          [v12 setProperty:v10 forKey:v7];
          [v12 setProperty:v10 forKey:v8];
          [v12 setProperty:@"com.apple.Accessibility" forKey:v9];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v5);
    }
    v19 = *(Class *)((char *)&v22->super.super.super.super.super.super.isa + v21);
    *(Class *)((char *)&v22->super.super.super.super.super.super.isa + v21) = (Class)obj;

    v3 = *(Class *)((char *)&v22->super.super.super.super.super.super.isa + v21);
  }

  return v3;
}

- (int64_t)_selectedDuckingMode
{
  objc_super v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v3 = [v2 objectForKey:*MEMORY[0x263F22B50]];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VoiceOverAudioDuckingController;
  uint64_t v5 = [(VoiceOverAudioDuckingController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  int64_t v6 = [(VoiceOverAudioDuckingController *)self _selectedDuckingMode];
  uint64_t v7 = [v5 specifier];
  uint64_t v8 = [v7 propertyForKey:@"DuckingModeValue"];

  if (v8) {
    objc_msgSend(v5, "setChecked:", v6 == (int)objc_msgSend(v8, "intValue"));
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VoiceOverAudioDuckingController;
  [(VoiceOverAudioDuckingController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverAudioDuckingController;
  uint64_t v8 = [(VoiceOverAudioDuckingController *)&v12 tableView:v6 cellForRowAtIndexPath:v7];
  uint64_t v9 = [v8 specifier];
  objc_super v10 = [v9 propertyForKey:@"DuckingModeValue"];

  if (v10)
  {
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v10 forKey:*MEMORY[0x263F22B50]];
    [v6 deselectRowAtIndexPath:v7 animated:1];
    [(VoiceOverAudioDuckingController *)self updateTableCheckedSelection:v7];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotificationName:@"AXVoiceOverReloadNotification" object:0];
  }
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
      uint64_t v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", i, objc_msgSend(v11, "section"));
      objc_super v10 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) cellForRowAtIndexPath:v9];
      objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v11));
    }
  }
}

@end