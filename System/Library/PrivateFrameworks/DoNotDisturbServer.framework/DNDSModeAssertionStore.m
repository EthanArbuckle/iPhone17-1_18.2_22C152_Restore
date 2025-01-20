@interface DNDSModeAssertionStore
+ ($320118C967FE9B4ADDF02AB591397AFA)backingRecordKeys;
+ ($320118C967FE9B4ADDF02AB591397AFA)syncMessageKeys;
+ ($320118C967FE9B4ADDF02AB591397AFA)sysdiagnoseRecordKeys;
+ (id)messageDateForPeaceSyncDictionaryRepresentation:(id)a3;
+ (id)messageDateForSyncDictionaryRepresentation:(id)a3;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
+ (id)newWithPeaceSyncDictionaryRepresentation:(id)a3;
+ (id)newWithSyncDictionaryRepresentation:(id)a3;
+ (id)upgradeDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (DNDSModeAssertionStore)init;
- (NSArray)assertions;
- (NSArray)invalidationRequests;
- (NSArray)invalidations;
- (NSString)description;
- (id)_initWithStore:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)lastUpdateDate;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)peaceSyncDictionaryRepresentationWithDate:(id)a3 messageUUID:(id)a4 userRequestedClientIdentifierHandler:(id)a5;
- (id)syncDictionaryRepresentationWithDate:(id)a3 messageUUID:(id)a4;
- (id)sysdiagnoseDictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation DNDSModeAssertionStore

+ ($320118C967FE9B4ADDF02AB591397AFA)syncMessageKeys
{
  return ($320118C967FE9B4ADDF02AB591397AFA *)__copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(retstr, (id *)&kSyncRecordKeys);
}

+ (id)newWithSyncDictionaryRepresentation:(id)a3
{
  v3 = objc_msgSend(a3, "bs_safeDictionaryForKey:", @"c");
  v4 = +[DNDSModeAssertionStoreRecord recordForDictionary:v3 keys:&kSyncRecordKeys];
  v5 = [v4 object];

  return v5;
}

+ (id)messageDateForSyncDictionaryRepresentation:(id)a3
{
  v3 = objc_msgSend(a3, "bs_safeNumberForKey:", @"b");
  v4 = v3;
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] distantPast];
  v6 = };

  return v6;
}

- (id)syncDictionaryRepresentationWithDate:(id)a3 messageUUID:(id)a4
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[DNDSModeAssertionStoreRecord recordForAssertionStore:self];
  v9 = [v8 dictionaryWithKeys:&kSyncRecordKeys options:0];
  v17[0] = @"a";
  v10 = [v6 UUIDString];

  v18[0] = v10;
  v17[1] = @"b";
  v11 = NSNumber;
  [v7 timeIntervalSinceReferenceDate];
  double v13 = v12;

  v14 = [v11 numberWithDouble:v13];
  v17[2] = @"c";
  v18[1] = v14;
  v18[2] = v9;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v15;
}

+ ($320118C967FE9B4ADDF02AB591397AFA)backingRecordKeys
{
  return ($320118C967FE9B4ADDF02AB591397AFA *)__copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(retstr, (id *)kBackingStoreRecordKeys);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  v4 = +[DNDSModeAssertionStoreRecord recordForDictionary:a3 keys:kBackingStoreRecordKeys];
  v5 = [v4 object];

  return v5;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  v3 = +[DNDSModeAssertionStoreRecord recordForAssertionStore:self];
  v4 = [v3 dictionaryWithKeys:kBackingStoreRecordKeys options:0];

  return v4;
}

