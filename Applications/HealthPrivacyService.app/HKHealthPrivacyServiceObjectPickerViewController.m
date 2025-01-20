@interface HKHealthPrivacyServiceObjectPickerViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (HKAuthorizationStore)authorizationStore;
- (HKHealthPrivacyServiceObjectPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKHealthPrivacyServicePickerController)pickerController;
- (HKHealthStore)healthStore;
- (HKObjectAuthorizationPromptSession)promptSession;
- (HKObjectAuthorizationPromptSessionMetadata)metadata;
- (HKObjectType)objectType;
- (HKSource)currentSource;
- (NSDictionary)samplesRequiringAuthorization;
- (NSError)transactionError;
- (NSUUID)sessionIdentifier;
- (id)_healthPrivacyHostViewController;
- (id)_pickerControllerForDocuments;
- (id)_pickerControllerForObjectType:(id)a3;
- (id)_pickerControllerForSignedClinicalData;
- (id)_pickerControllerForVisionPrescriptions;
- (id)medicalRecordsForVerifiableClinicalRecord:(id)a3;
- (id)signedClinicalDataRecordForVerifiableClinicalRecord:(id)a3;
- (id)signedRecordsForClinicalRecords:(id)a3;
- (void)_beginAuthorizationSessionWithIdentifier:(id)a3;
- (void)_configureApplicationStateMonitor;
- (void)_configureNavigationController;
- (void)_finishWithError:(id)a3;
- (void)_hostApplicationStateDidChange:(unsigned int)a3;
- (void)_hostDidTerminate;
- (void)_queryMedicalRecordsWithQueryDescriptors:(id)a3 completion:(id)a4;
- (void)pickerControllerDidFinish:(id)a3 error:(id)a4;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setAuthorizationStore:(id)a3;
- (void)setCurrentSource:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPickerController:(id)a3;
- (void)setPromptSession:(id)a3;
- (void)setSamplesRequiringAuthorization:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setTransactionError:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation HKHealthPrivacyServiceObjectPickerViewController

- (HKHealthPrivacyServiceObjectPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HKHealthPrivacyServiceObjectPickerViewController;
  v4 = [(HKHealthPrivacyServiceObjectPickerViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = v4->_healthStore;
    v4->_healthStore = v5;

    v7 = (HKAuthorizationStore *)[objc_alloc((Class)HKAuthorizationStore) initWithHealthStore:v4->_healthStore];
    authorizationStore = v4->_authorizationStore;
    v4->_authorizationStore = v7;
  }
  return v4;
}

- (void)setPromptSession:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_promptSession, a3);
  authorizationStore = self->_authorizationStore;
  id v15 = 0;
  v7 = [(HKAuthorizationStore *)authorizationStore fetchAuthorizationContextForPromptSession:v5 error:&v15];
  id v8 = v15;
  if (v7)
  {
    v9 = [v7 samplesRequiringAuthorization];
    samplesRequiringAuthorization = self->_samplesRequiringAuthorization;
    self->_samplesRequiringAuthorization = v9;

    v11 = [v7 metadata];
    metadata = self->_metadata;
    self->_metadata = v11;

    v13 = [v5 sessionIdentifier];
    [(HKHealthPrivacyServiceObjectPickerViewController *)self _beginAuthorizationSessionWithIdentifier:v13];
  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_ERROR)) {
      sub_10000756C(v14, v5, (uint64_t)v8);
    }
    [(HKHealthPrivacyServiceObjectPickerViewController *)self _finishWithError:v8];
  }
}

- (id)_pickerControllerForObjectType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(HKHealthPrivacyServiceObjectPickerViewController *)self _pickerControllerForDocuments];
LABEL_11:
    v12 = (void *)v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(HKHealthPrivacyServiceObjectPickerViewController *)self _pickerControllerForSignedClinicalData];
    goto LABEL_11;
  }
  uint64_t v6 = +[HKPrescriptionType visionPrescriptionType];
  if ((id)v6 == v4)
  {

    goto LABEL_10;
  }
  v7 = (void *)v6;
  uint64_t v8 = +[HKPrescriptionType visionPrescriptionType];
  if (v8)
  {
    v9 = (void *)v8;
    objc_super v10 = +[HKPrescriptionType visionPrescriptionType];
    unsigned int v11 = [v4 isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
LABEL_10:
    uint64_t v5 = [(HKHealthPrivacyServiceObjectPickerViewController *)self _pickerControllerForVisionPrescriptions];
    goto LABEL_11;
  }

LABEL_16:
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)_pickerControllerForDocuments
{
  id v3 = objc_alloc((Class)HKDocumentPickerViewController);
  id v4 = [(NSDictionary *)self->_samplesRequiringAuthorization allKeys];
  id v5 = [v3 initWithDocuments:v4 presentationStyle:1];

  [v5 setDelegate:self];
  [v5 setSource:self->_currentSource];

  return v5;
}

