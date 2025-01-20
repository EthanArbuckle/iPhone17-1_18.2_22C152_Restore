@interface HDMedicalRecordsStoreServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)_medicalRecordForClinicalRecordWithUUID:(id)a3 privateSourceBundleIdentifiersByPublic:(id)a4 error:(id *)a5;
- (id)_privateSourceBundleIdentifiersByPublicWithError:(id *)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchMedicalRecordsForClinicalRecordsUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HDMedicalRecordsStoreServer

- (void)remote_fetchMedicalRecordsForClinicalRecordsUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = [(HDMedicalRecordsStoreServer *)self profile];
  v10 = [v9 database];
  id v20 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_234B8;
  v17[3] = &unk_112648;
  v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  id v12 = v8;
  id v19 = v12;
  unsigned int v13 = +[HDClinicalRecordEntity performReadTransactionWithHealthDatabase:v10 error:&v20 block:v17];
  id v14 = v20;

  if (v13)
  {
    id v15 = v12;
    id v16 = 0;
  }
  else
  {
    id v15 = 0;
    id v16 = v14;
  }
  v7[2](v7, v15, v16);
}

- (id)_medicalRecordForClinicalRecordWithUUID:(id)a3 privateSourceBundleIdentifiersByPublic:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(HDMedicalRecordsStoreServer *)self profile];
  id v11 = +[HDClinicalRecordEntity objectWithUUID:v9 encodingOptions:0 profile:v10 error:a5];

  if (!v11)
  {
    v26 = 0;
    goto LABEL_11;
  }
  id v12 = [(HDMedicalRecordsStoreServer *)self client];
  unsigned int v13 = [v12 authorizationOracle];
  id v14 = [v11 sampleType];
  id v15 = [v13 readAuthorizationStatusForType:v14 error:a5];

  if (v15)
  {
    if ([v15 isAuthorizationDetermined])
    {
      if ([v15 canRead])
      {
        id v16 = [v11 sourceRevision];
        v17 = [v16 source];
        id v18 = [v17 bundleIdentifier];

        id v19 = [v8 objectForKeyedSubscript:v18];
        if (v19)
        {
          id v20 = [v11 FHIRResource];
          id v21 = objc_alloc((Class)HKFHIRIdentifier);
          v22 = [v20 resourceType];
          [v20 identifier];
          v23 = v29 = v18;
          id v24 = [v21 initWithResourceType:v22 identifier:v23];

          v25 = [(HDMedicalRecordsStoreServer *)self profile];
          id v18 = v29;
          v26 = +[HDMedicalRecordEntity medicalRecordWithSourceBundleIdentifier:v19 FHIRIdentifier:v24 profile:v25 error:a5];
        }
        else
        {
          _HKInitializeLogging();
          v28 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
            sub_AC264((uint64_t)v18, v28);
          }
          v26 = 0;
        }

        goto LABEL_10;
      }
    }
    else
    {
      +[NSError hk_assignError:a5 code:5 description:@"Authorization not determined"];
    }
  }
  v26 = 0;
LABEL_10:

LABEL_11:

  return v26;
}

- (id)_privateSourceBundleIdentifiersByPublicWithError:(id *)a3
{
  v4 = [(HDMedicalRecordsStoreServer *)self profile];
  v5 = [v4 database];
  id v6 = +[HDClinicalAccountEntity allAccountsInHealthDatabase:v5 error:a3];

  if (v6)
  {
    v7 = objc_msgSend(v6, "hk_mapToDictionary:", &stru_1127F0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = objc_msgSend(a4, "entitlements", a3);
  uint64_t v7 = HKPrivateHealthKitAccessIdentifierHealthRecordsPrivate;
  unsigned __int8 v8 = [v6 hasPrivateAccessEntitlementWithIdentifier:HKPrivateHealthKitAccessIdentifierHealthRecordsPrivate];

  if ((v8 & 1) == 0) {
    +[NSError hk_assignError:a5, 4, @"Missing %@ entitlement.", v7 code format];
  }
  return v8;
}

- (id)exportedInterface
{
  return (id)_HKMedicalRecordsStoreServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKMedicalRecordsStoreClientInterface(self, a2);
}

+ (id)taskIdentifier
{
  return +[HKMedicalRecordsStore taskIdentifier];
}

+ (id)requiredEntitlements
{
  uint64_t v4 = HKHealthKitEntitlement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

@end