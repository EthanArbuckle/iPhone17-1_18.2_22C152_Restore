@interface VoiceOverSoundsAndHapticsController
- (BOOL)hasSoundVolumeSpecifiers;
- (id)_soundVolumeSpecifiers;
- (id)hapticIntensity:(id)a3;
- (id)hapticsEnabled:(id)a3;
- (id)matchSpeechVolume:(id)a3;
- (id)soundEffectsEnabled:(id)a3;
- (id)soundVolume:(id)a3;
- (id)specifiers;
- (void)_clearSoundVolumeSpecifiers;
- (void)_createSoundVolumeSpecifiers;
- (void)_updateSoundVolumeSpecifiers:(BOOL)a3;
- (void)dealloc;
- (void)dispatcher:(id)a3 handleEvent:(id)a4 soundPack:(id)a5 hapticPack:(id)a6;
- (void)setHapticIntensity:(id)a3 specifier:(id)a4;
- (void)setHapticsEnabled:(id)a3 specifier:(id)a4;
- (void)setMatchSpeechVolume:(id)a3 specifier:(id)a4;
- (void)setSoundEffectsEnabled:(id)a3 specifier:(id)a4;
- (void)setSoundVolume:(id)a3 specifier:(id)a4;
@end

@implementation VoiceOverSoundsAndHapticsController

