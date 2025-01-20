@interface AKServerResponseAccountUpdater
- (AKAccountManager)accountManager;
- (AKServerResponseAccountUpdater)init;
- (AKTokenManager)tokenManager;
- (AKUserInfoController)userInfoController;
- (BOOL)_saveAccount:(id)a3 userInfoDictionary:(id)a4 error:(id *)a5;
- (BOOL)updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6;
- (void)_postUserInfoChangedNotificationWithPayload:(id)a3;
- (void)_updateAccountInUseForAccount:(id)a3 withContext:(id)a4;
- (void)_updateAccountInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5;
- (void)_updateAppleAccountSecurityPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5;
- (void)_updateBeneficiaryPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateChildPasscodePropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateCustodianPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateMaidPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updatePasskeyPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateRemainingPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateSecurityLevelForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5;
- (void)_updateTelemetryDeviceSessionIDForAccount:(id)a3 withContext:(id)a4;
- (void)_updateTokensForAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5;
- (void)_updateUserInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setTokenManager:(id)a3;
- (void)setUserInfoController:(id)a3;
@end

@implementation AKServerResponseAccountUpdater

- (AKServerResponseAccountUpdater)init
{
  v10.receiver = self;
  v10.super_class = (Class)AKServerResponseAccountUpdater;
  v2 = [(AKServerResponseAccountUpdater *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    uint64_t v5 = +[AKTokenManager sharedInstance];
    tokenManager = v2->_tokenManager;
    v2->_tokenManager = (AKTokenManager *)v5;

    uint64_t v7 = +[AKUserInfoController sharedController];
    userInfoController = v2->_userInfoController;
    v2->_userInfoController = (AKUserInfoController *)v7;
  }
  return v2;
}

- (BOOL)updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = +[NSMutableDictionary dictionary];
  [(AKServerResponseAccountUpdater *)self _updateAccountInfoPropertiesForAccount:v10 withServerResponse:v12 userInfoDictionary:v13];
  [(AKServerResponseAccountUpdater *)self _updateUserInfoPropertiesForAccount:v10 withServerResponse:v12];
  [(AKServerResponseAccountUpdater *)self _updateSecurityLevelForAccount:v10 withServerResponse:v12 userInfoDictionary:v13];
  [(AKServerResponseAccountUpdater *)self _updateMaidPropertiesForAccount:v10 withServerResponse:v12];
  [(AKServerResponseAccountUpdater *)self _updateAppleAccountSecurityPropertiesForAccount:v10 withServerResponse:v12 userInfoDictionary:v13];
  [(AKServerResponseAccountUpdater *)self _updatePasskeyPropertiesForAccount:v10 withServerResponse:v12];
  [(AKServerResponseAccountUpdater *)self _updateChildPasscodePropertiesForAccount:v10 withServerResponse:v12];
  [(AKServerResponseAccountUpdater *)self _updateCustodianPropertiesForAccount:v10 withServerResponse:v12];
  [(AKServerResponseAccountUpdater *)self _updateBeneficiaryPropertiesForAccount:v10 withServerResponse:v12];
  [(AKServerResponseAccountUpdater *)self _updateTokensForAccount:v10 withServerResponse:v12 context:v11];
  [(AKServerResponseAccountUpdater *)self _updateTelemetryDeviceSessionIDForAccount:v10 withContext:v11];
  [(AKServerResponseAccountUpdater *)self _updateAccountInUseForAccount:v10 withContext:v11];

  [(AKServerResponseAccountUpdater *)self _updateRemainingPropertiesForAccount:v10 withServerResponse:v12];
  [v10 setAuthenticated:1];
  BOOL v14 = [(AKServerResponseAccountUpdater *)self _saveAccount:v10 userInfoDictionary:v13 error:a6];
  if (v14 && [v13 count])
  {
    v15 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v10];
    [v13 setObject:v15 forKeyedSubscript:AKUserInfoChangedAltDSIDKey];

    [(AKServerResponseAccountUpdater *)self _postUserInfoChangedNotificationWithPayload:v13];
  }

  return v14;
}