+ (id)upgradeDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v7 = (void *)[v35 mutableCopy];
  if (a4 <= 1 && a5 >= 2)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];

    id v7 = (void *)v8;
  }
  if (a4 <= 2 && a5 >= 3)
  {
    v9 = objc_msgSend(v7, "bs_safeArrayForKey:", @"storeAssertionRecords");
    v10 = objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_7);

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, @"storeAssertionRecords");
  }
  if (a4 <= 3 && a5 >= 4)
  {
    v11 = objc_msgSend(v7, "bs_safeArrayForKey:", @"storeAssertionRecords");
    double v12 = objc_msgSend(v11, "bs_mapNoNulls:", &__block_literal_global_13);

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v12, @"storeAssertionRecords");
  }
  if (a4 <= 4 && a5 >= 5)
  {
    double v13 = objc_msgSend(v7, "bs_safeArrayForKey:", @"storeAssertionRecords");
    v14 = objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_30);

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, @"storeAssertionRecords");
  }
  if (a4 <= 5 && a5 >= 6)
  {
    v15 = objc_msgSend(v7, "bs_safeNumberForKey:", @"storeLastCompleteInvalidationTimestamp");
    if (v15) {
      [v7 setObject:@"user-changed-state" forKey:@"storeLastCompleteInvalidationReason"];
    }
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__4;
    v45 = __Block_byref_object_dispose__4;
    v16 = (void *)MEMORY[0x1E4F1C9C8];
    if (v15)
    {
      [v15 doubleValue];
      objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "bs_safeArrayForKey:", @"storeAssertionRecords");
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_41;
    v40[3] = &unk_1E6973F28;
    v40[4] = &v41;
    v18 = objc_msgSend(v17, "bs_mapNoNulls:", v40);

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v18, @"storeAssertionRecords");
    [(id)v42[5] timeIntervalSinceReferenceDate];
    v19 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v19 forKey:@"storeLastUpdateDate"];

    _Block_object_dispose(&v41, 8);
  }
  if (a4 <= 7 && a5 >= 8)
  {
    v34 = objc_msgSend(v7, "bs_safeNumberForKey:", @"storeLastCompleteInvalidationTimestamp");
    v20 = objc_msgSend(v7, "bs_safeStringForKey:", @"storeLastCompleteInvalidationReason");
    uint64_t v21 = objc_msgSend(v7, "bs_safeStringForKey:", @"storeLastCompleteInvalidationSourceClientIdentifier");
    v22 = (void *)v21;
    if (v34 && v20 && v21)
    {
      v23 = objc_msgSend(v7, "bs_safeStringForKey:", @"storeLastCompleteInvalidationSourceDeviceIdentifier");
      v24 = [MEMORY[0x1E4F1CA60] dictionary];
      [v24 setObject:v22 forKey:@"assertionClientIdentifier"];
      objc_msgSend(v24, "bs_setSafeObject:forKey:", v23, @"assertionSourceDeviceIdentifier");
      v25 = [MEMORY[0x1E4F1CA60] dictionary];
      v26 = [MEMORY[0x1E4F29128] UUID];
      v27 = [v26 UUIDString];
      [v25 setObject:v27 forKey:@"invalidationRequestUUID"];

      [v25 setObject:&unk_1F2A5DAD8 forKey:@"invalidationRequestPredicate"];
      [v25 setObject:v34 forKey:@"invalidationRequestDateTimestamp"];
      [v25 setObject:v24 forKey:@"invalidationRequestSource"];
      [v25 setObject:v20 forKey:@"invalidationRequestReason"];
      v47[0] = v25;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
      [v7 setObject:v28 forKey:@"storeInvalidationRequestRecords"];
    }
    [v7 removeObjectForKey:@"storeLastCompleteInvalidationTimestamp"];
    [v7 removeObjectForKey:@"storeLastCompleteInvalidationReason"];
    [v7 removeObjectForKey:@"storeLastCompleteInvalidationSourceClientIdentifier"];
    [v7 removeObjectForKey:@"storeLastCompleteInvalidationSourceDeviceIdentifier"];
    v29 = objc_msgSend(v7, "bs_safeArrayForKey:", @"storeAssertionRecords");
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_3_131;
    v38[3] = &unk_1E6973F70;
    id v39 = &__block_literal_global_94;
    v30 = objc_msgSend(v29, "bs_mapNoNulls:", v38);

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v30, @"storeAssertionRecords");
    v31 = objc_msgSend(v7, "bs_safeArrayForKey:", @"storeInvalidationRecords");
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_4;
    v36[3] = &unk_1E6973F70;
    id v37 = &__block_literal_global_94;
    v32 = objc_msgSend(v31, "bs_mapNoNulls:", v36);

    objc_msgSend(v7, "bs_setSafeObject:forKey:", v32, @"storeInvalidationRecords");
    [v7 removeObjectForKey:@"storeLastUpdateDate"];
  }
  return v7;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (void *)[v2 mutableCopy];
  }
  else {
    v3 = 0;
  }
  v4 = objc_msgSend(v3, "bs_safeStringForKey:", @"assertionDetailsLifetimeType");
  v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:@"user-requested"]) {
      [v3 removeObjectForKey:@"assertionDetailsLifetimeType"];
    }
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"assertionDetailsUserRequested"];
  }

  return v3;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (void *)[v2 mutableCopy];
  }
  else {
    v3 = 0;
  }
  v4 = objc_msgSend(v3, "bs_safeNumberForKey:", @"assertionDetailsUserRequested");
  int v5 = [v4 BOOLValue];

  uint64_t v6 = objc_msgSend(v3, "bs_safeStringForKey:", @"assertionDetailsLifetimeType");
  id v7 = (void *)v6;
  if (v5 && !v6)
  {
    [v3 setObject:@"schedule" forKey:@"assertionDetailsLifetimeType"];
    [v3 setObject:@"com.apple.donotdisturb.schedule.default" forKey:@"assertionDetailsScheduleLifetimeScheduleIdentifier"];
    [v3 setObject:@"expire-on-end" forKey:@"assertionDetailsScheduleLifetimeBehavior"];
  }

  return v3;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (void *)[v2 mutableCopy];
  }
  else {
    v3 = 0;
  }
  [v3 removeObjectForKey:@"assertionDetailsUserRequested"];

  return v3;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = (void *)[v3 mutableCopy];
  }
  else {
    v4 = 0;
  }
  [v4 removeObjectForKey:@"assertionDetailsSyncSuppressionOptions"];
  int v5 = objc_msgSend(v4, "bs_safeNumberForKey:", @"assertionStartDateTimestamp");
  uint64_t v6 = v5;
  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  if (v5)
  {
    [v5 doubleValue];
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v8 = };
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) laterDate:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return v4;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_2_91(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsLifetimeType");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"assertionDetailsLifetimeType");

  int v5 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsCalendarEventLifetimeEventUniqueIdentifier");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, @"assertionDetailsCalendarEventLifetimeEventUniqueIdentifier");

  uint64_t v6 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsCalendarEventLifetimeOccurrenceDateTimestamp");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, @"assertionDetailsCalendarEventLifetimeOccurrenceDateTimestamp");

  id v7 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsCalendarEventLifetimeOnlyDuringEvent");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, @"assertionDetailsCalendarEventLifetimeOnlyDuringEvent");

  uint64_t v8 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsDateIntervalLifetimeStartDateTimestamp");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, @"assertionDetailsDateIntervalLifetimeStartDateTimestamp");

  uint64_t v9 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsDateIntervalLifetimeEndDateTimestamp");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, @"assertionDetailsDateIntervalLifetimeEndDateTimestamp");

  uint64_t v10 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsScheduleLifetimeScheduleIdentifier");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, @"assertionDetailsScheduleLifetimeScheduleIdentifier");

  v11 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsScheduleLifetimeBehavior");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v11, @"assertionDetailsScheduleLifetimeBehavior");

  if (![v3 count])
  {

    id v3 = 0;
  }
  double v12 = [MEMORY[0x1E4F1CA60] dictionary];
  double v13 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsIdentifier");
  objc_msgSend(v12, "bs_setSafeObject:forKey:", v13, @"assertionDetailsIdentifier");

  v14 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsModeIdentifier");
  objc_msgSend(v12, "bs_setSafeObject:forKey:", v14, @"assertionDetailsModeIdentifier");

  v15 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionDetailsUserVisibleEndDate");
  objc_msgSend(v12, "bs_setSafeObject:forKey:", v15, @"assertionDetailsUserVisibleEndDate");

  objc_msgSend(v12, "bs_setSafeObject:forKey:", v3, @"assertionDetailsLifetime");
  if (![v12 count])
  {

    double v12 = 0;
  }
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionClientIdentifier");
  objc_msgSend(v16, "bs_setSafeObject:forKey:", v17, @"assertionClientIdentifier");

  v18 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionSourceDeviceIdentifier");
  objc_msgSend(v16, "bs_setSafeObject:forKey:", v18, @"assertionSourceDeviceIdentifier");

  if (![v16 count])
  {

    v16 = 0;
  }
  v19 = [MEMORY[0x1E4F1CA60] dictionary];
  v20 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionUUID");
  objc_msgSend(v19, "bs_setSafeObject:forKey:", v20, @"assertionUUID");

  uint64_t v21 = objc_msgSend(v2, "bs_takeObjectForKey:", @"assertionStartDateTimestamp");
  objc_msgSend(v19, "bs_setSafeObject:forKey:", v21, @"assertionStartDateTimestamp");

  objc_msgSend(v19, "bs_setSafeObject:forKey:", v12, @"assertionDetails");
  objc_msgSend(v19, "bs_setSafeObject:forKey:", v16, @"assertionSource");

  return v19;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_3_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = (void *)[v5 mutableCopy];
    uint64_t v9 = (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id __114__DNDSModeAssertionStore_BackingRecordUpgrade__upgradeDictionaryRepresentation_fromVersionNumber_toVersionNumber___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = (void *)[v3 mutableCopy];
  }
  else {
    v4 = 0;
  }
  id v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v5, @"invalidationAssertion");
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = objc_msgSend(v4, "bs_takeObjectForKey:", @"invalidationSourceClientIdentifier");
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v7, @"assertionClientIdentifier");

  uint64_t v8 = objc_msgSend(v4, "bs_takeObjectForKey:", @"invalidationSourceDeviceIdentifier");
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v8, @"assertionSourceDeviceIdentifier");

  if (![v6 count])
  {

    uint64_t v6 = 0;
  }
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v6, @"invalidationSource");

  return v4;
}

