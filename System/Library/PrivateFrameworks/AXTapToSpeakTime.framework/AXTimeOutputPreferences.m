@interface AXTimeOutputPreferences
+ (id)sharedInstance;
- (BOOL)_npsBoolValueForPreferenceKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_voiceOverIsEnabled;
- (BOOL)_voiceOverIsInTripleClick;
- (BOOL)tapToSpeakTimeEnabled;
- (BOOL)voiceOverTapticChimesEnabled;
- (BOOL)voiceOverTapticTimeMode;
- (id)_npsValueForPreferenceKey:(id)a3;
- (id)_npsValueForPreferenceKey:(id)a3 expectedClass:(Class)a4;
- (id)accessibilityDomainAccessor;
- (id)localizedStringForKey:(id)a3;
- (id)localizedStringForTapToSpeakTimeAvailability:(int64_t)a3;
- (id)localizedStringForTapticChimesFrequencyEncoding:(int64_t)a3;
- (id)localizedStringForTapticChimesSoundType:(int64_t)a3;
- (id)localizedStringForTapticTimeEncoding:(int64_t)a3;
- (id)tapToSpeakAvailabilityOptions;
- (id)tapToSpeakTimeLocalizedDescription;
- (id)tapToSpeakTimeLocalizedTitle;
- (id)tapticChimesFrequencyOptions;
- (id)tapticChimesLocalizedCurrentFrequency;
- (id)tapticChimesLocalizedCurrentSounds;
- (id)tapticChimesLocalizedDescription;
- (id)tapticChimesLocalizedTitle;
- (id)tapticChimesScheduleLocalizedTitle;
- (id)tapticChimesSoundsLocalizedTitle;
- (id)tapticChimesSoundsOptions;
- (id)tapticTimeEncodingOptions;
- (id)tapticTimeLocalizedCurrentMode;
- (id)tapticTimeLocalizedDescription;
- (id)tapticTimeLocalizedTitle;
- (id)tapticTimeModeLocalizedDescription;
- (int64_t)_npsIntegerValueForPreferenceKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)tapToSpeakTimeAvailability;
- (int64_t)voiceOverTapticChimesFrequencyEncoding;
- (int64_t)voiceOverTapticChimesSoundType;
- (int64_t)voiceOverTapticTimeEncoding;
- (void)_setNPSValue:(id)a3 preferenceKey:(id)a4;
- (void)setTapToSpeakTimeAvailability:(int64_t)a3;
- (void)setTapToSpeakTimeEnabled:(BOOL)a3;
- (void)setVoiceOverTapticChimesEnabled:(BOOL)a3;
- (void)setVoiceOverTapticChimesFrequencyEncoding:(int64_t)a3;
- (void)setVoiceOverTapticChimesSoundType:(int64_t)a3;
- (void)setVoiceOverTapticTimeEncoding:(int64_t)a3;
- (void)setVoiceOverTapticTimeMode:(BOOL)a3;
@end

@implementation AXTimeOutputPreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_TimeOutputPreferences;
  return v2;
}

id __41__AXTimeOutputPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXTimeOutputPreferences);
  v1 = (void *)sharedInstance_TimeOutputPreferences;
  sharedInstance_TimeOutputPreferences = (uint64_t)v0;

  return (id)[MEMORY[0x263F22938] sharedInstance];
}

- (id)accessibilityDomainAccessor
{
  id v2 = objc_alloc(MEMORY[0x263F57520]);
  v3 = (void *)[v2 initWithDomain:*MEMORY[0x263F8B0F8]];
  return v3;
}

- (id)_npsValueForPreferenceKey:(id)a3
{
  return [(AXTimeOutputPreferences *)self _npsValueForPreferenceKey:a3 expectedClass:0];
}

- (id)_npsValueForPreferenceKey:(id)a3 expectedClass:(Class)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(AXTimeOutputPreferences *)self accessibilityDomainAccessor];
    id v8 = (id)[v7 synchronize];
    uint64_t v9 = [v7 objectForKey:v6];
    v10 = (void *)v9;
    if (a4 && v9 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = AXLogTapticTime();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:]((uint64_t)v10, a4, v12);
      }

      id v11 = 0;
    }
    else
    {
      id v11 = v10;
    }
  }
  else
  {
    v7 = AXLogTapticTime();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:]();
    }
    id v11 = 0;
  }

  return v11;
}

