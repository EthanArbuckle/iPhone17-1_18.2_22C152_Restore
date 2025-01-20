@interface IDSKeyTransparencyVerifier
+ (BOOL)isKeyTransparencyEnabled;
+ (IDSKeyTransparencyVerifier)sharedInstance;
+ (id)keyTransparencyApplicationForServiceIdentifier:(id)a3;
+ (id)keyTransparencyServiceIdentifierForTransparencyApplication:(id)a3;
+ (id)keyTransparencyURIPrefixForServiceIdentifier:(id)a3;
+ (id)keyTransparencyVersionNumberForServiceType:(id)a3;
+ (id)strippedURIFromKeyTransparencyURI:(id)a3;
- (BOOL)_isTrustedCandidate:(id)a3 index:(id)a4 givenTrustedDevices:(id)a5;
- (BOOL)isDeviceAccountStateKeyTransparencyEligible;
- (BOOL)isKeyInKVS:(id)a3;
- (BOOL)isOptedInForServiceIdentifier:(id)a3;
- (BOOL)ktShouldClearCacheOnOptInOut;
- (CUTMetricLogger)internalMetricLogger;
- (CUTMetricLogger)productionMetricLogger;
- (IDSCloudKitKeyTransparencyStore)keyTransparencyStore;
- (IDSCurrentServerTime)serverTime;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSKeyTransparencyPolicy)policy;
- (IDSKeyTransparencyRegistrationDataSource)registrationDataSource;
- (IDSKeyTransparencyVerifier)init;
- (IDSKeyTransparencyVerifier)initWithPolicy:(id)a3 serviceToVerifier:(id)a4 keyManager:(id)a5 store:(id)a6 registrationDataSource:(id)a7 internalMetricLogger:(id)a8 productionMetricLogger:(id)a9 serviceToKTOptInManager:(id)a10;
- (IDSPeerIDManager)peerIDManager;
- (IDSPushHandler)pushHandler;
- (IDSRateLimiter)registerUpdateRateLimiter;
- (IDSRateLimiter)selfHealRateLimiter;
- (IDSRegistrationKeyManager)keyManager;
- (IDSRegistrationReasonTracker)registrationReasonTracker;
- (KTVerifier)KTVerifier;
- (NSDate)kickPeerVerificationDate;
- (NSDictionary)optInEligibleKTApplicationToIDSServiceIdentifier;
- (NSDictionary)serviceToOptInManager;
- (NSDictionary)serviceToVerifier;
- (NSMutableDictionary)cacheClearRateLimiterByService;
- (double)keyTransparencyCKContainerExpiryTime;
- (double)keyTransparencyPeerUpdateLastResortFetchInterval;
- (double)ktCacheClearRequestLimitTime;
- (double)ktRegisterUpdateLimitTime;
- (id)SHA256HashForKeyTransparencyTrustedDevice:(id)a3;
- (id)SHA256HashForKeyTransparencyTrustedService:(id)a3;
- (id)SHA256HashForKeyTransparencyTrustedServices:(id)a3;
- (id)_IDSEndpointTransparencyStatesForKTLoggableDatas:(id)a3 index:(id)a4;
- (id)_IDSProtoKeyTransparencyTrustedDeviceForKeyTransparencyIndex:(id)a3 entry:(id)a4;
- (id)_KTDataForIDSKeyTransparencyEntry:(id)a3;
- (id)_KTDatasForIDSKeyTransparencyEntries:(id)a3;
- (id)_KTDatasForIDSProtoKeyTransparencyTrustedDevices:(id)a3 serviceIdentifier:(id)a4;
- (id)_clientErrorForKTResult:(unint64_t)a3 underlyingError:(id)a4;
- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5;
- (id)_currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4;
- (id)_currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4;
- (id)_fetchCurrentKVS;
- (id)_fetchExpiredEntriesFromKVS;
- (id)_keyTransparencyVerifierForServiceIdentifier:(id)a3;
- (id)_mergeCloudKitTrustedDevices:(id)a3 accountKeyTrustedDevices:(id)a4;
- (id)_pruneTrustedDevice:(id)a3 givenEligibleServiceIdentifiers:(id)a4;
- (id)_transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5;
- (id)_verifyKeyTransparencyOfRegisteredIndex:(id)a3 verificationState:(id)a4 entry:(id)a5;
- (id)currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4;
- (id)currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4;
- (id)fetchKTEligibleServices;
- (id)fetchTrustedDevicesFromKVS;
- (id)forceSyncKVS;
- (id)transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5 localURI:(id)a6;
- (id)transparencyTicketForRegistrationWithIndex:(id)a3 verificationState:(id)a4 entry:(id)a5;
- (int64_t)_IDSEndpointTransparencyVerificationStateForKTResult:(unint64_t)a3;
- (int64_t)_IDSKTAccountStatusForKTAccountStatus:(unint64_t)a3;
- (int64_t)mostRecentKTCDPAccountStatus;
- (unint64_t)_numberOfMatchesForCandidates:(id)a3 index:(id)a4 trustedDevices:(id)a5;
- (unint64_t)ktCacheClearRequestLimit;
- (unint64_t)ktRegisterUpdateRequestLimit;
- (void)_fetchVerificationInfoForService:(id)a3 forURIs:(id)a4 localURI:(id)a5 withCompletion:(id)a6;
- (void)_forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5;
- (void)_fulfillOrFailPromiseSeal:(id)a3 basedOnIndex:(id)a4 KTResult:(unint64_t)a5 ktLoggableDatas:(id)a6 optedIn:(BOOL)a7 error:(id)a8;
- (void)_handleKTCDPStatusUpdate:(id)a3;
- (void)_insertTrustedDeviceToKVS:(id)a3 withMetadata:(id)a4;
- (void)_kickPeerVerificationForURIs:(id)a3 localURI:(id)a4 service:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7;
- (void)_mutateSuccessfulSyncIndicatorOnKTLoggableDatas:(id)a3 forIndex:(id)a4;
- (void)_notifyClientOfKTVerifierResults:(id)a3 forService:(id)a4;
- (void)_presentInternalVerificationAlertWithText:(id)a3;
- (void)_removeObjectsForKeysFromKVS:(id)a3;
- (void)_submitMetricForTrustedDeviceEnrollmentWithKVSResult:(id)a3 kvsSyncTimeInterval:(double)a4;
- (void)_submitMetricsForTrustedDeviceEnrollmentWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6;
- (void)_submitMetricsForTrustedDeviceVerificationWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6 index:(id)a7 entries:(id)a8;
- (void)cacheClearRequest:(id)a3;
- (void)checkOptInEligibilityForApplication:(id)a3 andFetchSelfVerificationRequestIDWithCompletion:(id)a4;
- (void)clearCacheAndUpdatePeersForService:(id)a3;
- (void)clearTransparencyCacheForService:(id)a3 peerURI:(id)a4;
- (void)currentPeerVerificationResultsForURIVerificationMap:(id)a3 forService:(id)a4 withCompletion:(id)a5;
- (void)fetchCurrentDeviceKVSKey:(id)a3;
- (void)fetchKTCDPStatus:(id)a3;
- (void)fetchKTRegistrationStatusWithCompletion:(id)a3;
- (void)fetchLocalDeviceTrustCircleEligibilityWithCompletion:(id)a3;
- (void)fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:(id)a3;
- (void)fetchPeerVerificationInfoForApplication:(id)a3 forURIs:(id)a4 withCompletion:(id)a5;
- (void)fetchSelfVerificationInfoForApplication:(id)a3 withCompletion:(id)a4;
- (void)forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5;
- (void)getCurrentRegistrationStateWithCompletion:(id)a3;
- (void)getOptInStatesForKTApplications:(id)a3 withCompletion:(id)a4;
- (void)healSelfForApplication:(id)a3 withHealableErrors:(id)a4 withCompletion:(id)a5;
- (void)initiateKTQueryForUris:(id)a3 service:(id)a4 withCompletion:(id)a5;
- (void)kickPeerVerificationForURIs:(id)a3 service:(id)a4 localURI:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7;
- (void)nukeKeyTransparencyStateWithCompletion:(id)a3;
- (void)peerVerificationFinishedWithResults:(id)a3;
- (void)registrationDataNeedsUpdate;
- (void)removeAllKVSEntries;
- (void)repairKVSDeviceEntryIfNeeded;
- (void)reportAccountKeyFetchMetricForService:(id)a3 withSuccess:(BOOL)a4 isAccountMismatch:(BOOL)a5 withError:(id)a6;
- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4;
- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4;
- (void)setCacheClearRateLimiterByService:(id)a3;
- (void)setKickPeerVerificationDate:(id)a3;
- (void)setMostRecentKTCDPAccountStatus:(int64_t)a3;
- (void)setRegisterUpdateRateLimiter:(id)a3;
- (void)setSelfHealRateLimiter:(id)a3;
- (void)updateCurrentDeviceInKVS:(id)a3;
- (void)updateKVSWithTrustedDevices:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSKeyTransparencyVerifier

+ (IDSKeyTransparencyVerifier)sharedInstance
{
  if (qword_100A4CA50 != -1) {
    dispatch_once(&qword_100A4CA50, &stru_10098CD50);
  }
  v2 = (void *)qword_100A4CA58;

  return (IDSKeyTransparencyVerifier *)v2;
}

- (IDSKeyTransparencyVerifier)init
{
  v3 = objc_alloc_init(IDSKeyTransparencyPolicy);
  v4 = +[IDSRegistrationKeyManager sharedInstance];
  v5 = objc_alloc_init(IDSKeyTransparencyRegistrationDataSource);
  if ([(IDSKeyTransparencyPolicy *)v3 isKeyTransparencyEnabled])
  {
    v33 = self;
    v34 = v5;
    v35 = v4;
    id v6 = objc_alloc((Class)KTVerifier);
    uint64_t v7 = kKTApplicationIdentifierIDS;
    id v8 = [v6 initWithApplication:kKTApplicationIdentifierIDS];
    id v9 = objc_alloc((Class)KTVerifier);
    uint64_t v10 = kKTApplicationIdentifierIDSFaceTime;
    id v11 = [v9 initWithApplication:kKTApplicationIdentifierIDSFaceTime];
    id v12 = objc_alloc((Class)KTVerifier);
    uint64_t v13 = kKTApplicationIdentifierIDSMultiplex;
    id v14 = [v12 initWithApplication:kKTApplicationIdentifierIDSMultiplex];
    uint64_t v15 = IDSiMessageKeyTransparencyService;
    uint64_t v16 = IDSFaceTimeMultiKeyTransparencyService;
    v40[0] = IDSiMessageKeyTransparencyService;
    v40[1] = IDSFaceTimeMultiKeyTransparencyService;
    id v32 = v8;
    v41[0] = v8;
    v41[1] = v11;
    v36 = v14;
    v37 = v11;
    uint64_t v17 = IDSMultiplex1KeyTransparencyService;
    v40[2] = IDSMultiplex1KeyTransparencyService;
    v41[2] = v14;
    v18 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
    v19 = [IDSCloudKitKeyTransparencyStore alloc];
    v20 = im_primary_queue();
    v21 = [(IDSCloudKitKeyTransparencyStore *)v19 initWithQueue:v20];

    v38[0] = v15;
    id v22 = [objc_alloc((Class)KTOptInManager) initWithApplication:v7];
    v39[0] = v22;
    v38[1] = v16;
    id v23 = [objc_alloc((Class)KTOptInManager) initWithApplication:v10];
    v39[1] = v23;
    v38[2] = v17;
    id v24 = [objc_alloc((Class)KTOptInManager) initWithApplication:v13];
    v39[2] = v24;
    v25 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];

    if (_os_feature_enabled_impl())
    {
      v26 = +[NSNotificationCenter defaultCenter];
      self = v33;
      [v26 addObserver:v33 selector:"_handleKTCDPStatusUpdate:" name:@"TransparencyAccountStatusChanged" object:0];

      v5 = v34;
      v4 = v35;
    }
    else
    {
      v5 = v34;
      v4 = v35;
      self = v33;
    }
    v27 = v32;
  }
  else
  {
    v27 = 0;
    v36 = 0;
    v37 = 0;
    v18 = 0;
    v25 = 0;
    v21 = 0;
  }
  if (CUTIsInternalInstall())
  {
    v28 = +[IDSRTCLogger loggerWithCategory:4000];
  }
  else
  {
    v28 = 0;
  }
  v29 = +[IDSKTAnalyticsLogger logger];
  v30 = [(IDSKeyTransparencyVerifier *)self initWithPolicy:v3 serviceToVerifier:v18 keyManager:v4 store:v21 registrationDataSource:v5 internalMetricLogger:v28 productionMetricLogger:v29 serviceToKTOptInManager:v25];

  return v30;
}

- (IDSKeyTransparencyVerifier)initWithPolicy:(id)a3 serviceToVerifier:(id)a4 keyManager:(id)a5 store:(id)a6 registrationDataSource:(id)a7 internalMetricLogger:(id)a8 productionMetricLogger:(id)a9 serviceToKTOptInManager:(id)a10
{
  id v28 = a3;
  id v29 = a4;
  id v30 = a5;
  id v31 = a6;
  id v32 = a7;
  id v33 = a8;
  id v34 = a9;
  id v17 = a10;
  v38.receiver = self;
  v38.super_class = (Class)IDSKeyTransparencyVerifier;
  v18 = [(IDSKeyTransparencyVerifier *)&v38 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_policy, a3);
    objc_storeStrong((id *)&v19->_keyManager, a5);
    objc_storeStrong((id *)&v19->_serviceToVerifier, a4);
    objc_storeStrong((id *)&v19->_serviceToOptInManager, a10);
    objc_storeStrong((id *)&v19->_keyTransparencyStore, a6);
    objc_storeStrong((id *)&v19->_registrationDataSource, a7);
    objc_storeStrong((id *)&v19->_internalMetricLogger, a8);
    objc_storeStrong((id *)&v19->_productionMetricLogger, a9);
    kickPeerVerificationDate = v19->_kickPeerVerificationDate;
    v19->_kickPeerVerificationDate = 0;

    v21 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      KTVerifier = v19->_KTVerifier;
      keyTransparencyStore = v19->_keyTransparencyStore;
      internalMetricLogger = v19->_internalMetricLogger;
      productionMetricLogger = v19->_productionMetricLogger;
      *(_DWORD *)buf = 138413570;
      *(void *)&buf[4] = KTVerifier;
      __int16 v40 = 2112;
      CFStringRef v41 = @"com.apple.ids";
      __int16 v42 = 2112;
      uint64_t v43 = IDSiMessageKeyTransparencyService;
      __int16 v44 = 2112;
      v45 = keyTransparencyStore;
      __int16 v46 = 2112;
      v47 = internalMetricLogger;
      __int16 v48 = 2112;
      v49 = productionMetricLogger;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Initialized IDSKeyTransparencyVerifier { KTVerifier: %@, application: %@, service: %@, keyTransparencyStore: %@, internalMetricLogger: %@, productionMetricLogger: %@ }", buf, 0x3Eu);
    }

    [(IDSKeyTransparencyVerifier *)v19 _presentInternalVerificationAlertWithText:@"🔐 KT initialized"];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v19);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100410F28;
    v35[3] = &unk_10097E518;
    objc_copyWeak(&v37, (id *)buf);
    v36 = v19;
    v26 = im_primary_queue();
    sub_1003319E8(v35, @"IDS-KT-List", (uint64_t)v26);

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
  }

  return v19;
}

- (IDSPeerIDManager)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance];
}

- (IDSDAccountController)accountController
{
  return +[IDSDAccountController sharedInstance];
}

