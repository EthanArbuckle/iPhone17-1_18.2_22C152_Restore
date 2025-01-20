@interface HDHealthRecordsPluginServer
+ (id)taskIdentifier;
- (HDHealthRecordsPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)diagnosticDescription;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_notifyObserversAboutAccountsEvent:(unint64_t)a3;
- (void)accountManager:(id)a3 account:(id)a4 didChangeState:(int64_t)a5;
- (void)clinicalIngestionManager:(id)a3 willChangeIngestionState:(int64_t)a4;
- (void)connectionConfigured;
- (void)profileExtension:(id)a3 healthRecordsSupported:(BOOL)a4;
- (void)registerForHealthRecordsSupportedStateChanges;
- (void)remote_currentIngestionStatusWithCompletion:(id)a3;
- (void)remote_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4;
- (void)remote_fetchClinicalConnectedAccountsWithCompletion:(id)a3;
- (void)remote_fetchClinicalOptInDataCollectionFilePathsWithCompletion:(id)a3;
- (void)remote_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:(id)a3;
- (void)remote_fetchExportedPropertiesForHealthRecord:(id)a3 completion:(id)a4;
- (void)remote_fetchFHIRJSONDocumentWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)remote_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:(id)a3;
- (void)remote_fetchLogoForBrand:(id)a3 scale:(id)a4 completion:(id)a5;
- (void)remote_fetchRawSourceStringForHealthRecord:(id)a3 completion:(id)a4;
- (void)remote_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:(id)a3;
- (void)remote_fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion:(id)a3;
- (void)remote_pingWithCompletion:(id)a3;
- (void)remote_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4;
- (void)remote_resetClinicalContentAnalyticsAnchorsWithCompletion:(id)a3;
- (void)remote_resetClinicalOptInDataCollectionAnchorsWithCompletion:(id)a3;
- (void)remote_stringifyExtractionFailureReasonsForRecord:(id)a3 completion:(id)a4;
- (void)remote_triggerClinicalContentAnalyticsForReason:(int64_t)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_triggerClinicalOptInDataCollectionForReason:(int64_t)a3 completion:(id)a4;
- (void)remote_triggerHealthCloudUploadWithCompletion:(id)a3;
@end

@implementation HDHealthRecordsPluginServer

- (id)remoteInterface
{
  return (id)_HKHealthRecordsStoreClientInterface(self, a2);
}

- (id)exportedInterface
{
  return (id)_HKHealthRecordsStoreServerInterface(self, a2);
}

- (void)connectionConfigured
{
}

- (void)remote_currentIngestionStatusWithCompletion:(id)a3
{
  unint64_t lastKnownIngestionStatus = self->_lastKnownIngestionStatus;
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInteger:lastKnownIngestionStatus];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (HDHealthRecordsPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDHealthRecordsPluginServer;
  v11 = [(HDHealthRecordsPluginServer *)&v21 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    v12 = [v10 profile];
    uint64_t v13 = [v12 profileExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];
    profileExtension = v11->_profileExtension;
    v11->_profileExtension = (HDHealthRecordsProfileExtension *)v13;

    v11->_ingestionStatusLock._os_unfair_lock_opaque = 0;
    v15 = [(HDHealthRecordsProfileExtension *)v11->_profileExtension ingestionManager];
    v16 = (char *)[v15 currentIngestionState];
    if ((unint64_t)(v16 - 1) > 2) {
      unint64_t v17 = 0;
    }
    else {
      unint64_t v17 = qword_F2800[(void)(v16 - 1)];
    }
    v11->_unint64_t lastKnownIngestionStatus = v17;

    v18 = [(HDHealthRecordsProfileExtension *)v11->_profileExtension ingestionManager];
    [v18 registerIngestionStateChangeObserver:v11];

    v19 = [(HDHealthRecordsProfileExtension *)v11->_profileExtension accountManager];
    [v19 addAccountStateObserver:v11];
  }
  return v11;
}

- (void)registerForHealthRecordsSupportedStateChanges
{
}

- (void).cxx_destruct
{
}