- (void)_setNPSValue:(id)a3 preferenceKey:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(AXTimeOutputPreferences *)self accessibilityDomainAccessor];
    uint64_t v9 = v8;
    if (v8)
    {
      v10 = [v8 domain];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        [v9 setObject:v6 forKey:v7];
        id v12 = (id)[v9 synchronize];
        v13 = objc_opt_new();
        v14 = [v9 domain];
        v15 = (void *)MEMORY[0x263EFFA08];
        v18[0] = v7;
        v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
        v17 = [v15 setWithArray:v16];
        [v13 synchronizeNanoDomain:v14 keys:v17];
      }
      else
      {
        v13 = AXLogTapticTime();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[AXTimeOutputPreferences _setNPSValue:preferenceKey:]();
        }
      }
    }
    else
    {
      v13 = AXLogTapticTime();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[AXTimeOutputPreferences _setNPSValue:preferenceKey:]();
      }
    }
  }
  else
  {
    uint64_t v9 = AXLogTapticTime();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:]();
    }
  }
}

- (BOOL)_npsBoolValueForPreferenceKey:(id)a3 defaultValue:(BOOL)a4
{
  v5 = [(AXTimeOutputPreferences *)self _npsValueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (int64_t)_npsIntegerValueForPreferenceKey:(id)a3 defaultValue:(int64_t)a4
{
  v5 = [(AXTimeOutputPreferences *)self _npsValueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (BOOL)_voiceOverIsEnabled
{
  return [(AXTimeOutputPreferences *)self _npsBoolValueForPreferenceKey:*MEMORY[0x263F8B3F8] defaultValue:0];
}

- (BOOL)_voiceOverIsInTripleClick
{
  id v2 = [(AXTimeOutputPreferences *)self _npsValueForPreferenceKey:@"TripleClickOptions" expectedClass:objc_opt_class()];
  if (v2) {
    BOOL v3 = _AXSTripleClickContainsOption() != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)tapToSpeakTimeEnabled
{
  id v2 = self;
  BOOL v3 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_tapToSpeakTimeEnabled];
  LOBYTE(v2) = [(AXTimeOutputPreferences *)v2 _npsBoolValueForPreferenceKey:v3 defaultValue:*MEMORY[0x263F21278]];

  return (char)v2;
}

- (void)setTapToSpeakTimeEnabled:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  v4 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_tapToSpeakTimeEnabled];
  [(AXTimeOutputPreferences *)self _setNPSValue:v5 preferenceKey:v4];
}

- (int64_t)tapToSpeakTimeAvailability
{
  BOOL v3 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_tapToSpeakTimeAvailability];
  int64_t v4 = [(AXTimeOutputPreferences *)self _npsIntegerValueForPreferenceKey:v3 defaultValue:*MEMORY[0x263F21270]];

  return v4;
}

- (void)setTapToSpeakTimeAvailability:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  int64_t v4 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_tapToSpeakTimeAvailability];
  [(AXTimeOutputPreferences *)self _setNPSValue:v5 preferenceKey:v4];
}

- (BOOL)voiceOverTapticTimeMode
{
  BOOL v3 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticTimeMode];
  if (![(AXTimeOutputPreferences *)self _voiceOverIsEnabled]
    || ([(AXTimeOutputPreferences *)self _npsValueForPreferenceKey:v3],
        int64_t v4 = objc_claimAutoreleasedReturnValue(),
        BOOL v5 = *MEMORY[0x263F21290] != 0,
        v4,
        v4))
  {
    BOOL v5 = [(AXTimeOutputPreferences *)self _npsBoolValueForPreferenceKey:v3 defaultValue:*MEMORY[0x263F21288]];
  }

  return v5;
}

- (void)setVoiceOverTapticTimeMode:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  int64_t v4 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticTimeMode];
  [(AXTimeOutputPreferences *)self _setNPSValue:v5 preferenceKey:v4];
}

- (int64_t)voiceOverTapticTimeEncoding
{
  BOOL v3 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticTimeEncoding];
  int64_t v4 = [(AXTimeOutputPreferences *)self _npsIntegerValueForPreferenceKey:v3 defaultValue:*MEMORY[0x263F212A8]];

  return v4;
}

- (void)setVoiceOverTapticTimeEncoding:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  int64_t v4 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticTimeEncoding];
  [(AXTimeOutputPreferences *)self _setNPSValue:v5 preferenceKey:v4];
}

- (BOOL)voiceOverTapticChimesEnabled
{
  id v2 = self;
  BOOL v3 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticChimesEnabled];
  LOBYTE(v2) = [(AXTimeOutputPreferences *)v2 _npsBoolValueForPreferenceKey:v3 defaultValue:*MEMORY[0x263F21280]];

  return (char)v2;
}

