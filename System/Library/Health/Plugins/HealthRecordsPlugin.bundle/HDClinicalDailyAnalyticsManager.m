@interface HDClinicalDailyAnalyticsManager
+ (id)_queryDescriptorForType:(id)a3 predicate:(id)a4;
+ (id)_recordAnalyticsDescriptions;
- (BOOL)_submitHealthRecordsDailyAnalyticsWithCoordinator:(id)a3 error:(id *)a4;
- (HDClinicalDailyAnalyticsManager)initWithProfileExtension:(id)a3;
- (id)_countClinicalNoteAttachmentsInDatabase:(id)a3 error:(id *)a4;
- (id)_countWithRecordCategoryAnalyticsDescription:(id)a3 timeScope:(int64_t)a4 nowDate:(id)a5 transaction:(id)a6 error:(id *)a7;
- (id)_fetchAccountAnalyticsCollectsClinicalOptInData:(BOOL)a3 collectsImproveHealthAndActivityData:(BOOL)a4 error:(id *)a5;
- (id)_fetchAnalyticsDictionaryWithError:(id *)a3;
- (id)_fetchDeviceContextAnalyticsWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)_fetchRecordAndUserDomainConceptAnalyticsHealthDataSubmissionAllowed:(BOOL)a3 collectsClinicalOptInData:(BOOL)a4 transaction:(id)a5 error:(id *)a6;
- (id)_recordCategoryAnalyticsWithDescription:(id)a3 nowDate:(id)a4 transaction:(id)a5 error:(id *)a6;
- (id)_recordCountAnalyticsWithNowDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (int64_t)_hasMedicalRecordsOfType:(id)a3 medicalRecordEntitySubclass:(Class)a4 predicate:(id)a5 database:(id)a6 error:(id *)a7;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
- (void)unitTesting_overrideMCProfileConnection:(id)a3;
@end

@implementation HDClinicalDailyAnalyticsManager

- (HDClinicalDailyAnalyticsManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDClinicalDailyAnalyticsManager;
  v5 = [(HDClinicalDailyAnalyticsManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    [v7 registerProfileReadyObserver:v6 queue:0];

    profileConnectionOverride = v6->_profileConnectionOverride;
    v6->_profileConnectionOverride = 0;
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v4 = [WeakRetained profile];
  v5 = [v4 daemon];
  v6 = [v5 analyticsSubmissionCoordinator];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)HDClinicalDailyAnalyticsManager;
  [(HDClinicalDailyAnalyticsManager *)&v7 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v4 = [WeakRetained profile];
  v5 = [v4 daemon];
  v6 = [v5 analyticsSubmissionCoordinator];
  [v6 addObserver:self queue:0];
}

- (BOOL)_submitHealthRecordsDailyAnalyticsWithCoordinator:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isEventUsed:@"com.apple.HealthRecords.DailyAnalytics"])
  {
    objc_super v7 = [(HDClinicalDailyAnalyticsManager *)self _fetchAnalyticsDictionaryWithError:a4];
    v8 = v7;
    char v9 = v7 != 0;
    if (v7)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_A5EBC;
      v11[3] = &unk_111F08;
      id v12 = v7;
      [v6 sendEvent:@"com.apple.HealthRecords.DailyAnalytics" block:v11];
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)_fetchAnalyticsDictionaryWithError:(id *)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_A6034;
  v16 = sub_A6044;
  id v17 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v6 = [WeakRetained profile];
  objc_super v7 = [v6 database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_A604C;
  v11[3] = &unk_1133A8;
  void v11[4] = self;
  v11[5] = &v12;
  LODWORD(a3) = +[HDMedicalRecordEntity performReadTransactionWithHealthDatabase:v7 error:a3 block:v11];

  if (a3) {
    v8 = (void *)v13[5];
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)_fetchAccountAnalyticsCollectsClinicalOptInData:(BOOL)a3 collectsImproveHealthAndActivityData:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  p_profileExtension = &self->_profileExtension;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  objc_super v10 = [WeakRetained accountManager];
  v11 = [v10 allAccountsWithError:a5];

  if (v11)
  {
    location = (id *)p_profileExtension;
    unint64_t v58 = __PAIR64__(v7, v6);
    v60 = v11;
    id v61 = objc_alloc_init((Class)NSMutableSet);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v11;
    id v12 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v64 = 0;
      int64_t v65 = 0x8000000000000001;
      uint64_t v63 = *(void *)v69;
      uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v67 = 0;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      int64_t v15 = 0x8000000000000001;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v69 != v63) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v19 = +[NSCalendar currentCalendar];
          v20 = [v18 creationDate];
          v21 = +[NSDate date];
          v22 = [v19 components:0x2000 fromDate:v20 toDate:v21 options:0];

          id v23 = [v22 weekOfYear];
          int64_t v24 = (int64_t)v23;
          if ((uint64_t)v23 < v16) {
            uint64_t v16 = (uint64_t)v23;
          }
          if ([v18 isUserEnabled])
          {
            ++v67;
            v25 = [v18 signedClinicalDataIssuer];

            if (v24 <= v15) {
              int64_t v26 = v15;
            }
            else {
              int64_t v26 = v24;
            }
            if (v24 >= v14) {
              uint64_t v27 = v14;
            }
            else {
              uint64_t v27 = v24;
            }
            int64_t v29 = v65;
            uint64_t v28 = v66;
            if (v24 <= v65) {
              int64_t v30 = v65;
            }
            else {
              int64_t v30 = v24;
            }
            if (v24 >= v66) {
              uint64_t v31 = v66;
            }
            else {
              uint64_t v31 = v24;
            }
            uint64_t v32 = v64;
            if (v25)
            {
              uint64_t v32 = v64 + 1;
              uint64_t v28 = v31;
            }
            uint64_t v66 = v28;
            if (v25) {
              int64_t v29 = v30;
            }
            uint64_t v64 = v32;
            int64_t v65 = v29;
            if (!v25)
            {
              uint64_t v14 = v27;
              int64_t v15 = v26;
            }
            v33 = [v18 gateway];

            if (v33)
            {
              v34 = [v18 gateway];
              uint64_t v35 = [v34 externalID];
              v36 = (void *)v35;
              if (v35) {
                CFStringRef v37 = (const __CFString *)v35;
              }
              else {
                CFStringRef v37 = @"Nil";
              }
              [v61 addObject:v37];
            }
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v64 = 0;
      int64_t v65 = 0x8000000000000001;
      uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v67 = 0;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      int64_t v15 = 0x8000000000000001;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }

    id v39 = objc_loadWeakRetained(location);
    v40 = [v39 analyticsManager];
    id v41 = [v40 acceptedVersionForImproveHealthRecords];

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = &off_11D7F8;
      v11 = v60;
    }
    else
    {
      v73[0] = @"weeksSinceOnboarded";
      v42 = +[NSNumber numberWithInteger:v16];
      v74[0] = v42;
      v74[1] = &__kCFBooleanTrue;
      v73[1] = @"isOnboarded";
      v73[2] = @"isImproveHealthRecordsAllowed";
      v43 = +[NSNumber numberWithInteger:v41];
      v74[2] = v43;
      v44 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];
      id v45 = [v44 mutableCopy];

      int v46 = HIDWORD(v58);
      if (v58)
      {
        v47 = +[NSNumber numberWithInt:v64 == v67];
        [v45 setObject:v47 forKeyedSubscript:@"hasSignedClinicalDataWithNoCHRAccount"];

        if (v15 == 0x8000000000000001) {
          +[NSNull null];
        }
        else {
        v48 = +[NSNumber numberWithInteger:v15];
        }
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v48, @"weeksSinceFirstOnboardedCHR", v58);

        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          +[NSNull null];
        }
        else {
        v49 = +[NSNumber numberWithInteger:v14];
        }
        [v45 setObject:v49 forKeyedSubscript:@"weeksSinceLastOnboardedCHR"];

        if (v65 == 0x8000000000000001) {
          +[NSNull null];
        }
        else {
        v50 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
        }
        [v45 setObject:v50 forKeyedSubscript:@"weeksSinceFirstOnboardedVHR"];

        if (v66 == 0x7FFFFFFFFFFFFFFFLL) {
          +[NSNull null];
        }
        else {
        v51 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
        }
        [v45 setObject:v51 forKeyedSubscript:@"weeksSinceLastOnboardedVHR"];
      }
      v11 = v60;
      if (v46)
      {
        v52 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:1];
        v53 = +[NSNumber numberWithInteger:v67];
        [v45 setObject:v53 forKeyedSubscript:@"enabledAccounts"];

        v72 = v52;
        v54 = +[NSArray arrayWithObjects:&v72 count:1];
        v55 = [v61 sortedArrayUsingDescriptors:v54];
        v56 = [v55 componentsJoinedByString:@","];
        [v45 setObject:v56 forKeyedSubscript:@"gatewayID"];
      }
      v38 = (_UNKNOWN **)objc_msgSend(v45, "copy", v58);
    }
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (id)_fetchDeviceContextAnalyticsWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  BOOL v6 = [a3 deviceContextManager];
  BOOL v7 = [v6 numberOfDeviceContextsPerDeviceType:a5];

  if (v7)
  {
    uint64_t v8 = [v7 objectForKeyedSubscript:&off_11D3B0];
    id v9 = (void *)v8;
    if (v8) {
      objc_super v10 = (_UNKNOWN **)v8;
    }
    else {
      objc_super v10 = &off_11D3C8;
    }
    v11 = v10;

    uint64_t v12 = [v7 objectForKeyedSubscript:&off_11D3E0];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (_UNKNOWN **)v12;
    }
    else {
      uint64_t v14 = &off_11D3C8;
    }
    int64_t v15 = v14;

    uint64_t v16 = [v7 objectForKeyedSubscript:&off_11D3F8];
    id v17 = (void *)v16;
    if (v16) {
      v18 = (_UNKNOWN **)v16;
    }
    else {
      v18 = &off_11D3C8;
    }
    v19 = v18;

    uint64_t v20 = [v7 objectForKeyedSubscript:&off_11D410];
    v21 = (void *)v20;
    if (v20) {
      v22 = (_UNKNOWN **)v20;
    }
    else {
      v22 = &off_11D3C8;
    }
    id v23 = v22;

    v26[0] = @"countPairediPhone";
    v26[1] = @"countPairedWatch";
    v27[0] = v11;
    v27[1] = v19;
    v26[2] = @"countPairediPad";
    v26[3] = @"countPairedVisionPro";
    v27[2] = v15;
    v27[3] = v23;
    int64_t v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  }
  else
  {
    int64_t v24 = 0;
  }

  return v24;
}

