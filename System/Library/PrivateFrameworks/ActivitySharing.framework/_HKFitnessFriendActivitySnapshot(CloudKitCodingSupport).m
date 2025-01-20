@interface _HKFitnessFriendActivitySnapshot(CloudKitCodingSupport)
+ (id)_fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport friendUUID:uploadedDate:;
+ (id)fitnessFriendActivitySnapshotWithRecord:()CloudKitCodingSupport friendUUID:;
+ (uint64_t)fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport;
+ (uint64_t)fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport friendUUID:;
- (ASCodableCloudKitActivitySnapshot)codableSnapshot;
- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:;
@end

@implementation _HKFitnessFriendActivitySnapshot(CloudKitCodingSupport)

- (ASCodableCloudKitActivitySnapshot)codableSnapshot
{
  v2 = objc_alloc_init(ASCodableCloudKitActivitySnapshot);
  v3 = _ASCodableCloudKitSampleForSample(a1);
  [(ASCodableCloudKitActivitySnapshot *)v2 setSample:v3];

  v4 = [a1 sourceUUID];
  v5 = objc_msgSend(v4, "hk_dataForUUIDBytes");
  [(ASCodableCloudKitActivitySnapshot *)v2 setSourceUUID:v5];

  -[ASCodableCloudKitActivitySnapshot setSnapshotIndex:](v2, "setSnapshotIndex:", [a1 snapshotIndex]);
  v6 = [a1 timeZoneOffsetFromUTCForNoon];
  -[ASCodableCloudKitActivitySnapshot setTimeZoneOffsetFromUTCForNoon:](v2, "setTimeZoneOffsetFromUTCForNoon:", [v6 longLongValue]);

  [a1 energyBurned];
  -[ASCodableCloudKitActivitySnapshot setEnergyBurned:](v2, "setEnergyBurned:");
  [a1 energyBurnedGoal];
  -[ASCodableCloudKitActivitySnapshot setEnergyBurnedGoal:](v2, "setEnergyBurnedGoal:");
  [a1 mmv];
  -[ASCodableCloudKitActivitySnapshot setMmv:](v2, "setMmv:");
  [a1 mmg];
  -[ASCodableCloudKitActivitySnapshot setMmg:](v2, "setMmg:");
  [a1 briskMinutes];
  -[ASCodableCloudKitActivitySnapshot setBriskMinutes:](v2, "setBriskMinutes:");
  [a1 briskMinutesGoal];
  -[ASCodableCloudKitActivitySnapshot setBriskMinutesGoal:](v2, "setBriskMinutesGoal:");
  [a1 activeHours];
  -[ASCodableCloudKitActivitySnapshot setActiveHours:](v2, "setActiveHours:");
  [a1 activeHoursGoal];
  -[ASCodableCloudKitActivitySnapshot setActiveHoursGoal:](v2, "setActiveHoursGoal:");
  [a1 walkingAndRunningDistance];
  -[ASCodableCloudKitActivitySnapshot setWalkingAndRunningDistance:](v2, "setWalkingAndRunningDistance:");
  [a1 stepCount];
  -[ASCodableCloudKitActivitySnapshot setStepCount:](v2, "setStepCount:");
  [a1 pushCount];
  -[ASCodableCloudKitActivitySnapshot setPushCount:](v2, "setPushCount:");
  -[ASCodableCloudKitActivitySnapshot setWheelchairUse:](v2, "setWheelchairUse:", [a1 wheelchairUse]);
  -[ASCodableCloudKitActivitySnapshot setAmm:](v2, "setAmm:", [a1 amm]);

  return v2;
}

- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(a1, "snapshotIndex"));
  v9 = [a1 sourceUUID];
  v10 = [v9 UUIDString];

  v11 = [NSString stringWithFormat:@"%@-%lld-%@", @"ActivitySharingActivitySnapshot", objc_msgSend(v8, "longLongValue"), v10];
  v12 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v11 zoneID:v7];

  v13 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingActivitySnapshot" recordID:v12];
  _ASUpdateSchemaVersionOnRecord(2, v13, a4);
  v14 = [a1 codableSnapshot];
  v15 = [v14 data];
  v16 = [v13 encryptedValues];
  [v16 setObject:v15 forKeyedSubscript:@"EncryptedData"];

  return v13;
}

