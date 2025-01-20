@interface AKAppleIDAuthenticationService
+ (id)_verificationQueue;
- (AKAppleIDAuthenticationService)init;
- (AKAppleIDAuthenticationService)initWithClient:(id)a3 passwordResetPresenter:(id)a4;
- (AKAppleIDAuthenticationService)initWithProxy:(id)a3;
- (AKPasswordResetPresenter)passwordResetPresenter;
- (BOOL)_incrementAttemptsForContext:(id)a3 error:(id *)a4;
- (BOOL)_isInteractiveAuthRequiredForContext:(id)a3;
- (BOOL)_shouldBroadcastForProximity:(id)a3;
- (BOOL)_shouldShowAlertForAuthModeError:(id)a3;
- (BOOL)_shouldSkipAccountUpdatesForAuthWithContext:(id)a3;
- (BOOL)_updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)shouldProcessAdditionalServerUIData:(id)a3;
- (id)_accountForContinuationWithContext:(id)a3 error:(id *)a4;
- (id)_addAccountNameParameterToURL:(id)a3 withContext:(id)a4;
- (id)_authKitAccountFromContext:(id)a3;
- (id)_authenticationParametersForUsername:(id)a3 altDSID:(id)a4 context:(id)a5;
- (id)_createProxAnalyticsForAuthenticationContextIfNeeded:(id)a3;
- (id)_deviceListProviderWithContext:(id)a3;
- (id)_requestingControllerWithServerResponse:(id)a3;
- (id)_srpAuthContextHelperWithContext:(id)a3;
- (id)fidoHandler;
- (void)_accountForContinuationWithContext:(id)a3 completion:(id)a4;
- (void)_attemptBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4;
- (void)_attemptInteractiveAuthWithContext:(id)a3 completion:(id)a4;
- (void)_attemptPasswordlessAuthAfterBiometricOrPasscodeValidationWithContext:(id)a3 promptType:(unint64_t)a4 completion:(id)a5;
- (void)_attemptPasswordlessAuthOptionsWithContext:(id)a3 completion:(id)a4;
- (void)_attemptPasswordlessAuthWithContext:(id)a3 completion:(id)a4;
- (void)_authenticateWithContext:(id)a3 completion:(id)a4;
- (void)_beginAppleIDCreationFlowWithContext:(id)a3 completion:(id)a4;
- (void)_beginChangePasswordFlowWithAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_beginServerDrivenSecondaryActionWithURLKey:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6;
- (void)_beginiForgotFlowWithContext:(id)a3 completion:(id)a4;
- (void)_changePasswordAndAuthenticateWithContext:(id)a3 completion:(id)a4;
- (void)_checkFreshnessAndVerifyWithPassword:(id)a3 serverResponse:(id)a4 additionalData:(id)a5 secondaryActionError:(id)a6 context:(id)a7 newServerResponse:(id)a8 username:(id)a9 completion:(id)a10;
- (void)_completeAuthenticationWithServiceTokens:(id)a3 tokenFetchError:(id)a4 altDSID:(id)a5 authenticationResults:(id)a6 context:(id)a7 completion:(id)a8;
- (void)_configureDeviceListCacheInBackgroundWithContext:(id)a3 response:(id)a4;
- (void)_correlateContext:(id)a3 withAuthModeInformation:(id)a4;
- (void)_createNewAppleIDAndAuthenticateWithContext:(id)a3 completion:(id)a4;
- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5;
- (void)_fetchAuthModeInfoWithContext:(id)a3 completion:(id)a4;
- (void)_fetchDeviceListWithContext:(id)a3 completion:(id)a4;
- (void)_fetchDeviceSafetyRestrictionStateForAltDSID:(id)a3 completion:(id)a4;
- (void)_fetchTokensForServiceIDs:(id)a3 withUsername:(id)a4 altDSID:(id)a5 masterToken:(id)a6 context:(id)a7 completion:(id)a8;
- (void)_finishAnalyticsEvent:(id)a3 authenticationResults:(id)a4 authenticationContext:(id)a5 error:(id)a6;
- (void)_handleBasicLoginUICompletionWithUsername:(id)a3 password:(id)a4 context:(id)a5 additionalData:(id)a6 collectionError:(id)a7 completion:(id)a8;
- (void)_handleCreateNewAppleIDError:(id)a3 withContext:(id)a4 andCompletion:(id)a5;
- (void)_handleDeviceListResponseRequestContext:(id)a3 responseError:(id)a4 responseData:(id)a5 completion:(id)a6;
- (void)_handleGrandslamResponse:(id)a3 data:(id)a4 error:(id)a5 serverResponse:(id)a6 completion:(id)a7;
- (void)_handleMissingUsernameOrPasswordForContext:(id)a3 password:(id)a4 username:(id)a5 completion:(id)a6;
- (void)_handlePasswordlessAuthResults:(id)a3 context:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_handleRecoverCredentialsError:(id)a3 withContext:(id)a4 event:(id)a5 andCompletion:(id)a6;
- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 initialAuthResponse:(id)a6 context:(id)a7 completion:(id)a8;
- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 piggybacking:(BOOL)a6 initialAuthResponse:(id)a7 context:(id)a8 completion:(id)a9;
- (void)_handleStartFidoAuthWithContext:(id)a3 fidoContext:(id)a4 serverResponse:(id)a5 completion:(id)a6;
- (void)_handleSuccessfulVerificationForContext:(id)a3 withResults:(id)a4 serverResponse:(id)a5 completion:(id)a6;
- (void)_handleVerificationCompletionForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10;
- (void)_handleVerificationError:(id)a3 forContext:(id)a4 completion:(id)a5;
- (void)_initiateEDPRepairForAuthenticationContext:(id)a3 authResults:(id)a4;
- (void)_keepLoginAliveWithContext:(id)a3 error:(id)a4 andCompletion:(id)a5;
- (void)_performAuthenticationWithContext:(id)a3 completion:(id)a4;
- (void)_performDeviceListRequestWithContext:(id)a3 completion:(id)a4;
- (void)_performFidoStartAuthActionWithContext:(id)a3 serverResponse:(id)a4 completion:(id)a5;
- (void)_performGrandslamEndpointActionWithContext:(id)a3 serverResponse:(id)a4 completion:(id)a5;
- (void)_performInteractiveAuthWithContext:(id)a3 completion:(id)a4;
- (void)_performInteractiveFederatedAuthWithContext:(id)a3 completion:(id)a4;
- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6;
- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_performPasswordlessSRPAuthWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_performPasswordlessSRPAuthWithContext:(id)a3 completion:(id)a4;
- (void)_performSRPAuthenticationWithContext:(id)a3 completion:(id)a4;
- (void)_performSafeSRPAuthenticationWithContext:(id)a3 completion:(id)a4;
- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6;
- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_performSilentServiceTokenAuthWithContext:(id)a3 completion:(id)a4;
- (void)_persistGrandSlamServiceTokens:(id)a3 forAltDSID:(id)a4 DSID:(id)a5 appleID:(id)a6 forContext:(id)a7 error:(id *)a8;
- (void)_processValidationCodeSuccessResponse:(id)a3 authResponse:(id)a4 results:(id)a5 completion:(id)a6;
- (void)_provideServiceTokensIfRequiredForContext:(id)a3 authenticationResults:(id)a4 serverResponse:(id)a5 completion:(id)a6;
- (void)_recoverCredentialsAndAuthenticateWithContext:(id)a3 completion:(id)a4;
- (void)_refreshAuthModeFromServerForContext:(id)a3 completion:(id)a4;
- (void)_refreshAuthModeIfNecessaryForContext:(id)a3 completion:(id)a4;
- (void)_refreshLocalAccountAndUpdateContext:(id)a3 completion:(id)a4;
- (void)_repairAppleIDWithContext:(id)a3 completion:(id)a4;
- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)_setAuthKitAccount:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6;
- (void)_shouldContinueAuthenticatingForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10;
- (void)_showAlertForLoginCodeValidationError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showAlertForLoginError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showAlertForVerificationError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4;
- (void)_showContinueUsingUIWithContext:(id)a3 completion:(id)a4;
- (void)_showServerUIWithContext:(id)a3 completion:(id)a4;
- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6;
- (void)_titleAndMessageForBadNetworkRelatedErrorWithCompletion:(id)a3;
- (void)_titleAndMessageForError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_updateAltDSIDAndUsername:(id)a3;
- (void)_updateDeviceListResponseWithDeviceInfo:(id)a3 completion:(id)a4;
- (void)_upgradeSecurityLevelWithContext:(id)a3 completion:(id)a4;
- (void)_validateLoginCode:(unint64_t)a3 forAltDSID:(id)a4 masterToken:(id)a5 idmsData:(id)a6 authContext:(id)a7 completion:(id)a8;
- (void)_verifyUsername:(id)a3 password:(id)a4 context:(id)a5 completion:(id)a6;
- (void)accountNamesForAltDSID:(id)a3 completion:(id)a4;
- (void)activeLoginCode:(id)a3;
- (void)authenticateWithContext:(id)a3 completion:(id)a4;
- (void)checkSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4;
- (void)clearSessionCacheWithCompletion:(id)a3;
- (void)configurationInfoWithIdentifiers:(id)a3 forAltDSID:(id)a4 completion:(id)a5;
- (void)deleteAuthorizationDatabaseWithAltDSID:(id)a3 completion:(id)a4;
- (void)deleteDeviceListCacheWithCompletion:(id)a3;
- (void)deleteDeviceListCacheWithContext:(id)a3 completion:(id)a4;
- (void)deleteTokensFromCacheWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5;
- (void)deviceListWithContext:(id)a3 completion:(id)a4;
- (void)endProximityAuthenticationForContext:(id)a3 completion:(id)a4;
- (void)fetchAppListWithAltDSID:(id)a3 completion:(id)a4;
- (void)fetchAuthModeWithContext:(id)a3 completion:(id)a4;
- (void)fetchBirthdayForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchGlobalConfigurationUsingPolicy:(unint64_t)a3 completion:(id)a4;
- (void)fetchTokensWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5;
- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchURLBagFromCache:(BOOL)a3 altDSID:(id)a4 completion:(id)a5;
- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4;
- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5;
- (void)generateLoginCodeWithCompletion:(id)a3;
- (void)getServerUILoadDelegateForAltDSID:(id)a3 completion:(id)a4;
- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4;
- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4;
- (void)getUserInformationWithContext:(id)a3 completion:(id)a4;
- (void)isCreateAppleIDAllowedWithCompletion:(id)a3;
- (void)isDevicePasscodeProtected:(id)a3;
- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 completion:(id)a5;
- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)performCircleRequestWithContext:(id)a3 completion:(id)a4;
- (void)performEdpCompleteKeyDropWithAltDSID:(id)a3 completion:(id)a4;
- (void)performEdpMigrationWithAltDSID:(id)a3 completion:(id)a4;
- (void)performPasswordResetWithContext:(id)a3 completion:(id)a4;
- (void)performRemoveEdpTokenWithAltDSID:(id)a3 completion:(id)a4;
- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4;
- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5;
- (void)piggyback:(id)a3 handleEscapeHatchError:(id)a4 completion:(id)a5;
- (void)piggyback:(id)a3 handleVerificationWithError:(id)a4 completion:(id)a5;
- (void)piggyback:(id)a3 promptForRandomCodeWithCompletion:(id)a4;
- (void)piggyback:(id)a3 shouldContinueWithCompletion:(id)a4;
- (void)piggyback:(id)a3 validateSecurityCode:(id)a4 completion:(id)a5;
- (void)refreshAuthMetadataWithContext:(id)a3 completion:(id)a4;
- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)reportSignOutForAllAppleIDsWithCompletion:(id)a3;
- (void)reportSignOutForAppleID:(id)a3 service:(int64_t)a4 completion:(id)a5;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)serverUIContext:(id)a3 processAdditionalData:(id)a4 completion:(id)a5;
- (void)setAppleIDWithAltDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6;
- (void)setAppleIDWithDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6;
- (void)setConfigurationInfo:(id)a3 forIdentifier:(id)a4 forAltDSID:(id)a5 completion:(id)a6;
- (void)setPasswordResetPresenter:(id)a3;
- (void)startPiggybackingForServerResponse:(id)a3 context:(id)a4 password:(id)a5 username:(id)a6 completion:(id)a7;
- (void)synchronizeFollowUpItemsForContext:(id)a3 completion:(id)a4;
- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4;
- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forAppleID:(id)a4 completion:(id)a5;
- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 completion:(id)a5;
- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5;
- (void)validateLoginCode:(unint64_t)a3 forAppleID:(id)a4 withCompletion:(id)a5;
- (void)validateVettingToken:(id)a3 forAltDSID:(id)a4 completion:(id)a5;
- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)warmUpVerificationSessionWithCompletion:(id)a3;
@end

@implementation AKAppleIDAuthenticationService

- (AKAppleIDAuthenticationService)initWithClient:(id)a3 passwordResetPresenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(AKAppleIDAuthSupportProxyImpl);
  v10 = [(AKAppleIDAuthenticationService *)self initWithProxy:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_client, a3);
    objc_storeStrong((id *)&v10->_passwordResetPresenter, a4);
  }

  return v10;
}

- (AKAppleIDAuthenticationService)initWithProxy:(id)a3
{
  id v5 = a3;
  v6 = [(AKAppleIDAuthenticationService *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authProxy, a3);
  }

  return v7;
}

- (AKAppleIDAuthenticationService)init
{
  v18.receiver = self;
  v18.super_class = (Class)AKAppleIDAuthenticationService;
  v2 = [(AKAppleIDAuthenticationService *)&v18 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    uint64_t v5 = +[AKTokenManager sharedInstance];
    tokenManager = v2->_tokenManager;
    v2->_tokenManager = (AKTokenManager *)v5;

    uint64_t v7 = +[AKAuthenticationUILiaison sharedInstance];
    authUILiaison = v2->_authUILiaison;
    v2->_authUILiaison = (AKAuthenticationUILiaison *)v7;

    uint64_t v9 = +[AKAuthenticationTrafficController sharedInstance];
    authTrafficController = v2->_authTrafficController;
    v2->_authTrafficController = (AKAuthenticationTrafficController *)v9;

    v11 = +[NSURL URLWithString:@"https://gsa.apple.com/grandslam/GsService2/lookup/v2"];
    v12 = [v11 host];
    uint64_t v13 = +[CUTReachability reachabilityWithHostName:v12];
    reachability = v2->_reachability;
    v2->_reachability = (CUTReachability *)v13;

    uint64_t v15 = +[AKProximityAuthFlowController shared];
    proximityServiceProvider = v2->proximityServiceProvider;
    v2->proximityServiceProvider = (_TtP3akd28ProximityAuthServiceProvider_ *)v15;
  }
  return v2;
}

+ (id)_verificationQueue
{
  if (qword_100272448 != -1) {
    dispatch_once(&qword_100272448, &stru_100228658);
  }
  v2 = (void *)qword_100272440;

  return v2;
}

- (void)accountNamesForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalAccess])
  {
    id v8 = +[AKUserInfoController sharedController];
    client = self->_client;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004A1E8;
    v12[3] = &unk_100228068;
    id v13 = v7;
    [v8 fetchUserInformationForAltDSID:v6 client:client completion:v12];

    v10 = v13;
  }
  else
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100183168();
    }

    v10 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)endProximityAuthenticationForContext:(id)a3 completion:(id)a4
{
  proximityServiceProvider = self->proximityServiceProvider;
  if (proximityServiceProvider) {
    [(ProximityAuthServiceProvider *)proximityServiceProvider endAuthenticationWithCompletion:a4];
  }
}

- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AKURLBagService sharedBagService];
  [v7 fetchURLBagForAltDSID:v6 completion:v5];
}

- (void)fetchURLBagFromCache:(BOOL)a3 altDSID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = +[AKURLBagService sharedBagService];
  [v9 fetchURLBagForAltDSID:v8 fromCache:v6 completion:v7];
}

- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[AKURLBagService sharedBagService];
  [v10 forceURLBagUpdateForAltDSID:v9 urlSwitchData:v8 completion:v7];
}

- (void)setAppleIDWithAltDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    v12 = [(id)objc_opt_class() _verificationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A564;
    block[3] = &unk_100228680;
    block[4] = self;
    id v16 = v10;
    BOOL v19 = a4;
    id v17 = v11;
    int64_t v18 = a5;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10018319C();
    }

    v14 = +[NSError ak_errorWithCode:-7025];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
  }
}

- (void)setAppleIDWithDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    v12 = [(id)objc_opt_class() _verificationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A780;
    block[3] = &unk_100228680;
    block[4] = self;
    id v16 = v10;
    BOOL v19 = a4;
    id v17 = v11;
    int64_t v18 = a5;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100183238();
    }

    v14 = +[NSError ak_errorWithCode:-7050];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
  }
}

- (void)_setAuthKitAccount:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, id, id))a6;
  if ([(AKClient *)self->_client hasInternalPrivateAccess]
    || [(AKClient *)self->_client hasWriteAccess])
  {
    if (a5)
    {
      if (v8
        || ([(AKAccountManager *)self->_accountManager servicesUsingAccount:v10],
            v12 = objc_claimAutoreleasedReturnValue(),
            id v13 = [v12 count],
            v12,
            v13))
      {
        v14 = _AKLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = +[NSNumber numberWithInteger:a5];
          CFStringRef v16 = @"not";
          *(_DWORD *)buf = 138412802;
          v35 = v15;
          __int16 v36 = 2112;
          if (v8) {
            CFStringRef v16 = &stru_100233250;
          }
          CFStringRef v37 = v16;
          __int16 v38 = 2112;
          id v39 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Marking service %@ as %@ using account %@.", buf, 0x20u);
        }
        [(AKAccountManager *)self->_accountManager setAccount:v10 inUse:v8 byService:a5];
        id v17 = [(AKAccountManager *)self->_accountManager servicesUsingAccount:v10];
        if ([v17 count])
        {
          accountManager = self->_accountManager;
          id v29 = 0;
          id v19 = [(AKAccountManager *)accountManager saveAccount:v10 error:&v29];
          id v20 = v29;
          if (v8)
          {
            v11[2](v11, v19, v20);
          }
          else
          {
            v27 = +[AKAppleIDCheckInHelperService sharedService];
            [v27 reportSignOutEventForService:a5 account:v10 completion:v11];
          }
        }
        else
        {
          v25 = _AKLogSystem();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Global signout.", buf, 2u);
          }

          v26 = +[AKAppleIDCheckInHelperService sharedService];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10004AD00;
          v30[3] = &unk_1002286A8;
          id v31 = v10;
          v32 = self;
          v33 = v11;
          [v26 reportFinalSignOutEventForAccount:v31 completion:v30];

          id v20 = v31;
        }
      }
      else
      {
        v28 = _AKLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1001833D8(a5, v28);
        }

        v11[2](v11, (id)1, 0);
      }
    }
    else
    {
      v21 = _AKLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1001832D4(v21);
      }

      v22 = +[NSError ak_errorWithCode:-7049];
      v11[2](v11, 0, v22);
    }
  }
  else
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100183474();
    }

    v24 = +[NSError ak_errorWithCode:-7026];
    v11[2](v11, 0, v24);
  }
}

- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    BOOL v8 = +[AKUserInfoController sharedController];
    client = self->_client;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004B080;
    v12[3] = &unk_100228068;
    id v13 = v7;
    [v8 fetchUserInformationForAltDSID:v6 client:client completion:v12];

    id v10 = v13;
  }
  else
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100183510();
    }

    id v10 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)getUserInformationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    BOOL v8 = +[AKUserInfoController sharedController];
    client = self->_client;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004B234;
    v12[3] = &unk_100228068;
    id v13 = v7;
    [v8 fetchUserInformationWithContext:v6 client:client completion:v12];

    id v10 = v13;
  }
  else
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100183510();
    }

    id v10 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    BOOL v8 = +[AKUserInfoController sharedController];
    client = self->_client;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004B400;
    v12[3] = &unk_100228068;
    id v13 = v7;
    [v8 fetchUserInformationForAltDSID:v6 client:client completion:v12];

    id v10 = v13;
  }
  else
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100183510();
    }

    id v10 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([(AKClient *)self->_client hasInternalAccess]
    || [(AKClient *)self->_client hasOwnerAccess])
  {
    id v11 = +[AKUserInfoController sharedController];
    [v11 updateUserInformationForAltDSID:v8 userInformation:v9 completion:v10];
  }
  else
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10017DD30();
    }

    id v11 = +[NSError ak_errorWithCode:-7026];
    v10[2](v10, 0, v11);
  }
}

