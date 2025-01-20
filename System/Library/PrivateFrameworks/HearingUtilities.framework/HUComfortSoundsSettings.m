@interface HUComfortSoundsSettings
+ (id)sharedInstance;
- (BOOL)comfortSoundsAvailable;
- (BOOL)comfortSoundsEnabled;
- (BOOL)forceMixingBehavior;
- (BOOL)mixesWithMedia;
- (BOOL)shouldStoreLocally;
- (BOOL)stopsOnLock;
- (HUComfortSound)selectedComfortSound;
- (double)lastEnablementTimestamp;
- (double)mediaVolume;
- (double)relativeVolume;
- (id)keysToSync;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (id)preferenceKeyForSelector:(SEL)a3;
- (void)logMessage:(id)a3;
- (void)reset;
- (void)setComfortSoundsEnabled:(BOOL)a3;
- (void)setForceMixingBehavior:(BOOL)a3;
- (void)setLastEnablementTimestamp:(double)a3;
- (void)setMediaVolume:(double)a3;
- (void)setMixesWithMedia:(BOOL)a3;
- (void)setRelativeVolume:(double)a3;
- (void)setSelectedComfortSound:(id)a3;
- (void)setStopsOnLock:(BOOL)a3;
- (void)setValue:(id)a3 forPreferenceKey:(id)a4;
@end

@implementation HUComfortSoundsSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_126);
  }
  v2 = (void *)sharedInstance_Settings;

  return v2;
}

uint64_t __41__HUComfortSoundsSettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings = objc_alloc_init(HUComfortSoundsSettings);

  return MEMORY[0x270F9A758]();
}

- (void)reset
{
  [(HCSettings *)self resetValueForSelector:sel_comfortSoundsEnabled];
  [(HCSettings *)self resetValueForSelector:sel_relativeVolume];
  [(HCSettings *)self resetValueForSelector:sel_mediaVolume];

  [(HCSettings *)self resetValueForSelector:sel_selectedComfortSound];
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  if (preferenceKeyForSelector__onceToken != -1) {
    dispatch_once(&preferenceKeyForSelector__onceToken, &__block_literal_global_137);
  }
  v5 = (void *)preferenceKeyForSelector__SelectorMap;
  v6 = NSStringFromSelector(a3);
  v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUComfortSoundsSettings;
    id v8 = [(HCSettings *)&v11 preferenceKeyForSelector:a3];
  }
  v9 = v8;

  return v9;
}

void __52__HUComfortSoundsSettings_preferenceKeyForSelector___block_invoke()
{
  id v0 = objc_alloc(NSDictionary);
  NSStringFromSelector(sel_selectedComfortSound);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend(v0, "initWithObjectsAndKeys:", @"ComfortSoundsSelectedSound", v3, 0);
  v2 = (void *)preferenceKeyForSelector__SelectorMap;
  preferenceKeyForSelector__SelectorMap = v1;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return @"com.apple.ComfortSounds";
}

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)keysToSync
{
  return 0;
}

- (void)logMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CSInitializeLogging();
  v4 = [NSString stringWithFormat:@"%@", v3];

  v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsSettings logMessage:]", 267, v4];
  v6 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (BOOL)comfortSoundsEnabled
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"comfortSoundsEnabled" withDefaultValue:0];
}

- (void)setComfortSoundsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUComfortSoundsSettings *)self setValue:v4 forPreferenceKey:@"comfortSoundsEnabled"];
}

- (BOOL)mixesWithMedia
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"mixesWithMedia" withDefaultValue:1];
}

- (void)setMixesWithMedia:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUComfortSoundsSettings *)self setValue:v4 forPreferenceKey:@"mixesWithMedia"];
}

- (BOOL)stopsOnLock
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"stopsOnLock" withDefaultValue:0];
}

- (void)setStopsOnLock:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUComfortSoundsSettings *)self setValue:v4 forPreferenceKey:@"stopsOnLock"];
}

- (double)relativeVolume
{
  [(HCSettings *)self cgfloatValueForPreferenceKey:@"relativeVolume" withDefaultValue:0.6];
  return result;
}

- (void)setRelativeVolume:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(HUComfortSoundsSettings *)self setValue:v4 forPreferenceKey:@"relativeVolume"];
}

