@interface _BMAccessibilityLibraryNode
+ (id)ClassicInvert;
+ (id)ColorFilters;
+ (id)Contrast;
+ (id)MotionCues;
+ (id)ReduceMotion;
+ (id)ReduceTransparency;
+ (id)SmartInvert;
+ (id)SoundDetection;
+ (id)VoiceControl;
+ (id)VoiceOver;
+ (id)WhitePoint;
+ (id)Zoom;
+ (id)configurationForClassicInvert;
+ (id)configurationForColorFilters;
+ (id)configurationForContrast;
+ (id)configurationForMotionCues;
+ (id)configurationForReduceMotion;
+ (id)configurationForReduceTransparency;
+ (id)configurationForSmartInvert;
+ (id)configurationForSoundDetection;
+ (id)configurationForVoiceControl;
+ (id)configurationForVoiceOver;
+ (id)configurationForWhitePoint;
+ (id)configurationForZoom;
+ (id)identifier;
+ (id)storeConfigurationForClassicInvert;
+ (id)storeConfigurationForColorFilters;
+ (id)storeConfigurationForContrast;
+ (id)storeConfigurationForMotionCues;
+ (id)storeConfigurationForReduceMotion;
+ (id)storeConfigurationForReduceTransparency;
+ (id)storeConfigurationForSmartInvert;
+ (id)storeConfigurationForSoundDetection;
+ (id)storeConfigurationForVoiceControl;
+ (id)storeConfigurationForVoiceOver;
+ (id)storeConfigurationForWhitePoint;
+ (id)storeConfigurationForZoom;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForClassicInvert;
+ (id)syncPolicyForColorFilters;
+ (id)syncPolicyForContrast;
+ (id)syncPolicyForMotionCues;
+ (id)syncPolicyForReduceMotion;
+ (id)syncPolicyForReduceTransparency;
+ (id)syncPolicyForSmartInvert;
+ (id)syncPolicyForSoundDetection;
+ (id)syncPolicyForVoiceControl;
+ (id)syncPolicyForVoiceOver;
+ (id)syncPolicyForWhitePoint;
+ (id)syncPolicyForZoom;
+ (id)validKeyPaths;
@end

@implementation _BMAccessibilityLibraryNode

+ (id)identifier
{
  return @"Accessibility";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ClassicInvert"])
  {
    uint64_t v5 = [a1 ClassicInvert];
LABEL_25:
    v6 = (void *)v5;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"ColorFilters"])
  {
    uint64_t v5 = [a1 ColorFilters];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Contrast"])
  {
    uint64_t v5 = [a1 Contrast];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"MotionCues"])
  {
    uint64_t v5 = [a1 MotionCues];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"ReduceMotion"])
  {
    uint64_t v5 = [a1 ReduceMotion];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"ReduceTransparency"])
  {
    uint64_t v5 = [a1 ReduceTransparency];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"SmartInvert"])
  {
    uint64_t v5 = [a1 SmartInvert];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"SoundDetection"])
  {
    uint64_t v5 = [a1 SoundDetection];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"VoiceControl"])
  {
    uint64_t v5 = [a1 VoiceControl];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"VoiceOver"])
  {
    uint64_t v5 = [a1 VoiceOver];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"WhitePoint"])
  {
    uint64_t v5 = [a1 WhitePoint];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:@"Zoom"])
  {
    uint64_t v5 = [a1 Zoom];
    goto LABEL_25;
  }
  v6 = 0;
LABEL_26:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMAccessibilityClassicInvert validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMAccessibilityColorFilters validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMAccessibilityContrast validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMAccessibilityMotionCues validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMAccessibilityReduceMotion validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMAccessibilityReduceTransparency validKeyPaths];
  [v2 addObjectsFromArray:v8];

  v9 = +[BMAccessibilitySmartInvert validKeyPaths];
  [v2 addObjectsFromArray:v9];

  v10 = +[BMAccessibilitySoundDetection validKeyPaths];
  [v2 addObjectsFromArray:v10];

  v11 = +[BMAccessibilityVoiceControl validKeyPaths];
  [v2 addObjectsFromArray:v11];

  v12 = +[BMAccessibilityVoiceOver validKeyPaths];
  [v2 addObjectsFromArray:v12];

  v13 = +[BMAccessibilityWhitePoint validKeyPaths];
  [v2 addObjectsFromArray:v13];

  v14 = +[BMAccessibilityZoom validKeyPaths];
  [v2 addObjectsFromArray:v14];

  v15 = (void *)[v2 copy];

  return v15;
}

+ (id)streamNames
{
  return &unk_1F0BF62D0;
}