- (void)fetchAuthModeWithContext:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004B610;
  v7[3] = &unk_1002286D0;
  id v8 = a4;
  id v6 = v8;
  [(AKAppleIDAuthenticationService *)self _fetchAuthModeInfoWithContext:a3 completion:v7];
}

- (void)_fetchAuthModeInfoWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004B71C;
  v13[3] = &unk_100228720;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [v12 fetchAuthModeWithContext:v11 client:client completion:v13];
}

- (BOOL)_shouldShowAlertForAuthModeError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  BOOL v5 = v3 && ([v3 code] == (id)-7093 || objc_msgSend(v4, "code") == (id)-7094);

  return v5;
}

- (void)_fetchDeviceSafetyRestrictionStateForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100183544();
  }

  id v9 = objc_opt_new();
  [v9 setAltDSID:v6];
  id v10 = [AKGrandSlamRequestProvider alloc];
  id v11 = [(AKURLRequestProviderImpl *)v10 initWithContext:v9 urlBagKey:AKURLBagKeyDeviceInfo];
  [(AKURLRequestProviderImpl *)v11 setClient:self->_client];
  [(AKGrandSlamRequestProvider *)v11 setAuthenticatedRequest:1];
  [(AKGrandSlamRequestProvider *)v11 setExpectedResponseType:1];
  id v12 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004BA08;
  v15[3] = &unk_100228748;
  id v16 = v6;
  id v17 = v7;
  id v13 = v6;
  id v14 = v7;
  [(AKServiceControllerImpl *)v12 executeRequestWithCompletion:v15];
}

- (void)_updateDeviceListResponseWithDeviceInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = +[AKFeatureManager sharedManager];
  unsigned __int8 v9 = [v8 isDTOEnabled];

  if (v9)
  {
    id v10 = +[AKConfiguration sharedConfiguration];
    id v11 = [v10 deviceSafetyRestrictionReasonOverride];

    if (v11)
    {
      id v12 = +[AKDevice currentDevice];
      id v13 = [v12 serialNumber];

      id v14 = [objc_alloc((Class)AKDeviceSafetyRestrictionState) initWithDeviceMID:0 serialNumber:v13 restrictionReason:v11];
      [v6 updateWithDeviceRestrictionState:v14];
      if (v7) {
        v7[2](v7, v6, 0);
      }
    }
    else
    {
      id v16 = [v6 altDSID];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004BE80;
      v17[3] = &unk_100228770;
      id v19 = v7;
      id v18 = v6;
      [(AKAppleIDAuthenticationService *)self _fetchDeviceSafetyRestrictionStateForAltDSID:v16 completion:v17];
    }
  }
  else
  {
    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001836DC();
    }

    if (v7) {
      v7[2](v7, v6, 0);
    }
  }
}

- (void)deviceListWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004C128;
    v18[3] = &unk_100228798;
    id v21 = v7;
    id v8 = v6;
    id v19 = v8;
    id v20 = self;
    unsigned __int8 v9 = objc_retainBlock(v18);
    id v10 = +[AKFeatureManager sharedManager];
    unsigned int v11 = [v10 isDeviceListCacheEnabled];

    if (v11)
    {
      [(AKAppleIDAuthenticationService *)self _fetchDeviceListWithContext:v8 completion:v9];
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10004C1F0;
      v14[3] = &unk_1002287E8;
      id v15 = v8;
      id v16 = self;
      id v17 = v9;
      [(AKAppleIDAuthenticationService *)self _performDeviceListRequestWithContext:v15 completion:v14];
    }
    id v13 = v21;
    goto LABEL_10;
  }
  id v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100183510();
  }

  if (v7)
  {
    id v13 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
LABEL_10:
  }
}

- (void)_performDeviceListRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  authTrafficController = self->_authTrafficController;
  client = self->_client;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004C4D8;
  v12[3] = &unk_100227A18;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(AKAuthenticationTrafficController *)authTrafficController beginAuthenticatedRequestWithContext:v11 client:client clearanceHandler:v12];
}

- (id)_deviceListProviderWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [AKDeviceListRequestProvider alloc];
  id v6 = [(AKURLRequestProviderImpl *)v5 initWithContext:v4 urlBagKey:AKURLBagKeyDeviceList];
  [(AKDeviceListRequestProvider *)v6 setDeviceRequestContext:v4];

  [(AKGrandSlamRequestProvider *)v6 setAuthenticatedRequest:1];
  id v7 = [(AKURLRequestProviderImpl *)v6 concreteAuthenticationContext];
  objc_msgSend(v7, "set_shouldSendGrandSlamTokensForRemoteUI:", 1);

  [(AKURLRequestProviderImpl *)v6 setClient:self->_client];

  return v6;
}

- (void)_handleDeviceListResponseRequestContext:(id)a3 responseError:(id)a4 responseData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, id))a6;
  if (v11)
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001837E0();
    }

    if (v13) {
      v13[2](v13, 0, v11);
    }
  }
  else
  {
    id v15 = +[AAFSerialization dictionaryFromObject:v12 ofType:@"application/json"];
    id v16 = +[AKDeviceListResponse deviceMapFromResponseBody:v15];
    objc_opt_class();
    id v17 = [v10 altDSID];
    id v18 = [v16 objectForKeyedSubscript:v17];
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    id v20 = [v19 deviceList];

    id v21 = _AKLogSystem();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138412290;
        id v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fetched device list for %@", (uint8_t *)&v26, 0xCu);
      }

      v23 = +[AKFeatureManager sharedManager];
      unsigned int v24 = [v23 isDeviceListCacheEnableDryMode];

      if (v24) {
        [(AKAppleIDAuthenticationService *)self _configureDeviceListCacheInBackgroundWithContext:v10 response:v19];
      }
      if (v13) {
        ((void (**)(id, id, id))v13)[2](v13, v19, 0);
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100183778();
      }

      v25 = +[NSError ak_deviceListErrorWithCode:-14002];
      if (v13) {
        v13[2](v13, 0, v25);
      }
    }
  }
}

- (void)_configureDeviceListCacheInBackgroundWithContext:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CB10;
  block[3] = &unk_100226BD8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)fetchAppListWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = a4;
  if ([(AKClient *)client hasOwnerAccess])
  {
    id v9 = +[AKApplicationInformationController sharedController];
    [v9 fetchAppInformationWithAltDSID:v6 client:self->_client completion:v8];
  }
  else
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100183934();
    }

    id v11 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v11);
  }
}

- (void)deleteAuthorizationDatabaseWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(AKClient *)self->_client hasInternalAccess]
    && ![(AKClient *)self->_client hasOwnerAccess])
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100183968();
    }

    id v9 = +[NSError ak_errorWithCode:-7026];
    id v10 = (void (*)(void *, uint64_t, id))v7[2];
    goto LABEL_8;
  }
  id v8 = +[AKAuthorizationStoreManager sharedInstance];
  id v15 = 0;
  [v8 clearDatabaseWithAltDSID:v6 error:&v15];
  id v9 = v15;

  id v10 = (void (*)(void *, uint64_t, id))v7[2];
  if (v9)
  {
LABEL_8:
    id v11 = v7;
    uint64_t v12 = 0;
    id v13 = v9;
    goto LABEL_9;
  }
  id v11 = v7;
  uint64_t v12 = 1;
  id v13 = 0;
LABEL_9:
  v10(v11, v12, v13);
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasInternalAccess]
    || [(AKClient *)self->_client hasOwnerAccess])
  {
    id v8 = objc_opt_new();
    [v8 revokeAuthorizationForApplicationWithClientID:v6 completion:v7];
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100183968();
    }

    id v8 = +[NSError ak_errorWithCode:-7026];
    v7[2](v7, 0, v8);
  }
}

- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[AKTTRController sharedController];
  [v6 performSilentTTRFor:a3 completion:v5];
}

- (void)warmUpVerificationSessionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, AKSatoriController *))a3;
  if ([(AKClient *)self->_client hasInternalAccess]
    || [(AKClient *)self->_client hasOwnerAccess])
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting WarmUp verification ...", v8, 2u);
    }

    id v6 = [[AKSatoriController alloc] initWithClient:0];
    [(AKSatoriController *)v6 warmUpVerificationSessionWithCompletionHandler:v4];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100183968();
    }

    id v6 = +[NSError ak_errorWithCode:-7026];
    v4[2](v4, 0, v6);
  }
}

- (void)setConfigurationInfo:(id)a3 forIdentifier:(id)a4 forAltDSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(AKClient *)self->_client hasInternalPrivateAccess]
    || [(AKClient *)self->_client hasWriteAccess])
  {
    id v14 = +[AKUserConfigController sharedController];
    client = self->_client;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004D284;
    v17[3] = &unk_1002270A8;
    id v18 = v13;
    [v14 setUserConfigForAltDSID:v12 client:client configurationInfo:v10 forIdentifier:v11 completion:v17];
  }
  else
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100183474();
    }

    id v14 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v14);
  }
}

- (void)configurationInfoWithIdentifiers:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (![(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100183474();
    }

    uint64_t v14 = -7026;
    goto LABEL_8;
  }
  if (!v8)
  {
    uint64_t v14 = -7053;
LABEL_8:
    id v15 = +[NSError ak_errorWithCode:v14];
    v10[2](v10, 0, v15);

    goto LABEL_9;
  }
  id v11 = +[AKUserConfigController sharedController];
  client = self->_client;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004D404;
  v16[3] = &unk_100228318;
  id v17 = v10;
  [v11 fetchUserConfigForAltDSID:v9 client:client dataCenter:0 forIdentifiers:v8 completion:v16];

LABEL_9:
}

- (void)isDevicePasscodeProtected:(id)a3
{
  id v5 = (void (**)(id, id, void))a3;
  id v3 = +[AKDevice currentDevice];
  id v4 = [v3 isProtectedWithPasscode];

  v5[2](v5, v4, 0);
}

- (void)activeLoginCode:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching login code", (uint8_t *)v9, 2u);
  }

  if (![(AKClient *)self->_client hasOwnerAccess])
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100183934();
    }

    id v6 = +[NSError ak_errorWithCode:-7026];
    v4[2](v4, 0, v6);
    goto LABEL_9;
  }
  if (v4)
  {
    id v6 = +[AKAppleIDPushHelperService sharedService];
    id v7 = [v6 activeCode];
    ((void (**)(id, void *, void *))v4)[2](v4, v7, 0);

LABEL_9:
  }
}

- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(33, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D698;
  block[3] = &unk_100228340;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)getServerUILoadDelegateForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setAltDSID:v7];

  [(AKAppleIDAuthenticationService *)self getServerUILoadDelegateWithContext:v8 completion:v6];
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forAppleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v11 setUsername:v9];

  [(AKAppleIDAuthenticationService *)self updateStateWithExternalAuthenticationResponse:v10 forContext:v11 completion:v8];
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(33, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004D9B0;
  v15[3] = &unk_1002288E8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)generateLoginCodeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  if ([(AKClient *)self->_client hasInternalAccess])
  {
    id v8 = 0;
    id v5 = +[AKAppleIDCodeGenerator generateLoginCode:&v8];
    id v6 = v8;
    if (v4) {
      v4[2](v4, v5, v6);
    }
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100183168();
    }

    id v6 = +[NSError ak_errorWithCode:-7026];
    v4[2](v4, 0, v6);
  }
}

- (void)validateLoginCode:(unint64_t)a3 forAppleID:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asked to validated code: %llu", (uint8_t *)&buf, 0xCu);
  }

  id v11 = [(AKAccountManager *)self->_accountManager authKitAccountWithAppleID:v8 error:0];
  if (v11)
  {
    id v12 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v11];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    id v31 = sub_10000F8D0;
    v32 = sub_10000F7B8;
    id v33 = 0;
    uint64_t v23 = 0;
    unsigned int v24 = &v23;
    uint64_t v25 = 0x3032000000;
    int v26 = sub_10000F8D0;
    id v27 = sub_10000F7B8;
    id v28 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004EB60;
    v19[3] = &unk_100228910;
    id v21 = &v23;
    v19[4] = self;
    id v20 = v11;
    p_long long buf = &buf;
    +[AKAccountManager performWithinPersonaForAccount:v20 withBlock:v19];
    id v13 = [(id)v24[5] token];
    id v14 = +[AKMasterToken tokenWithExternalizedVersionString:v13];

    if (v24[5] && v14)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004EBEC;
      v17[3] = &unk_100228938;
      id v18 = v9;
      [(AKAppleIDAuthenticationService *)self _validateLoginCode:a3 forAltDSID:v12 masterToken:v14 idmsData:0 authContext:0 completion:v17];
      id v15 = v18;
    }
    else
    {
      id v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100183B98();
      }

      id v15 = +[NSError ak_errorWithCode:-7024];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v15);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v12 = +[NSError ak_errorWithCode:-7023];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
  }
}

- (void)_validateLoginCode:(unint64_t)a3 forAltDSID:(id)a4 masterToken:(id)a5 idmsData:(id)a6 authContext:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v14)
  {
    id v18 = [a5 stringValue];
    if (v18)
    {
      [v16 setAltDSID:v14];
      [v16 _setRemoteUIIdentityToken:v18];
      [v16 setSecurityCode:a3];
      id v19 = [AKGrandSlamRequestProvider alloc];
      id v20 = [(AKURLRequestProviderImpl *)v19 initWithContext:v16 urlBagKey:AKURLBagKeyValidateCode];
      uint64_t v27 = AKIdmsDataKey;
      id v28 = v15;
      id v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [(AKURLRequestProviderImpl *)v20 setAuthKitBody:v21];

      [(AKURLRequestProviderImpl *)v20 setClient:self->_client];
      [(AKGrandSlamRequestProvider *)v20 setAuthenticatedRequest:0];
      [(AKURLRequestProviderImpl *)v20 setDataCenterIdentifier:0];
      v22 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v20];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10004EEC0;
      v25[3] = &unk_100227340;
      id v26 = v17;
      [(AKServiceControllerImpl *)v22 executeRequestWithCompletion:v25];
    }
    else
    {
      unsigned int v24 = _AKLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100183C3C();
      }

      id v20 = +[NSError ak_errorWithCode:-7037];
      (*((void (**)(id, void, void, void, AKGrandSlamRequestProvider *))v17 + 2))(v17, 0, 0, 0, v20);
    }
  }
  else
  {
    uint64_t v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100183C08();
    }

    id v18 = +[NSError ak_errorWithCode:-7025];
    (*((void (**)(id, void, void, void, void *))v17 + 2))(v17, 0, 0, 0, v18);
  }
}

- (void)validateVettingToken:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (![(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10017D8C8();
    }

    id v12 = +[NSError ak_errorWithCode:-7026];
    v10[2](v10, 0, v12);
  }
  if (![v8 length])
  {
    uint64_t v30 = _AKLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100183D84();
    }

    uint64_t v31 = -7056;
    goto LABEL_26;
  }
  if (![v9 length])
  {
    v32 = _AKLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100183DB8();
    }

    uint64_t v31 = -7025;
LABEL_26:
    id v14 = +[NSError ak_errorWithCode:v31];
    v10[2](v10, 0, v14);
    goto LABEL_34;
  }
  id v13 = [(AKAccountManager *)self->_accountManager authKitAccountWithAltDSID:v9 error:0];
  id v14 = v13;
  if (v13)
  {
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_10000F8D0;
    v50[4] = sub_10000F7B8;
    id v51 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = sub_10000F8D0;
    v48 = sub_10000F7B8;
    id v49 = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10004F878;
    v40[3] = &unk_100228910;
    v42 = &v44;
    v40[4] = self;
    id v14 = v13;
    id v41 = v14;
    v43 = v50;
    +[AKAccountManager performWithinPersonaForAccount:v14 withBlock:v40];
    id v15 = [(id)v45[5] token];
    id v16 = +[AKMasterToken tokenWithExternalizedVersionString:v15];

    if (!v45[5] || !v16)
    {
      id v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100183B98();
      }

      id v18 = +[NSError ak_errorWithCode:-7024];
      v10[2](v10, 0, v18);
    }
    id v19 = [v16 stringValue];
    if (v19)
    {
      v35 = v16;
      id v20 = +[AKURLBag bagForAltDSID:v9];
      id v21 = [v20 validateVettingTokenURL];

      if (v21)
      {
        id v22 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v21];
        uint64_t v23 = +[AKDevice currentDevice];
        unsigned int v24 = [v23 isProtectedWithPasscode];

        if (v24) {
          objc_msgSend(v22, "ak_addPRKRequestHeader");
        }
        objc_msgSend(v22, "ak_addDeviceUDIDHeader");
        objc_msgSend(v22, "ak_addDeviceMLBHeader");
        objc_msgSend(v22, "ak_addDeviceROMHeader");
        objc_msgSend(v22, "ak_addDeviceSerialNumberHeader");
        objc_msgSend(v22, "ak_addClientInfoHeader");
        objc_msgSend(v22, "ak_addInternalBuildHeader");
        objc_msgSend(v22, "ak_addSeedBuildHeader");
        objc_msgSend(v22, "ak_addFeatureMaskHeader");
        uint64_t v25 = [(AKClient *)self->_client name];
        objc_msgSend(v22, "ak_addClientApp:", v25);

        id v26 = [(AKClient *)self->_client bundleID];
        objc_msgSend(v22, "ak_addClientBundleIDHeader:", v26);

        objc_msgSend(v22, "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:", v19, v9);
        [v22 setValue:v8 forHTTPHeaderField:@"X-Apple-I-Vetting-Token"];
        uint64_t v27 = _AKLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Vetting-token validation request is ready to go.", buf, 2u);
        }

        id v28 = +[AKURLSession sharedURLSession];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10004F904;
        v36[3] = &unk_100228960;
        __int16 v38 = v10;
        id v37 = v14;
        id v29 = [v28 beginDataTaskWithRequest:v22 completionHandler:v36];
      }
      else
      {
        id v22 = +[NSError ak_errorWithCode:-7005];
        v10[2](v10, 0, v22);
      }

      id v16 = v35;
    }
    else
    {
      v34 = _AKLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100183C3C();
      }

      id v21 = +[NSError ak_errorWithCode:-7037];
      v10[2](v10, 0, v21);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(v50, 8);
  }
  else
  {
    id v33 = +[NSError ak_errorWithCode:-7055];
    v10[2](v10, 0, v33);
  }
LABEL_34:
}

- (void)isCreateAppleIDAllowedWithCompletion:(id)a3
{
  client = self->_client;
  id v4 = (void (**)(id, BOOL, void))a3;
  if ([(AKClient *)client hasInternalPrivateAccess])
  {
    id v5 = +[AKAccountManager sharedInstance];
    id v9 = [v5 allAuthKitAccountsWithError:0];

    id v6 = objc_msgSend(v9, "aaf_firstObjectPassingTest:", &stru_1002289A0);
    v4[2](v4, v6 == 0, 0);
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100183510();
    }

    id v8 = +[NSError ak_errorWithCode:-7026];
    ((void (**)(id, BOOL, void *))v4)[2](v4, 0, v8);
  }
}

- (void)checkSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (![(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100183510();
    }

    uint64_t v13 = -7026;
    goto LABEL_10;
  }
  id v8 = [v6 altDSID];

  if (!v8)
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100183FD0();
    }

    uint64_t v13 = -7025;
LABEL_10:
    id v10 = +[NSError ak_errorWithCode:v13];
    v7[2](v7, 0, v10);
    goto LABEL_11;
  }
  id v9 = [AKSecurityUpgradeEligibilityRequestProvider alloc];
  id v10 = [(AKURLRequestProviderImpl *)v9 initWithContext:v6 urlBagKey:AKURLBagKeyUpgradeEligibilityCheck];
  [(AKURLRequestProviderImpl *)v10 setClient:self->_client];
  id v11 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v10];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100050260;
  v15[3] = &unk_100228748;
  id v17 = v7;
  id v16 = v6;
  [(AKServiceControllerImpl *)v11 executeRequestWithCompletion:v15];

LABEL_11:
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Check-in with IdMS requested for account with altDSID: %@", buf, 0xCu);
  }

  if (!v8)
  {
    uint64_t v17 = -15002;
LABEL_11:
    id v12 = +[NSError ak_livenessErrorWithCode:v17];
    v10[2](v10, v12);
    goto LABEL_16;
  }
  if (!v9)
  {
    uint64_t v17 = -15003;
    goto LABEL_11;
  }
  id v12 = [(AKAccountManager *)self->_accountManager authKitAccountWithAltDSID:v8 error:0];
  uint64_t v13 = _AKLogSystem();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Performing liveness check-in for account: %@", buf, 0xCu);
    }

    id v15 = +[AKAppleIDCheckInHelperService sharedService];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005064C;
    v18[3] = &unk_1002270A8;
    id v19 = v10;
    [v15 performCheckInForAccount:v12 event:v9 reason:6 completion:v18];

    id v16 = v19;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10018406C();
    }

    id v16 = +[NSError ak_errorWithCode:-7055];
    v10[2](v10, v16);
  }