- (void)_updateAccountInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 altDSID];

  if (v10)
  {
    accountManager = self->_accountManager;
    id v12 = [v8 altDSID];
    [(AKAccountManager *)accountManager setAltDSID:v12 forAccount:v24];
  }
  v13 = [v8 dsid];

  if (v13)
  {
    BOOL v14 = self->_accountManager;
    v15 = [v8 dsid];
    [(AKAccountManager *)v14 setDSID:v15 forAccount:v24];
  }
  id v16 = [(AKAccountManager *)self->_accountManager authenticationModeForAccount:v24];
  id v17 = [v8 authMode];
  if (v17)
  {
    id v18 = v17;
    [(AKAccountManager *)self->_accountManager setAuthenticationMode:v17 forAccount:v24];
    if (v16)
    {
      if (v18 != v16)
      {
        v19 = +[NSNumber numberWithUnsignedInteger:v18];
        [v9 setObject:v19 forKeyedSubscript:AKUserInfoChangedAuthModeKey];
      }
    }
  }
  if ([v8 phoneAsAppleID]) {
    -[AKAccountManager setPhoneAsAppleID:forAccount:](self->_accountManager, "setPhoneAsAppleID:forAccount:", [v8 phoneAsAppleID], v24);
  }
  unsigned int v20 = [(AKAccountManager *)self->_accountManager demoAccountForAccount:v24];
  if (v20 != [v8 isDemoAccount]) {
    -[AKAccountManager setDemoAccount:forAccount:](self->_accountManager, "setDemoAccount:forAccount:", [v8 isDemoAccount], v24);
  }
  v21 = [v8 additionalInfo];

  if (v21)
  {
    v22 = self->_accountManager;
    v23 = [v8 additionalInfo];
    [(AKAccountManager *)v22 setAdditionalInfo:v23 forAccount:v24];
  }
}

- (void)_updateUserInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 firstName];

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = [v6 firstName];
    [(AKAccountManager *)accountManager setGivenName:v9 forAccount:v31];
  }
  id v10 = [v6 lastName];

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = [v6 lastName];
    [(AKAccountManager *)v11 setFamilyName:v12 forAccount:v31];
  }
  v13 = [v6 primaryEmail];

  if (v13)
  {
    BOOL v14 = self->_accountManager;
    v15 = [v6 primaryEmail];
    [(AKAccountManager *)v14 setPrimaryEmailAddress:v15 forAccount:v31];
  }
  -[AKAccountManager setVerifiedPrimaryEmail:forAccount:](self->_accountManager, "setVerifiedPrimaryEmail:forAccount:", [v6 primaryEmailVetted], v31);
  id v16 = [v6 aliases];

  if (v16)
  {
    id v17 = self->_accountManager;
    id v18 = [v6 aliases];
    [(AKAccountManager *)v17 setAliases:v18 forAccount:v31];
  }
  v19 = [v6 appleIDCountryCode];

  if (v19)
  {
    unsigned int v20 = self->_accountManager;
    v21 = [v6 appleIDCountryCode];
    [(AKAccountManager *)v20 setAppleIDCountryCode:v21 forAccount:v31];
  }
  v22 = [v6 birthYear];

  if (v22)
  {
    v23 = self->_accountManager;
    id v24 = [v6 birthYear];
    [(AKAccountManager *)v23 setBirthYear:v24 forAccount:v31];
  }
  v25 = [v6 ageOfMajority];

  if (v25)
  {
    v26 = self->_accountManager;
    v27 = [v6 ageOfMajority];
    [(AKAccountManager *)v26 setAgeOfMajority:v27 forAccount:v31];
  }
  v28 = [v6 canAttestAge];

  if (v28)
  {
    v29 = self->_accountManager;
    v30 = [v6 canAttestAge];
    [(AKAccountManager *)v29 setCanAttestAge:v30 forAccount:v31];
  }
  -[AKAccountManager setUserUnderage:forAccount:](self->_accountManager, "setUserUnderage:forAccount:", [v6 isUnderAgeOfMajority], v31);
  if ([v6 isUnderAgeOfMajority]) {
    -[AKAccountManager setIsSiwaEnabled:forChildAccount:](self->_accountManager, "setIsSiwaEnabled:forChildAccount:", [v6 isSiwaForChildEnabled], v31);
  }
  -[AKAccountManager setUserIsSenior:forAccount:](self->_accountManager, "setUserIsSenior:forAccount:", [v6 isSenior], v31);
}