- (void)dealloc
{
  v3 = +[VOSOutputEventDispatcher sharedInstance];
  [v3 removeEventHandler:self];

  v4.receiver = self;
  v4.super_class = (Class)VoiceOverSoundsAndHapticsController;
  [(VoiceOverSoundsAndHapticsController *)&v4 dealloc];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v49 = OBJC_IVAR___PSListController__specifiers;
    if (!self->_outputManager)
    {
      objc_super v4 = objc_opt_new();
      [v4 setUsesPrivateAudioSession:1];
      [v4 setComponents:6];
      [v4 setHapticEngineUsesAutoShutdown:1];
      [v4 setHapticEngineAutoShutdownTimeout:15.0];
      [v4 setHapticEngineUsesHapticsOnly:1];
      v5 = (AXMOutputManager *)[objc_alloc((Class)AXMOutputManager) initWithConfiguration:v4];
      outputManager = self->_outputManager;
      self->_outputManager = v5;

      [(AXMOutputManager *)self->_outputManager enableWithCompletion:&__block_literal_global_47];
      v7 = +[VOSOutputEventDispatcher sharedInstance];
      [v7 addEventHandler:self];
    }
    v8 = objc_opt_new();
    v9 = settingsLocString(@"SOUND_EFFECTS", @"VoiceOverSettings");
    v10 = +[PSSpecifier groupSpecifierWithName:v9];
    soundGroupSpecifier = self->_soundGroupSpecifier;
    self->_soundGroupSpecifier = v10;

    v12 = settingsLocString(@"SOUND_EFFECTS", @"VoiceOverSettings");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"setSoundEffectsEnabled:specifier:" get:"soundEffectsEnabled:" detail:0 cell:6 edit:0];
    soundsEnabledSpecifier = self->_soundsEnabledSpecifier;
    self->_soundsEnabledSpecifier = v13;

    [v8 addObject:self->_soundGroupSpecifier];
    v57 = v8;
    [v8 addObject:self->_soundsEnabledSpecifier];
    v15 = [(VoiceOverSoundsAndHapticsController *)self soundEffectsEnabled:0];
    LODWORD(v12) = [v15 BOOLValue];

    if (v12)
    {
      [(VoiceOverSoundsAndHapticsController *)self _createSoundVolumeSpecifiers];
      v16 = [(VoiceOverSoundsAndHapticsController *)self _soundVolumeSpecifiers];
      [v8 addObjectsFromArray:v16];

      [(VoiceOverSoundsAndHapticsController *)self _updateSoundVolumeSpecifiers:0];
    }
    unsigned int v58 = +[AXMHapticComponent isSupported];
    if (v58)
    {
      v17 = settingsLocString(@"HAPTICS_ENABLED_ITEM", @"VoiceOverSettings");
      v18 = +[PSSpecifier groupSpecifierWithName:v17];

      [v57 addObject:v18];
      v19 = settingsLocString(@"HAPTICS_ENABLED_ITEM", @"VoiceOverSettings");
      v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"setHapticsEnabled:specifier:" get:"hapticsEnabled:" detail:0 cell:6 edit:0];

      [v57 addObject:v20];
      v21 = settingsLocString(@"HAPTIC_INTENSITY", @"VoiceOverSettings");
      v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:"setHapticIntensity:specifier:" get:"hapticIntensity:" detail:0 cell:5 edit:0];

      v23 = AXSpeakerMaxImage();
      [v22 setProperty:v23 forKey:PSSliderRightImageKey];

      v24 = AXSpeakerMuteImage();
      [v22 setProperty:v24 forKey:PSSliderLeftImageKey];

      [v22 setProperty:&off_22C400 forKey:PSControlMaximumKey];
      [v22 setProperty:&off_22C410 forKey:PSControlMinimumKey];
      [v22 setProperty:&__kCFBooleanTrue forKey:PSIconImageShouldFlipForRightToLeftKey];
      [v57 addObject:v22];
    }
    else
    {
      v22 = 0;
      v18 = 0;
    }
    v56 = self;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = +[VOSOutputEventCategory allCategories];
    id v52 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v52)
    {
      uint64_t v51 = *(void *)v64;
      uint64_t v55 = PSCellClassKey;
      do
      {
        uint64_t v25 = 0;
        v26 = v18;
        do
        {
          if (*(void *)v64 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = v25;
          v27 = *(void **)(*((void *)&v63 + 1) + 8 * v25);
          v28 = [v27 localizedCategoryName];
          uint64_t v29 = +[PSSpecifier groupSpecifierWithName:v28];

          v54 = (void *)v29;
          [v57 addObject:v29];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          v30 = [v27 outputEvents];
          id v31 = [v30 countByEnumeratingWithState:&v59 objects:v67 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v60;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v60 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                v36 = +[VOSOutputEvent TouchIDAuthenticated];
                if ([v35 isEqual:v36])
                {
                  int HasHomeButton = AXDeviceHasHomeButton();

                  if (!HasHomeButton) {
                    continue;
                  }
                }
                else
                {
                  v38 = +[VOSOutputEvent TouchIDFailed];
                  if ([v35 isEqual:v38])
                  {
                    char v39 = AXDeviceHasHomeButton();

                    if ((v39 & 1) == 0) {
                      continue;
                    }
                  }
                  else
                  {
                  }
                }
                v40 = +[VOSOutputEvent DockDidAppear];
                if ([v35 isEqual:v40])
                {
                  int IsPad = AXDeviceIsPad();

                  if (!IsPad) {
                    continue;
                  }
                }
                else
                {
                  v42 = +[VOSOutputEvent DockDidAppear];
                  if ([v35 isEqual:v42])
                  {
                    char v43 = AXDeviceIsPad();

                    if ((v43 & 1) == 0) {
                      continue;
                    }
                  }
                  else
                  {
                  }
                }
                if (v58 && ([v35 supportsHaptic] & 1) != 0
                  || [v35 supportsSoundEffect])
                {
                  v44 = [v35 localizedName];
                  v45 = +[PSSpecifier preferenceSpecifierNamed:v44 target:v56 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

                  [v45 setVosOutputEvent:v35];
                  [v45 setProperty:objc_opt_class() forKey:v55];
                  [v57 addObject:v45];
                  v22 = v45;
                }
              }
              id v32 = [v30 countByEnumeratingWithState:&v59 objects:v67 count:16];
            }
            while (v32);
          }

          v18 = v54;
          uint64_t v25 = v53 + 1;
          v26 = v54;
        }
        while ((id)(v53 + 1) != v52);
        id v52 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
      }
      while (v52);
    }

    [(VoiceOverSoundsAndHapticsController *)v56 setupLongTitleSpecifiers:v57];
    v46 = *(void **)&v56->AXUISettingsBaseListController_opaque[v49];
    *(void *)&v56->AXUISettingsBaseListController_opaque[v49] = v57;
    id v47 = v57;

    v3 = *(void **)&v56->AXUISettingsBaseListController_opaque[v49];
  }

  return v3;
}

- (void)_createSoundVolumeSpecifiers
{
  v3 = settingsLocString(@"SOUND_FOLLOWS_VOICEOVER_VOLUME", @"VoiceOverSettings");
  objc_super v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setMatchSpeechVolume:specifier:" get:"matchSpeechVolume:" detail:0 cell:6 edit:0];
  soundVolumeAdjustsIndependentlySpecifier = self->_soundVolumeAdjustsIndependentlySpecifier;
  self->_soundVolumeAdjustsIndependentlySpecifier = v4;

  [(PSSpecifier *)self->_soundVolumeAdjustsIndependentlySpecifier setProperty:objc_opt_class() forKey:PSCellClassKey];
  v6 = settingsLocString(@"SOUND_VOLUME", @"VoiceOverSettings");
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setSoundVolume:specifier:" get:"soundVolume:" detail:0 cell:5 edit:0];
  soundVolumeSliderSpecifier = self->_soundVolumeSliderSpecifier;
  self->_soundVolumeSliderSpecifier = v7;

  v9 = self->_soundVolumeSliderSpecifier;
  v10 = AXSpeakerMaxImage();
  [(PSSpecifier *)v9 setProperty:v10 forKey:PSSliderRightImageKey];

  v11 = self->_soundVolumeSliderSpecifier;
  v12 = AXSpeakerMuteImage();
  [(PSSpecifier *)v11 setProperty:v12 forKey:PSSliderLeftImageKey];

  [(PSSpecifier *)self->_soundVolumeSliderSpecifier setProperty:&off_22C400 forKey:PSControlMaximumKey];
  [(PSSpecifier *)self->_soundVolumeSliderSpecifier setProperty:&off_22C410 forKey:PSControlMinimumKey];
  v13 = self->_soundVolumeSliderSpecifier;
  uint64_t v14 = PSIconImageShouldFlipForRightToLeftKey;

  [(PSSpecifier *)v13 setProperty:&__kCFBooleanTrue forKey:v14];
}