- (IDSDServiceController)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

- (IDSCurrentServerTime)serverTime
{
  return +[IDSCurrentServerTime sharedInstance];
}

- (IDSPushHandler)pushHandler
{
  return +[IDSPushHandler sharedInstance];
}

- (IDSRateLimiter)selfHealRateLimiter
{
  selfHealRateLimiter = self->_selfHealRateLimiter;
  if (!selfHealRateLimiter)
  {
    v4 = (IDSRateLimiter *)[objc_alloc((Class)IDSRateLimiter) initWithLimit:3 timeLimit:18000.0];
    v5 = self->_selfHealRateLimiter;
    self->_selfHealRateLimiter = v4;

    selfHealRateLimiter = self->_selfHealRateLimiter;
  }

  return selfHealRateLimiter;
}

- (IDSRateLimiter)registerUpdateRateLimiter
{
  registerUpdateRateLimiter = self->_registerUpdateRateLimiter;
  if (!registerUpdateRateLimiter)
  {
    id v4 = objc_alloc((Class)IDSRateLimiter);
    unint64_t v5 = [(IDSKeyTransparencyVerifier *)self ktRegisterUpdateRequestLimit];
    [(IDSKeyTransparencyVerifier *)self ktRegisterUpdateLimitTime];
    id v6 = (IDSRateLimiter *)objc_msgSend(v4, "initWithLimit:timeLimit:", v5);
    uint64_t v7 = self->_registerUpdateRateLimiter;
    self->_registerUpdateRateLimiter = v6;

    registerUpdateRateLimiter = self->_registerUpdateRateLimiter;
  }

  return registerUpdateRateLimiter;
}

- (IDSRegistrationReasonTracker)registrationReasonTracker
{
  return +[IDSRegistrationReasonTracker sharedInstance];
}

+ (BOOL)isKeyTransparencyEnabled
{
  v2 = objc_alloc_init(IDSKeyTransparencyPolicy);
  unsigned __int8 v3 = [(IDSKeyTransparencyPolicy *)v2 isKeyTransparencyEnabled];

  return v3;
}

+ (id)keyTransparencyVersionNumberForServiceType:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(IDSKeyTransparencyPolicy);
  unsigned int v5 = [(IDSKeyTransparencyPolicy *)v4 isKeyTransparencyEnabledForServiceType:v3];

  if (v5)
  {
    id v6 = _IDSKeyTransparencyVersionNumber();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isDeviceAccountStateKeyTransparencyEligible
{
  id v3 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned int v4 = [v3 isKeyTransparencyEnabled];

  if (!v4) {
    return 0;
  }
  unsigned int v5 = [(IDSKeyTransparencyVerifier *)self registrationDataSource];
  unsigned __int8 v6 = [v5 isiCloudSignedIn];

  return v6;
}

- (void)fetchLocalDeviceTrustCircleEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabled];

  if (v6)
  {
    uint64_t v7 = [(IDSKeyTransparencyVerifier *)self keyTransparencyStore];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004116D0;
    v9[3] = &unk_100988078;
    v9[4] = self;
    id v10 = v4;
    [v7 fetchAccountEligibilityForDeviceToDeviceEncryptionWithCompletion:v9];
  }
  else if (v4)
  {
    id v8 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-1000 debugDescription:@"Key transparency is not enabled" underlyingError:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

- (void)fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabled];

  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100411878;
    v8[3] = &unk_100980B08;
    v8[4] = self;
    id v9 = v4;
    [(IDSKeyTransparencyVerifier *)self fetchLocalDeviceTrustCircleEligibilityWithCompletion:v8];
  }
  else if (v4)
  {
    uint64_t v7 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-1000 debugDescription:@"Key transparency is not enabled" underlyingError:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (id)fetchKTEligibleServices
{
  v2 = [(IDSKeyTransparencyVerifier *)self registrationDataSource];
  id v3 = [v2 currentLocalKeyTransparencyEligibleServiceIdentifiers];

  return v3;
}

- (id)transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5 localURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = im_primary_base_queue();
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = [(IDSKeyTransparencyVerifier *)self policy];
  uint64_t v16 = [v10 serviceIdentifier];
  unsigned __int8 v17 = [v15 isKeyTransparencyEnabledForServiceIdentifier:v16];

  if (v17)
  {
    if ([(IDSKeyTransparencyVerifier *)self isDeviceAccountStateKeyTransparencyEligible])
    {
      v18 = [(IDSKeyTransparencyVerifier *)self registrationDataSource];
      v19 = [v10 serviceIdentifier];
      v20 = [v18 currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:v19];
      v21 = [v13 prefixedURI];
      if ([v20 containsObject:v21])
      {

LABEL_14:
        v26 = [v11 transparencyStatus];
        id v27 = [v26 integerValue];

        if (v27) {
          CFStringRef v28 = @"☠️";
        }
        else {
          CFStringRef v28 = @"✅";
        }
        id v29 = [v10 URI];
        id v30 = [v11 transparencyStatus];
        id v31 = +[NSString stringWithFormat:@"🔍 🔓 %@\nKT query\n{ %@, %@ }", v28, v29, v30];
        [(IDSKeyTransparencyVerifier *)self _presentInternalVerificationAlertWithText:v31];

        id v23 = [(IDSKeyTransparencyVerifier *)self _transparencyTicketForQueryResultsWithIndex:v10 verificationState:v11 entries:v12];
        goto LABEL_10;
      }
      v25 = [(IDSKeyTransparencyVerifier *)self policy];
      unsigned __int8 v34 = [v25 isKeyTransparencyPeerVerificationAllowedWithoutEnrollment];

      if (v34) {
        goto LABEL_14;
      }
      id v22 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = [v10 serviceIdentifier];
        id v33 = [v13 prefixedURI];
        *(_DWORD *)buf = 138412546;
        v36 = v32;
        __int16 v37 = 2112;
        objc_super v38 = v33;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Local URI is not enrolled in key transparency -- not not requesting transparency ticket { serviceIdentifier: %@, localURI: %@ }", buf, 0x16u);
      }
    }
    else
    {
      id v22 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_10072463C();
      }
    }
  }
  else
  {
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100724670(v10);
    }
  }

  id v23 = 0;
LABEL_10:

  return v23;
}

- (void)kickPeerVerificationForURIs:(id)a3 service:(id)a4 localURI:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, void *, void *))a7;
  uint64_t v16 = im_primary_base_queue();
  dispatch_assert_queue_V2(v16);

  unsigned __int8 v17 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v18 = [v17 isKeyTransparencyEnabledForServiceIdentifier:v13];

  if (v18)
  {
    if (![(IDSKeyTransparencyVerifier *)self isDeviceAccountStateKeyTransparencyEligible])
    {
      v25 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_1007246F4();
      }

      id v23 = self;
      uint64_t v24 = -1100;
      goto LABEL_11;
    }
    v19 = [(IDSKeyTransparencyVerifier *)self registrationDataSource];
    v20 = [v19 currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:v13];
    v21 = [v14 prefixedURI];
    if ([v20 containsObject:v21])
    {

LABEL_14:
      [(IDSKeyTransparencyVerifier *)self _kickPeerVerificationForURIs:v12 localURI:v14 service:v13 fetchNow:v8 withCompletion:v15];
      goto LABEL_12;
    }
    id v27 = [(IDSKeyTransparencyVerifier *)self policy];
    unsigned __int8 v28 = [v27 isKeyTransparencyPeerVerificationAllowedWithoutEnrollment];

    if (v28) {
      goto LABEL_14;
    }
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Local URI is not enrolled in key transparency -- not kicking peer verification { service: %@, localURI: %@ }", buf, 0x16u);
    }
  }
  else
  {
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100724728();
    }
  }

  id v23 = self;
  uint64_t v24 = -1000;
LABEL_11:
  v26 = [(IDSKeyTransparencyVerifier *)v23 _clientErrorWithCode:v24 debugDescription:@"Key transparency is not enabled" underlyingError:0];
  v15[2](v15, &__NSArray0__struct, v26);

LABEL_12:
}

- (void)_kickPeerVerificationForURIs:(id)a3 localURI:(id)a4 service:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v12 count])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100412160;
    v17[3] = &unk_10098CDD8;
    id v20 = v15;
    v17[4] = self;
    id v18 = v12;
    id v19 = v14;
    BOOL v21 = a6;
    [(IDSKeyTransparencyVerifier *)self _fetchVerificationInfoForService:v19 forURIs:v18 localURI:v13 withCompletion:v17];
  }
  else
  {
    uint64_t v16 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-1300 debugDescription:@"Empty uris for _kickPeerVerificationForURIs." underlyingError:0];
    (*((void (**)(id, void *, void *))v15 + 2))(v15, &__NSArray0__struct, v16);
  }
}

- (void)initiateKTQueryForUris:(id)a3 service:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = im_primary_base_queue();
  dispatch_assert_queue_V2(v11);

  if ([v8 count])
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    id v13 = [(id)objc_opt_class() keyTransparencyURIPrefixForServiceIdentifier:v9];
    if (v13)
    {
      id v23 = v10;
      id v24 = v9;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v8;
      id v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          id v18 = 0;
          do
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v18) prefixedURI];
            id v20 = [v13 stringByAppendingString:v19];

            [v12 addObject:v20];
            id v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v16);
      }

      id v10 = v23;
      id v9 = v24;
    }
    BOOL v21 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v9];
    if (v21)
    {
      id v22 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v32 = v8;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Calling in to start Transparency query { uris: %@ service: %@ }", buf, 0x16u);
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100412660;
      v25[3] = &unk_100981C88;
      id v26 = v10;
      [v21 initiateQueryForUris:v12 completionBlock:v25];
    }
  }
  else
  {
    id v12 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-1200 debugDescription:@"Empty uris for initiateKTQueryForUris." underlyingError:0];
    (*((void (**)(id, id))v10 + 2))(v10, v12);
  }
}

- (id)transparencyTicketForRegistrationWithIndex:(id)a3 verificationState:(id)a4 entry:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = im_primary_base_queue();
  dispatch_assert_queue_V2(v11);

  id v12 = [(IDSKeyTransparencyVerifier *)self policy];
  id v13 = [v8 serviceIdentifier];
  unsigned __int8 v14 = [v12 isKeyTransparencyEnabledForServiceIdentifier:v13];

  if (v14)
  {
    if ([(IDSKeyTransparencyVerifier *)self isDeviceAccountStateKeyTransparencyEligible])
    {
      id v15 = [v9 transparencyStatus];
      id v16 = [v15 integerValue];

      if (v16) {
        CFStringRef v17 = @"☠️";
      }
      else {
        CFStringRef v17 = @"✅";
      }
      id v18 = [v8 URI];
      id v19 = [v9 transparencyStatus];
      id v20 = +[NSString stringWithFormat:@"✏️ 🔓 %@\nKT registration\n{ %@, %@ }", v17, v18, v19];
      [(IDSKeyTransparencyVerifier *)self _presentInternalVerificationAlertWithText:v20];

      BOOL v21 = [(IDSKeyTransparencyVerifier *)self _verifyKeyTransparencyOfRegisteredIndex:v8 verificationState:v9 entry:v10];
      goto LABEL_12;
    }
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10072463C();
    }
  }
  else
  {
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100724670(v8);
    }
  }

  BOOL v21 = 0;
LABEL_12:

  return v21;
}

- (id)_pruneTrustedDevice:(id)a3 givenEligibleServiceIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [IDSProtoKeyTransparencyTrustedDevice alloc];
  id v8 = [v6 data];
  id v9 = [(IDSProtoKeyTransparencyTrustedDevice *)v7 initWithData:v8];

  id v10 = [v6 trustedServices];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10041299C;
  v15[3] = &unk_10098CE00;
  id v16 = v5;
  id v11 = v5;
  id v12 = objc_msgSend(v10, "__imArrayByFilteringWithBlock:", v15);
  id v13 = [v12 mutableCopy];

  [(IDSProtoKeyTransparencyTrustedDevice *)v9 setTrustedServices:v13];

  return v9;
}

- (id)currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = im_primary_base_queue();
  dispatch_assert_queue_V2(v8);

  id v9 = [(IDSKeyTransparencyVerifier *)self policy];
  id v10 = [v6 serviceIdentifier];
  unsigned __int8 v11 = [v9 isKeyTransparencyEnabledForServiceIdentifier:v10];

  if (v11)
  {
    if ([(IDSKeyTransparencyVerifier *)self isDeviceAccountStateKeyTransparencyEligible])
    {
      id v12 = [(IDSKeyTransparencyVerifier *)self _currentPeerVerificationResultsForQueriedIndex:v6 ticket:v7];
      goto LABEL_11;
    }
    CFStringRef v17 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1007247F8();
    }

    CFStringRef v14 = @"The local device is not eligible for key transparency due to account status";
    id v15 = self;
    uint64_t v16 = -1100;
  }
  else
  {
    id v13 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10072482C(v6);
    }

    CFStringRef v14 = @"Key transparency is not enabled";
    id v15 = self;
    uint64_t v16 = -1000;
  }
  id v18 = [(IDSKeyTransparencyVerifier *)v15 _clientErrorWithCode:v16 debugDescription:v14 underlyingError:0];
  id v12 = +[CUTUnsafePromise failedPromiseWithError:v18];

LABEL_11:

  return v12;
}

- (id)currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = im_primary_base_queue();
  dispatch_assert_queue_V2(v8);

  id v9 = [(IDSKeyTransparencyVerifier *)self policy];
  id v10 = [v6 serviceIdentifier];
  unsigned __int8 v11 = [v9 isKeyTransparencyEnabledForServiceIdentifier:v10];

  if (v11)
  {
    if ([(IDSKeyTransparencyVerifier *)self isDeviceAccountStateKeyTransparencyEligible])
    {
      id v12 = [(IDSKeyTransparencyVerifier *)self _currentVerificationResultsForRegisteredIndex:v6 ticket:v7];
      goto LABEL_11;
    }
    CFStringRef v17 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1007248B0();
    }

    CFStringRef v14 = @"The local device is not eligible for key transparency due to account status";
    id v15 = self;
    uint64_t v16 = -1100;
  }
  else
  {
    id v13 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1007248E4(v6);
    }

    CFStringRef v14 = @"Key transparency is not enabled";
    id v15 = self;
    uint64_t v16 = -1000;
  }
  id v18 = [(IDSKeyTransparencyVerifier *)v15 _clientErrorWithCode:v16 debugDescription:v14 underlyingError:0];
  id v12 = +[CUTUnsafePromise failedPromiseWithError:v18];

LABEL_11:

  return v12;
}

- (void)forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  unsigned __int8 v11 = im_primary_base_queue();
  dispatch_assert_queue_V2(v11);

  id v12 = [(IDSKeyTransparencyVerifier *)self policy];
  id v13 = [v8 serviceIdentifier];
  unsigned __int8 v14 = [v12 isKeyTransparencyEnabledForServiceIdentifier:v13];

  if (v14)
  {
    [(IDSKeyTransparencyVerifier *)self _forceVerificationWithIndex:v8 ticket:v9 completion:v10];
  }
  else
  {
    id v15 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100724968(v8);
    }

    if (v10)
    {
      uint64_t v16 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-1000 debugDescription:@"Key transparency is not enabled" underlyingError:0];
      v10[2](v10, v16);
    }
  }
}