- (id)_pickerControllerForSignedClinicalData
{
  id v3 = [(NSDictionary *)self->_samplesRequiringAuthorization allKeys];
  id v4 = [v3 sortedArrayUsingComparator:&stru_10000C448];

  id v5 = [(HKHealthPrivacyServiceObjectPickerViewController *)self signedRecordsForClinicalRecords:v4];
  id v6 = objc_alloc((Class)HKVerifiableClinicalRecordPickerViewController);
  v7 = [(HKObjectAuthorizationPromptSessionMetadata *)self->_metadata recordTypes];
  id v8 = [v6 initWithClinicalRecords:v4 signedRecords:v5 recordTypes:v7];

  [v8 setDelegate:self];
  [v8 setSource:self->_currentSource];
  [v8 setSessionIdentifier:self->_sessionIdentifier];

  return v8;
}

- (id)_pickerControllerForVisionPrescriptions
{
  id v3 = [(NSDictionary *)self->_samplesRequiringAuthorization allKeys];
  id v4 = [v3 sortedArrayUsingComparator:&stru_10000C488];

  id v5 = [(NSDictionary *)self->_samplesRequiringAuthorization hk_filter:&stru_10000C4C8];
  id v6 = [v5 allKeys];

  id v7 = [objc_alloc((Class)HKPrescriptionPickerViewController) initWithHealthStore:self->_healthStore samples:v4 enabledSamples:v6 source:self->_currentSource];
  [v7 setDelegate:self];

  return v7;
}

- (void)_configureNavigationController
{
  id v3 = [(NSDictionary *)self->_samplesRequiringAuthorization allKeys];
  id v4 = [v3 firstObject];
  id v5 = [v4 sampleType];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [(HKObjectAuthorizationPromptSessionMetadata *)self->_metadata expectedObjectType];
  }
  p_objectType = &self->_objectType;
  objc_storeStrong((id *)&self->_objectType, v6);
  if (!v5) {

  }
  id v8 = [(HKHealthPrivacyServiceObjectPickerViewController *)self _pickerControllerForObjectType:*p_objectType];
  pickerController = self->_pickerController;
  self->_pickerController = v8;

  if (self->_pickerController)
  {
    id v11 = [objc_alloc((Class)HKNavigationController) initWithRootViewController:self->_pickerController];
    [v11 setModalInPresentation:1];
    [v11 setModalPresentationStyle:5];
    [(HKHealthPrivacyServiceObjectPickerViewController *)self presentViewController:v11 animated:0 completion:0];
  }
  else
  {
    objc_super v10 = [(HKObjectType *)*p_objectType identifier];
    id v11 = +[NSError hk_error:303, @"No picker view controller for object type: %@", v10 format];

    [(HKHealthPrivacyServiceObjectPickerViewController *)self _finishWithError:v11];
  }
}

- (void)_hostApplicationStateDidChange:(unsigned int)a3
{
  if (a3 <= 3)
  {
    block[9] = v3;
    block[10] = v4;
    _HKInitializeLogging();
    id v7 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG)) {
      sub_10000762C(a3, v7);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003FD4;
    block[3] = &unk_10000C340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_configureApplicationStateMonitor
{
  v2 = self;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)BKSApplicationStateMonitor);
  uint64_t v4 = [(HKHealthPrivacyServiceObjectPickerViewController *)v2 _hostApplicationBundleIdentifier];
  v12 = v4;
  id v5 = +[NSArray arrayWithObjects:&v12 count:1];
  id v6 = [v3 initWithBundleIDs:v5 states:BKSApplicationStateAll];
  v2 = (HKHealthPrivacyServiceObjectPickerViewController *)((char *)v2 + 88);
  id v7 = *(void **)v2->HKViewController_opaque;
  *(void *)v2->HKViewController_opaque = v6;

  id v8 = *(void **)v2->HKViewController_opaque;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000415C;
  v9[3] = &unk_10000C368;
  objc_copyWeak(&v10, &location);
  [v8 setHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_beginAuthorizationSessionWithIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceObjectPickerViewController.m", 183, @"Invalid parameter not satisfying: %@", @"sessionIdentifier != nil" object file lineNumber description];
  }
  if (self->_sessionIdentifier)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthPrivacyServiceObjectPickerViewController.m", 184, @"Invalid parameter not satisfying: %@", @"_sessionIdentifier == nil" object file lineNumber description];
  }
  _HKInitializeLogging();
  id v7 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG)) {
    sub_1000076A8(v7);
  }
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
  [(HKHealthPrivacyServiceObjectPickerViewController *)self _configureApplicationStateMonitor];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000043F8;
  v14[3] = &unk_10000C518;
  v14[4] = self;
  id v15 = v6;
  id v8 = v6;
  v9 = objc_retainBlock(v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004520;
  v13[3] = &unk_10000C540;
  v13[4] = self;
  id v10 = objc_retainBlock(v13);
  [(HKHealthStore *)self->_healthStore beginAuthorizationDelegateTransactionWithSessionIdentifier:v8 sourceHandler:v10 errorHandler:v9];
}

