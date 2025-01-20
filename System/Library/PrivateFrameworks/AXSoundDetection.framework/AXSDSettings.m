@interface AXSDSettings
+ (id)sharedInstance;
+ (id)stringForSoundDetectionState:(int64_t)a3;
+ (void)initialize;
- (BOOL)forceMedinaSupport;
- (BOOL)hasCustomHapticForDetector:(id)a3;
- (BOOL)hasCustomToneForDetector:(id)a3;
- (BOOL)hasValidCustomDetector;
- (BOOL)isActivelyTrainingAKShotModel;
- (BOOL)kShotShouldSaveCurrentSound;
- (BOOL)micDisabled;
- (BOOL)shouldStoreLocally;
- (BOOL)soundDetectionEnabled;
- (BOOL)ultronIsRunning;
- (BOOL)ultronSupportEnabled;
- (NSArray)enabledKShotDetectorIdentifiers;
- (NSArray)enabledSoundDetectionTypes;
- (NSArray)supportedSoundDetectionTypes;
- (NSData)kShotDetectors;
- (NSMutableDictionary)kShotSoundRecordings;
- (NSMutableDictionary)soundDetectionSnoozeDictionary;
- (NSString)pipedInFile;
- (NSString)retrainModelIdentifier;
- (id)keysToSync;
- (id)localizedNameForSoundDetectionType:(id)a3;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (id)preferenceKeyForSelector:(SEL)a3;
- (id)sortedSupportedSoundDetectionTypes;
- (id)soundAlertTopicForSoundDetectionType:(id)a3;
- (int64_t)soundDetectionKShotListeningState;
- (int64_t)soundDetectionState;
- (void)addSnoozeDateToSnoozeDictionary:(id)a3 forKey:(id)a4;
- (void)addSoundDetectionType:(id)a3;
- (void)logMessage:(id)a3;
- (void)pipeFile:(id)a3;
- (void)removeAllSoundDetectionTypes;
- (void)removeSoundDetectionType:(id)a3;
- (void)retrainModelWithIdentifier:(id)a3;
- (void)setEnabledKShotDetectorIdentifiers:(id)a3;
- (void)setEnabledSoundDetectionTypes:(id)a3;
- (void)setForceMedinaSupport:(BOOL)a3;
- (void)setIsActivelyTrainingAKShotModel:(BOOL)a3;
- (void)setKShotDetectors:(id)a3;
- (void)setKShotShouldSaveCurrentSound:(BOOL)a3;
- (void)setKShotSoundRecordings:(id)a3;
- (void)setMicDisabled:(BOOL)a3;
- (void)setPipedInFile:(id)a3;
- (void)setRetrainModelIdentifier:(id)a3;
- (void)setSoundDetectionKShotListeningState:(int64_t)a3;
- (void)setSoundDetectionSnoozeDictionary:(id)a3;
- (void)setSoundDetectionState:(int64_t)a3;
- (void)setSupportedSoundDetectionTypes:(id)a3;
- (void)setUltronIsRunning:(BOOL)a3;
- (void)setUltronSupportEnabled:(BOOL)a3;
@end

@implementation AXSDSettings

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return (id)*MEMORY[0x263F8B388];
}

- (NSArray)supportedSoundDetectionTypes
{
  uint64_t v3 = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] array];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSSoundDetectionSupportedTypes" withClass:v3 andDefaultValue:v4];

  return (NSArray *)v5;
}

- (NSData)kShotDetectors
{
  uint64_t v3 = objc_opt_class();
  v4 = [MEMORY[0x263EFF8F8] data];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSSoundDetectionKShotDetectors" withClass:v3 andDefaultValue:v4];

  return (NSData *)v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_Settings;
  return v2;
}

- (NSArray)enabledSoundDetectionTypes
{
  uint64_t v3 = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] array];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSEnabledSoundDetectionTypes" withClass:v3 andDefaultValue:v4];

  return (NSArray *)v5;
}

- (void)logMessage:(id)a3
{
  id v3 = a3;
  v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXSDSettings logMessage:]((uint64_t)v3, v4);
  }
}

uint64_t __30__AXSDSettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings = objc_alloc_init(AXSDSettings);
  return MEMORY[0x270F9A758]();
}

- (id)keysToSync
{
  return (id)[MEMORY[0x263EFFA08] set];
}

+ (void)initialize
{
  id v2 = +[AXSDSettings sharedInstance];
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  if (preferenceKeyForSelector__onceToken != -1) {
    dispatch_once(&preferenceKeyForSelector__onceToken, &__block_literal_global_54);
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
    v11.super_class = (Class)AXSDSettings;
    id v8 = [(HCSettings *)&v11 preferenceKeyForSelector:a3];
  }
  v9 = v8;

  return v9;
}

