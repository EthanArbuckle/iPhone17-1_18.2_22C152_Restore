@interface AKUserInfoController
+ (id)sharedController;
- (AKUserInfoController)init;
- (BOOL)_additionalInfoChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_adpCohortChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_authorizationPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_birthYearChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_deviceListPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_edpStateChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_idmsEDPTokenIdChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_loginHandlesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_managedAppleIDInfoChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_passcodeAuthPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_passkeyPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_passwordVersionChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_piggybackingApprovalEligibleChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_securityKeysChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_shouldUpdateConfigsForAltDSID:(id)a3 responseParameters:(id)a4;
- (BOOL)_srpProtocolChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_trustedContactPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_trustedPhoneNumbersChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_updateAccount:(id)a3 withUserInformationResponse:(id)a4 modifyAliases:(BOOL)a5;
- (BOOL)_walrusPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (id)_userInfoChangeNotificationDictionaryForAltDSID:(id)a3 userInformation:(id)a4;
- (id)authorizationUserInformationForRequest:(id)a3 shouldRequestUpdate:(BOOL *)a4 error:(id *)a5;
- (id)previousAccountInfoRefreshDateForAccount:(id)a3;
- (void)_broadcastEmailChangeNotification;
- (void)_fetchUserInformationForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6;
- (void)_fetchUserInformationWithContext:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6;
- (void)_processHideMyEmailForAltDSID:(id)a3 userInfo:(id)a4 response:(id)a5;
- (void)_processIncomingUserInformationForAltDSID:(id)a3 userInformation:(id)a4;
- (void)_refreshApplicationInformationForAltDSID:(id)a3;
- (void)_refreshDeviceListForAccount:(id)a3;
- (void)_sendNotification:(id)a3 withUserInfo:(id)a4;
- (void)_setPreviousAccountInfoRefreshDate:(id)a3 forAccount:(id)a4;
- (void)_syncPrivateEmailsForAltDSID:(id)a3 client:(id)a4 userInformation:(id)a5 completion:(id)a6;
- (void)_updatePrivateEmailsWithInformation:(id)a3;
- (void)_updateUserConfigIfNecessaryForAltDSID:(id)a3 responseParameters:(id)a4;
- (void)fetchUserInformationForAltDSID:(id)a3 client:(id)a4 completion:(id)a5;
- (void)fetchUserInformationWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)processPushMessage:(id)a3;
- (void)refreshAccountUsernamesForAltDSID:(id)a3 dataCenter:(id)a4;
- (void)refreshAccountUsernamesForAltDSID:(id)a3 withUserInformation:(id)a4;
- (void)sendUserInfoChangeNotificationWithPayload:(id)a3;
- (void)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4;
- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5;
@end

@implementation AKUserInfoController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F130;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_100272458 != -1) {
    dispatch_once(&qword_100272458, block);
  }
  v2 = (void *)qword_100272450;

  return v2;
}

- (AKUserInfoController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKUserInfoController;
  v2 = [(AKUserInfoController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;
  }
  return v2;
}

- (void)fetchUserInformationForAltDSID:(id)a3 client:(id)a4 completion:(id)a5
{
}

- (void)fetchUserInformationWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
}

- (void)_fetchUserInformationForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v14 setAltDSID:v13];

  [(AKUserInfoController *)self _fetchUserInformationWithContext:v14 client:v12 dataCenter:v11 completion:v10];
}

- (void)_fetchUserInformationWithContext:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 altDSID];

  if (v14)
  {
    v15 = +[AKAccountManager sharedInstance];
    v16 = [v10 altDSID];
    v17 = [v15 authKitAccountWithAltDSID:v16 error:0];

    if (v17)
    {
      v18 = +[NSDate date];
      [(AKUserInfoController *)self _setPreviousAccountInfoRefreshDate:v18 forAccount:v17];
    }
    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v10 altDSID];
      *(_DWORD *)buf = 138412290;
      v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Starting to fetch user info for %@", buf, 0xCu);
    }
    v21 = [AKGrandSlamRequestProvider alloc];
    v22 = [(AKURLRequestProviderImpl *)v21 initWithContext:v10 urlBagKey:AKURLBagKeyFetchUserInfo];
    [(AKURLRequestProviderImpl *)v22 setClient:v11];
    [(AKGrandSlamRequestProvider *)v22 setAuthenticatedRequest:1];
    [(AKURLRequestProviderImpl *)v22 setDataCenterIdentifier:v12];
    if ([v10 deviceRegionRequired]) {
      [(AKURLRequestProviderImpl *)v22 set_denyVirtualInterfaces:1];
    }
    v23 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v22];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10006F574;
    v25[3] = &unk_1002295F8;
    id v26 = v10;
    v27 = self;
    id v28 = v11;
    id v29 = v13;
    [(AKServiceControllerImpl *)v23 executeRequestWithCompletion:v25];
  }
  else if (v13)
  {
    v24 = +[NSError ak_errorWithCode:-7025];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v24);
  }
}

- (void)refreshAccountUsernamesForAltDSID:(id)a3 dataCenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSXPCConnection beginTransaction];
  [(AKUserInfoController *)self _fetchUserInformationForAltDSID:v7 client:0 dataCenter:v6 completion:&stru_100229638];
}

- (BOOL)_shouldUpdateConfigsForAltDSID:(id)a3 responseParameters:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AKAccountManager sharedInstance];
  v8 = [v7 authKitAccountWithAltDSID:v6 error:0];

  v9 = +[AKAccountManager sharedInstance];
  id v10 = [v9 configDataVersionForAccount:v8];

  id v11 = [v5 objectForKeyedSubscript:AKConfigDataVersion];

  BOOL v12 = v11 && (!v10 || ([v11 isEqual:v10] & 1) == 0);
  return v12;
}

- (void)_updateUserConfigIfNecessaryForAltDSID:(id)a3 responseParameters:(id)a4
{
  id v6 = a3;
  if ([(AKUserInfoController *)self _shouldUpdateConfigsForAltDSID:v6 responseParameters:a4])
  {
    id v7 = objc_alloc_init(AKUserConfigController);
    uint64_t v9 = AKAllConfigsKey;
    v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [(AKUserConfigController *)v7 fetchUserConfigForAltDSID:v6 client:0 dataCenter:0 forIdentifiers:v8 completion:&stru_100229678];
  }
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)1400)
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling push in info controller with command AKPushMessageCommandAccountInfoChanged...", v12, 2u);
    }

    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"userinfodata"];

    if (v7)
    {
      v8 = [[AKAppleIDUserInformationResponse alloc] initWithResponseBody:v7];
      uint64_t v9 = [v4 altDSID];
      [(AKUserInfoController *)self _processIncomingUserInformationForAltDSID:v9 userInformation:v8];

      id v10 = [v4 altDSID];
      [(AKUserInfoController *)self _processHideMyEmailForAltDSID:v10 userInfo:v7 response:v8];
    }
    else
    {
      id v11 = [v4 eventDetails];
      v8 = [v11 objectForKeyedSubscript:@"dataCenter"];

      id v10 = [v4 altDSID];
      [(AKUserInfoController *)self refreshAccountUsernamesForAltDSID:v10 dataCenter:v8];
    }
  }
}

- (void)_processHideMyEmailForAltDSID:(id)a3 userInfo:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[AKAccountManager sharedInstance];
  BOOL v12 = [v11 primaryAuthKitAccount];
  id v13 = [v11 altDSIDForAccount:v12];
  if ([v13 isEqualToString:v8])
  {
    id v14 = [[AKPrivateEmailInformation alloc] initWithResponseBody:v9];
    v15 = +[AKPrivateEmailStoreManager sharedInstance];
    int v16 = [v15 currentProtocolVersion];
    if (v16 >= [(AKPrivateEmailInformation *)v14 protocolVersion])
    {
LABEL_14:
      if ([(AKPrivateEmailInformation *)v14 shouldSyncWithServer]) {
        [(AKUserInfoController *)self _syncPrivateEmailsForAltDSID:v8 client:0 userInformation:v10 completion:0];
      }
      else {
        [(AKUserInfoController *)self _updatePrivateEmailsWithInformation:v14];
      }

      goto LABEL_18;
    }
    v21 = self;
    id v23 = 0;
    [v15 clearDatabase:&v23];
    id v17 = v23;
    if (v17)
    {
      id v18 = v17;
      v19 = _AKLogHme();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100187B20();
      }
    }
    else
    {
      id v22 = 0;
      unsigned int v20 = objc_msgSend(v15, "setProtocolVersion:error:", -[AKPrivateEmailInformation protocolVersion](v14, "protocolVersion"), &v22);
      id v18 = v22;
      if (v20)
      {
        [(AKPrivateEmailInformation *)v14 setShouldSyncWithServer:1];
LABEL_13:

        self = v21;
        goto LABEL_14;
      }
      v19 = _AKLogHme();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100187AB8();
      }
    }

    goto LABEL_13;
  }
  _AKLogHme();
  id v14 = (AKPrivateEmailInformation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG)) {
    sub_100187B88();
  }