+ ($320118C967FE9B4ADDF02AB591397AFA)sysdiagnoseRecordKeys
{
  return ($320118C967FE9B4ADDF02AB591397AFA *)__copy_constructor_8_8_S_s0_s8_s16_S_s24_s32_s40_s48_S_s56_s64_s72_s80_s88_s96_S_s104_s112_s120_s128_s136_s144_s152_s160_s168_s176_s184_s192_S_s200_s208_S_s216_s224_s232_s240_s248_s256_S_s264_S_s272_s280_s288_s296_s304_s312_s320_S_s328_s336_s344_s352(retstr, (id *)kSysdiagnoseRecordKeys);
}

- (id)sysdiagnoseDictionaryRepresentation
{
  id v2 = +[DNDSModeAssertionStoreRecord recordForAssertionStore:self];
  id v3 = [v2 dictionaryWithKeys:kSysdiagnoseRecordKeys options:1];

  return v3;
}

+ (id)newWithPeaceSyncDictionaryRepresentation:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(DNDSModeAssertionStoreRecord);
  id v5 = objc_msgSend(v3, "bs_safeDictionaryForKey:", @"d");

  uint64_t v6 = objc_msgSend(v5, "bs_safeArrayForKey:", @"b");
  uint64_t v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_10);
  [(DNDSModeAssertionStoreRecord *)v4 setAssertions:v7];
  uint64_t v8 = objc_msgSend(v5, "bs_safeNumberForKey:", @"a");
  uint64_t v9 = objc_msgSend(v8, "dnds_dateValue");

  if (v9)
  {
    uint64_t v10 = +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:@"com.apple.donotdisturb.legacy-watch-toggle" deviceIdentifier:0];
    double v12 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v10 requestDate:v9 source:v11 reason:2];
    uint64_t v13 = +[DNDSModeAssertionInvalidationRequestRecord recordForInvalidationRequest:v12];
    v14 = (void *)v13;
    if (v13)
    {
      v18[0] = v13;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [(DNDSModeAssertionStoreRecord *)v4 setInvalidationRequests:v15];
    }
  }
  v16 = [(DNDSModeAssertionStoreRecord *)v4 object];

  return v16;
}

