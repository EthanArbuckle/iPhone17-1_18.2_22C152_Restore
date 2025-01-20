@interface _HKFitnessFriendWorkout(CloudKitCodingSupport)
+ (id)_fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport friendUUID:;
+ (id)fitnessFriendWorkoutWithRecord:()CloudKitCodingSupport friendUUID:;
+ (uint64_t)fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport;
- (ASCodableCloudKitWorkout)codableWorkout;
- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:;
@end

@implementation _HKFitnessFriendWorkout(CloudKitCodingSupport)

- (ASCodableCloudKitWorkout)codableWorkout
{
  v2 = objc_alloc_init(ASCodableCloudKitWorkout);
  v3 = _ASCodableCloudKitSampleForSample(a1);
  [(ASCodableCloudKitWorkout *)v2 setSample:v3];

  -[ASCodableCloudKitWorkout setType:](v2, "setType:", [a1 workoutActivityType]);
  [a1 duration];
  -[ASCodableCloudKitWorkout setDuration:](v2, "setDuration:");
  v4 = [a1 totalEnergyBurned];

  if (v4)
  {
    v5 = [a1 totalEnergyBurned];
    v6 = _HKWorkoutCanonicalEnergyBurnedUnit();
    [v5 doubleValueForUnit:v6];
    -[ASCodableCloudKitWorkout setTotalEnergyBurnedInCanonicalUnit:](v2, "setTotalEnergyBurnedInCanonicalUnit:");
  }
  v7 = [a1 totalBasalEnergyBurned];

  if (v7)
  {
    v8 = [a1 totalBasalEnergyBurned];
    v9 = _HKWorkoutCanonicalEnergyBurnedUnit();
    [v8 doubleValueForUnit:v9];
    -[ASCodableCloudKitWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v2, "setTotalBasalEnergyBurnedInCanonicalUnit:");
  }
  v10 = [a1 totalDistance];

  if (v10)
  {
    v11 = [a1 totalDistance];
    v12 = _HKWorkoutCanonicalDistanceUnit();
    [v11 doubleValueForUnit:v12];
    -[ASCodableCloudKitWorkout setTotalDistanceInCanonicalUnit:](v2, "setTotalDistanceInCanonicalUnit:");
  }
  -[ASCodableCloudKitWorkout setGoalType:](v2, "setGoalType:", [a1 goalType]);
  uint64_t v13 = [a1 goal];
  if (v13)
  {
    v14 = (void *)v13;
    [a1 goalType];
    int IsValidForGoal = _HKWorkoutGoalTypeIsValidForGoal();

    if (IsValidForGoal)
    {
      v16 = [a1 goal];
      [a1 goalType];
      v17 = _HKWorkoutCanonicalUnitForGoalType();
      [v16 doubleValueForUnit:v17];
      -[ASCodableCloudKitWorkout setGoalInCanonicalUnit:](v2, "setGoalInCanonicalUnit:");
    }
  }
  v18 = [a1 bundleID];
  [(ASCodableCloudKitWorkout *)v2 setBundleID:v18];

  -[ASCodableCloudKitWorkout setIsWatchWorkout:](v2, "setIsWatchWorkout:", [a1 isWatchWorkout]);
  -[ASCodableCloudKitWorkout setIsIndoorWorkout:](v2, "setIsIndoorWorkout:", [a1 isIndoorWorkout]);
  v19 = [a1 deviceManufacturer];
  [(ASCodableCloudKitWorkout *)v2 setDeviceManufacturer:v19];

  v20 = [a1 deviceModel];
  [(ASCodableCloudKitWorkout *)v2 setDeviceModel:v20];

  v21 = [a1 seymourCatalogWorkoutIdentifier];
  [(ASCodableCloudKitWorkout *)v2 setSeymourCatalogWorkoutIdentifier:v21];

  v22 = [a1 seymourMediaType];
  [(ASCodableCloudKitWorkout *)v2 setSeymourMediaType:v22];

  return v2;
}