void __41__AXSDSettings_preferenceKeyForSelector___block_invoke()
{
  id v14 = objc_alloc(NSDictionary);
  v18 = NSStringFromSelector(sel_ultronIsRunning);
  v13 = NSStringFromSelector(sel_ultronSupportEnabled);
  v17 = NSStringFromSelector(sel_soundDetectionState);
  v16 = NSStringFromSelector(sel_enabledSoundDetectionTypes);
  v15 = NSStringFromSelector(sel_soundDetectionSnoozeDictionary);
  v0 = NSStringFromSelector(sel_supportedSoundDetectionTypes);
  v12 = NSStringFromSelector(sel_kShotDetectors);
  objc_super v11 = NSStringFromSelector(sel_kShotSoundRecordings);
  v1 = NSStringFromSelector(sel_enabledKShotDetectorIdentifiers);
  id v2 = NSStringFromSelector(sel_soundDetectionKShotListeningState);
  v10 = NSStringFromSelector(sel_kShotShouldSaveCurrentSound);
  id v3 = NSStringFromSelector(sel_isActivelyTrainingAKShotModel);
  v4 = NSStringFromSelector(sel_micDisabled);
  v5 = NSStringFromSelector(sel_pipedInFile);
  v6 = NSStringFromSelector(sel_retrainModelIdentifier);
  v7 = NSStringFromSelector(sel_forceMedinaSupport);
  uint64_t v8 = objc_msgSend(v14, "initWithObjectsAndKeys:", @"AXSUltronV2RunningStatus", v18, @"AXSUltronV2Enabled", v13, @"AXSEnabledSoundDetectionState", v17, @"AXSEnabledSoundDetectionTypes", v16, @"AXSSoundDetectionSnoozeDictionary", v15, @"AXSSoundDetectionSupportedTypes", v0, @"AXSSoundDetectionKShotDetectors", v12, @"AXSSoundDetectionKShotRecordings", v11, @"AXSSoundDetectionKShotEnabledDetectorIdentifiers",
         v1,
         @"AXSSoundDetectionKShotListeningStateIdentifier",
         v2,
         @"AXSSoundDetectionKShotShouldSaveCurrentSoundIdentifier",
         v10,
         @"AXSSoundDetectionKShotisActivelyTrainingAKShotModelIdentifier",
         v3,
         @"AXSSoundDetectionMicDisabled",
         v4,
         @"AXSSoundDetectionPipedInFile",
         v5,
         @"AXSSoundDetectionRetrainModelIdentifier",
         v6,
         @"AXSSoundDetectionMedinaSupportForced",
         v7,
         0);
  v9 = (void *)preferenceKeyForSelector__SelectorMap;
  preferenceKeyForSelector__SelectorMap = v8;
}

- (BOOL)ultronIsRunning
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"AXSUltronV2RunningStatus" withDefaultValue:0];
}

- (void)setUltronIsRunning:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSUltronV2RunningStatus"];
}

- (BOOL)ultronSupportEnabled
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"AXSUltronV2Enabled" withDefaultValue:0];
}

- (void)setUltronSupportEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSUltronV2Enabled"];
}

- (int64_t)soundDetectionState
{
  return [(HCSettings *)self integerValueForKey:@"AXSEnabledSoundDetectionState" withDefaultValue:0];
}

- (void)setSoundDetectionState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSEnabledSoundDetectionState"];
}

- (void)setEnabledSoundDetectionTypes:(id)a3
{
}

- (NSMutableDictionary)soundDetectionSnoozeDictionary
{
  uint64_t v3 = objc_opt_class();
  id v4 = [NSDictionary dictionary];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSSoundDetectionSnoozeDictionary" withClass:v3 andDefaultValue:v4];

  return (NSMutableDictionary *)v5;
}

- (void)setSoundDetectionSnoozeDictionary:(id)a3
{
}

- (void)setSupportedSoundDetectionTypes:(id)a3
{
}

- (void)setKShotDetectors:(id)a3
{
}

- (NSMutableDictionary)kShotSoundRecordings
{
  uint64_t v3 = objc_opt_class();
  id v4 = [NSDictionary dictionary];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSSoundDetectionKShotRecordings" withClass:v3 andDefaultValue:v4];

  return (NSMutableDictionary *)v5;
}

- (void)setKShotSoundRecordings:(id)a3
{
}

- (NSArray)enabledKShotDetectorIdentifiers
{
  uint64_t v3 = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] array];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSSoundDetectionKShotEnabledDetectorIdentifiers" withClass:v3 andDefaultValue:v4];

  return (NSArray *)v5;
}

- (void)setEnabledKShotDetectorIdentifiers:(id)a3
{
}