DNDSModeAssertionRecord *__85__DNDSModeAssertionStore_PeaceSyncMessage__newWithPeaceSyncDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    v16 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = objc_msgSend(v6, "bs_safeStringForKey:", @"f");
  uint64_t v8 = objc_msgSend(v6, "bs_safeNumberForKey:", @"l");
  int v9 = [v8 BOOLValue];

  if (v7)
  {
    uint64_t v10 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
    [(DNDSModeAssertionLifetimeRecord *)v10 setLifetimeType:v7];
    v11 = objc_msgSend(v6, "bs_safeStringForKey:", @"g");
    [(DNDSModeAssertionLifetimeRecord *)v10 setEventUniqueID:v11];

    double v12 = objc_msgSend(v6, "bs_safeNumberForKey:", @"h");
    [(DNDSModeAssertionLifetimeRecord *)v10 setOnlyDuringEvent:v12];

    uint64_t v13 = objc_msgSend(v6, "bs_safeNumberForKey:", @"k");
    [(DNDSModeAssertionLifetimeRecord *)v10 setOccurrenceDate:v13];

    v14 = objc_msgSend(v6, "bs_safeNumberForKey:", @"i");
    [(DNDSModeAssertionLifetimeRecord *)v10 setStartDate:v14];

    v15 = objc_msgSend(v6, "bs_safeNumberForKey:", @"j");
    [(DNDSModeAssertionLifetimeRecord *)v10 setEndDate:v15];
  }
  else
  {
    if (!v9)
    {
      uint64_t v10 = 0;
      goto LABEL_14;
    }
    uint64_t v10 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
    v17 = objc_msgSend(NSString, "dnds_stringForLifetimeType:", 4);
    [(DNDSModeAssertionLifetimeRecord *)v10 setLifetimeType:v17];

    [(DNDSModeAssertionLifetimeRecord *)v10 setScheduleIdentifier:*MEMORY[0x1E4F5F520]];
    v15 = objc_msgSend(NSString, "dnds_stringForScheduleLifetimeBehavior:", 1);
    [(DNDSModeAssertionLifetimeRecord *)v10 setBehavior:v15];
  }

