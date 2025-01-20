@interface _BMIntelligenceFlowTranscriptLibraryNode
+ (id)Datastream;
+ (id)configurationForDatastream;
+ (id)identifier;
+ (id)storeConfigurationForDatastream;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForDatastream;
+ (id)validKeyPaths;
@end

@implementation _BMIntelligenceFlowTranscriptLibraryNode

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"Datastream"])
  {
    v4 = [a1 Datastream];
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
  v3 = +[BMIntelligenceFlowTranscriptDatastreamEvent validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF7440;
}

+ (id)identifier
{
  return @"Transcript";
}

+ (id)configurationForDatastream
{
  v3 = [a1 storeConfigurationForDatastream];
  v4 = [a1 syncPolicyForDatastream];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BD282BB0-1D42-4EED-92EA-978297F981E7"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"IntelligenceFlow.Transcript.Datastream", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.intelligenceflow.intelligenceflowd");

  return v7;
}

+ (id)syncPolicyForDatastream
{
  return 0;
}

+ (id)storeConfigurationForDatastream
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:1000 maxEventCount:604800.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"IntelligenceFlow.Transcript.Datastream" domain:0 segmentSize:0x100000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)Datastream
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForDatastream];
  v3 = +[BMIntelligenceFlowTranscriptDatastreamEvent columns];
  v4 = BMEventTimestampSQLColumn();
  v20[0] = v4;
  v5 = BMEventBodyDataSQLColumn();
  v20[1] = v5;
  v6 = BMEventClassNameSQLColumn();
  v20[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  uint64_t v9 = BMEventBookmarkSQLColumns();
  v10 = [v8 arrayByAddingObjectsFromArray:v9];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifiers.clientSessionId" dataType:2 requestOnly:1 fieldPath:&unk_1F0BF73F8 protoDataType:13 convertedType:0];
  v19[0] = v11;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifiers.clientRequestId" dataType:2 requestOnly:1 fieldPath:&unk_1F0BF7410 protoDataType:13 convertedType:0];
  v19[1] = v12;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifiers.sessionId" dataType:6 requestOnly:1 fieldPath:&unk_1F0BF7428 protoDataType:14 convertedType:3];
  v19[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v15 = [v10 arrayByAddingObjectsFromArray:v14];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"IntelligenceFlow.Transcript.Datastream" columns:v15];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"IntelligenceFlow.Transcript.Datastream" schema:v16 configuration:v2];

  return v17;
}

@end