LABEL_16:
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  uint64_t v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Check-in with IdMS requested for account with altDSID: %@", buf, 0xCu);
  }

  if (!v10)
  {
    uint64_t v19 = -15002;
LABEL_11:
    id v14 = +[NSError ak_livenessErrorWithCode:v19];
    v12[2](v12, v14);
    goto LABEL_16;
  }
  if (!v11)
  {
    uint64_t v19 = -15003;
    goto LABEL_11;
  }
  id v14 = [(AKAccountManager *)self->_accountManager authKitAccountWithAltDSID:v10 error:0];
  id v15 = _AKLogSystem();
  id v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v23 = v14;
      __int16 v24 = 2048;
      unint64_t v25 = a5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Performing liveness check-in for account: %@ with reason: %lu", buf, 0x16u);
    }

    uint64_t v17 = +[AKAppleIDCheckInHelperService sharedService];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000508E0;
    v20[3] = &unk_1002270A8;
    id v21 = v12;
    [v17 performCheckInForAccount:v14 event:v11 reason:a5 completion:v20];

    id v18 = v21;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018406C();
    }

    id v18 = +[NSError ak_errorWithCode:-7055];
    v12[2](v12, v18);
  }

LABEL_16:
}

- (void)reportSignOutForAppleID:(id)a3 service:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSNumber numberWithInteger:a4];
    int v18 = 138412546;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asked to report signout from service %@ for Apple ID: %@", (uint8_t *)&v18, 0x16u);
  }
  if (![(AKClient *)self->_client hasInternalAccess])
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100183168();
    }

    uint64_t v16 = -7026;
    goto LABEL_12;
  }
  if (!v8)
  {
    uint64_t v16 = -7022;
LABEL_12:
    id v12 = +[NSError ak_errorWithCode:v16];
    v9[2](v9, 0, v12);
    goto LABEL_18;
  }
  id v12 = [(AKAccountManager *)self->_accountManager authKitAccountWithAppleID:v8 error:0];
  if (v12)
  {
    uint64_t v13 = +[AKAppleIDCheckInHelperService sharedService];
    id v14 = v13;
    if (a4) {
      [v13 reportSignOutEventForService:a4 account:v12 completion:v9];
    }
    else {
      [v13 reportFinalSignOutEventForAccount:v12 completion:v9];
    }
  }
  else
  {
    uint64_t v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001840D4();
    }

    id v14 = +[NSError ak_errorWithCode:-7023];
    v9[2](v9, 0, v14);
  }

LABEL_18:
}

- (void)reportSignOutForAllAppleIDsWithCompletion:(id)a3
{
  id v14 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asked to report signout for all Apple IDs", buf, 2u);
  }

  if ([(AKClient *)self->_client hasWriteAccess])
  {
    id obj = [(AKAccountManager *)self->_accountManager allAuthKitAccountsWithError:0];
    if ([obj count])
    {
      *(void *)long long buf = 0;
      __int16 v24 = buf;
      uint64_t v25 = 0x3032000000;
      id v26 = sub_10000F8D0;
      uint64_t v27 = sub_10000F7B8;
      id v28 = 0;
      id v5 = dispatch_group_create();
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id obj = obj;
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v20;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v8);
            dispatch_group_enter(v5);
            id v10 = +[AKAppleIDCheckInHelperService sharedService];
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_100050ECC;
            v16[3] = &unk_1002289C8;
            void v16[4] = v9;
            int v18 = buf;
            uint64_t v17 = v5;
            [v10 reportFinalSignOutEventForAccount:v9 completion:v16];

            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
        }
        while (v6);
      }

      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      id v11 = (void (*)(void *, uint64_t))v14[2];
      if (*((void *)v24 + 5)) {
        v11(v14, 0);
      }
      else {
        v11(v14, 1);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No IDMS accounts to sign out", buf, 2u);
      }

      ((void (*)(void *, uint64_t, void))v14[2])(v14, 1, 0);
    }
  }
  else
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018413C();
    }

    id obj = +[NSError ak_errorWithCode:-7026];
    ((void (*)(void *, void, id))v14[2])(v14, 0, obj);
  }
}

- (void)authenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create();
  uint64_t v9 = [(AKAppleIDAuthenticationService *)self _createProxAnalyticsForAuthenticationContextIfNeeded:v6];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100051544;
  v44[3] = &unk_1002289F0;
  id v10 = v8;
  id v45 = v10;
  uint64_t v46 = self;
  id v11 = v9;
  id v47 = v11;
  id v12 = v6;
  id v48 = v12;
  id v13 = v7;
  id v49 = v13;
  id v14 = objc_retainBlock(v44);
  if (!+[AAFDeviceInfo isDeviceInDiagnosticMode]
    && (+[AAFDeviceInfo isDeviceUnlockedSinceBoot](AAFDeviceInfo, "isDeviceUnlockedSinceBoot") & 1) == 0&& ([v12 allowAuthenticationBeforeFirstUnlock] & 1) == 0)
  {
    id v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Device should be unlocked after boot to continue authenticating.", buf, 2u);
    }

    uint64_t v21 = -7123;
    goto LABEL_40;
  }
  id v15 = +[AKAccountManager sharedInstance];
  uint64_t v16 = [v12 altDSID];
  unsigned __int8 v17 = [v15 hasPersonaAvailableForAltDSID:v16];

  if ((v17 & 1) == 0)
  {
    long long v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No persona, account is being removed, no need to re-auth.", buf, 2u);
    }

    uint64_t v21 = -7115;
    goto LABEL_40;
  }
  if ([v12 _capabilityForUIDisplay] == (id)3)
  {
    int v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The UI Surrogate is finally here! Bypassing Traffic Controller...", buf, 2u);
    }

    long long v19 = [(AKAuthenticationUILiaison *)self->_authUILiaison surrogateManager];
    [v19 registerUISurrogateContext:v12 client:self->_client completion:v14];
    goto LABEL_41;
  }
  id v22 = [v12 serviceType];
  if (![(AKClient *)self->_client isPermittedForInteractiveAuthOnLimitedContext])
  {
    unsigned int v23 = [v12 isContextEligibleForSilentAuthCoercion];
    if (v23 && v22 == (id)2)
    {
      __int16 v24 = +[AKConfiguration sharedConfiguration];
      id v25 = [v24 shouldAllowExperimentalMode];

      if (v25 != (id)1) {
        goto LABEL_24;
      }
    }
    else if ((v23 & 1) == 0)
    {
      goto LABEL_24;
    }
    uint64_t v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10018427C();
    }

    [v12 setAuthenticationType:0];
  }
LABEL_24:
  uint64_t v28 = [v12 username];
  if (v28)
  {
    id v29 = (void *)v28;
    uint64_t v30 = [v12 _password];
    if (v30 && [v12 authenticationType] == (id)1)
    {
      id v31 = [v12 _capabilityForUIDisplay];

      if (v31 == (id)2)
      {
        v32 = _AKLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_100184248();
        }

        [v12 setAuthenticationType:0];
      }
    }
    else
    {
    }
  }
  uint64_t v33 = [v12 companionKeyEnvelope];
  if (v33)
  {
    v34 = (void *)v33;
    unsigned __int8 v35 = [(AKClient *)self->_client hasCompanionKeyEnvelopeAccess];

    if ((v35 & 1) == 0)
    {
      id v39 = _AKLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1001841D8();
      }

      uint64_t v21 = -7026;
LABEL_40:
      long long v19 = +[NSError ak_errorWithCode:v21];
      ((void (*)(void *, void, void *))v14[2])(v14, 0, v19);
      goto LABEL_41;
    }
  }
  __int16 v36 = _AKLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Requesting clearance to begin auth with context %@...", buf, 0xCu);
  }

  authTrafficController = self->_authTrafficController;
  client = self->_client;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000515C8;
  v40[3] = &unk_100227A18;
  id v41 = v12;
  v42 = self;
  v43 = v14;
  [(AKAuthenticationTrafficController *)authTrafficController beginAuthenticatedRequestWithContext:v41 client:client clearanceHandler:v40];

  long long v19 = v41;
LABEL_41:
}

- (void)_authenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = 0;
  id v8 = [v6 authKitAccount:&v12];
  id v9 = v12;
  if (v8
    && [(AKAccountManager *)self->_accountManager accountAccessTelemetryOptInForAccount:v8])
  {
    id v10 = [(AKAccountManager *)self->_accountManager telemetryDeviceSessionIDForAccount:v8];
    [v6 setTelemetryDeviceSessionID:v10];
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1001842B0();
    }
  }
  if ([v6 needsRepair])
  {
    [(AKAppleIDAuthenticationService *)self _repairAppleIDWithContext:v6 completion:v7];
  }
  else if ([v6 needsCredentialRecovery])
  {
    [(AKAppleIDAuthenticationService *)self _recoverCredentialsAndAuthenticateWithContext:v6 completion:v7];
  }
  else if (([v6 needsNewAppleID] & 1) != 0 {
         || [v6 needsNewChildAccount])
  }
  {
    [(AKAppleIDAuthenticationService *)self _createNewAppleIDAndAuthenticateWithContext:v6 completion:v7];
  }
  else if ([v6 needsPasswordChange])
  {
    [(AKAppleIDAuthenticationService *)self _changePasswordAndAuthenticateWithContext:v6 completion:v7];
  }
  else if ([v6 needsSecurityUpgradeUI])
  {
    [(AKAppleIDAuthenticationService *)self _upgradeSecurityLevelWithContext:v6 completion:v7];
  }
  else
  {
    [(AKAppleIDAuthenticationService *)self _performAuthenticationWithContext:v6 completion:v7];
  }
}

- (void)_upgradeSecurityLevelWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting security upgrade flow…", buf, 2u);
  }

  id v9 = +[AKURLBag sharedBag];
  id v10 = [v9 upgradeUIURL];

  id v11 = +[NSMutableURLRequest requestWithURL:v10];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100051C14;
  v14[3] = &unk_100226AA8;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  [(AKAppleIDAuthenticationService *)self _showServerUIWithURLRequest:v11 context:v12 completion:v14];
}

- (void)_performAuthenticationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(AKAppleIDAuthenticationService *)self _isInteractiveAuthRequiredForContext:v6];
  id v9 = _AKLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Current context requires interactive auth. Trying biometric/passcode first.", buf, 2u);
    }

    [(AKAppleIDAuthenticationService *)self _attemptBiometricOrPasscodeAuthWithContext:v6 completion:v7];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Current context permits passwordless auth.", buf, 2u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100052040;
    v11[3] = &unk_100228A40;
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    [(AKAppleIDAuthenticationService *)self _attemptPasswordlessAuthOptionsWithContext:v12 completion:v11];
  }
}

- (void)_handlePasswordlessAuthResults:(id)a3 context:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (v12 && [v11 authenticationType] == (id)1)
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100184318();
    }

    NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
    id v15 = objc_msgSend(v12, "ac_secureCodingError");
    uint64_t v27 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    unsigned __int8 v17 = +[NSError errorWithDomain:AKAppleIDAuthenticationErrorDomain code:-7013 userInfo:v16];
    v13[2](v13, 0, v17);

    goto LABEL_19;
  }
  int v18 = [v12 domain];
  if ([v18 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {
    if ([v12 code] == (id)-7065)
    {

LABEL_11:
      long long v20 = _AKLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Canceling auth attempt because credential access is unavailable.", buf, 2u);
      }

      v13[2](v13, 0, v12);
      goto LABEL_19;
    }
    unsigned __int8 v19 = objc_msgSend(v12, "ak_isIncompatibleDevicesError");

    if (v19) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  if (!v12
    || [v12 code] == (id)-7120
    || ([v11 piggybackingForTrustedDevice] & 1) != 0
    || (objc_msgSend(v12, "ak_isServiceError") & 1) != 0)
  {
    ((void (**)(id, id, void *))v13)[2](v13, v10, v12);
  }
  else
  {
    uint64_t v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "All non-interactive auth options failed. Trying interactive auth.", buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100052564;
    v22[3] = &unk_100227DB0;
    id v23 = v12;
    __int16 v24 = v13;
    [(AKAppleIDAuthenticationService *)self _attemptInteractiveAuthWithContext:v11 completion:v22];
  }
LABEL_19:
}

- (BOOL)_isInteractiveAuthRequiredForContext:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v29 = 138412290;
    *(void *)&v29[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Determining if interactive auth is required for context %@...", v29, 0xCu);
  }

  id v6 = [v4 proxiedDeviceAnisetteData];
  if ([v4 authenticationType] == (id)2 || objc_msgSend(v4, "authenticationType") == (id)3)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 authenticationType];
      *(_DWORD *)id v29 = 134217984;
      *(void *)&v29[4] = v8;
      id v9 = "Context is explicitly configured for interactive auth %lul.";
      id v10 = v7;
      uint32_t v11 = 12;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, v29, v11);
    }
LABEL_28:
    BOOL v21 = 1;
    goto LABEL_29;
  }
  id v12 = [v4 _password];
  id v13 = [v12 length];

  if (v13)
  {
    id v7 = _AKLogSystem();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)id v29 = 0;
    id v9 = "A password was provided in the context, lets try interactive auth.";
LABEL_26:
    id v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_27;
  }
  id v14 = [v4 proxiedDevice];
  if (v14)
  {
    id v15 = [v4 proxiedAppleID];
    BOOL v16 = v15 == 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  unsigned __int8 v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"YES";
    if (v6) {
      CFStringRef v19 = @"YES";
    }
    else {
      CFStringRef v19 = @"NO";
    }
    *(_DWORD *)id v29 = 138412802;
    *(void *)&v29[4] = v19;
    *(_WORD *)&v29[12] = 2112;
    if (!v16) {
      CFStringRef v18 = @"NO";
    }
    *(void *)&v29[14] = v18;
    __int16 v30 = 2112;
    CFStringRef v31 = @"NO";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Has proxied anisette data: %@ - Easy Sign In: %@ - Long Distance Op: %@", v29, 0x20u);
  }

  if (v6) {
    int v20 = 1;
  }
  else {
    int v20 = v16;
  }
  if (v20 == 1)
  {
    id v7 = _AKLogSystem();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)id v29 = 0;
    id v9 = "Context is configured for a proxied auth that requires interaction.";
    goto LABEL_26;
  }
  if ([v4 isConfiguredForTokenUpgrade])
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      id v23 = "Context is configured for token upgrade, interactive auth is not required.";
LABEL_48:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v23, v29, 2u);
      goto LABEL_49;
    }
    goto LABEL_49;
  }
  uint64_t v24 = [v4 serviceIdentifiers];
  if (v24)
  {
    id v25 = (void *)v24;
    if ([v4 authenticationType])
    {
      id v26 = [v4 authenticationType];

      if (v26 != (id)1) {
        goto LABEL_36;
      }
    }
    else
    {
    }
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      id v23 = "Context is configured for silent service renew, interactive auth is not required.";
      goto LABEL_48;
    }
LABEL_49:
    BOOL v21 = 0;
    goto LABEL_29;
  }
LABEL_36:
  uint64_t v27 = _AKLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sanitizing context...", v29, 2u);
  }

  id v7 = [v4 authKitAccount:0];
  if (v7) {
    -[AKAppleIDAuthenticationService _correlateContext:withAuthModeInformation:](self, "_correlateContext:withAuthModeInformation:", v4, [(AKAccountManager *)self->_accountManager authenticationModeForAccount:v7], [(AKAccountManager *)self->_accountManager mdmInformationRequiredForAccount:v7]);
  }
  if (objc_msgSend(v4, "authenticationType", *(_OWORD *)v29) == (id)2
    || [v4 authenticationType] == (id)3)
  {
    uint64_t v28 = _AKLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Determined context requires interactive auth after sanitizing.", v29, 2u);
    }
    BOOL v21 = 1;
  }
  else
  {
    uint64_t v28 = _AKLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Context does not require interactive auth.", v29, 2u);
    }
    BOOL v21 = 0;
  }

LABEL_29:
  return v21;
}

- (id)_createProxAnalyticsForAuthenticationContextIfNeeded:(id)a3
{
  id v3 = a3;
  id v19 = 0;
  id v4 = [v3 authKitAccount:&v19];
  id v5 = v19;
  id v6 = v5;
  if (!v4 || v5)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100184380();
    }
  }
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v3 companionKeyEnvelope];
  unsigned int v10 = v9 != 0;

  if (v4) {
    unsigned int v10 = [v8 accountIsSignedIntoServices:v4] ^ 1;
  }
  uint32_t v11 = [v3 companionDevice];
  if (v11)
  {
    BOOL v12 = 1;
  }
  else
  {
    id v13 = [v3 companionDeviceAnisetteData];
    if (v13)
    {
      BOOL v12 = 1;
    }
    else
    {
      id v14 = [v3 companionKeyEnvelope];
      BOOL v12 = v14 != 0;
    }
  }

  if (v12) {
    unsigned int v15 = v10;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v15 == 1)
  {
    BOOL v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10018434C();
    }

    unsigned __int8 v17 = +[AAFAnalyticsEvent ak_analyticsEventWithEventName:@"com.apple.authkit.proximityAuthentication" account:v4 error:0];
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (void)_finishAnalyticsEvent:(id)a3 authenticationResults:(id)a4 authenticationContext:(id)a5 error:(id)a6
{
  if (a3)
  {
    id v9 = a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1001843E8();
    }

    objc_msgSend(v12, "ak_updateWithAuthenticationResults:authContext:error:", v11, v10, v9);
    id v14 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
    [v14 sendEvent:v12];
  }
}

- (void)performPasswordResetWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AKClient *)self->_client bundleID];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Password reset request received from client: %@", buf, 0xCu);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005301C;
  v21[3] = &unk_100228318;
  id v10 = v7;
  id v22 = v10;
  id v11 = objc_retainBlock(v21);
  id v12 = +[AKFeatureManager sharedManager];
  unsigned __int8 v13 = [v12 isForgotPasswordNativeTakeoverEnabled];

  if (v13)
  {
    if ([(AKClient *)self->_client hasOwnerAccess]
      || [(AKClient *)self->_client hasInternalAccess])
    {
      id v14 = +[AKAccountManager sharedInstance];
      unsigned int v15 = [v14 primaryAuthKitAccount];

      BOOL v16 = [v15 username];
      [v6 setUsername:v16];

      unsigned __int8 v17 = [(AKAppleIDAuthenticationService *)self passwordResetPresenter];
      [v17 presentWithContext:v6 completion:v11];

LABEL_12:
      goto LABEL_13;
    }
    int v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10018441C();
    }

    if (v11)
    {
      uint64_t v19 = -7026;
      goto LABEL_11;
    }
  }
  else
  {
    CFStringRef v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100184450();
    }

    if (v11)
    {
      uint64_t v19 = -7027;
LABEL_11:
      unsigned int v15 = +[NSError ak_errorWithCode:v19];
      ((void (*)(void *, void, void *))v11[2])(v11, 0, v15);
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)_attemptBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isContextEligibleForPasscodeAuth] & 1) != 0
    || [v6 isContextEligibleForBiometricOrPasscodeAuth])
  {
    [(AKAppleIDAuthenticationService *)self _showBiometricOrPasscodeAuthWithContext:v6 completion:v7];
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Biometric/Passcode validation not possible for current context.", v9, 2u);
    }

    [(AKAppleIDAuthenticationService *)self _attemptInteractiveAuthWithContext:v6 completion:v7];
  }
}

- (void)_showBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Collecting biometric/passcode validation...", buf, 2u);
  }

  authUILiaison = self->_authUILiaison;
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000532B4;
  v13[3] = &unk_100228A90;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(AKAuthenticationUILiaison *)authUILiaison presentBiometricOrPasscodeValidationForContext:v12 client:client completion:v13];
}

- (void)_attemptPasswordlessAuthOptionsWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isConfiguredForTokenUpgrade])
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Context is configured for token upgrade.", buf, 2u);
    }

    id v9 = [[AKTokenUpgrader alloc] initWithClient:self->_client];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005366C;
    v11[3] = &unk_100228AE0;
    id v12 = v9;
    unsigned __int8 v13 = self;
    id v14 = v6;
    id v15 = v7;
    id v10 = v9;
    [(AKTokenUpgrader *)v10 upgradeTokenWithContext:v14 completion:v11];
  }
  else
  {
    [(AKAppleIDAuthenticationService *)self _attemptPasswordlessAuthWithContext:v6 completion:v7];
  }
}