- (void)_hostDidTerminate
{
  applicationStateMonitor = self->_applicationStateMonitor;
  self->_applicationStateMonitor = 0;

  if (self->_sessionIdentifier)
  {
    id v5 = +[NSError errorWithDomain:HKErrorDomain code:5 userInfo:0];
    [(HKHealthPrivacyServiceObjectPickerViewController *)self _finishWithError:v5];
    [(HKHealthStore *)self->_healthStore endAuthorizationDelegateTransactionWithSessionIdentifier:self->_sessionIdentifier error:v5];
    sessionIdentifier = self->_sessionIdentifier;
    self->_sessionIdentifier = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKHealthPrivacyServiceObjectPickerViewController;
  [(HKHealthPrivacyServiceObjectPickerViewController *)&v8 viewDidDisappear:a3];
  if (self->_sessionIdentifier)
  {
    uint64_t v4 = self->_transactionError;
    transactionError = self->_transactionError;
    self->_transactionError = 0;

    _HKInitializeLogging();
    id v6 = (void *)HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG)) {
      sub_100007740(v6);
    }
    [(HKHealthStore *)self->_healthStore endAuthorizationDelegateTransactionWithSessionIdentifier:self->_sessionIdentifier error:v4];
    sessionIdentifier = self->_sessionIdentifier;
    self->_sessionIdentifier = 0;
  }
}

- (id)signedRecordsForClinicalRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = -[HKHealthPrivacyServiceObjectPickerViewController signedClinicalDataRecordForVerifiableClinicalRecord:](self, "signedClinicalDataRecordForVerifiableClinicalRecord:", v11, (void)v16);
        v13 = [v11 originIdentifier];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

- (id)signedClinicalDataRecordForVerifiableClinicalRecord:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100004C8C;
  v34 = sub_100004C9C;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100004C8C;
  v28 = sub_100004C9C;
  id v29 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = +[HKSignedClinicalDataRecordType signedClinicalDataRecordType];
  id v7 = [v4 originIdentifier];
  id v8 = +[HKQuery predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:v7];

  id v9 = [objc_alloc((Class)HKQueryDescriptor) initWithSampleType:v6 predicate:v8];
  id v42 = v9;
  id v10 = +[NSArray arrayWithObjects:&v42 count:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100004CA4;
  v20[3] = &unk_10000C568;
  v22 = &v30;
  v23 = &v24;
  id v11 = v5;
  v21 = v11;
  [(HKHealthPrivacyServiceObjectPickerViewController *)self _queryMedicalRecordsWithQueryDescriptors:v10 completion:v20];

  dispatch_time_t v12 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    _HKInitializeLogging();
    v13 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_ERROR)) {
      sub_1000077D8((uint64_t)self, v13);
    }
  }
  id v14 = (void *)v31[5];
  if (!v14)
  {
    _HKInitializeLogging();
    id v15 = HKLogAuthorization;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v18 = [v4 originIdentifier];
      uint64_t v19 = v25[5];
      *(_DWORD *)buf = 138543874;
      v37 = self;
      __int16 v38 = 2112;
      v39 = v18;
      __int16 v40 = 2112;
      uint64_t v41 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find HKSignedClinicalDataRecord associated with sync identifier %@, error: %@", buf, 0x20u);
    }
    id v14 = (void *)v31[5];
  }
  id v16 = v14;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v16;
}

- (void)_queryMedicalRecordsWithQueryDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)HKSampleQuery);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004E28;
  v12[3] = &unk_10000C590;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v8 initWithQueryDescriptors:v7 limit:0 resultsHandler:v12];

  id v11 = [(HKHealthPrivacyServiceObjectPickerViewController *)self healthStore];
  [v11 executeQuery:v10];
}

