@interface VoiceOverSpeakSecondsDetailController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_selectedEncoding;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTableCheckedSelection:(id)a3;
@end

@implementation VoiceOverSpeakSecondsDetailController

- (id)specifiers
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v17 = (int)*MEMORY[0x263F5FDB8];
    v18 = self;
    -[VoiceOverSpeakSecondsDetailController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", @"SpeakSecondsSettings");
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v9 = [v8 identifier];
          int v10 = [v9 isEqualToString:@"VOICEOVER_SPEAK_SECONDS_ALWAYS"];

          if (v10) {
            [v8 setProperty:&unk_26FB006B8 forKey:@"SpeakSecondsEncoding"];
          }
          v11 = [v8 identifier];
          int v12 = [v11 isEqualToString:@"VOICEOVER_SPEAK_SECONDS_IF_DISPLAYED"];

          if (v12) {
            [v8 setProperty:&unk_26FB006D0 forKey:@"SpeakSecondsEncoding"];
          }
          v13 = [v8 identifier];
          int v14 = [v13 isEqualToString:@"VOICEOVER_SPEAK_SECONDS_NEVER"];

          if (v14) {
            [v8 setProperty:&unk_26FB006E8 forKey:@"SpeakSecondsEncoding"];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v5);
    }
    v15 = *(Class *)((char *)&v18->super.super.super.super.super.super.isa + v17);
    *(Class *)((char *)&v18->super.super.super.super.super.super.isa + v17) = (Class)obj;

    v3 = *(Class *)((char *)&v18->super.super.super.super.super.super.isa + v17);
  }

  return v3;
}

- (int64_t)_selectedEncoding
{
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v3 = [v2 objectForKey:@"VoiceOverSpeakSecondsEncoding"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VoiceOverSpeakSecondsDetailController;
  uint64_t v5 = [(VoiceOverSpeakSecondsDetailController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  int64_t v6 = [(VoiceOverSpeakSecondsDetailController *)self _selectedEncoding];
  v7 = [v5 specifier];
  v8 = [v7 propertyForKey:@"SpeakSecondsEncoding"];

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
  v13.super_class = (Class)VoiceOverSpeakSecondsDetailController;
  [(VoiceOverSpeakSecondsDetailController *)&v13 tableView:v6 didSelectRowAtIndexPath:v7];
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverSpeakSecondsDetailController;
  v8 = [(VoiceOverSpeakSecondsDetailController *)&v12 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = [v8 specifier];
  objc_super v10 = [v9 propertyForKey:@"SpeakSecondsEncoding"];

  if (v10)
  {
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v10 forKey:@"VoiceOverSpeakSecondsEncoding"];
    [v6 deselectRowAtIndexPath:v7 animated:1];
    [(VoiceOverSpeakSecondsDetailController *)self updateTableCheckedSelection:v7];
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
      v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", i, objc_msgSend(v11, "section"));
      objc_super v10 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) cellForRowAtIndexPath:v9];
      objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v11));
    }
  }
}

@end