- (void)_attemptPasswordlessAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100053A84;
  v9[3] = &unk_100228B30;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(AKAppleIDAuthenticationService *)self _accountForContinuationWithContext:v7 completion:v9];
}

- (void)_accountForContinuationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v12 = 0;
  id v8 = [(AKAppleIDAuthenticationService *)self _accountForContinuationWithContext:v6 error:&v12];
  id v9 = v12;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if ([v6 isUsernameEditable])
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Silent auth not allowed due to username being editable", (uint8_t *)&v11, 2u);
    }

    [(AKAppleIDAuthenticationService *)self _showContinueUsingUIWithContext:v6 completion:v7];
  }
  else
  {
    ((void (**)(id, void *, id))v7)[2](v7, 0, v9);
  }
}

- (void)_showContinueUsingUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((+[AKAccountManager isAccountsFrameworkAvailable] & 1) == 0)
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Accounts not available, skipping IDMS account lookup...", buf, 2u);
    }

    goto LABEL_13;
  }
  if ([v6 _capabilityForUIDisplay] != (id)2)
  {
LABEL_13:
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_20;
  }
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Looking for IDMS accounts to suggest using...", buf, 2u);
  }

  id v9 = [(AKAccountManager *)self->_accountManager mostRecentlyUsedAuthKitAccount];
  if (v9)
  {
    id v10 = [(AKAccountManager *)self->_accountManager continuationTokenForAccount:v9];
    if (v10)
    {
      __int16 v11 = [v9 username];
      id v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Telling client to ask the user about using Apple ID: %@", buf, 0xCu);
      }

      authUILiaison = self->_authUILiaison;
      client = self->_client;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100054270;
      v17[3] = &unk_100228B80;
      id v20 = v7;
      void v17[4] = self;
      id v18 = v6;
      id v19 = v9;
      [(AKAuthenticationUILiaison *)authUILiaison presentKeepUsingUIForContext:v18 client:client appleID:v11 completion:v17];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    BOOL v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Nothing found.", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

LABEL_20:
}

- (id)_accountForContinuationWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((+[AKAccountManager isAccountsFrameworkAvailable] & 1) == 0)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v8 = "Accounts not available, skipping IDMS account lookup...";
      goto LABEL_7;
    }
LABEL_8:
    id v9 = 0;
    goto LABEL_29;
  }
  if ([v6 isUsernameEditable])
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v8 = "Rejecting CK auth because username is marked as editable";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v25 = 0;
  id v10 = [v6 authKitAccount:&v25];
  id v11 = v25;
  id v12 = _AKLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)long long buf = 138412290;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found an existing IDMS account %@", buf, 0xCu);
    }

    accountManager = self->_accountManager;
    id v24 = 0;
    id v15 = [(AKAccountManager *)accountManager continuationTokenForAccount:v10 error:&v24];
    id v12 = v24;
    if (v15)
    {
      id v16 = v10;
    }
    else
    {
      id v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100184484();
      }

      id v19 = [v12 domain];
      if ([v19 isEqualToString:ACErrorDomain])
      {
        id v20 = [v12 code];

        if (v20 == (id)10)
        {
          if (a4)
          {
            uint64_t v21 = AKAppleIDAuthenticationErrorDomain;
            NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
            uint64_t v27 = v12;
            id v22 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
            *a4 = +[NSError errorWithDomain:v21 code:-7065 userInfo:v22];
          }
          id v7 = 0;
          goto LABEL_28;
        }
      }
      else
      {
      }
      id v16 = 0;
    }
  }
  else
  {
    if (v13)
    {
      unsigned __int8 v17 = [v6 username];
      *(_DWORD *)long long buf = 138412290;
      id v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No existing IDMS account for %@", buf, 0xCu);
    }
    id v16 = 0;
  }

  id v7 = v16;
LABEL_28:

  id v9 = v7;
LABEL_29:

  return v9;
}

- (void)_attemptInteractiveAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 username];
  if ([v8 length])
  {
    id v9 = [v6 _password];
    id v10 = [v9 length];

    if (v10)
    {
      id v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Username and password already provided by context. One shot at non-interactive auth.", buf, 2u);
      }

      id v12 = [v6 username];
      BOOL v13 = [v6 _password];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100054A4C;
      v17[3] = &unk_1002287C0;
      id v18 = v6;
      id v19 = self;
      id v20 = v7;
      [(AKAppleIDAuthenticationService *)self _verifyUsername:v12 password:v13 context:v18 completion:v17];

      goto LABEL_12;
    }
  }
  else
  {
  }
  if (([v6 _shouldSkipInitialReachabilityCheck] & 1) != 0
    || [(CUTReachability *)self->_reachability currentReachabilityStatus])
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1001844F0();
    }

    [(AKAppleIDAuthenticationService *)self _performInteractiveAuthWithContext:v6 completion:v7];
  }
  else
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100184524();
    }

    id v16 = +[NSError ak_errorWithCode:-7005];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
LABEL_12:
}

- (void)refreshAuthMetadataWithContext:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054CEC;
  v7[3] = &unk_1002286A8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(AKAppleIDAuthenticationService *)v8 _refreshLocalAccountAndUpdateContext:v6 completion:v7];
}

- (void)_performInteractiveAuthWithContext:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054FD0;
  v8[3] = &unk_1002286A8;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(AKAppleIDAuthenticationService *)self refreshAuthMetadataWithContext:v7 completion:v8];
}

- (BOOL)_shouldBroadcastForProximity:(id)a3
{
  id v4 = a3;
  if (+[AKFeatureManager isProxForAuthkitEnabled](AKFeatureManager, "isProxForAuthkitEnabled")&& ([v4 disableProximityAuth] & 1) == 0)
  {
    id v6 = +[AKAccountManager sharedInstance];
    id v7 = [v6 primaryAuthKitAccount];

    BOOL v8 = [v4 _capabilityForUIDisplay] == (id)1 || objc_msgSend(v4, "_capabilityForUIDisplay") == (id)4;
    if ([v4 isContextRequestingReauthForExistingService])
    {
      id v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping proximity auth for re-authentication flows", v14, 2u);
      }
    }
    else if (!v7 {
           || (+[AKAccountManager sharedInstance],
    }
               id v10 = objc_claimAutoreleasedReturnValue(),
               unsigned int v11 = [v10 isProximityAuthEligible:v7],
               v10,
               v11))
    {
      unsigned __int8 v12 = [(ProximityAuthServiceProvider *)self->proximityServiceProvider shouldBeginProximityAuthentiation];
      if (v8) {
        BOOL v5 = 0;
      }
      else {
        BOOL v5 = v12;
      }
      goto LABEL_17;
    }
    BOOL v5 = 0;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v5 = 0;
LABEL_18:

  return v5;
}

- (void)_performInteractiveFederatedAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100184558();
  }

  authUILiaison = self->_authUILiaison;
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005568C;
  v13[3] = &unk_100228BD0;
  id v14 = v6;
  id v15 = v7;
  void v13[4] = self;
  id v11 = v6;
  id v12 = v7;
  [(AKAuthenticationUILiaison *)authUILiaison fetchUICapableContext:v11 client:client completion:v13];
}

- (void)_correlateContext:(id)a3 withAuthModeInformation:(id)a4
{
  BOOL var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v7 = a3;
  [v7 setAuthenticationMode:var0];
  if (+[AKFeatureManager isEnforceMDMPolicyEnabled](AKFeatureManager, "isEnforceMDMPolicyEnabled"))[v7 setIsMDMInformationRequired:var1]; {
  id v6 = objc_alloc_init(AKAuthenticationContextSanitizer);
  }
  [(AKAuthenticationContextSanitizer *)v6 sanitizeContext:v7];
}

- (void)_updateAltDSIDAndUsername:(id)a3
{
  id v3 = a3;
  id v4 = [v3 altDSID];

  if (v4)
  {
    BOOL v5 = +[AKAccountManager sharedInstance];
    id v6 = [v3 altDSID];
    id v7 = [v5 authKitAccountWithAltDSID:v6 error:0];

    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = [v3 username];
    if (!v8) {
      goto LABEL_16;
    }
    id v9 = (void *)v8;
    id v10 = [v3 username];
    id v11 = [v7 username];
    unsigned __int8 v12 = [v10 isEqualToString:v11];

    if (v12) {
      goto LABEL_16;
    }
    BOOL v13 = _AKLogSystem();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
LABEL_15:

      uint64_t v27 = [v7 username];
      [v3 setUsername:v27];

LABEL_16:
      goto LABEL_17;
    }
LABEL_14:
    sub_100184740(v3, v7);
    goto LABEL_15;
  }
  id v14 = [v3 DSID];

  if (v14)
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1001847FC();
    }

    id v16 = +[AKAccountManager sharedInstance];
    unsigned __int8 v17 = [v3 DSID];
    id v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 longLongValue]);
    id v7 = [v16 authKitAccountWithDSID:v18];

    uint64_t v19 = AKAltDSID;
    id v20 = [v7 accountPropertyForKey:AKAltDSID];

    if (!v20) {
      goto LABEL_16;
    }
    uint64_t v21 = [v7 accountPropertyForKey:v19];
    [v3 setAltDSID:v21];

    uint64_t v22 = [v3 username];
    if (!v22) {
      goto LABEL_16;
    }
    id v23 = (void *)v22;
    id v24 = [v3 username];
    id v25 = [v7 username];
    unsigned __int8 v26 = [v24 isEqualToString:v25];

    if (v26) {
      goto LABEL_16;
    }
    BOOL v13 = _AKLogSystem();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_17:
}

- (void)_refreshLocalAccountAndUpdateContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100184830();
  }

  if ([v6 _shouldRefreshAccountAndUpdateContext])
  {
    [(AKAppleIDAuthenticationService *)self _updateAltDSIDAndUsername:v6];
    id v9 = [v6 altDSID];

    if (v9)
    {
      id v10 = +[AKUserInfoController sharedController];
      id v11 = [v6 authKitAccount:0];
      unsigned __int8 v12 = [v10 previousAccountInfoRefreshDateForAccount:v11];

      if (v12
        && (+[NSDate date],
            BOOL v13 = objc_claimAutoreleasedReturnValue(),
            [v13 timeIntervalSinceDate:v12],
            double v15 = v14,
            v13,
            v15 < 86400.0))
      {
        id v16 = _AKLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Last account info validation was less than 24 hours ago. Skipping.", buf, 2u);
        }

        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      }
      else
      {
        unsigned __int8 v17 = [v6 altDSID];
        client = self->_client;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100055EDC;
        v20[3] = &unk_100228BF8;
        id v23 = v7;
        id v21 = v6;
        uint64_t v22 = self;
        [v10 fetchUserInformationForAltDSID:v17 client:client completion:v20];
      }
    }
    else
    {
      uint64_t v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No altDSID on context. Nothing to validate.", buf, 2u);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

- (void)_refreshAuthModeIfNecessaryForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 needsNewAppleID]) {
    goto LABEL_8;
  }
  if ([v6 needsNewChildAccount]) {
    goto LABEL_8;
  }
  if ([v6 needsCredentialRecovery]) {
    goto LABEL_8;
  }
  if ([v6 needsPasswordChange]) {
    goto LABEL_8;
  }
  uint64_t v8 = [v6 username];
  if (!v8) {
    goto LABEL_8;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [v6 username];
  if (!v10)
  {

LABEL_11:
    BOOL v13 = [v6 authKitAccount:0];
    if (v13)
    {
      unsigned int v14 = [(AKAccountManager *)self->_accountManager shouldUpdateAuthModeForAccount:v13];
      double v15 = _AKLogSystem();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          LOWORD(v21) = 0;
          unsigned __int8 v17 = "More than 24 hours since the last authentication mode was obtained, fetching authentication mode...";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, 2u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
      if (v16)
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Less than 24 hours since the last authentication mode was obtained, using last known authentication mode", (uint8_t *)&v21, 2u);
      }

      -[AKAppleIDAuthenticationService _correlateContext:withAuthModeInformation:](self, "_correlateContext:withAuthModeInformation:", v6, [(AKAccountManager *)self->_accountManager authenticationModeForAccount:v13], [(AKAccountManager *)self->_accountManager mdmInformationRequiredForAccount:v13]);
    }
    else
    {
      id v18 = [v6 authenticationMode];
      double v15 = _AKLogSystem();
      BOOL v19 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (!v18)
      {
        if (v19)
        {
          LOWORD(v21) = 0;
          unsigned __int8 v17 = "No AuthKit account and authentication mode is unknown, fetching authentication mode...";
          goto LABEL_25;
        }
LABEL_26:

        [(AKAppleIDAuthenticationService *)self _refreshAuthModeFromServerForContext:v6 completion:v7];
        goto LABEL_27;
      }
      if (v19)
      {
        id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 authenticationMode]);
        int v21 = 138412290;
        uint64_t v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping refresh, authmode is known: %@", (uint8_t *)&v21, 0xCu);
      }
    }
    v7[2](v7, 1, 0);
LABEL_27:

    goto LABEL_9;
  }
  id v11 = (void *)v10;
  id v12 = [v6 authenticationType];

  if (v12 != (id)3) {
    goto LABEL_11;
  }
LABEL_8:
  v7[2](v7, 1, 0);
LABEL_9:
}

- (void)_refreshAuthModeFromServerForContext:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056584;
  v8[3] = &unk_100228C20;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(AKAppleIDAuthenticationService *)self _fetchAuthModeInfoWithContext:v6 completion:v8];
}

- (void)_handleBasicLoginUICompletionWithUsername:(id)a3 password:(id)a4 context:(id)a5 additionalData:(id)a6 collectionError:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100056DD0;
  v70[3] = &unk_1002287C0;
  v70[4] = self;
  id v20 = v16;
  id v71 = v20;
  id v21 = v19;
  id v72 = v21;
  uint64_t v22 = objc_retainBlock(v70);
  if (v18)
  {
    id v49 = v15;
    id v23 = v17;
    id v24 = [v18 domain];
    uint64_t v25 = AKAppleIDAuthenticationErrorDomain;
    if ([v24 isEqual:AKAppleIDAuthenticationErrorDomain])
    {
      id v26 = [v18 code];

      if (v26 == (id)-7017)
      {
        uint64_t v27 = _AKLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "User forgot their credentials.", buf, 2u);
        }

        id v17 = v23;
        if (v14) {
          [v20 setUsername:v14];
        }
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_100056F38;
        v65[3] = &unk_100228C70;
        v65[4] = self;
        id v66 = v20;
        id v67 = v21;
        v68 = v22;
        [(AKAppleIDAuthenticationService *)self _recoverCredentialsAndAuthenticateWithContext:v66 completion:v65];

        uint64_t v28 = v66;
LABEL_20:

LABEL_32:
        id v15 = v49;
        goto LABEL_33;
      }
    }
    else
    {
    }
    CFStringRef v31 = [v18 domain];
    if ([v31 isEqual:v25])
    {
      id v32 = [v18 code];

      if (v32 == (id)-7016)
      {
        uint64_t v33 = _AKLogSystem();
        id v17 = v23;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "User requested a new Apple ID.", buf, 2u);
        }

        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100056FC8;
        v61[3] = &unk_100228C70;
        v61[4] = self;
        id v62 = v20;
        id v63 = v21;
        v64 = v22;
        [(AKAppleIDAuthenticationService *)self _createNewAppleIDAndAuthenticateWithContext:v62 completion:v61];

        uint64_t v28 = v62;
        goto LABEL_20;
      }
    }
    else
    {
    }
    id v17 = v23;
    if (objc_msgSend(v18, "ak_isUserCancelError"))
    {
      v34 = _AKLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        unsigned __int8 v35 = "User canceled. Aborting auth.";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
        goto LABEL_31;
      }
      goto LABEL_31;
    }
    if (objc_msgSend(v18, "ak_isIncompatibleDevicesError"))
    {
      v34 = _AKLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        unsigned __int8 v35 = "User has incompatible devices. Aborting auth.";
        goto LABEL_30;
      }
LABEL_31:

      ((void (*)(void *, void, id))v22[2])(v22, 0, v18);
      goto LABEL_32;
    }
    if ((objc_msgSend(v18, "ak_isUnableToPromptError") & 1) != 0
      || objc_msgSend(v18, "ak_isSurrogateAuthAlreadyInProgressError"))
    {
      __int16 v36 = _AKLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Unable to show prompt. Aborting auth.", buf, 2u);
      }

      id v37 = [v18 userInfo];
      uint64_t v38 = [v37 objectForKeyedSubscript:NSUnderlyingErrorKey];
      id v39 = (void *)v38;
      if (v38) {
        v40 = (void *)v38;
      }
      else {
        v40 = v18;
      }
      id v41 = v40;

      (*((void (**)(id, void, id))v21 + 2))(v21, 0, v41);
      goto LABEL_32;
    }
    v42 = [v18 domain];
    if ([v42 isEqual:v25])
    {
      unsigned int v43 = [v20 _keepAlive];

      if (v43)
      {
        [(AKAppleIDAuthenticationService *)self _keepLoginAliveWithContext:v20 error:v18 andCompletion:v21];
        id v17 = v23;
        goto LABEL_32;
      }
    }
    else
    {
    }
    uint64_t v44 = [v18 domain];
    if ([v44 isEqual:v25])
    {
      id v45 = [v18 code];

      if (v45 == (id)-7048)
      {
        v34 = _AKLogSystem();
        id v17 = v23;
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        *(_WORD *)long long buf = 0;
        unsigned __int8 v35 = "User request client alternate action. Aborting auth.";
        goto LABEL_30;
      }
    }
    else
    {
    }
    unsigned int v46 = objc_msgSend(v18, "ak_isUserTryAgainError");
    id v47 = _AKLogSystem();
    id v48 = v47;
    id v17 = v23;
    if (v46)
    {
      id v15 = v49;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "User chose to try again, aka retry auth.", buf, 2u);
      }

      [(AKAppleIDAuthenticationService *)self _showAlertForVerificationError:v18 context:v20 completion:v21];
    }
    else
    {
      id v15 = v49;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_100184950();
      }

      (*((void (**)(id, void, id))v21 + 2))(v21, 0, v18);
    }
  }
  else
  {
    if ([v14 length] && objc_msgSend(v15, "length"))
    {
      id v29 = _AKLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Successfully obtained password. Time for SRP auth.", buf, 2u);
      }

      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10005718C;
      v50[3] = &unk_100228CC0;
      id v51 = v17;
      v54 = v22;
      v52 = self;
      id v53 = v20;
      id v55 = v21;
      [(AKAppleIDAuthenticationService *)self _verifyUsername:v14 password:v15 context:v53 completion:v50];

      __int16 v30 = v51;
    }
    else
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1000570B8;
      v56[3] = &unk_100228C98;
      id v59 = v21;
      id v57 = v20;
      v58 = self;
      v60 = v22;
      [(AKAppleIDAuthenticationService *)self _handleMissingUsernameOrPasswordForContext:v57 password:v15 username:v14 completion:v56];

      __int16 v30 = v59;
    }
  }
LABEL_33:
}

- (void)_keepLoginAliveWithContext:(id)a3 error:(id)a4 andCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Prompt should be kept alive, retry auth.", v12, 2u);
  }

  if (v9 && (objc_msgSend(v9, "ak_isUserCancelError") & 1) == 0) {
    [(AKAppleIDAuthenticationService *)self _showAlertForVerificationError:v9 context:v8 completion:v10];
  }
  else {
    [(AKAppleIDAuthenticationService *)self _authenticateWithContext:v8 completion:v10];
  }
}

- (void)_handleMissingUsernameOrPasswordForContext:(id)a3 password:(id)a4 username:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 length])
  {
    [v10 setUsername:v12];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100057848;
    v18[3] = &unk_1002286A8;
    id v19 = v10;
    id v20 = self;
    id v21 = v13;
    [(AKAppleIDAuthenticationService *)self refreshAuthMetadataWithContext:v19 completion:v18];

    id v14 = v19;
  }
  else
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Username was not entered.", v17, 2u);
    }

    if (![v11 length])
    {
      id v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Password was not entered.", v17, 2u);
      }
    }
    id v14 = +[NSError ak_errorWithCode:-7012];
    [(AKAppleIDAuthenticationService *)self _showAlertForVerificationError:v14 context:v10 completion:v13];
  }
}