- (id)medicalRecordsForVerifiableClinicalRecord:(id)a3
{
  id v4 = a3;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = sub_100004C8C;
  v43 = sub_100004C9C;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100004C8C;
  v37 = sub_100004C9C;
  id v38 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v24 = v4;
  id v6 = [v4 originIdentifier];
  id v7 = +[HKQuery predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:v6];

  id v8 = +[HKSampleType medicalRecordTypesWithOptions:1];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = [objc_alloc((Class)HKQueryDescriptor) initWithSampleType:*(void *)(*((void *)&v29 + 1) + 8 * i) predicate:v7];
        [v9 addObject:v14];
      }
      id v11 = [v10 countByEnumeratingWithState:&v29 objects:v51 count:16];
    }
    while (v11);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100005250;
  v25[3] = &unk_10000C568;
  v27 = &v39;
  v28 = &v33;
  id v15 = v5;
  uint64_t v26 = v15;
  [(HKHealthPrivacyServiceObjectPickerViewController *)self _queryMedicalRecordsWithQueryDescriptors:v9 completion:v25];
  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    _HKInitializeLogging();
    long long v17 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_ERROR)) {
      sub_100007850((uint64_t)self, v17);
    }
  }
  long long v18 = (void *)v40[5];
  if (!v18)
  {
    _HKInitializeLogging();
    uint64_t v19 = HKLogAuthorization;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = [v24 originIdentifier];
      uint64_t v23 = v34[5];
      *(_DWORD *)buf = 138543874;
      v46 = self;
      __int16 v47 = 2112;
      v48 = v22;
      __int16 v49 = 2112;
      uint64_t v50 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find HKMedicalRecords associated with sync identifier %@, error: %@", buf, 0x20u);
    }
    long long v18 = (void *)v40[5];
  }
  id v20 = v18;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v20;
}

- (void)pickerControllerDidFinish:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKHealthPrivacyServiceObjectPickerViewController *)self presentedViewController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000053C8;
  v11[3] = &unk_10000C4F0;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  [v8 dismissViewControllerAnimated:1 completion:v11];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = +[_HKBehavior sharedBehavior];
  if ([v5 isiPad])
  {
    unsigned __int8 v6 = +[HKiPadHealthSyncEnablement isSyncPromptedForHealthKit:self->_healthStore];

    if ((v6 & 1) == 0)
    {
      id v7 = [objc_alloc((Class)HKHealthSyncDisplayController) initWithHealthStore:self->_healthStore source:self->_currentSource];
      id v8 = [(HKHealthPrivacyServiceObjectPickerViewController *)self _healthPrivacyHostViewController];
      [v7 setObjectPickerDelegate:v8];

      _HKInitializeLogging();
      id v9 = (void *)HKLogAuthorization;
      if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        *(_DWORD *)id v13 = 138412290;
        *(void *)&v13[4] = objc_opt_class();
        id v11 = *(id *)&v13[4];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Prompting health sync view controller", v13, 0xCu);
      }
      -[HKHealthPrivacyServiceObjectPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, *(_OWORD *)v13);
      goto LABEL_10;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  id v12 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG)) {
    sub_1000078C8(v12);
  }
  id v7 = [(HKHealthPrivacyServiceObjectPickerViewController *)self _healthPrivacyHostViewController];
  [v7 didFinishWithError:v4];
LABEL_10:
}

- (id)_healthPrivacyHostViewController
{
  return [(HKHealthPrivacyServiceObjectPickerViewController *)self _remoteViewControllerProxy];
}

+ (id)_remoteViewControllerInterface
{
  return (id)_HKHealthPrivacyHostRemoteViewControllerInterface(a1, a2);
}

+ (id)_exportedInterface
{
  return (id)_HKHealthPrivacyServiceRemoteObjectPickerViewControllerInterface(a1, a2);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (void)setAuthorizationStore:(id)a3
{
}

- (HKHealthPrivacyServicePickerController)pickerController
{
  return self->_pickerController;
}

- (void)setPickerController:(id)a3
{
}

- (NSError)transactionError
{
  return self->_transactionError;
}

- (void)setTransactionError:(id)a3
{
}

- (HKObjectAuthorizationPromptSession)promptSession
{
  return self->_promptSession;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (HKSource)currentSource
{
  return self->_currentSource;
}

- (void)setCurrentSource:(id)a3
{
}

- (NSDictionary)samplesRequiringAuthorization
{
  return self->_samplesRequiringAuthorization;
}

- (void)setSamplesRequiringAuthorization:(id)a3
{
}

- (HKObjectAuthorizationPromptSessionMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_samplesRequiringAuthorization, 0);
  objc_storeStrong((id *)&self->_currentSource, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_promptSession, 0);
  objc_storeStrong((id *)&self->_transactionError, 0);
  objc_storeStrong((id *)&self->_pickerController, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end