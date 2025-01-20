@interface VoiceOverSoundsAndHapticsController
- (BOOL)hasSoundVolumeSpecifiers;
- (id)_soundVolumeSpecifiers;
- (id)specifiers;
- (id)voiceOverHapticsEnabled;
- (id)voiceOverSoundVolume;
- (id)voiceOverSoundsEnabled;
- (id)voiceOverSoundsMatchSpeechVolumeEnabled;
- (void)_clearSoundVolumeSpecifiers;
- (void)_createSoundVolumeSpecifiers;
- (void)_updateSoundVolumeSpecifiers:(BOOL)a3;
- (void)setVoiceOverHapticsEnabled:(id)a3;
- (void)setVoiceOverSoundVolume:(id)a3;
- (void)setVoiceOverSoundsEnabled:(id)a3;
- (void)setVoiceOverSoundsMatchSpeechVolumeEnabled:(id)a3;
@end

@implementation VoiceOverSoundsAndHapticsController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(VoiceOverSoundsAndHapticsController *)self loadSpecifiersFromPlistName:@"VoiceOverSoundsAndHapticsSettings" target:self];
    v6 = [v5 specifierForID:@"VOICEOVER_SOUNDS_GROUP_ID"];
    soundGroupSpecifier = self->_soundGroupSpecifier;
    self->_soundGroupSpecifier = v6;

    v8 = [v5 specifierForID:@"VOICEOVER_SOUNDS_ENABLED_SWITCH_ID"];
    soundsEnabledSpecifier = self->_soundsEnabledSpecifier;
    self->_soundsEnabledSpecifier = v8;

    v10 = [(VoiceOverSoundsAndHapticsController *)self voiceOverSoundsEnabled];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      [(VoiceOverSoundsAndHapticsController *)self _createSoundVolumeSpecifiers];
      v12 = [(VoiceOverSoundsAndHapticsController *)self _soundVolumeSpecifiers];
      objc_msgSend(v5, "ps_insertObjectsFromArray:afterObject:", v12, self->_soundsEnabledSpecifier);

      [(VoiceOverSoundsAndHapticsController *)self _updateSoundVolumeSpecifiers:0];
    }
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)voiceOverSoundsEnabled
{
  char v6 = 0;
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v3 = [v2 BOOLForKey:*MEMORY[0x263F22B38] keyExistsAndHasValidFormat:&v6];

  if (v6)
  {
    v4 = [NSNumber numberWithBool:v3];
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA88];
  }

  return v4;
}

- (void)setVoiceOverSoundsEnabled:(id)a3
{
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:a3 forKey:*MEMORY[0x263F22B38]];

  [(VoiceOverSoundsAndHapticsController *)self _updateSoundVolumeSpecifiers:1];
}

- (id)voiceOverSoundsMatchSpeechVolumeEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x263F22AD0]) ^ 1);

  return v4;
}

- (void)setVoiceOverSoundsMatchSpeechVolumeEnabled:(id)a3
{
  v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "BOOLValue") ^ 1);
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v4 forKey:*MEMORY[0x263F22AD0]];

  [(VoiceOverSoundsAndHapticsController *)self _updateSoundVolumeSpecifiers:1];
}

- (id)voiceOverSoundVolume
{
  v2 = NSNumber;
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 floatForKey:*MEMORY[0x263F22B40]];
  v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

- (void)setVoiceOverSoundVolume:(id)a3
{
}

- (id)voiceOverHapticsEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLForKey:", @"VoiceOverTouchDetentsEnabled"));

  return v4;
}

- (void)setVoiceOverHapticsEnabled:(id)a3
{
}

