@interface _BMDeviceDisplayLibraryNode
+ (id)AlwaysOn;
+ (id)Appearance;
+ (id)Backlight;
+ (id)InterfaceOrientation;
+ (id)NightShift;
+ (id)TrueTone;
+ (id)configurationForAlwaysOn;
+ (id)configurationForAppearance;
+ (id)configurationForBacklight;
+ (id)configurationForInterfaceOrientation;
+ (id)configurationForNightShift;
+ (id)configurationForTrueTone;
+ (id)identifier;
+ (id)storeConfigurationForAlwaysOn;
+ (id)storeConfigurationForAppearance;
+ (id)storeConfigurationForBacklight;
+ (id)storeConfigurationForInterfaceOrientation;
+ (id)storeConfigurationForNightShift;
+ (id)storeConfigurationForTrueTone;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAlwaysOn;
+ (id)syncPolicyForAppearance;
+ (id)syncPolicyForBacklight;
+ (id)syncPolicyForInterfaceOrientation;
+ (id)syncPolicyForNightShift;
+ (id)syncPolicyForTrueTone;
+ (id)validKeyPaths;
@end

@implementation _BMDeviceDisplayLibraryNode

+ (id)identifier
{
  return @"Display";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamNames
{
  return &unk_1F0BF4F20;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AlwaysOn"])
  {
    uint64_t v5 = [a1 AlwaysOn];
LABEL_13:
    v6 = (void *)v5;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"Appearance"])
  {
    uint64_t v5 = [a1 Appearance];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Backlight"])
  {
    uint64_t v5 = [a1 Backlight];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"InterfaceOrientation"])
  {
    uint64_t v5 = [a1 InterfaceOrientation];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"NightShift"])
  {
    uint64_t v5 = [a1 NightShift];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"TrueTone"])
  {
    uint64_t v5 = [a1 TrueTone];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (id)TrueTone
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForTrueTone];
  v3 = +[BMDeviceTrueTone columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Display.TrueTone" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Display.TrueTone" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForTrueTone
{
  v3 = [a1 storeConfigurationForTrueTone];
  id v4 = [a1 syncPolicyForTrueTone];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4DF4A2E0-BF8D-45B7-927A-9B19651D32AB"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Display.TrueTone", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForTrueTone
{
  return 0;
}

+ (id)storeConfigurationForTrueTone
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Display.TrueTone" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)NightShift
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForNightShift];
  v3 = +[BMDeviceNightShift columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Display.NightShift" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Display.NightShift" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForNightShift
{
  v3 = [a1 storeConfigurationForNightShift];
  id v4 = [a1 syncPolicyForNightShift];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"026C65AE-35A8-4F92-8ED5-F8D782603FCA"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Display.NightShift", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForNightShift
{
  return 0;
}

+ (id)storeConfigurationForNightShift
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Display.NightShift" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)InterfaceOrientation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForInterfaceOrientation];
  v3 = +[BMDeviceInterfaceOrientation columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Display.InterfaceOrientation" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Display.InterfaceOrientation" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForInterfaceOrientation
{
  v3 = [a1 storeConfigurationForInterfaceOrientation];
  id v4 = [a1 syncPolicyForInterfaceOrientation];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4613B122-5DD5-4923-A89B-3DA007BAF9EE"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Display.InterfaceOrientation", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForInterfaceOrientation
{
  return 0;
}

+ (id)storeConfigurationForInterfaceOrientation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Display.InterfaceOrientation" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Backlight
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForBacklight];
  v3 = +[BMDeviceBacklight columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Display.Backlight" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Display.Backlight" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForBacklight
{
  v3 = [a1 storeConfigurationForBacklight];
  id v4 = [a1 syncPolicyForBacklight];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EED8D2CA-FB7C-41EF-B8D6-E1A33AFB2ABF"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Display.Backlight", objc_opt_class(), v3, v4, &unk_1F0BF4F08, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForBacklight
{
  return 0;
}

+ (id)storeConfigurationForBacklight
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Display.Backlight" domain:1 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Appearance
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForAppearance];
  v3 = +[BMDisplayAppearance columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Display.Appearance" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Display.Appearance" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForAppearance
{
  v3 = [a1 storeConfigurationForAppearance];
  id v4 = [a1 syncPolicyForAppearance];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"95D1339B-20C4-4713-BADE-0A2651DB871E"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Display.Appearance", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAppearance
{
  return 0;
}

+ (id)storeConfigurationForAppearance
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Display.Appearance" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AlwaysOn
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [a1 configurationForAlwaysOn];
  v3 = +[BMDisplayAlwaysOn columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  uint64_t v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Device.Display.AlwaysOn" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Device.Display.AlwaysOn" schema:v9 configuration:v2];

  return v10;
}

+ (id)configurationForAlwaysOn
{
  v3 = [a1 storeConfigurationForAlwaysOn];
  id v4 = [a1 syncPolicyForAlwaysOn];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C7523BDE-CAB5-41F5-9935-B40C41122E6F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Device.Display.AlwaysOn", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForAlwaysOn
{
  return 0;
}

+ (id)storeConfigurationForAlwaysOn
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Device.Display.AlwaysOn" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMDisplayAlwaysOn validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMDisplayAppearance validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMDeviceBacklight validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMDeviceInterfaceOrientation validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMDeviceNightShift validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = +[BMDeviceTrueTone validKeyPaths];
  [v2 addObjectsFromArray:v8];

  uint64_t v9 = (void *)[v2 copy];

  return v9;
}

@end