LABEL_18:
}

- (void)_processIncomingUserInformationForAltDSID:(id)a3 userInformation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 userInformationRepresentation];
  [(AKUserInfoController *)self refreshAccountUsernamesForAltDSID:v7 withUserInformation:v6];

  [(AKUserInfoController *)self updateUserInformationForAltDSID:v7 userInformation:v8 completion:0];
}

- (void)_syncPrivateEmailsForAltDSID:(id)a3 client:(id)a4 userInformation:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = [a5 userInformationRepresentation];
  id v13 = [v12 privateEmailListVersion];
  id v14 = v13;
  if (v13 && ([v13 isEqualToString:@"0"] & 1) == 0)
  {
    v15 = +[AKPrivateEmailStoreManager sharedInstance];
    int v16 = [v15 currentEmailListVersion];
    if ([v14 isEqualToString:v16])
    {
LABEL_14:

      goto LABEL_15;
    }
    id v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100187BF0();
    }

    id v18 = [[AKPrivateEmailServiceController alloc] initWithClient:v10 altDSID:v9];
    if (v18)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000700C8;
      v21[3] = &unk_100227250;
      id v22 = (id)os_transaction_create();
      id v23 = v11;
      id v19 = v22;
      [(AKPrivateEmailServiceController *)v18 executeFetchHmeListRequestWithCompletion:v21];
    }
    else
    {
      unsigned int v20 = _AKLogHme();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100187BBC();
      }

      if (!v11) {
        goto LABEL_13;
      }
      id v19 = +[NSError ak_errorWithCode:-7096];
      (*((void (**)(id, void, id))v11 + 2))(v11, 0, v19);
    }

LABEL_13:
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_updatePrivateEmailsWithInformation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 privateEmailListVersion];
  id v5 = _AKLogHme();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100187D34();
  }

  if (v4 && ([v4 isEqualToString:@"0"] & 1) == 0)
  {
    id v6 = +[AKPrivateEmailStoreManager sharedInstance];
    id v7 = [v6 currentEmailListVersion];
    id v8 = _AKLogHme();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100187CCC();
    }

    if (([v4 isEqualToString:v7] & 1) == 0)
    {
      id v12 = 0;
      unsigned __int8 v9 = [v6 commitChangesToCacheWithInformation:v3 error:&v12];
      id v10 = v12;
      if ((v9 & 1) == 0)
      {
        id v11 = _AKLogHme();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100187C64();
        }
      }
    }
  }
}

- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void, id, id))a5;
  id v11 = [(AKUserInfoController *)self _userInfoChangeNotificationDictionaryForAltDSID:v8 userInformation:v9];
  if (![v11 count]) {
    goto LABEL_58;
  }
  id v12 = [(AKAccountManager *)self->_accountManager authKitAccountWithAltDSID:v8 error:0];
  id v13 = [v9 authMode];
  id v14 = [v11 objectForKeyedSubscript:AKUserInfoChangedAuthModeKey];

  BOOL v15 = v14 != 0;
  if (v14) {
    [(AKAccountManager *)self->_accountManager setAuthenticationMode:v13 forAccount:v12];
  }
  int v16 = [v9 isMdmInfoRequired];
  id v17 = [v16 BOOLValue];

  id v18 = [v11 objectForKeyedSubscript:AKUserInfoChangedMDMInfoRequiredKey];

  if (v18)
  {
    [(AKAccountManager *)self->_accountManager setMDMInformationRequired:v17 forAccount:v12];
    BOOL v15 = 1;
  }
  id v19 = [v9 appleIDSecurityLevel];
  unsigned int v20 = [v11 objectForKeyedSubscript:AKUserInfoChangedSecurityLevelKey];

  if (v20)
  {
    [(AKAccountManager *)self->_accountManager setSecurityLevel:v19 forAccount:v12];
    if (v19 == (id)4)
    {
      v21 = [[AKSatoriController alloc] initWithClient:0];
      [(AKSatoriController *)v21 warmUpVerificationSessionWithCompletionHandler:0];
    }
    BOOL v15 = 1;
  }
  id v22 = [v11 objectForKeyedSubscript:AKUserInfoChangedRepairStateKey];

  if (v22)
  {
    -[AKAccountManager setRepairState:forAccount:](self->_accountManager, "setRepairState:forAccount:", [v9 repairState], v12);
    BOOL v15 = 1;
  }
  id v23 = [v11 objectForKeyedSubscript:AKGroupKitEligibilityKey];

  if (v23)
  {
    accountManager = self->_accountManager;
    v25 = [v9 groupKitEligibility];
    [(AKAccountManager *)accountManager setGroupKitEligibility:v25 forAccount:v12];

    BOOL v15 = 1;
  }
  id v26 = [v11 objectForKeyedSubscript:AKSOSActiveDeviceKey];
  if (v26)
  {

LABEL_17:
    id v29 = self->_accountManager;
    v30 = [v9 hasSOSActiveDevice];
    -[AKAccountManager setHasSOSActiveDevice:forAccount:](v29, "setHasSOSActiveDevice:forAccount:", [v30 BOOLValue], v12);

    int v28 = 1;
    goto LABEL_18;
  }
  v27 = [v11 objectForKeyedSubscript:AKSOSActiveDeviceLegacyKey];

  int v28 = v15;
  if (v27) {
    goto LABEL_17;
  }
