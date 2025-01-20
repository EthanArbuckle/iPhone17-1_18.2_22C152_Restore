@interface _HKFitnessFriendAchievement(CloudKitCodingSupport)
+ (id)_fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport friendUUID:;
+ (id)fitnessFriendAchievementWithRecord:()CloudKitCodingSupport friendUUID:;
+ (uint64_t)fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport;
- (ASCodableCloudKitAchievement)codableAchievement;
- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:;
@end

@implementation _HKFitnessFriendAchievement(CloudKitCodingSupport)

- (ASCodableCloudKitAchievement)codableAchievement
{
  v2 = objc_alloc_init(ASCodableCloudKitAchievement);
  v3 = _ASCodableCloudKitSampleForSample(a1);
  [(ASCodableCloudKitAchievement *)v2 setSample:v3];

  v4 = [a1 completedDate];
  [v4 timeIntervalSinceReferenceDate];
  -[ASCodableCloudKitAchievement setCompletedDate:](v2, "setCompletedDate:");

  id v5 = [a1 value];
  v6 = (unsigned char *)[v5 objCType];
  if (v6)
  {
    int v7 = *v6 & 0xFD;

    if (v7 == 100)
    {
      v8 = [a1 value];
      [v8 doubleValue];
      -[ASCodableCloudKitAchievement setDoubleValue:](v2, "setDoubleValue:");
      goto LABEL_6;
    }
  }
  else
  {
  }
  v8 = [a1 value];
  -[ASCodableCloudKitAchievement setIntValue:](v2, "setIntValue:", [v8 longLongValue]);
LABEL_6:

  v9 = [a1 templateUniqueName];
  [(ASCodableCloudKitAchievement *)v2 setWorkoutActivityType:ACHWorkoutActivityTypeForTemplateUniqueName()];

  v10 = [a1 templateUniqueName];
  v11 = ACHLegacyDefinitionIdentifierForTemplateUniqueName();
  [(ASCodableCloudKitAchievement *)v2 setDefinitionIdentifier:v11];

  v12 = [a1 templateUniqueName];
  [(ASCodableCloudKitAchievement *)v2 setTemplateUniqueName:v12];

  return v2;
}

- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:
{
  v6 = (objc_class *)MEMORY[0x263EFD7E8];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = NSString;
  v10 = [a1 UUID];
  v11 = [v9 stringWithFormat:@"%@-%@", @"ActivitySharingAchievement", v10];
  v12 = (void *)[v8 initWithRecordName:v11 zoneID:v7];

  v13 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingAchievement" recordID:v12];
  _ASUpdateSchemaVersionOnRecord(2, v13, a4);
  v14 = [a1 codableAchievement];
  v15 = [v14 data];
  v16 = [v13 encryptedValues];
  [v16 setObject:v15 forKeyedSubscript:@"EncryptedData"];

  return v13;
}

+ (id)fitnessFriendAchievementWithRecord:()CloudKitCodingSupport friendUUID:
{
  id v6 = a3;
  id v7 = a4;
  if (_ASCloudKitSchemaVersionForRecord(v6) == 2)
  {
    id v8 = [v6 encryptedValues];
    id v9 = [v8 objectForKeyedSubscript:@"EncryptedData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      v12 = [[ASCodableCloudKitAchievement alloc] initWithData:v10];
      v11 = [a1 fitnessFriendAchievementWithCodableAchievement:v12 friendUUID:v7];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[_HKFitnessFriendAchievement(CloudKitCodingSupport) fitnessFriendAchievementWithRecord:friendUUID:]();
      }
      v11 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[_HKFitnessFriendAchievement(CloudKitCodingSupport) fitnessFriendAchievementWithRecord:friendUUID:]();
    }
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport
{
  return [a1 _fitnessFriendAchievementWithCodableAchievement:a3 friendUUID:0];
}

+ (id)_fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport friendUUID:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFF910];
  [v5 completedDate];
  id v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  if ([v5 hasTemplateUniqueName])
  {
    id v9 = [v5 templateUniqueName];
    if (v9)
    {
LABEL_3:
      char v10 = [v5 hasDoubleValue];
      v11 = NSNumber;
      if (v10)
      {
        [v5 doubleValue];
        objc_msgSend(v11, "numberWithDouble:");
      }
      else
      {
        objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "intValue"));
      v15 = };
      v14 = [MEMORY[0x263F0A9C8] achievementWithTemplateUniqueName:v9 completedDate:v8 value:v15 friendUUID:v6];
      v16 = (void *)MEMORY[0x263F08C38];
      v17 = [v5 sample];
      v18 = [v17 uuid];
      v19 = objc_msgSend(v16, "hk_UUIDWithData:", v18);

      [v14 _setUUID:v19];
      goto LABEL_11;
    }
  }
  else
  {
    v12 = [v5 definitionIdentifier];
    [v5 workoutActivityType];
    id v9 = ACHTemplateUniqueNameForLegacyAchievementInfo();

    if (v9) {
      goto LABEL_3;
    }
  }
  ASLoggingInitialize();
  v13 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
    +[_HKFitnessFriendAchievement(CloudKitCodingSupport) _fitnessFriendAchievementWithCodableAchievement:friendUUID:](v13);
  }
  v14 = 0;
LABEL_11:

  return v14;
}

+ (void)fitnessFriendAchievementWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Achievement does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
}

+ (void)fitnessFriendAchievementWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21EC60000, v0, v1, "Achievement record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
}

+ (void)_fitnessFriendAchievementWithCodableAchievement:()CloudKitCodingSupport friendUUID:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() definitionIdentifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21EC60000, v4, v5, "Codable achievement had no templateUniqueName and an unknown or missing definitionIdentifier: %{public}@", v6, v7, v8, v9, v10);
}

@end