- (void)_updateSecurityLevelForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  accountManager = self->_accountManager;
  id v10 = a4;
  id v11 = [(AKAccountManager *)accountManager securityLevelForAccount:v14];
  id v12 = [v10 appleIDSecurityLevel];

  if (v12)
  {
    [(AKAccountManager *)self->_accountManager setSecurityLevel:v12 forAccount:v14];
    if (v11)
    {
      if (v12 != v11)
      {
        v13 = +[NSNumber numberWithUnsignedInteger:v12];
        [v8 setObject:v13 forKeyedSubscript:AKUserInfoChangedSecurityLevelKey];
      }
    }
  }
}

- (void)_updateMaidPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 hasMDM];

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = [v6 hasMDM];
    -[AKAccountManager setHasMDM:forAccount:](accountManager, "setHasMDM:forAccount:", [v9 BOOLValue], v17);
  }
  id v10 = [v6 managedOrganizationType];
  if (v10) {
    [(AKAccountManager *)self->_accountManager setManagedOrganizationType:v10 forAccount:v17];
  }
  id v11 = [v6 managedOrganizationName];

  if (v11)
  {
    id v12 = self->_accountManager;
    v13 = [v6 managedOrganizationName];
    [(AKAccountManager *)v12 setManagedOrganizationName:v13 forAccount:v17];
  }
  unsigned int v14 = +[AKFeatureManager isEnforceMDMPolicyEnabled];
  if (v17 && v14 && [v6 isMdmInfoRequired]) {
    [(AKAccountManager *)self->_accountManager setMarkedForSignOut:0 forAccount:v17];
  }
  unsigned int v15 = -[AKAccountManager mdmInformationRequiredForAccount:](self->_accountManager, "mdmInformationRequiredForAccount:");
  id v16 = [v6 isMdmInfoRequired];
  if (v15 != v16) {
    [(AKAccountManager *)self->_accountManager setMDMInformationRequired:v16 forAccount:v17];
  }
}

- (void)_updateAppleAccountSecurityPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 adpCohort];

  if (v10)
  {
    accountManager = self->_accountManager;
    id v12 = [v8 adpCohort];
    [(AKAccountManager *)accountManager setADPCohort:v12 forAccount:v29];
  }
  v13 = [v8 webAccessEnabled];

  if (v13)
  {
    unsigned int v14 = self->_accountManager;
    unsigned int v15 = [v8 webAccessEnabled];
    -[AKAccountManager setWebAccessEnabled:forAccount:](v14, "setWebAccessEnabled:forAccount:", [v15 BOOLValue], v29);
  }
  if ([v8 isFidoAuthRequired]) {
    -[AKAccountManager setFido:forAccount:](self->_accountManager, "setFido:forAccount:", [v8 isFidoAuthRequired], v29);
  }
  id v16 = [v8 hasModernRecoveryKey];

  if (v16)
  {
    id v17 = self->_accountManager;
    id v18 = [v8 hasModernRecoveryKey];
    -[AKAccountManager setHasModernRecoveryKey:forAccount:](v17, "setHasModernRecoveryKey:forAccount:", [v18 BOOLValue], v29);
  }
  v19 = [v8 configurationInfo];

  id v20 = v29;
  if (v19)
  {
    v21 = +[AKUserConfigController sharedController];
    v22 = [v8 configurationInfo];
    [v21 updateUserConfigForAccount:v29 configurationInfo:v22];

    id v20 = v29;
  }
  v23 = [(AKAccountManager *)self->_accountManager configDataVersionForAccount:v20];
  id v24 = [v8 configDataVersion];
  v25 = v24;
  if (v24 && (!v23 || ([v24 isEqual:v23] & 1) == 0))
  {
    v26 = self->_accountManager;
    v27 = [v8 configDataVersion];
    [(AKAccountManager *)v26 setConfigDataVersion:v27 forAccount:v29];

    v28 = [v8 configDataVersion];
    [v9 setObject:v28 forKeyedSubscript:AKConfigDataVersion];
  }
}