LABEL_18:
  v31 = [v11 objectForKeyedSubscript:@"activeHMECount"];

  if (v31)
  {
    v32 = [v9 activeHMECount];
    [(AKAccountManager *)self->_accountManager setActiveiCloudPrivateEmailCount:v32 forAccount:v12];

    int v28 = 1;
  }
  v33 = [v11 objectForKeyedSubscript:@"inActiveHMECount"];

  if (v33)
  {
    v34 = [v9 inActiveHMECount];
    [(AKAccountManager *)self->_accountManager setInactiveiCloudPrivateEmailCount:v34 forAccount:v12];

    int v28 = 1;
  }
  v35 = [v11 objectForKeyedSubscript:AKSOSNeededKey];

  if (v35)
  {
    v36 = self->_accountManager;
    v37 = [v9 SOSNeeded];
    -[AKAccountManager setSOSNeeded:forAccount:](v36, "setSOSNeeded:forAccount:", [v37 BOOLValue], v12);

    int v28 = 1;
  }
  v38 = [v11 objectForKeyedSubscript:AKConfigDataVersion];

  if (v38)
  {
    v39 = self->_accountManager;
    v40 = [v9 configDataVersion];
    [(AKAccountManager *)v39 setConfigDataVersion:v40 forAccount:v12];

    int v28 = 1;
  }
  v41 = [v11 objectForKeyedSubscript:AKHasModernRKKey];

  if (v41)
  {
    v42 = self->_accountManager;
    v43 = [v9 hasModernRecoveryKey];
    -[AKAccountManager setHasModernRecoveryKey:forAccount:](v42, "setHasModernRecoveryKey:forAccount:", [v43 BOOLValue], v12);

    int v28 = 1;
  }
  BOOL v69 = v15;
  v70 = v10;
  id v71 = v8;
  v44 = [v11 objectForKeyedSubscript:AK3PRegulatoryOverrideKey];

  if (v44)
  {
    v45 = self->_accountManager;
    v46 = [v9 thirdPartyRegulatoryOverride];
    [(AKAccountManager *)v45 set3PRegulatoryOverride:v46 forAccount:v12];

    int v28 = 1;
  }
  int v57 = v28;
  unsigned __int8 v58 = [(AKUserInfoController *)self _authorizationPropertiesChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v59 = [(AKUserInfoController *)self _passkeyPropertiesChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v60 = [(AKUserInfoController *)self _walrusPropertiesChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v61 = [(AKUserInfoController *)self _passcodeAuthPropertiesChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v62 = [(AKUserInfoController *)self _deviceListPropertiesChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v63 = [(AKUserInfoController *)self _additionalInfoChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v68 = [(AKUserInfoController *)self _trustedPhoneNumbersChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v67 = [(AKUserInfoController *)self _securityKeysChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v66 = [(AKUserInfoController *)self _loginHandlesChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v65 = [(AKUserInfoController *)self _managedAppleIDInfoChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v64 = [(AKUserInfoController *)self _trustedContactPropertiesChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v47 = [(AKUserInfoController *)self _birthYearChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v48 = [(AKUserInfoController *)self _adpCohortChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v49 = [(AKUserInfoController *)self _edpStateChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v50 = [(AKUserInfoController *)self _passwordVersionChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v51 = [(AKUserInfoController *)self _srpProtocolChangedForAccount:v12 userInformation:v9];
  unsigned __int8 v52 = [(AKUserInfoController *)self _idmsEDPTokenIdChangedForAccount:v12 userInformation:v9];
  if ([(AKUserInfoController *)self _piggybackingApprovalEligibleChangedForAccount:v12 userInformation:v9]|| (v52 & 1) != 0|| (v51 & 1) != 0|| (v50 & 1) != 0|| (v49 & 1) != 0|| (v48 & 1) != 0|| (v47 & 1) != 0|| (v64 & 1) != 0|| (v65 & 1) != 0|| (v66 & 1) != 0|| (v67 & 1) != 0|| (v68 & 1) != 0|| (v63 & 1) != 0|| (v62 & 1) != 0|| (v61 & 1) != 0|| (v60 & 1) != 0
    || (v59 & 1) != 0
    || (v58 & 1) != 0
    || v57)
  {
    v55 = self->_accountManager;
    id v72 = 0;
    id v53 = [(AKAccountManager *)v55 saveAccount:v12 error:&v72];
    id v54 = v72;
  }
  else
  {
    id v53 = 0;
    id v54 = 0;
  }
  id v10 = v70;
  if (v69)
  {
    v56 = _AKLogSystem();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      sub_100187D9C();
    }

    [(AKUserInfoController *)self sendUserInfoChangeNotificationWithPayload:v11];
  }
  id v8 = v71;
  [(AKUserInfoController *)self updateBirthdayForAltDSID:v71 userInformation:v9];
  if (v70) {
    v70[2](v70, v53, v54);
  }

LABEL_58:
}

- (BOOL)_piggybackingApprovalEligibleChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  accountManager = self->_accountManager;
  id v8 = a4;
  unsigned int v9 = [(AKAccountManager *)accountManager piggybackingApprovalEligible:v6];
  id v10 = [v8 piggybackingApprovalEligible];

  id v11 = [v10 BOOLValue];
  if ((v9 ^ v11) == 1) {
    [(AKAccountManager *)self->_accountManager setPiggybackingApprovalEligible:v11 forAccount:v6];
  }

  return v9 ^ v11;
}

- (id)_userInfoChangeNotificationDictionaryForAltDSID:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  unsigned int v9 = [(AKAccountManager *)self->_accountManager authKitAccountWithAltDSID:v6 error:0];
  if (v9)
  {
    id v71 = v6;
    [v8 setObject:v6 forKeyedSubscript:AKUserInfoChangedAltDSIDKey];
    id v10 = [(AKAccountManager *)self->_accountManager authenticationModeForAccount:v9];
    id v11 = [v7 authMode];
    if (v11 != v10 && v11 != 0)
    {
      id v13 = +[NSNumber numberWithUnsignedInteger:v11];
      [v8 setObject:v13 forKeyedSubscript:AKUserInfoChangedAuthModeKey];
    }
    unsigned int v14 = [(AKAccountManager *)self->_accountManager mdmInformationRequiredForAccount:v9];
    BOOL v15 = [v7 isMdmInfoRequired];
    id v16 = [v15 BOOLValue];

    if (v14 != v16)
    {
      id v17 = +[NSNumber numberWithBool:v16];
      [v8 setObject:v17 forKeyedSubscript:AKUserInfoChangedMDMInfoRequiredKey];
    }
    id v18 = [(AKAccountManager *)self->_accountManager securityLevelForAccount:v9];
    id v19 = [v7 appleIDSecurityLevel];
    if (v19 != v18 && v19)
    {
      unsigned int v20 = +[NSNumber numberWithUnsignedInteger:v19];
      [v8 setObject:v20 forKeyedSubscript:AKUserInfoChangedSecurityLevelKey];
    }
    uint64_t v21 = [(AKAccountManager *)self->_accountManager hasSOSActiveDeviceForAccount:v9];
    id v22 = [v7 hasSOSActiveDevice];
    id v23 = v22;
    if (v22 && (!v21 || v22 != (void *)v21))
    {
      v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v22 BOOLValue]);
      [v8 setObject:v24 forKeyedSubscript:AKSOSActiveDeviceKey];
    }
    uint64_t v25 = [(AKAccountManager *)self->_accountManager isSOSNeededForAccount:v9];
    id v26 = [v7 SOSNeeded];
    v73 = v26;
    if (v26 && (!v25 || v26 != (void *)v25))
    {
      v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v26 BOOLValue]);
      [v8 setObject:v27 forKeyedSubscript:AKSOSNeededKey];
    }
    id v28 = [(AKAccountManager *)self->_accountManager repairStateForAccount:v9];
    id v29 = [v7 repairState];
    if (v29 != v28 && v29)
    {
      v30 = +[NSNumber numberWithUnsignedInteger:v29];
      [v8 setObject:v30 forKeyedSubscript:AKUserInfoChangedRepairStateKey];
    }
    v91 = [(AKAccountManager *)self->_accountManager webAccessEnabledForAccount:v9];
    v83 = [v7 webAccessEnabled];
    if (v83)
    {
      if (!v91
        || (unsigned int v31 = [v83 BOOLValue], v31 != objc_msgSend(v91, "BOOLValue")))
      {
        v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v83 BOOLValue]);
        [v8 setObject:v32 forKeyedSubscript:AKWebAccessEnabledKey];
      }
    }
    v90 = [(AKAccountManager *)self->_accountManager serverExperimentalFeaturesForAccount:v9];
    v82 = [v7 serverExperimentalFeatures];
    if (v82)
    {
      if (!v90 || (id v33 = [v82 integerValue], v33 != objc_msgSend(v90, "integerValue"))) {
        [v8 setObject:v82 forKeyedSubscript:AKServerExperimentalFeaturesKey];
      }
    }
    v89 = [(AKAccountManager *)self->_accountManager passkeyEligibleForAccount:v9];
    v81 = [v7 passkeyEligible];
    if (v81)
    {
      if (!v89
        || (unsigned int v34 = [v81 BOOLValue], v34 != objc_msgSend(v89, "BOOLValue")))
      {
        v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v81 BOOLValue]);
        [v8 setObject:v35 forKeyedSubscript:AKPasskeyEligibleKey];
      }
    }
    v88 = [(AKAccountManager *)self->_accountManager passkeyPresentForAccount:v9];
    v80 = [v7 passkeyPresent];
    if (v80)
    {
      if (!v88
        || (unsigned int v36 = [v80 BOOLValue], v36 != objc_msgSend(v88, "BOOLValue")))
      {
        v37 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v80 BOOLValue]);
        [v8 setObject:v37 forKeyedSubscript:AKPasskeyPresentKey];
      }
    }
    v87 = [(AKAccountManager *)self->_accountManager groupKitEligibilityForAccount:v9];
    v79 = [v7 groupKitEligibility];
    if (v79)
    {
      if (!v87 || (id v38 = [v79 integerValue], v38 != objc_msgSend(v87, "integerValue"))) {
        [v8 setObject:v79 forKeyedSubscript:AKGroupKitEligibilityKey];
      }
    }
    v86 = [(AKAccountManager *)self->_accountManager inactiveiCloudPrivateEmailCountForAccount:v9];
    v78 = [v7 inActiveHMECount];
    if (v78)
    {
      if (!v86 || (id v39 = [v78 integerValue], v39 != objc_msgSend(v86, "integerValue"))) {
        [v8 setObject:v78 forKeyedSubscript:AKHMEInActiveCountKey];
      }
    }
    v85 = [(AKAccountManager *)self->_accountManager activeiCloudPrivateEmailCountForAccount:v9];
    v77 = [v7 activeHMECount];
    if (v77)
    {
      if (!v85 || (id v40 = [v77 integerValue], v40 != objc_msgSend(v85, "integerValue"))) {
        [v8 setObject:v77 forKeyedSubscript:AKHMEActiveCountKey];
      }
    }
    v76 = [(AKAccountManager *)self->_accountManager configDataVersionForAccount:v9];
    v75 = [v7 configDataVersion];
    if (v75)
    {
      id v41 = v75;
      id v42 = v76;
      if (v42 && [v41 isEqual:v42])
      {
      }
      else
      {

        [v8 setObject:v41 forKeyedSubscript:AKConfigDataVersion];
      }
    }
    v92 = [(AKAccountManager *)self->_accountManager hasModernRecoveryKeyForAccount:v9];
    v43 = [v7 hasModernRecoveryKey];
    id v72 = v43;
    if (v43 && (!v92 || v43 != v92))
    {
      v44 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v43 BOOLValue]);
      [v8 setObject:v44 forKeyedSubscript:AKHasModernRKKey];
    }
    v45 = [(AKAccountManager *)self->_accountManager get3PRegulatoryOverride:v9];
    v74 = [v7 thirdPartyRegulatoryOverride];
    if (v74)
    {
      id v46 = v74;
      id v47 = v45;
      if (v47 && [v46 isEqual:v47])
      {
      }
      else
      {

        [v8 setObject:v46 forKeyedSubscript:AK3PRegulatoryOverrideKey];
      }
    }
    unsigned __int8 v67 = v45;
    v70 = (void *)v21;
    uint64_t v48 = [(AKAccountManager *)self->_accountManager adpCohortForAccount:v9];
    uint64_t v49 = [v7 adpCohort];
    unsigned __int8 v50 = (void *)v49;
    if (v49 && (!v48 || v49 != v48)) {
      [v8 setObject:v49 forKeyedSubscript:AKADPCohortKey];
    }
    unsigned __int8 v68 = (void *)v25;
    BOOL v69 = v23;
    uint64_t v51 = [(AKAccountManager *)self->_accountManager edpStateForAccount:v9];
    uint64_t v52 = [v7 edpState];
    id v53 = (void *)v52;
    if (v52 && (!v51 || v52 != v51)) {
      [v8 setObject:v52 forKeyedSubscript:AKEDPStateKey];
    }
    unsigned __int8 v65 = (void *)v51;
    id v54 = [(AKAccountManager *)self->_accountManager passwordVersionForAccount:v9];
    uint64_t v55 = [v7 passwordVersion];
    v56 = (void *)v55;
    if (v55 && (!v54 || (void *)v55 != v54)) {
      [v8 setObject:v55 forKeyedSubscript:AKPasswordVersionKey];
    }
    unsigned __int8 v66 = (void *)v48;
    v84 = v8;
    int v57 = [(AKAccountManager *)self->_accountManager srpProtocolForAccount:v9];
    unsigned __int8 v58 = [v7 srpProtocol];
    unsigned __int8 v59 = v58;
    if (v58 && (!v57 || ([v58 isEqualToString:v57] & 1) == 0)) {
      [v84 setObject:v59 forKeyedSubscript:AKSRPProtocolKey];
    }
    unsigned __int8 v60 = [(AKAccountManager *)self->_accountManager idmsEDPTokenIdForAccount:v9];
    unsigned __int8 v61 = [v7 idmsEDPTokenId];
    unsigned __int8 v62 = v61;
    if (v61 && (!v60 || ([v61 isEqualToString:v60] & 1) == 0)) {
      [v84 setObject:v62 forKeyedSubscript:AKIdMSEDPTokenIdKey];
    }

    id v6 = v71;
    id v8 = v84;
  }
  id v63 = [v8 copy];

  return v63;
}