- (void)_createSoundVolumeSpecifiers
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  v4 = settingsLocString(@"SOUND_FOLLOWS_VOICEOVER_VOLUME", @"VoiceOverSoundsAndHapticsSettings");
  v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setVoiceOverSoundsMatchSpeechVolumeEnabled_ get:sel_voiceOverSoundsMatchSpeechVolumeEnabled detail:0 cell:6 edit:0];
  soundVolumeMatchesSpeechSwitchSpecifier = self->_soundVolumeMatchesSpeechSwitchSpecifier;
  self->_soundVolumeMatchesSpeechSwitchSpecifier = v5;

  v7 = (void *)MEMORY[0x263F5FC40];
  v8 = settingsLocString(@"SOUND_VOLUME", @"VoiceOverSoundsAndHapticsSettings");
  v9 = [v7 preferenceSpecifierNamed:v8 target:self set:sel_setVoiceOverSoundVolume_ get:sel_voiceOverSoundVolume detail:0 cell:5 edit:0];
  soundVolumeSliderSpecifier = self->_soundVolumeSliderSpecifier;
  self->_soundVolumeSliderSpecifier = v9;

  int v11 = self->_soundVolumeSliderSpecifier;
  v12 = AXVolumeMinImage();
  [(PSSpecifier *)v11 setProperty:v12 forKey:*MEMORY[0x263F60240]];

  v13 = self->_soundVolumeSliderSpecifier;
  v14 = AXVolumeMaxImage();
  [(PSSpecifier *)v13 setProperty:v14 forKey:*MEMORY[0x263F60250]];

  [(PSSpecifier *)self->_soundVolumeSliderSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60148]];
  [(PSSpecifier *)self->_soundVolumeSliderSpecifier setProperty:&unk_26FB00898 forKey:*MEMORY[0x263F60030]];
  v15 = self->_soundVolumeSliderSpecifier;
  uint64_t v16 = *MEMORY[0x263F60038];

  [(PSSpecifier *)v15 setProperty:&unk_26FB008A8 forKey:v16];
}

- (void)_clearSoundVolumeSpecifiers
{
  soundVolumeMatchesSpeechSwitchSpecifier = self->_soundVolumeMatchesSpeechSwitchSpecifier;
  self->_soundVolumeMatchesSpeechSwitchSpecifier = 0;

  soundVolumeSliderSpecifier = self->_soundVolumeSliderSpecifier;
  self->_soundVolumeSliderSpecifier = 0;
}

- (BOOL)hasSoundVolumeSpecifiers
{
  return self->_soundVolumeMatchesSpeechSwitchSpecifier != 0;
}