- (void)_handleVerificationError:(id)a3 forContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (!objc_msgSend(v8, "ak_isUserCancelError"))
  {
    if ([v8 code] != (id)-7006)
    {
      [(AKAppleIDAuthenticationService *)self _showAlertForVerificationError:v8 context:v9 completion:v10];
      goto LABEL_12;
    }
    id v16 = 0;
    unsigned int v11 = [(AKAppleIDAuthenticationService *)self _incrementAttemptsForContext:v9 error:&v16];
    id v12 = v16;
    if (v11)
    {
      if ([v9 _capabilityForUIDisplay] != (id)2)
      {
        id v15 = +[NSError ak_errorWithCode:-7017 underlyingError:v8];
        v10[2](v10, 0, v15);

        goto LABEL_11;
      }
      id v13 = self;
      id v14 = v12;
    }
    else
    {
      id v13 = self;
      id v14 = v8;
    }
    [(AKAppleIDAuthenticationService *)v13 _showAlertForVerificationError:v14 context:v9 completion:v10];
LABEL_11:

    goto LABEL_12;
  }
  v10[2](v10, 0, v8);
LABEL_12:
}

- (void)_showAlertForVerificationError:(id)a3 context:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100057C50;
  v9[3] = &unk_100228BA8;
  id v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(AKAppleIDAuthenticationService *)v10 _showAlertForLoginError:a3 context:v8 completion:v9];
}

- (BOOL)_incrementAttemptsForContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 username];
  if (![v6 length])
  {

LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  unsigned __int8 v7 = [v5 isUsernameEditable];

  if (v7) {
    goto LABEL_12;
  }
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 _attemptIndex]);
    int v14 = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Auth attempt %@ has failed. Incrementing counter...", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(v5, "set_attemptIndex:", (char *)objc_msgSend(v5, "_attemptIndex") + 1);
  id v10 = [v5 _attemptIndex];
  if (v10 < [v5 maximumLoginAttempts]) {
    goto LABEL_12;
  }
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Maximum password auth attempts have been reached.", (uint8_t *)&v14, 2u);
  }

  if (a4)
  {
    *a4 = +[NSError ak_errorWithCode:-7028];
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (void)_titleAndMessageForError:(id)a3 context:(id)a4 completion:(id)a5
{
  id v60 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, void *))a5;
  BOOL v12 = [v60 domain];
  unsigned int v13 = [v12 isEqualToString:AKAppleIDAuthenticationErrorDomain];

  if (!v13)
  {
    id v20 = [v60 domain];
    unsigned int v21 = [v20 isEqualToString:NSURLErrorDomain];

    if (!v21) {
      goto LABEL_62;
    }
LABEL_6:
    [(AKAppleIDAuthenticationService *)self _titleAndMessageForBadNetworkRelatedErrorWithCompletion:v11];
    uint64_t v22 = 0;
    id v15 = 0;
    goto LABEL_67;
  }
  if ([v60 code] == (id)-7006)
  {
    int v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v15 = [v14 localizedStringForKey:@"WRONG_PASSWORD_ALERT_TITLE" value:&stru_100233250 table:@"Localizable"];

    id v16 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v17 = @"WRONG_PASSWORD_ALERT_MESSAGE";
    unsigned __int8 v18 = [@"WRONG_PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"];
    if (v18)
    {
      int v19 = 0;
    }
    else
    {
      id v6 = +[AKFeatureManager sharedManager];
      if ([v6 isAABrandingEnabled])
      {
        id v17 = [@"WRONG_PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
        int v19 = 1;
      }
      else
      {
        int v19 = 0;
      }
    }
    uint64_t v22 = [v16 localizedStringForKey:v17 value:&stru_100233250 table:@"Localizable"];
    if (v19) {

    }
    if ((v18 & 1) == 0) {
    goto LABEL_65;
    }
  }
  if ([v60 code] == (id)-7012)
  {
    id v23 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v24 = @"MISSING_INPUT_ALERT_TITLE";
    unsigned __int8 v25 = [@"MISSING_INPUT_ALERT_TITLE" containsString:@"REBRAND"];
    if (v25)
    {
      int v26 = 0;
    }
    else
    {
      id v5 = +[AKFeatureManager sharedManager];
      if ([v5 isAABrandingEnabled])
      {
        id v24 = [@"MISSING_INPUT_ALERT_TITLE" stringByAppendingString:@"_REBRAND"];
        int v26 = 1;
      }
      else
      {
        int v26 = 0;
      }
    }
    id v15 = [v23 localizedStringForKey:v24 value:&stru_100233250 table:@"Localizable"];
    if (v26) {

    }
    if ((v25 & 1) == 0) {
    uint64_t v28 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    }
    id v16 = v28;
    CFStringRef v29 = @"MISSING_INPUT_ALERT_MESSAGE";
    goto LABEL_63;
  }
  if ([v60 code] == (id)-7005 || objc_msgSend(v60, "code") == (id)-7029) {
    goto LABEL_6;
  }
  if ([v60 code] == (id)-7036)
  {
    uint64_t v27 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v15 = [v27 localizedStringForKey:@"CODE_INVALID_TITLE" value:&stru_100233250 table:@"Localizable"];

    uint64_t v28 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v16 = v28;
    CFStringRef v29 = @"CODE_INVALID_MESSAGE";
LABEL_63:
    uint64_t v50 = [v28 localizedStringForKey:v29 value:&stru_100233250 table:@"Localizable"];
    goto LABEL_64;
  }
  if ([v60 code] == (id)-7043)
  {
    __int16 v30 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v15 = [v30 localizedStringForKey:@"UNDERAGE_ALERT_TITLE" value:&stru_100233250 table:@"Localizable"];

    uint64_t v28 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v16 = v28;
    CFStringRef v29 = @"UNDERAGE_ALERT_MESSAGE";
    goto LABEL_63;
  }
  if ([v60 code] == (id)-7093)
  {
    CFStringRef v31 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v32 = @"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_TITLE";
    unsigned __int8 v33 = [@"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_TITLE" containsString:@"REBRAND"];
    if (v33)
    {
      int v34 = 0;
    }
    else
    {
      id v59 = +[AKFeatureManager sharedManager];
      if ([v59 isAABrandingEnabled])
      {
        id v32 = [@"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_TITLE" stringByAppendingString:@"_REBRAND"];
        int v34 = 1;
      }
      else
      {
        int v34 = 0;
      }
    }
    uint64_t v44 = [v31 localizedStringForKey:v32 value:&stru_100233250 table:@"Localizable"];
    id v45 = [v10 username];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v44, v45);

    if (v34) {
    if ((v33 & 1) == 0)
    }

    uint64_t v28 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v16 = v28;
    CFStringRef v29 = @"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_MESSAGE";
    goto LABEL_63;
  }
  if ([v60 code] == (id)-7094)
  {
    unsigned __int8 v35 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    __int16 v36 = [v35 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_NEEDS_SETTINGS_REDIRECT_TITLE" value:&stru_100233250 table:@"Localizable"];
    id v37 = [v10 username];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v37);

    uint64_t v28 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v16 = v28;
    CFStringRef v29 = @"APPLE_MANAGED_ACCOUNT_NEEDS_SETTINGS_REDIRECT_MESSAGE";
    goto LABEL_63;
  }
  if ([v60 code] == (id)-7100)
  {
    uint64_t v38 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v15 = [v38 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_UNABLE_TO_SIGN_IN_TITLE" value:&stru_100233250 table:@"Localizable"];

    id v39 = [v60 userInfo];
    id v16 = [v39 objectForKeyedSubscript:AKAuthenticationManagedOrganizationNameKey];

    id v40 = [v16 length];
    id v41 = [0 length];
    if (v41 && v40)
    {
      v42 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
      unsigned int v43 = [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_ORGNAME_FORMAT" value:&stru_100233250 table:@"Localizable"];
      v58 = v16;
    }
    else
    {
      if (v40)
      {
        v42 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
        unsigned int v43 = [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_ORGNAME_FORMAT" value:&stru_100233250 table:@"Localizable"];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v43, v16, v58);
        goto LABEL_54;
      }
      if (!v41)
      {
        v42 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
        uint64_t v22 = [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE" value:&stru_100233250 table:@"Localizable"];
        goto LABEL_55;
      }
      v42 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
      unsigned int v43 = [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_FORMAT" value:&stru_100233250 table:@"Localizable"];
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v43, 0, v58);
    uint64_t v22 = LABEL_54:;

LABEL_55:
    goto LABEL_65;
  }
  unsigned int v46 = [v60 userInfo];
  NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
  id v48 = [v46 objectForKeyedSubscript:NSLocalizedDescriptionKey];

  if (!v48)
  {
    id v51 = [v60 userInfo];
    NSErrorUserInfoKey v47 = NSLocalizedFailureReasonErrorKey;
    uint64_t v52 = [v51 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];
    if (v52)
    {
      id v53 = (void *)v52;
      v54 = [v60 userInfo];
      id v55 = [v54 objectForKeyedSubscript:NSLocalizedFailureErrorKey];

      if (v55)
      {
        v56 = [v60 userInfo];
        id v15 = [v56 objectForKeyedSubscript:NSLocalizedFailureErrorKey];

        goto LABEL_51;
      }
    }
    else
    {
    }
LABEL_62:
    id v57 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v15 = [v57 localizedStringForKey:@"UNKNOWN_ERROR_ALERT_TITLE" value:&stru_100233250 table:@"Localizable"];

    uint64_t v28 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v16 = v28;
    CFStringRef v29 = @"UNKNOWN_ERROR_ALERT_MESSAGE";
    goto LABEL_63;
  }
  id v49 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  id v15 = [v49 localizedStringForKey:@"SRP_VERIFICATION_ERROR_TITLE" value:&stru_100233250 table:@"Localizable"];

LABEL_51:
  id v16 = [v60 userInfo];
  uint64_t v50 = [v16 objectForKeyedSubscript:v47];
LABEL_64:
  uint64_t v22 = (void *)v50;
LABEL_65:

  if (v11) {
    v11[2](v11, v15, v22);
  }
LABEL_67:
}

- (void)_titleAndMessageForBadNetworkRelatedErrorWithCompletion:(id)a3
{
  unsigned __int8 v7 = (void (**)(id, void *, void *))a3;
  id v3 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  id v4 = [v3 localizedStringForKey:@"BAD_NETWORK_ALERT_TITLE" value:&stru_100233250 table:@"Localizable"];

  id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  id v6 = [v5 localizedStringForKey:@"BAD_NETWORK_ALERT_MESSAGE" value:&stru_100233250 table:@"Localizable"];

  if (v7) {
    v7[2](v7, v4, v6);
  }
}

- (void)_showAlertForLoginError:(id)a3 context:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100058AB0;
  v11[3] = &unk_100228CE8;
  id v12 = a3;
  unsigned int v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  [(AKAppleIDAuthenticationService *)self _titleAndMessageForError:v10 context:v9 completion:v11];
}

- (void)_checkFreshnessAndVerifyWithPassword:(id)a3 serverResponse:(id)a4 additionalData:(id)a5 secondaryActionError:(id)a6 context:(id)a7 newServerResponse:(id)a8 username:(id)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v29 = v15;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  uint64_t v22 = [a4 secondaryActionURLKey];

  id v23 = v29;
  if (!v21)
  {
    uint64_t v24 = AKAuthenticationPasswordKey;
    unsigned __int8 v25 = [v16 objectForKeyedSubscript:AKAuthenticationPasswordKey];

    id v23 = v29;
    if (v25)
    {
      id v23 = [v16 objectForKeyedSubscript:v24];
    }
  }
  BOOL v26 = v22 != 0;
  uint64_t v27 = [v16 objectForKeyedSubscript:AKAuthenticationNewAppleIDSetupInfoKey];
  [(AKAppleIDAuthenticationService *)self _handleVerificationCompletionForUsername:v18 password:v23 serverResponse:v19 didShowServerUI:v26 continuationData:v27 error:v21 context:v20 completion:v17];
}

- (void)_verifyUsername:(id)a3 password:(id)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v12 setUsername:v10];
  id v14 = [(AKAppleIDAuthenticationService *)self _srpAuthContextHelperWithContext:v12];
  [v14 setPassword:v11];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100058E58;
  v19[3] = &unk_100228D10;
  id v20 = v12;
  id v21 = self;
  id v22 = v11;
  id v23 = v10;
  id v24 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  [(AKAppleIDAuthenticationService *)self _performSRPAuthenticationWithContext:v14 completion:v19];
}

- (void)_performPasswordlessSRPAuthWithContext:(id)a3 completion:(id)a4
{
}

- (void)_performPasswordlessSRPAuthWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
}

- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v11 username];
  if (v10)
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting passwordless auth with IDMS account %@...", buf, 0xCu);
    }

    uint64_t v16 = [(__CFString *)v10 username];

    [v11 setUsername:v16];
    id v14 = (void *)v16;
  }
  id v17 = [(AKAppleIDAuthenticationService *)self _srpAuthContextHelperWithContext:v11];
  [v17 setAuthKitAccount:v10];
  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v33 = [v11 passwordlessToken];
    id v19 = v10;
    id v20 = self;
    if (v33) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    id v22 = [v11 idmsDataToken];
    CFStringRef v23 = @"YES";
    if (!v22) {
      CFStringRef v23 = @"NO";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v42 = v21;
    self = v20;
    id v10 = v19;
    __int16 v43 = 2112;
    CFStringRef v44 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PasswordlessSRP with passwordlessToken: %@ idmsDataToken: %@", buf, 0x16u);
  }
  id v24 = [v11 passwordlessToken];

  if (v24)
  {
    unsigned __int8 v25 = [v11 passwordlessToken];
    [v17 setPasswordlessToken:v25];

    BOOL v26 = [v11 idmsDataToken];

    if (v26)
    {
      uint64_t v27 = [v11 idmsDataToken];
      [v17 setIdmsDataToken:v27];
    }
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10005974C;
  v34[3] = &unk_100228D88;
  id v35 = v17;
  id v36 = v14;
  id v37 = v11;
  uint64_t v38 = self;
  id v39 = v12;
  id v40 = v13;
  id v28 = v12;
  id v29 = v11;
  id v30 = v13;
  id v31 = v14;
  id v32 = v17;
  [(AKAppleIDAuthenticationService *)self _performSRPAuthenticationWithContext:v32 completion:v34];
}

- (id)_srpAuthContextHelperWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[AKSRPAuthenticationContextHelper alloc] initWithContext:v4];
  id v6 = [v4 username];

  [(AKSRPContextHelper *)v5 setUsername:v6];
  [(AKSRPContextHelper *)v5 setClient:self->_client];

  return v5;
}

- (void)_performSRPAuthenticationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKConfiguration sharedConfiguration];
  id v9 = [v8 shouldFakeAuthSuccess];

  if (v9 == (id)1)
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Faking IDMS auth success!", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    id v11 = [v6 authContext];
    id v12 = [v11 authenticationMode];

    if (v12)
    {
      [(AKAppleIDAuthenticationService *)self _performSafeSRPAuthenticationWithContext:v6 completion:v7];
    }
    else
    {
      id v13 = [v6 authContext];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10005A180;
      v14[3] = &unk_1002286A8;
      void v14[4] = self;
      id v15 = v6;
      id v16 = v7;
      [(AKAppleIDAuthenticationService *)self _refreshAuthModeIfNecessaryForContext:v13 completion:v14];
    }
  }
}

- (void)_performSafeSRPAuthenticationWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [v7 authKitAccount:0];
  id v10 = [v7 authContext];
  if ([v10 authenticationMode] == (id)1) {
    goto LABEL_5;
  }
  id v11 = [v7 authContext];
  id v12 = [v11 companionKeyEnvelope];
  if (v12)
  {
    id v4 = [v7 authContext];
    id v13 = [v4 companionDevice];
    if (v13)
    {

LABEL_5:
      goto LABEL_6;
    }
  }
  id v19 = +[AKAccountManager sharedInstance];
  id v20 = [v19 authenticationModeForAccount:v9];

  if (v12)
  {
  }
  if (v20 != (id)1) {
    goto LABEL_14;
  }
LABEL_6:
  id v21 = 0;
  unsigned __int8 v14 = [v7 isContextSecretValidForSRP:&v21];
  id v15 = (AKSRPService *)v21;
  id v16 = v15;
  if (v14)
  {

LABEL_14:
    id v16 = [[AKSRPService alloc] initWithClient:self->_client];
    [(AKSRPService *)v16 performSRPContractWithContext:v7 completion:v8];
    goto LABEL_15;
  }
  id v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100184AF0(v7, v17);
  }

  id v18 = +[NSError ak_errorWithCode:-7075 underlyingError:v16];
  v8[2](v8, 0, v18);

LABEL_15:
}

- (void)_handleVerificationCompletionForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10
{
  BOOL v12 = a6;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005A4B8;
  v23[3] = &unk_100228DB0;
  id v27 = v16;
  id v28 = a10;
  id v24 = v17;
  unsigned __int8 v25 = self;
  id v26 = v18;
  id v19 = v16;
  id v20 = v18;
  id v21 = v17;
  id v22 = v28;
  [(AKAppleIDAuthenticationService *)self _shouldContinueAuthenticatingForUsername:a3 password:a4 serverResponse:v19 didShowServerUI:v12 continuationData:a7 error:v21 context:v20 completion:v23];
}

- (void)_shouldContinueAuthenticatingForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10
{
  BOOL v148 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = [v19 domain];
  if ([v22 isEqual:AKAppleIDAuthenticationErrorDomain])
  {
    id v23 = [v19 code];

    if (v23 == (id)-7014)
    {
      id v24 = _AKLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100184C24();
      }

LABEL_14:
      (*((void (**)(id, void, void, id))v21 + 2))(v21, 0, 0, v19);
      goto LABEL_143;
    }
  }
  else
  {
  }
  unsigned int v25 = objc_msgSend(v19, "ak_isUserCancelError");
  id v26 = _AKLogSystem();
  id v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "User canceled. Aborting auth.", buf, 2u);
    }

    if (v148)
    {
      id v28 = v21;
      id v29 = v20;
      id v30 = v18;
      id v31 = v15;
      id v32 = _AKLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_100184C58();
      }

      unsigned __int8 v33 = +[NSError ak_errorWithCode:-7052];
      NSErrorUserInfoKey v159 = NSUnderlyingErrorKey;
      v160 = v33;
      int v34 = +[NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];
      uint64_t v35 = objc_msgSend(v19, "ak_errorByAppendingUserInfo:", v34);

      id v19 = (id)v35;
      id v15 = v31;
      id v18 = v30;
      id v20 = v29;
      id v21 = v28;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_100184D28();
  }

  id v36 = [v17 appleID];

  id v147 = v16;
  if (v36)
  {
    id v37 = _AKLogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_100184CF4();
    }
  }
  else
  {
    uint64_t v38 = _AKLogSystem();
    id v37 = v38;
    if (v15)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        sub_100184CC0();
      }
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      sub_100184C8C();
    }
  }

  id v39 = objc_alloc_init((Class)NSMutableDictionary);
  id v40 = [v20 telemetryFlowID];
  [v39 setObject:v40 forKeyedSubscript:AKAuthenticationTelemetryFlowID];

  uint64_t v41 = [v17 appleID];
  CFStringRef v42 = (void *)v41;
  if (v41) {
    __int16 v43 = (void *)v41;
  }
  else {
    __int16 v43 = v15;
  }
  id v44 = v43;

  [v39 setObject:v44 forKeyedSubscript:AKAuthenticationUsernameKey];
  if (v44) {
    [v20 setUsername:v44];
  }
  id v45 = [v17 altDSID];

  if (v45)
  {
    unsigned int v46 = [v17 altDSID];
    [v20 setAltDSID:v46];
  }
  v141 = v44;
  NSErrorUserInfoKey v47 = [v17 passwordEquivalentToken];

  if (v47)
  {
    id v48 = [v17 passwordEquivalentToken];
    id v49 = [v48 stringValue];
    [v39 setObject:v49 forKeyedSubscript:AKAuthenticationPasswordKey];

LABEL_34:
    goto LABEL_36;
  }
  if (!v19)
  {
    id v48 = _AKLogSystem();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Successful SRP did not return a PET to client.", buf, 2u);
    }
    goto LABEL_34;
  }
LABEL_36:
  uint64_t v50 = [v17 shortLivedToken];

  v146 = self;
  if (v50)
  {
    id v51 = v21;
    id v52 = v18;
    id v53 = [v17 shortLivedToken];
    v54 = [v53 stringValue];
    id v55 = &AKAuthenticationShortLivedTokenKey;
LABEL_38:
    [v39 setObject:v54 forKeyedSubscript:*v55];

    id v18 = v52;
    id v21 = v51;
    self = v146;
    goto LABEL_39;
  }
  id v53 = [v17 masterToken];
  if (v53)
  {
    if ([v20 shouldRequestShortLivedToken])
    {
      id v51 = v21;
      id v145 = v20;
      id v52 = v18;
      id v111 = v15;
      v112 = _AKLogSystem();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Providing short-lived token", buf, 2u);
      }
      id v55 = &AKAuthenticationShortLivedTokenKey;
LABEL_151:

      v54 = [v53 stringValue];
      id v15 = v111;
      id v20 = v145;
      goto LABEL_38;
    }
    if (-[AKClient hasInternalAccess](self->_client, "hasInternalAccess") && [v17 authMode])
    {
      id v51 = v21;
      id v145 = v20;
      id v52 = v18;
      id v111 = v15;
      v112 = _AKLogSystem();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Providing identity token", buf, 2u);
      }
      id v55 = &AKAuthenticationIdentityTokenKey;
      goto LABEL_151;
    }
  }
