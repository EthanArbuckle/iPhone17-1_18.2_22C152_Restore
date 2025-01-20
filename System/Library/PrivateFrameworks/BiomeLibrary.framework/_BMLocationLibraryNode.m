@interface _BMLocationLibraryNode
+ (id)Emergency;
+ (id)HashedCoordinates;
+ (id)MicroLocation;
+ (id)MicroLocationVisit;
+ (id)PointOfInterest;
+ (id)Semantic;
+ (id)SignificantVisit;
+ (id)Visit;
+ (id)configurationForHashedCoordinates;
+ (id)configurationForMicroLocationVisit;
+ (id)configurationForSemantic;
+ (id)configurationForSignificantVisit;
+ (id)configurationForVisit;
+ (id)identifier;
+ (id)storeConfigurationForHashedCoordinates;
+ (id)storeConfigurationForMicroLocationVisit;
+ (id)storeConfigurationForSemantic;
+ (id)storeConfigurationForSignificantVisit;
+ (id)storeConfigurationForVisit;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForHashedCoordinates;
+ (id)syncPolicyForMicroLocationVisit;
+ (id)syncPolicyForSemantic;
+ (id)syncPolicyForSignificantVisit;
+ (id)syncPolicyForVisit;
+ (id)validKeyPaths;
@end

@implementation _BMLocationLibraryNode

+ (id)identifier
{
  return @"Location";
}

+ (id)sublibraries
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = [a1 Emergency];
  v4 = objc_msgSend(a1, "MicroLocation", v3);
  v8[1] = v4;
  v5 = [a1 PointOfInterest];
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)streamWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"HashedCoordinates"])
  {
    uint64_t v5 = [a1 HashedCoordinates];
LABEL_11:
    v6 = (void *)v5;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"MicroLocationVisit"])
  {
    uint64_t v5 = [a1 MicroLocationVisit];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Semantic"])
  {
    uint64_t v5 = [a1 Semantic];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"SignificantVisit"])
  {
    uint64_t v5 = [a1 SignificantVisit];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Visit"])
  {
    uint64_t v5 = [a1 Visit];
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMLocationHashedCoordinates validKeyPaths];
  [v2 addObjectsFromArray:v3];

  id v4 = +[BMLocationMicroLocationVisit validKeyPaths];
  [v2 addObjectsFromArray:v4];

  uint64_t v5 = +[BMLocationSemantic validKeyPaths];
  [v2 addObjectsFromArray:v5];

  v6 = +[BMLocationSignificantVisit validKeyPaths];
  [v2 addObjectsFromArray:v6];

  v7 = +[BMLocationVisit validKeyPaths];
  [v2 addObjectsFromArray:v7];

  v8 = (void *)[v2 copy];

  return v8;
}

+ (id)streamNames
{
  return &unk_1F0BF61B0;
}

+ (id)PointOfInterest
{
  return (id)objc_opt_class();
}

+ (id)MicroLocation
{
  return (id)objc_opt_class();
}

+ (id)Emergency
{
  return (id)objc_opt_class();
}

+ (id)configurationForVisit
{
  v3 = [a1 storeConfigurationForVisit];
  id v4 = [a1 syncPolicyForVisit];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00FEC37A-43FE-428E-9CC1-AA6E5CCE5EE2"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Location.Visit", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForVisit
{
  return 0;
}

+ (id)storeConfigurationForVisit
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Location.Visit" domain:0 segmentSize:0x100000 protectionClass:2 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSignificantVisit
{
  v3 = [a1 storeConfigurationForSignificantVisit];
  id v4 = [a1 syncPolicyForSignificantVisit];
  uint64_t v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7A03F83B-6242-4F92-8EE6-DB1EAC77F546"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Location.SignificantVisit", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForSignificantVisit
{
  return 0;
}

+ (id)storeConfigurationForSignificantVisit
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Location.SignificantVisit" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForSemantic
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForSemantic];
  id v4 = [a1 syncPolicyForSemantic];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v7 = (void *)[v5 initWithIdentifier:@"reset-privacy-and-location-warnings" predicate:v6];
  v14[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  uint64_t v9 = (void *)MEMORY[0x1E4F504B0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"024238EA-AB88-46BE-9D43-E0A6442135D3"];
  BYTE2(v13) = 1;
  LOWORD(v13) = 1;
  v11 = objc_msgSend(v9, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v10, @"Location.Semantic", objc_opt_class(), v3, v4, &unk_1F0BF6198, 0, v13, 0, v8, 0);

  return v11;
}

+ (id)syncPolicyForSemantic
{
  return 0;
}

+ (id)storeConfigurationForSemantic
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Location.Semantic" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForMicroLocationVisit
{
  v3 = [a1 storeConfigurationForMicroLocationVisit];
  id v4 = [a1 syncPolicyForMicroLocationVisit];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D973E44D-D444-43B2-B656-2F572EFCA03F"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Location.MicroLocationVisit", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForMicroLocationVisit
{
  return 0;
}

+ (id)storeConfigurationForMicroLocationVisit
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:4233600.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Location.MicroLocationVisit" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)configurationForHashedCoordinates
{
  v3 = [a1 storeConfigurationForHashedCoordinates];
  id v4 = [a1 syncPolicyForHashedCoordinates];
  id v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F6D9CEC1-83A8-4682-A94C-120F98197DBE"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"Location.HashedCoordinates", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, 0);

  return v7;
}

+ (id)syncPolicyForHashedCoordinates
{
  return 0;
}

+ (id)storeConfigurationForHashedCoordinates
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"Location.HashedCoordinates" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Visit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForVisit];
  v3 = +[BMLocationVisit columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Location.Visit" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Location.Visit" schema:v9 configuration:v2];

  return v10;
}

+ (id)SignificantVisit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSignificantVisit];
  v3 = +[BMLocationSignificantVisit columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Location.SignificantVisit" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Location.SignificantVisit" schema:v9 configuration:v2];

  return v10;
}

+ (id)Semantic
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForSemantic];
  v3 = +[BMLocationSemantic columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Location.Semantic" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Location.Semantic" schema:v9 configuration:v2];

  return v10;
}

+ (id)MicroLocationVisit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForMicroLocationVisit];
  v3 = +[BMLocationMicroLocationVisit columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Location.MicroLocationVisit" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Location.MicroLocationVisit" schema:v9 configuration:v2];

  return v10;
}

+ (id)HashedCoordinates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForHashedCoordinates];
  v3 = +[BMLocationHashedCoordinates columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  uint64_t v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"Location.HashedCoordinates" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"Location.HashedCoordinates" schema:v9 configuration:v2];

  return v10;
}

@end