- (void)profileExtension:(id)a3 healthRecordsSupported:(BOOL)a4
{
  BOOL v4 = a4;
  _HKInitializeLogging();
  id v6 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    __int16 v13 = 1026;
    BOOL v14 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: health records supported did change to: %{public}d", buf, 0x12u);
  }
  v7 = [(HDHealthRecordsPluginServer *)self client];
  v8 = [v7 connection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_FF4C;
  v10[3] = &unk_111BF8;
  v10[4] = self;
  v9 = [v8 remoteObjectProxyWithErrorHandler:v10];

  objc_msgSend(v9, "clientRemote_healthRecordsSupportedDidChangeTo:", v4);
}

- (void)remote_pingWithCompletion:(id)a3
{
}

- (void)remote_fetchClinicalConnectedAccountsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void))a3;
  id v5 = [(HDHealthRecordsProfileExtension *)self->_profileExtension accountManager];
  id v9 = 0;
  id v6 = [v5 allAccountsWithError:&v9];
  id v7 = v9;

  if (v6)
  {
    v8 = objc_msgSend(v6, "hk_map:", &stru_111C18);
    v4[2](v4, v8, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v7);
  }
}

- (void)accountManager:(id)a3 account:(id)a4 didChangeState:(int64_t)a5
{
  uint64_t v6 = 3;
  switch(a5)
  {
    case 0:
      _HKInitializeLogging();
      id v7 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AAB14((uint64_t)self, v7);
      }
      return;
    case 1:
      goto LABEL_8;
    case 2:
      uint64_t v6 = 4;
      goto LABEL_8;
    case 3:
      uint64_t v6 = 5;
      goto LABEL_8;
    default:
      uint64_t v6 = 0;
LABEL_8:
      -[HDHealthRecordsPluginServer _notifyObserversAboutAccountsEvent:](self, "_notifyObserversAboutAccountsEvent:", v6, a4);
      return;
  }
}

- (void)remote_fetchLogoForBrand:(id)a3 scale:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = [(HDHealthRecordsProfileExtension *)self->_profileExtension providerServiceManager];
  if (v10)
  {
    if ((uint64_t)[v8 integerValue] <= 2)
    {
      if ((int)[v8 intValue] <= 1) {
        CFStringRef v11 = @"1x";
      }
      else {
        CFStringRef v11 = @"2x";
      }
    }
    else
    {
      CFStringRef v11 = @"3x";
    }
    [v10 fetchLogoDataForBrand:v13 scaleKey:v11 completion:v9];
  }
  else
  {
    v12 = +[NSError hk_error:127 description:@"provider service calls are not supported on this profile"];
    v9[2](v9, 0, v12);
  }
}

- (void)clinicalIngestionManager:(id)a3 willChangeIngestionState:(int64_t)a4
{
  p_ingestionStatusLock = &self->_ingestionStatusLock;
  os_unfair_lock_lock(&self->_ingestionStatusLock);
  if ((unint64_t)(a4 - 1) > 2) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = qword_F2800[a4 - 1];
  }
  unint64_t lastKnownIngestionStatus = self->_lastKnownIngestionStatus;
  self->_unint64_t lastKnownIngestionStatus = v7;
  os_unfair_lock_unlock(p_ingestionStatusLock);
  if (v7 != lastKnownIngestionStatus)
  {
    _HKInitializeLogging();
    id v9 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      CFStringRef v11 = HKStringFromHKClinicalIngestionState();
      int v12 = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: ingestion manager will change ingestion state to %{public}@, notifying HKHealthRecordsStore", (uint8_t *)&v12, 0x16u);
    }
    [(HDHealthRecordsPluginServer *)self _notifyObserversAboutAccountsEvent:v7];
  }
}

- (void)_notifyObserversAboutAccountsEvent:(unint64_t)a3
{
  id v5 = [(HDHealthRecordsPluginServer *)self client];
  uint64_t v6 = [v5 connection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10574;
  v8[3] = &unk_111BF8;
  v8[4] = self;
  unint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v8];

  objc_msgSend(v7, "clientRemote_healthRecordsAccountsEventObserved:", a3);
}

- (void)remote_fetchFHIRJSONDocumentWithAccountIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(HDHealthRecordsPluginServer *)self profile];
  id v12 = 0;
  id v9 = +[HDOriginalFHIRResourceEntity fullResourceDocumentForAccountIdentifier:v7 profile:v8 error:&v12];

  id v10 = v12;
  CFStringRef v11 = [v9 dictionaryRepresentation];
  v6[2](v6, v11, v10);
}