- (void)_updateCustodianPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 canBeCustodian];

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = [v6 canBeCustodian];
    -[AKAccountManager setCanBeCustodian:forAccount:](accountManager, "setCanBeCustodian:forAccount:", [v9 BOOLValue], v26);
  }
  id v10 = [v6 canHaveCustodian];

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = [v6 canHaveCustodian];
    -[AKAccountManager setCanHaveCustodian:forAccount:](v11, "setCanHaveCustodian:forAccount:", [v12 BOOLValue], v26);
  }
  v13 = [v6 custodianEnabled];

  if (v13)
  {
    unsigned int v14 = self->_accountManager;
    unsigned int v15 = [v6 custodianEnabled];
    -[AKAccountManager setCustodianEnabled:forAccount:](v14, "setCustodianEnabled:forAccount:", [v15 BOOLValue], v26);
  }
  id v16 = [v6 custodianLastModified];

  id v17 = v26;
  if (v16)
  {
    id v18 = self->_accountManager;
    v19 = [v6 custodianLastModified];
    [(AKAccountManager *)v18 setCustodianLastModified:v19 forAccount:v26];

    id v17 = v26;
  }
  id v20 = [(AKAccountManager *)self->_accountManager custodianInfosForAccount:v17];
  v21 = +[NSSet setWithArray:v20];

  v22 = [v6 custodianInfos];
  v23 = +[NSSet setWithArray:v22];

  if (v23 && ([v23 isEqualToSet:v21] & 1) == 0)
  {
    id v24 = self->_accountManager;
    v25 = [v6 custodianInfos];
    [(AKAccountManager *)v24 setCustodianInfos:v25 forAccount:v26];
  }
}

- (void)_updateBeneficiaryPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 beneficiaryIdentifier];

  if (v7) {
    [(AKAccountManager *)self->_accountManager setBeneficiary:1 forAccount:v28];
  }
  id v8 = [v6 canBeBeneficiary];

  if (v8)
  {
    accountManager = self->_accountManager;
    id v10 = [v6 canBeBeneficiary];
    -[AKAccountManager setCanBeBeneficiary:forAccount:](accountManager, "setCanBeBeneficiary:forAccount:", [v10 BOOLValue], v28);
  }
  id v11 = [v6 canHaveBeneficiary];

  if (v11)
  {
    id v12 = self->_accountManager;
    v13 = [v6 canHaveBeneficiary];
    -[AKAccountManager setCanHaveBeneficiary:forAccount:](v12, "setCanHaveBeneficiary:forAccount:", [v13 BOOLValue], v28);
  }
  unsigned int v14 = [v6 beneficiaryLastModified];

  if (v14)
  {
    unsigned int v15 = self->_accountManager;
    id v16 = [v6 beneficiaryLastModified];
    [(AKAccountManager *)v15 setBeneficiaryLastModified:v16 forAccount:v28];
  }
  uint64_t v17 = [v6 beneficiaryInfo];
  if (v17)
  {
    id v18 = (void *)v17;
    v19 = [v6 beneficiaryInfo];
    id v20 = [v19 count];

    if (v20)
    {
      v21 = [(AKAccountManager *)self->_accountManager beneficiaryInfoForAccount:v28];
      v22 = +[AKBeneficiaryUpdater removeWrappedKeyFrom:v21];
      v23 = +[NSSet setWithArray:v22];

      id v24 = [v6 beneficiaryInfo];
      v25 = +[NSSet setWithArray:v24];

      if (v25 && ([v25 isEqualToSet:v23] & 1) == 0)
      {
        id v26 = [v6 beneficiaryInfo];
        v27 = +[AKBeneficiaryUpdater saveWrappedKeyInKeychain:v26];

        [(AKAccountManager *)self->_accountManager setBeneficiaryInfo:v27 forAccount:v28];
      }
    }
  }
}