- (void)setVoiceOverTapticChimesEnabled:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  int64_t v4 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticChimesEnabled];
  [(AXTimeOutputPreferences *)self _setNPSValue:v5 preferenceKey:v4];
}

- (int64_t)voiceOverTapticChimesFrequencyEncoding
{
  BOOL v3 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticChimesFrequencyEncoding];
  int64_t v4 = [(AXTimeOutputPreferences *)self _npsIntegerValueForPreferenceKey:v3 defaultValue:*MEMORY[0x263F21298]];

  return v4;
}

- (void)setVoiceOverTapticChimesFrequencyEncoding:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  int64_t v4 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticChimesFrequencyEncoding];
  [(AXTimeOutputPreferences *)self _setNPSValue:v5 preferenceKey:v4];
}

- (int64_t)voiceOverTapticChimesSoundType
{
  BOOL v3 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticChimesSoundType];
  int64_t v4 = [(AXTimeOutputPreferences *)self _npsIntegerValueForPreferenceKey:v3 defaultValue:*MEMORY[0x263F212A0]];

  return v4;
}

- (void)setVoiceOverTapticChimesSoundType:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  int64_t v4 = [(AXBaseSettings *)self preferenceKeyForSelector:sel_voiceOverTapticChimesSoundType];
  [(AXTimeOutputPreferences *)self _setNPSValue:v5 preferenceKey:v4];
}

- (id)tapticChimesFrequencyOptions
{
  return &unk_26E8806B0;
}

- (id)tapticChimesSoundsOptions
{
  return &unk_26E8806C8;
}

- (id)tapToSpeakAvailabilityOptions
{
  return &unk_26E8806E0;
}

- (id)tapticTimeEncodingOptions
{
  return &unk_26E8806F8;
}

- (id)localizedStringForKey:(id)a3
{
  uint64_t v3 = localizedStringForKey__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&localizedStringForKey__onceToken, &__block_literal_global_302);
  }
  id v5 = [(id)localizedStringForKey___Bundle localizedStringForKey:v4 value:0 table:@"Localizable"];

  return v5;
}