- (void)nukeKeyTransparencyStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Nuking KT verification state", buf, 2u);
  }

  id v6 = im_primary_base_queue();
  dispatch_assert_queue_V2(v6);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(IDSKeyTransparencyVerifier *)self serviceToVerifier];
  id v8 = [v7 allValues];

  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v12);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100413078;
        v15[3] = &unk_100989408;
        id v14 = v4;
        void v15[4] = self;
        id v16 = v14;
        [v13 clearState:v15];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)currentPeerVerificationResultsForURIVerificationMap:(id)a3 forService:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v13 = [v12 isKeyTransparencyEnabledForServiceIdentifier:v9];

  if (v13)
  {
    id v32 = v11;
    long long v29 = v10;
    group = dispatch_group_create();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v30 = v8;
    id v14 = v8;
    id v34 = [v14 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v43;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(v14);
          }
          uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          long long v17 = [(id)objc_opt_class() keyTransparencyURIPrefixForServiceIdentifier:v9];
          long long v18 = v17;
          if (v17)
          {
            long long v19 = [v17 stringByAppendingString:v16];
            long long v20 = self;
            id v21 = v9;
            id v22 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v9];
            id v23 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = [v14 objectForKey:v16];
              *(_DWORD *)buf = 138412546;
              id v47 = v19;
              __int16 v48 = 2112;
              v49 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Fetching verification status. { uri: %@, UUID: %@ }", buf, 0x16u);
            }
            dispatch_group_enter(group);
            v25 = [v14 objectForKey:v16];
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_1004135CC;
            void v38[3] = &unk_10098CE28;
            id v39 = v32;
            uint64_t v40 = v16;
            CFStringRef v41 = group;
            [v22 getValidatePeerResult:v19 uuid:v25 completionBlock:v38];

            id v9 = v21;
            self = v20;
          }
        }
        id v34 = [v14 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v34);
    }

    id v26 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004137C0;
    block[3] = &unk_10097E818;
    id v10 = v29;
    id v37 = v29;
    id v11 = v32;
    id v36 = v32;
    long long v27 = group;
    dispatch_group_notify(group, v26, block);

    id v8 = v30;
  }
  else
  {
    long long v28 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v9;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Key Transparency is disabled for service, not fetching peer verification results. { serviceIdentifier: %@ }", buf, 0xCu);
    }

    long long v27 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-1000 debugDescription:@"Key Transparency is not enabled." underlyingError:0];
    (*((void (**)(id, id, void *))v10 + 2))(v10, v11, v27);
  }
}

- (id)_transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v40 = v8;
    __int16 v41 = 2112;
    id v42 = v9;
    __int16 v43 = 2112;
    id v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing KT verification of query { index: %@, state: %@, entries: %@ }", buf, 0x20u);
  }

  id v12 = im_primary_base_queue();
  dispatch_assert_queue_V2(v12);

  unsigned __int8 v13 = [(IDSKeyTransparencyVerifier *)self _KTDatasForIDSKeyTransparencyEntries:v10];
  id v14 = objc_opt_class();
  id v15 = [v8 serviceIdentifier];
  uint64_t v16 = [v14 keyTransparencyURIPrefixForServiceIdentifier:v15];

  id v37 = v13;
  if (v16)
  {
    long long v17 = [v8 URI];
    long long v18 = [v17 prefixedURI];
    id v32 = v16;
    long long v19 = [v16 stringByAppendingString:v18];

    uint64_t v20 = [v8 accountKey];
    id v36 = v9;
    uint64_t v21 = [v9 transparencyBlob];
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100724A78((uint64_t)v19, v13);
    }
    id v35 = v10;

    id v23 = [v8 serviceIdentifier];
    id v24 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v23];

    id v38 = 0;
    uint64_t v33 = (void *)v21;
    id v34 = (void *)v20;
    v25 = [v24 validatePeerUri:v19 accountKey:v20 loggableDatas:v13 queryResponse:v21 error:&v38];
    id v26 = v38;
    long long v27 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = v19;
      __int16 v41 = 2112;
      id v42 = v26;
      __int16 v43 = 2112;
      id v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Finished requesting KT ticket for query { KTURI: %@, error: %@, ticket: %@ }", buf, 0x20u);
    }

    if (v26) {
      CFStringRef v28 = @"☠️";
    }
    else {
      CFStringRef v28 = @"✅";
    }
    long long v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v26 code]);
    id v30 = +[NSString stringWithFormat:@"🔍 🔐 %@\nKT peer-verify ticket\n{ %@, %@ }", v28, v19, v29];
    [(IDSKeyTransparencyVerifier *)self _presentInternalVerificationAlertWithText:v30];

    id v10 = v35;
    id v9 = v36;
    uint64_t v16 = v32;
  }
  else
  {
    long long v19 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1007249EC(v8, v19);
    }
    v25 = 0;
  }

  return v25;
}

- (id)_currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting KT verification results of query { index: %@, ticket: %@ }", buf, 0x16u);
  }

  id v9 = im_primary_base_queue();
  dispatch_assert_queue_V2(v9);

  id v10 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
  id v11 = objc_opt_class();
  id v12 = [v6 serviceIdentifier];
  unsigned __int8 v13 = [v11 keyTransparencyURIPrefixForServiceIdentifier:v12];

  id v14 = [v6 URI];

  if (v7 && v14)
  {
    if (v13)
    {
      id v15 = [v6 URI];
      uint64_t v16 = [v15 prefixedURI];
      long long v17 = [v13 stringByAppendingString:v16];

      long long v18 = [v6 serviceIdentifier];
      long long v19 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v18];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100413EDC;
      v26[3] = &unk_10098CE90;
      id v27 = v17;
      id v28 = v7;
      long long v29 = self;
      id v30 = v10;
      id v31 = v6;
      id v20 = v17;
      [v19 getValidatePeerResult:v20 uuid:v28 completionBlock:v26];

      goto LABEL_14;
    }
    id v23 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100724BB8(v6, v23);
    }

    CFStringRef v22 = @"Invalid index provided (unrecognized service identifier)";
  }
  else
  {
    uint64_t v21 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100724B14(v6, (uint64_t)v7, v21);
    }

    CFStringRef v22 = @"Peer verification requires non-nil URI and ticket";
  }
  long long v19 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-7000 debugDescription:v22 underlyingError:0];
  [v10 failWithError:v19];
LABEL_14:

  id v24 = [v10 promise];

  return v24;
}

- (void)_forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Forcing KT verification results of trusted devices results { index: %@, ticket: %@ }", buf, 0x16u);
  }

  id v12 = im_primary_base_queue();
  dispatch_assert_queue_V2(v12);

  unsigned __int8 v13 = objc_opt_class();
  id v14 = [v8 serviceIdentifier];
  id v15 = [v13 keyTransparencyURIPrefixForServiceIdentifier:v14];

  if (v15)
  {
    uint64_t v16 = [v8 URI];
    long long v17 = [v16 prefixedURI];
    long long v18 = [v15 stringByAppendingString:v17];

    long long v19 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Calling in to force KT validation { KTURI: %@ }", buf, 0xCu);
    }

    id v20 = [v8 serviceIdentifier];
    uint64_t v21 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v20];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10041438C;
    v24[3] = &unk_10098CEB8;
    id v25 = v18;
    id v26 = v9;
    id v27 = self;
    id v28 = v10;
    id v22 = v18;
    [v21 forceValidateUUID:v26 uri:v22 completionBlock:v24];

    goto LABEL_11;
  }
  id v23 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_100724C44(v8, v23);
  }

  if (v10)
  {
    uint64_t v21 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-7000 debugDescription:@"Invalid index provided (unrecognized service identifier)" underlyingError:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v21);
LABEL_11:
  }
}

- (id)_verifyKeyTransparencyOfRegisteredIndex:(id)a3 verificationState:(id)a4 entry:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = im_primary_base_queue();
  dispatch_assert_queue_V2(v11);

  id v12 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v40 = v8;
    __int16 v41 = 2112;
    id v42 = v9;
    __int16 v43 = 2112;
    id v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Performing KT verification of registration { index: %@, state: %@, entry: %@ }", buf, 0x20u);
  }

  unsigned __int8 v13 = [(IDSKeyTransparencyVerifier *)self _KTDataForIDSKeyTransparencyEntry:v10];
  id v14 = objc_opt_class();
  id v15 = [v8 serviceIdentifier];
  uint64_t v16 = [v14 keyTransparencyURIPrefixForServiceIdentifier:v15];

  id v37 = v13;
  if (v16)
  {
    long long v17 = [v8 URI];
    long long v18 = [v17 prefixedURI];
    id v32 = v16;
    long long v19 = [v16 stringByAppendingString:v18];

    uint64_t v20 = [v8 accountKey];
    id v36 = v9;
    uint64_t v21 = [v9 transparencyBlob];
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100724D5C((uint64_t)v19, v13);
    }
    id v35 = v10;

    id v23 = [v8 serviceIdentifier];
    id v24 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v23];

    id v38 = 0;
    id v33 = (void *)v21;
    __int16 v34 = (void *)v20;
    id v25 = [v24 validateEnrollmentUri:v19 accountKey:v20 loggableData:v13 insertResponse:v21 error:&v38];
    id v26 = v38;
    id v27 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = v19;
      __int16 v41 = 2112;
      id v42 = v26;
      __int16 v43 = 2112;
      id v44 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Finished requesting KT ticket for registration { KTURI: %@, error: %@, ticket: %@ }", buf, 0x20u);
    }

    if (v26) {
      CFStringRef v28 = @"☠️";
    }
    else {
      CFStringRef v28 = @"✅";
    }
    long long v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v26 code]);
    id v30 = +[NSString stringWithFormat:@"✏️ 🔐 %@\nKT enroll ticket\n{ %@, %@ }", v28, v19, v29];
    [(IDSKeyTransparencyVerifier *)self _presentInternalVerificationAlertWithText:v30];

    id v10 = v35;
    id v9 = v36;
    uint64_t v16 = v32;
  }
  else
  {
    long long v19 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100724CD0(v8, v19);
    }
    id v25 = 0;
  }

  return v25;
}

- (id)_currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting KT verification results of registration { index: %@, ticket: %@ }", buf, 0x16u);
  }

  id v9 = im_primary_base_queue();
  dispatch_assert_queue_V2(v9);

  id v10 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
  id v11 = objc_opt_class();
  id v12 = [v6 serviceIdentifier];
  unsigned __int8 v13 = [v11 keyTransparencyURIPrefixForServiceIdentifier:v12];

  if (v13)
  {
    id v14 = [v6 URI];
    id v15 = [v14 prefixedURI];
    uint64_t v16 = [v13 stringByAppendingString:v15];

    long long v17 = [v6 serviceIdentifier];
    long long v18 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v17];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100414B98;
    v23[3] = &unk_10098CEE0;
    id v24 = v16;
    id v25 = v7;
    id v26 = self;
    id v27 = v10;
    id v28 = v6;
    id v19 = v16;
    [v18 validateEnrollmentResult:v19 uuid:v25 completionBlock:v23];
  }
  else
  {
    uint64_t v20 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100724CD0(v6, v20);
    }

    long long v18 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-7000 debugDescription:@"Invalid index provided (unrecognized service identifier)" underlyingError:0];
    [v10 failWithError:v18];
  }

  uint64_t v21 = [v10 promise];

  return v21;
}

- (void)_fulfillOrFailPromiseSeal:(id)a3 basedOnIndex:(id)a4 KTResult:(unint64_t)a5 ktLoggableDatas:(id)a6 optedIn:(BOOL)a7 error:(id)a8
{
  BOOL v9 = a7;
  id v19 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = [(IDSKeyTransparencyVerifier *)self _clientErrorForKTResult:a5 underlyingError:a8];
  if (v16)
  {
    [v19 failWithError:v16];
  }
  else
  {
    id v17 = objc_alloc_init((Class)IDSKTVerificationResult);
    long long v18 = [(IDSKeyTransparencyVerifier *)self _IDSEndpointTransparencyStatesForKTLoggableDatas:v15 index:v14];
    [v17 setEndpointTransparencyStates:v18];
    [v17 setOptedIn:v9];
    [v19 fulfillWithValue:v17];
  }
}

- (void)_mutateSuccessfulSyncIndicatorOnKTLoggableDatas:(id)a3 forIndex:(id)a4
{
  id v5 = a3;
  id v32 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v5;
  id v30 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v42;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v8 = [v32 URI];
        BOOL v9 = [(IDSKeyTransparencyVerifier *)self peerIDManager];
        id v47 = v8;
        id v10 = +[NSArray arrayWithObjects:&v47 count:1];
        id v11 = [v32 serviceIdentifier];
        id v12 = [v9 endpointsForURIs:v10 service:v11 fromURI:v8];

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        unsigned __int8 v13 = [v12 objectForKeyedSubscript:v8];
        id v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v38;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v38 != v15) {
                objc_enumerationMutation(v13);
              }
              id v17 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
              if ([v17 mismatchedAccountFlag])
              {
                LODWORD(v14) = [v17 mismatchedAccountFlag];
                goto LABEL_16;
              }
            }
            id v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v18 = [v12 objectForKeyedSubscript:v8];
        id v19 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v34;
          while (2)
          {
            for (k = 0; k != v19; k = (char *)k + 1)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v18);
              }
              id v22 = *(void **)(*((void *)&v33 + 1) + 8 * (void)k);
              if ([v22 ktCapableFlag])
              {
                id v19 = [v22 ktCapableFlag];
                goto LABEL_26;
              }
            }
            id v19 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
LABEL_26:

        id v23 = [(IDSKeyTransparencyVerifier *)self registrationDataSource];
        id v24 = [v32 serviceIdentifier];
        id v25 = [v7 deviceID];
        id v26 = [v23 expectedRemoteKeyTransparencyEligibilityForServiceIdentifier:v24 pushToken:v25];

        if (v26 == (id)1) {
          uint64_t v27 = v14 ^ 1;
        }
        else {
          uint64_t v27 = 0;
        }
        [v7 setSuccessfulSync:v27];
        [v7 setKtCapable:v19];
      }
      id v30 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v30);
  }
}

- (id)_clientErrorForKTResult:(unint64_t)a3 underlyingError:(id)a4
{
  id v6 = a4;
  id v7 = 0;
  switch(a3)
  {
    case 0uLL:
      CFStringRef v8 = @"Transparency verification resulted in a failure";
      goto LABEL_6;
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      CFStringRef v8 = @"Transparency results are currently pending";
      BOOL v9 = self;
      uint64_t v10 = -6100;
      goto LABEL_7;
    case 3uLL:
      CFStringRef v8 = @"Transparency verification resulted in a failure which was ignored";
      goto LABEL_6;
    default:
      CFStringRef v8 = @"Received unknown verification result";
LABEL_6:
      BOOL v9 = self;
      uint64_t v10 = -6000;
LABEL_7:
      id v7 = [(IDSKeyTransparencyVerifier *)v9 _clientErrorWithCode:v10 debugDescription:v8 underlyingError:v6];
LABEL_8:

      return v7;
  }
}

- (void)checkOptInEligibilityForApplication:(id)a3 andFetchSelfVerificationRequestIDWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v9 = [v8 isKeyTransparencyEnabled];

  if ((v9 & 1) == 0)
  {
    long long v36 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }

    uint64_t v37 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-1000 userInfo:0];
    goto LABEL_22;
  }
  if (![v6 isEqualToString:kKTApplicationIdentifierIDS]
    || (id v10 = IDSiMessageKeyTransparencyService) == 0)
  {
    long long v38 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100724DF0();
    }

    uint64_t v37 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-8001 debugDescription:@"Invalid Service for Opt in" underlyingError:0];
