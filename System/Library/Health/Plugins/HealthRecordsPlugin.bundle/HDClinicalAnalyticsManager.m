@interface HDClinicalAnalyticsManager
+ (Class)_medicalRecordEntityClassForDataTypeCode:(int64_t)a3;
+ (id)_predicateForContentAnalyticMedicalRecordTypes;
- (BOOL)_lock_isImproveHealthRecordsDataSubmissionAllowedWithTransaction:(id)a3;
- (BOOL)_lock_userHasAgreedToHealthRecordsDataSubmission;
- (BOOL)currentDeviceSupportsImproveHealthRecordsDataSubmissionOption;
- (BOOL)currentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithTransaction:(id)a3;
- (BOOL)isImproveHealthRecordsDataSubmissionAllowed;
- (BOOL)isImproveHealthRecordsDataSubmissionAllowedWithTransaction:(id)a3;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (BOOL)shouldPromptForImproveHealthRecordsDataSubmission;
- (BOOL)userHasAgreedToHealthRecordsDataSubmission;
- (HDClinicalAnalyticsManager)initWithProfileExtension:(id)a3;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDProfile)profile;
- (NSNumber)improveHealthRecordsAgreementVersionOnDisk;
- (NSSet)collectionEnabledCountryCodes;
- (id)_clinicalAnalyticsKeyValueDomain;
- (id)_lock_readImproveHealthRecordsAgreementVersionOnDisk;
- (id)_medicalRecordForObjectID:(int64_t)a3 dataTypeCode:(int64_t)a4 error:(id *)a5;
- (id)_queue_fetchRecordsForContentAnalyticsWithStartAnchor:(int64_t)a3 limitCount:(int64_t)a4 finalAnchor:(int64_t *)a5 error:(id *)a6;
- (int64_t)_lock_acceptedVersionForImproveHealthRecords;
- (int64_t)acceptedVersionForImproveHealthRecords;
- (void)_queue_didTriggerClinicalAnalyticsForReason:(int64_t)a3 success:(BOOL)a4 error:(id)a5;
- (void)_queue_triggerClinicalContentAnalyticsWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_submitPayload:(id)a3 forEvent:(id)a4 usingCoordinator:(id)a5;
- (void)overrideIsImproveHealthRecordsDataSubmissionAllowed:(BOOL)a3;
- (void)overrideIsImproveHealthRecordsDataSubmissionVersionAccepted:(id)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)resetClinicalContentAnalyticsAnchorsWithCompletion:(id)a3;
- (void)setImproveHealthRecordsAgreementVersionOnDisk:(id)a3;
- (void)submitClinicalIngestionAnalyticsFromAccumulator:(id)a3 completion:(id)a4;
- (void)triggerClinicalContentAnalyticsForReason:(int64_t)a3 options:(unint64_t)a4 completion:(id)a5;
@end

@implementation HDClinicalAnalyticsManager

- (HDClinicalAnalyticsManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDClinicalAnalyticsManager;
  v5 = [(HDClinicalAnalyticsManager *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    objc_storeWeak((id *)&v6->_profile, v7);

    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v6->_statusLock._os_unfair_lock_opaque = 0;
    v10 = [v4 profile];
    v11 = [v10 daemon];
    v12 = [v11 ontologyConfigurationProvider];
    v13 = [v12 improveHealthRecordsGatedAnalyticsEnabledCountryCodes];
    v14 = (NSSet *)[v13 copy];
    collectionEnabledCountryCodes = v6->_collectionEnabledCountryCodes;
    v6->_collectionEnabledCountryCodes = v14;

    id v16 = objc_alloc((Class)HDPeriodicActivity);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v18 = (HDPeriodicActivity *)[v16 initWithProfile:WeakRetained name:@"com.apple.healthd.healthrecords-analytics-activity" interval:v6 delegate:HKLogHealthRecords loggingCategory:(double)XPC_ACTIVITY_INTERVAL_7_DAYS];
    periodicActivity = v6->_periodicActivity;
    v6->_periodicActivity = v18;
  }
  return v6;
}

- (BOOL)userHasAgreedToHealthRecordsDataSubmission
{
  v2 = self;
  p_statusLock = &self->_statusLock;
  os_unfair_lock_assert_not_owner(&self->_statusLock);
  os_unfair_lock_lock(p_statusLock);
  LOBYTE(v2) = [(HDClinicalAnalyticsManager *)v2 _lock_userHasAgreedToHealthRecordsDataSubmission];
  os_unfair_lock_unlock(p_statusLock);
  return (char)v2;
}

- (BOOL)_lock_userHasAgreedToHealthRecordsDataSubmission
{
  os_unfair_lock_assert_owner(&self->_statusLock);
  v3 = [(HDClinicalAnalyticsManager *)self _lock_readImproveHealthRecordsAgreementVersionOnDisk];
  overriddenSubmitsAnalytics = self->_overriddenSubmitsAnalytics;
  if (overriddenSubmitsAnalytics)
  {
    unsigned __int8 v5 = [(NSNumber *)overriddenSubmitsAnalytics isEqual:v3];
  }
  else
  {
    id v6 = [(HDClinicalAnalyticsManager *)self _lock_acceptedVersionForImproveHealthRecords];
    if (v3) {
      unsigned __int8 v5 = v6 == [v3 integerValue];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isImproveHealthRecordsDataSubmissionAllowed
{
  return [(HDClinicalAnalyticsManager *)self isImproveHealthRecordsDataSubmissionAllowedWithTransaction:0];
}

- (BOOL)isImproveHealthRecordsDataSubmissionAllowedWithTransaction:(id)a3
{
  v3 = self;
  p_statusLock = &self->_statusLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_statusLock);
  os_unfair_lock_lock(p_statusLock);
  LOBYTE(v3) = [(HDClinicalAnalyticsManager *)v3 _lock_isImproveHealthRecordsDataSubmissionAllowedWithTransaction:v5];

  os_unfair_lock_unlock(p_statusLock);
  return (char)v3;
}

- (BOOL)_lock_isImproveHealthRecordsDataSubmissionAllowedWithTransaction:(id)a3
{
  p_statusLock = &self->_statusLock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_statusLock);
  LODWORD(p_statusLock) = [(HDClinicalAnalyticsManager *)self currentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithTransaction:v5];

  if (!p_statusLock) {
    return 0;
  }

  return [(HDClinicalAnalyticsManager *)self _lock_userHasAgreedToHealthRecordsDataSubmission];
}

- (id)_lock_readImproveHealthRecordsAgreementVersionOnDisk
{
  os_unfair_lock_assert_owner(&self->_statusLock);
  p_improveHealthRecordsAgreementVersionOnDisk = &self->_improveHealthRecordsAgreementVersionOnDisk;
  improveHealthRecordsAgreementVersionOnDisk = self->_improveHealthRecordsAgreementVersionOnDisk;
  if (improveHealthRecordsAgreementVersionOnDisk)
  {
    id v5 = improveHealthRecordsAgreementVersionOnDisk;
  }
  else
  {
    uint64_t v6 = HKCurrentOptInVersionOnDiskForOnBoardingBundle();
    if (v6 == HKImproveHealthRecordsDataSubmissionNotDetermined)
    {
      _HKInitializeLogging();
      v7 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AADA8(v7, self);
      }
      id v5 = 0;
    }
    else
    {
      id v5 = +[NSNumber numberWithInteger:v6];
      objc_storeStrong((id *)p_improveHealthRecordsAgreementVersionOnDisk, v5);
    }
  }

  return v5;
}

- (int64_t)acceptedVersionForImproveHealthRecords
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_assert_not_owner(&self->_statusLock);
  os_unfair_lock_lock(p_statusLock);
  int64_t v4 = [(HDClinicalAnalyticsManager *)self _lock_acceptedVersionForImproveHealthRecords];
  os_unfair_lock_unlock(p_statusLock);
  return v4;
}