- (id)_fetchRecordAndUserDomainConceptAnalyticsHealthDataSubmissionAllowed:(BOOL)a3 collectsClinicalOptInData:(BOOL)a4 transaction:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
    id v13 = [WeakRetained profile];
    uint64_t v14 = [v13 userDomainConceptManager];
    int64_t v15 = [v14 userDomainConceptAnalyticsWithError:a6];

    if (!v15) {
      goto LABEL_15;
    }
    [v11 addEntriesFromDictionary:v15];
    uint64_t v16 = +[NSDate date];
    id v17 = [(HDClinicalDailyAnalyticsManager *)self _recordCountAnalyticsWithNowDate:v16 transaction:v10 error:a6];

    if (!v17)
    {

      goto LABEL_15;
    }
    [v11 addEntriesFromDictionary:v17];
  }
  if (v8)
  {
    v18 = +[HKObjectType signedClinicalDataRecordTypeForIdentifier:HKSignedClinicalDataRecordTypeIdentifierSignedClinicalDataRecord];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = [v10 protectedDatabase];
    int64_t v21 = [(HDClinicalDailyAnalyticsManager *)self _hasMedicalRecordsOfType:v18 medicalRecordEntitySubclass:v19 predicate:0 database:v20 error:a6];

    if (!v21)
    {

      goto LABEL_15;
    }
    v22 = +[NSNumber numberWithBool:v21 == 1];
    [v11 setObject:v22 forKeyedSubscript:@"hasSignedClinicalData"];
  }
  if (!v7)
  {
LABEL_11:
    id v30 = v11;
    goto LABEL_16;
  }
  id v23 = +[HKObjectType medicalTypeForIdentifier:HKClinicalNoteRecordTypeIdentifierClinicalNoteRecord];
  uint64_t v24 = objc_opt_class();
  v25 = [v10 protectedDatabase];
  int64_t v26 = [(HDClinicalDailyAnalyticsManager *)self _hasMedicalRecordsOfType:v23 medicalRecordEntitySubclass:v24 predicate:0 database:v25 error:a6];

  if (v26)
  {
    uint64_t v27 = +[NSNumber numberWithBool:v26 == 1];
    [v11 setObject:v27 forKeyedSubscript:@"hasClinicalNotes"];

    uint64_t v28 = [v10 protectedDatabase];
    int64_t v29 = [(HDClinicalDailyAnalyticsManager *)self _countClinicalNoteAttachmentsInDatabase:v28 error:a6];

    [v11 setObject:v29 forKeyedSubscript:@"countNumberClinicalNoteAttachments"];
    goto LABEL_11;
  }

LABEL_15:
  id v30 = 0;
LABEL_16:

  return v30;
}

- (id)_recordCountAnalyticsWithNowDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(id)objc_opt_class() _recordAnalyticsDescriptions];
  id v9 = (char *)[obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        id v17 = v6;
        id v18 = v7;
        id v19 = v8;
        int v13 = HKWithAutoreleasePool();

        if (!v13)
        {

          id v14 = 0;
          goto LABEL_11;
        }
      }
      id v10 = (char *)[obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v14 = v8;
LABEL_11:

  return v14;
}

