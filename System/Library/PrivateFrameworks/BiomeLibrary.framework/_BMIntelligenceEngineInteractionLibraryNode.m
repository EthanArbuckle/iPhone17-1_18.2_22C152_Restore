@interface _BMIntelligenceEngineInteractionLibraryNode
+ (id)Donation;
+ (id)configurationForDonation;
+ (id)identifier;
+ (id)storeConfigurationForDonation;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForDonation;
+ (id)validKeyPaths;
@end

@implementation _BMIntelligenceEngineInteractionLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Donation"])
  {
    v4 = [a1 Donation];
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
  v3 = +[BMIntelligenceEngineInteraction validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF63C0;
}

+ (id)identifier
{
  return @"Interaction";
}

+ (id)configurationForDonation
{
  v32[7] = *MEMORY[0x1E4F143B8];
  v31 = [a1 storeConfigurationForDonation];
  v30 = [a1 syncPolicyForDonation];
  id v3 = objc_alloc(MEMORY[0x1E4F504A8]);
  v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY candidateInteractions.candidateId.bundleId IN $uninstalled OR ANY tupleInteraction.candidateIds.bundleId IN $uninstalled" argumentArray:0];
  v28 = (void *)[v3 initWithIdentifier:@"app-uninstall" predicate:v29];
  v32[0] = v28;
  id v4 = objc_alloc(MEMORY[0x1E4F504A8]);
  v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (ALL candidateInteractions.candidateId.bundleId IN $installed AND ALL tupleInteraction.candidateIds.bundleId IN $installed)" argumentArray:0];
  v26 = (void *)[v4 initWithIdentifier:@"app-uninstall-nightly" predicate:v27];
  v32[1] = v26;
  id v5 = objc_alloc(MEMORY[0x1E4F504A8]);
  v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY candidateInteractions.candidateId.identifier IN $deleted OR ANY tupleInteraction.candidateIds.identifier IN $deleted" argumentArray:0];
  v6 = (void *)[v5 initWithIdentifier:@"contact-deleted" predicate:v25];
  v32[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F504A8]);
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v9 = (void *)[v7 initWithIdentifier:@"delete-siri-dictation-history" predicate:v8];
  v32[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F504A8]);
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE" argumentArray:0];
  v12 = (void *)[v10 initWithIdentifier:@"disable-siri" predicate:v11];
  v32[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F504A8]);
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"FALSEPREDICATE" argumentArray:0];
  v15 = (void *)[v13 initWithIdentifier:@"intent-deletion" predicate:v14];
  v32[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F504A8]);
  v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY candidateInteractions.candidateId.bundleId IN $disabledApps OR ANY tupleInteraction.candidateIds.bundleId IN $disabledApps" argumentArray:0];
  v18 = (void *)[v16 initWithIdentifier:@"learn-from-this-app" predicate:v17];
  v32[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:7];

  v20 = (void *)MEMORY[0x1E4F504B0];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A5D4D71C-2E3F-47ED-8772-1C04D0A6E738"];
  BYTE2(v24) = 1;
  LOWORD(v24) = 1;
  v22 = objc_msgSend(v20, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v21, @"IntelligenceEngine.Interaction.Donation", objc_opt_class(), v31, v30, 0, 0, v24, 0, v19, @"com.apple.intelligenceflowd");

  return v22;
}

+ (id)syncPolicyForDonation
{
  return 0;
}

+ (id)storeConfigurationForDonation
{
  id v2 = objc_alloc(MEMORY[0x1E4F50268]);
  id v3 = (void *)[v2 initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:5242880 maxStreamSize:*MEMORY[0x1E4F50258] maxEventCount:31536000.0];
  id v4 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"IntelligenceEngine.Interaction.Donation" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v3];

  return v4;
}

+ (id)Donation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDonation];
  id v3 = +[BMIntelligenceEngineInteraction columns];
  id v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  id v5 = BMEventBodyDataSQLColumn();
  id v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"IntelligenceEngine.Interaction.Donation" columns:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"IntelligenceEngine.Interaction.Donation" schema:v9 configuration:v2];

  return v10;
}

@end