LABEL_14:
  v18 = objc_alloc_init(DNDSModeAssertionDetailsRecord);
  v19 = objc_msgSend(v6, "bs_safeStringForKey:", @"d");
  [(DNDSModeAssertionDetailsRecord *)v18 setIdentifier:v19];

  v20 = objc_msgSend(v6, "bs_safeStringForKey:", @"e");
  [(DNDSModeAssertionDetailsRecord *)v18 setModeIdentifier:v20];

  [(DNDSModeAssertionDetailsRecord *)v18 setLifetime:v10];
  uint64_t v21 = objc_alloc_init(DNDSModeAssertionSourceRecord);
  v22 = objc_msgSend(v6, "bs_safeStringForKey:", @"c");
  [(DNDSModeAssertionSourceRecord *)v21 setClientIdentifier:v22];

  v16 = objc_alloc_init(DNDSModeAssertionRecord);
  v23 = objc_msgSend(v6, "bs_safeStringForKey:", @"a");
  [(DNDSModeAssertionRecord *)v16 setUUID:v23];

  v24 = objc_msgSend(v6, "bs_safeNumberForKey:", @"b");
  [(DNDSModeAssertionRecord *)v16 setStartDate:v24];

  [(DNDSModeAssertionRecord *)v16 setDetails:v18];
  [(DNDSModeAssertionRecord *)v16 setSource:v21];

LABEL_15:
  return v16;
}

+ (id)messageDateForPeaceSyncDictionaryRepresentation:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "bs_safeNumberForKey:", @"b");
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] distantPast];
  id v6 = };

  return v6;
}

