@interface _BMCameraCaptureLibraryNode
+ (id)AutoFocusROI;
+ (id)configurationForAutoFocusROI;
+ (id)identifier;
+ (id)storeConfigurationForAutoFocusROI;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)syncPolicyForAutoFocusROI;
+ (id)validKeyPaths;
@end

@implementation _BMCameraCaptureLibraryNode

+ (id)identifier
{
  return @"CameraCapture";
}

+ (id)sublibraries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)streamWithName:(id)a3
{
  if ([a3 isEqualToString:@"AutoFocusROI"])
  {
    v4 = [a1 AutoFocusROI];
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
  v3 = +[BMCameraCaptureAutoFocusROI validKeyPaths];
  [v2 addObjectsFromArray:v3];

  v4 = (void *)[v2 copy];

  return v4;
}

+ (id)streamNames
{
  return &unk_1F0BF7278;
}

+ (id)configurationForAutoFocusROI
{
  v3 = [a1 storeConfigurationForAutoFocusROI];
  v4 = [a1 syncPolicyForAutoFocusROI];
  v5 = (void *)MEMORY[0x1E4F504B0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7FC26DAC-580D-4867-BBF8-7F01AA998DF6"];
  BYTE2(v9) = 1;
  LOWORD(v9) = 1;
  v7 = objc_msgSend(v5, "_libraryStreamConfigurationWithUUID:streamIdentifier:eventClass:storeConfig:syncPolicy:legacyNames:internalMetadata:enableSubscriptions:enableSubscriptionSubstream:enableTombstoneSubstream:allowedClients:pruningTriggers:spaceAttributionOwner:", v6, @"CameraCapture.AutoFocusROI", objc_opt_class(), v3, v4, 0, 0, v9, 0, 0, @"com.apple.cameracaptured");

  return v7;
}

+ (id)syncPolicyForAutoFocusROI
{
  return 0;
}

+ (id)storeConfigurationForAutoFocusROI
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:10000 maxEventCount:2419200.0];
  v3 = (void *)[MEMORY[0x1E4F50278] newLibraryStoreConfigForStreamIdentifier:@"CameraCapture.AutoFocusROI" domain:0 segmentSize:0x20000 protectionClass:3 pruningPolicy:v2];

  return v3;
}

+ (id)AutoFocusROI
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 configurationForAutoFocusROI];
  v3 = +[BMCameraCaptureAutoFocusROI columns];
  v4 = BMEventTimestampSQLColumn();
  v12 = v4;
  v5 = BMEventBodyDataSQLColumn();
  v13 = v5;
  v6 = BMEventClassNameSQLColumn();
  v14 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  v8 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50428]) initWithTableName:@"CameraCapture.AutoFocusROI" columns:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50498]) initWithIdentifier:@"CameraCapture.AutoFocusROI" schema:v9 configuration:v2];

  return v10;
}

@end