LABEL_22:
    id v11 = (void *)v37;
    (*((void (**)(id, void, void, uint64_t))v7 + 2))(v7, 0, 0, v37);
    goto LABEL_23;
  }
  id v11 = v10;
  id v12 = [(IDSKeyTransparencyRegistrationDataSource *)self->_registrationDataSource currentLocalKeyTransparencyEligibleServiceIdentifiers];
  unsigned int v13 = [v12 containsObject:v11];

  if (v13)
  {
    long long v43 = (void (**)(void, void, void, void))v7;
    id v44 = v6;
    id v14 = [(IDSKeyTransparencyVerifier *)self accountController];
    uint64_t v15 = [(IDSKeyTransparencyVerifier *)self serviceController];
    long long v42 = v11;
    uint64_t v16 = [v15 serviceWithIdentifier:v11];
    id v17 = [v14 accountsOnService:v16];

    id v18 = objc_alloc_init((Class)NSMutableSet);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v49;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v49 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = [*(id *)(*((void *)&v48 + 1) + 8 * i) registration];
          id v25 = [v24 uris];
          id v26 = objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_10098CF00);

          [v18 addObjectsFromArray:v26];
        }
        id v21 = [v19 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v21);
    }

    uint64_t v27 = [v18 allObjects];
    id v28 = +[IDSQueryUtilities accountToQueryFrom:v19 fromURI:0 destinationURIs:v27 allowLocalAccount:0];

    uint64_t v29 = +[IDSQueryUtilities URIToQueryFrom:v28 withPreferredFromURI:0];
    id v30 = +[IDSFoundationLog KeyTransparency];
    __int16 v31 = v30;
    if (v29)
    {
      id v7 = v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Performing hard query for KT opt in.", buf, 2u);
      }

      id v32 = [(IDSKeyTransparencyVerifier *)self peerIDManager];
      long long v33 = [v18 allObjects];
      long long v34 = [v28 _registrationCert];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100415834;
      v45[3] = &unk_10098CF28;
      __int16 v46 = v43;
      LOBYTE(v41) = 0;
      id v11 = v42;
      [v32 startQueryForURIs:v33 fromIdentity:v34 fromURI:v29 fromService:v42 forSending:0 forRefresh:1 isForced:v41 reason:@"KTOptIn" completionBlock:v45];

      long long v35 = v46;
    }
    else
    {
      id v7 = v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100724E58();
      }

      long long v35 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-8002 userInfo:0];
      ((void (**)(void, void, void, void *))v43)[2](v43, 0, 0, v35);
      id v11 = v42;
    }

    id v6 = v44;
  }
  else
  {
    long long v39 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100724E8C();
    }

    long long v40 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-8003 debugDescription:@"Mismatched Account" underlyingError:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v40);
  }
LABEL_23:
}

- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  CFStringRef v8 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v9 = [v8 isKeyTransparencyEnabled];

  if ((v9 & 1) == 0)
  {
    uint64_t v15 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }

    id v16 = objc_alloc((Class)IDSKTOptInResult);
    id v12 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-1000 userInfo:0];
    id v17 = [v16 initWithSuccess:0 optedInOutURIs:0 serverSMTByURI:0 error:v12];
    goto LABEL_12;
  }
  if (![v6 count])
  {
    id v18 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100724EC0();
    }

    id v19 = objc_alloc((Class)IDSKTOptInResult);
    id v12 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-8000 debugDescription:@"No kt applications provided for opt in status update." underlyingError:0];
    id v17 = [v19 initWithSuccess:0 serverProvidedSMT:0 error:v12];
LABEL_12:
    id v13 = v17;
    v7[2](v7, v17);
    goto LABEL_17;
  }
  uint64_t v10 = kKTApplicationIdentifierIDS;
  id v11 = [v6 objectForKey:kKTApplicationIdentifierIDS];

  if (!v11)
  {
    id v20 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100724EF4();
    }

    id v21 = objc_alloc((Class)IDSKTOptInResult);
    id v14 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-8000 debugDescription:@"No kt applications provided for opt in status update." underlyingError:0];
    id v22 = [v21 initWithSuccess:0 serverProvidedSMT:0 error:v14];
    v7[2](v7, v22);

    id v12 = 0;
    id v13 = 0;
    goto LABEL_16;
  }
  id v12 = IDSiMessageKeyTransparencyService;
  id v13 = [v6 objectForKey:v10];
  if (v12)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100415B64;
    v23[3] = &unk_10098CF78;
    id v12 = v12;
    id v24 = v12;
    uint64_t v27 = v7;
    id v25 = self;
    id v13 = v13;
    id v26 = v13;
    [(IDSKeyTransparencyVerifier *)self fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:v23];

    id v14 = v24;
LABEL_16:
  }
LABEL_17:
}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  CFStringRef v8 = [v6 applicationsToOptInStatusData];

  if (v8)
  {
    unsigned __int8 v9 = [v6 applicationsToOptInStatusData];
    uint64_t v10 = kKTApplicationIdentifierIDS;
    id v11 = [v9 objectForKey:kKTApplicationIdentifierIDS];

    if (!v11)
    {
      __int16 v31 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_100724EF4();
      }

      id v32 = objc_alloc((Class)IDSKTOptInResult);
      id v28 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-8000 debugDescription:@"No kt applications provided for opt in status update." underlyingError:0];
      id v33 = [v32 initWithSuccess:0 serverProvidedSMT:0 error:v28];
      v7[2](v7, v33);

      id v24 = 0;
      id v13 = 0;
      goto LABEL_27;
    }
    id v44 = v7;
    id v43 = IDSiMessageKeyTransparencyService;
    id v12 = [v6 applicationsToOptInStatusData];
    id v13 = [v12 objectForKey:v10];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    id v14 = [v6 applicationsToOptInStatusData];
    uint64_t v15 = [v14 allKeys];

    id v16 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v54;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v54 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          id v21 = [v6 applicationsToOptInStatusData];
          id v22 = [v21 objectForKey:v20];

          id v23 = [(id)objc_opt_class() keyTransparencyServiceIdentifierForTransparencyApplication:v20];
          [v22 setServiceIdentifier:v23];
        }
        id v17 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v17);
    }

    id v24 = v43;
    if (v43)
    {
      id v25 = [v13 optInStatus];
      unsigned int v26 = [v25 BOOLValue];

      id v7 = v44;
      if (v26)
      {
        uint64_t v27 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v58 = v43;
          __int16 v59 = 2112;
          id v60 = v13;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Trying to send opt in. {serviceIdentifier: %@, optInOutStatusData: %@}", buf, 0x16u);
        }

        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100416528;
        v48[3] = &unk_10098CF78;
        id v24 = v43;
        id v49 = v24;
        v52 = v44;
        long long v50 = self;
        id v51 = v6;
        [(IDSKeyTransparencyVerifier *)self fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:v48];

        id v28 = v49;
      }
      else
      {
        long long v34 = [(IDSKeyTransparencyVerifier *)self accountController];
        long long v35 = [(IDSKeyTransparencyVerifier *)self serviceController];
        long long v36 = [v35 serviceWithIdentifier:v43];
        id v28 = [v34 appleIDAccountOnService:v36];

        if (!v28
          || (int)[v28 registrationStatus] < 3
          || ([v28 primaryRegistration],
              uint64_t v37 = objc_claimAutoreleasedReturnValue(),
              [v37 registrationCert],
              long long v38 = objc_claimAutoreleasedReturnValue(),
              v38,
              v37,
              !v38))
        {
          long long v39 = [(IDSKeyTransparencyVerifier *)self accountController];
          long long v40 = [(IDSKeyTransparencyVerifier *)self serviceController];
          uint64_t v41 = [v40 serviceWithIdentifier:IDSMultiplex1KeyTransparencyService];
          uint64_t v42 = [v39 appleIDAccountOnService:v41];

          id v28 = (void *)v42;
        }
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_1004168F0;
        v45[3] = &unk_10098CF50;
        void v45[4] = self;
        id v24 = v43;
        id v46 = v24;
        id v47 = v44;
        [v28 updateKTOptInStatusWithRequest:v6 withCompletion:v45];
      }
LABEL_27:

      goto LABEL_28;
    }
    id v7 = v44;
  }
  else
  {
    uint64_t v29 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No Public Account Key provided for optInOutRequest.", buf, 2u);
    }

    id v30 = objc_alloc((Class)IDSKTOptInResult);
    id v24 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-8000 debugDescription:@"No kt applications provided for opt in status update." underlyingError:0];
    id v13 = [v30 initWithSuccess:0 optedInOutURIs:0 serverSMTByURI:0 error:v24];
    v7[2](v7, v13);
  }
LABEL_28:
}

- (BOOL)isOptedInForServiceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabledForServiceIdentifier:v4];

  if (v6)
  {
    id v7 = [(IDSKeyTransparencyVerifier *)self serviceToOptInManager];
    CFStringRef v8 = [v7 objectForKey:v4];

    if (v8)
    {
      unsigned int v9 = [v8 getOptInState];
      uint64_t v10 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v11 = @"NO";
        if (v9) {
          CFStringRef v11 = @"YES";
        }
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        CFStringRef v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found opt in manager for service. { serviceIdentifier: %@, optInState: %@ }", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      uint64_t v10 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No valid opt in manager found for service { serviceIdentifier: %@ }", (uint8_t *)&v13, 0xCu);
      }
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    CFStringRef v8 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Key Transparency is not enabled for service { serviceIdentifier: %@ }", (uint8_t *)&v13, 0xCu);
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)getOptInStatesForKTApplications:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  CFStringRef v8 = im_primary_base_queue();
  dispatch_assert_queue_V2(v8);

  if (![v6 count])
  {
LABEL_16:
    v7[2](v7, &__NSDictionary0__struct);
    goto LABEL_17;
  }
  unsigned int v9 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v10 = [v9 isKeyTransparencyEnabled];

  if ((v10 & 1) == 0)
  {
    id v22 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100724F5C();
    }

    goto LABEL_16;
  }
  id v23 = v7;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = dispatch_group_create();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = v6;
  id obj = v6;
  id v13 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        dispatch_group_enter(v12);
        uint64_t v18 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling into Transparency to get opt in state for application: %@", buf, 0xCu);
        }

        id v19 = [objc_alloc((Class)KTOptInStateRequest) initWithApplication:v17];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100417038;
        v29[3] = &unk_10098CFA0;
        v29[4] = v17;
        id v30 = v11;
        __int16 v31 = v12;
        +[KTOptInManager getOptInState:v19 completion:v29];
      }
      id v14 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v14);
  }

  uint64_t v20 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004171D4;
  block[3] = &unk_10097E818;
  id v7 = v23;
  id v27 = v11;
  id v28 = v23;
  id v21 = v11;
  dispatch_group_notify(v12, v20, block);

  id v6 = v24;
LABEL_17:
}

- (void)clearCacheAndUpdatePeersForService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(IDSKeyTransparencyVerifier *)self accountController];
    id v6 = v5 = v4;
    id v7 = [(IDSKeyTransparencyVerifier *)self serviceController];
    CFStringRef v8 = [v7 serviceWithIdentifier:v5];
    id v46 = [v6 appleIDAccountOnService:v8];

    unsigned int v9 = [(IDSKeyTransparencyVerifier *)self accountController];
    unsigned __int8 v10 = [(IDSKeyTransparencyVerifier *)self serviceController];
    long long v48 = v5;
    id v11 = [v10 serviceWithIdentifier:v5];
    id v12 = [v9 accountsOnService:v11];

    id v13 = objc_alloc_init((Class)NSMutableSet);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v58;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v58 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v57 + 1) + 8 * i) registration];
          uint64_t v20 = [v19 uris];

          id v21 = objc_msgSend(v20, "__imArrayByApplyingBlock:", &stru_10098CFC0);
          [v13 addObjectsFromArray:v21];
        }
        id v16 = [v14 countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v16);
    }
    id v47 = self;
    long long v45 = v14;

    id v22 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v23 = v13;
    id v24 = [v23 countByEnumeratingWithState:&v53 objects:v63 count:16];
    id v4 = v48;
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v54;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v54 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(const void **)(*((void *)&v53 + 1) + 8 * (void)j);
          id v29 = objc_alloc_init((Class)NSMutableSet);
          id v30 = [(IDSKeyTransparencyVerifier *)v47 peerIDManager];
          __int16 v31 = [v30 activeURIsFromURI:v28 service:v4];
          id v32 = [v31 mutableCopy];

          long long v33 = [v23 allObjects];
          [v32 removeObjectsInArray:v33];

          [v29 addObjectsFromArray:v32];
          if (v29) {
            CFDictionarySetValue(v22, v28, v29);
          }

          id v4 = v48;
        }
        id v25 = [v23 countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v25);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v34 = [(__CFDictionary *)v22 allKeys];
    id v35 = [v34 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v50;
      do
      {
        for (k = 0; k != v36; k = (char *)k + 1)
        {
          if (*(void *)v50 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v49 + 1) + 8 * (void)k);
          long long v40 = -[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v39, v45);
          uint64_t v41 = v40;
          if (v40 && [v40 count])
          {
            uint64_t v42 = [v41 allObjects];
            [v46 askPeersToClearCacheWithURIs:v42 fromURI:v39 forService:v4];
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v36);
    }

    if ([(IDSKeyTransparencyVerifier *)v47 ktShouldClearCacheOnOptInOut])
    {
      id v43 = [(IDSKeyTransparencyVerifier *)v47 peerIDManager];
      [v43 forgetPeerTokensForService:v4];
    }
    id v44 = v46;
  }
  else
  {
    id v44 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Cannot clearCacheAndUpdatePeersForService if service is nil -- returning", buf, 2u);
    }
  }
}

- (void)clearTransparencyCacheForService:(id)a3 peerURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = v7;
  if (v6 && v7)
  {
    unsigned int v9 = [(IDSKeyTransparencyVerifier *)self _keyTransparencyVerifierForServiceIdentifier:v6];
    unsigned __int8 v10 = [(id)objc_opt_class() keyTransparencyURIPrefixForServiceIdentifier:v6];
    id v11 = [v8 prefixedURI];
    id v12 = [v10 stringByAppendingString:v11];

    if (v9 && [v12 length])
    {
      id v13 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calling into Transparency to clear Transparency cache for peerURI: %@", buf, 0xCu);
      }

      uint64_t v20 = v12;
      id v14 = +[NSArray arrayWithObjects:&v20 count:1];
      id v19 = 0;
      unsigned int v15 = [v9 clearPeerCache:v14 error:&v19];
      id v16 = v19;

      uint64_t v17 = +[IDSFoundationLog KeyTransparency];
      uint64_t v18 = v17;
      if (!v15 || v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100724F90();
        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v8;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Success clearing Transparency cache for peerURI: %@", buf, 0xCu);
        }
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "clearTransparencyCacheForService needs a service and peerURI -- returning", buf, 2u);
    }
  }
}

- (void)fetchPeerVerificationInfoForApplication:(id)a3 forURIs:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void *, void *))a5;
  id v11 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v12 = [v11 isKeyTransparencyEnabled];

  if (v12)
  {
    id v13 = [(id)objc_opt_class() keyTransparencyServiceIdentifierForTransparencyApplication:v8];
    id v14 = v13;
    if (v13 && ![v13 isEqualToString:&stru_10099BE78])
    {
      [(IDSKeyTransparencyVerifier *)self _fetchVerificationInfoForService:v14 forURIs:v9 localURI:0 withCompletion:v10];
    }
    else
    {
      unsigned int v15 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10072500C();
      }

      id v16 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-1100 userInfo:0];
      v10[2](v10, &__NSDictionary0__struct, v16);
    }
  }
  else
  {
    uint64_t v17 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }

    id v14 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-1000 userInfo:0];
    v10[2](v10, &__NSDictionary0__struct, v14);
  }
}