- (id)peaceSyncDictionaryRepresentationWithDate:(id)a3 messageUUID:(id)a4 userRequestedClientIdentifierHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v32 = a4;
  id v8 = a5;
  v31 = +[DNDSModeAssertionStoreRecord recordForAssertionStore:self];
  int v9 = [v31 assertions];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __135__DNDSModeAssertionStore_PeaceSyncMessage__peaceSyncDictionaryRepresentationWithDate_messageUUID_userRequestedClientIdentifierHandler___block_invoke;
  v38[3] = &unk_1E6974138;
  id v10 = v8;
  id v39 = v10;
  v11 = objc_msgSend(v9, "bs_mapNoNulls:", v38);

  double v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v13 = [(DNDSModeAssertionStore *)self invalidationRequests];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v19 = [v18 predicate];
        uint64_t v20 = [v19 predicateType];

        if (!v20)
        {
          uint64_t v21 = [v18 requestDate];
          uint64_t v22 = [v12 laterDate:v21];

          double v12 = (void *)v22;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v15);
  }

  v23 = [MEMORY[0x1E4F1CA60] dictionary];
  [v12 timeIntervalSinceReferenceDate];
  v25 = [NSNumber numberWithDouble:ceil(v24)];
  [v23 setObject:v25 forKey:@"a"];

  objc_msgSend(v23, "bs_setSafeObject:forKey:", v11, @"b");
  v40[0] = @"a";
  v26 = [v32 UUIDString];
  v41[0] = v26;
  v40[1] = @"b";
  v27 = NSNumber;
  [v33 timeIntervalSinceReferenceDate];
  v28 = objc_msgSend(v27, "numberWithDouble:");
  v40[2] = @"d";
  v41[1] = v28;
  v41[2] = v23;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

  return v29;
}

id __135__DNDSModeAssertionStore_PeaceSyncMessage__peaceSyncDictionaryRepresentationWithDate_messageUUID_userRequestedClientIdentifierHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 UUID];
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v5, @"a");

  id v6 = [v3 startDate];
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v6, @"b");

  uint64_t v7 = [v3 details];
  id v8 = [v7 identifier];
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v8, @"d");

  int v9 = [v7 modeIdentifier];
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v9, @"e");

  id v10 = [v7 lifetime];
  v11 = [v10 lifetimeType];
  double v12 = objc_msgSend(NSString, "dnds_stringForLifetimeType:", 4);
  char v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"l"];
  }
  else
  {
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v11, @"f");
    uint64_t v14 = [v10 eventUniqueID];
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v14, @"g");

    uint64_t v15 = [v10 onlyDuringEvent];
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v15, @"h");

    uint64_t v16 = [v10 occurrenceDate];
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v16, @"k");

    v17 = [v10 startDate];
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v17, @"i");

    v18 = [v10 endDate];
    objc_msgSend(v4, "bs_setSafeObject:forKey:", v18, @"j");
  }
  v19 = [v3 source];
  uint64_t v20 = [v19 clientIdentifier];
  objc_msgSend(v4, "bs_setSafeObject:forKey:", v20, @"c");
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"l"];
  }

  return v4;
}

- (DNDSModeAssertionStore)init
{
  return (DNDSModeAssertionStore *)[(DNDSModeAssertionStore *)self _initWithStore:0];
}

- (id)_initWithStore:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDSModeAssertionStore;
  id v5 = [(DNDSModeAssertionStore *)&v20 init];
  if (v5)
  {
    id v6 = [v4 assertions];
    uint64_t v7 = [v6 copy];
    id v8 = (void *)v7;
    int v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      id v10 = (void *)v7;
    }
    else {
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_assertions, v10);

    v11 = [v4 invalidations];
    uint64_t v12 = [v11 copy];
    char v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (void *)v12;
    }
    else {
      uint64_t v14 = v9;
    }
    objc_storeStrong((id *)&v5->_invalidations, v14);

    uint64_t v15 = [v4 invalidationRequests];
    uint64_t v16 = [v15 copy];
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = v9;
    }
    objc_storeStrong((id *)&v5->_invalidationRequests, v18);
  }
  return v5;
}