LABEL_39:

  v56 = [v17 inheritanceBeneficiarySetupToken];
  id v57 = [v56 stringValue];

  if (v57)
  {
    v58 = _AKLogSystem();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Providing beneficiary setup token", buf, 2u);
    }

    id v59 = [v17 inheritanceBeneficiarySetupToken];
    id v60 = [v59 stringValue];
    [v39 setObject:v60 forKeyedSubscript:AKAuthenticationInheritanceBeneficiarySetupTokenKey];
  }
  v61 = [v17 beneficiaryIdentifier];

  if (v61)
  {
    id v62 = [v17 beneficiaryIdentifier];
    [v39 setObject:v62 forKeyedSubscript:AKAuthenticationInheritanceBeneficiaryIdentifierKey];
  }
  id v63 = [v17 beneficiaryWrappedKey];

  if (v63)
  {
    v64 = [v17 beneficiaryWrappedKey];
    [v39 setObject:v64 forKeyedSubscript:AKAuthenticationInheritanceBeneficiaryWrappedKey];
  }
  uint64_t v65 = [v17 dsid];
  if (v65) {
    [v39 setObject:v65 forKeyedSubscript:AKAuthenticationDSIDKey];
  }
  uint64_t v66 = [v17 altDSID];
  if (v66) {
    [v39 setObject:v66 forKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  }
  if (v148) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationDidShowServerUIKey];
  }
  if (([v20 needsNewAppleID] & 1) != 0
    || [v20 needsNewChildAccount])
  {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationNewAccountCreated];
  }
  if (v18) {
    [v39 setObject:v18 forKeyedSubscript:AKAuthenticationNewAppleIDSetupInfoKey];
  }
  v140 = (void *)v65;
  if ([v17 appleIDSecurityLevel] == (id)4) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationIsHSA2Key];
  }
  if (v147
    && [(AKClient *)self->_client hasInternalAccess]
    && [v17 authMode] != (id)2)
  {
    id v67 = _AKLogSystem();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Providing raw password to an internal client.", buf, 2u);
    }

    [v39 setObject:v147 forKeyedSubscript:AKAuthenticationRawPasswordKey];
  }
  id v143 = v18;
  v68 = [v17 acceptedTermsInfo];

  if (v68)
  {
    v69 = [v17 acceptedTermsInfo];
    [v39 setObject:v69 forKeyedSubscript:AKAuthenticationAcceptedTermsKey];
  }
  if ([v17 appleIDSecurityLevel])
  {
    v70 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 appleIDSecurityLevel]);
    [v39 setObject:v70 forKeyedSubscript:AKAuthenticationSecurityLevelKey];
  }
  id v71 = [v17 hasSOSActiveDevice];

  if (v71)
  {
    id v72 = [v17 hasSOSActiveDevice];
    [v39 setObject:v72 forKeyedSubscript:AKSOSActiveDeviceKey];
  }
  v73 = [v17 SOSNeeded];

  if (v73)
  {
    v74 = [v17 SOSNeeded];
    [v39 setObject:v74 forKeyedSubscript:AKSOSNeededKey];
  }
  if ([v17 authMode])
  {
    v75 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 authMode]);
    [v39 setObject:v75 forKeyedSubscript:AKAuthenticationAppleIDAuthModeKey];
  }
  if ([v17 isMdmInfoRequired]) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationAppleIDMDMInfoRequired];
  }
  if ([v17 isManagedAppleID]) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationManagedAppleIDKey];
  }
  if ([v17 isDemoAccount]) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationDemoAccountKey];
  }
  if ([v17 isAuditLogin]) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationAuditLoginKey];
  }
  if ([v17 isServerUIRequired]) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationIsServerUIRequiredKey];
  }
  if ([v17 isPasscodeResetRequired]) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:AKAuthenticationIsPasscodeResetRequiredKey];
  }
  v76 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 managedOrganizationType]);
  [v39 setObject:v76 forKeyedSubscript:AKAuthenticationManagedOrganizationTypeKey];

  v77 = [v17 managedOrganizationName];

  if (v77)
  {
    v78 = [v17 managedOrganizationName];
    [v39 setObject:v78 forKeyedSubscript:AKAuthenticationManagedOrganizationNameKey];
  }
  v79 = [v17 isNotificationEmailAvailable];

  if (v79)
  {
    v80 = [v17 isNotificationEmailAvailable];
    [v39 setObject:v80 forKeyedSubscript:AKAuthenticationIsNotificationEmailAvailableKey];
  }
  v81 = [v17 notificationEmail];

  if (v81)
  {
    v82 = [v17 notificationEmail];
    [v39 setObject:v82 forKeyedSubscript:AKAuthenticationNotificationEmailKey];
  }
  v83 = [v17 custodianSessionID];

  if (v83)
  {
    v84 = [v17 custodianSessionID];
    [v39 setObject:v84 forKeyedSubscript:AKAuthenticationCustodianSessionIDKey];
  }
  v85 = [v17 passwordResetToken];
  uint64_t v86 = [v85 stringValue];

  v149 = (void *)v86;
  if (v86 && [(AKClient *)self->_client hasInternalAccess])
  {
    v87 = _AKLogSystem();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Providing PRK to an internal client.", buf, 2u);
    }

    [v39 setObject:v86 forKeyedSubscript:AKAuthenticationPasswordResetTokenKey];
  }
  v88 = [v17 passcodeAuth];

  if (v88)
  {
    v89 = [v17 passcodeAuth];
    [v39 setObject:v89 forKeyedSubscript:AKPasscodeAuthKey];
  }
  v90 = objc_msgSend(v17, "hasModernRecoveryKey", v66);

  if (v90)
  {
    v91 = [v17 hasModernRecoveryKey];
    [v39 setObject:v91 forKeyedSubscript:AKHasModernRKKey];
  }
  id v144 = v15;
  v92 = [v17 firstName];
  [v39 setObject:v92 forKeyedSubscript:AKAuthenticationFirstNameKey];

  v93 = [v17 lastName];
  [v39 setObject:v93 forKeyedSubscript:AKAuthenticationLastNameKey];

  v94 = [v17 imageURLString];
  [v39 setObject:v94 forKeyedSubscript:AKAuthenticationImageURLKey];

  v95 = [v17 configurationInfo];
  [v39 setObject:v95 forKeyedSubscript:AKAuthenticationConfigurationInfoKey];

  v96 = [v17 additionalInfo];
  [v39 setObject:v96 forKeyedSubscript:AKAuthenticationAdditionalInfoKey];

  v97 = +[AKFeatureManager sharedManager];
  unsigned int v98 = [v97 isBackgroundiCloudSignInEnabled];

  if (v98)
  {
    v99 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 canBackgroundiCloudSignIn]);
    [v39 setObject:v99 forKeyedSubscript:AKAuthenticationBackgroundSignInKey];
  }
  id v142 = v21;
  v100 = [v17 adpCohort];
  [v39 setObject:v100 forKeyedSubscript:AKAuthenticationADPCohortKey];

  v101 = [v17 edpState];
  [v39 setObject:v101 forKeyedSubscript:AKEDPStateKey];

  v102 = [v17 passwordVersion];
  [v39 setObject:v102 forKeyedSubscript:AKPasswordVersionKey];

  v103 = [v17 srpProtocol];
  [v39 setObject:v103 forKeyedSubscript:AKSRPProtocolKey];

  v104 = [v17 srpSalt];
  [v39 setObject:v104 forKeyedSubscript:AKSRPSaltKey];

  v105 = [v17 srpIteration];
  [v39 setObject:v105 forKeyedSubscript:AKSRPIterationCountKey];

  v106 = [v17 passwordlessToken];
  v107 = [v106 stringValue];
  if (v107)
  {
    v108 = [v17 passwordlessToken];
    v109 = [v108 stringValue];
    BOOL v110 = [v109 length] != 0;
  }
  else
  {
    BOOL v110 = 0;
  }

  v113 = [v17 idmsDataToken];
  v114 = [v113 stringValue];
  if (v114)
  {
    v115 = [v17 idmsDataToken];
    v116 = [v115 stringValue];
    BOOL v117 = [v116 length] != 0;
  }
  else
  {
    BOOL v117 = 0;
  }

  v118 = _AKLogSystem();
  BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT);
  if (v110)
  {
    if (v119)
    {
      v120 = [v17 passwordlessToken];
      id v121 = v19;
      id v122 = v20;
      if (v120) {
        CFStringRef v123 = @"YES";
      }
      else {
        CFStringRef v123 = @"NO";
      }
      v124 = [v17 idmsDataToken];
      CFStringRef v125 = @"YES";
      if (!v124) {
        CFStringRef v125 = @"NO";
      }
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v156 = v123;
      id v20 = v122;
      id v19 = v121;
      __int16 v157 = 2112;
      CFStringRef v158 = v125;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Providing passwordlessToken: %@ idmsDataToken: %@", buf, 0x16u);
    }
    v126 = [v17 passwordlessToken];
    v127 = [v126 stringValue];
    [v39 setObject:v127 forKeyedSubscript:AKPasswordlessTokenKey];

    id v21 = v142;
    if (!v117) {
      goto LABEL_132;
    }
    v118 = [v17 idmsDataToken];
    v128 = [v118 stringValue];
    [v39 setObject:v128 forKeyedSubscript:AKIdmsDataTokenKey];
  }
  else
  {
    if (v119)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Passwordless token not found on server response", buf, 2u);
    }
    id v21 = v142;
  }

LABEL_132:
  client = v146->_client;
  v153[0] = _NSConcreteStackBlock;
  v153[1] = 3221225472;
  v153[2] = sub_10005B968;
  v153[3] = &unk_100228DD8;
  id v130 = v21;
  id v154 = v130;
  v131 = [(AKClient *)client proxyWithErrorHandler:v153];
  v132 = _AKLogSystem();
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
  {
    v133 = v146->_client;
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v156 = (const __CFString *)v133;
    _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "Asking %@ should continue?", buf, 0xCu);
  }

  if ([v20 _ignoreShouldContinueProxy])
  {
    v134 = _AKLogSystem();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "Context asked to skip should continue, returning results...", buf, 2u);
    }

    id v18 = v143;
    if (v19)
    {
      uint64_t v135 = 0;
      id v136 = 0;
      id v137 = v19;
    }
    else
    {
      uint64_t v135 = 1;
      id v136 = v39;
      id v137 = 0;
    }
    (*((void (**)(id, uint64_t, id, id))v130 + 2))(v130, v135, v136, v137);
  }
  else
  {
    v138 = [v20 _identifier];
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_10005BA04;
    v150[3] = &unk_100228E00;
    id v151 = v19;
    id v152 = v130;
    [v131 shouldContinueWithAuthenticationResults:v39 error:v151 forContextID:v138 completion:v150];

    id v18 = v143;
  }

  id v15 = v144;
  id v16 = v147;
LABEL_143:
}

- (void)_handleSuccessfulVerificationForContext:(id)a3 withResults:(id)a4 serverResponse:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = [(id)objc_opt_class() _verificationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BD2C;
  block[3] = &unk_100228810;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (id)_authKitAccountFromContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 authKitAccount:0];
  if (v5
    || !+[AKAccountManager isAccountsFrameworkAvailable])
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetched existing AK account: %{private}@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 username];
      id v8 = [v4 altDSID];
      int v14 = 138478083;
      id v15 = v7;
      __int16 v16 = 2113;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating a new authkit account <%{private}@><%{private}@>", (uint8_t *)&v14, 0x16u);
    }
    id v9 = objc_alloc((Class)ACAccount);
    id v10 = [(AKAccountManager *)self->_accountManager authKitAccountTypeWithError:0];
    id v5 = [v9 initWithAccountType:v10];

    id v11 = [v4 username];
    [v5 setUsername:v11];

    id v12 = +[AKAccountManager personaIDIfCurrentPersonaIsDataSeparated];
    if (v12) {
      [v5 setObject:v12 forKeyedSubscript:ACAccountPropertyPersonaIdentifier];
    }
  }

  return v5;
}

- (void)_provideServiceTokensIfRequiredForContext:(id)a3 authenticationResults:(id)a4 serverResponse:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 serviceIdentifiers];
  if (([v10 shouldUpdatePersistentServiceTokens] & 1) != 0
    || [v10 needsNewAppleID])
  {
    id v15 = [v12 serviceTokens];

    if (v15)
    {
      __int16 v16 = [v12 serviceTokens];
      id v17 = [v16 allKeys];

      if (v14)
      {
        uint64_t v18 = [v14 arrayByAddingObjectsFromArray:v17];

        id v14 = (id)v18;
      }
      else
      {
        id v14 = v17;
      }
    }
  }
  if (v14)
  {
    id v36 = self;
    uint64_t v38 = v13;
    id v39 = v11;
    id v19 = objc_alloc_init((Class)NSMutableSet);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v37 = v14;
    id v20 = v14;
    id v21 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          id v26 = [v12 serviceTokens];
          id v27 = [v26 objectForKeyedSubscript:v25];

          if (!v27) {
            [v19 addObject:v25];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v22);
    }

    id v28 = [v10 altDSID];
    if (!v28)
    {
      id v28 = [v12 altDSID];
    }
    id v29 = [v10 dependentAltDSID];

    id v13 = v38;
    id v11 = v39;
    if (v29)
    {
      id v30 = _AKLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Updating service tokens is not available for Dependent tokens requests.", buf, 2u);
      }

      [v10 setShouldUpdatePersistentServiceTokens:0];
    }
    else if ([v19 count])
    {
      unsigned __int8 v33 = [v19 allObjects];
      uint64_t v35 = [v10 username];
      int v34 = [v12 masterToken];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10005C5F8;
      v40[3] = &unk_100228E48;
      id v41 = v19;
      CFStringRef v42 = v36;
      id v43 = v12;
      id v44 = v28;
      id v45 = v39;
      id v46 = v10;
      id v47 = v38;
      [(AKAppleIDAuthenticationService *)v36 _fetchTokensForServiceIDs:v33 withUsername:v35 altDSID:v44 masterToken:v34 context:v46 completion:v40];

      id v31 = v41;
      goto LABEL_30;
    }
    id v31 = [v12 serviceTokens];
    [(AKAppleIDAuthenticationService *)v36 _completeAuthenticationWithServiceTokens:v31 tokenFetchError:0 altDSID:v28 authenticationResults:v39 context:v10 completion:v38];
LABEL_30:
    id v14 = v37;

    goto LABEL_31;
  }
  id v32 = _AKLogSystem();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No service IDs were provided, so AKAuthenticationIDMSTokenKey will be left empty.", buf, 2u);
  }

  (*((void (**)(id, id, void))v13 + 2))(v13, v11, 0);
LABEL_31:
}

- (void)_completeAuthenticationWithServiceTokens:(id)a3 tokenFetchError:(id)a4 altDSID:(id)a5 authenticationResults:(id)a6 context:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, id, void))a8;
  id v20 = [v18 serviceIdentifiers];
  if (v14)
  {
    id v21 = [v17 mutableCopy];
    if (!v21) {
      id v21 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v22 = objc_msgSend(v14, "aaf_map:", &stru_100228E88);
    [v21 setObject:v22 forKeyedSubscript:AKAuthenticationIDMSTokenKey];
    if ([v18 shouldUpdatePersistentServiceTokens]
      && ![(AKAppleIDAuthenticationService *)self _shouldSkipAccountUpdatesForAuthWithContext:v18])
    {
      [v17 objectForKeyedSubscript:AKAuthenticationDSIDKey];
      uint64_t v25 = v28 = v16;
      [v17 objectForKeyedSubscript:AKAuthenticationUsernameKey];
      id v26 = v27 = v15;
      [(AKAppleIDAuthenticationService *)self _persistGrandSlamServiceTokens:v14 forAltDSID:v28 DSID:v25 appleID:v26 forContext:v18 error:0];

      id v15 = v27;
      id v16 = v28;
    }
    else
    {
      uint64_t v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Context not appropriate for updating persistent tokens. All done then!", buf, 2u);
      }
    }
    v19[2](v19, v21, 0);
  }
  else
  {
    id v24 = _AKLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100184EC8();
    }

    ((void (**)(id, id, id))v19)[2](v19, v17, v15);
  }
}

- (void)_persistGrandSlamServiceTokens:(id)a3 forAltDSID:(id)a4 DSID:(id)a5 appleID:(id)a6 forContext:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v20 = [[AKGrandslamTokenUpdateRequest alloc] initWithTokens:v18 accountManager:self->_accountManager context:v14 altDSID:v17];

  [(AKGrandslamTokenUpdateRequest *)v20 setDsid:v16];
  [(AKGrandslamTokenUpdateRequest *)v20 setAppleIDUsername:v15];

  id v19 = objc_opt_new();
  [v19 updateGrandSlamServiceTokensWithRequest:v20 error:a8];
}

- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 authenticationType] == (id)1)
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100184F30();
    }

    uint64_t v15 = -7014;
LABEL_5:
    id v16 = +[NSError ak_errorWithCode:v15];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v16);
LABEL_6:

    goto LABEL_9;
  }
  id v17 = [v10 federatedAuthURL];

  if (v17)
  {
    id v18 = [[AKEducationEnterpriseController alloc] initWithContext:v11 client:v12];
    eduController = self->_eduController;
    self->_eduController = v18;

    [(AKEducationEnterpriseController *)self->_eduController beginFederatedAuthWithInitialResponse:v10 completionHandler:v13];
    goto LABEL_9;
  }
  id v20 = [v10 secondaryActionURLKey];

  if (v20)
  {
    unsigned int v21 = [v10 isSecondaryActionURLGSEndpoint];
    id v22 = _AKLogSystem();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Secondary action is GS endpoint. Returning the response as-is so that handler can perform the action.", buf, 2u);
      }

      (*((void (**)(id, id, void, void))v13 + 2))(v13, v10, 0, 0);
    }
    else
    {
      if (v23)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Trying to show server UI for the response.", buf, 2u);
      }

      id v28 = [v10 secondaryActionURLKey];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10005D048;
      v47[3] = &unk_100228EB0;
      id v48 = v13;
      [(AKAppleIDAuthenticationService *)self _beginServerDrivenSecondaryActionWithURLKey:v28 context:v11 initialAuthResponse:v10 completion:v47];
    }
  }
  else
  {
    id v24 = [v10 secondaryActionURLKey];
    if (v24)
    {
    }
    else
    {
      id v31 = [v11 _masterKey];

      if (v31)
      {
        id v32 = _AKLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Context has masterKeyEligible set and server response indicates secondary action is required", buf, 2u);
        }

        unsigned __int8 v33 = [(AKAppleIDAuthenticationService *)self _srpAuthContextHelperWithContext:v11];
        int v34 = [v11 _masterKey];
        [v33 setPassword:v34];

        [v33 _setMasterKeyAsSecondFactor:1];
        id v44 = v33;
        uint64_t v35 = [v33 authContext];
        id v36 = [v10 altDSID];
        id v37 = [v10 masterToken];
        uint64_t v38 = [v37 stringValue];
        id v39 = +[NSString stringWithFormat:@"%@:%@", v36, v38];

        id v40 = [v39 dataUsingEncoding:4];
        id v41 = [v40 base64EncodedStringWithOptions:0];
        [v35 _setIdentityToken:v41];

        CFStringRef v42 = _AKLogSystem();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Attempting second SRP for masterKeyAsSecondFactor", buf, 2u);
        }

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10005D134;
        v45[3] = &unk_100228ED8;
        id v46 = v13;
        id v43 = self;
        id v16 = v44;
        [(AKAppleIDAuthenticationService *)v43 _performSRPAuthenticationWithContext:v44 completion:v45];

        goto LABEL_6;
      }
    }
    if (![v10 isFidoAuthRequired])
    {
      id v29 = [v10 secondaryActionMessage];
      [v11 _setMessage:v29];

      id v30 = _AKLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Secondary action server URL is missing", buf, 2u);
      }

      uint64_t v15 = -7005;
      goto LABEL_5;
    }
    uint64_t v25 = _AKLogFido();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100184F64();
    }

    id v26 = [v10 masterToken];
    id v27 = [v26 stringValue];
    [v11 _setIdentityToken:v27];

    [(AKAppleIDAuthenticationService *)self _performFidoStartAuthActionWithContext:v11 serverResponse:v10 completion:v13];
  }