- (int64_t)soundDetectionKShotListeningState
{
  return [(HCSettings *)self integerValueForKey:@"AXSSoundDetectionKShotListeningStateIdentifier" withDefaultValue:0];
}

- (void)setSoundDetectionKShotListeningState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSSoundDetectionKShotListeningStateIdentifier"];
}

- (BOOL)kShotShouldSaveCurrentSound
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"AXSSoundDetectionKShotShouldSaveCurrentSoundIdentifier" withDefaultValue:0];
}

- (void)setKShotShouldSaveCurrentSound:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSSoundDetectionKShotShouldSaveCurrentSoundIdentifier"];
}

- (BOOL)isActivelyTrainingAKShotModel
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"AXSSoundDetectionKShotisActivelyTrainingAKShotModelIdentifier" withDefaultValue:0];
}

- (void)setIsActivelyTrainingAKShotModel:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSSoundDetectionKShotisActivelyTrainingAKShotModelIdentifier"];
}

- (BOOL)micDisabled
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"AXSSoundDetectionMicDisabled" withDefaultValue:0];
}

- (void)setMicDisabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSSoundDetectionMicDisabled"];
}

- (NSString)pipedInFile
{
  uint64_t v3 = objc_opt_class();
  id v4 = [NSString string];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSSoundDetectionPipedInFile" withClass:v3 andDefaultValue:v4];

  return (NSString *)v5;
}

- (void)setPipedInFile:(id)a3
{
}

- (NSString)retrainModelIdentifier
{
  uint64_t v3 = objc_opt_class();
  id v4 = [NSString string];
  v5 = [(HCSettings *)self objectValueForKey:@"AXSSoundDetectionRetrainModelIdentifier" withClass:v3 andDefaultValue:v4];

  return (NSString *)v5;
}

- (void)setRetrainModelIdentifier:(id)a3
{
}

- (BOOL)forceMedinaSupport
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"AXSSoundDetectionMedinaSupportForced" withDefaultValue:0];
}

- (void)setForceMedinaSupport:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"AXSSoundDetectionMedinaSupportForced"];
}

- (BOOL)soundDetectionEnabled
{
  return [(AXSDSettings *)self soundDetectionState] != 0;
}

- (void)addSoundDetectionType:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [(AXSDSettings *)self enabledSoundDetectionTypes];
  v7 = (void *)[v6 mutableCopy];
  id v9 = [v4 setWithArray:v7];

  [v9 addObject:v5];
  uint64_t v8 = [v9 allObjects];
  [(AXSDSettings *)self setEnabledSoundDetectionTypes:v8];
}

- (void)removeSoundDetectionType:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [(AXSDSettings *)self enabledSoundDetectionTypes];
  v7 = (void *)[v6 mutableCopy];
  id v9 = [v4 setWithArray:v7];

  [v9 removeObject:v5];
  uint64_t v8 = [v9 allObjects];
  [(AXSDSettings *)self setEnabledSoundDetectionTypes:v8];
}

- (void)removeAllSoundDetectionTypes
{
  id v3 = [MEMORY[0x263EFF8C0] array];
  [(AXSDSettings *)self setEnabledSoundDetectionTypes:v3];
}

- (void)addSnoozeDateToSnoozeDictionary:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(AXSDSettings *)self soundDetectionSnoozeDictionary];
  uint64_t v8 = (void *)[v7 mutableCopy];

  id v9 = [v8 objectForKey:v6];
  if (v9)
  {
    uint64_t v10 = [v12 laterDate:v9];

    id v11 = (id)v10;
  }
  else
  {
    id v11 = v12;
  }
  id v13 = v11;
  [v8 setObject:v11 forKey:v6];
  [(AXSDSettings *)self setSoundDetectionSnoozeDictionary:v8];
}