- (void)_fetchVerificationInfoForService:(id)a3 forURIs:(id)a4 localURI:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v29 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(IDSKeyTransparencyVerifier *)self serviceController];
  id v14 = v10;
  unsigned int v15 = [v13 serviceWithIdentifier:v10];

  id v16 = [(IDSKeyTransparencyVerifier *)self accountController];
  uint64_t v17 = [v16 appleIDAccountOnService:v15];

  if (v17)
  {
    uint64_t v18 = [(IDSKeyTransparencyVerifier *)self accountController];
    id v19 = [v18 accountsOnService:v15];

    uint64_t v20 = +[IDSQueryUtilities accountToQueryFrom:v19 fromURI:v11 destinationURIs:v29 allowLocalAccount:0];
    id v21 = +[IDSQueryUtilities URIToQueryFrom:v20 withPreferredFromURI:v11];
    if (v21)
    {
      id v22 = [(IDSKeyTransparencyVerifier *)self peerIDManager];
      [v20 _registrationCert];
      id v23 = v28 = v20;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100417E9C;
      v30[3] = &unk_10097EAB8;
      v30[4] = self;
      id v31 = v29;
      id v32 = v21;
      id v33 = v12;
      LOBYTE(v27) = 0;
      objc_msgSend(v22, "startQueryForURIs:fromIdentity:fromURI:fromService:forSending:forRefresh:isForced:reason:completionBlock:", v31, v23, v32, v27, @"KTFetch", v30);

      uint64_t v20 = v28;
    }
    else
    {
      id v25 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100724E58();
      }

      uint64_t v26 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-1100 userInfo:0];
      (*((void (**)(id, void *, void *))v12 + 2))(v12, &__NSDictionary0__struct, v26);

      id v21 = 0;
    }
  }
  else
  {
    id v24 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100725074();
    }

    id v19 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-1100 userInfo:0];
    (*((void (**)(id, void *, void *))v12 + 2))(v12, &__NSDictionary0__struct, v19);
  }
}

- (void)fetchSelfVerificationInfoForApplication:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing fetch for self verification info.", buf, 2u);
  }

  id v9 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v10 = [v9 isKeyTransparencyEnabled];

  if (v10)
  {
    id v11 = [(id)objc_opt_class() keyTransparencyServiceIdentifierForTransparencyApplication:v6];
    id v12 = v11;
    if (v11 && ![v11 isEqualToString:&stru_10099BE78])
    {
      uint64_t v18 = [(IDSKeyTransparencyVerifier *)self policy];
      unsigned __int8 v19 = [v18 isKeyTransparencyEnabledForServiceIdentifier:v12];

      if (v19)
      {
        long long v40 = (void (**)(void, void, void))v7;
        id v41 = v6;
        uint64_t v20 = [(IDSKeyTransparencyVerifier *)self accountController];
        id v21 = [(IDSKeyTransparencyVerifier *)self serviceController];
        uint64_t v39 = v12;
        id v22 = [v21 serviceWithIdentifier:v12];
        id v23 = [v20 accountsOnService:v22];

        id v16 = objc_alloc_init((Class)NSMutableSet);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v14 = v23;
        id v24 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v48;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v48 != v26) {
                objc_enumerationMutation(v14);
              }
              id v28 = [*(id *)(*((void *)&v47 + 1) + 8 * i) registration];
              id v29 = [v28 uris];
              id v30 = objc_msgSend(v29, "__imArrayByApplyingBlock:", &stru_10098D000);

              [v16 addObjectsFromArray:v30];
            }
            id v25 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
          }
          while (v25);
        }

        id v31 = [v16 allObjects];
        id v32 = +[IDSQueryUtilities accountToQueryFrom:v14 fromURI:0 destinationURIs:v31 allowLocalAccount:0];

        id v33 = +[IDSQueryUtilities URIToQueryFrom:v32 withPreferredFromURI:0];
        if (v33)
        {
          [(IDSKeyTransparencyVerifier *)self repairKVSDeviceEntryIfNeeded];
          long long v34 = [v16 allObjects];
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_100418968;
          v42[3] = &unk_10098D090;
          id v7 = v40;
          id v46 = v40;
          v42[4] = self;
          id v12 = v39;
          id v43 = v39;
          id v44 = v33;
          id v45 = v32;
          [(IDSKeyTransparencyVerifier *)self _fetchVerificationInfoForService:v43 forURIs:v34 localURI:0 withCompletion:v42];

          id v35 = v46;
        }
        else
        {
          uint64_t v37 = +[IDSFoundationLog KeyTransparency];
          id v12 = v39;
          id v7 = v40;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_100724E58();
          }

          id v35 = [objc_alloc((Class)KTSelfVerificationInfo) initWithSyncedLoggableDatas:&__NSArray0__struct uriToServerLoggableDatas:&__NSDictionary0__struct];
          long long v38 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:-9001 debugDescription:@"No account registered for service." underlyingError:0];
          ((void (**)(void, id, void *))v40)[2](v40, v35, v38);
        }
        id v6 = v41;
        goto LABEL_10;
      }
      id v36 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_100725110();
      }

      id v14 = objc_alloc_init((Class)KTSelfVerificationInfo);
      uint64_t v15 = -1000;
    }
    else
    {
      id v13 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10072500C();
      }

      id v14 = [objc_alloc((Class)KTSelfVerificationInfo) initWithSyncedLoggableDatas:&__NSArray0__struct uriToServerLoggableDatas:&__NSDictionary0__struct];
      uint64_t v15 = -9003;
    }
    id v16 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:v15 userInfo:0];
    (*((void (**)(id, id, id))v7 + 2))(v7, v14, v16);
LABEL_10:

    goto LABEL_14;
  }
  uint64_t v17 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100709BD4();
  }

  id v12 = objc_alloc_init((Class)KTSelfVerificationInfo);
  id v14 = +[NSError errorWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:-1000 userInfo:0];
  (*((void (**)(id, id, id))v7 + 2))(v7, v12, v14);
LABEL_14:
}

- (void)healSelfForApplication:(id)a3 withHealableErrors:(id)a4 withCompletion:(id)a5
{
  id v5 = (void (**)(id, void))a5;
  id v6 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This is not a supported flow.", v7, 2u);
  }

  v5[2](v5, 0);
}

- (void)fetchKTRegistrationStatusWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabled];

  if (v6)
  {
    id v9 = [(IDSRegistrationKeyManager *)self->_keyManager fetchRegistrationStatusProvider];
    v4[2](v4, v9);
  }
  else
  {
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }

    id v8 = objc_alloc_init((Class)IDSKTRegistrationStatusProvider);
    v4[2](v4, v8);
  }
}

- (void)registrationDataNeedsUpdate
{
  id v3 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v4 = [v3 isKeyTransparencyEnabled];

  if ((v4 & 1) == 0)
  {
    id v9 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }
    goto LABEL_10;
  }
  id v5 = [(IDSKeyTransparencyVerifier *)self registerUpdateRateLimiter];
  unsigned int v6 = [v5 underLimitForItem:@"RegisterUpdateLimitKey"];

  if (!v6)
  {
    id v9 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "KT registration data update is rate limited.", v10, 2u);
    }
LABEL_10:

    return;
  }
  id v7 = [(IDSKeyTransparencyVerifier *)self registerUpdateRateLimiter];
  [v7 noteItem:@"RegisterUpdateLimitKey"];

  keyManager = self->_keyManager;

  [(IDSRegistrationKeyManager *)keyManager _ktDataNeedsUpdate:0];
}

- (int64_t)_IDSKTAccountStatusForKTAccountStatus:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)fetchKTCDPStatus:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, int64_t))a3;
  id v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching KT account status from transparency", buf, 2u);
  }

  if (CUTIsInternalInstall()
    && +[IMUserDefaults useKeyTransparencyAccountStatusDefault])
  {
    int64_t v6 = +[IMUserDefaults keyTransparencyAccountStatusDefault];
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Default is set to return KT account status instead of calling transparency. { accountStatus: %ld }", buf, 0xCu);
    }

    [(IDSKeyTransparencyVerifier *)self setMostRecentKTCDPAccountStatus:v6];
    v4[2](v4, v6);
  }
  else
  {
    id v8 = [objc_alloc((Class)KTStatus) initWithApplication:@"IDS"];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100419720;
    v9[3] = &unk_10098D0E0;
    objc_copyWeak(&v11, (id *)buf);
    v9[4] = self;
    unsigned __int8 v10 = v4;
    [v8 getStatus:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handleKTCDPStatusUpdate:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received notification of update to KT CDP status.", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    int64_t v6 = [(IDSKeyTransparencyVerifier *)self accountController];
    id v7 = [(IDSKeyTransparencyVerifier *)self serviceController];
    id v8 = [v7 serviceWithIdentifier:@"com.apple.madrid"];
    id v9 = [v6 accountsOnService:v8];

    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v16 registrationError] == (id)47
            || [v16 registrationError] == (id)48
            || [v16 registrationError] == (id)49)
          {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v13);
    }

    if ([v10 count])
    {
      uint64_t v17 = [v4 userInfo];
      uint64_t v18 = [v17 objectForKey:@"accountStatus"];
      uint64_t v19 = [v18 unsignedIntValue];

      int64_t v20 = [(IDSKeyTransparencyVerifier *)self _IDSKTAccountStatusForKTAccountStatus:v19];
      id v21 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = +[NSNumber numberWithUnsignedInteger:v19];
        *(_DWORD *)buf = 138412290;
        id v41 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received account status update from KT. { KTAccountStatus: %@ }", buf, 0xCu);
      }
      if ((unint64_t)(v20 - 2) >= 3)
      {
        id v30 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Received account status that we have no update for.", buf, 2u);
        }
      }
      else
      {
        id v23 = (id)qword_100794AF8[v20 - 2];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v24 = v10;
        id v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v32;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
              if (objc_msgSend(v29, "registrationError", (void)v31) != v23) {
                [v29 _updateRegistrationStatusWithError:v23 info:0];
              }
            }
            id v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v26);
        }
      }
    }
    else
    {
      uint64_t v17 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No accounts need updating.", buf, 2u);
      }
    }
  }
}

- (void)peerVerificationFinishedWithResults:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  log = +[IDSFoundationLog KeyTransparency];
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      id v60 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Received peer verification finished with results: %@", buf, 0xCu);
    }

    if (self->_kickPeerVerificationDate)
    {
      id v7 = +[NSDate now];
      [v7 timeIntervalSince1970];
      double v9 = v8;
      [(NSDate *)self->_kickPeerVerificationDate timeIntervalSince1970];
      double v11 = v9 - v10;

      if (v11 > 0.0)
      {
        id v12 = +[TransparencyAnalytics logger];
        id v13 = +[NSNumber numberWithDouble:v11];
        [v12 logMetric:v13 withName:@"IDSKTTimeToReceivePeerVerificationResults"];

        kickPeerVerificationDate = self->_kickPeerVerificationDate;
        self->_kickPeerVerificationDate = 0;
      }
    }
    long long v48 = self;
    log = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v15 = +[NSMutableDictionary dictionary];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v45 = v4;
    id obj = v4;
    id v16 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v54;
      uint64_t v19 = kKTApplicationIdentifierIDS;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v54 != v18) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v22 = objc_msgSend(v21, "application", v45);
          if (v22)
          {
            id v23 = (void *)v22;
            id v24 = [v21 application];
            unsigned int v25 = [v24 isEqualToString:v19];

            if (v25)
            {
              id v26 = v15;
              uint64_t v27 = objc_opt_class();
              id v28 = [v21 uri];
              id v29 = [v27 strippedURIFromKeyTransparencyURI:v28];

              if ([v29 length])
              {
                id v30 = +[IDSURI URIWithPrefixedURI:v29];
                [log setObject:v21 forKey:v30];
              }
              long long v31 = objc_opt_class();
              long long v32 = [v21 application];
              long long v33 = [v31 keyTransparencyServiceIdentifierForTransparencyApplication:v32];

              uint64_t v15 = v26;
              if ([v33 length])
              {
                long long v34 = [v26 objectForKeyedSubscript:v33];

                if (!v34)
                {
                  long long v35 = +[NSMutableArray array];
                  [v26 setObject:v35 forKeyedSubscript:v33];
                }
                long long v36 = [v26 objectForKeyedSubscript:v33];
                [v36 addObject:v21];
              }
            }
          }
        }
        id v17 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v17);
    }

    long long v37 = [(IDSKeyTransparencyVerifier *)v48 peerIDManager];
    [v37 updateCachedVerifierResultsWithResults:log];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v38 = v15;
    id v39 = [v38 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v50;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v50 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
          id v44 = objc_msgSend(v38, "objectForKeyedSubscript:", v43, v45);
          [(IDSKeyTransparencyVerifier *)v48 _notifyClientOfKTVerifierResults:v44 forService:v43];
        }
        id v40 = [v38 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v40);
    }

    id v4 = v45;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Received peerVerificationFinishedWithResults but results are empty -- returning", buf, 2u);
  }
}

- (void)_notifyClientOfKTVerifierResults:(id)a3 forService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v6 && v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v27 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v13);
          uint64_t v15 = objc_opt_class();
          id v16 = [v14 uri];
          id v17 = [v15 strippedURIFromKeyTransparencyURI:v16];

          if ([v17 length]) {
            [v8 setObject:v14 forKey:v17];
          }

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v11);
    }

    uint64_t v18 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v8 count];
      *(_DWORD *)buf = 138412546;
      id v34 = v6;
      __int16 v35 = 2048;
      id v36 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Need to notify client of uriToVerifierResult { service: %@ count: %lu }", buf, 0x16u);
    }

    int64_t v20 = +[IDSDaemon sharedInstance];
    id v21 = objc_alloc_init((Class)IMMessageContext);
    uint64_t v22 = [v20 broadcasterForTopic:v6 messageContext:v21];

    id v28 = 0;
    id v23 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v28];
    id v24 = v28;
    unsigned int v25 = +[IDSFoundationLog KeyTransparency];
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v26)
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Error archiving uriToVerifierResult -- dropping { archiveError: %@ }", buf, 0xCu);
      }
    }
    else
    {
      if (v26)
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully archived uriToVerifierResultData: %@", buf, 0xCu);
      }

      [v22 ktPeerVerificationResultsUpdated:v23 forService:v6];
    }
    id v5 = v27;
  }
}