- (id)_soundVolumeSpecifiers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(VoiceOverSoundsAndHapticsController *)self hasSoundVolumeSpecifiers])
  {
    uint64_t v3 = [(VoiceOverSoundsAndHapticsController *)self voiceOverSoundsMatchSpeechVolumeEnabled];
    char v4 = [v3 BOOLValue];

    if (v4)
    {
      soundVolumeMatchesSpeechSwitchSpecifier = self->_soundVolumeMatchesSpeechSwitchSpecifier;
      v5 = (void *)MEMORY[0x263EFF8C0];
      p_soundVolumeMatchesSpeechSwitchSpecifier = &soundVolumeMatchesSpeechSwitchSpecifier;
      uint64_t v7 = 1;
    }
    else
    {
      soundVolumeSliderSpecifier = self->_soundVolumeSliderSpecifier;
      v12 = self->_soundVolumeMatchesSpeechSwitchSpecifier;
      v13 = soundVolumeSliderSpecifier;
      v5 = (void *)MEMORY[0x263EFF8C0];
      p_soundVolumeMatchesSpeechSwitchSpecifier = &v12;
      uint64_t v7 = 2;
    }
    v8 = objc_msgSend(v5, "arrayWithObjects:count:", p_soundVolumeMatchesSpeechSwitchSpecifier, v7, soundVolumeMatchesSpeechSwitchSpecifier, v12, v13);
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (void)_updateSoundVolumeSpecifiers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke;
  v22[3] = &unk_2651F26A8;
  BOOL v23 = a3;
  v22[4] = self;
  v22[5] = &v24;
  v5 = (void (**)(void, void))MEMORY[0x24C53FB60](v22, a2);
  char v6 = [(VoiceOverSoundsAndHapticsController *)self voiceOverSoundsEnabled];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    if (![(VoiceOverSoundsAndHapticsController *)self hasSoundVolumeSpecifiers])
    {
      [(VoiceOverSoundsAndHapticsController *)self _createSoundVolumeSpecifiers];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_2;
      v21[3] = &unk_2651F24D8;
      v21[4] = self;
      ((void (**)(void, void *))v5)[2](v5, v21);
    }
    v8 = [(VoiceOverSoundsAndHapticsController *)self voiceOverSoundsMatchSpeechVolumeEnabled];
    char v9 = [v8 BOOLValue];

    if (v9)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_4;
      v19[3] = &unk_2651F24D8;
      v19[4] = self;
      ((void (**)(void, void *))v5)[2](v5, v19);
    }
    else
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_3;
      v20[3] = &unk_2651F24D8;
      v20[4] = self;
      ((void (**)(void, void *))v5)[2](v5, v20);
    }
    if (v3)
    {
      v10 = [(VoiceOverSoundsAndHapticsController *)self voiceOverSoundsMatchSpeechVolumeEnabled];
      char v11 = [v10 BOOLValue];

      if (v11)
      {
        if (self->_soundVolumeSliderSpecifier)
        {
          v12 = [(VoiceOverSoundsAndHapticsController *)self specifiers];
          int v13 = [v12 containsObject:self->_soundVolumeSliderSpecifier];

          if (v13)
          {
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_6;
            v17[3] = &unk_2651F24D8;
            v17[4] = self;
            ((void (**)(void, void *))v5)[2](v5, v17);
          }
        }
      }
      else
      {
        uint64_t v14 = [(VoiceOverSoundsAndHapticsController *)self specifiers];
        char v15 = [v14 containsObject:self->_soundVolumeSliderSpecifier];

        if ((v15 & 1) == 0)
        {
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_5;
          v18[3] = &unk_2651F24D8;
          v18[4] = self;
          ((void (**)(void, void *))v5)[2](v5, v18);
        }
      }
    }
  }
  else
  {
    [(PSSpecifier *)self->_soundGroupSpecifier setProperty:&stru_26FAF8CF0 forKey:*MEMORY[0x263F600F8]];
    if ([(VoiceOverSoundsAndHapticsController *)self hasSoundVolumeSpecifiers])
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_7;
      v16[3] = &unk_2651F24D8;
      v16[4] = self;
      ((void (**)(void, void *))v5)[2](v5, v16);
    }
  }
  if (*((unsigned char *)v25 + 24)) {
    [(VoiceOverSoundsAndHapticsController *)self endUpdates];
  }

  _Block_object_dispose(&v24, 8);
}

void __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && *(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) beginUpdates];
    id v3 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  (*((void (**)(void))v3 + 2))();
}

void __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 _soundVolumeSpecifiers];
  [v2 insertContiguousSpecifiers:v3 afterSpecifier:*(void *)(*(void *)(a1 + 32) + 1392) animated:0];
}

void __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1384);
  settingsLocString(@"SOUND_FOLLOWS_FOOTER_DISABLED", @"VoiceOverSoundsAndHapticsSettings");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setProperty:v2 forKey:*MEMORY[0x263F600F8]];
}

void __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1384);
  settingsLocString(@"SOUND_FOLLOWS_FOOTER_ENABLED", @"VoiceOverSoundsAndHapticsSettings");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setProperty:v2 forKey:*MEMORY[0x263F600F8]];
}

uint64_t __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertSpecifier:*(void *)(*(void *)(a1 + 32) + 1408) afterSpecifier:*(void *)(*(void *)(a1 + 32) + 1400) animated:1];
}

uint64_t __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSpecifier:*(void *)(*(void *)(a1 + 32) + 1408) animated:1];
}

uint64_t __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_7(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 _soundVolumeSpecifiers];
  [v2 removeContiguousSpecifiers:v3 animated:0];

  id v4 = *(void **)(a1 + 32);

  return [v4 _clearSoundVolumeSpecifiers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundVolumeSliderSpecifier, 0);
  objc_storeStrong((id *)&self->_soundVolumeMatchesSpeechSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_soundsEnabledSpecifier, 0);

  objc_storeStrong((id *)&self->_soundGroupSpecifier, 0);
}

@end