- (BOOL)_passkeyPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 passkeyEligible];
  uint64_t v9 = [(AKAccountManager *)self->_accountManager passkeyEligibleForAccount:v6];
  id v10 = (void *)v9;
  if (!v8
    || v9 && (unsigned int v11 = [v8 BOOLValue], v11 == objc_msgSend(v10, "BOOLValue")))
  {
    BOOL v12 = 0;
  }
  else
  {
    -[AKAccountManager setPasskeyEligible:forAccount:](self->_accountManager, "setPasskeyEligible:forAccount:", [v8 BOOLValue], v6);
    BOOL v12 = 1;
  }
  id v13 = [v7 passkeyPresent];
  uint64_t v14 = [(AKAccountManager *)self->_accountManager passkeyPresentForAccount:v6];
  BOOL v15 = (void *)v14;
  if (v13)
  {
    if (!v14
      || (unsigned int v16 = [v13 BOOLValue], v16 != objc_msgSend(v15, "BOOLValue")))
    {
      -[AKAccountManager setPasskeyPresent:forAccount:](self->_accountManager, "setPasskeyPresent:forAccount:", [v13 BOOLValue], v6);
      [(AKAccountManager *)self->_accountManager setPasskeysInKeychainCount:0 forAccount:v6];
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (BOOL)_walrusPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 webAccessEnabled];
  uint64_t v9 = [(AKAccountManager *)self->_accountManager webAccessEnabledForAccount:v6];
  id v10 = (void *)v9;
  if (!v8
    || v9 && (unsigned int v11 = [v8 BOOLValue], v11 == objc_msgSend(v10, "BOOLValue")))
  {
    BOOL v12 = 0;
  }
  else
  {
    -[AKAccountManager setWebAccessEnabled:forAccount:](self->_accountManager, "setWebAccessEnabled:forAccount:", [v8 BOOLValue], v6);
    BOOL v12 = 1;
  }
  id v13 = [v7 serverExperimentalFeatures];
  uint64_t v14 = [(AKAccountManager *)self->_accountManager serverExperimentalFeaturesForAccount:v6];
  BOOL v15 = (void *)v14;
  if (v13)
  {
    if (!v14 || (id v16 = [v13 integerValue], v16 != objc_msgSend(v15, "integerValue")))
    {
      [(AKAccountManager *)self->_accountManager setServerExperimentalFeatures:v13 forAccount:v6];
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (BOOL)_passcodeAuthPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 passcodeAuthEnabled];
  id v9 = [v8 BOOLValue];

  unsigned int v10 = v9 ^ [(AKAccountManager *)self->_accountManager isPasscodeAuthEnabledForAccount:v6];
  if (v10 == 1) {
    [(AKAccountManager *)self->_accountManager setPasscodeAuthEnabled:v9 forAccount:v6];
  }
  unsigned int v11 = [v7 askToBuy];
  id v12 = [v11 BOOLValue];

  if (v12 != [(AKAccountManager *)self->_accountManager isAskToBuyForAccount:v6])
  {
    [(AKAccountManager *)self->_accountManager setAskToBuy:v12 forAccount:v6];
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)_deviceListPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 deviceListVersion];
  id v9 = [v8 hash];

  unsigned int v10 = [(AKAccountManager *)self->_accountManager deviceListVersionForAccount:v6];
  id v11 = [v10 hash];

  if (v9 != v11)
  {
    accountManager = self->_accountManager;
    id v13 = [v7 deviceListVersion];
    [(AKAccountManager *)accountManager setDeviceListVersion:v13 forAccount:v6];

    [(AKAccountManager *)self->_accountManager saveAccount:v6 error:0];
    uint64_t v14 = +[AKFeatureManager sharedManager];
    LODWORD(v13) = [v14 isDeviceListCacheEnableDryMode];

    if (v13)
    {
      BOOL v15 = dispatch_get_global_queue(9, 0);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100071938;
      v17[3] = &unk_100226C00;
      v17[4] = self;
      id v18 = v6;
      dispatch_async(v15, v17);
    }
  }

  return v9 != v11;
}