- (void)cacheClearRequest:(id)a3
{
  id v35 = a3;
  id v4 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v5 = [v4 isKeyTransparencyEnabled];

  id v6 = +[IDSFoundationLog KeyTransparency];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v35;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received request from transparency to clear cache. { CacheClearRequest: %@ }", buf, 0xCu);
    }

    if (!self->_cacheClearRateLimiterByService)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      cacheClearRateLimiterByService = self->_cacheClearRateLimiterByService;
      self->_cacheClearRateLimiterByService = Mutable;
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v7 = [v35 requestContexts];
    id v10 = [v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v45;
      uint64_t v36 = *(void *)v45;
      long long v37 = v7;
      do
      {
        uint64_t v13 = 0;
        id v38 = v11;
        do
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v39 = v13;
          uint64_t v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
          uint64_t v15 = [v14 service];
          if (v15
            && (id v16 = (void *)v15,
                [v14 service],
                id v17 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v18 = [v17 isEqualToString:@"com.apple.madrid"],
                v17,
                v16,
                (v18 & 1) != 0))
          {
            id v19 = self->_cacheClearRateLimiterByService;
            int64_t v20 = [v14 service];
            id v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];

            if (!v21)
            {
              id v22 = objc_alloc((Class)IDSRateLimiter);
              unint64_t v23 = [(IDSKeyTransparencyVerifier *)self ktCacheClearRequestLimit];
              [(IDSKeyTransparencyVerifier *)self ktCacheClearRequestLimitTime];
              id v21 = objc_msgSend(v22, "initWithLimit:timeLimit:", v23);
              id v24 = self->_cacheClearRateLimiterByService;
              unsigned int v25 = [v14 service];
              [(NSMutableDictionary *)v24 setObject:v21 forKeyedSubscript:v25];
            }
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            BOOL v26 = [v14 uris];
            id v27 = [v26 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v41;
              do
              {
                long long v30 = 0;
                do
                {
                  if (*(void *)v41 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  long long v31 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v30);
                  if ([v21 underLimitForItem:v31])
                  {
                    [v21 noteItem:v31];
                    long long v32 = [(IDSKeyTransparencyVerifier *)self peerIDManager];
                    long long v33 = [v14 service];
                    [v32 forgetPeerTokensForURI:v31 service:v33];
LABEL_22:

                    goto LABEL_24;
                  }
                  long long v32 = +[IDSFoundationLog KeyTransparency];
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    long long v33 = [v14 service];
                    *(_DWORD *)buf = 138412546;
                    id v49 = v31;
                    __int16 v50 = 2112;
                    long long v51 = v33;
                    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Reached rate limit for clearing query cache. { URI: %@, Service: %@ }", buf, 0x16u);
                    goto LABEL_22;
                  }
LABEL_24:

                  long long v30 = (char *)v30 + 1;
                }
                while (v28 != v30);
                id v34 = [v26 countByEnumeratingWithState:&v40 objects:v52 count:16];
                id v28 = v34;
              }
              while (v34);
            }

            uint64_t v12 = v36;
            id v7 = v37;
            id v11 = v38;
          }
          else
          {
            id v21 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_100725248(v53, v14, &v54, v21);
            }
          }

          uint64_t v13 = v39 + 1;
        }
        while ((id)(v39 + 1) != v11);
        id v11 = [v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100709BD4();
  }
}

- (void)updateKVSWithTrustedDevices:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Uploading trusted devices to KVS. { trustedDevices: %@ }", buf, 0xCu);
  }

  id v9 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v10 = [v9 isKeyTransparencyEnabled];

  if ((v10 & 1) == 0)
  {
    id v35 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_1007252F4();
    }

    goto LABEL_32;
  }
  id v11 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned __int8 v12 = [v11 isKeyTransparencyTrustCircleEnabled];

  if ((v12 & 1) == 0)
  {
    uint64_t v36 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Key transparency trust circle is not enabled -- not enrolling trusted device", buf, 2u);
    }

LABEL_32:
    v7[2](v7, 0);
    goto LABEL_37;
  }
  uint64_t v39 = v7;
  uint64_t v13 = [(IDSKeyTransparencyVerifier *)self registrationDataSource];
  uint64_t v14 = [v13 currentLocalKeyTransparencyEligibleServiceIdentifiers];

  id v40 = v6;
  id v41 = objc_alloc_init((Class)NSMutableArray);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        int64_t v20 = [(IDSKeyTransparencyVerifier *)self _pruneTrustedDevice:*(void *)(*((void *)&v48 + 1) + 8 * i) givenEligibleServiceIdentifiers:v14];
        id v21 = [v20 trustedServices];
        id v22 = [v21 count];

        if (v22)
        {
          [v41 addObject:v20];
        }
        else
        {
          unint64_t v23 = +[IDSFoundationLog KeyTransparency];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Trusted Device info has no services with data to insert into KVS.", buf, 2u);
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v17);
  }

  id v24 = v41;
  if ([v41 count])
  {
    id v38 = [(IDSKeyTransparencyVerifier *)self _fetchExpiredEntriesFromKVS];
    unsigned int v25 = [v38 allKeys];
    [(IDSKeyTransparencyVerifier *)self _removeObjectsForKeysFromKVS:v25];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v41;
    id v27 = [v26 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
          long long v32 = objc_alloc_init(IDSProtoKeyTransparencyTrustedDeviceMetadata);
          long long v33 = [(IDSKeyTransparencyVerifier *)self serverTime];
          [v33 currentServerTimeInterval];
          -[IDSProtoKeyTransparencyTrustedDeviceMetadata setTimestamp:](v32, "setTimestamp:");

          [(IDSKeyTransparencyVerifier *)self _insertTrustedDeviceToKVS:v31 withMetadata:v32];
        }
        id v28 = [v26 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v28);
    }

    id v34 = [(IDSKeyTransparencyVerifier *)self forceSyncKVS];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10041AED0;
    v42[3] = &unk_100980C70;
    id v7 = v39;
    long long v43 = v39;
    [v34 registerResultBlock:v42];

    id v6 = v40;
    id v24 = v41;
  }
  else
  {
    long long v37 = +[IDSFoundationLog KeyTransparency];
    id v6 = v40;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1007252C0();
    }

    id v7 = v39;
    v39[2](v39, 0);
  }

LABEL_37:
}

- (id)_fetchCurrentKVS
{
  v2 = [(IDSKeyTransparencyVerifier *)self keyTransparencyStore];
  id v3 = [v2 fetchAllEntries];

  return v3;
}

- (void)_insertTrustedDeviceToKVS:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Inserting trusted device with metadata. {trustedDevice: %@, metadata: %@}", buf, 0x16u);
  }

  id v9 = objc_msgSend(v6, "data", IDSKTKVSTrustedDeviceKey);
  v16[0] = v9;
  v15[1] = IDSKTKVSTrustedDeviceMetadataKey;
  unsigned __int8 v10 = [v7 data];
  v16[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  unsigned __int8 v12 = [(IDSKeyTransparencyVerifier *)self SHA256HashForKeyTransparencyTrustedDevice:v6];
  uint64_t v13 = objc_msgSend(v12, "__imHexString");

  uint64_t v14 = [(IDSKeyTransparencyVerifier *)self keyTransparencyStore];
  [v14 insertDictionary:v11 forKey:v13];
}

- (void)_removeObjectsForKeysFromKVS:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing entries from KVS. {keys: %@}", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      unsigned __int8 v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        unsigned __int8 v12 = [(IDSKeyTransparencyVerifier *)self keyTransparencyStore];
        [v12 removeEntryForKey:v11];

        unsigned __int8 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)fetchTrustedDevicesFromKVS
{
  v2 = [(IDSKeyTransparencyVerifier *)self _fetchCurrentKVS];
  id v23 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v26;
    uint64_t v22 = IDSKTKVSTrustedDeviceKey;
    id v8 = IMRGLog_ptr;
    *(void *)&long long v5 = 138412290;
    long long v21 = v5;
    do
    {
      uint64_t v9 = 0;
      id v24 = v6;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v9);
        uint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = v7;
          long long v13 = v8;
          long long v14 = [IDSProtoKeyTransparencyTrustedDevice alloc];
          id v15 = v3;
          long long v16 = [v3 objectForKeyedSubscript:v10];
          id v17 = [v16 objectForKey:v22];
          id v18 = [(IDSProtoKeyTransparencyTrustedDevice *)v14 initWithData:v17];

          if (!v18)
          {
            id v19 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              uint64_t v30 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create trusted device from KVS entry. {kvsKey: %@}", buf, 0xCu);
            }
          }
          [v23 addObject:v18];
          id v8 = v13;
          uint64_t v7 = v12;
          id v6 = v24;
          id v3 = v15;
        }
        else
        {
          id v18 = +[IDSFoundationLog KeyTransparency];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            uint64_t v30 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "KVS entry not of expected type, skipping. {kvsKey: %@}", buf, 0xCu);
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }

  return v23;
}

- (id)_fetchExpiredEntriesFromKVS
{
  v2 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching expired entries from KVS.", buf, 2u);
  }

  id v3 = [(IDSKeyTransparencyVerifier *)self _fetchCurrentKVS];
  id v39 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSKeyTransparencyVerifier *)self serverTime];
  [v4 currentServerTimeInterval];
  double v6 = v5;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v42;
    uint64_t v12 = IDSKTKVSTrustedDeviceMetadataKey;
    *(void *)&long long v9 = 134218498;
    long long v38 = v9;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v7);
        }
        CFStringRef v14 = *(const __CFString **)(*((void *)&v41 + 1) + 8 * (void)v13);
        id v15 = objc_msgSend(v7, "objectForKeyedSubscript:", v14, v38);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v16 = [IDSProtoKeyTransparencyTrustedDeviceMetadata alloc];
          id v17 = [v15 objectForKeyedSubscript:v12];
          id v18 = [(IDSProtoKeyTransparencyTrustedDeviceMetadata *)v16 initWithData:v17];

          if (v18)
          {
            [v18 timestamp];
            if (v19 > 0.0)
            {
              [v18 timestamp];
              double v21 = v6 - v20;
              [(IDSKeyTransparencyVerifier *)self keyTransparencyCKContainerExpiryTime];
              if (v21 <= v22) {
                goto LABEL_23;
              }
              id v23 = +[IDSFoundationLog KeyTransparency];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                [v18 timestamp];
                *(_DWORD *)buf = v38;
                CFStringRef v46 = *(const __CFString **)&v6;
                __int16 v47 = 2048;
                long long v48 = v24;
                __int16 v49 = 2112;
                CFStringRef v50 = v14;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found expired entry. {currentTime: %f, trustedDeviceTimestamp: %f, entryKey: %@", buf, 0x20u);
              }

              long long v25 = [v7 objectForKeyedSubscript:v14];
              [v39 setObject:v25 forKey:v14];

              [v18 timestamp];
              double v27 = v6 - v26;
              long long v28 = +[IDSFoundationLog KeyTransparency];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v29 = +[NSNumber numberWithDouble:v27];
                *(_DWORD *)buf = 138412546;
                CFStringRef v46 = @"ktKVSExpiredEntryTime";
                __int16 v47 = 2112;
                long long v48 = v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reporting KT Metric. {metricName: %@, timeInterval: %@}", buf, 0x16u);
              }
              uint64_t v30 = +[TransparencyAnalytics logger];
              uint64_t v31 = +[NSNumber numberWithDouble:v27];
              [v30 logMetric:v31 withName:@"ktKVSExpiredEntryTime"];

              goto LABEL_22;
            }
            uint64_t v30 = +[IDSFoundationLog KeyTransparency];
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
LABEL_22:

              goto LABEL_23;
            }
            [v18 timestamp];
            *(_DWORD *)buf = 138412546;
            CFStringRef v46 = v14;
            __int16 v47 = 2048;
            long long v48 = v35;
            long long v32 = v30;
            long long v33 = "Timestamp value for KVS entry is not valid. {kvsKey: %@, timestamp: %f}";
            uint32_t v34 = 22;
          }
          else
          {
            uint64_t v30 = +[IDSFoundationLog KeyTransparency];
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v46 = v14;
            long long v32 = v30;
            long long v33 = "Failed to create device metadata object from KVS entry. {kvsKey: %@}";
            uint32_t v34 = 12;
          }
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
          goto LABEL_22;
        }
        id v18 = +[IDSFoundationLog KeyTransparency];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v46 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "KVS entry not of expected type, skipping. {kvsKey: %@}", buf, 0xCu);
        }
LABEL_23:

        long long v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v36 = [v7 countByEnumeratingWithState:&v41 objects:v51 count:16];
      id v10 = v36;
    }
    while (v36);
  }

  return v39;
}

- (id)forceSyncKVS
{
  id v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to sync KVS.", buf, 2u);
  }

  id v4 = +[NSDate date];
  id v5 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
  double v6 = [(IDSKeyTransparencyVerifier *)self keyTransparencyStore];
  id v7 = [v6 forceKVSSync];

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  CFStringRef v14 = sub_10041BB84;
  id v15 = &unk_10097FC10;
  id v16 = v4;
  id v17 = v5;
  id v8 = v5;
  id v9 = v4;
  [v7 registerResultBlock:&v12];
  id v10 = objc_msgSend(v8, "promise", v12, v13, v14, v15);

  return v10;
}

- (void)removeAllKVSEntries
{
  id v2 = [(IDSKeyTransparencyVerifier *)self keyTransparencyStore];
  [v2 removeAllEntries];
}

- (void)fetchCurrentDeviceKVSKey:(id)a3
{
  id v15 = (void (**)(id, __CFDictionary *, void))a3;
  id v4 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [(IDSKeyTransparencyVerifier *)self keyManager];
  double v6 = [v5 kvsTrustedDevices];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [(IDSKeyTransparencyVerifier *)self SHA256HashForKeyTransparencyTrustedDevice:v12];
        if (v13)
        {
          if (!v12) {
            goto LABEL_12;
          }
          CFStringRef v14 = v12;
          CFDictionarySetValue(v4, objc_msgSend(v13, "__imHexString"), v14);
        }
        else
        {
          CFStringRef v14 = +[IDSFoundationLog KeyTransparency];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            double v21 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Couldn't create hash for trusted device. { trustedDevice: %@ }", buf, 0xCu);
          }
        }

LABEL_12:
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }

  v15[2](v15, v4, 0);
}

- (void)repairKVSDeviceEntryIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10041C128;
  v2[3] = &unk_10098D108;
  v2[4] = self;
  [(IDSKeyTransparencyVerifier *)self fetchCurrentDeviceKVSKey:v2];
}

- (void)updateCurrentDeviceInKVS:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSKeyTransparencyVerifier *)self keyManager];
  double v6 = [v5 kvsTrustedDevices];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10041C354;
  v8[3] = &unk_100986F68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(IDSKeyTransparencyVerifier *)self updateKVSWithTrustedDevices:v6 withCompletion:v8];
}

- (BOOL)isKeyInKVS:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSKeyTransparencyVerifier *)self keyTransparencyStore];
  double v6 = [v5 fetchEntryForKey:v4];

  id v7 = +[IDSFoundationLog KeyTransparency];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v4;
      id v9 = "Key found in KVS. { kvsKey: %@ }";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v8)
  {
    int v11 = 138412290;
    id v12 = v4;
    id v9 = "Key not found in KVS. { kvsKey: %@ }";
    goto LABEL_6;
  }

  return v6 != 0;
}

