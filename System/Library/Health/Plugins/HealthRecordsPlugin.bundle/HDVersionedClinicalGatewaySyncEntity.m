@interface HDVersionedClinicalGatewaySyncEntity
+ (BOOL)_shouldInsertReceivedCodableGateway:(id)a3 profile:(id)a4;
+ (id)_syncObjectsGenerationPredicate;
+ (id)syncEntityIdentifier;
@end

@implementation HDVersionedClinicalGatewaySyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:7];
}

+ (id)_syncObjectsGenerationPredicate
{
  return +[HDClinicalGatewayEntity _predicateForGatewaysWithAccounts];
}

+ (BOOL)_shouldInsertReceivedCodableGateway:(id)a3 profile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 daemon];
  v9 = [v8 ontologyConfigurationProvider];

  if (!v9)
  {
    _HKInitializeLogging();
    v10 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AFFCC((uint64_t)a1, (uint64_t)v7, v10);
    }
  }
  v11 = [v6 countryCode];
  v12 = [v11 uppercaseString];
  unsigned __int8 v13 = [v9 isCountryCodeSupported:v12];

  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    v18 = (void *)HKLogHealthRecords;
    BOOL v17 = 0;
    if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v19 = v18;
    v20 = [v6 countryCode];
    v21 = HKSensitiveLogItem();
    int v25 = 138543874;
    id v26 = a1;
    __int16 v27 = 2114;
    v28 = v20;
    __int16 v29 = 2114;
    v30 = v21;
    v22 = "%{public}@ dropping incoming gateway because country \"%{public}@\" is not supported: %{public}@";
LABEL_11:
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0x20u);

    BOOL v17 = 0;
    goto LABEL_12;
  }
  v14 = [v7 healthRecordsExtension];
  v15 = [v6 FHIRVersionString];
  unsigned __int8 v16 = [v14 isSupportedFHIRVersionString:v15];

  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    v23 = (void *)HKLogHealthRecords;
    BOOL v17 = 0;
    if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v19 = v23;
    v20 = [v6 FHIRVersionString];
    v21 = HKSensitiveLogItem();
    int v25 = 138543874;
    id v26 = a1;
    __int16 v27 = 2114;
    v28 = v20;
    __int16 v29 = 2114;
    v30 = v21;
    v22 = "%{public}@ dropping incoming gateway because FHIR version \"%{public}@\" is not supported: %{public}@";
    goto LABEL_11;
  }
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

@end