- (BOOL)_authorizationPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 vettedPrimaryEmail];
  id v9 = [v8 BOOLValue];

  unsigned int v10 = [(AKAccountManager *)self->_accountManager verifiedPrimaryEmailForAccount:v6];
  id v11 = [v7 vettedPrimaryEmail];
  if (!v11 || (v11, v9 == v10))
  {
    char v12 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setVerifiedPrimaryEmail:v9 forAccount:v6];
    char v12 = 1;
  }
  id v13 = [v7 phoneAsAppleID];
  id v14 = [v13 BOOLValue];

  unsigned int v15 = [(AKAccountManager *)self->_accountManager phoneAsAppleIDForAccount:v6];
  id v16 = [v7 phoneAsAppleID];
  if (v16)
  {

    if (v14 != v15)
    {
      [(AKAccountManager *)self->_accountManager setPhoneAsAppleID:v14 forAccount:v6];
      char v12 = 1;
    }
  }
  id v17 = [v7 previouslyWantedPrivateEmail];
  id v18 = [v17 BOOLValue];

  unsigned int v19 = [(AKAccountManager *)self->_accountManager selectedPrivateEmailForAccount:v6];
  unsigned int v20 = [v7 previouslyWantedPrivateEmail];
  if (v20)
  {

    if (v18 != v19)
    {
      [(AKAccountManager *)self->_accountManager setSelectedPrivateEmail:v18 forAccount:v6];
      char v12 = 1;
    }
  }
  uint64_t v21 = [v7 primaryEmailAddress];
  uint64_t v22 = [(AKAccountManager *)self->_accountManager primaryEmailAddressForAccount:v6];
  id v23 = (void *)v22;
  if (v21 && (!v22 || ([v21 isEqual:v22] & 1) == 0))
  {
    [(AKAccountManager *)self->_accountManager setPrimaryEmailAddress:v21 forAccount:v6];
    char v12 = 1;
  }
  v24 = [v7 givenName];
  uint64_t v25 = [(AKAccountManager *)self->_accountManager givenNameForAccount:v6];
  id v26 = (void *)v25;
  if (v24 && (!v25 || ([v24 isEqual:v25] & 1) == 0))
  {
    [(AKAccountManager *)self->_accountManager setGivenName:v24 forAccount:v6];
    char v12 = 1;
  }
  v27 = [v7 familyName];
  uint64_t v28 = [(AKAccountManager *)self->_accountManager familyNameForAccount:v6];
  v84 = v26;
  v91 = (void *)v28;
  if (v27 && (!v28 || ([v27 isEqual:v28] & 1) == 0))
  {
    [(AKAccountManager *)self->_accountManager setFamilyName:v27 forAccount:v6];
    char v12 = 1;
  }
  id v29 = [v7 forwardingEmail];
  uint64_t v30 = [(AKAccountManager *)self->_accountManager forwardingEmailForAccount:v6];
  v93 = v29;
  v90 = (void *)v30;
  if (v29 && (!v30 || ([v29 isEqual:v30] & 1) == 0))
  {
    [(AKAccountManager *)self->_accountManager setForwardingEmail:v29 forAccount:v6];
    char v12 = 1;
  }
  unsigned int v31 = [v7 previouslySelectedEmail];
  uint64_t v32 = [(AKAccountManager *)self->_accountManager selectedAuthorizationEmailForAccount:v6];
  v92 = v31;
  v86 = v23;
  v87 = v21;
  v89 = (void *)v32;
  if (v31 && (!v32 || ([v31 isEqual:v32] & 1) == 0))
  {
    [(AKAccountManager *)self->_accountManager setSelectedAuthorizationEmail:v31 forAccount:v6];
    char v12 = 1;
  }
  uint64_t v33 = [v7 reachableEmails];
  unsigned int v34 = +[NSSet setWithArray:v33];
  v35 = [(AKAccountManager *)self->_accountManager reachableEmailAddressesForAccount:v6];
  uint64_t v36 = +[NSSet setWithArray:v35];

  v88 = (void *)v33;
  v81 = (void *)v36;
  if (v33)
  {
    v37 = v34;
    if (([v34 isEqualToSet:v36] & 1) == 0)
    {
      [(AKAccountManager *)self->_accountManager setReachableEmailAddresses:v88 forAccount:v6];
      char v12 = 1;
    }
  }
  else
  {
    v37 = v34;
  }
  id v38 = [v7 hasUsedAuthorization];
  id v39 = [v38 BOOLValue];

  unsigned int v40 = [(AKAccountManager *)self->_accountManager authorizationUsedForAccount:v6];
  id v41 = [v7 hasUsedAuthorization];
  if (v41)
  {

    if (v39 != v40)
    {
      [(AKAccountManager *)self->_accountManager setAuthorizationUsed:v39 forAccount:v6];
      char v12 = 1;
    }
  }
  id v42 = [v7 privateAttestationEnabled];
  id v43 = [v42 BOOLValue];

  unsigned int v44 = [(AKAccountManager *)self->_accountManager privateAttestationEnabledForAccount:v6];
  v45 = [v7 privateAttestationEnabled];
  if (v45)
  {

    if (v43 != v44)
    {
      [(AKAccountManager *)self->_accountManager setPrivateAttestationEnabled:v43 forAccount:v6];
      char v12 = 1;
    }
  }
  id v46 = [v7 isUnderage];
  id v47 = [v46 BOOLValue];

  unsigned int v48 = [(AKAccountManager *)self->_accountManager userUnderAgeForAccount:v6];
  uint64_t v49 = [v7 isUnderage];
  if (v49)
  {

    if (v47 != v48)
    {
      [(AKAccountManager *)self->_accountManager setUserUnderage:v47 forAccount:v6];
      char v12 = 1;
    }
  }
  unsigned __int8 v50 = [v7 isSiwaForChildEnabled];
  id v51 = [v50 BOOLValue];

  unsigned int v52 = [(AKAccountManager *)self->_accountManager isSiwaEnabledForChildAccount:v6];
  if ([(AKAccountManager *)self->_accountManager userUnderAgeForAccount:v6])
  {
    id v53 = v37;
    id v54 = [v7 isSiwaForChildEnabled];

    if (v54)
    {
      v37 = v53;
      if (v51 != v52)
      {
        [(AKAccountManager *)self->_accountManager setIsSiwaEnabled:v51 forChildAccount:v6];
        char v12 = 1;
      }
    }
    else
    {
      v37 = v53;
    }
  }
  uint64_t v55 = [v7 isSenior];
  id v56 = [v55 BOOLValue];

  unsigned int v57 = [(AKAccountManager *)self->_accountManager userIsSeniorForAccount:v6];
  unsigned __int8 v58 = [v7 isSenior];
  if (v58)
  {

    if (v56 != v57)
    {
      [(AKAccountManager *)self->_accountManager setUserIsSenior:v56 forAccount:v6];
      char v12 = 1;
    }
  }
  uint64_t v59 = [v7 ageOfMajority];
  uint64_t v60 = [(AKAccountManager *)self->_accountManager ageOfMajorityForAccount:v6];
  v79 = (void *)v60;
  if (v59 && v59 != v60)
  {
    [(AKAccountManager *)self->_accountManager setAgeOfMajority:v59 forAccount:v6];
    char v12 = 1;
  }
  unsigned __int8 v61 = [v7 canAttestAge];
  uint64_t v62 = [(AKAccountManager *)self->_accountManager canAttestAgeForAccount:v6];
  v83 = v27;
  v78 = (void *)v62;
  if (v61 && (void *)v62 != v61)
  {
    [(AKAccountManager *)self->_accountManager setCanAttestAge:v61 forAccount:v6];
    char v12 = 1;
  }
  id v63 = [v7 appleIDCountryCode];
  uint64_t v64 = [(AKAccountManager *)self->_accountManager appleIDCountryCodeForAccount:v6];
  unsigned __int8 v65 = (void *)v64;
  v85 = v24;
  v82 = v37;
  v80 = (void *)v59;
  if (v63 && (!v64 || ([v63 isEqual:v64] & 1) == 0))
  {
    [(AKAccountManager *)self->_accountManager setAppleIDCountryCode:v63 forAccount:v6];
    char v12 = 1;
  }
  v77 = v65;
  unsigned __int8 v66 = [v7 isProximityAuthEligible];
  uint64_t v67 = +[NSNumber numberWithBool:[(AKAccountManager *)self->_accountManager isProximityAuthEligible:v6]];
  unsigned __int8 v68 = (void *)v67;
  if (v66 && v66 != (void *)v67)
  {
    -[AKAccountManager setIsProximityAuthEligible:forAccount:](self->_accountManager, "setIsProximityAuthEligible:forAccount:", [v66 BOOLValue], v6);
    char v12 = 1;
  }
  id v69 = [v7 userAgeRange];
  if (v69 != [(AKAccountManager *)self->_accountManager userAgeRangeForAccount:v6])
  {
    [(AKAccountManager *)self->_accountManager setUserAgeRange:v69 forAccount:v6];
    char v12 = 1;
  }
  BOOL v76 = v12;
  v70 = [v7 authorizedApplicationsListVersion];
  id v71 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v6];
  id v72 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000721C4;
  block[3] = &unk_100226BD8;
  id v95 = v70;
  id v96 = v71;
  v97 = self;
  id v73 = v71;
  id v74 = v70;
  dispatch_async(v72, block);

  return v76;
}