- (id)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:
{
  id v6 = a3;
  v7 = [a1 UUID];
  v8 = ASWorkoutRecordIDForUUID(v7, v6);

  v9 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingWorkout" recordID:v8];
  _ASUpdateSchemaVersionOnRecord(2, v9, a4);
  v10 = [a1 codableWorkout];
  v11 = [v10 data];
  v12 = [v9 encryptedValues];
  [v12 setObject:v11 forKeyedSubscript:@"EncryptedData"];

  ASLoggingInitialize();
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG)) {
    -[_HKFitnessFriendWorkout(CloudKitCodingSupport) recordWithZoneID:recordEncryptionType:]();
  }
  ASLoggingInitialize();
  uint64_t v13 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG)) {
    -[_HKFitnessFriendWorkout(CloudKitCodingSupport) recordWithZoneID:recordEncryptionType:](v13, a1);
  }

  return v9;
}

+ (id)fitnessFriendWorkoutWithRecord:()CloudKitCodingSupport friendUUID:
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
      v12 = [[ASCodableCloudKitWorkout alloc] initWithData:v10];
      v11 = [a1 fitnessFriendWorkoutWithCodableWorkout:v12 friendUUID:v7];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[_HKFitnessFriendWorkout(CloudKitCodingSupport) fitnessFriendWorkoutWithRecord:friendUUID:]();
      }
      v11 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[_HKFitnessFriendWorkout(CloudKitCodingSupport) fitnessFriendWorkoutWithRecord:friendUUID:]();
    }
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport
{
  return [a1 _fitnessFriendWorkoutWithCodableWorkout:a3 friendUUID:0];
}