- (id)soundAlertTopicForSoundDetectionType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:AXSDSoundDetectionTypeApplianceBeeps] & 1) != 0
    || ([v3 isEqualToString:AXSDSoundDetectionTypeApplianceBuzzes] & 1) != 0
    || ([v3 isEqualToString:AXSDSoundDetectionTypeApplianceBellDings] & 1) != 0)
  {
    id v4 = (id *)MEMORY[0x263F7FD00];
LABEL_5:
    id v5 = (__CFString *)*v4;
    goto LABEL_6;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDistressedBaby])
  {
    id v4 = (id *)MEMORY[0x263F7FD08];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeCarHorns])
  {
    id v4 = (id *)MEMORY[0x263F7FD10];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeCatMeows])
  {
    id v4 = (id *)MEMORY[0x263F7FD18];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeCough])
  {
    id v4 = (id *)MEMORY[0x263F7FD20];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDogBarks])
  {
    id v4 = (id *)MEMORY[0x263F7FD28];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDoorbells])
  {
    id v4 = (id *)MEMORY[0x263F7FD30];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeDoorKnocks])
  {
    id v4 = (id *)MEMORY[0x263F7FD38];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeFireAlarms])
  {
    id v4 = (id *)MEMORY[0x263F7FD40];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypePersonShouting])
  {
    id v4 = (id *)MEMORY[0x263F7FD48];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeSirenAlarms])
  {
    id v4 = (id *)MEMORY[0x263F7FD50];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeSmokeAlarms])
  {
    id v4 = (id *)MEMORY[0x263F7FD58];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeWaterRunning])
  {
    id v4 = (id *)MEMORY[0x263F7FD60];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:AXSDSoundDetectionTypeGlassBreaking])
  {
    id v5 = @"TLAlertTopicSoundRecognitionGlassBreaking";
  }
  else if ([v3 isEqualToString:AXSDSoundDetectionTypeKettle])
  {
    id v5 = @"TLAlertTopicSoundRecognitionKettle";
  }
  else
  {
    id v5 = 0;
  }
LABEL_6:

  return v5;
}

- (BOOL)hasValidCustomDetector
{
  id v2 = [(AXSDSettings *)self enabledKShotDetectorIdentifiers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)stringForSoundDetectionState:(int64_t)a3
{
  BOOL v3 = @"Off";
  if (a3 == 2) {
    BOOL v3 = @"Running";
  }
  if (a3 == 1) {
    return @"Available";
  }
  else {
    return v3;
  }
}

- (id)localizedNameForSoundDetectionType:(id)a3
{
  return AXSDSoundDetectionLocalizedTitleForType(a3);
}

- (id)sortedSupportedSoundDetectionTypes
{
  BOOL v3 = [(AXSDSettings *)self supportedSoundDetectionTypes];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__AXSDSettings_sortedSupportedSoundDetectionTypes__block_invoke;
  v6[3] = &unk_264504CA0;
  v6[4] = self;
  id v4 = [v3 sortedArrayUsingComparator:v6];

  return v4;
}

uint64_t __50__AXSDSettings_sortedSupportedSoundDetectionTypes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 localizedNameForSoundDetectionType:a2];
  uint64_t v8 = [*(id *)(a1 + 32) localizedNameForSoundDetectionType:v6];

  uint64_t v9 = [v7 localizedCompare:v8];
  return v9;
}

- (BOOL)hasCustomToneForDetector:(id)a3
{
  BOOL v3 = [(AXSDSettings *)self soundAlertTopicForSoundDetectionType:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x263F7FC90] sharedToneManager];
    id v5 = [v4 defaultToneIdentifierForAlertType:29 topic:v3];

    id v6 = [MEMORY[0x263F7FC90] sharedToneManager];
    v7 = [v6 currentToneIdentifierForAlertType:29 topic:v3];

    uint64_t v8 = [v7 lowercaseString];
    uint64_t v9 = [v5 lowercaseString];
    int v10 = [v8 isEqualToString:v9] ^ 1;
  }
  else
  {
    id v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXSDSettings hasCustomToneForDetector:](v11);
    }

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)hasCustomHapticForDetector:(id)a3
{
  BOOL v3 = [(AXSDSettings *)self soundAlertTopicForSoundDetectionType:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    id v5 = [v4 defaultVibrationIdentifierForAlertType:29 topic:v3];

    id v6 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    v7 = [v6 currentVibrationIdentifierForAlertType:29 topic:v3];

    uint64_t v8 = [v7 lowercaseString];
    uint64_t v9 = [v5 lowercaseString];
    int v10 = [v8 isEqualToString:v9] ^ 1;
  }
  else
  {
    id v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXSDSettings hasCustomHapticForDetector:](v11);
    }

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)pipeFile:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 absoluteString];
  [(AXSDSettings *)self setPipedInFile:v5];

  id v6 = AXLogUltron();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(AXSDSettings *)self pipedInFile];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_21F182000, v6, OS_LOG_TYPE_INFO, "Setting pipe file to %@ -> %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)retrainModelWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AXSDSettings *)self setRetrainModelIdentifier:v4];
  id v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(AXSDSettings *)self retrainModelIdentifier];
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl(&dword_21F182000, v5, OS_LOG_TYPE_INFO, "Setting model to retrain to %@ -> %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)hasCustomToneForDetector:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F182000, log, OS_LOG_TYPE_ERROR, "Trying to log custom tone for non-existent alert topic", v1, 2u);
}

- (void)hasCustomHapticForDetector:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F182000, log, OS_LOG_TYPE_ERROR, "Trying to log custom haptic for non-existent alert topic", v1, 2u);
}

- (void)logMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F182000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end