- (void)_clearSoundVolumeSpecifiers
{
  soundVolumeSliderSpecifier = self->_soundVolumeSliderSpecifier;
  self->_soundVolumeSliderSpecifier = 0;

  soundVolumeAdjustsIndependentlySpecifier = self->_soundVolumeAdjustsIndependentlySpecifier;
  self->_soundVolumeAdjustsIndependentlySpecifier = 0;
}

- (BOOL)hasSoundVolumeSpecifiers
{
  return self->_soundVolumeAdjustsIndependentlySpecifier != 0;
}

- (id)_soundVolumeSpecifiers
{
  if (self->_soundVolumeAdjustsIndependentlySpecifier)
  {
    v3 = +[AXSettings sharedInstance];
    unsigned int v4 = [v3 voiceOverAdjustSoundVolumeIndependently];

    if (v4)
    {
      soundVolumeSliderSpecifier = self->_soundVolumeSliderSpecifier;
      soundVolumeAdjustsIndependentlySpecifier = self->_soundVolumeAdjustsIndependentlySpecifier;
      v12 = soundVolumeSliderSpecifier;
      p_soundVolumeAdjustsIndependentlySpecifier = &soundVolumeAdjustsIndependentlySpecifier;
      uint64_t v7 = 2;
    }
    else
    {
      v10 = self->_soundVolumeAdjustsIndependentlySpecifier;
      p_soundVolumeAdjustsIndependentlySpecifier = &v10;
      uint64_t v7 = 1;
    }
    v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_soundVolumeAdjustsIndependentlySpecifier, v7, v10, soundVolumeAdjustsIndependentlySpecifier, v12);
  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)_updateSoundVolumeSpecifiers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke;
  v24[3] = &unk_20B448;
  BOOL v25 = a3;
  v24[4] = self;
  v24[5] = &v26;
  v5 = objc_retainBlock(v24);
  v6 = [(VoiceOverSoundsAndHapticsController *)self soundEffectsEnabled:0];
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    if (![(VoiceOverSoundsAndHapticsController *)self hasSoundVolumeSpecifiers])
    {
      [(VoiceOverSoundsAndHapticsController *)self _createSoundVolumeSpecifiers];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_2;
      v23[3] = &unk_2087C0;
      v23[4] = self;
      ((void (*)(void *, void *))v5[2])(v5, v23);
    }
    v8 = +[AXSettings sharedInstance];
    unsigned int v9 = [v8 voiceOverAdjustSoundVolumeIndependently];

    if (v9)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_3;
      v22[3] = &unk_2087C0;
      v22[4] = self;
      ((void (*)(void *, void *))v5[2])(v5, v22);
    }
    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_4;
      v21[3] = &unk_2087C0;
      v21[4] = self;
      ((void (*)(void *, void *))v5[2])(v5, v21);
    }
    if (v3)
    {
      v10 = +[AXSettings sharedInstance];
      unsigned int v11 = [v10 voiceOverAdjustSoundVolumeIndependently];

      if (v11)
      {
        v12 = [(VoiceOverSoundsAndHapticsController *)self specifiers];
        unsigned __int8 v13 = [v12 containsObject:self->_soundVolumeSliderSpecifier];

        if ((v13 & 1) == 0)
        {
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_5;
          v20[3] = &unk_2087C0;
          v20[4] = self;
          ((void (*)(void *, void *))v5[2])(v5, v20);
        }
      }
      else if (self->_soundVolumeSliderSpecifier)
      {
        uint64_t v14 = [(VoiceOverSoundsAndHapticsController *)self specifiers];
        unsigned int v15 = [v14 containsObject:self->_soundVolumeSliderSpecifier];

        if (v15)
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_6;
          v19[3] = &unk_2087C0;
          v19[4] = self;
          ((void (*)(void *, void *))v5[2])(v5, v19);
        }
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_7;
      v18[3] = &unk_2087C0;
      v18[4] = self;
      ((void (*)(void *, void *))v5[2])(v5, v18);
    }
  }
  else
  {
    [(PSSpecifier *)self->_soundGroupSpecifier setProperty:&stru_20F6B8 forKey:PSFooterTextGroupKey];
    if ([(VoiceOverSoundsAndHapticsController *)self hasSoundVolumeSpecifiers])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_8;
      v17[3] = &unk_2087C0;
      v17[4] = self;
      ((void (*)(void *, void *))v5[2])(v5, v17);
    }
    if (v3)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_9;
      v16[3] = &unk_2087C0;
      v16[4] = self;
      ((void (*)(void *, void *))v5[2])(v5, v16);
    }
  }
  if (*((unsigned char *)v27 + 24)) {
    [(VoiceOverSoundsAndHapticsController *)self endUpdates];
  }

  _Block_object_dispose(&v26, 8);
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
  [v2 insertContiguousSpecifiers:v3 afterSpecifier:*(void *)(*(void *)(a1 + 32) + 208) animated:0];
}

