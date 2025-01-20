@interface _BMFrontBoardLibraryNode
+ (id)DisplayElement;
+ (id)configurationForDisplayElement;
+ (id)identifier;
+ (id)storeConfigurationForDisplayElement;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForDisplayElement;
+ (id)validKeyPaths;
@end

@implementation _BMFrontBoardLibraryNode

+ (id)identifier
{
  return @"FrontBoard";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"DisplayElement"])
  {
    v4 = [a1 DisplayElement];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = +[BMFrontBoardDisplayElement validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF5268;
}

+ (id)configurationForDisplayElement
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 storeConfigurationForDisplayElement];
  v4 = [a1 syncPolicyForDisplayElement];
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$uninstalled IN {bundleID, parentBundleID, extensionHostID}", 0 argumentArray];
  v7 = (void *)[v5 initWithIdentifier:@"app-uninstall" predicate:v6];
  v17[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F504A8]);
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT ALL {bundleID, parentBundleID, extensionHostID} IN $installed", 0 argumentArray];
  v10 = (void *)[v8 initWithIdentifier:@"app-uninstall-nightly" predicate:v9];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = (void *)MEMORY[0x1E4F504B0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"623FCAAE-AD51-483A-BAA5-284D43428B71"];
  BYTE2(v16) = 1;
  LOWORD(v16) = 1;
  v14 = objc_msgSend(v12, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v13, @"FrontBoard.DisplayElement", objc_opt_class(), v3, v4, 0, 0, v16, 0, v11, 0, v17[0]);

  return v14;
}

+ (id)syncPolicyForDisplayElement
{
  return 0;
}

+ (id)storeConfigurationForDisplayElement
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"FrontBoard.DisplayElement" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)DisplayElement
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDisplayElement];
  v3 = +[BMFrontBoardDisplayElement columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  id v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"FrontBoard.DisplayElement" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"FrontBoard.DisplayElement" schema:v9 configuration:v2];

  return v10;
}

@end