@interface HDClinicalIngestionSignedClinicalDataOperation
+ (id)featureName;
- (id)runFeatureWithCredential:(id)a3;
- (void)askForAccessCredentialsWithCompletion:(id)a3;
- (void)cancelWithError:(id)a3;
- (void)main;
- (void)storeDataFromParsingResult:(id)a3 existingAccountIdentifier:(id)a4;
@end

@implementation HDClinicalIngestionSignedClinicalDataOperation

+ (id)featureName
{
  return HKClinicalGatewayFeatureNameSignedClinicalData;
}

- (void)main
{
  _HKInitializeLogging();
  v4 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = [(HDClinicalIngestionGatewayFeatureOperation *)self debugDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  v21 = sub_3249C;
  v22 = sub_324AC;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_324B4;
  v14[3] = &unk_112D08;
  p_long long buf = &buf;
  v7 = dispatch_semaphore_create(0);
  v15 = v7;
  [(HDClinicalIngestionSignedClinicalDataOperation *)self askForAccessCredentialsWithCompletion:v14];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (([(HDClinicalIngestionSignedClinicalDataOperation *)self isCancelled] & 1) == 0)
  {
    if (!*(void *)(*((void *)&buf + 1) + 40))
    {
      v13 = +[NSAssertionHandler currentHandler];
      [v13 handleFailureInMethod:a2, self, @"HDClinicalIngestionSignedClinicalDataOperation.m", 45, @"Invalid parameter not satisfying: %@", @"freshCredential" object file lineNumber description];
    }
    v8 = -[HDClinicalIngestionSignedClinicalDataOperation runFeatureWithCredential:](self, "runFeatureWithCredential:");
    if (([(HDClinicalIngestionSignedClinicalDataOperation *)self isCancelled] & 1) == 0)
    {
      v9 = [(HDClinicalIngestionPerAccountOperation *)self account];
      v10 = [v9 identifier];
      [(HDClinicalIngestionSignedClinicalDataOperation *)self storeDataFromParsingResult:v8 existingAccountIdentifier:v10];

      if (([(HDClinicalIngestionSignedClinicalDataOperation *)self isCancelled] & 1) == 0)
      {
        _HKInitializeLogging();
        v11 = HKLogHealthRecords;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = [(HDClinicalIngestionGatewayFeatureOperation *)self debugDescription];
          *(_DWORD *)v17 = 138543362;
          v18 = v12;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ complete", v17, 0xCu);
        }
      }
    }
  }
  _Block_object_dispose(&buf, 8);
}

- (void)cancelWithError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDClinicalIngestionSignedClinicalDataOperation.m", 63, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  _HKInitializeLogging();
  v6 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_AD0A8(v6, self);
  }
  [(HDClinicalIngestionOperation *)self setOperationError:v5];
  [(HDClinicalIngestionSignedClinicalDataOperation *)self cancel];
}

- (void)askForAccessCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AD178(v5);
  }
  v6 = [(HDClinicalIngestionGatewayFeatureOperation *)self session];
  v7 = [v6 credentialVendor];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_326DC;
  v9[3] = &unk_112440;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 fetchOrRefreshCredentialWithCompletion:v9];
}