- (void)reportAccountKeyFetchMetricForService:(id)a3 withSuccess:(BOOL)a4 isAccountMismatch:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v13 = +[IMUserDefaults keyTransparencyAccountKeyFetchMetricDeviceID];
  CFStringRef v14 = +[IDSRegistrationReasonTracker sharedInstance];
  id v15 = [v14 getMostRecentIDSRegistrationReason];

  if (v10) {
    CFDictionarySetValue(v12, @"IDSKTAccountKeyFetchService", v10);
  }
  long long v16 = +[NSNumber numberWithBool:v8];
  if (v16) {
    CFDictionarySetValue(v12, @"IDSKTAccountKeyFetchSuccess", v16);
  }

  long long v17 = +[NSNumber numberWithBool:v7];
  if (v17) {
    CFDictionarySetValue(v12, @"IDSKTAccountKeyFetchIsMismatchAccount", v17);
  }

  long long v18 = _IDSKeyTransparencyVersionNumber();
  if (v18) {
    CFDictionarySetValue(v12, @"KTVersion", v18);
  }

  long long v19 = +[NSNumber numberWithInteger:v15];
  if (v19) {
    CFDictionarySetValue(v12, @"akRegRes", v19);
  }

  if (v13) {
    CFDictionarySetValue(v12, @"akFetchDID", v13);
  }
  if (CUTIsInternalInstall())
  {
    id v20 = v10;
    double v21 = v13;
    id v22 = v11;
    id v23 = v15;
    BOOL v24 = v7;
    long long v25 = [(IDSKeyTransparencyVerifier *)self pushHandler];
    double v26 = [v25 pushToken];
    double v27 = [v26 base64EncodedStringWithOptions:0];

    if (v27) {
      CFDictionarySetValue(v12, @"akFetchPT", v27);
    }

    LODWORD(v7) = v24;
    id v15 = v23;
    id v11 = v22;
    uint64_t v13 = v21;
    id v10 = v20;
  }
  if (!v8)
  {
    long long v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 code]);
    if (v28) {
      CFDictionarySetValue(v12, @"akFetchErr", v28);
    }

    uint64_t v29 = [v11 userInfo];
    uint64_t v30 = [v29 objectForKey:NSUnderlyingErrorKey];

    if (v30)
    {
      uint64_t v31 = [v30 domain];
      if (v31) {
        CFDictionarySetValue(v12, @"akUnderlyingErrorDomain", v31);
      }

      long long v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 code]);
      if (v32) {
        CFDictionarySetValue(v12, @"akUnderlyingErr", v32);
      }
    }
  }
  long long v33 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v34 = @"YES";
    }
    else {
      CFStringRef v34 = @"NO";
    }
    if (v7) {
      CFStringRef v35 = @"YES";
    }
    else {
      CFStringRef v35 = @"NO";
    }
    id v36 = +[NSNumber numberWithInteger:v15];
    long long v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 code]);
    int v39 = 138413570;
    id v40 = v10;
    __int16 v41 = 2112;
    CFStringRef v42 = v34;
    __int16 v43 = 2112;
    CFStringRef v44 = v35;
    __int16 v45 = 2112;
    CFStringRef v46 = v36;
    __int16 v47 = 2112;
    long long v48 = v37;
    __int16 v49 = 2112;
    CFStringRef v50 = v12;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Reporting IDSKTAccountKeyFetchMetric {service: %@, success: %@, isMismatchAccount: %@, regReason: %@, error: %@, metricAttributes: %@}", (uint8_t *)&v39, 0x3Eu);
  }
  long long v38 = +[TransparencyAnalytics logger];
  [v38 logHardFailureForEventNamed:@"IDSKTAccountKeyFetch" withAttributes:v12];
}

- (void)_submitMetricForTrustedDeviceEnrollmentWithKVSResult:(id)a3 kvsSyncTimeInterval:(double)a4
{
  id v6 = a3;
  BOOL v7 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned int v8 = [v7 isKeyTransparencyAnalyticsEnabled];

  if (!v8) {
    goto LABEL_15;
  }
  if ([v6 state] != (id)1)
  {
    id v9 = 0;
LABEL_7:
    id v11 = 0;
    goto LABEL_8;
  }
  id v9 = [v6 error];
  if (!v9)
  {
    id v9 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:0 debugDescription:@"KVS sync error unknown." underlyingError:0];
    if (!v9) {
      goto LABEL_7;
    }
  }
  id v10 = [v9 userInfo];
  id v11 = [v10 objectForKey:NSUnderlyingErrorKey];

LABEL_8:
  id v12 = objc_alloc((Class)IDSKeyTransparencyTrustedDeviceEnrollmentMetric);
  uint64_t v13 = _IDSKeyTransparencyVersionNumber();
  id v14 = [v13 unsignedIntegerValue];
  BOOL v15 = [v6 state] == 0;
  long long v16 = [v9 domain];
  id v17 = [v9 code];
  uint64_t v18 = [v11 domain];
  long long v19 = v11;
  id v20 = (void *)v18;
  uint64_t v29 = v19;
  id v21 = objc_msgSend(v12, "initWithKeyTransparencyVersion:kvsSuccess:kvsErrorDomain:kvsErrorCode:kvsSyncTimeInterval:kvsUnderlyingErrorDomain:kvsUnderlyingErrorCode:", v14, v15, v16, v17, v18, objc_msgSend(v19, "code"), a4);

  id v22 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Logging KT enrollment metric { metric: %@ }", buf, 0xCu);
  }

  id v23 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned int v24 = [v23 isKeyTransparencyRTCAnalyticsEnabled];

  if (v24)
  {
    long long v25 = [(IDSKeyTransparencyVerifier *)self internalMetricLogger];
    [v25 logMetric:v21];
  }
  double v26 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned int v27 = [v26 isKeyTransparencySFAnalyticsEnabled];

  if (v27)
  {
    long long v28 = [(IDSKeyTransparencyVerifier *)self productionMetricLogger];
    [v28 logMetric:v21];
  }
LABEL_15:
}

- (void)_submitMetricsForTrustedDeviceEnrollmentWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(IDSKeyTransparencyVerifier *)self policy];
  unsigned int v13 = [v12 isKeyTransparencyAnalyticsEnabled];

  if (v13)
  {
    if ([v10 state] == (id)1)
    {
      id v14 = [v10 error];
      BOOL v15 = [v14 userInfo];
      long long v16 = [v15 objectForKeyedSubscript:NSUnderlyingErrorKey];
      id v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [v10 error];
      }
      long long v19 = v18;

      if (!v19)
      {
        long long v19 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:0 debugDescription:0 underlyingError:0];
      }
    }
    else
    {
      long long v19 = 0;
    }
    long long v59 = self;
    if ([v11 state] == (id)1)
    {
      id v20 = [v11 error];
      id v21 = [v20 userInfo];
      NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
      id v23 = [v21 objectForKeyedSubscript:NSUnderlyingErrorKey];
      unsigned int v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = [v11 error];
      }
      id v27 = v25;

      if (v27)
      {
        double v26 = v27;
      }
      else
      {
        double v26 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:0 debugDescription:0 underlyingError:0];
      }
    }
    else
    {
      double v26 = 0;
      NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
    }
    id v53 = objc_alloc((Class)IDSKeyTransparencyTrustedDeviceEnrollmentMetric);
    long long v56 = _IDSKeyTransparencyVersionNumber();
    id v51 = [v56 unsignedIntegerValue];
    id v61 = v10;
    BOOL v50 = [v10 state] == 0;
    __int16 v49 = [v19 domain];
    id v48 = [v19 code];
    id v55 = [v19 userInfo];
    uint64_t v54 = [v55 objectForKeyedSubscript:v22];
    __int16 v47 = [v54 domain];
    long long v58 = v19;
    long long v52 = [v19 userInfo];
    long long v28 = [v52 objectForKeyedSubscript:v22];
    id v29 = [v28 code];
    id v60 = v11;
    BOOL v30 = [v11 state] == 0;
    id v31 = [v26 domain];
    id v32 = [v26 code];
    long long v33 = [v26 userInfo];
    CFStringRef v34 = [v33 objectForKeyedSubscript:v22];
    CFStringRef v35 = [v34 domain];
    long long v57 = v26;
    id v36 = [v26 userInfo];
    long long v37 = [v36 objectForKeyedSubscript:v22];
    LOBYTE(v46) = v30;
    id v38 = objc_msgSend(v53, "initWithKeyTransparencyVersion:cloudKitSuccess:cloudKitErrorDomain:cloudKitErrorCode:cloudKitUnderlyingErrorDomain:cloudKitUnderlyingErrorCode:cloudKitOperationTimeInterval:accountKeySuccess:accountKeyErrorDomain:accountKeyErrorCode:accountKeyUnderlyingErrorDomain:accountKeyUnderlyingErrorCode:accountKeyOperationTimeInterval:", v51, v50, v49, v48, v47, v29, a4, a6, v46, v31, v32, v35, objc_msgSend(v37, "code"));

    int v39 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Logging KT enrollment metric { metric: %@ }", buf, 0xCu);
    }

    id v40 = [(IDSKeyTransparencyVerifier *)v59 policy];
    unsigned int v41 = [v40 isKeyTransparencyRTCAnalyticsEnabled];

    if (v41)
    {
      CFStringRef v42 = [(IDSKeyTransparencyVerifier *)v59 internalMetricLogger];
      [v42 logMetric:v38];
    }
    __int16 v43 = [(IDSKeyTransparencyVerifier *)v59 policy];
    unsigned int v44 = [v43 isKeyTransparencySFAnalyticsEnabled];

    id v10 = v61;
    id v11 = v60;
    if (v44)
    {
      __int16 v45 = [(IDSKeyTransparencyVerifier *)v59 productionMetricLogger];
      [v45 logMetric:v38];
    }
  }
}

- (void)_submitMetricsForTrustedDeviceVerificationWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6 index:(id)a7 entries:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(IDSKeyTransparencyVerifier *)self policy];
  LODWORD(a7) = [v18 isKeyTransparencyAnalyticsEnabled];

  if (a7)
  {
    id v67 = [v17 count];
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_10041D8E4;
    v77[3] = &unk_10098D130;
    v77[4] = self;
    id v70 = v16;
    id v74 = v16;
    id v78 = v74;
    id v69 = v17;
    v76 = objc_msgSend(v17, "__imArrayByFilteringWithBlock:", v77);
    id v66 = [v76 count];
    if ([v14 state] == (id)1)
    {
      long long v19 = [v14 error];
      id v20 = [v19 userInfo];
      id v21 = [v20 objectForKeyedSubscript:NSUnderlyingErrorKey];
      NSErrorUserInfoKey v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [v14 error];
      }
      unsigned int v24 = v23;

      if (!v24)
      {
        unsigned int v24 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:0 debugDescription:0 underlyingError:0];
      }
    }
    else
    {
      unsigned int v24 = 0;
    }
    if ([v15 state] == (id)1)
    {
      id v25 = [v15 error];
      double v26 = [v25 userInfo];
      NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
      long long v28 = [v26 objectForKeyedSubscript:NSUnderlyingErrorKey];
      id v29 = v28;
      if (v28)
      {
        id v30 = v28;
      }
      else
      {
        id v30 = [v15 error];
      }
      id v31 = v30;

      if (!v31)
      {
        id v31 = [(IDSKeyTransparencyVerifier *)self _clientErrorWithCode:0 debugDescription:0 underlyingError:0];
      }
    }
    else
    {
      id v31 = 0;
      NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
    }
    id v60 = objc_alloc((Class)IDSKeyTransparencyTrustedDeviceVerificationMetric);
    v65 = _IDSKeyTransparencyVersionNumber();
    id v59 = [v65 unsignedIntegerValue];
    id v55 = [v14 state];
    id v32 = [v24 domain];
    id v58 = [v24 code];
    v64 = [v24 userInfo];
    id v63 = [v64 objectForKeyedSubscript:v27];
    long long v33 = [v63 domain];
    v62 = [v24 userInfo];
    id v61 = [v62 objectForKeyedSubscript:v27];
    id v54 = [v61 code];
    id v51 = [v15 state];
    v73 = [v31 domain];
    id v52 = [v31 code];
    long long v57 = [v31 userInfo];
    long long v56 = [v57 objectForKeyedSubscript:v27];
    v72 = [v56 domain];
    v68 = v31;
    id v53 = [v31 userInfo];
    CFStringRef v34 = [v53 objectForKeyedSubscript:v27];
    id v35 = [v34 code];
    id v36 = [v14 state];
    id v71 = v14;
    if (v36)
    {
      long long v37 = &__NSArray0__struct;
    }
    else
    {
      long long v37 = [v14 value];
    }
    v75 = self;
    BOOL v50 = v37;
    unint64_t v38 = [(IDSKeyTransparencyVerifier *)self _numberOfMatchesForCandidates:v76 index:v74 trustedDevices:v37];
    id v39 = [v15 state];
    if (v39)
    {
      id v40 = &__NSArray0__struct;
    }
    else
    {
      id v40 = [v15 value];
    }
    LOBYTE(v49) = v51 == 0;
    id v41 = objc_msgSend(v60, "initWithKeyTransparencyVersion:cloudKitSuccess:cloudKitErrorDomain:cloudKitErrorCode:cloudKitUnderlyingErrorDomain:cloudKitUnderlyingErrorCode:cloudKitOperationTimeInterval:accountKeySuccess:accountKeyErrorDomain:accountKeyErrorCode:accountKeyUnderlyingErrorDomain:accountKeyUnderlyingErrorCode:accountKeyOperationTimeInterval:numberOfTotalDevices:numberOfCandidateDevices:numberOfMatchesFromCloudKit:numberOfMatchesFromAccountKey:", v59, v55 == 0, v32, v58, v33, v54, a4, a6, v49, v73, v52, v72, v35, v67,
            v66,
            v38,
            [(IDSKeyTransparencyVerifier *)v75 _numberOfMatchesForCandidates:v76 index:v74 trustedDevices:v40]);
    if (!v39) {

    }
    id v14 = v71;
    if (!v36) {

    }
    CFStringRef v42 = +[IDSFoundationLog KeyTransparency];
    id v17 = v69;
    id v16 = v70;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v80 = v41;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Logging KT verification metric { metric: %@ }", buf, 0xCu);
    }

    __int16 v43 = [(IDSKeyTransparencyVerifier *)v75 policy];
    unsigned int v44 = [v43 isKeyTransparencyRTCAnalyticsEnabled];

    if (v44)
    {
      __int16 v45 = [(IDSKeyTransparencyVerifier *)v75 internalMetricLogger];
      [v45 logMetric:v41];
    }
    uint64_t v46 = [(IDSKeyTransparencyVerifier *)v75 policy];
    unsigned int v47 = [v46 isKeyTransparencySFAnalyticsEnabled];

    if (v47)
    {
      id v48 = [(IDSKeyTransparencyVerifier *)v75 productionMetricLogger];
      [v48 logMetric:v41];
    }
  }
}

- (unint64_t)_numberOfMatchesForCandidates:(id)a3 index:(id)a4 trustedDevices:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10041DA50;
  v12[3] = &unk_10098D158;
  v12[4] = self;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = objc_msgSend(a3, "__imArrayByFilteringWithBlock:", v12);
  id v10 = [v9 count];

  return (unint64_t)v10;
}

- (BOOL)_isTrustedCandidate:(id)a3 index:(id)a4 givenTrustedDevices:(id)a5
{
  id v7 = a3;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10041DB40;
  id v16 = &unk_10098D1C8;
  id v17 = a4;
  id v18 = v7;
  id v8 = v7;
  id v9 = v17;
  id v10 = objc_msgSend(a5, "__imArrayByFilteringWithBlock:", &v13);
  BOOL v11 = objc_msgSend(v10, "count", v13, v14, v15, v16) != 0;

  return v11;
}

- (id)_mergeCloudKitTrustedDevices:(id)a3 accountKeyTrustedDevices:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = v7;
  if (v5) {
    [v7 addObjectsFromArray:v5];
  }
  if (v6) {
    [v8 addObjectsFromArray:v6];
  }
  id v9 = [v8 allObjects];

  return v9;
}

- (id)_KTDataForIDSKeyTransparencyEntry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)KTLoggableData);
  id v5 = [v3 loggableData];
  id v6 = [v4 initWithClientData:v5];

  id v7 = [v3 pushToken];
  [v6 setDeviceID:v7];

  id v8 = [v3 signedData];
  [v6 setSignature:v8];

  objc_msgSend(v6, "setKtCapable:", objc_msgSend(v3, "ktCapable"));
  id v9 = [v3 buildVersion];
  [v6 setBuild:v9];

  id v10 = [v3 productName];
  [v6 setProduct:v10];

  id v11 = [v3 transparencyVersion];
  id v12 = +[NSNumber numberWithLongLong:v11];
  [v6 setVersion:v12];

  return v6;
}