+ (id)_fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport friendUUID:
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263F08C38];
  id v51 = a4;
  id v7 = [v5 sample];
  v8 = [v7 uuid];
  v54 = objc_msgSend(v6, "hk_UUIDWithData:", v8);

  uint64_t v50 = [v5 type];
  id v9 = (void *)MEMORY[0x263EFF910];
  id v10 = [v5 sample];
  [v10 startDate];
  uint64_t v11 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");

  v12 = (void *)MEMORY[0x263EFF910];
  uint64_t v13 = [v5 sample];
  [v13 endDate];
  uint64_t v14 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");

  if ([v5 hasTotalEnergyBurnedInCanonicalUnit])
  {
    v15 = (void *)MEMORY[0x263F0A630];
    v16 = _HKWorkoutCanonicalEnergyBurnedUnit();
    v17 = [v15 quantityWithUnit:v16 doubleValue:0.0];

    if (([v5 isAmm] & 1) == 0)
    {
      v18 = (void *)MEMORY[0x263F0A630];
      v19 = _HKWorkoutCanonicalEnergyBurnedUnit();
      [v5 totalEnergyBurnedInCanonicalUnit];
      uint64_t v20 = objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19);

      v17 = (void *)v20;
    }
  }
  else
  {
    v17 = 0;
  }
  if ([v5 hasTotalBasalEnergyBurnedInCanonicalUnit])
  {
    v21 = (void *)MEMORY[0x263F0A630];
    v22 = _HKWorkoutCanonicalEnergyBurnedUnit();
    v23 = [v21 quantityWithUnit:v22 doubleValue:0.0];

    if (([v5 isAmm] & 1) == 0)
    {
      v24 = (void *)MEMORY[0x263F0A630];
      v25 = _HKWorkoutCanonicalEnergyBurnedUnit();
      [v5 totalBasalEnergyBurnedInCanonicalUnit];
      uint64_t v26 = objc_msgSend(v24, "quantityWithUnit:doubleValue:", v25);

      v23 = (void *)v26;
    }
  }
  else
  {
    v23 = 0;
  }
  if ([v5 hasTotalDistanceInCanonicalUnit])
  {
    v27 = (void *)MEMORY[0x263F0A630];
    v28 = _HKWorkoutCanonicalDistanceUnit();
    [v5 totalDistanceInCanonicalUnit];
    v55 = objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28);
  }
  else
  {
    v55 = 0;
  }
  v57 = (void *)v11;
  v52 = v17;
  v53 = (void *)v14;
  v56 = v23;
  uint64_t v48 = [v5 goalType];
  if ([v5 hasGoalInCanonicalUnit])
  {
    v29 = (void *)MEMORY[0x263F0A630];
    v30 = _HKWorkoutCanonicalUnitForGoalType();
    [v5 goalInCanonicalUnit];
    uint64_t v31 = objc_msgSend(v29, "quantityWithUnit:doubleValue:", v30);
  }
  else
  {
    uint64_t v31 = 0;
  }
  char v32 = [v5 isIndoorWorkout];
  v47 = (void *)MEMORY[0x263F0A9D8];
  [v5 duration];
  double v34 = v33;
  v35 = [v5 bundleID];
  char v36 = [v5 isWatchWorkout];
  v37 = [v5 deviceManufacturer];
  v38 = [v5 deviceModel];
  uint64_t v39 = [v5 amm];
  v40 = [v5 seymourCatalogWorkoutIdentifier];
  v41 = [v5 seymourMediaType];
  BYTE1(v46) = v32;
  LOBYTE(v46) = v36;
  v49 = (void *)v31;
  objc_msgSend(v47, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", v50, v51, v57, v53, v52, v56, v34, v55, v48, v31, v35, v46, v37, v38, v39,
    v40,
  v42 = v41);

  [v42 _setUUID:v54];
  [v42 workoutActivityType];
  if ((_HKWorkoutActivityTypeIsValid() & 1) == 0) {
    [v42 setWorkoutActivityType:3000];
  }
  ASLoggingInitialize();
  v43 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG)) {
    +[_HKFitnessFriendWorkout(CloudKitCodingSupport) _fitnessFriendWorkoutWithCodableWorkout:friendUUID:](v43, v42);
  }
  ASLoggingInitialize();
  v44 = (void *)ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_DEBUG)) {
    +[_HKFitnessFriendWorkout(CloudKitCodingSupport) _fitnessFriendWorkoutWithCodableWorkout:friendUUID:](v44, v42);
  }
  [v42 goalType];
  if ((_HKWorkoutGoalTypeIsValidForGoal() & 1) == 0) {
    [v42 setGoal:0];
  }

  return v42;
}

- (void)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:.cold.1(void *a1, void *a2)
{
  id v4 = a1;
  id v5 = [(id)OUTLINED_FUNCTION_7() bundleID];
  [a2 isWatchWorkout];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_21EC60000, v6, v7, "BundleID: %@, isWatchWorkout: %{BOOL}d", v8, v9, v10, v11, v12);
}

- (void)recordWithZoneID:()CloudKitCodingSupport recordEncryptionType:.cold.2()
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_21EC60000, v0, OS_LOG_TYPE_DEBUG, "Creating record for sending to cloud", v1, 2u);
}

+ (void)fitnessFriendWorkoutWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Workout does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
}

+ (void)fitnessFriendWorkoutWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21EC60000, v0, v1, "Workout record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
}

+ (void)_fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport friendUUID:.cold.1(void *a1, void *a2)
{
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_7() bundleID];
  [a2 isWatchWorkout];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_21EC60000, v6, v7, "bundleID: %@, isWatchWorkout: %{BOOL}d", v8, v9, v10, v11, v12);
}

+ (void)_fitnessFriendWorkoutWithCodableWorkout:()CloudKitCodingSupport friendUUID:.cold.2(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_7() UUID];
  uint64_t v6 = [a2 friendUUID];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21EC60000, v2, OS_LOG_TYPE_DEBUG, "Deserializing workout from CKRecord with entity UUID %{public}@ from CK: friendUUID: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end