- (id)runFeatureWithCredential:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AD4C8(v5);
  }
  v6 = [(HDClinicalIngestionPerAccountOperation *)self account];
  id v45 = 0;
  v7 = [v6 connectionInformationWithCredential:v4 error:&v45];

  id v8 = v45;
  if (!v7)
  {
    [(HDClinicalIngestionSignedClinicalDataOperation *)self cancelWithError:v8];
    v26 = 0;
    goto LABEL_24;
  }
  _HKInitializeLogging();
  v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AD418(v9);
  }
  id v10 = [(HDClinicalIngestionOperation *)self profileExtension];
  unsigned int v11 = [v10 isImproveHealthRecordsDataSubmissionAllowed];

  _HKInitializeLogging();
  v12 = (void *)HKLogHealthRecords;
  BOOL v13 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    id v43 = v8;
    if (v13)
    {
      v14 = v12;
      v15 = [(HDClinicalIngestionGatewayFeatureOperation *)self debugDescription];
      v16 = HKSensitiveLogItem();
      *(_DWORD *)long long buf = 138543618;
      v47 = v15;
      __int16 v48 = 2114;
      v49 = v16;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ ingestion analytics collection %{public}@", buf, 0x16u);
    }
    v17 = [(HDClinicalIngestionOperation *)self profileExtension];
    v18 = [v17 profile];
    v19 = [v18 daemon];
    uint64_t v20 = [v19 ontologyConfigurationProvider];
    v21 = [v20 improveHealthRecordsGatedAnalyticsEnabledCountryCodes];
    v22 = [(HDClinicalIngestionGatewayFeatureOperation *)self gateway];
    id v23 = [v22 country];
    unsigned __int8 v24 = [v21 containsObject:v23];

    if (v24)
    {
      uint64_t v25 = 1;
      id v8 = v43;
    }
    else
    {
      _HKInitializeLogging();
      v30 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_AD348(v30, self);
      }
      uint64_t v25 = 0;
      id v8 = v43;
    }
  }
  else
  {
    if (v13)
    {
      v27 = v12;
      v28 = [(HDClinicalIngestionGatewayFeatureOperation *)self debugDescription];
      v29 = HKSensitiveLogItem();
      *(_DWORD *)long long buf = 138543618;
      v47 = v28;
      __int16 v48 = 2114;
      v49 = v29;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ ingestion analytics collection %{public}@", buf, 0x16u);
    }
    uint64_t v25 = 0;
  }
  id v31 = objc_alloc((Class)HKClinicalIngestionContext);
  int64_t v32 = [(HDClinicalIngestionGatewayFeatureOperation *)self queryMode];
  v33 = [(HDClinicalIngestionPerAccountOperation *)self account];
  v34 = [v33 lastFetchDate];
  id v35 = [v31 initWithAccountConnectionInformation:v7 queryMode:v32 options:v25 lastFetchDate:v34];

  v36 = [(HDClinicalIngestionOperation *)self task];
  v37 = [v36 healthRecordsIngestionServiceClient];
  v38 = [(HDClinicalIngestionGatewayFeatureOperation *)self feature];
  id v44 = 0;
  v26 = [v37 handleSignedClinicalDataFeature:v38 context:v35 error:&v44];
  id v39 = v44;

  _HKInitializeLogging();
  v40 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    sub_AD298(v40);
    if (v26) {
      goto LABEL_20;
    }
LABEL_22:
    [(HDClinicalIngestionSignedClinicalDataOperation *)self cancelWithError:v39];
    goto LABEL_23;
  }
  if (!v26) {
    goto LABEL_22;
  }
LABEL_20:
  id v41 = v26;
LABEL_23:

LABEL_24:

  return v26;
}

- (void)storeDataFromParsingResult:(id)a3 existingAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AD688(v8, self, (uint64_t)v7);
  }
  v9 = [(HDClinicalIngestionOperation *)self profileExtension];
  id v10 = [v9 signedClinicalDataManager];

  if (!v10)
  {
    _HKInitializeLogging();
    unsigned int v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AD5E8(v11);
    }
  }
  id v16 = 0;
  v12 = [v10 storeDataFromParsingResult:v6 existingAccountIdentifier:v7 insertOriginalRecords:1 allRecordsWereDuplicates:0 error:&v16];
  id v13 = v16;
  _HKInitializeLogging();
  v14 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    sub_AD558(v14);
    if (v12) {
      goto LABEL_12;
    }
  }
  else if (v12)
  {
    goto LABEL_12;
  }
  if (v13)
  {
    [(HDClinicalIngestionSignedClinicalDataOperation *)self cancelWithError:v13];
  }
  else
  {
    v15 = +[NSError hk_error:2000 description:@"A failure but no error was returned from manager.storeDataFromParsingResult"];
    [(HDClinicalIngestionSignedClinicalDataOperation *)self cancelWithError:v15];
  }
LABEL_12:
}

@end