void __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 200);
  settingsLocString(@"SOUND_FOLLOWS_FOOTER_DISABLED", @"VoiceOverSettings");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setProperty:v2 forKey:PSFooterTextGroupKey];
}

void __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 200);
  settingsLocString(@"SOUND_FOLLOWS_FOOTER_ENABLED", @"VoiceOverSettings");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setProperty:v2 forKey:PSFooterTextGroupKey];
}

id __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertSpecifier:*(void *)(*(void *)(a1 + 32) + 224) afterSpecifier:*(void *)(*(void *)(a1 + 32) + 216) animated:1];
}

id __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSpecifier:*(void *)(*(void *)(a1 + 32) + 224) animated:1];
}

id __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 200) animated:1];
}

id __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 _soundVolumeSpecifiers];
  [v2 removeContiguousSpecifiers:v3 animated:0];

  id v4 = *(void **)(a1 + 32);

  return [v4 _clearSoundVolumeSpecifiers];
}

id __68__VoiceOverSoundsAndHapticsController__updateSoundVolumeSpecifiers___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 200) animated:1];
}

- (void)setSoundEffectsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  v6 = +[AXSettings sharedInstance];
  [v6 setVoiceOverSoundEffectsEnabled:v5];

  [(VoiceOverSoundsAndHapticsController *)self _updateSoundVolumeSpecifiers:1];
}

- (id)soundEffectsEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSoundEffectsEnabled]);

  return v4;
}

- (void)setSoundVolume:(id)a3 specifier:(id)a4
{
  [a3 doubleValue];
  double v5 = v4;
  id v6 = +[AXSettings sharedInstance];
  [v6 setVoiceOverSoundVolume:v5];
}

- (id)soundVolume:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 voiceOverSoundVolume];
  double v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (void)setMatchSpeechVolume:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue] ^ 1;
  id v6 = +[AXSettings sharedInstance];
  [v6 setVoiceOverAdjustSoundVolumeIndependently:v5];

  [(VoiceOverSoundsAndHapticsController *)self _updateSoundVolumeSpecifiers:1];
}

- (id)matchSpeechVolume:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  double v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 voiceOverAdjustSoundVolumeIndependently] ^ 1);

  return v4;
}

- (void)setHapticsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverHapticsEnabled:v4];
}

- (id)hapticsEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverHapticsEnabled]);

  return v4;
}

- (void)setHapticIntensity:(id)a3 specifier:(id)a4
{
  [a3 doubleValue];
  double v5 = v4;
  id v6 = +[AXSettings sharedInstance];
  [v6 setVoiceOverHapticIntensity:v5];
}

- (id)hapticIntensity:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 voiceOverHapticIntensity];
  double v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (void)dispatcher:(id)a3 handleEvent:(id)a4 soundPack:(id)a5 hapticPack:(id)a6
{
  id v15 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)AXMOutputRequest);
  v12 = [v10 soundAssetURLForOutputEvent:v15];

  if (v12) {
    [v11 addSoundItemWithURL:v12];
  }
  unsigned __int8 v13 = [v9 hapticAssetURLForOutputEvent:v15];
  if (v13) {
    [v11 addHapticItemWithURL:v13];
  }
  id v14 = [(AXMOutputManager *)self->_outputManager dispatchRequest:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundVolumeSliderSpecifier, 0);
  objc_storeStrong((id *)&self->_soundVolumeAdjustsIndependentlySpecifier, 0);
  objc_storeStrong((id *)&self->_soundsEnabledSpecifier, 0);
  objc_storeStrong((id *)&self->_soundGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_soundGroupPrecedingSpecifier, 0);

  objc_storeStrong((id *)&self->_outputManager, 0);
}

@end