- (id)_KTDatasForIDSKeyTransparencyEntries:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[IDSKeyTransparencyVerifier _KTDataForIDSKeyTransparencyEntry:](self, "_KTDataForIDSKeyTransparencyEntry:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_IDSProtoKeyTransparencyTrustedDeviceForKeyTransparencyIndex:(id)a3 entry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 pushToken];
  id v8 = [v6 URI];
  uint64_t v9 = [v8 prefixedURI];

  id v10 = [v6 serviceIdentifier];

  id v11 = [v5 loggableData];
  id v12 = [v5 signedData];

  if (v11) {
    long long v13 = [[IDSProtoKeyTransparencyLoggableData alloc] initWithData:v11];
  }
  else {
    long long v13 = 0;
  }
  long long v14 = 0;
  if (v7 && v9 && v10 && v13 && v12)
  {
    long long v14 = objc_alloc_init(IDSProtoKeyTransparencyTrustedDevice);
    [(IDSProtoKeyTransparencyTrustedDevice *)v14 setPushToken:v7];
    long long v15 = objc_alloc_init(IDSProtoKeyTransparencyTrustedService);
    [(IDSProtoKeyTransparencyTrustedService *)v15 setServiceIdentifier:v10];
    [(IDSProtoKeyTransparencyTrustedService *)v15 setKtLoggableData:v13];
    [(IDSProtoKeyTransparencyTrustedService *)v15 setDeviceSignature:v12];
    long long v16 = +[NSMutableArray arrayWithObject:v9];
    [(IDSProtoKeyTransparencyTrustedService *)v15 setUris:v16];

    id v17 = +[NSMutableArray arrayWithObject:v15];
    [(IDSProtoKeyTransparencyTrustedDevice *)v14 setTrustedServices:v17];
  }

  return v14;
}

- (id)_KTDatasForIDSProtoKeyTransparencyTrustedDevices:(id)a3 serviceIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSKeyTransparencyVerifier *)self serviceController];
  uint64_t v9 = [v8 serviceWithIdentifier:v6];

  long long v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10041E3FC;
  id v18 = &unk_10098D1F0;
  id v19 = v6;
  id v20 = v9;
  id v10 = v9;
  id v11 = v6;
  id v12 = objc_msgSend(v7, "__imArrayByApplyingBlock:", &v15);

  long long v13 = -[IDSKeyTransparencyVerifier _KTDatasForIDSKeyTransparencyEntries:](self, "_KTDatasForIDSKeyTransparencyEntries:", v12, v15, v16, v17, v18);

  return v13;
}

- (id)_IDSEndpointTransparencyStatesForKTLoggableDatas:(id)a3 index:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_alloc((Class)IDSEndpointTransparencyState);
        long long v14 = objc_msgSend(v12, "deviceID", (void)v17);
        id v15 = objc_msgSend(v13, "initWithPushToken:verificationState:", v14, -[IDSKeyTransparencyVerifier _IDSEndpointTransparencyVerificationStateForKTResult:](self, "_IDSEndpointTransparencyVerificationStateForKTResult:", objc_msgSend(v12, "result")));

        [v6 addObject:v15];
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (int64_t)_IDSEndpointTransparencyVerificationStateForKTResult:(unint64_t)a3
{
  if (a3 > 2) {
    return -1;
  }
  else {
    return qword_100794B10[a3];
  }
}

- (id)_keyTransparencyVerifierForServiceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSKeyTransparencyVerifier *)self serviceToVerifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100725328();
    }
  }

  return v6;
}

- (id)SHA256HashForKeyTransparencyTrustedDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 pushToken], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v7 = (void *)v6,
        [v5 trustedServices],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = [v5 trustedServices];
    uint64_t v10 = [(IDSKeyTransparencyVerifier *)self SHA256HashForKeyTransparencyTrustedServices:v9];

    if (v10)
    {
      id v11 = objc_alloc_init((Class)NSMutableData);
      id v12 = [v5 pushToken];
      [v11 appendData:v12];

      [v11 appendData:v10];
      id v13 = [v11 SHA256Data];

      goto LABEL_9;
    }
    id v15 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Didn't receive trusted services hash.", v16, 2u);
    }
  }
  else
  {
    uint64_t v10 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No push token or trusted services. Cannot create a hash.", buf, 2u);
    }
  }
  id v13 = 0;
LABEL_9:

  return v13;
}

- (id)SHA256HashForKeyTransparencyTrustedServices:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = objc_alloc_init((Class)NSMutableSet);
    id v7 = objc_alloc_init((Class)NSMutableData);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [(IDSKeyTransparencyVerifier *)self SHA256HashForKeyTransparencyTrustedService:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          if (v13) {
            [v6 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v10);
    }

    if ([v6 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v14 = [v6 allObjects];
      id v15 = [v14 sortedArrayUsingComparator:&stru_10098D210];

      id v16 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            [v7 appendData:*(void *)(*((void *)&v23 + 1) + 8 * (void)j)];
          }
          id v17 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
        }
        while (v17);
      }

      long long v20 = [v7 SHA256Data];
    }
    else
    {
      id v21 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No trusted service hashes found, cannot create a hash.", buf, 2u);
      }

      long long v20 = 0;
    }
  }
  else
  {
    uint64_t v6 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No trusted services, cannot create a hash.", buf, 2u);
    }
    long long v20 = 0;
  }

  return v20;
}

- (id)SHA256HashForKeyTransparencyTrustedService:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 ktLoggableData];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [v3 serviceIdentifier];
    if (v6)
    {

LABEL_5:
      id v8 = objc_alloc_init((Class)NSMutableData);
      id v9 = [v3 ktLoggableData];
      id v10 = [v9 data];
      [v8 appendData:v10];

      uint64_t v11 = [v3 serviceIdentifier];

      if (v11)
      {
        id v12 = [v3 serviceIdentifier];
        id v13 = [v12 dataUsingEncoding:4];
        [v8 appendData:v13];
      }
      if ([v3 keyIndex])
      {
        id v14 = [v3 keyIndex];
        if (v14 >= 4)
        {
          id v15 = +[NSString stringWithFormat:@"(unknown: %i)", v14];
        }
        else
        {
          id v15 = off_10098D270[(int)v14];
        }
        uint64_t v18 = [(__CFString *)v15 dataUsingEncoding:4];
        [v8 appendData:v18];
      }
      id v17 = [v8 SHA256Data];

      goto LABEL_16;
    }
    unsigned int v7 = [v3 keyIndex];

    if (v7) {
      goto LABEL_5;
    }
  }
  id v16 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100725390();
  }

  id v17 = 0;
LABEL_16:

  return v17;
}

+ (id)keyTransparencyServiceIdentifierForTransparencyApplication:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kKTApplicationIdentifierIDS])
  {
    uint64_t v4 = (id *)&IDSiMessageKeyTransparencyService;
LABEL_7:
    id v5 = (__CFString *)*v4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:kKTApplicationIdentifierIDSFaceTime])
  {
    uint64_t v4 = (id *)&IDSFaceTimeMultiKeyTransparencyService;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:kKTApplicationIdentifierIDSMultiplex])
  {
    uint64_t v4 = (id *)&IDSMultiplex1KeyTransparencyService;
    goto LABEL_7;
  }
  id v5 = &stru_10099BE78;
LABEL_8:

  return v5;
}

+ (id)keyTransparencyApplicationForServiceIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:IDSiMessageKeyTransparencyService])
  {
    uint64_t v4 = (id *)&kKTApplicationIdentifierIDS;
LABEL_7:
    id v5 = (__CFString *)*v4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:IDSFaceTimeMultiKeyTransparencyService])
  {
    uint64_t v4 = (id *)&kKTApplicationIdentifierIDSFaceTime;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:IDSMultiplex1KeyTransparencyService])
  {
    uint64_t v4 = (id *)&kKTApplicationIdentifierIDSMultiplex;
    goto LABEL_7;
  }
  id v5 = &stru_10099BE78;
LABEL_8:

  return v5;
}

+ (id)keyTransparencyURIPrefixForServiceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (qword_100A4CA70 == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_100A4CA70, &stru_10098D230);
    if (v4)
    {
LABEL_3:
      id v5 = [(id)qword_100A4CA68 objectForKeyedSubscript:v4];
      uint64_t v6 = v5;
      if (v5) {
        goto LABEL_7;
      }
    }
  }
  unsigned int v7 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1007253C4();
  }

  uint64_t v6 = 0;
  id v5 = &stru_10099BE78;
LABEL_7:
  id v8 = v5;

  return v8;
}

+ (id)strippedURIFromKeyTransparencyURI:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  id v5 = &stru_10099BE78;
  if (v3)
  {
    uint64_t v6 = @"im://";
    if (([v3 hasPrefix:@"im://"] & 1) == 0)
    {
      uint64_t v6 = @"mp1://";
      if (([v4 hasPrefix:@"mp1://"] & 1) == 0)
      {
        uint64_t v6 = @"ftm://";
        if (![v4 hasPrefix:@"ftm://"]) {
          uint64_t v6 = &stru_10099BE78;
        }
      }
    }
    id v5 = (__CFString *)[v4 copy];
    if ([v4 hasPrefix:v6])
    {
      uint64_t v7 = objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v6, "length"));

      id v5 = (__CFString *)v7;
    }
  }

  return v5;
}

- (void)_presentInternalVerificationAlertWithText:(id)a3
{
  id v8 = a3;
  uint64_t v4 = im_primary_base_queue();
  dispatch_assert_queue_V2(v4);

  id v5 = [(IDSKeyTransparencyVerifier *)self policy];
  LODWORD(v4) = [v5 isKeyTransparencyUIEnabled];

  if (v4)
  {
    uint64_t v6 = +[IMUserNotification userNotificationWithIdentifier:@"IDSKeyTransparencyVerifier" title:@"Key Transparency" message:v8 defaultButton:@"OK" alternateButton:0 otherButton:0];
    [v6 setUsesNotificationCenter:1];
    uint64_t v7 = +[IMUserNotificationCenter sharedInstance];
    [v7 addUserNotification:v6 listener:0];
  }
}

- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v10 = v9;
    if (v7) {
      [v9 setObject:v7 forKeyedSubscript:NSDebugDescriptionErrorKey];
    }
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:NSUnderlyingErrorKey];
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [objc_alloc((Class)NSError) initWithDomain:@"IDSKeyTransparencyVerifierErrorDomain" code:a3 userInfo:v10];

  return v11;
}

- (double)keyTransparencyCKContainerExpiryTime
{
  double v2 = 4320000.0;
  if (+[IMUserDefaults keyTransparencyCKContainerExpiryOverride] >= 1&& CUTIsInternalInstall())
  {
    return (double)+[IMUserDefaults keyTransparencyCKContainerExpiryOverride];
  }
  return v2;
}

- (double)keyTransparencyPeerUpdateLastResortFetchInterval
{
  double v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"kt-peer-update-last-resort-fetch-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = (double)(uint64_t)[v3 integerValue];
  }
  else {
    double v4 = 604800.0;
  }

  return v4;
}

- (unint64_t)ktCacheClearRequestLimit
{
  double v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"kt-clear-cache-request-limit"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (double)ktCacheClearRequestLimitTime
{
  double v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"kt-clear-cache-request-limit-time"];

  double v4 = 1800.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
    }
  }

  return v4;
}

- (unint64_t)ktRegisterUpdateRequestLimit
{
  double v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"kt-register-update-limit"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (double)ktRegisterUpdateLimitTime
{
  double v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"kt-register-update-limit-time"];

  double v4 = 3600.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
    }
  }

  return v4;
}

- (BOOL)ktShouldClearCacheOnOptInOut
{
  double v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"kt-clear-cache-opt-in-enabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)getCurrentRegistrationStateWithCompletion:(id)a3
{
  id v17 = (void (**)(id, id))a3;
  id v3 = +[IDSDAccountController sharedInstance];
  unsigned __int8 v4 = +[IDSDServiceController sharedInstance];
  double v5 = [v4 serviceWithIdentifier:IDSiMessageKeyTransparencyService];
  uint64_t v6 = [v3 accountsOnService:v5];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v12);
        id v14 = objc_alloc_init((Class)IDSKTState);
        id v15 = [v13 registration];
        id v16 = [v15 userID];
        [v14 setUserID:v16];

        objc_msgSend(v14, "setStatus:", objc_msgSend(v13, "registrationStatus"));
        objc_msgSend(v14, "setOptedIn:", objc_msgSend(v15, "optedIntoKT"));
        objc_msgSend(v14, "setContainsAccountKey:", objc_msgSend(v15, "didRegisterWithKTAccountKey"));
        objc_msgSend(v14, "setContainsDeviceSignature:", objc_msgSend(v15, "didRegisterWithDeviceSignature"));
        [v7 addObject:v14];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v17[2](v17, v7);
}

- (IDSCloudKitKeyTransparencyStore)keyTransparencyStore
{
  return self->_keyTransparencyStore;
}

- (IDSKeyTransparencyPolicy)policy
{
  return self->_policy;
}

- (IDSKeyTransparencyRegistrationDataSource)registrationDataSource
{
  return self->_registrationDataSource;
}

- (int64_t)mostRecentKTCDPAccountStatus
{
  return self->_mostRecentKTCDPAccountStatus;
}

- (void)setMostRecentKTCDPAccountStatus:(int64_t)a3
{
  self->_mostRecentKTCDPAccountStatus = a3;
}

- (KTVerifier)KTVerifier
{
  return self->_KTVerifier;
}

- (NSDictionary)serviceToVerifier
{
  return self->_serviceToVerifier;
}

- (NSDictionary)optInEligibleKTApplicationToIDSServiceIdentifier
{
  return self->_optInEligibleKTApplicationToIDSServiceIdentifier;
}

- (NSDictionary)serviceToOptInManager
{
  return self->_serviceToOptInManager;
}

- (IDSRegistrationKeyManager)keyManager
{
  return self->_keyManager;
}

- (CUTMetricLogger)internalMetricLogger
{
  return self->_internalMetricLogger;
}

- (CUTMetricLogger)productionMetricLogger
{
  return self->_productionMetricLogger;
}

- (void)setSelfHealRateLimiter:(id)a3
{
}

- (void)setRegisterUpdateRateLimiter:(id)a3
{
}

- (NSMutableDictionary)cacheClearRateLimiterByService
{
  return self->_cacheClearRateLimiterByService;
}

- (void)setCacheClearRateLimiterByService:(id)a3
{
}

- (NSDate)kickPeerVerificationDate
{
  return self->_kickPeerVerificationDate;
}

- (void)setKickPeerVerificationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kickPeerVerificationDate, 0);
  objc_storeStrong((id *)&self->_cacheClearRateLimiterByService, 0);
  objc_storeStrong((id *)&self->_registerUpdateRateLimiter, 0);
  objc_storeStrong((id *)&self->_selfHealRateLimiter, 0);
  objc_storeStrong((id *)&self->_productionMetricLogger, 0);
  objc_storeStrong((id *)&self->_internalMetricLogger, 0);
  objc_storeStrong((id *)&self->_keyManager, 0);
  objc_storeStrong((id *)&self->_serviceToOptInManager, 0);
  objc_storeStrong((id *)&self->_optInEligibleKTApplicationToIDSServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceToVerifier, 0);
  objc_storeStrong((id *)&self->_KTVerifier, 0);
  objc_storeStrong((id *)&self->_registrationDataSource, 0);
  objc_storeStrong((id *)&self->_policy, 0);

  objc_storeStrong((id *)&self->_keyTransparencyStore, 0);
}

@end