LABEL_9:
}

- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 initialAuthResponse:(id)a6 context:(id)a7 completion:(id)a8
{
}

- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 piggybacking:(BOOL)a6 initialAuthResponse:(id)a7 context:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(id, void, id))a9;
  unsigned int v21 = _AKLogSystem();
  id v22 = v21;
  if (v16)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100185000();
    }

    v20[2](v20, 0, v16);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100184F98();
    }

    id v25 = [v15 unsignedIntegerValue];
    BOOL v23 = [v18 altDSID];
    [v18 masterToken];
    id v24 = v26 = v15;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10005D384;
    v27[3] = &unk_100228F28;
    BOOL v32 = a6;
    id v31 = v20;
    v27[4] = self;
    id v28 = v19;
    id v29 = v17;
    id v30 = v18;
    [(AKAppleIDAuthenticationService *)self _validateLoginCode:v25 forAltDSID:v23 masterToken:v24 idmsData:v29 authContext:v28 completion:v27];

    id v15 = v26;
  }
}

- (void)_processValidationCodeSuccessResponse:(id)a3 authResponse:(id)a4 results:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id, void))a6;
  id v12 = a3;
  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Login code successfully validated! Updating auth tokens...", v16, 2u);
  }

  unsigned __int8 v14 = [v9 updateWithSecondaryAuthenticationResponse:v12];
  if (v14)
  {
    [v9 updateWithSecondaryAuthenticationBody:v10];
    v11[2](v11, v9, 0);
  }
  else
  {
    id v15 = +[NSError ak_errorWithCode:-7021];
    ((void (**)(id, id, void *))v11)[2](v11, v9, v15);
  }
}

- (void)_showAlertForLoginCodeValidationError:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005D77C;
  v12[3] = &unk_100228CE8;
  void v12[4] = self;
  id v13 = a4;
  id v14 = v8;
  id v15 = a5;
  id v9 = v15;
  id v10 = v8;
  id v11 = v13;
  [(AKAppleIDAuthenticationService *)self _titleAndMessageForError:v10 context:v11 completion:v12];
}

- (void)_attemptPasswordlessAuthAfterBiometricOrPasscodeValidationWithContext:(id)a3 promptType:(unint64_t)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005D8FC;
  v10[3] = &unk_100228F78;
  id v11 = a3;
  id v12 = self;
  id v13 = a5;
  unint64_t v14 = a4;
  id v8 = v11;
  id v9 = v13;
  [(AKAppleIDAuthenticationService *)self _accountForContinuationWithContext:v8 completion:v10];
}

- (void)_performGrandslamEndpointActionWithContext:(id)a3 serverResponse:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 altDSID];
  id v11 = +[AKURLBag bagForAltDSID:v10];
  id v12 = [v8 secondaryActionURLKey];
  id v13 = [v11 _urlAtKey:v12];

  if (v13)
  {
    id v14 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v13];
    [v14 setHTTPMethod:@"GET"];
    id v15 = [(AKClient *)self->_client name];
    objc_msgSend(v14, "ak_addClientApp:", v15);

    id v16 = [(AKClient *)self->_client bundleID];
    objc_msgSend(v14, "ak_addClientBundleIDHeader:", v16);

    objc_msgSend(v14, "ak_addClientInfoHeader");
    id v17 = [v8 masterToken];
    id v18 = [v17 stringValue];
    id v19 = [v8 altDSID];
    objc_msgSend(v14, "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:", v18, v19);

    objc_msgSend(v14, "ak_addInternalBuildHeader");
    objc_msgSend(v14, "ak_addSeedBuildHeader");
    objc_msgSend(v14, "ak_addFeatureMaskHeader");
    id v20 = +[AKURLSession sharedURLSession];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10005DED4;
    v23[3] = &unk_100227C70;
    void v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    id v21 = [v20 beginDataTaskWithRequest:v14 completionHandler:v23];
  }
  else
  {
    id v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10018514C(v8, v22);
    }

    id v14 = +[NSError ak_errorWithCode:-7005];
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v14);
  }
}

- (void)_handleGrandslamResponse:(id)a3 data:(id)a4 error:(id)a5 serverResponse:(id)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, void, void *))a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001851D8();
    }

    id v15 = +[NSError ak_errorWithCode:-7010];
    v13[2](v13, 0, v15);
  }
  id v16 = v10;
  if ([v12 updateWithSecondaryAuthenticationResponse:v16 shouldUpdateDSID:1])
  {
    id v17 = +[AAFSerialization dictionaryFromObject:v11 ofType:@"application/json"];
    [v12 updateWithSecondaryAuthenticationBody:v17];
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = +[NSError ak_errorWithCode:-7021];
    id v17 = (void *)v18;
  }
  ((void (**)(id, id, void *))v13)[2](v13, v12, (void *)v18);
}

- (void)clearSessionCacheWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to clear session cache.", v6, 2u);
  }

  id v5 = +[AKURLBagService sharedBagService];
  [v5 clearCache];

  v3[2](v3, 1, 0);
}

- (void)fetchGlobalConfigurationUsingPolicy:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[AKGlobalConfigService sharedInstance];
  [v6 fetchGlobalConfigUsingCachePolicy:a3 context:AKRequestContextUserInitiated completion:v5];
}

- (id)fidoHandler
{
  fidoHandler = self->_fidoHandler;
  if (!fidoHandler)
  {
    id v4 = objc_alloc_init(AKFidoDaemonServerHandler);
    id v5 = self->_fidoHandler;
    self->_fidoHandler = v4;

    fidoHandler = self->_fidoHandler;
  }

  return fidoHandler;
}

- (void)_performFidoStartAuthActionWithContext:(id)a3 serverResponse:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 altDSID];
  if (v11) {
    goto LABEL_4;
  }
  id v12 = [v9 altDSID];
  id v13 = [v12 length];

  if (v13)
  {
    id v11 = [v9 altDSID];
    [v8 setAltDSID:v11];
LABEL_4:
  }
  objc_initWeak(&location, self);
  id v14 = [(AKAppleIDAuthenticationService *)self fidoHandler];
  client = self->_client;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005E388;
  v19[3] = &unk_100226A80;
  objc_copyWeak(&v23, &location);
  id v16 = v10;
  id v22 = v16;
  id v17 = v8;
  id v20 = v17;
  id v18 = v9;
  id v21 = v18;
  [v14 startFidoAuthWithContext:v17 recoveryToken:0 client:client completion:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)_handleStartFidoAuthWithContext:(id)a3 fidoContext:(id)a4 serverResponse:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _AKLogFido();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1001852A8();
  }

  objc_initWeak(&location, self);
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_10005E5D0;
  id v21 = &unk_100228FA0;
  objc_copyWeak(&v24, &location);
  id v15 = v13;
  id v23 = v15;
  id v16 = v10;
  id v22 = v16;
  id v17 = objc_retainBlock(&v18);
  -[AKAuthenticationUILiaison presentFidoAuthForContext:fidoContext:client:completion:](self->_authUILiaison, "presentFidoAuthForContext:fidoContext:client:completion:", v16, v11, self->_client, v17, v18, v19, v20, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_beginServerDrivenSecondaryActionWithURLKey:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1001853E0();
  }

  id v15 = [v11 altDSID];
  id v16 = +[AKURLBag bagForAltDSID:v15];
  id v17 = [v16 _urlAtKey:v10];

  if (v17)
  {
    if (+[AKURLBag looksLikeiForgotURLKey:v10])
    {
      uint64_t v18 = [(AKAppleIDAuthenticationService *)self _addAccountNameParameterToURL:v17 withContext:v11];

      id v17 = (void *)v18;
    }
    id v19 = [objc_alloc((Class)NSURLRequest) initWithURL:v17];
    id v20 = _AKSignpostLogSystem();
    os_signpost_id_t v21 = _AKSignpostCreate();
    uint64_t v23 = v22;

    id v24 = _AKSignpostLogSystem();
    id v25 = v24;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)long long buf = 138543362;
      os_signpost_id_t v33 = (os_signpost_id_t)v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, v21, "ServerDrivenSecondaryAction", " ActionKey=%{public,signpost.telemetry:string1,name=ActionKey}@  enableTelemetry=YES ", buf, 0xCu);
    }

    id v26 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      os_signpost_id_t v33 = v21;
      __int16 v34 = 2114;
      id v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ServerDrivenSecondaryAction  ActionKey=%{public,signpost.telemetry:string1,name=ActionKey}@  enableTelemetry=YES ", buf, 0x16u);
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10005E9D0;
    v28[3] = &unk_100228FC8;
    os_signpost_id_t v30 = v21;
    uint64_t v31 = v23;
    id v29 = v13;
    [(AKAppleIDAuthenticationService *)self _showServerUIWithURLRequest:v19 context:v11 initialAuthResponse:v12 completion:v28];
  }
  else
  {
    id v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100185378();
    }

    id v17 = +[NSError ak_errorWithCode:-7005];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v17);
  }
}

- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = +[AKDServerUIContext serverUIContextFromResponse:a5 authContext:a4 urlRequest:a3];
  [(AKAppleIDAuthenticationService *)self _showServerUIWithContext:v11 completion:v10];
}

- (void)_showServerUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AKDServerUIController alloc] initWithLiaison:self->_authUILiaison client:self->_client delegate:self];
  [(AKDServerUIController *)v8 showServerUIWithContext:v7 completion:v6];
}

- (BOOL)shouldProcessAdditionalServerUIData:(id)a3
{
  return +[AKAccountRecoveryController shouldProcessServerUIRequest:a3];
}

- (void)serverUIContext:(id)a3 processAdditionalData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Asking client to start showing native UI", (uint8_t *)&buf, 2u);
  }

  id v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationService serverUIContext additionalData: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10000F8D0;
  os_signpost_id_t v21 = sub_10000F7B8;
  uint64_t v22 = [[AKAccountRecoveryController alloc] initWithUILiaison:self->_authUILiaison client:self->_client];
  id v13 = *(void **)(*((void *)&buf + 1) + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005EF0C;
  v15[3] = &unk_100228FF0;
  p_long long buf = &buf;
  id v14 = v10;
  id v16 = v14;
  [v13 retrieveRecoveryDataForServerContext:v8 recoveryInfo:v9 completion:v15];

  _Block_object_dispose(&buf, 8);
}

- (void)_performSilentServiceTokenAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v24 = 0;
  id v8 = [v6 authKitAccountForSilentServiceToken:&v24];
  id v9 = v24;
  id v10 = _AKLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting silent service-token auth with IDMS account %@...", buf, 0xCu);
    }

    id v12 = [(AKAccountManager *)self->_accountManager masterTokenForAccount:v8];
    if (v12)
    {
      id v13 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v8];
      id v14 = [v6 serviceIdentifiers];
      id v15 = [v8 username];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10005F2FC;
      v19[3] = &unk_100229018;
      id v20 = v6;
      id v22 = v13;
      id v23 = v7;
      os_signpost_id_t v21 = self;
      id v16 = v13;
      [(AKAppleIDAuthenticationService *)self _fetchTokensForServiceIDs:v14 withUsername:v15 altDSID:v16 masterToken:v12 context:v20 completion:v19];
    }
    else
    {
      uint64_t v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100185448();
      }

      id v16 = +[NSError ak_errorWithCode:-7024];
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v16);
    }
  }
  else
  {
    if (v11)
    {
      id v17 = [v6 username];
      *(_DWORD *)long long buf = 138412290;
      id v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No usable IDMS account for Apple ID: %@", buf, 0xCu);
    }
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

- (void)_fetchTokensForServiceIDs:(id)a3 withUsername:(id)a4 altDSID:(id)a5 masterToken:(id)a6 context:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, void, void *))a8;
  if (v14)
  {
    uint64_t v19 = [a6 externalizedVersion];
    if (!v19)
    {
      uint64_t v38 = _AKLogSystem();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10018558C();
      }

      if (!v18) {
        goto LABEL_29;
      }
      id v36 = +[NSError ak_errorWithCode:-7008];
      v18[2](v18, 0, v36);
      goto LABEL_28;
    }
    id v20 = _AKSignpostLogSystem();
    os_signpost_id_t v21 = _AKSignpostCreate();
    uint64_t v49 = v22;

    id v23 = _AKSignpostLogSystem();
    id v24 = v23;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v21, "FetchGrandslamTokens", " enableTelemetry=YES ", buf, 2u);
    }

    id v25 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      os_signpost_id_t v61 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchGrandslamTokens  enableTelemetry=YES ", buf, 0xCu);
    }

    authProxy = self->_authProxy;
    id v59 = 0;
    id v27 = [(AKAppleIDAuthSupportProxy *)authProxy appleIDAuthSupportTokenCreateWithExternalizedVersion:v19 error:&v59];
    id v50 = v59;
    if (v27)
    {
      id v28 = [(AKAppleIDAuthenticationService *)self _authenticationParametersForUsername:v15 altDSID:v16 context:v17];
      id v48 = v15;
      [v17 altDSID];
      id v29 = v47 = v16;
      os_signpost_id_t v30 = +[AKURLBag bagForAltDSID:v29];
      id v46 = v19;
      id v31 = v17;
      uint64_t v32 = AKURLBagKeyBasicAuthKey;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10005F96C;
      v51[3] = &unk_100229068;
      id v52 = v28;
      id v53 = self;
      id v56 = v27;
      id v54 = v14;
      id v55 = v18;
      os_signpost_id_t v57 = v21;
      uint64_t v58 = v49;
      id v33 = v28;
      uint64_t v34 = v32;
      id v17 = v31;
      uint64_t v19 = v46;
      [v30 urlForKey:v34 completion:v51];

      id v15 = v48;
      id v16 = v47;

      id v35 = v52;
      id v36 = v50;
    }
    else
    {
      id v39 = _AKLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1001855C0();
      }

      uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
      id v41 = _AKSignpostLogSystem();
      CFStringRef v42 = v41;
      id v36 = v50;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        unsigned int v43 = [v50 code];
        *(_DWORD *)long long buf = 67240192;
        LODWORD(v61) = v43;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, v21, "FetchGrandslamTokens", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
      }

      id v44 = _AKSignpostLogSystem();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v45 = [v50 code];
        *(_DWORD *)long long buf = 134218496;
        os_signpost_id_t v61 = v21;
        __int16 v62 = 2048;
        double v63 = (double)(unint64_t)Nanoseconds / 1000000000.0;
        __int16 v64 = 1026;
        unsigned int v65 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchGrandslamTokens  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
      }

      if (!v18) {
        goto LABEL_28;
      }
      objc_msgSend(v50, "ac_secureCodingError");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      id v35 = +[NSError ak_errorWithCode:-7001 underlyingError:v33];
      v18[2](v18, 0, v35);
    }

LABEL_28:
    goto LABEL_29;
  }
  id v37 = _AKLogSystem();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_100185558();
  }

  if (v18)
  {
    uint64_t v19 = +[NSError ak_errorWithCode:-7009];
    v18[2](v18, 0, v19);
LABEL_29:
  }
}

- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AKAccountRecoveryController alloc] initWithUILiaison:self->_authUILiaison client:self->_client];
  [(AKAccountRecoveryController *)v8 renewRecoveryTokenWithContext:v7 completion:v6];
}

- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [[AKAccountRecoveryController alloc] initWithUILiaison:self->_authUILiaison client:self->_client];
  [(AKAccountRecoveryController *)v11 verifyMasterKey:v10 withContext:v9 completion:v8];
}

- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, AKAccountRecoveryController *))a5;
  p_client = &self->_client;
  if ([(AKClient *)self->_client hasInternalAccess])
  {
    id v12 = [[AKAccountRecoveryController alloc] initWithUILiaison:self->_authUILiaison client:self->_client];
    [(AKAccountRecoveryController *)v12 persistRecoveryKeyWithContext:v8 authContext:v9 completion:v10];
LABEL_7:

    goto LABEL_8;
  }
  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1001856F8((id *)p_client, v13);
  }

  if (v10)
  {
    id v12 = +[NSError ak_errorWithCode:-7026];
    v10[2](v10, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_initiateEDPRepairForAuthenticationContext:(id)a3 authResults:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = (void *)os_transaction_create();
    id v8 = objc_opt_new();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = nullsub_4;
    v10[3] = &unk_100228018;
    id v11 = v7;
    id v9 = v7;
    [v8 repairEDPStateForContext:v6 authenticationResults:v5 completion:v10];
  }
}

- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (!v5) {
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kAAFDidSucceed];
  }
  [v7 populateUnderlyingErrorsStartingWithRootError:v5];
  id v6 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v6 sendEvent:v7];
}

- (void)_recoverCredentialsAndAuthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User does not have all their credentials, so we're going to iForgot...", buf, 2u);
  }

  id v9 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v6 client:self->_client eventName:@"com.apple.authkit.accountRecoveryStart" error:0];
  id v10 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v10 sendEvent:v9];

  id v11 = _AKSignpostLogSystem();
  os_signpost_id_t v12 = _AKSignpostCreate();
  uint64_t v14 = v13;

  id v15 = _AKSignpostLogSystem();
  id v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "iForgot", " enableTelemetry=YES ", buf, 2u);
  }

  id v17 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: iForgot  enableTelemetry=YES ", buf, 0xCu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006090C;
  v20[3] = &unk_100229090;
  os_signpost_id_t v24 = v12;
  uint64_t v25 = v14;
  id v21 = v6;
  uint64_t v22 = self;
  id v23 = v7;
  id v18 = v7;
  id v19 = v6;
  [(AKAppleIDAuthenticationService *)self _beginiForgotFlowWithContext:v19 completion:v20];
}

- (void)_handleRecoverCredentialsError:(id)a3 withContext:(id)a4 event:(id)a5 andCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  os_signpost_id_t v12 = (void (**)(id, void, id))a6;
  id v13 = a5;
  uint64_t v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1001857F0();
  }

  [(AKAppleIDAuthenticationService *)self _sendAnalyticsEvent:v13 withError:v10];
  id v15 = [v10 domain];
  if (![v15 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {

    goto LABEL_7;
  }
  unsigned int v16 = [v11 _keepAlive];

  if (!v16)
  {
LABEL_7:
    v12[2](v12, 0, v10);
    goto LABEL_8;
  }
  [v11 setNeedsCredentialRecovery:0];
  [(AKAppleIDAuthenticationService *)self _keepLoginAliveWithContext:v11 error:v10 andCompletion:v12];
LABEL_8:
}

- (void)_beginiForgotFlowWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018588C();
  }

  if ([v6 isTriggeredByNotification])
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "iForgot flow was triggered by push notification. Will try to use dedicated URL.", buf, 2u);
    }

    id v10 = [v6 altDSID];
    id v11 = +[AKURLBag bagForAltDSID:v10];
    os_signpost_id_t v12 = [v11 iForgotContinuationURL];

    if (v12) {
      goto LABEL_8;
    }
  }
  id v13 = [v6 altDSID];
  uint64_t v14 = +[AKURLBag bagForAltDSID:v13];
  os_signpost_id_t v12 = [v14 iForgotURL];

  if (v12)
  {
LABEL_8:
    id v15 = [(AKAppleIDAuthenticationService *)self _addAccountNameParameterToURL:v12 withContext:v6];

    id v16 = [objc_alloc((Class)NSURLRequest) initWithURL:v15];
    [v6 setNeedsCredentialRecovery:1];
    if (([v6 isEphemeral] & 1) == 0
      && ([v6 shouldPromptForPasswordOnly] & 1) == 0)
    {
      [v6 setShouldOfferSecurityUpgrade:1];
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100061264;
    v18[3] = &unk_100228EB0;
    id v19 = v7;
    [(AKAppleIDAuthenticationService *)self _showServerUIWithURLRequest:v16 context:v6 completion:v18];
  }
  else
  {
    id v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100185858();
    }

    id v15 = +[NSError ak_errorWithCode:-7017];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v15);
  }
}

- (id)_addAccountNameParameterToURL:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 username];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = [v6 username];
    id v10 = objc_msgSend(v9, "aaf_urlEncoded");

    if ([v6 needsCredentialRecovery]
      && [v6 isRequestedFromOOPViewService]
      && (+[AKFeatureManager sharedManager],
          id v11 = objc_claimAutoreleasedReturnValue(),
          unsigned int v12 = [v11 isForgotPasswordNativeTakeoverEnabled],
          v11,
          v12))
    {
      id v13 = [v5 absoluteString];
      [v13 stringByAppendingFormat:@"?%@=%@&%@=%@", AKRecoveryUsernameRequestParameter, v10, AKRecoveryAutoSubmitAccountRequestParameter, AKTrueValue];
    }
    else
    {
      id v13 = [v5 absoluteString];
      [v13 stringByAppendingFormat:@"?%@=%@", AKRecoveryUsernameRequestParameter, v10, v17, v18];
    uint64_t v14 = };

    id v15 = +[NSURL URLWithString:v14];
  }
  else
  {
    id v15 = v5;
  }

  return v15;
}