+ (id)configurationForZoom
{
  v3 = [a1 storeConfigurationForZoom];
  id v4 = [a1 syncPolicyForZoom];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A4210F09-D73C-4345-980C-7E067C85B1DF"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.Zoom", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForZoom
{
  return 0;
}

+ (id)storeConfigurationForZoom
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.Zoom" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForWhitePoint
{
  v3 = [a1 storeConfigurationForWhitePoint];
  id v4 = [a1 syncPolicyForWhitePoint];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F73CC6CE-A31A-4021-9F1A-2C6A5B4457C1"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.WhitePoint", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForWhitePoint
{
  return 0;
}

+ (id)storeConfigurationForWhitePoint
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.WhitePoint" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForVoiceOver
{
  v3 = [a1 storeConfigurationForVoiceOver];
  id v4 = [a1 syncPolicyForVoiceOver];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4A709D28-1CA9-4AC0-BFE0-F4889AA9C5FA"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.VoiceOver", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForVoiceOver
{
  return 0;
}

+ (id)storeConfigurationForVoiceOver
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.VoiceOver" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForVoiceControl
{
  v3 = [a1 storeConfigurationForVoiceControl];
  id v4 = [a1 syncPolicyForVoiceControl];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C75A57EF-37C2-43B0-8F93-D47BA7691715"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.VoiceControl", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForVoiceControl
{
  return 0;
}

+ (id)storeConfigurationForVoiceControl
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.VoiceControl" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSoundDetection
{
  v3 = [a1 storeConfigurationForSoundDetection];
  id v4 = [a1 syncPolicyForSoundDetection];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EECE2235-7EAB-40C7-A763-AB3D44240D63"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.SoundDetection", objc_opt_class(), v3, v4, &unk_1F0BF62B8, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSoundDetection
{
  return 0;
}

+ (id)storeConfigurationForSoundDetection
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:86400.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.SoundDetection" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSmartInvert
{
  v3 = [a1 storeConfigurationForSmartInvert];
  id v4 = [a1 syncPolicyForSmartInvert];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4C3C11B9-A0B2-4A16-A2CA-019F7FAB4AD0"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.SmartInvert", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSmartInvert
{
  return 0;
}

+ (id)storeConfigurationForSmartInvert
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.SmartInvert" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForReduceTransparency
{
  v3 = [a1 storeConfigurationForReduceTransparency];
  id v4 = [a1 syncPolicyForReduceTransparency];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7EA88124-DC52-4E9B-986D-C8E257E4EE45"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.ReduceTransparency", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForReduceTransparency
{
  return 0;
}

+ (id)storeConfigurationForReduceTransparency
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.ReduceTransparency" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForReduceMotion
{
  v3 = [a1 storeConfigurationForReduceMotion];
  id v4 = [a1 syncPolicyForReduceMotion];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FCC2E76F-3CAE-481D-B8F8-1F9290D48CC8"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.ReduceMotion", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForReduceMotion
{
  return 0;
}

+ (id)storeConfigurationForReduceMotion
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.ReduceMotion" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMotionCues
{
  v3 = [a1 storeConfigurationForMotionCues];
  id v4 = [a1 syncPolicyForMotionCues];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"543A82D6-4C54-44A0-9287-C985992DE170"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.MotionCues", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMotionCues
{
  return 0;
}

+ (id)storeConfigurationForMotionCues
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.MotionCues" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForContrast
{
  v3 = [a1 storeConfigurationForContrast];
  id v4 = [a1 syncPolicyForContrast];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4DBA3BC2-F175-4035-AF91-D30001BAC726"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.Contrast", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForContrast
{
  return 0;
}

+ (id)storeConfigurationForContrast
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.Contrast" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForColorFilters
{
  v3 = [a1 storeConfigurationForColorFilters];
  id v4 = [a1 syncPolicyForColorFilters];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"802EA60B-FBF0-46E0-AFBE-738351D682A6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.ColorFilters", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForColorFilters
{
  return 0;
}

+ (id)storeConfigurationForColorFilters
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.ColorFilters" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForClassicInvert
{
  v3 = [a1 storeConfigurationForClassicInvert];
  id v4 = [a1 syncPolicyForClassicInvert];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8ED9A3AE-742E-4BDA-BE4E-27D83D9D2EA0"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Accessibility.ClassicInvert", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForClassicInvert
{
  return 0;
}

+ (id)storeConfigurationForClassicInvert
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Accessibility.ClassicInvert" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Zoom
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForZoom];
  v3 = +[BMAccessibilityZoom columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.Zoom" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.Zoom" schema:v9 configuration:v2];

  return v10;
}

+ (id)WhitePoint
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForWhitePoint];
  v3 = +[BMAccessibilityWhitePoint columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.WhitePoint" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.WhitePoint" schema:v9 configuration:v2];

  return v10;
}

+ (id)VoiceOver
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForVoiceOver];
  v3 = +[BMAccessibilityVoiceOver columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.VoiceOver" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.VoiceOver" schema:v9 configuration:v2];

  return v10;
}

+ (id)VoiceControl
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForVoiceControl];
  v3 = +[BMAccessibilityVoiceControl columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.VoiceControl" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.VoiceControl" schema:v9 configuration:v2];

  return v10;
}

+ (id)SoundDetection
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSoundDetection];
  v3 = +[BMAccessibilitySoundDetection columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.SoundDetection" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.SoundDetection" schema:v9 configuration:v2];

  return v10;
}

+ (id)SmartInvert
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSmartInvert];
  v3 = +[BMAccessibilitySmartInvert columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.SmartInvert" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.SmartInvert" schema:v9 configuration:v2];

  return v10;
}

+ (id)ReduceTransparency
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForReduceTransparency];
  v3 = +[BMAccessibilityReduceTransparency columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.ReduceTransparency" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.ReduceTransparency" schema:v9 configuration:v2];

  return v10;
}

+ (id)ReduceMotion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForReduceMotion];
  v3 = +[BMAccessibilityReduceMotion columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.ReduceMotion" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.ReduceMotion" schema:v9 configuration:v2];

  return v10;
}

+ (id)MotionCues
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMotionCues];
  v3 = +[BMAccessibilityMotionCues columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.MotionCues" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.MotionCues" schema:v9 configuration:v2];

  return v10;
}

+ (id)Contrast
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForContrast];
  v3 = +[BMAccessibilityContrast columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.Contrast" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.Contrast" schema:v9 configuration:v2];

  return v10;
}

+ (id)ColorFilters
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForColorFilters];
  v3 = +[BMAccessibilityColorFilters columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.ColorFilters" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.ColorFilters" schema:v9 configuration:v2];

  return v10;
}

+ (id)ClassicInvert
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForClassicInvert];
  v3 = +[BMAccessibilityClassicInvert columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Accessibility.ClassicInvert" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Accessibility.ClassicInvert" schema:v9 configuration:v2];

  return v10;
}

@end