- (void)remote_fetchRawSourceStringForHealthRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = [v6 sourceRevision];
  id v9 = [v8 source];

  id v10 = [v9 _deducedClinicalAccountIdentifier];
  if (v10)
  {
    CFStringRef v11 = [v6 originIdentifier];
    id v12 = [v11 fhirIdentifier];

    if (v12)
    {
      id v13 = [v6 FHIRIdentifier];
      id v38 = 0;
      __int16 v14 = [v13 parentResourceIdentifierWithError:&v38];
      id v15 = v38;

      if (!v14)
      {
        v7[2](v7, 0, v15);
LABEL_23:

        goto LABEL_24;
      }
      v16 = [(HDHealthRecordsPluginServer *)self profile];
      id v37 = v15;
      unint64_t v17 = +[HDClinicalRecordEntity clinicalRecordWithResourceIdentifier:v14 source:v9 profile:v16 error:&v37];
      id v18 = v37;

      if (v17)
      {
        v19 = [v17 FHIRResource];
        v20 = [v19 sourceString];
      }
      else
      {
        v31 = [(HDHealthRecordsPluginServer *)self profile];
        id v36 = v18;
        v19 = +[HDOriginalFHIRResourceEntity resourceObjectWithIdentifier:v14 accountIdentifier:v10 profile:v31 error:&v36];
        id v32 = v36;

        if (v19)
        {
          v20 = [v19 sourceString];
        }
        else
        {
          v20 = 0;
        }
        id v18 = v32;
      }
    }
    else
    {
      v22 = [v6 originIdentifier];
      v23 = [v22 signedClinicalDataRecordIdentifier];

      if (v23)
      {
        v24 = [(HDHealthRecordsProfileExtension *)self->_profileExtension signedClinicalDataManager];
        id v35 = 0;
        v25 = [v24 signedClinicalDataGroupBackingMedicalRecord:v6 options:4 error:&v35];
        id v18 = v35;

        if (v25)
        {
          v26 = [v25 clinicalRecords];
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10AC8;
          v33[3] = &unk_111C40;
          id v27 = v6;
          id v34 = v27;
          v28 = objc_msgSend(v26, "hk_firstObjectPassingTest:", v33);

          if (v28)
          {
            v29 = [v28 FHIRResource];
            v30 = [v29 data];
            v20 = +[NSJSONSerialization hk_stringForDisplayFromFHIRData:v30];
          }
          else
          {
            v29 = [v27 UUID];
            +[NSError hk_error:118, @"There is no clinical record corresponding to medical record %@", v29 format];
            v20 = 0;
            v30 = v18;
            id v18 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v20 = 0;
        }
      }
      else
      {
        id v18 = +[NSError hk_error:3 description:@"Cannot fetch raw FHIR data for record that is backed by neither a FHIR resource nor an SCD record"];
        v20 = 0;
      }
    }
    ((void (**)(id, void *, id))v7)[2](v7, v20, v18);

    id v15 = v18;
    goto LABEL_23;
  }
  objc_super v21 = +[NSError hk_error:3, @"Unable to determine account identifier for source %@", v9 format];
  v7[2](v7, 0, v21);

LABEL_24:
}