- (int64_t)_lock_acceptedVersionForImproveHealthRecords
{
  os_unfair_lock_assert_owner(&self->_statusLock);
  overriddenSubmitsAnalytics = self->_overriddenSubmitsAnalytics;
  if (overriddenSubmitsAnalytics)
  {
    return [(NSNumber *)overriddenSubmitsAnalytics integerValue];
  }
  else
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    uint64_t v6 = [v5 objectForKey:kHKSettingsUserDefaultClinicalDataCollectionOptInKey];

    if (v6)
    {
      objc_opt_class();
      v7 = HKSafeObject();
      id v8 = [v7 integerValue];
    }
    else
    {
      id v8 = (id)HKImproveHealthRecordsDataSubmissionNotDetermined;
    }

    return (int64_t)v8;
  }
}

- (BOOL)shouldPromptForImproveHealthRecordsDataSubmission
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_assert_not_owner(&self->_statusLock);
  if (![(HDClinicalAnalyticsManager *)self currentDeviceSupportsImproveHealthRecordsDataSubmissionOption])return 0; {
  os_unfair_lock_lock(p_statusLock);
  }
  int64_t v4 = [(HDClinicalAnalyticsManager *)self _lock_acceptedVersionForImproveHealthRecords];
  if (v4 == HKImproveHealthRecordsDataSubmissionNotAllowed)
  {
    char v5 = 0;
  }
  else
  {
    id v6 = (id)v4;
    if (v4 == HKImproveHealthRecordsDataSubmissionNotDetermined)
    {
      char v5 = 1;
    }
    else
    {
      v7 = [(HDClinicalAnalyticsManager *)self _lock_readImproveHealthRecordsAgreementVersionOnDisk];
      char v5 = [v7 integerValue] != v6;
    }
  }
  os_unfair_lock_unlock(p_statusLock);
  return v5;
}

- (BOOL)currentDeviceSupportsImproveHealthRecordsDataSubmissionOption
{
  return [(HDClinicalAnalyticsManager *)self currentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithTransaction:0];
}

- (BOOL)currentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithTransaction:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v6 = WeakRetained;
  if (v4)
  {
    uint64_t v20 = 0;
    v7 = (id *)&v20;
    id v8 = (char *)[WeakRetained hasGatewayBackedAccountsWithTransaction:v4 error:&v20];
  }
  else
  {
    uint64_t v19 = 0;
    v7 = (id *)&v19;
    id v8 = (char *)[WeakRetained hasGatewayBackedAccountsWithError:&v19];
  }
  v9 = v8;
  id v10 = *v7;

  if (v9 == (unsigned char *)&dword_0 + 2) {
    goto LABEL_11;
  }
  if (!v9)
  {
    _HKInitializeLogging();
    v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AAE40(v11, self, (uint64_t)v10);
    }
    goto LABEL_11;
  }
  v12 = +[MCProfileConnection sharedConnection];
  unsigned int v13 = [v12 isDiagnosticSubmissionAllowed];

  if (!v13)
  {
LABEL_11:
    LOBYTE(v17) = 0;
    goto LABEL_12;
  }
  v14 = [(HDClinicalAnalyticsManager *)self profile];
  v15 = [v14 daemon];
  id v16 = [v15 behavior];

  if ([v16 isRealityDevice]) {
    LOBYTE(v17) = 0;
  }
  else {
    unsigned int v17 = [v16 isRunningStoreDemoMode] ^ 1;
  }

LABEL_12:
  return v17;
}

- (void)overrideIsImproveHealthRecordsDataSubmissionAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  if (v3) {
    [(HDClinicalAnalyticsManager *)self _lock_readImproveHealthRecordsAgreementVersionOnDisk];
  }
  else {
  id v6 = +[NSNumber numberWithInteger:HKImproveHealthRecordsDataSubmissionNotAllowed];
  }
  overriddenSubmitsAnalytics = self->_overriddenSubmitsAnalytics;
  self->_overriddenSubmitsAnalytics = v6;

  os_unfair_lock_unlock(p_statusLock);
}

- (void)overrideIsImproveHealthRecordsDataSubmissionVersionAccepted:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_statusLock);
  overriddenSubmitsAnalytics = self->_overriddenSubmitsAnalytics;
  self->_overriddenSubmitsAnalytics = v4;

  os_unfair_lock_unlock(&self->_statusLock);
}