uint64_t __49__AXTimeOutputPreferences_localizedStringForKey___block_invoke()
{
  localizedStringForKey___Bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

- (id)tapticChimesLocalizedTitle
{
  return [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAPTIC_CHIMES_TITLE"];
}

- (id)tapticChimesLocalizedDescription
{
  uint64_t v3 = +[AXTimeOutputPreferences sharedInstance];
  uint64_t v4 = [v3 voiceOverTapticChimesFrequencyEncoding];

  if ((unint64_t)(v4 - 1) <= 2)
  {
    id v5 = [(AXTimeOutputPreferences *)self localizedStringForKey:off_264C4E460[v4 - 1]];
  }
  return v5;
}

- (id)tapticChimesLocalizedCurrentFrequency
{
  uint64_t v3 = +[AXTimeOutputPreferences sharedInstance];
  uint64_t v4 = -[AXTimeOutputPreferences localizedStringForTapticChimesFrequencyEncoding:](self, "localizedStringForTapticChimesFrequencyEncoding:", [v3 voiceOverTapticChimesFrequencyEncoding]);

  return v4;
}

- (id)tapticChimesLocalizedCurrentSounds
{
  uint64_t v3 = +[AXTimeOutputPreferences sharedInstance];
  uint64_t v4 = -[AXTimeOutputPreferences localizedStringForTapticChimesSoundType:](self, "localizedStringForTapticChimesSoundType:", [v3 voiceOverTapticChimesSoundType]);

  return v4;
}

- (id)tapticChimesScheduleLocalizedTitle
{
  return [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAPTIC_CHIMES_SCHEDULE_TITLE"];
}

- (id)tapticChimesSoundsLocalizedTitle
{
  return [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAPTIC_CHIMES_SOUNDS_TITLE"];
}

- (id)localizedStringForTapticChimesFrequencyEncoding:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2)
  {
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", off_264C4E478[a3 - 1], v3);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (id)localizedStringForTapticChimesSoundType:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = @"TAPTIC_CHIMES_SOUND_BELLS_LABEL";
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    id v5 = @"TAPTIC_CHIMES_SOUND_BIRDS_LABEL";
  }
  -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", v5, v3);
  a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return (id)(id)a2;
}

- (id)tapToSpeakTimeLocalizedTitle
{
  return [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAP_TO_SPEAK_TITLE"];
}

- (id)tapToSpeakTimeLocalizedDescription
{
  return [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAP_TO_SPEAK_DESCRIPTION"];
}

- (id)localizedStringForTapToSpeakTimeAvailability:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = @"TAP_TO_SPEAK_RESPECT_MUTE_LABEL";
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    id v5 = @"TAP_TO_SPEAK_ALWAYS_LABEL";
  }
  -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", v5, v3);
  a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return (id)(id)a2;
}

- (id)tapticTimeLocalizedTitle
{
  return [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAPTIC_TIME_TITLE"];
}

- (id)tapticTimeLocalizedDescription
{
  uint64_t v3 = +[AXTimeOutputPreferences sharedInstance];
  char v4 = [v3 tapticTimeIsAvailable];

  if ((v4 & 1) == 0)
  {
    v14 = @"TAPTIC_TIME_UNAVAILABLE_DESCRIPTION";
LABEL_12:
    v13 = [(AXTimeOutputPreferences *)self localizedStringForKey:v14];
    goto LABEL_13;
  }
  id v5 = +[AXTimeOutputPreferences sharedInstance];
  char v6 = [v5 voiceOverTapticTimeMode];

  if ((v6 & 1) == 0)
  {
    v14 = @"TAPTIC_TIME_DISABLED_DESCRIPTION";
    goto LABEL_12;
  }
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = +[AXTimeOutputPreferences sharedInstance];
  int v9 = [v8 tapToSpeakTimeEnabled];

  if (v9) {
    v10 = @"TAPTIC_TIME_MUTE_DESCRIPTION";
  }
  else {
    v10 = @"TAPTIC_TIME_ALWAYS_DESCRIPTION";
  }
  uint64_t v11 = [(AXTimeOutputPreferences *)self localizedStringForKey:v10];
  [v7 addObject:v11];

  if ([(AXTimeOutputPreferences *)self _voiceOverIsEnabled]
    || [(AXTimeOutputPreferences *)self _voiceOverIsInTripleClick])
  {
    id v12 = [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAPTIC_TIME_VOICEOVER_DESCRIPTION"];
    [v7 addObject:v12];
  }
  v13 = [v7 componentsJoinedByString:@"\n\n"];

LABEL_13:
  return v13;
}

- (id)tapticTimeLocalizedCurrentMode
{
  uint64_t v3 = +[AXTimeOutputPreferences sharedInstance];
  if ([v3 tapticTimeIsAvailable])
  {
    char v4 = +[AXTimeOutputPreferences sharedInstance];
    char v5 = [v4 voiceOverTapticTimeMode];

    if (v5)
    {
      char v6 = +[AXTimeOutputPreferences sharedInstance];
      id v7 = -[AXTimeOutputPreferences localizedStringForTapticTimeEncoding:](self, "localizedStringForTapticTimeEncoding:", [v6 voiceOverTapticTimeEncoding]);

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [(AXTimeOutputPreferences *)self localizedStringForKey:@"TAPTIC_TIME_DISABLED"];
LABEL_6:
  return v7;
}

- (id)tapticTimeModeLocalizedDescription
{
  uint64_t v3 = +[AXTimeOutputPreferences sharedInstance];
  uint64_t v4 = [v3 voiceOverTapticTimeEncoding];

  if ((unint64_t)(v4 - 1) <= 2)
  {
    char v5 = [(AXTimeOutputPreferences *)self localizedStringForKey:off_264C4E490[v4 - 1]];
  }
  return v5;
}

- (id)localizedStringForTapticTimeEncoding:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2)
  {
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", off_264C4E4A8[a3 - 1], v3);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (void)_npsValueForPreferenceKey:expectedClass:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2352E7000, v0, v1, "unexpected nil preference key!", v2, v3, v4, v5, v6);
}

- (void)_npsValueForPreferenceKey:(NSObject *)a3 expectedClass:.cold.2(uint64_t a1, Class aClass, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromClass(aClass);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_fault_impl(&dword_2352E7000, a3, OS_LOG_TYPE_FAULT, "unexpected object type! is=%@, expected=%@", (uint8_t *)&v6, 0x16u);
}

- (void)_setNPSValue:preferenceKey:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2352E7000, v0, v1, "unexpected nil domainAccessor!", v2, v3, v4, v5, v6);
}

- (void)_setNPSValue:preferenceKey:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2352E7000, v0, v1, "unexpected empty domain!", v2, v3, v4, v5, v6);
}

@end