- (void)remote_fetchExportedPropertiesForHealthRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = [v6 sourceRevision];
  id v9 = [v8 source];

  id v10 = [v9 _deducedClinicalAccountIdentifier];
  if (v10)
  {
    CFStringRef v11 = [v6 FHIRIdentifier];
    id v35 = 0;
    id v12 = [v11 parentResourceIdentifierWithError:&v35];
    id v13 = v35;

    if (v12)
    {
      __int16 v14 = [(HDHealthRecordsPluginServer *)self profile];
      id v34 = v13;
      id v15 = +[HDOriginalFHIRResourceEntity resourceObjectWithIdentifier:v12 accountIdentifier:v10 profile:v14 error:&v34];
      id v16 = v34;

      if (v15)
      {
        v36[0] = HKMedicalRecordExportedResourceTypeKey;
        id v32 = [v15 identifier];
        v31 = [v32 resourceType];
        v37[0] = v31;
        v36[1] = HKMedicalRecordExportedResourceIdentifierKey;
        v30 = [v15 identifier];
        v29 = [v30 identifier];
        v37[1] = v29;
        v36[2] = HKMedicalRecordExportedSourceURLKey;
        v28 = [v15 sourceURL];
        uint64_t v17 = [v28 absoluteString];
        id v27 = (void *)v17;
        CFStringRef v18 = &stru_1152E8;
        if (v17) {
          CFStringRef v18 = (const __CFString *)v17;
        }
        v37[2] = v18;
        v36[3] = HKMedicalRecordExportedReceivedDateKey;
        v26 = [v15 receivedDate];
        v37[3] = v26;
        v36[4] = HKMedicalRecordExportedFHIRVersionKey;
        [v15 FHIRVersion];
        v19 = id v33 = v16;
        v20 = [v19 stringRepresentation];
        v37[4] = v20;
        v36[5] = HKMedicalRecordExportedJSONStringKey;
        uint64_t v21 = [v15 sourceString];
        v22 = (void *)v21;
        CFStringRef v23 = @"{}";
        if (v21) {
          CFStringRef v23 = (const __CFString *)v21;
        }
        v37[5] = v23;
        v24 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:6];

        id v16 = v33;
      }
      else
      {
        v24 = 0;
      }
      v7[2](v7, v24, v16);
    }
    else
    {
      v7[2](v7, 0, v13);
      id v16 = v13;
    }
  }
  else
  {
    v25 = +[NSError hk_error:3, @"Unable to determine account identifier for source %@", v9 format];
    v7[2](v7, 0, v25);
  }
}

- (void)remote_stringifyExtractionFailureReasonsForRecord:(id)a3 completion:(id)a4
{
  id v13 = (void (**)(id, void *, void))a4;
  id v5 = [a3 metadata];
  id v6 = [v5 objectForKeyedSubscript:_HKPrivateMetadataKeyExtractionFailureInfo];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:0];
      id v8 = [objc_alloc((Class)HDHRSExtractionFailureInfo) initWithCoder:v7];
      id v9 = [v8 failureRecords];
      id v10 = objc_msgSend(v9, "hk_map:", &stru_111C80);

      v13[2](v13, v10, 0);
    }
    else
    {
      CFStringRef v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      id v7 = +[NSError hk_error:3, @"Expected NSData for private metadata key but received %@", v12 format];

      ((void (**)(id, void *, id))v13)[2](v13, 0, v7);
    }
  }
  else
  {
    v13[2](v13, &__NSArray0__struct, 0);
  }
}

- (void)remote_fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  BOOL v4 = (void (**)(id, id, void))a3;
  id v5 = [(HDHealthRecordsProfileExtension *)profileExtension analyticsManager];
  id v6 = [v5 userHasAgreedToHealthRecordsDataSubmission];

  id v7 = +[NSNumber numberWithBool:v6];
  v4[2](v4, v7, 0);
}

- (void)remote_fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  BOOL v4 = (void (**)(id, id, void))a3;
  id v5 = [(HDHealthRecordsProfileExtension *)profileExtension analyticsManager];
  id v6 = [v5 isImproveHealthRecordsDataSubmissionAllowed];

  id v7 = +[NSNumber numberWithBool:v6];
  v4[2](v4, v7, 0);
}

- (void)remote_fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  BOOL v4 = (void (**)(id, id, void))a3;
  id v5 = [(HDHealthRecordsProfileExtension *)profileExtension analyticsManager];
  id v6 = [v5 shouldPromptForImproveHealthRecordsDataSubmission];

  id v7 = +[NSNumber numberWithBool:v6];
  v4[2](v4, v7, 0);
}

- (void)remote_fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  BOOL v4 = (void (**)(id, id, void))a3;
  id v5 = [(HDHealthRecordsProfileExtension *)profileExtension analyticsManager];
  id v6 = [v5 currentDeviceSupportsImproveHealthRecordsDataSubmissionOption];

  id v7 = +[NSNumber numberWithBool:v6];
  v4[2](v4, v7, 0);
}

- (void)remote_triggerClinicalOptInDataCollectionForReason:(int64_t)a3 completion:(id)a4
{
  profileExtension = self->_profileExtension;
  id v6 = a4;
  id v7 = [(HDHealthRecordsProfileExtension *)profileExtension optInDataCollectionManager];
  [v7 triggerClinicalOptInDataCollectionForReason:a3 completion:v6];
}