- (void)triggerClinicalContentAnalyticsForReason:(int64_t)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_135B8;
  v11[3] = &unk_111E68;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)resetClinicalContentAnalyticsAnchorsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13928;
  v7[3] = &unk_111E90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)submitClinicalIngestionAnalyticsFromAccumulator:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = objc_opt_class();
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: checking to submit ingestion analytics", buf, 0xCu);
  }
  if ([(HDClinicalAnalyticsManager *)self isImproveHealthRecordsDataSubmissionAllowed])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v11 = [WeakRetained daemon];
    id v12 = [v11 analyticsSubmissionCoordinator];

    _HKInitializeLogging();
    int64_t v13 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = v13;
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: submitting ingestion analytics", buf, 0xCu);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_13D5C;
    v23[3] = &unk_111EB8;
    v23[4] = self;
    id v24 = v12;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_13E94;
    v21[3] = &unk_111EE0;
    v21[4] = self;
    id v22 = v7;
    id v16 = v12;
    [v6 enumerateForCoreAnalyticsAndResetWithBlock:v23 completion:v21];
  }
  else
  {
    _HKInitializeLogging();
    unsigned int v17 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      v28 = v20;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: not submitting ingestion analytics: %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_submitPayload:(id)a3 forEvent:(id)a4 usingCoordinator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  _HKInitializeLogging();
  id v10 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = objc_opt_class();
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%{public}@: submitting payload", buf, 0xCu);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_140E0;
  v13[3] = &unk_111F08;
  id v14 = v7;
  id v12 = v7;
  [v9 sendEvent:v8 block:v13];
}

- (void)_queue_triggerClinicalContentAnalyticsWithOptions:(unint64_t)a3 completion:(id)a4
{
  objc_super v21 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v5 = [(HDClinicalAnalyticsManager *)self profile];
  id v6 = [v5 database];
  unsigned __int8 v7 = [v6 isProtectedDataAvailable];

  if (v7)
  {
    id v8 = [HDClinicalContentAnalyticsAccumulator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
    id v22 = [(HDClinicalContentAnalyticsAccumulator *)v8 initWithProfileExtension:WeakRetained];

    if ([(HDClinicalAnalyticsManager *)self isImproveHealthRecordsDataSubmissionAllowed])
    {
      id v10 = [(HDClinicalAnalyticsManager *)self _clinicalAnalyticsKeyValueDomain];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v24 = 0x2020000000;
      char v25 = 1;
      while (1)
      {
        id v11 = v10;
        id v12 = v22;
        char v13 = HKWithAutoreleasePool();
        id v14 = 0;
        if ((v13 & 1) == 0) {
          break;
        }

        if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
        {
          v21[2](v21, v12, 0);
          goto LABEL_14;
        }
      }
      ((void (**)(id, id, id))v21)[2](v21, 0, v14);

LABEL_14:
      _Block_object_dispose(&buf, 8);

      id v22 = v12;
    }
    else
    {
      _HKInitializeLogging();
      v18 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = v18;
        uint64_t v20 = [(HDClinicalAnalyticsManager *)self debugDescription];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "%{public}@ content analytics collection is not enabled by the user", (uint8_t *)&buf, 0xCu);
      }
      v21[2](v21, v22, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v15 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v15;
      unsigned int v17 = [(HDClinicalAnalyticsManager *)self debugDescription];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%{public}@: cannot begin content analytics collection without access to protected data", (uint8_t *)&buf, 0xCu);
    }
    id v22 = +[NSError hk_protectedDataInaccessibilityError];
    ((void (**)(id, id, HDClinicalContentAnalyticsAccumulator *))v21)[2](v21, 0, v22);
  }
}