- (id)_recordCategoryAnalyticsWithDescription:(id)a3 nowDate:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v19 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [v8 timeScopes];
  uint64_t v11 = (char *)[obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        id v20 = v8;
        id v21 = v19;
        id v22 = v9;
        id v23 = v10;
        int v15 = HKWithAutoreleasePool();

        if (!v15)
        {

          id v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = (char *)[obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v16 = v10;
LABEL_11:

  return v16;
}

- (id)_countWithRecordCategoryAnalyticsDescription:(id)a3 timeScope:(int64_t)a4 nowDate:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v29 = a5;
  id v31 = a6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [a3 queryDescriptors];
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v33;
    uint64_t v14 = HDSQLEntityPropertyStar;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v17 = [v16 samplePredicate];
        if (a4)
        {
          id v18 = [v29 dateByAddingTimeInterval:(double)-a4];
          id v19 = HDMedicalRecordEntityPredicateForSortDate();

          uint64_t v20 = +[HDSQLitePredicate compoundPredicateWithPredicate:v17 otherPredicate:v19];

          id v17 = (void *)v20;
        }
        id v21 = [v16 sampleTypes];
        id v22 = [v21 anyObject];
        id v23 = objc_msgSend(objc_msgSend(v22, "dataObjectClass"), "hd_dataEntityClass");

        long long v24 = [v31 protectedDatabase];
        long long v25 = [v23 countValueForProperty:v14 predicate:v17 database:v24 error:a7];

        if (!v25)
        {

          long long v26 = 0;
          goto LABEL_15;
        }
        v12 += (uint64_t)[v25 integerValue];
      }
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  long long v26 = +[NSNumber numberWithInteger:v12];
LABEL_15:

  return v26;
}

- (int64_t)_hasMedicalRecordsOfType:(id)a3 medicalRecordEntitySubclass:(Class)a4 predicate:(id)a5 database:(id)a6 error:(id *)a7
{
  id v7 = [(objc_class *)a4 countValueForProperty:HDSQLEntityPropertyStar predicate:a5 database:a6 error:a7];
  id v8 = v7;
  if (!v7 || ((unint64_t)[v7 longLongValue] & 0x8000000000000000) != 0)
  {
    int64_t v9 = 0;
  }
  else if ([v8 longLongValue])
  {
    int64_t v9 = 1;
  }
  else
  {
    int64_t v9 = 2;
  }

  return v9;
}

- (id)_countClinicalNoteAttachmentsInDatabase:(id)a3 error:(id *)a4
{
  return +[HDMedicalDownloadableAttachmentEntity countValueForProperty:HDSQLEntityPropertyStar predicate:0 database:a3 error:a4];
}