- (void)_repairAppleIDWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting repair...", buf, 2u);
  }

  id v23 = 0;
  id v9 = [v6 authKitAccount:&v23];
  id v10 = v23;
  if (v10 || !v9)
  {
    uint64_t v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001858C0();
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    id v11 = [v6 altDSID];
    unsigned int v12 = +[AKURLBag bagForAltDSID:v11];
    id v13 = [v12 repairURL];

    if (v13)
    {
      id v14 = [objc_alloc((Class)NSURLRequest) initWithURL:v13];
      id v15 = +[AKDServerUIContext serverUIContextFromResponse:0 authContext:v6 urlRequest:v14];
      id v16 = [[AKDServerUIController alloc] initWithLiaison:self->_authUILiaison client:self->_client delegate:self];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10006178C;
      v19[3] = &unk_100228D60;
      uint64_t v22 = v7;
      void v19[4] = self;
      id v20 = v9;
      id v21 = v6;
      [(AKDServerUIController *)v16 showServerUIWithContext:v15 completion:v19];
    }
    else
    {
      uint64_t v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100185928();
      }

      id v14 = +[NSError ak_errorWithCode:-7005];
      v7[2](v7, 0, v14);
    }
  }
}

- (void)_createNewAppleIDAndAuthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User wants a new Apple ID to auth with...", buf, 2u);
  }

  id v9 = _AKSignpostLogSystem();
  os_signpost_id_t v10 = _AKSignpostCreate();
  uint64_t v12 = v11;

  id v13 = _AKSignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CreateNewAppleID", " enableTelemetry=YES ", buf, 2u);
  }

  id v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CreateNewAppleID  enableTelemetry=YES ", buf, 0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100061B34;
  v18[3] = &unk_1002290B8;
  os_signpost_id_t v21 = v10;
  uint64_t v22 = v12;
  id v19 = v6;
  id v20 = v7;
  void v18[4] = self;
  id v16 = v6;
  id v17 = v7;
  [(AKAppleIDAuthenticationService *)self _beginAppleIDCreationFlowWithContext:v16 completion:v18];
}

- (void)_handleCreateNewAppleIDError:(id)a3 withContext:(id)a4 andCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v10 = (void (**)(id, void, id))a5;
  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100185A2C();
  }

  uint64_t v12 = [v8 domain];
  if (![v12 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {

    goto LABEL_7;
  }
  unsigned int v13 = [v9 _keepAlive];

  if (!v13)
  {
LABEL_7:
    v10[2](v10, 0, v8);
    goto LABEL_8;
  }
  [v9 setNeedsNewAppleID:0];
  [v9 setNeedsNewChildAccount:0];
  [(AKAppleIDAuthenticationService *)self _keepLoginAliveWithContext:v9 error:v8 andCompletion:v10];
LABEL_8:
}

- (void)_beginAppleIDCreationFlowWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 needsNewChildAccount];
  id v9 = _AKLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      sub_100185AC8();
    }

    uint64_t v11 = [v6 altDSID];
    uint64_t v12 = +[AKURLBag bagForAltDSID:v11];
    unsigned int v13 = [v12 createChildAccountURL];

    if (v13)
    {
LABEL_5:
      id v14 = [objc_alloc((Class)NSURLRequest) initWithURL:v13];
      [(AKAppleIDAuthenticationService *)self _showServerUIWithURLRequest:v14 context:v6 completion:v7];
      goto LABEL_12;
    }
  }
  else
  {
    if (v10) {
      sub_100185AFC();
    }

    id v15 = [v6 altDSID];
    id v16 = +[AKURLBag bagForAltDSID:v15];
    unsigned int v13 = [v16 createAppleIDURL];

    [v6 setNeedsNewAppleID:1];
    if (v13) {
      goto LABEL_5;
    }
  }
  id v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100185A94();
  }

  id v14 = +[NSError ak_errorWithCode:-7016];
  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v14);
LABEL_12:
}

- (void)_changePasswordAndAuthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v14 = 0;
  unsigned int v8 = [v6 authKitAccount:&v14];
  id v9 = v14;
  if (v9)
  {
    BOOL v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001858C0();
    }

    v7[2](v7, 0, v9);
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100062398;
    v11[3] = &unk_100226AA8;
    unsigned int v13 = v7;
    void v11[4] = self;
    id v12 = v6;
    [(AKAppleIDAuthenticationService *)self _beginChangePasswordFlowWithAccount:v8 context:v12 completion:v11];
  }
}

- (void)_beginChangePasswordFlowWithAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100185C68();
  }

  if (v8)
  {
    id v12 = [v9 altDSID];
    unsigned int v13 = +[AKURLBag bagForAltDSID:v12];
    id v14 = [v13 changePasswordURL];

    if (v14)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10006282C;
      v18[3] = &unk_1002290E0;
      id v19 = v9;
      id v20 = v14;
      os_signpost_id_t v21 = self;
      id v22 = v10;
      [(AKAppleIDAuthenticationService *)self _performPasswordlessSRPAuthWithAccount:v8 context:v19 completion:v18];

      id v15 = v19;
    }
    else
    {
      id v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100185C34();
      }

      id v15 = +[NSError ak_errorWithCode:-7005];
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v15);
    }
  }
  else
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100185C00();
    }

    id v14 = +[NSError ak_errorWithCode:-7044];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v14);
  }
}

- (id)_authenticationParametersForUsername:(id)a3 altDSID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[AKSRPAuthenticationContextHelper alloc] initWithContext:v8];

  [(AKSRPContextHelper *)v11 setUsername:v10];
  [(AKSRPContextHelper *)v11 setAltDSID:v9];

  [(AKSRPContextHelper *)v11 setIgnoreInternalTokens:1];
  [(AKSRPContextHelper *)v11 setClient:self->_client];

  return v11;
}

- (id)_requestingControllerWithServerResponse:(id)a3
{
  id v4 = a3;
  id v5 = [AKCAPiggybackReporter alloc];
  id v6 = [v4 transactionId];
  id v7 = [(AKCAPiggybackReporter *)v5 initWithRequestID:v6];

  id v8 = [[AKPiggybackRequestingController alloc] initWithServerResponse:v4 andDelegate:self piggybackReporter:v7];

  return v8;
}

- (void)startPiggybackingForServerResponse:(id)a3 context:(id)a4 password:(id)a5 username:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(AKAppleIDAuthenticationService *)self _requestingControllerWithServerResponse:a3];
  [v14 setInitiatingContext:v13];

  [v14 setInitiatingPassword:v12];
  id v15 = [v14 delegate];

  if (!v15) {
    [v14 setDelegate:self];
  }
  id v16 = +[AKPiggybackController sharedController];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100062D00;
  v18[3] = &unk_100228318;
  id v19 = v11;
  id v17 = v11;
  [v16 startRequestSessionWithController:v14 completion:v18];
}

- (void)performCircleRequestWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[AKPiggybackController sharedController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100062EB0;
  v10[3] = &unk_100229108;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 performCircleRequestWithContext:v5 completion:v10];
}

- (void)piggyback:(id)a3 promptForRandomCodeWithCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Prompting for piggybacking code", v11, 2u);
  }

  authUILiaison = self->_authUILiaison;
  id v10 = [v7 initiatingContext];

  [(AKAuthenticationUILiaison *)authUILiaison presentSecondFactorUIForContext:v10 client:self->_client completion:v6];
}

- (void)piggyback:(id)a3 validateSecurityCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 idmsData];
  id v12 = [v8 initialAuthResponse];
  id v13 = [v8 initiatingContext];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000630BC;
  v16[3] = &unk_100229130;
  id v17 = v8;
  id v18 = v9;
  void v16[4] = self;
  id v14 = v8;
  id v15 = v9;
  [(AKAppleIDAuthenticationService *)self _handleSecondFactorUICompletionWithCode:v10 error:0 idmsData:v11 piggybacking:1 initialAuthResponse:v12 context:v13 completion:v16];
}

- (void)piggyback:(id)a3 shouldContinueWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 initiatingContext];
  id v9 = [v8 username];
  id v10 = [v6 initiatingPassword];
  id v11 = [v6 initialAuthResponse];
  id v12 = [v6 initiatingContext];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100063398;
  v15[3] = &unk_100229180;
  void v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [(AKAppleIDAuthenticationService *)self _shouldContinueAuthenticatingForUsername:v9 password:v10 serverResponse:v11 didShowServerUI:0 continuationData:0 error:0 context:v12 completion:v15];
}

- (void)piggyback:(id)a3 handleEscapeHatchError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Piggybacking session failed with error: %@", buf, 0xCu);
  }

  authUILiaison = self->_authUILiaison;
  id v13 = [v8 initiatingContext];
  client = self->_client;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006364C;
  v17[3] = &unk_1002286A8;
  id v18 = v8;
  id v19 = self;
  id v20 = v10;
  id v15 = v10;
  id v16 = v8;
  [(AKAuthenticationUILiaison *)authUILiaison dismissSecondFactorUIForContext:v13 client:client completion:v17];
}

- (void)piggyback:(id)a3 handleVerificationWithError:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 initiatingContext];
  [(AKAppleIDAuthenticationService *)self _showAlertForLoginCodeValidationError:v9 context:v10 completion:v8];
}

- (BOOL)_updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 edpState];

  if (v13)
  {
    accountManager = self->_accountManager;
    id v15 = [v11 edpState];
    [(AKAccountManager *)accountManager setEDPState:v15 forAccount:v10];
  }
  id v16 = [v11 passwordVersion];

  if (v16)
  {
    id v17 = self->_accountManager;
    id v18 = [v11 passwordVersion];
    [(AKAccountManager *)v17 setPasswordVersion:v18 forAccount:v10];
  }
  id v19 = [v11 srpProtocol];

  if (v19)
  {
    id v20 = self->_accountManager;
    os_signpost_id_t v21 = [v11 srpProtocol];
    [(AKAccountManager *)v20 setSRPProtocol:v21 forAccount:v10];
  }
  id v22 = objc_opt_new();
  unsigned __int8 v23 = [v22 updateAuthKitAccount:v10 withServerResponse:v11 context:v12 error:a6];

  return v23;
}

- (BOOL)_shouldSkipAccountUpdatesForAuthWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 proxiedDeviceAnisetteData];
  if ((+[AKAccountManager isAccountsFrameworkAvailable] & 1) == 0)
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      id v6 = "We are running in recovery. Skip ACAccount update.";
      id v7 = (uint8_t *)&v18;
      goto LABEL_21;
    }
LABEL_22:

    LOBYTE(v5) = 1;
    goto LABEL_23;
  }
  if ([v3 isEphemeral])
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      id v6 = "This auth is ephemeral. Skip ACAccount update.";
      id v7 = (uint8_t *)&v17;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  uint64_t v8 = [v3 proxiedDevice];
  uint64_t v9 = v8 | v4;

  if (v9)
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      id v6 = "This is a proxy auth. Skip ACAccount update.";
      id v7 = (uint8_t *)&v16;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if ([v3 needsNewChildAccount])
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v6 = "This is a child account creation flow. Skip ACAccount update.";
      id v7 = (uint8_t *)&v15;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  id v10 = [v3 appProvidedContext];
  if ([v10 isEqualToString:AKAppleIDAuthenticationAppProvidedContextEasyStudentSignIn])
  {
    id v11 = [v3 proxiedAppleID];

    if (v11)
    {
      id v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        id v6 = "This auth is for a student. Skip ACAccount update.";
        id v7 = (uint8_t *)&v14;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  else
  {
  }
  id v5 = [v3 dependentAltDSID];

  if (v5)
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v6 = "This auth is for a dependent. Skip ACAccount update.";
      id v7 = (uint8_t *)&v13;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_23:

  return (char)v5;
}

- (void)synchronizeFollowUpItemsForContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = objc_alloc_init((Class)AKAuthHandlerImpl);
  id v7 = +[AKFollowUpManagerFactory sharedAuthKitFollowupManager];
  [v7 synchronizeFollowUpItemsForContext:v6 authHandler:v8 completion:v5];
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting to teardown follow ups", v9, 2u);
  }

  id v8 = +[AKFollowUpManagerFactory sharedAuthKitFollowupManager];
  [v8 teardownFollowUpWithContext:v6 completion:v5];
}

- (void)_fetchDeviceListWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] != (id)3) {
    goto LABEL_4;
  }
  if ([(AKClient *)self->_client hasServerOnlyDeviceListAccess])
  {
    [v6 setForceFetch:1];
LABEL_4:
    authTrafficController = self->_authTrafficController;
    client = self->_client;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100064124;
    v12[3] = &unk_100227A18;
    id v13 = v6;
    __int16 v14 = self;
    id v15 = v7;
    [(AKAuthenticationTrafficController *)authTrafficController beginAuthenticatedRequestWithContext:v13 client:client clearanceHandler:v12];

    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100185E3C();
  }

  if (v7)
  {
    id v10 = +[NSError ak_deviceListErrorWithCode:-14007];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)deleteDeviceListCacheWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKFeatureManager sharedManager];
  unsigned int v9 = [v8 isDeviceListCacheEnabled];

  if (v9)
  {
    id v10 = [AKDeviceListRequester alloc];
    id v11 = +[AKDeviceListStoreManager sharedManager];
    id v12 = objc_opt_new();
    id v13 = +[AKAccountManager sharedInstance];
    __int16 v14 = [(AKDeviceListRequester *)v10 initWithStoreManager:v11 cdpFactory:v12 accountManager:v13 client:self->_client];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006468C;
    v16[3] = &unk_100227BD0;
    id v17 = v6;
    id v18 = v7;
    [(AKDeviceListRequester *)v14 clearDeviceListCacheWithContext:v17 completionHandler:v16];
  }
  else
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100185EEC();
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)deleteDeviceListCacheWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AKFeatureManager sharedManager];
  unsigned int v5 = [v4 isDeviceListCacheEnabled];

  if (v5)
  {
    id v6 = +[AKDeviceListStoreManager sharedManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000648A0;
    v8[3] = &unk_100228DD8;
    id v9 = v3;
    [v6 clearDatabaseWithCompletionHandler:v8];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100185EEC();
    }

    if (v3) {
      (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    }
  }
}

- (void)fetchTokensWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v21 = (void (**)(id, id, id))a5;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v25;
    do
    {
      id v15 = 0;
      __int16 v16 = v13;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v15);
        tokenManager = self->_tokenManager;
        id v23 = v16;
        id v19 = [(AKTokenManager *)tokenManager tokenWithIdentifier:v17 altDSID:v8 forAccount:0 error:&v23];
        id v13 = v23;

        if (v19)
        {
          id v20 = [v19 description];
          [v10 setObject:v20 forKeyedSubscript:v17];
        }
        id v15 = (char *)v15 + 1;
        __int16 v16 = v13;
      }
      while (v12 != v15);
      id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }

  if (v21) {
    v21[2](v21, v10, v13);
  }
}

- (void)deleteTokensFromCacheWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL, id))a5;
  if (!v9 || ![v9 count])
  {
    tokenManager = self->_tokenManager;
    id v21 = 0;
    [(AKTokenManager *)tokenManager deleteTokenFromCacheWithIdentifer:0 altDSID:v8 error:&v21];
    id v14 = v21;
    if (!v10) {
      goto LABEL_13;
    }
LABEL_12:
    v10[2](v10, v14 == 0, v14);
    goto LABEL_13;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v24;
    do
    {
      __int16 v16 = 0;
      uint64_t v17 = v14;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v16);
        id v19 = self->_tokenManager;
        id v22 = v17;
        [(AKTokenManager *)v19 updateToken:0 identifier:v18 altDSID:v8 account:0 credential:0 error:&v22];
        id v14 = v22;

        __int16 v16 = (char *)v16 + 1;
        uint64_t v17 = v14;
      }
      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  if (v10) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)fetchBirthdayForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasBirthdayAccess])
  {
    if ([(AKClient *)self->_client isPermittedToAccessBirthday])
    {
      id v8 = +[AKAccountManager sharedInstance];
      id v20 = 0;
      id v9 = [v8 authKitAccountWithAltDSID:v6 error:&v20];
      id v10 = v20;

      if (!v9)
      {
        if (v10)
        {
          if (v7) {
            (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v10);
          }
          goto LABEL_26;
        }
        if (!v7)
        {
LABEL_26:

          goto LABEL_27;
        }
        id v11 = +[NSError errorWithDomain:AKPersonalInformationErrorDomain code:-18001 userInfo:0];
        (*((void (**)(id, void, void, AKBirthDayKeychain *))v7 + 2))(v7, 0, 0, v11);
LABEL_25:

        goto LABEL_26;
      }
      id v11 = objc_alloc_init(AKBirthDayKeychain);
      id v19 = 0;
      id v12 = [(AKBirthDayKeychain *)v11 fetchBirthDayForAltDSID:v6 error:&v19];
      id v13 = v19;
      if (v13)
      {
        if (v7) {
          (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v13);
        }
        goto LABEL_24;
      }
      if (v12)
      {
        uint64_t v15 = +[NSCalendar currentCalendar];
        __int16 v16 = [v15 components:28 fromDate:v12];

        if (v7)
        {
          uint64_t v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 day]);
          uint64_t v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 month]);
          (*((void (**)(id, void *, void *, void))v7 + 2))(v7, v17, v18, 0);
        }
      }
      else
      {
        if (!v7)
        {
LABEL_24:

          goto LABEL_25;
        }
        __int16 v16 = +[NSError errorWithDomain:AKPersonalInformationErrorDomain code:-18003 userInfo:0];
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v16);
      }

      goto LABEL_24;
    }
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100185FBC();
    }
  }
  else
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100185FF0();
    }
  }

  if (v7)
  {
    id v10 = +[NSError errorWithDomain:AKPersonalInformationErrorDomain code:-18002 userInfo:0];
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v10);
LABEL_27:
  }
}

- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setClient:self->_client];
  [v11 edpRequestWithAltDSID:v10 URLKey:v9 completion:v8];
}

- (void)performEdpMigrationWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasOwnerAccess])
  {
    if (v6)
    {
      [(AKAppleIDAuthenticationService *)self _edpRequestWithAltDSID:v6 URLKey:AKURLBagKeyEDPMigration completion:v7];
      goto LABEL_13;
    }
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100186024();
    }

    if (v7)
    {
      uint64_t v9 = -7025;
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100183934();
    }

    if (v7)
    {
      uint64_t v9 = -7026;
LABEL_12:
      id v11 = +[NSError ak_errorWithCode:v9];
      v7[2](v7, 0, v11);
    }
  }
LABEL_13:
}

- (void)performEdpCompleteKeyDropWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasOwnerAccess])
  {
    if (v6)
    {
      [(AKAppleIDAuthenticationService *)self _edpRequestWithAltDSID:v6 URLKey:AKURLBagKeyEDPComplete completion:v7];
      goto LABEL_13;
    }
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100186024();
    }

    if (v7)
    {
      uint64_t v9 = -7025;
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100183934();
    }

    if (v7)
    {
      uint64_t v9 = -7026;
LABEL_12:
      id v11 = +[NSError ak_errorWithCode:v9];
      v7[2](v7, 0, v11);
    }
  }
LABEL_13:
}

- (void)performRemoveEdpTokenWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasOwnerAccess])
  {
    if (v6)
    {
      [(AKAppleIDAuthenticationService *)self _edpRequestWithAltDSID:v6 URLKey:AKURLBagKeyRemoveEDPToken completion:v7];
      goto LABEL_13;
    }
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100186024();
    }

    if (v7)
    {
      uint64_t v9 = -7025;
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100183934();
    }

    if (v7)
    {
      uint64_t v9 = -7026;
LABEL_12:
      id v11 = +[NSError ak_errorWithCode:v9];
      v7[2](v7, 0, v11);
    }
  }
LABEL_13:
}

- (AKPasswordResetPresenter)passwordResetPresenter
{
  return self->_passwordResetPresenter;
}

- (void)setPasswordResetPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordResetPresenter, 0);
  objc_storeStrong((id *)&self->_eduController, 0);
  objc_storeStrong((id *)&self->_fidoHandler, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->proximityServiceProvider, 0);
  objc_storeStrong((id *)&self->_authUILiaison, 0);
  objc_storeStrong((id *)&self->_authTrafficController, 0);
  objc_storeStrong((id *)&self->_tokenManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_authProxy, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end