- (BOOL)_trustedContactPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 canHaveCustodian];
  id v9 = [v8 BOOLValue];

  unsigned int v10 = [(AKAccountManager *)self->_accountManager canHaveCustodianForAccount:v6];
  id v11 = [v7 canHaveCustodian];
  if (!v11 || (v11, v9 == v10))
  {
    BOOL v12 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setCanHaveCustodian:v9 forAccount:v6];
    BOOL v12 = 1;
  }
  id v13 = [v7 canBeCustodian];
  id v14 = [v13 BOOLValue];

  unsigned int v15 = [(AKAccountManager *)self->_accountManager canBeCustodianForAccount:v6];
  id v16 = [v7 canBeCustodian];
  if (v16)
  {

    if (v14 != v15)
    {
      [(AKAccountManager *)self->_accountManager setCanBeCustodian:v14 forAccount:v6];
      BOOL v12 = 1;
    }
  }
  id v17 = [v7 custodianEnabled];
  id v18 = [v17 BOOLValue];

  unsigned int v19 = [(AKAccountManager *)self->_accountManager custodianEnabledForAccount:v6];
  unsigned int v20 = [v7 custodianEnabled];
  if (v20)
  {

    if (v18 != v19)
    {
      [(AKAccountManager *)self->_accountManager setCustodianEnabled:v18 forAccount:v6];
      BOOL v12 = 1;
    }
  }
  uint64_t v21 = [v7 canHaveBeneficiary];
  id v22 = [v21 BOOLValue];

  unsigned int v23 = [(AKAccountManager *)self->_accountManager canHaveBeneficiaryForAccount:v6];
  v24 = [v7 canHaveBeneficiary];
  if (v24)
  {

    if (v22 != v23)
    {
      [(AKAccountManager *)self->_accountManager setCanHaveBeneficiary:v22 forAccount:v6];
      BOOL v12 = 1;
    }
  }
  uint64_t v25 = [v7 canBeBeneficiary];
  id v26 = [v25 BOOLValue];

  unsigned int v27 = [(AKAccountManager *)self->_accountManager canBeBeneficiaryForAccount:v6];
  uint64_t v28 = [v7 canBeBeneficiary];
  if (v28)
  {

    if (v26 != v27)
    {
      [(AKAccountManager *)self->_accountManager setCanBeBeneficiary:v26 forAccount:v6];
      BOOL v12 = 1;
    }
  }
  uint64_t v29 = [v7 custodianLastModified];
  uint64_t v30 = [(AKAccountManager *)self->_accountManager custodianLastModifiedForAccount:v6];
  unsigned __int8 v50 = (void *)v30;
  if (v29 && v29 != v30)
  {
    [(AKAccountManager *)self->_accountManager setCustodianLastModified:v29 forAccount:v6];
    BOOL v12 = 1;
  }
  unsigned int v31 = [v7 beneficiaryLastModified];
  uint64_t v32 = [(AKAccountManager *)self->_accountManager beneficiaryLastModifiedForAccount:v6];
  id v51 = (void *)v29;
  uint64_t v49 = (void *)v32;
  if (v31 && v31 != (void *)v32)
  {
    [(AKAccountManager *)self->_accountManager setBeneficiaryLastModified:v31 forAccount:v6];
    BOOL v12 = 1;
  }
  uint64_t v33 = [v7 custodianInfos];
  uint64_t v34 = [(AKAccountManager *)self->_accountManager custodianInfosForAccount:v6];
  v35 = (void *)v34;
  if (!v33)
  {
    uint64_t v36 = 0;
    if (v34) {
      goto LABEL_25;
    }
LABEL_27:
    uint64_t v37 = 0;
    goto LABEL_28;
  }
  uint64_t v36 = [v33 sortedArrayUsingComparator:&stru_1002296B8];

  if (!v35) {
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v37 = [v35 sortedArrayUsingComparator:&stru_1002296B8];

LABEL_28:
  uint64_t v47 = v37;
  if (v36 && (objc_msgSend(v36, "isEqualToArray:", v37, v37, v49, v50, v51) & 1) == 0)
  {
    [(AKAccountManager *)self->_accountManager setCustodianInfos:v36 forAccount:v6];
    BOOL v12 = 1;
  }
  id v38 = objc_msgSend(v7, "beneficiaryInfo", v47);
  id v39 = [(AKAccountManager *)self->_accountManager beneficiaryInfoForAccount:v6];
  uint64_t v40 = +[AKBeneficiaryUpdater removeWrappedKeyFrom:v39];
  id v41 = (void *)v40;
  if (v38)
  {
    id v42 = [v38 sortedArrayUsingComparator:&stru_1002296D8];

    if (v41)
    {
LABEL_33:
      id v43 = [v41 sortedArrayUsingComparator:&stru_1002296D8];

      goto LABEL_36;
    }
  }
  else
  {
    id v42 = 0;
    if (v40) {
      goto LABEL_33;
    }
  }
  id v43 = 0;
LABEL_36:
  if (([v42 isEqualToArray:v43] & 1) == 0)
  {
    unsigned int v44 = _AKLogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      sub_100187EB4();
    }

    v45 = +[AKBeneficiaryUpdater saveWrappedKeyInKeychain:v42];
    [(AKAccountManager *)self->_accountManager setBeneficiaryInfo:v45 forAccount:v6];

    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)_adpCohortChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 adpCohort];
  uint64_t v8 = [(AKAccountManager *)self->_accountManager adpCohortForAccount:v6];
  id v9 = (void *)v8;
  if (!v7 || v8 && (id v10 = [v7 integerValue], v10 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v11 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setADPCohort:v7 forAccount:v6];
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_edpStateChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 edpState];
  uint64_t v8 = [(AKAccountManager *)self->_accountManager edpStateForAccount:v6];
  id v9 = (void *)v8;
  if (!v7 || v8 && (id v10 = [v7 integerValue], v10 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v11 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setEDPState:v7 forAccount:v6];
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_passwordVersionChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 passwordVersion];
  uint64_t v8 = [(AKAccountManager *)self->_accountManager passwordVersionForAccount:v6];
  id v9 = (void *)v8;
  if (!v7 || v8 && (id v10 = [v7 integerValue], v10 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v11 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setPasswordVersion:v7 forAccount:v6];
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_srpProtocolChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 srpProtocol];
  uint64_t v8 = [(AKAccountManager *)self->_accountManager srpProtocolForAccount:v6];
  id v9 = (void *)v8;
  if (!v7 || v8 && ([v7 isEqualToString:v8] & 1) != 0)
  {
    BOOL v10 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setSRPProtocol:v7 forAccount:v6];
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)_idmsEDPTokenIdChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 idmsEDPTokenId];
  uint64_t v8 = [(AKAccountManager *)self->_accountManager idmsEDPTokenIdForAccount:v6];
  id v9 = (void *)v8;
  if (!v7 || v8 && ([v7 isEqualToString:v8] & 1) != 0)
  {
    BOOL v10 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setIdMSEDPTokenId:v7 forAccount:v6];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_refreshApplicationInformationForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)os_transaction_create();
  id v5 = +[AKApplicationInformationController sharedController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100072F2C;
  v8[3] = &unk_100229700;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 fetchAppInformationWithAltDSID:v7 client:0 completion:v8];
}

- (void)refreshAccountUsernamesForAltDSID:(id)a3 withUserInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = [v7 allAccountNames];
    if ([v9 count])
    {

      goto LABEL_7;
    }
    BOOL v11 = [v8 userInformationRepresentation];
    BOOL v12 = [v11 phoneAsAppleID];
    unsigned __int8 v13 = [v12 BOOLValue];

    if (v13)
    {
LABEL_7:
      id v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating cached properties for Apple ID accounts with altDSID: %@", (uint8_t *)&v18, 0xCu);
      }

      id v10 = [(AKAccountManager *)self->_accountManager authKitAccountWithAltDSID:v6 error:0];
      if (v10) {
        unsigned int v15 = [(AKUserInfoController *)self _updateAccount:v10 withUserInformationResponse:v8 modifyAliases:1];
      }
      else {
        unsigned int v15 = 0;
      }
      id v16 = [(AKAccountManager *)self->_accountManager appleIDAccountWithAltDSID:v6];
      if (v16) {
        v15 |= [(AKUserInfoController *)self _updateAccount:v16 withUserInformationResponse:v8 modifyAliases:0];
      }
      id v17 = [(AKAccountManager *)self->_accountManager iCloudAccountForAltDSID:v6];
      if (v17)
      {
        if (((v15 | [(AKUserInfoController *)self _updateAccount:v17 withUserInformationResponse:v8 modifyAliases:0]) & 1) == 0)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      else if (!v15)
      {
        goto LABEL_17;
      }
      [(AKUserInfoController *)self _broadcastEmailChangeNotification];
      goto LABEL_17;
    }
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100187F84();
    }
  }
  else
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100187F50();
    }
  }
LABEL_18:
}

- (id)previousAccountInfoRefreshDateForAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  id v5 = [v4 previousAccountInfoRefreshDateForAccount:v3];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = +[AKUserDefaults objectForKey:AKLastEmailListRequestDateKey];
  }
  id v7 = v6;

  return v7;
}

- (void)_setPreviousAccountInfoRefreshDate:(id)a3 forAccount:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100187FB8();
  }

  uint64_t v8 = +[AKAccountManager sharedInstance];
  [v8 setPreviousAccountInfoRefreshDate:v6 forAccount:v5];

  +[AKUserDefaults setValue:0 forKey:AKLastEmailListRequestDateKey];
}