- (double)mediaVolume
{
  [(HCSettings *)self cgfloatValueForPreferenceKey:@"mediaVolume" withDefaultValue:0.2];
  return result;
}

- (void)setMediaVolume:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(HUComfortSoundsSettings *)self setValue:v4 forPreferenceKey:@"mediaVolume"];
}

- (double)lastEnablementTimestamp
{
  [(HCSettings *)self cgfloatValueForPreferenceKey:@"lastEnablementTimestamp" withDefaultValue:0.0];
  return result;
}

- (void)setLastEnablementTimestamp:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(HUComfortSoundsSettings *)self setValue:v4 forPreferenceKey:@"lastEnablementTimestamp"];
}

- (BOOL)forceMixingBehavior
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"forceMixingBehavior" withDefaultValue:0];
}

- (void)setForceMixingBehavior:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUComfortSoundsSettings *)self setValue:v4 forPreferenceKey:@"forceMixingBehavior"];
}

- (HUComfortSound)selectedComfortSound
{
  v8[4] = *(id *)MEMORY[0x263EF8340];
  v2 = [(HCSettings *)self objectValueForKey:@"ComfortSoundsSelectedSound" withClass:objc_opt_class() andDefaultValue:0];
  v8[0] = 0;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v2 error:v8];
  id v4 = v8[0];
  if (v4
    || (objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0),
        v6 = objc_claimAutoreleasedReturnValue(),
        [v3 decodeObjectOfClasses:v6 forKey:*MEMORY[0x263F081D0]],
        v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v5))
  {
    v5 = +[HUComfortSound defaultComfortSoundForGroup:5];
  }

  return (HUComfortSound *)v5;
}

- (void)setSelectedComfortSound:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v5 encodeObject:v4 forKey:*MEMORY[0x263F081D0]];
    [v5 finishEncoding];
    v6 = [v5 encodedData];
  }
  else
  {
    v6 = 0;
  }
  [(HUComfortSoundsSettings *)self setValue:v6 forPreferenceKey:@"ComfortSoundsSelectedSound"];
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"comfortSoundsEnabled"])
  {
    if (setValue_forPreferenceKey__sOnce != -1) {
      dispatch_once(&setValue_forPreferenceKey__sOnce, &__block_literal_global_185);
    }
    if (setValue_forPreferenceKey__HasFunction)
    {
      id v8 = AXLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_INFO, "Updating accessibility enabled for BG Sounds", buf, 2u);
      }

      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      v9 = (void (*)(void))get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr;
      v22 = get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr;
      if (!get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v15 = 3221225472;
        v16 = __get_AXSUpdateAccessibilityEnabledSymbolLoc_block_invoke;
        v17 = &unk_2640FC9B0;
        v18 = &v19;
        uint64_t v10 = (void *)libAccessibilityLibrary();
        uint64_t v11 = dlsym(v10, "_AXSUpdateAccessibilityEnabled");
        *(void *)(v18[1] + 24) = v11;
        get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr = *(_UNKNOWN **)(v18[1] + 24);
        v9 = (void (*)(void))v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v9)
      {
        ADAFMetadataKeyHAEDataForGauge_cold_1 = (_Unwind_Exception *)getADAFMetadataKeyHAEDataForGauge_cold_1();
        _Block_object_dispose(&v19, 8);
        _Unwind_Resume(ADAFMetadataKeyHAEDataForGauge_cold_1);
      }
      v9();
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)HUComfortSoundsSettings;
  [(HCSettings *)&v13 setValue:v6 forPreferenceKey:v7];
}

uint64_t __53__HUComfortSoundsSettings_setValue_forPreferenceKey___block_invoke()
{
  uint64_t result = libAccessibilityLibrary();
  if (result)
  {
    uint64_t v1 = (void *)libAccessibilityLibrary();
    uint64_t result = (uint64_t)dlsym(v1, "_AXSUpdateAccessibilityEnabled");
    BOOL v2 = result != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  setValue_forPreferenceKey__HasFunction = v2;
  return result;
}

- (BOOL)comfortSoundsAvailable
{
  return _os_feature_enabled_impl();
}

@end