- (unint64_t)hash
{
  id v3 = [(DNDSModeAssertionStore *)self assertions];
  uint64_t v4 = [v3 hash];
  id v5 = [(DNDSModeAssertionStore *)self invalidations];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(DNDSModeAssertionStore *)self invalidationRequests];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (DNDSModeAssertionStore *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      uint64_t v7 = [(DNDSModeAssertionStore *)self assertions];
      unint64_t v8 = [(DNDSModeAssertionStore *)v6 assertions];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDSModeAssertionStore *)self assertions];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_37;
        }
        id v10 = (void *)v9;
        v11 = [(DNDSModeAssertionStore *)v6 assertions];
        if (!v11)
        {
          char v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v12 = [(DNDSModeAssertionStore *)self assertions];
        id v3 = [(DNDSModeAssertionStore *)v6 assertions];
        if (![v12 isEqual:v3])
        {
          char v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        long long v36 = v3;
        long long v37 = v12;
        v38 = v11;
        id v39 = v10;
      }
      uint64_t v14 = [(DNDSModeAssertionStore *)self invalidations];
      uint64_t v15 = [(DNDSModeAssertionStore *)v6 invalidations];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSModeAssertionStore *)self invalidations];
        if (v16)
        {
          v17 = (void *)v16;
          v18 = [(DNDSModeAssertionStore *)v6 invalidations];
          if (v18)
          {
            long long v35 = v14;
            v19 = [(DNDSModeAssertionStore *)self invalidations];
            id v3 = [(DNDSModeAssertionStore *)v6 invalidations];
            if ([v19 isEqual:v3])
            {
              v31 = v19;
              id v32 = v18;
              id v33 = v17;
LABEL_17:
              objc_super v20 = [(DNDSModeAssertionStore *)self invalidationRequests];
              uint64_t v21 = [(DNDSModeAssertionStore *)v6 invalidationRequests];
              if (v20 == (void *)v21)
              {

                char v13 = 1;
                v27 = v35;
              }
              else
              {
                uint64_t v22 = (void *)v21;
                long long v34 = v3;
                uint64_t v23 = [(DNDSModeAssertionStore *)self invalidationRequests];
                if (v23)
                {
                  double v24 = (void *)v23;
                  v25 = [(DNDSModeAssertionStore *)v6 invalidationRequests];
                  if (v25)
                  {
                    v30 = v25;
                    v29 = [(DNDSModeAssertionStore *)self invalidationRequests];
                    v26 = [(DNDSModeAssertionStore *)v6 invalidationRequests];
                    char v13 = [v29 isEqual:v26];

                    v25 = v30;
                  }
                  else
                  {
                    char v13 = 0;
                  }
                }
                else
                {

                  char v13 = 0;
                }
                id v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {
              }
LABEL_34:
              v11 = v38;
              id v10 = v39;
              id v3 = v36;
              uint64_t v12 = v37;
              if (v7 != v8) {
                goto LABEL_35;
              }
LABEL_37:

              goto LABEL_38;
            }

            uint64_t v14 = v35;
          }
        }
        char v13 = 0;
        goto LABEL_34;
      }
      long long v35 = v14;
      goto LABEL_17;
    }
    char v13 = 0;
  }
LABEL_38:

  return v13;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DNDSModeAssertionStore *)self assertions];
  uint64_t v6 = [(DNDSModeAssertionStore *)self invalidations];
  uint64_t v7 = [(DNDSModeAssertionStore *)self invalidationRequests];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; assertions: %@; invalidations: %@; invalidationRequests: %@>",
    v4,
    self,
    v5,
    v6,
  unint64_t v8 = v7);

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableModeAssertionStore alloc];
  return [(DNDSModeAssertionStore *)v4 _initWithStore:self];
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (NSArray)invalidations
{
  return self->_invalidations;
}

- (NSArray)invalidationRequests
{
  return self->_invalidationRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationRequests, 0);
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (id)lastUpdateDate
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v4 = [(DNDSModeAssertionStore *)self assertions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v3;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v34 + 1) + 8 * v8) startDate];
        id v3 = [v9 laterDate:v10];

        ++v8;
        uint64_t v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v11 = [(DNDSModeAssertionStore *)self invalidations];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      uint64_t v16 = v3;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = [*(id *)(*((void *)&v30 + 1) + 8 * v15) invalidationDate];
        id v3 = [v16 laterDate:v17];

        ++v15;
        uint64_t v16 = v3;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v13);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v18 = [(DNDSModeAssertionStore *)self invalidationRequests];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      uint64_t v23 = v3;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        double v24 = [*(id *)(*((void *)&v26 + 1) + 8 * v22) requestDate];
        id v3 = [v23 laterDate:v24];

        ++v22;
        uint64_t v23 = v3;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  return v3;
}

@end