- (BOOL)_updateAccount:(id)a3 withUserInformationResponse:(id)a4 modifyAliases:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 userInformationRepresentation];
  uint64_t v11 = [v10 accountName];
  if (v11)
  {
    BOOL v12 = (void *)v11;
    unsigned __int8 v13 = [v9 userInformationRepresentation];
    id v14 = [v13 accountName];
    unsigned int v15 = [v8 username];
    unsigned __int8 v16 = [v14 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      id v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Username of account %@ is no longer a valid", (uint8_t *)&v32, 0xCu);
      }

      int v18 = [v9 userInformationRepresentation];
      id v19 = [v18 accountName];
      [v8 setUsername:v19];

      if (!v5) {
        goto LABEL_15;
      }
      int v20 = 1;
LABEL_9:
      id v22 = [(AKAccountManager *)self->_accountManager aliasesForAccount:v8];
      unsigned int v23 = +[NSSet setWithArray:v22];
      v24 = [v9 userInformationRepresentation];
      uint64_t v25 = [v24 accountAliases];
      id v26 = +[NSSet setWithArray:v25];

      if ([v26 isEqual:v23])
      {

        if (!v20)
        {
          BOOL v21 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        unsigned int v27 = _AKLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 138412546;
          id v33 = v8;
          __int16 v34 = 2112;
          v35 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating full list of account names for %@ to: %@", (uint8_t *)&v32, 0x16u);
        }

        accountManager = self->_accountManager;
        uint64_t v29 = [v9 userInformationRepresentation];
        uint64_t v30 = [v29 accountAliases];
        [(AKAccountManager *)accountManager setAliases:v30 forAccount:v8];
      }
LABEL_15:
      [(AKAccountManager *)self->_accountManager saveAccount:v8 error:0];
      BOOL v21 = 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v20 = 0;
  BOOL v21 = 0;
  if (v5) {
    goto LABEL_9;
  }
LABEL_16:

  return v21;
}

- (void)_broadcastEmailChangeNotification
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100188040();
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v4 = AKAppleIDEmailsDidChangeNotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, AKAppleIDEmailsDidChangeNotification, 0, 0, 1u);
  BOOL v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:v4 object:0];
}

- (void)sendUserInfoChangeNotificationWithPayload:(id)a3
{
}

- (void)_sendNotification:(id)a3 withUserInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Posting %@ with payload: %@", (uint8_t *)&v10, 0x16u);
  }

  id v8 = +[NSDistributedNotificationCenter defaultCenter];
  [v8 postNotificationName:v5 object:0 userInfo:v6 deliverImmediately:1];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:v5 object:0 userInfo:v6];
}

- (id)authorizationUserInformationForRequest:(id)a3 shouldRequestUpdate:(BOOL *)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = _AKLogSiwa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100188164();
  }

  id v8 = v6;
  id v9 = [v6 authkitAccount];
  id v10 = [(AKAccountManager *)self->_accountManager authorizationUsedForAccount:v9];
  unsigned __int8 v11 = [(AKAccountManager *)self->_accountManager verifiedPrimaryEmailForAccount:v9];
  unsigned int v12 = [(AKAccountManager *)self->_accountManager phoneAsAppleIDForAccount:v9];
  id v13 = [(AKAccountManager *)self->_accountManager userUnderAgeForAccount:v9];
  id v14 = [(AKAccountManager *)self->_accountManager isSiwaEnabledForChildAccount:v9];
  unsigned int v70 = [(AKAccountManager *)self->_accountManager userIsSeniorForAccount:v9];
  id v73 = [(AKAccountManager *)self->_accountManager ageOfMajorityForAccount:v9];
  unsigned int v15 = [(AKAccountManager *)self->_accountManager givenNameForAccount:v9];
  unsigned __int8 v16 = [(AKAccountManager *)self->_accountManager familyNameForAccount:v9];
  v75 = [(AKAccountManager *)self->_accountManager primaryEmailAddressForAccount:v9];
  id v72 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v9];
  id v74 = -[AKAccountManager iCloudAccountForAltDSID:](self->_accountManager, "iCloudAccountForAltDSID:");
  unsigned __int8 v66 = v11;
  unsigned int v67 = v12;
  if (v15 && v16)
  {
    uint64_t v17 = (uint64_t)v16;
  }
  else
  {
    int v18 = _AKLogSiwa();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The Given/Family Name for the current user was not found in the AuthKit account", buf, 2u);
    }

    uint64_t v19 = [(AKAccountManager *)self->_accountManager givenNameForAccount:v74];

    uint64_t v17 = [(AKAccountManager *)self->_accountManager familyNameForAccount:v74];

    if (a4) {
      *a4 = 1;
    }
    unsigned int v15 = (void *)v19;
  }
  id v20 = objc_alloc_init((Class)AKUserInformation);
  [v20 setGivenName:v15];
  id v69 = (void *)v17;
  [v20 setFamilyName:v17];
  BOOL v21 = +[NSNumber numberWithBool:v10];
  [v20 setHasUsedAuthorization:v21];

  id v22 = [v9 username];
  unsigned int v23 = +[AKUsernameFormatter formattedUsernameFromUsername:v22];
  [v20 setAccountName:v23];

  [v20 setPrimaryEmailAddress:v75];
  v24 = +[NSNumber numberWithBool:v13];
  [v20 setIsUnderage:v24];

  uint64_t v25 = +[NSNumber numberWithBool:v14];
  [v20 setIsSiwaForChildEnabled:v25];

  id v26 = +[NSNumber numberWithBool:v70];
  [v20 setIsSenior:v26];

  [v20 setAgeOfMajority:v73];
  objc_msgSend(v20, "setAppleIDSecurityLevel:", -[AKAccountManager securityLevelForAccount:](self->_accountManager, "securityLevelForAccount:", v9));
  unsigned int v27 = [(AKAccountManager *)self->_accountManager hasSOSActiveDeviceForAccount:v9];
  [v20 setHasSOSActiveDevice:v27];

  uint64_t v28 = [(AKAccountManager *)self->_accountManager isSOSNeededForAccount:v9];
  [v20 setSOSNeeded:v28];

  uint64_t v29 = [(AKAccountManager *)self->_accountManager configDataVersionForAccount:v9];
  [v20 setConfigDataVersion:v29];

  uint64_t v30 = [(AKAccountManager *)self->_accountManager hasModernRecoveryKeyForAccount:v9];
  [v20 setHasModernRecoveryKey:v30];

  unsigned int v31 = [(AKAccountManager *)self->_accountManager get3PRegulatoryOverride:v9];
  [v20 setThirdPartyRegulatoryOverride:v31];

  int v32 = [(AKAccountManager *)self->_accountManager adpCohortForAccount:v9];
  [v20 setAdpCohort:v32];

  id v33 = [(AKAccountManager *)self->_accountManager edpStateForAccount:v9];
  [v20 setEdpState:v33];

  __int16 v34 = [(AKAccountManager *)self->_accountManager passwordVersionForAccount:v9];
  [v20 setPasswordVersion:v34];

  v35 = [(AKAccountManager *)self->_accountManager srpProtocolForAccount:v9];
  [v20 setSrpProtocol:v35];

  uint64_t v36 = [(AKAccountManager *)self->_accountManager idmsEDPTokenIdForAccount:v9];
  [v20 setIdmsEDPTokenId:v36];

  if ([v20 isManagedAppleID])
  {
    uint64_t v37 = +[NSNumber numberWithUnsignedInteger:[(AKAccountManager *)self->_accountManager managedOrganizationTypeForAccount:v9]];
    [v20 setManagedOrganizationType:v37];

    id v38 = [(AKAccountManager *)self->_accountManager managedOrganizationNameForAccount:v9];
    [v20 setManagedOrganizationName:v38];

    id v39 = +[NSNumber numberWithBool:[(AKAccountManager *)self->_accountManager isNotificationEmailAvailableForAccount:v9]];
    [v20 setIsNotificationEmailAvailable:v39];

    uint64_t v40 = [(AKAccountManager *)self->_accountManager notificationEmailForAccount:v9];
    [v20 setNotificationEmail:v40];

    objc_msgSend(v20, "setAuthMode:", -[AKAccountManager authenticationModeForAccount:](self->_accountManager, "authenticationModeForAccount:", v9));
  }
  id v71 = v8;
  id v41 = objc_msgSend(v8, "requestedScopes", a5);
  unsigned __int8 v42 = [v41 containsObject:AKAuthorizationScopeEmail];

  if (v42)
  {
    id v43 = _AKLogSystem();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      sub_100188130();
    }

    id v44 = [(AKAccountManager *)self->_accountManager forwardingEmailForAccount:v9];
    id v45 = [(AKAccountManager *)self->_accountManager selectedPrivateEmailForAccount:v9];
    id v46 = [(AKAccountManager *)self->_accountManager selectedAuthorizationEmailForAccount:v9];
    uint64_t v47 = [(AKAccountManager *)self->_accountManager combinedAliasesAndReachableEmailsForAccount:v9];
    id v48 = [v47 mutableCopy];

    uint64_t v49 = +[NSNumber numberWithBool:v45];
    [v20 setPreviouslyWantedPrivateEmail:v49];

    [v20 setPreviouslySelectedEmail:v46];
    if (v67)
    {
      unsigned __int8 v50 = _AKLogSiwa();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "This is a Mako Account, Ignoring primary email address verification", buf, 2u);
      }

      if ([v48 count])
      {
        id v51 = _AKLogSiwa();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          sub_1001880C8();
        }

        [v20 setReachableEmails:v48];
        if (v44)
        {
          [v20 setForwardingEmail:v44];
        }
        else
        {
          id v56 = [v48 firstObject];
          [v20 setForwardingEmail:v56];
        }
      }
      unsigned int v57 = _AKLogSiwa();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v77 = v20;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Completed getting UserInformation for Mako account with UserInfo:\n%@", buf, 0xCu);
      }

      id v53 = v20;
      goto LABEL_42;
    }
    if (v44)
    {
      [v20 setForwardingEmail:v44];
      id v54 = v69;
LABEL_29:
      if ([v48 containsObject:v44]) {
        [v48 removeObject:v44];
      }
      [v48 insertObject:v44 atIndex:0];

      goto LABEL_32;
    }
    if (v66)
    {
      id v44 = v75;
      [v20 setForwardingEmail:v44];
      id v54 = v69;
      if (v44) {
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v59 = _AKLogSiwa();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_1001880FC();
      }

      uint64_t v60 = [v20 reachableEmails];
      if (!v60
        || (unsigned __int8 v61 = (void *)v60,
            [v20 reachableEmails],
            uint64_t v62 = objc_claimAutoreleasedReturnValue(),
            id v63 = [v62 count],
            v62,
            v61,
            !v63))
      {
        if (v65)
        {
          +[NSError ak_errorWithCode:-7072];
          id v53 = 0;
          *unsigned __int8 v65 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v53 = 0;
        }
LABEL_42:
        id v54 = v69;
LABEL_43:

        goto LABEL_44;
      }
      [v20 setForwardingEmail:0];
      id v54 = v69;
    }