- (void)remote_resetClinicalOptInDataCollectionAnchorsWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  id v4 = a3;
  id v5 = [(HDHealthRecordsProfileExtension *)profileExtension optInDataCollectionManager];
  [v5 resetClinicalOptInDataCollectionAnchorsWithCompletion:v4];
}

- (void)remote_fetchClinicalOptInDataCollectionFilePathsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(HDHealthRecordsPluginServer *)self client];
  id v6 = [v5 process];
  id v17 = 0;
  unsigned __int8 v7 = [v6 hasRequiredEntitlement:HKPrivateHealthKitEntitlement error:&v17];
  id v8 = v17;

  if (v7)
  {
    id v9 = objc_alloc((Class)HDAnalyticsWriter);
    id v10 = [(HDHealthRecordsPluginServer *)self profile];
    id v11 = [v9 initWithProfile:v10];

    id v16 = 0;
    id v12 = [v11 analyticsFilePathsWithError:&v16];
    id v13 = v16;
    if (v12)
    {
      __int16 v14 = v12;
      id v15 = 0;
    }
    else
    {
      __int16 v14 = 0;
      id v15 = v13;
    }
    v4[2](v4, v14, v15);
  }
  else
  {
    v4[2](v4, 0, v8);
  }
}

- (void)remote_triggerClinicalContentAnalyticsForReason:(int64_t)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(HDHealthRecordsProfileExtension *)self->_profileExtension analyticsManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_11600;
  v11[3] = &unk_111CA8;
  id v12 = v8;
  id v10 = v8;
  [v9 triggerClinicalContentAnalyticsForReason:a3 options:a4 completion:v11];
}

- (void)remote_triggerHealthCloudUploadWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  id v4 = a3;
  id v5 = [(HDHealthRecordsProfileExtension *)profileExtension optInDataUploadManager];
  [v5 triggerClinicalOptInDataUploadWithCompletion:v4];
}

- (void)remote_resetClinicalContentAnalyticsAnchorsWithCompletion:(id)a3
{
  profileExtension = self->_profileExtension;
  id v4 = a3;
  id v5 = [(HDHealthRecordsProfileExtension *)profileExtension analyticsManager];
  [v5 resetClinicalContentAnalyticsAnchorsWithCompletion:v4];
}

- (void)remote_registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HDHealthRecordsPluginServer *)self client];
  id v9 = [v8 process];
  id v15 = 0;
  unsigned __int8 v10 = [v9 hasRequiredEntitlement:HKAuthorizationManagerEntitlement error:&v15];
  id v11 = v15;

  if (v10)
  {
    id v12 = [(HDHealthRecordsProfileExtension *)self->_profileExtension APIReminderRegistry];

    if (v12)
    {
      id v13 = [(HDHealthRecordsProfileExtension *)self->_profileExtension APIReminderRegistry];
      [v13 registerAppSourceForUnlimitedAuthorizationModeConfirmation:v6 completion:v7];
    }
    else
    {
      id v13 = [(HDHealthRecordsProfileExtension *)self->_profileExtension profile];
      __int16 v14 = +[NSError hk_error:100, @"Unsupported profile %@", v13 format];
      v7[2](v7, 0, v14);
    }
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

- (void)remote_deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HDHealthRecordsPluginServer *)self client];
  id v9 = [v8 process];
  id v15 = 0;
  unsigned __int8 v10 = [v9 hasRequiredEntitlement:HKAuthorizationManagerEntitlement error:&v15];
  id v11 = v15;

  if (v10)
  {
    id v12 = [(HDHealthRecordsProfileExtension *)self->_profileExtension APIReminderRegistry];

    if (v12)
    {
      id v13 = [(HDHealthRecordsProfileExtension *)self->_profileExtension APIReminderRegistry];
      [v13 deregisterAppSourceFromUnlimitedAuthorizationModeConfirmation:v6 completion:v7];
    }
    else
    {
      id v13 = [(HDHealthRecordsProfileExtension *)self->_profileExtension profile];
      __int16 v14 = +[NSError hk_error:100, @"Unsupported profile %@", v13 format];
      v7[2](v7, 0, v14);
    }
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

+ (id)taskIdentifier
{
  return +[HKHealthRecordsStore taskIdentifier];
}

- (id)diagnosticDescription
{
  return +[NSString stringWithFormat:@"<%@ %p on profile extension %@>", objc_opt_class(), self, self->_profileExtension];
}

@end