- (void)_updatePasskeyPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 passkeyEligible];

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = [v6 passkeyEligible];
    -[AKAccountManager setPasskeyEligible:forAccount:](accountManager, "setPasskeyEligible:forAccount:", [v9 BOOLValue], v13);
  }
  id v10 = [v6 passkeyPresent];

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = [v6 passkeyPresent];
    -[AKAccountManager setPasskeyPresent:forAccount:](v11, "setPasskeyPresent:forAccount:", [v12 BOOLValue], v13);
  }
}

- (void)_updateChildPasscodePropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 passcodeAuthEnabled];

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = [v6 passcodeAuthEnabled];
    -[AKAccountManager setPasscodeAuthEnabled:forAccount:](accountManager, "setPasscodeAuthEnabled:forAccount:", [v9 BOOLValue], v16);
  }
  id v10 = [v6 passcodeAuth];

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = [v6 passcodeAuth];
    -[AKAccountManager setPasscodeAuth:forAccount:](v11, "setPasscodeAuth:forAccount:", [v12 BOOLValue], v16);
  }
  id v13 = [v6 askToBuy];

  if (v13)
  {
    unsigned int v14 = self->_accountManager;
    unsigned int v15 = [v6 askToBuy];
    -[AKAccountManager setAskToBuy:forAccount:](v14, "setAskToBuy:forAccount:", [v15 BOOLValue], v16);
  }
}

- (void)_updateTokensForAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v59 = 0;
  id v10 = [v7 credentialWithError:&v59];
  id v11 = v59;
  if (!v10)
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100192D8C(v12);
    }

    id v10 = objc_alloc_init((Class)ACAccountCredential);
  }
  id v13 = [v8 masterToken];
  uint64_t v14 = [v13 externalizedVersionString];

  if (v14)
  {
    unsigned int v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Server auth response contained a master token, saving to the credential for account (%@)", buf, 0xCu);
    }

    [v10 setToken:v14];
  }
  id v16 = [v8 heartbeatToken];
  uint64_t v17 = [v16 stringValue];

  v56 = (void *)v17;
  v57 = (void *)v14;
  if (v17)
  {
    id v18 = +[AKFeatureManager sharedManager];
    unsigned int v19 = [v18 isTokenCacheEnabled];

    id v20 = _AKLogSystem();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Server auth response contained a HB token, saving via AKTokenManager for account (%@)", buf, 0xCu);
      }

      tokenManager = self->_tokenManager;
      v23 = [v8 heartbeatToken];
      uint64_t v24 = ACHeartbeatTokenKey;
      v25 = [v8 altDSID];
      [(AKTokenManager *)tokenManager updateToken:v23 identifier:v24 altDSID:v25 account:v7 credential:v10 error:0];
    }
    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Server auth response contained a HB token, saving to the credential for account (%@)", buf, 0xCu);
      }

      accountManager = self->_accountManager;
      v23 = [v8 heartbeatToken];
      [(AKAccountManager *)accountManager setToken:v23 tokenID:ACHeartbeatTokenKey account:v7 credential:v10];
    }
  }
  else
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100192D48(v23);
    }
  }

  v27 = [v8 continuationToken];
  id v28 = [v27 stringValue];

  if (v28)
  {
    [(AKAccountManager *)self->_accountManager clearDeviceRemovalReasonFromAccount:v7];
    id v29 = +[AKFeatureManager sharedManager];
    unsigned int v30 = [v29 isTokenCacheEnabled];

    id v31 = _AKLogSystem();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      id v33 = v11;
      id v34 = v9;
      if (v32)
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v7;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Server auth response contained a CK token, saving via AKTokenManager for account (%@)", buf, 0xCu);
      }

      v35 = self->_tokenManager;
      v36 = [v8 continuationToken];
      uint64_t v37 = ACContinuationTokenKey;
      v38 = [v8 altDSID];
      [(AKTokenManager *)v35 updateToken:v36 identifier:v37 altDSID:v38 account:v7 credential:v10 error:0];

      id v9 = v34;
      id v11 = v33;
    }
    else
    {
      if (v32)
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v7;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Server auth response contained a CK token, saving to the credential for account (%@)", buf, 0xCu);
      }

      v39 = self->_accountManager;
      v36 = [v8 continuationToken];
      [(AKAccountManager *)v39 setToken:v36 tokenID:ACContinuationTokenKey account:v7 credential:v10];
    }
  }
  else
  {
    v36 = _AKLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Server auth response did not contain CK token.", buf, 2u);
    }
  }

  v40 = [v8 passwordResetToken];
  v41 = [v40 stringValue];

  if (!v41)
  {
    v42 = _AKLogSystem();
    v43 = v57;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Server auth response did not contain PRK token.", buf, 2u);
    }
    goto LABEL_35;
  }
  if ([v9 _localUserHasEmptyPassword])
  {
    v42 = _AKLogSystem();
    v43 = v57;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_100192D04(v42);
    }