+ (id)fitnessFriendActivitySnapshotWithRecord:()CloudKitCodingSupport friendUUID:
{
  id v6 = a3;
  id v7 = a4;
  if (_ASCloudKitSchemaVersionForRecord(v6) == 2)
  {
    v8 = [v6 encryptedValues];
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
      v12 = [[ASCodableCloudKitActivitySnapshot alloc] initWithData:v10];
      v13 = [v6 modificationDate];
      v11 = [a1 fitnessFriendActivitySnapshotWithCodableSnapshot:v12 friendUUID:v7 uploadedDate:v13];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[_HKFitnessFriendActivitySnapshot(CloudKitCodingSupport) fitnessFriendActivitySnapshotWithRecord:friendUUID:]();
      }
      v11 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[_HKFitnessFriendActivitySnapshot(CloudKitCodingSupport) fitnessFriendActivitySnapshotWithRecord:friendUUID:]();
    }
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport
{
  return [a1 _fitnessFriendActivitySnapshotWithCodableSnapshot:a3 friendUUID:0 uploadedDate:0];
}

+ (uint64_t)fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport friendUUID:
{
  return [a1 _fitnessFriendActivitySnapshotWithCodableSnapshot:a3 friendUUID:a4 uploadedDate:0];
}

+ (id)_fitnessFriendActivitySnapshotWithCodableSnapshot:()CloudKitCodingSupport friendUUID:uploadedDate:
{
  id v7 = (void *)MEMORY[0x263EFF910];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 sample];
  [v11 startDate];
  v12 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");

  v13 = (void *)MEMORY[0x263EFF910];
  v14 = [v10 sample];
  [v14 endDate];
  v15 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");

  v16 = (void *)MEMORY[0x263F08C38];
  v17 = [v10 sourceUUID];
  v18 = objc_msgSend(v16, "hk_UUIDWithData:", v17);

  v19 = objc_msgSend(MEMORY[0x263F0A9D0], "_fitnessFriendActivitySnapshotWithSnapshotIndex:startDate:endDate:sourceUUID:", objc_msgSend(v10, "snapshotIndex"), v12, v15, v18);
  [v19 setFriendUUID:v9];

  [v19 setSnapshotUploadedDate:v8];
  v20 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "timeZoneOffsetFromUTCForNoon"));
  [v19 setTimeZoneOffsetFromUTCForNoon:v20];

  [v10 energyBurned];
  objc_msgSend(v19, "setEnergyBurned:");
  [v10 energyBurnedGoal];
  objc_msgSend(v19, "setEnergyBurnedGoal:");
  [v10 mmv];
  objc_msgSend(v19, "setMmv:");
  [v10 mmg];
  objc_msgSend(v19, "setMmg:");
  [v10 briskMinutes];
  objc_msgSend(v19, "setBriskMinutes:");
  [v10 briskMinutesGoal];
  objc_msgSend(v19, "setBriskMinutesGoal:");
  [v10 activeHours];
  objc_msgSend(v19, "setActiveHours:");
  [v10 activeHoursGoal];
  objc_msgSend(v19, "setActiveHoursGoal:");
  [v10 walkingAndRunningDistance];
  objc_msgSend(v19, "setWalkingAndRunningDistance:");
  [v10 stepCount];
  objc_msgSend(v19, "setStepCount:");
  [v10 pushCount];
  objc_msgSend(v19, "setPushCount:");
  objc_msgSend(v19, "setWheelchairUse:", objc_msgSend(v10, "wheelchairUse"));
  uint64_t v21 = [v10 amm];

  [v19 setAmm:v21];

  return v19;
}

+ (void)fitnessFriendActivitySnapshotWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Activity Snapshot does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
}

+ (void)fitnessFriendActivitySnapshotWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21EC60000, v0, v1, "Activity Snapshot record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
}

@end