+ (id)_recordAnalyticsDescriptions
{
  v3 = [_HDRecordCategoryAnalyticsDescription alloc];
  v48 = +[HKAllergyRecordType allergyRecordType];
  v47 = +[HDQueryDescriptor queryDescriptorWithSampleType:v48];
  v55 = v47;
  int v46 = +[NSArray arrayWithObjects:&v55 count:1];
  id v45 = [(_HDRecordCategoryAnalyticsDescription *)v3 initWithCategoryType:7 baseAnalyticKey:@"countNumberAllergyRecords" timeScopes:&off_11D6D8 queryDescriptors:v46];
  v56[0] = v45;
  id v4 = [_HDRecordCategoryAnalyticsDescription alloc];
  v44 = +[HKDiagnosticTestResultType diagnosticTestResultType];
  uint64_t v5 = HDDiagnosticTestResultEntityPropertyCategory;
  v43 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDDiagnosticTestResultEntityPropertyCategory equalToValue:HKDiagnosticTestResultCategoryVitalSigns];
  v42 = [a1 _queryDescriptorForType:v44 predicate:v43];
  v54 = v42;
  id v41 = +[NSArray arrayWithObjects:&v54 count:1];
  v40 = [(_HDRecordCategoryAnalyticsDescription *)v4 initWithCategoryType:3 baseAnalyticKey:@"countNumberVitalRecords" timeScopes:&off_11D6F0 queryDescriptors:v41];
  v56[1] = v40;
  id v6 = [_HDRecordCategoryAnalyticsDescription alloc];
  id v39 = +[HKConditionRecordType conditionRecordType];
  v38 = +[HDQueryDescriptor queryDescriptorWithSampleType:v39];
  v53 = v38;
  CFStringRef v37 = +[NSArray arrayWithObjects:&v53 count:1];
  v36 = [(_HDRecordCategoryAnalyticsDescription *)v6 initWithCategoryType:4 baseAnalyticKey:@"countNumberConditionRecords" timeScopes:&off_11D708 queryDescriptors:v37];
  v56[2] = v36;
  id v7 = [_HDRecordCategoryAnalyticsDescription alloc];
  long long v35 = +[HKDiagnosticTestReportType diagnosticTestReportType];
  long long v34 = +[HDQueryDescriptor queryDescriptorWithSampleType:v35];
  v52[0] = v34;
  long long v33 = +[HKDiagnosticTestResultType diagnosticTestResultType];
  long long v32 = +[HDSQLiteComparisonPredicate predicateWithProperty:v5 equalToValue:HKDiagnosticTestResultCategoryLaboratory];
  id v31 = [a1 _queryDescriptorForType:v33 predicate:v32];
  v52[1] = v31;
  id v30 = +[NSArray arrayWithObjects:v52 count:2];
  id v29 = [(_HDRecordCategoryAnalyticsDescription *)v7 initWithCategoryType:2 baseAnalyticKey:@"countNumberLabRecords" timeScopes:&off_11D720 queryDescriptors:v30];
  v56[3] = v29;
  id v8 = [_HDRecordCategoryAnalyticsDescription alloc];
  uint64_t v28 = +[HKMedicationOrderType medicationOrderType];
  long long v27 = +[HDQueryDescriptor queryDescriptorWithSampleType:v28];
  v51[0] = v27;
  long long v26 = +[HKMedicationDispenseRecordType medicationDispenseRecordType];
  long long v25 = +[HDQueryDescriptor queryDescriptorWithSampleType:v26];
  v51[1] = v25;
  long long v24 = +[HKMedicationRecordType medicationRecordType];
  id v23 = +[HDQueryDescriptor queryDescriptorWithSampleType:v24];
  v51[2] = v23;
  id v22 = +[NSArray arrayWithObjects:v51 count:3];
  int64_t v9 = [(_HDRecordCategoryAnalyticsDescription *)v8 initWithCategoryType:1 baseAnalyticKey:@"countNumberMedicationRecords" timeScopes:&off_11D738 queryDescriptors:v22];
  v56[4] = v9;
  id v10 = [_HDRecordCategoryAnalyticsDescription alloc];
  id v11 = +[HKProcedureRecordType procedureRecordType];
  uint64_t v12 = +[HDQueryDescriptor queryDescriptorWithSampleType:v11];
  v50 = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:&v50 count:1];
  uint64_t v14 = [(_HDRecordCategoryAnalyticsDescription *)v10 initWithCategoryType:5 baseAnalyticKey:@"countNumberProcedureRecords" timeScopes:&off_11D750 queryDescriptors:v13];
  v56[5] = v14;
  int v15 = [_HDRecordCategoryAnalyticsDescription alloc];
  id v16 = +[HKVaccinationRecordType vaccinationRecordType];
  id v17 = +[HDQueryDescriptor queryDescriptorWithSampleType:v16];
  v49 = v17;
  id v18 = +[NSArray arrayWithObjects:&v49 count:1];
  id v19 = [(_HDRecordCategoryAnalyticsDescription *)v15 initWithCategoryType:6 baseAnalyticKey:@"countNumberImmunizationRecords" timeScopes:&off_11D768 queryDescriptors:v18];
  v56[6] = v19;
  id v21 = +[NSArray arrayWithObjects:v56 count:7];

  return v21;
}

+ (id)_queryDescriptorForType:(id)a3 predicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)HDQueryDescriptor);
  id v8 = +[NSSet setWithObject:v6];

  id v9 = [v7 initWithSampleTypes:v8 encodingOptions:0 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:v5];

  return v9;
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v13 = 0;
  unsigned __int8 v7 = [(HDClinicalDailyAnalyticsManager *)self _submitHealthRecordsDailyAnalyticsWithCoordinator:a3 error:&v13];
  id v8 = v13;
  if (v7)
  {
    id v9 = objc_alloc_init((Class)HKClinicalSharingClient);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_A7DC8;
    v11[3] = &unk_114EF8;
    void v11[4] = self;
    id v12 = v6;
    [v9 submitDailyAnalyticsWithCompletion:v11];
  }
  else
  {
    _HKInitializeLogging();
    id v10 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B5498(v10);
    }
    (*((void (**)(id, void, uint64_t, id))v6 + 2))(v6, 0, 2, v8);
  }
}

- (void)unitTesting_overrideMCProfileConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnectionOverride, 0);

  objc_destroyWeak((id *)&self->_profileExtension);
}

@end