LABEL_35:

    goto LABEL_36;
  }
  v55 = v9;
  v45 = +[AKFeatureManager sharedManager];
  unsigned int v46 = [v45 isTokenCacheEnabled];

  v47 = _AKLogSystem();
  BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
  if (v46)
  {
    if (v48)
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v7;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Server auth response contained a PRK token, saving via AKTokenMAnager for account (%@)", buf, 0xCu);
    }

    v49 = self->_tokenManager;
    v50 = [v8 passwordResetToken];
    uint64_t v51 = ACPasswordResetTokenKey;
    v52 = [v8 altDSID];
    [(AKTokenManager *)v49 updateToken:v50 identifier:v51 altDSID:v52 account:v7 credential:v10 error:0];
  }
  else
  {
    if (v48)
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v7;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Server auth response contained a PRK token, saving to the credential for account (%@)", buf, 0xCu);
    }

    v53 = self->_accountManager;
    v50 = [v8 passwordResetToken];
    [(AKAccountManager *)v53 setToken:v50 tokenID:ACPasswordResetTokenKey account:v7 credential:v10];
  }
  id v9 = v55;

  v43 = v57;
  if ([v55 anticipateEscrowAttempt])
  {
    v54 = _AKLogSystem();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v7;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Stashing the PRK token away for escrowing for account: %@", buf, 0xCu);
    }

    [v10 setCredentialItem:v41 forKey:ACPasswordResetTokenBackupKey];
  }
LABEL_36:
  v44 = _AKLogSystem();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    sub_100192C7C((uint64_t)v10, (uint64_t)v7, v44);
  }

  [v7 setCredential:v10];
}

- (void)_updateTelemetryDeviceSessionIDForAccount:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKAccountManager *)self->_accountManager accountAccessTelemetryOptInForAccount:v6])
  {
    id v8 = [(AKAccountManager *)self->_accountManager telemetryDeviceSessionIDForAccount:v6];
    id v9 = v8;
    if (v8 && ([v8 isEqualToString:AKTelemetryMissingDeviceSessionID] & 1) == 0)
    {
      id v11 = _AKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100192DD0((uint64_t)v9, v11);
      }
    }
    else
    {
      id v10 = +[NSUUID UUID];
      id v11 = [v10 UUIDString];

      id v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AuthKit account exists and is consented to telemetry collection, but is missing a deviceSessionID, creating a new one... %@", (uint8_t *)&v13, 0xCu);
      }

      [(AKAccountManager *)self->_accountManager setTelemetryDeviceSessionID:v11 forAccount:v6];
      [v7 setTelemetryDeviceSessionID:v11];
    }
  }
}