LABEL_32:
    [v20 setReachableEmails:v48];
    uint64_t v55 = _AKLogSiwa();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v77 = v20;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Completed getting UserInformation for account with UserInfo:\n%@", buf, 0xCu);
    }

    id v53 = v20;
    goto LABEL_43;
  }
  unsigned int v52 = _AKLogSiwa();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v77 = v20;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Application is not requesting email for this authorization early return with userInfo:\n%@", buf, 0xCu);
  }

  id v53 = v20;
  id v54 = v69;
LABEL_44:

  return v53;
}

- (BOOL)_additionalInfoChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 additionalInfo];
  id v9 = [(AKAccountManager *)self->_accountManager additionalInfoForAccount:v6];
  if (v8 && ([v8 isEqualToDictionary:v9] & 1) == 0)
  {
    [(AKAccountManager *)self->_accountManager setAdditionalInfo:v8 forAccount:v6];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }
  unsigned __int8 v11 = [v7 hasMDM];
  id v12 = [v11 BOOLValue];

  unsigned int v13 = [(AKAccountManager *)self->_accountManager hasMDMForAccount:v6];
  id v14 = [v7 hasMDM];

  if (v14)
  {

    if (v12 != v13)
    {
      [(AKAccountManager *)self->_accountManager setHasMDM:v12 forAccount:v6];
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (BOOL)_trustedPhoneNumbersChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 trustedPhoneNumbers];
  id v8 = +[NSSet setWithArray:v7];
  id v9 = [(AKAccountManager *)self->_accountManager trustedPhoneNumbersForAccount:v6];
  BOOL v10 = +[NSSet setWithArray:v9];

  if (v7 && ([v8 isEqualToSet:v10] & 1) == 0)
  {
    [(AKAccountManager *)self->_accountManager setTrustedPhoneNumbers:v7 forAccount:v6];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_securityKeysChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 securityKeys];
  id v8 = +[NSSet setWithArray:v7];
  id v9 = [(AKAccountManager *)self->_accountManager securityKeysForAccount:v6];
  BOOL v10 = +[NSSet setWithArray:v9];

  if (v7 && ([v8 isEqualToSet:v10] & 1) == 0)
  {
    [(AKAccountManager *)self->_accountManager setSecurityKeys:v7 forAccount:v6];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_loginHandlesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 loginHandles];
  id v8 = +[NSSet setWithArray:v7];
  id v9 = [(AKAccountManager *)self->_accountManager loginHandlesForAccount:v6];
  BOOL v10 = +[NSSet setWithArray:v9];

  if (v7 && ([v8 isEqualToSet:v10] & 1) == 0)
  {
    [(AKAccountManager *)self->_accountManager setLoginHandles:v7 forAccount:v6];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_managedAppleIDInfoChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isManagedAppleID])
  {
    id v8 = +[NSNumber numberWithUnsignedInteger:[(AKAccountManager *)self->_accountManager managedOrganizationTypeForAccount:v6]];
    id v9 = [v7 managedOrganizationType];
    BOOL v10 = v9;
    if (v9 && ([v9 isEqual:v8] & 1) == 0)
    {
      -[AKAccountManager setManagedOrganizationType:forAccount:](self->_accountManager, "setManagedOrganizationType:forAccount:", [v10 integerValue], v6);
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
    }
    uint64_t v13 = [(AKAccountManager *)self->_accountManager managedOrganizationNameForAccount:v6];
    id v14 = [v7 managedOrganizationName];
    unsigned int v15 = v14;
    v24 = (void *)v13;
    if (v14 && ([v14 isEqual:v13] & 1) == 0)
    {
      [(AKAccountManager *)self->_accountManager setManagedOrganizationName:v15 forAccount:v6];
      int v11 = 1;
    }
    unsigned int v16 = [(AKAccountManager *)self->_accountManager isNotificationEmailAvailableForAccount:v6];
    uint64_t v17 = [v7 isNotificationEmailAvailable];
    id v18 = [v17 BOOLValue];

    uint64_t v19 = [v7 isNotificationEmailAvailable];
    if (v19)
    {

      if (v16 != v18)
      {
        [(AKAccountManager *)self->_accountManager setIsNotificationEmailAvailable:v18 forAccount:v6];
        int v11 = 1;
      }
    }
    id v20 = [(AKAccountManager *)self->_accountManager notificationEmailForAccount:v6];
    BOOL v21 = [v7 notificationEmail];
    id v22 = v21;
    if (v21 && ([v21 isEqual:v20] & 1) == 0)
    {
      [(AKAccountManager *)self->_accountManager setNotificationEmail:v22 forAccount:v6];
      int v11 = 1;
    }

    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_refreshDeviceListForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [AKDeviceListRequester alloc];
  id v6 = +[AKDeviceListStoreManager sharedManager];
  id v7 = objc_opt_new();
  id v8 = +[AKAccountManager sharedInstance];
  int v11 = [(AKDeviceListRequester *)v5 initWithStoreManager:v6 cdpFactory:v7 accountManager:v8 client:0];

  id v9 = objc_alloc_init((Class)AKDeviceListRequestContext);
  BOOL v10 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v4];

  [v9 setAltDSID:v10];
  [v9 setForceFetch:1];
  [v9 setIncludeUntrustedDevices:1];
  [(AKDeviceListRequester *)v11 fetchDeviceListWithContext:v9 completionHandler:&stru_100229740];
}

- (BOOL)_birthYearChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  accountManager = self->_accountManager;
  id v8 = a4;
  id v9 = [(AKAccountManager *)accountManager birthYearForAccount:v6];
  BOOL v10 = [v8 birthYear];

  if (!v10 || v9 && (id v11 = [v10 integerValue], v11 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v12 = 0;
  }
  else
  {
    [(AKAccountManager *)self->_accountManager setBirthYear:v10 forAccount:v6];
    BOOL v12 = 1;
  }

  return v12;
}

- (void)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(AKBirthDayKeychain);
  id v21 = 0;
  id v8 = [(AKBirthDayKeychain *)v7 fetchBirthDayForAltDSID:v5 error:&v21];
  id v9 = v21;
  BOOL v10 = +[AKAccountManager sharedInstance];
  id v11 = [v10 authKitAccountWithAltDSID:v5 error:0];

  BOOL v12 = [v6 birthMonth];
  uint64_t v13 = [v6 birthDay];
  id v14 = [v6 birthYear];
  unsigned int v15 = +[NSString stringWithFormat:@"%@-%@-%@", v12, v13, v14];

  id v16 = objc_alloc_init((Class)NSDateFormatter);
  [v16 setDateFormat:@"MM-dd-yyyy"];
  id v17 = objc_alloc_init((Class)NSDate);
  id v18 = [v16 dateFromString:v15];

  if (v18 != v8)
  {
    uint64_t v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100188268();
    }

    uint64_t v20 = 0;
    [(AKBirthDayKeychain *)v7 updateBirthdayForAltDSID:v5 userInformation:v6 error:&v20];
  }
}

- (void).cxx_destruct
{
}

@end