- (id)_queue_fetchRecordsForContentAnalyticsWithStartAnchor:(int64_t)a3 limitCount:(int64_t)a4 finalAnchor:(int64_t *)a5 error:(id *)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = [(id)objc_opt_class() _predicateForContentAnalyticMedicalRecordTypes];
  uint64_t v11 = HDSQLEntityPropertyPersistentID;
  id v12 = +[NSNumber numberWithLongLong:a3];
  char v13 = +[HDSQLiteComparisonPredicate predicateWithProperty:v11 greaterThanValue:v12];

  v23 = (void *)v10;
  id v14 = +[HDSQLitePredicate compoundPredicateWithPredicate:v13 otherPredicate:v10];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int64_t v34 = a3;
  uint64_t v16 = [(HDClinicalAnalyticsManager *)self profile];
  unsigned int v17 = [v16 database];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_14C3C;
  v25[3] = &unk_111FA8;
  id v18 = v14;
  v29 = &v31;
  int64_t v30 = a4;
  id v26 = v18;
  __int16 v27 = self;
  id v19 = v15;
  id v28 = v19;
  unsigned int v20 = +[HDMedicalRecordEntity performReadTransactionWithHealthDatabase:v17 error:a6 block:v25];

  if (a5) {
    *a5 = v32[3];
  }
  if (v20) {
    id v21 = [v19 copy];
  }
  else {
    id v21 = 0;
  }

  _Block_object_dispose(&v31, 8);

  return v21;
}

+ (id)_predicateForContentAnalyticMedicalRecordTypes
{
  v2 = +[HKSampleType medicalRecordTypesWithOptions:1];
  BOOL v3 = +[NSSet setWithArray:v2];

  id v4 = HDSampleEntityPredicateForDataTypes();

  return v4;
}

+ (Class)_medicalRecordEntityClassForDataTypeCode:(int64_t)a3
{
  BOOL v3 = +[HKMedicalType dataTypeWithCode:a3];
  id v4 = objc_msgSend(objc_msgSend(v3, "dataObjectClass"), "hd_dataEntityClass");

  return (Class)v4;
}

- (id)_medicalRecordForObjectID:(int64_t)a3 dataTypeCode:(int64_t)a4 error:(id *)a5
{
  id v9 = [(id)objc_opt_class() _medicalRecordEntityClassForDataTypeCode:a4];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = +[NSNumber numberWithLongLong:a3];
    id v12 = [(HDClinicalAnalyticsManager *)self profile];
    char v13 = [v10 objectWithID:v11 encodingOptions:0 profile:v12 error:a5];
  }
  else
  {
    +[NSError hk_assignError:a5, 3, @"Data Typde Code (%ld) cannot be mapped to a medical record entity class", a4 code format];
    char v13 = 0;
  }

  return v13;
}

- (id)_clinicalAnalyticsKeyValueDomain
{
  id v3 = objc_alloc((Class)HDKeyValueDomain);
  id v4 = [(HDClinicalAnalyticsManager *)self profile];
  id v5 = [v3 initWithCategory:0 domainName:@"healthrecords-analytics" profile:v4];

  return v5;
}

- (void)_queue_didTriggerClinicalAnalyticsForReason:(int64_t)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3)
  {
    if (v5)
    {
      double v8 = (double)XPC_ACTIVITY_INTERVAL_7_DAYS;
      uint64_t v9 = 0;
      id v10 = 0;
    }
    else
    {
      double v8 = (double)XPC_ACTIVITY_INTERVAL_1_MIN;
      uint64_t v9 = 2;
      id v10 = v11;
    }
    [(HDPeriodicActivity *)self->_periodicActivity didPerformActivityWithResult:v9 minimumRetryInterval:0 activityStartDate:v10 error:v8];
  }
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1557C;
  v6[3] = &unk_111CA8;
  id v7 = a4;
  id v5 = v7;
  [(HDClinicalAnalyticsManager *)self triggerClinicalContentAnalyticsForReason:0 options:0 completion:v6];
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (NSNumber)improveHealthRecordsAgreementVersionOnDisk
{
  return self->_improveHealthRecordsAgreementVersionOnDisk;
}

- (void)setImproveHealthRecordsAgreementVersionOnDisk:(id)a3
{
}

- (NSSet)collectionEnabledCountryCodes
{
  return self->_collectionEnabledCountryCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionEnabledCountryCodes, 0);
  objc_storeStrong((id *)&self->_improveHealthRecordsAgreementVersionOnDisk, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_profileExtension);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);

  objc_storeStrong((id *)&self->_overriddenSubmitsAnalytics, 0);
}

@end