- (void)_updateAccountInUseForAccount:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 serviceType] == (id)7)
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Detected a piggy service type, alias for iCloud", (uint8_t *)&v12, 2u);
    }

    [v7 setServiceType:1];
  }
  if ([v7 serviceType])
  {
    id v9 = [v6 identifier];
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 serviceType]);
      int v12 = 138412546;
      int v13 = v11;
      __int16 v14 = 2112;
      unsigned int v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting serviceType %@ inUse for account %@", (uint8_t *)&v12, 0x16u);
    }
    -[AKAccountManager setAccount:inUse:byService:](self->_accountManager, "setAccount:inUse:byService:", v6, 1, [v7 serviceType]);
  }
}

- (void)_updateRemainingPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  id v7 = [v6 hasSOSActiveDevice];

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = [v6 hasSOSActiveDevice];
    -[AKAccountManager setHasSOSActiveDevice:forAccount:](accountManager, "setHasSOSActiveDevice:forAccount:", [v9 BOOLValue], v28);
  }
  id v10 = [v6 SOSNeeded];

  if (v10)
  {
    id v11 = self->_accountManager;
    int v12 = [v6 SOSNeeded];
    -[AKAccountManager setSOSNeeded:forAccount:](v11, "setSOSNeeded:forAccount:", [v12 BOOLValue], v28);
  }
  if ([v6 authorizationUsed]) {
    -[AKAccountManager setAuthorizationUsed:forAccount:](self->_accountManager, "setAuthorizationUsed:forAccount:", [v6 authorizationUsed], v28);
  }
  int v13 = [v6 privateAttestationEnabled];

  if (v13)
  {
    __int16 v14 = self->_accountManager;
    unsigned int v15 = [v6 privateAttestationEnabled];
    -[AKAccountManager setPrivateAttestationEnabled:forAccount:](v14, "setPrivateAttestationEnabled:forAccount:", [v15 BOOLValue], v28);
  }
  id v16 = [v6 serverExperimentalFeatures];

  if (v16)
  {
    uint64_t v17 = self->_accountManager;
    id v18 = [v6 serverExperimentalFeatures];
    [(AKAccountManager *)v17 setServerExperimentalFeatures:v18 forAccount:v28];
  }
  if ([v6 isProximityEligible]) {
    -[AKAccountManager setIsProximityAuthEligible:forAccount:](self->_accountManager, "setIsProximityAuthEligible:forAccount:", [v6 isProximityEligible], v28);
  }
  unsigned int v19 = [v6 isNotificationEmailAvailable];

  if (v19)
  {
    id v20 = self->_accountManager;
    BOOL v21 = [v6 isNotificationEmailAvailable];
    -[AKAccountManager setIsNotificationEmailAvailable:forAccount:](v20, "setIsNotificationEmailAvailable:forAccount:", [v21 BOOLValue], v28);
  }
  v22 = [v6 notificationEmail];

  if (v22)
  {
    v23 = self->_accountManager;
    uint64_t v24 = [v6 notificationEmail];
    [(AKAccountManager *)v23 setNotificationEmail:v24 forAccount:v28];
  }
  v25 = [v6 thirdPartyRegulatoryOverride];

  if (v25)
  {
    id v26 = self->_accountManager;
    v27 = [v6 thirdPartyRegulatoryOverride];
    [(AKAccountManager *)v26 set3PRegulatoryOverride:v27 forAccount:v28];
  }
}

- (BOOL)_saveAccount:(id)a3 userInfoDictionary:(id)a4 error:(id *)a5
{
  accountManager = self->_accountManager;
  id v11 = 0;
  unsigned __int8 v7 = [(AKAccountManager *)accountManager saveAccount:a3 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100192E48((uint64_t)v8, v9);
    }

    if (a5) {
      *a5 = v8;
    }
  }

  return v7;
}

- (void)_postUserInfoChangedNotificationWithPayload:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    [(AKUserInfoController *)self->_userInfoController sendUserInfoChangeNotificationWithPayload:v4];
  }
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AKTokenManager)tokenManager
{
  return self->_tokenManager;
}

- (void)setTokenManager:(id)a3
{
}

- (AKUserInfoController)userInfoController
{
  return self->_userInfoController;
}

- (void)setUserInfoController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoController, 0);
  objc_storeStrong((id *)&self->_tokenManager, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end