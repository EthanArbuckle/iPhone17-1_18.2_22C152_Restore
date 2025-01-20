@interface CDPContext
+ (BOOL)_isKeychainSyncAllowedByMDM;
+ (BOOL)isSubsetOfContextTypeRepair:(int64_t)a3;
+ (BOOL)isSubsetOfContextTypeSignIn:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (CDPContext)contextWithAuthenticationResults:(id)a3;
+ (id)contextForAccountWithAltDSID:(id)a3;
+ (id)contextForAccountWithAppleID:(id)a3;
+ (id)contextForAccountWithDSID:(id)a3;
+ (id)contextForPrimaryAccount;
+ (id)preflightContext:(id)a3;
+ (void)contextForPrimaryAccount;
- (AKCircleRequestContext)resumeContext;
- (BOOL)_alwaysCreateEscrowRecord;
- (BOOL)_alwaysPromptForEDPRecoveryToken;
- (BOOL)_disableAsyncSecureBackupEnrollment;
- (BOOL)_forceEDPReset;
- (BOOL)_forceManateeReset;
- (BOOL)_forceReset;
- (BOOL)_ignoreLockAssertErrors;
- (BOOL)_isLocalSecretCachedAcknowledgingInMemoryValue;
- (BOOL)_recoveryMethodAvailable;
- (BOOL)_skipEscrowFetches;
- (BOOL)_supportsCustodianRecovery;
- (BOOL)_useSecureBackupCachedPassphrase;
- (BOOL)cachedPassphraseMissing;
- (BOOL)desiresAllRecords;
- (BOOL)didAttemptSecureBackupEnablement;
- (BOOL)didUseSMSVerification;
- (BOOL)failSignInOnError;
- (BOOL)forceInteractiveCDPEDPRepair;
- (BOOL)guestMode;
- (BOOL)idmsMasterKeyRecovery;
- (BOOL)idmsRecovery;
- (BOOL)ignorePasswordCache;
- (BOOL)is2FAFAUserFromNetwork;
- (BOOL)isAttemptingBackupRestore;
- (BOOL)isBeneficiaryAccount;
- (BOOL)isBeneficiaryFlow;
- (BOOL)isFederatedAccount;
- (BOOL)isHSA2Account;
- (BOOL)isICDPEnabledFromNetwork;
- (BOOL)isLocalSecretCached;
- (BOOL)isManagedAccount;
- (BOOL)isPiggybackingRecovery;
- (BOOL)isPrimaryAccount;
- (BOOL)isProxSignIn;
- (BOOL)isSOSCFUFlow;
- (BOOL)isSOSCompatibilityOptInNeeded;
- (BOOL)isSOSNeeded;
- (BOOL)isSharediPad;
- (BOOL)isTTSURecovery;
- (BOOL)isiCDPEligible;
- (BOOL)isiCDPEligibleWithError:(id *)a3;
- (BOOL)keychainSyncAllowedByMDM;
- (BOOL)keychainSyncAllowedByServer;
- (BOOL)managedAccountsAllowedInCDP;
- (BOOL)mandatesRecoveryKey;
- (BOOL)multiUserManateeAllowed;
- (BOOL)needsPreflight;
- (BOOL)newAccountCreated;
- (BOOL)secureBackupEnablementNotRequired;
- (BOOL)willAttemptAsyncSecureBackupEnablement;
- (CDPAuthProviderInternal)_authProvider;
- (CDPContext)init;
- (CDPContext)initWithAccount:(id)a3;
- (CDPContext)initWithAuthenticationResults:(id)a3;
- (CDPContext)initWithCoder:(id)a3;
- (CDPCustodianRecoveryInfo)custodianRecoveryInfo;
- (CUMessageSession)sharingChannel;
- (KCAESGCMDuplexSession)duplexSession;
- (NSData)beneficiaryWrappedKeyData;
- (NSData)srpSalt;
- (NSNumber)adpCohort;
- (NSNumber)dsid;
- (NSNumber)passwordVersion;
- (NSNumber)srpIteration;
- (NSString)accountType;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)bundleID;
- (NSString)cachedLocalSecret;
- (NSString)edpRecoveryToken;
- (NSString)findMyiPhoneUUID;
- (NSString)followUpType;
- (NSString)interactiveAuthDefaultButtonString;
- (NSString)oldPassword;
- (NSString)password;
- (NSString)passwordEquivToken;
- (NSString)srpProtocol;
- (NSString)telemetryDeviceSessionID;
- (NSString)telemetryFlowID;
- (NSUUID)beneficiaryIdentifier;
- (double)newestEscrowRecordAge;
- (id)_rawEDPHealthForAccount:(id)a3;
- (id)cliqueConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initNeedingPreflight:(BOOL)a3;
- (int64_t)getNumberOfTrustedDevices;
- (int64_t)keychainSyncSystem;
- (int64_t)maxDeviceRecoveryAttempts;
- (int64_t)numberOfTrustedDevices;
- (int64_t)totalEscrowDeviceCount;
- (int64_t)totalRecoveryAttempts;
- (int64_t)type;
- (int64_t)validEscrowDeviceCount;
- (unint64_t)_parseEDPStateFromRawState:(id)a3;
- (unint64_t)cachedLocalSecretType;
- (unint64_t)edpHealth;
- (unint64_t)edpState;
- (unint64_t)securityLevel;
- (unint64_t)sosCompatibilityType;
- (unint64_t)walrusStatus;
- (unsigned)backupActivity;
- (unsigned)endpoint;
- (void)_fakeSOSFlagsWithUserDefaults;
- (void)_isLocalSecretCachedAcknowledgingInMemoryValue;
- (void)_updateEDPAttributesFromAccountCache;
- (void)_updateEDPAttributesFromAccountCacheWithAccount:(id)a3;
- (void)_updateEDPWithAuthenticationResults:(id)a3;
- (void)adpCohort;
- (void)akTrustedDeviceListChanged:(id)a3;
- (void)augmentWithCredentialsFromContext:(id)a3;
- (void)clearNewPassword;
- (void)clearOldPassword;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)init;
- (void)isPrimaryAccount;
- (void)keychainSyncAllowedByServer;
- (void)numberOfTrustedDevices;
- (void)purgeResumeData;
- (void)setAccountType:(id)a3;
- (void)setAdpCohort:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setBackupActivity:(unsigned int)a3;
- (void)setBeneficiaryIdentifier:(id)a3;
- (void)setBeneficiaryWrappedKeyData:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCachedLocalSecret:(id)a3;
- (void)setCachedLocalSecretType:(unint64_t)a3;
- (void)setCachedPassphraseMissing:(BOOL)a3;
- (void)setCustodianRecoveryInfo:(id)a3;
- (void)setDidAttemptSecureBackupEnablement:(BOOL)a3;
- (void)setDidUseSMSVerification:(BOOL)a3;
- (void)setDsid:(id)a3;
- (void)setDuplexSession:(id)a3;
- (void)setEdpHealth:(unint64_t)a3;
- (void)setEdpRecoveryToken:(id)a3;
- (void)setEdpState:(unint64_t)a3;
- (void)setEndpoint:(unsigned int)a3;
- (void)setFailSignInOnError:(BOOL)a3;
- (void)setFindMyiPhoneUUID:(id)a3;
- (void)setFollowUpType:(id)a3;
- (void)setForceInteractiveCDPEDPRepair:(BOOL)a3;
- (void)setGuestMode:(BOOL)a3;
- (void)setIdmsMasterKeyRecovery:(BOOL)a3;
- (void)setIdmsRecovery:(BOOL)a3;
- (void)setIgnorePasswordCache:(BOOL)a3;
- (void)setInteractiveAuthDefaultButtonString:(id)a3;
- (void)setIsAttemptingBackupRestore:(BOOL)a3;
- (void)setIsBeneficiaryAccount:(BOOL)a3;
- (void)setIsFederatedAccount:(BOOL)a3;
- (void)setIsHSA2Account:(BOOL)a3;
- (void)setIsManagedAccount:(BOOL)a3;
- (void)setIsPrimaryAccount:(BOOL)a3;
- (void)setIsSOSCFUFlow:(BOOL)a3;
- (void)setIsSharediPad:(BOOL)a3;
- (void)setKeychainSyncAllowedByMDM:(BOOL)a3;
- (void)setKeychainSyncAllowedByServer:(BOOL)a3;
- (void)setKeychainSyncSystem:(int64_t)a3;
- (void)setManagedAccountsAllowedInCDP:(BOOL)a3;
- (void)setMandatesRecoveryKey:(BOOL)a3;
- (void)setMaxDeviceRecoveryAttempts:(int64_t)a3;
- (void)setMultiUserManateeAllowed:(BOOL)a3;
- (void)setNewPassword:(id)a3 oldPassword:(id)a4;
- (void)setNewestEscrowRecordAge:(double)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordEquivToken:(id)a3;
- (void)setPasswordVersion:(id)a3;
- (void)setResumeContext:(id)a3;
- (void)setSecureBackupEnablementNotRequired:(BOOL)a3;
- (void)setSecurityLevel:(unint64_t)a3;
- (void)setSharingChannel:(id)a3;
- (void)setSosCompatibilityType:(unint64_t)a3;
- (void)setSrpIteration:(id)a3;
- (void)setSrpProtocol:(id)a3;
- (void)setSrpSalt:(id)a3;
- (void)setTelemetryDeviceSessionID:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)setTotalEscrowDeviceCount:(int64_t)a3;
- (void)setTotalRecoveryAttempts:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setValidEscrowDeviceCount:(int64_t)a3;
- (void)setWalrusStatus:(unint64_t)a3;
- (void)setWillAttemptAsyncSecureBackupEnablement:(BOOL)a3;
- (void)set_alwaysCreateEscrowRecord:(BOOL)a3;
- (void)set_alwaysPromptForEDPRecoveryToken:(BOOL)a3;
- (void)set_authProvider:(id)a3;
- (void)set_disableAsyncSecureBackupEnrollment:(BOOL)a3;
- (void)set_forceEDPReset:(BOOL)a3;
- (void)set_forceManateeReset:(BOOL)a3;
- (void)set_forceReset:(BOOL)a3;
- (void)set_ignoreLockAssertErrors:(BOOL)a3;
- (void)set_recoveryMethodAvailable:(BOOL)a3;
- (void)set_skipEscrowFetches:(BOOL)a3;
- (void)set_supportsCustodianRecovery:(BOOL)a3;
- (void)set_useSecureBackupCachedPassphrase:(BOOL)a3;
- (void)startObservingTrustedDeviceList;
- (void)stoptObservingTrustedDeviceList;
- (void)updateDemoAttributesWithAccount:(id)a3;
- (void)updateWithAuthenticationResults:(id)a3;
@end

@implementation CDPContext

- (void)setAppleID:(id)a3
{
}

- (void)setDsid:(id)a3
{
}

- (void)setAltDSID:(id)a3
{
}

- (void)setPassword:(id)a3
{
  v4 = (NSString *)a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CDPContext setPassword:]();
  }

  password = self->_password;
  self->_password = v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setNewPassword:(id)a3 oldPassword:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (v8 && [v8 length]) {
    objc_storeStrong((id *)&self->_password, a3);
  }
  if (v7 && [v7 length]) {
    objc_storeStrong((id *)&self->_oldPassword, a4);
  }
}

- (void)clearNewPassword
{
  self->_password = 0;
  MEMORY[0x270F9A758]();
}

- (void)clearOldPassword
{
  self->_oldPassword = 0;
  MEMORY[0x270F9A758]();
}

+ (BOOL)_isKeychainSyncAllowedByMDM
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53868]] ^ 1;

  return v3;
}

+ (id)contextForPrimaryAccount
{
  v2 = [MEMORY[0x263F290F0] sharedInstance];
  char v3 = [v2 primaryAuthKitAccount];

  if (v3)
  {
    v4 = [[CDPContext alloc] initWithAccount:v3];
  }
  else
  {
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CDPContext contextForPrimaryAccount]();
    }

    v4 = 0;
  }

  return v4;
}

+ (id)contextForAccountWithAppleID:(id)a3
{
  id v3 = a3;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CDPContext contextForAccountWithAppleID:]();
  }

  v5 = [MEMORY[0x263F290F0] sharedInstance];
  v6 = [v5 authKitAccountWithAppleID:v3];

  if (v6)
  {
    id v7 = [[CDPContext alloc] initWithAccount:v6];
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CDPContext contextForAccountWithAppleID:]();
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)contextForAccountWithAltDSID:(id)a3
{
  id v3 = a3;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CDPContext contextForAccountWithAltDSID:]();
  }

  v5 = [MEMORY[0x263F290F0] sharedInstance];
  v6 = [v5 authKitAccountWithAltDSID:v3];

  if (v6)
  {
    id v7 = [[CDPContext alloc] initWithAccount:v6];
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CDPContext contextForAccountWithAltDSID:]();
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)contextForAccountWithDSID:(id)a3
{
  id v3 = a3;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CDPContext contextForAccountWithDSID:]();
  }

  v5 = [MEMORY[0x263F290F0] sharedInstance];
  v6 = [v5 authKitAccountWithDSID:v3];

  if (v6)
  {
    id v7 = [[CDPContext alloc] initWithAccount:v6];
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CDPContext contextForAccountWithDSID:]();
    }

    id v7 = 0;
  }

  return v7;
}

+ (CDPContext)contextWithAuthenticationResults:(id)a3
{
  id v3 = a3;
  v4 = [[CDPContext alloc] initWithAuthenticationResults:v3];

  return v4;
}

+ (BOOL)isSubsetOfContextTypeSignIn:(int64_t)a3
{
  return ((unint64_t)a3 < 0xD) & (0x1802u >> a3);
}

+ (BOOL)isSubsetOfContextTypeRepair:(int64_t)a3
{
  return a3 == 2 || a3 == 13;
}

- (id)initNeedingPreflight:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CDPContext;
  v4 = [(CDPContext *)&v12 init];
  if (v4)
  {
    v5 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v6 = [v5 bundleIdentifier];
    bundleID = v4->_bundleID;
    v4->_bundleID = (NSString *)v6;

    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass) {
      UMUserManagerClass = getUMUserManagerClass();
    }
    v9 = [UMUserManagerClass sharedManager];
    v4->_isSharediPad = [v9 isSharedIPad];

    v4->_cachedPassphraseMissing = 0;
    v4->_needsPreflight = a3;
    v4->_managedAccountsAllowedInCDP = _os_feature_enabled_impl();
    v4->_multiUserManateeAllowed = +[CDPUtilities canEnableMultiUserManatee];
    v4->_keychainSyncSystem = 0;
    v4->_keychainSyncAllowedByMDM = [(id)objc_opt_class() _isKeychainSyncAllowedByMDM];
    v10 = v4;
  }

  return v4;
}

- (CDPContext)init
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CDPContext init]();
  }

  return (CDPContext *)[(CDPContext *)self initNeedingPreflight:1];
}

- (void)dealloc
{
  [(CDPContext *)self stoptObservingTrustedDeviceList];
  v3.receiver = self;
  v3.super_class = (Class)CDPContext;
  [(CDPContext *)&v3 dealloc];
}

- (CDPContext)initWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPContext *)self initNeedingPreflight:0];
  id v6 = v5;
  if (!v5)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPContext initWithAccount:]();
    }
    goto LABEL_28;
  }

  id v7 = [MEMORY[0x263F290F0] sharedInstance];
  id v8 = [v4 username];
  if (!v8)
  {
    v22 = _CDPLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CDPContext initWithAccount:]();
    }
    goto LABEL_27;
  }
  v9 = v8;
  objc_storeStrong((id *)v6 + 10, v8);

  v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F29068]];
  if (!v10)
  {
    v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F29060]];
    if (!v10)
    {
      v10 = [v7 DSIDForAccount:v4];
      if (!v10)
      {
        v22 = _CDPLogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[CDPContext initWithAccount:]();
        }
        goto LABEL_27;
      }
    }
  }
  objc_storeStrong((id *)v6 + 14, v10);

  v11 = [v7 altDSIDForAccount:v4];
  if (!v11)
  {
    v22 = _CDPLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CDPContext initWithAccount:].cold.4();
    }
LABEL_27:

LABEL_28:
    v21 = 0;
    goto LABEL_29;
  }
  objc_super v12 = v11;
  objc_storeStrong((id *)v6 + 15, v11);

  uint64_t v13 = [v7 securityLevelForAccount:v4];
  *((void *)v6 + 35) = v13;
  if (!v13)
  {
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CDPContext initWithAccount:].cold.7();
    }

    uint64_t v13 = *((void *)v6 + 35);
  }
  *((unsigned char *)v6 + 32) = v13 == 4;
  *((unsigned char *)v6 + 40) = v13 == 5;
  *((unsigned char *)v6 + 33) = [v7 authenticationModeForAccount:v4] == 2;
  *((unsigned char *)v6 + 34) = [v7 isBeneficiaryForAccount:v4];
  *((void *)v6 + 42) = 0;
  v15 = [v7 hasSOSActiveDeviceForAccount:v4];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[CDPContext initWithAccount:].cold.6();
    }

    *((void *)v6 + 42) |= 1uLL;
  }
  if (objc_opt_respondsToSelector())
  {
    v18 = [v7 isSOSNeededForAccount:v4];
    int v19 = [v18 BOOLValue];

    if (v19)
    {
      v20 = _CDPLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[CDPContext initWithAccount:].cold.5();
      }

      *((void *)v6 + 42) |= 2uLL;
    }
  }
  [v6 _fakeSOSFlagsWithUserDefaults];
  [v6 updateDemoAttributesWithAccount:v4];
  [v6 _updateEDPAttributesFromAccountCacheWithAccount:v4];
  v21 = (CDPContext *)v6;
LABEL_29:

  return v21;
}

- (CDPContext)initWithAuthenticationResults:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_msgSend(v5, "ak_redactedCopy");
      int v64 = 138412290;
      v65 = v7;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Starting with auth results:\n%@", (uint8_t *)&v64, 0xCu);
    }
    id v8 = [(CDPContext *)self initNeedingPreflight:0];
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = v8[35];
      *((unsigned char *)v8 + 32) = v10 == 4;
      *((unsigned char *)v8 + 40) = v10 == 5;
      uint64_t v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F29010]];
      objc_super v12 = (void *)v9[10];
      v9[10] = v11;

      uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FF8]];
      v14 = (void *)v9[11];
      v9[11] = v13;

      uint64_t v15 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
      int v16 = (void *)v9[13];
      v9[13] = v15;

      uint64_t v17 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28F80]];
      v18 = (void *)v9[14];
      v9[14] = v17;

      int v19 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28F60]];
      *((unsigned char *)v9 + 33) = [v19 unsignedIntegerValue] == 2;

      uint64_t v20 = *MEMORY[0x263F28FC0];
      v21 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FC0]];
      *((unsigned char *)v9 + 34) = v21 != 0;

      v22 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28F98]];
      *((unsigned char *)v9 + 35) = [v22 BOOLValue];

      uint64_t v23 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FA0]];
      v24 = (void *)v9[27];
      v9[27] = v23;

      uint64_t v25 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28F70]];
      v26 = (void *)v9[28];
      v9[28] = v25;

      uint64_t v27 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
      v28 = (void *)v9[15];
      v9[15] = v27;

      v29 = [v5 objectForKeyedSubscript:*MEMORY[0x263F29000]];
      v9[35] = [v29 unsignedIntegerValue];

      uint64_t v30 = v9[35];
      if (!v30)
      {
        v31 = _CDPLogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[CDPContext initWithAccount:].cold.7();
        }

        uint64_t v30 = v9[35];
      }
      *((unsigned char *)v9 + 32) = v30 == 4;
      *((unsigned char *)v9 + 40) = v30 == 5;
      objc_opt_class();
      id v32 = [v5 objectForKeyedSubscript:@"AKNewAccountCreated"];
      if (objc_opt_isKindOfClass()) {
        id v33 = v32;
      }
      else {
        id v33 = 0;
      }

      *((unsigned char *)v9 + 38) = [v33 unsignedIntegerValue] == 1;
      id v35 = objc_alloc(MEMORY[0x263F08C38]);
      v36 = [v5 objectForKeyedSubscript:v20];
      uint64_t v37 = [v35 initWithUUIDString:v36];
      v38 = (void *)v9[25];
      v9[25] = v37;

      v9[29] = -1;
      v39 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FD0]];
      v40 = (void *)[v39 copy];

      if (v40)
      {
        uint64_t v41 = objc_msgSend(v40, "aaf_toBase64DecodedData");
        v42 = (void *)v9[39];
        v9[39] = v41;
      }
      uint64_t v43 = [v5 objectForKeyedSubscript:*MEMORY[0x263F29008]];
      v44 = (void *)v9[44];
      v9[44] = v43;

      v9[42] = 0;
      v45 = [v5 objectForKeyedSubscript:@"SOSCompatibilityOptInNeeded"];
      if ([v45 BOOLValue])
      {
      }
      else
      {
        v46 = [v5 objectForKeyedSubscript:@"hasSOSActiveDevice"];
        int v47 = [v46 BOOLValue];

        if (!v47)
        {
LABEL_22:
          v48 = [v5 objectForKeyedSubscript:@"SOSNeeded"];
          int v49 = [v48 BOOLValue];

          if (v49) {
            v9[42] |= 2uLL;
          }
          [v9 _fakeSOSFlagsWithUserDefaults];
          v50 = [MEMORY[0x263F290F0] sharedInstance];
          v51 = [v50 authKitAccountWithAltDSID:v9[15]];

          [v9 updateDemoAttributesWithAccount:v51];
          uint64_t v52 = [v5 objectForKeyedSubscript:@"adpCh"];
          v53 = (void *)v9[46];
          v9[46] = v52;

          [v9 _updateEDPWithAuthenticationResults:v5];
          if (*((unsigned char *)v9 + 38))
          {
            v54 = _CDPLogSystem();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
              -[CDPContext initWithAuthenticationResults:](v54, v55, v56, v57, v58, v59, v60, v61);
            }

            v9[21] = 12;
          }

          goto LABEL_29;
        }
      }
      v9[42] |= 1uLL;
      goto LABEL_22;
    }
  }
  else
  {
    v34 = _CDPLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[CDPContext initWithAuthenticationResults:]((uint64_t)v5, v34);
    }

    v9 = [(CDPContext *)self initNeedingPreflight:1];
  }
LABEL_29:
  v62 = v9;

  return v62;
}

- (void)updateDemoAttributesWithAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x263F290F0];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  int v7 = [v6 demoAccountForAccount:v5];

  if (v7)
  {
    [(CDPContext *)self setAccountType:@"Demo"];
  }
}

- (NSString)telemetryDeviceSessionID
{
  telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
  if (!telemetryDeviceSessionID)
  {
    id v4 = [MEMORY[0x263F290F0] sharedInstance];
    id v5 = [v4 authKitAccountWithAltDSID:self->_altDSID];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v4 telemetryDeviceSessionIDForAccount:v5];
      int v7 = self->_telemetryDeviceSessionID;
      self->_telemetryDeviceSessionID = v6;
    }
    telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
  }
  return telemetryDeviceSessionID;
}

- (NSNumber)adpCohort
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  adpCohort = self->_adpCohort;
  if (adpCohort)
  {
LABEL_6:
    uint64_t v10 = adpCohort;
    goto LABEL_7;
  }
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  id v5 = [v4 authKitAccountWithAltDSID:self->_altDSID];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v4 adpCohortForAccount:v5];
    int v7 = self->_adpCohort;
    self->_adpCohort = v6;

    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_adpCohort;
      int v13 = 136315394;
      v14 = "-[CDPContext adpCohort]";
      __int16 v15 = 2112;
      int v16 = v9;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%s: ADP Cohort type is %@", (uint8_t *)&v13, 0x16u);
    }

    adpCohort = self->_adpCohort;
    goto LABEL_6;
  }
  objc_super v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[CDPContext adpCohort]();
  }

  uint64_t v10 = 0;
LABEL_7:
  return v10;
}

- (void)set_forceReset:(BOOL)a3
{
  *(_WORD *)&self->__forceManateeReset = 257;
}

- (BOOL)_forceReset
{
  return self->__forceManateeReset && self->__forceEDPReset;
}

- (void)_updateEDPAttributesFromAccountCache
{
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  objc_super v3 = [v4 authKitAccountWithAltDSID:self->_altDSID];
  [(CDPContext *)self _updateEDPAttributesFromAccountCacheWithAccount:v3];
}

- (void)_updateEDPAttributesFromAccountCacheWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F290F0] sharedInstance];
  if (objc_opt_respondsToSelector())
  {
    if (!self->_edpState)
    {
      id v6 = [v5 edpStateForAccount:v4];
      self->_edpState = [(CDPContext *)self _parseEDPStateFromRawState:v6];
    }
  }
  else
  {
    int v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CDPContext _updateEDPAttributesFromAccountCacheWithAccount:]();
    }

    self->_edpState = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    if (self->_passwordVersion) {
      goto LABEL_13;
    }
    id v8 = [v5 passwordVersionForAccount:v4];
    p_super = &self->_passwordVersion->super.super;
    self->_passwordVersion = v8;
  }
  else
  {
    p_super = _CDPLogSystem();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      -[CDPContext _updateEDPAttributesFromAccountCacheWithAccount:]();
    }
  }

LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    srpProtocol = _CDPLogSystem();
    if (os_log_type_enabled(srpProtocol, OS_LOG_TYPE_FAULT)) {
      -[CDPContext _updateEDPAttributesFromAccountCacheWithAccount:]();
    }
    goto LABEL_18;
  }
  if (!self->_srpProtocol)
  {
    uint64_t v10 = [v5 srpProtocolForAccount:v4];
    srpProtocol = self->_srpProtocol;
    self->_srpProtocol = v10;
LABEL_18:
  }
}

- (unint64_t)_parseEDPStateFromRawState:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
LABEL_10:
    unint64_t v5 = 0;
    goto LABEL_11;
  }
  if (![v3 unsignedIntegerValue])
  {
    unint64_t v5 = 1;
    goto LABEL_11;
  }
  if ([v4 unsignedIntegerValue] != 1 && objc_msgSend(v4, "unsignedIntegerValue") != 2)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CDPContext _parseEDPStateFromRawState:]();
    }

    goto LABEL_10;
  }
  unint64_t v5 = 2;
LABEL_11:

  return v5;
}

- (unint64_t)edpHealth
{
  id v3 = +[CDPAccount appleAccountForAltDSID:self->_altDSID];
  objc_opt_class();
  id v4 = [(CDPContext *)self _rawEDPHealthForAccount:v3];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  unint64_t v6 = [v5 integerValue];
  return v6;
}

- (unint64_t)edpState
{
  unint64_t result = self->_edpState;
  if (!result)
  {
    [(CDPContext *)self _updateEDPAttributesFromAccountCache];
    return self->_edpState;
  }
  return result;
}

- (BOOL)isProxSignIn
{
  if ([(CDPContext *)self type] != 1) {
    return 0;
  }
  return [(CDPContext *)self isTTSURecovery];
}

- (NSNumber)passwordVersion
{
  passwordVersion = self->_passwordVersion;
  if (!passwordVersion)
  {
    [(CDPContext *)self _updateEDPAttributesFromAccountCache];
    passwordVersion = self->_passwordVersion;
  }
  return passwordVersion;
}

- (NSString)srpProtocol
{
  srpProtocol = self->_srpProtocol;
  if (!srpProtocol)
  {
    [(CDPContext *)self _updateEDPAttributesFromAccountCache];
    srpProtocol = self->_srpProtocol;
  }
  return srpProtocol;
}

- (id)_rawEDPHealthForAccount:(id)a3
{
  return (id)[a3 accountPropertyForKey:@"edpHealth"];
}

- (void)stoptObservingTrustedDeviceList
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)startObservingTrustedDeviceList
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Started to observe new devices list", v2, v3, v4, v5, v6);
}

- (void)akTrustedDeviceListChanged:(id)a3
{
  uint64_t v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CDPContext akTrustedDeviceListChanged:]();
  }

  self->_numberOfTrustedDevices = [(CDPContext *)self getNumberOfTrustedDevices];
}

- (int64_t)getNumberOfTrustedDevices
{
  return 0;
}

- (int64_t)numberOfTrustedDevices
{
  p_numberOfTrustedDevices = &self->_numberOfTrustedDevices;
  if (!self->_numberOfTrustedDevices) {
    self->_numberOfTrustedDevices = [(CDPContext *)self getNumberOfTrustedDevices];
  }
  uint64_t v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(CDPContext *)p_numberOfTrustedDevices numberOfTrustedDevices];
  }

  return *p_numberOfTrustedDevices;
}

- (BOOL)isPrimaryAccount
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_isPrimaryAccountInternal;
  objc_sync_enter(v3);
  isPrimaryAccountInternal = self->_isPrimaryAccountInternal;
  if (!isPrimaryAccountInternal)
  {
    uint64_t v5 = [MEMORY[0x263EFB210] defaultStore];
    uint8_t v6 = [(CDPContext *)self altDSID];
    int v7 = objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v6);

    if (v7)
    {
      objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "aa_isAccountClass:", *MEMORY[0x263F25618]));
      id v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v9 = self->_isPrimaryAccountInternal;
      self->_isPrimaryAccountInternal = v8;

      p_super = _CDPLogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(CDPContext *)self altDSID];
        BOOL v12 = [(NSNumber *)self->_isPrimaryAccountInternal BOOLValue];
        int v17 = 141558530;
        uint64_t v18 = 1752392040;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        __int16 v21 = 1024;
        BOOL v22 = v12;
        _os_log_impl(&dword_2182AE000, p_super, OS_LOG_TYPE_DEFAULT, "isPrimaryAccount: Account for %{mask.hash}@ account primary: %{BOOL}d", (uint8_t *)&v17, 0x1Cu);
      }
    }
    else
    {
      int v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [(CDPContext *)self altDSID];
        [(CDPContext *)v14 isPrimaryAccount];
      }

      p_super = &self->_isPrimaryAccountInternal->super.super;
      self->_isPrimaryAccountInternal = (NSNumber *)MEMORY[0x263EFFA80];
    }

    isPrimaryAccountInternal = self->_isPrimaryAccountInternal;
  }
  BOOL v15 = [(NSNumber *)isPrimaryAccountInternal BOOLValue];
  objc_sync_exit(v3);

  return v15;
}

- (void)setIsPrimaryAccount:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_isPrimaryAccountInternal;
  objc_sync_enter(obj);
  uint64_t v5 = [NSNumber numberWithBool:v3];
  isPrimaryAccountInternal = self->_isPrimaryAccountInternal;
  self->_isPrimaryAccountInternal = v5;

  objc_sync_exit(obj);
}

- (BOOL)keychainSyncAllowedByServer
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_keychainSyncAllowedByServerInternal;
  objc_sync_enter(v3);
  keychainSyncAllowedByServerInternal = self->_keychainSyncAllowedByServerInternal;
  if (!keychainSyncAllowedByServerInternal)
  {
    uint64_t v5 = [MEMORY[0x263EFB210] defaultStore];
    uint8_t v6 = [(CDPContext *)self altDSID];
    int v7 = objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v6);

    if (v7)
    {
      uint64_t v8 = *MEMORY[0x263EFACB0];
      if (([v7 isProvisionedForDataclass:*MEMORY[0x263EFACB0]] & 1) != 0
        || ![(CDPContext *)self isManagedAccount])
      {
        uint64_t v10 = 1;
      }
      else
      {
        v9 = _CDPLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[CDPContext keychainSyncAllowedByServer]();
        }

        uint64_t v10 = 0;
      }
      if (objc_msgSend(v7, "aa_serverDisabledDataclass:", v8))
      {
        uint64_t v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CDPContext keychainSyncAllowedByServer]();
        }

        uint64_t v10 = 0;
      }
      BOOL v12 = [NSNumber numberWithBool:v10];
      int v13 = self->_keychainSyncAllowedByServerInternal;
      self->_keychainSyncAllowedByServerInternal = v12;

      p_super = _CDPLogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = [(CDPContext *)self altDSID];
        int v20 = 141558530;
        uint64_t v21 = 1752392040;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        __int16 v24 = 1024;
        int v25 = v10;
        _os_log_impl(&dword_2182AE000, p_super, OS_LOG_TYPE_DEFAULT, "keychainSyncAllowedByServer: Account for %{mask.hash}@ account primary: %{BOOL}d", (uint8_t *)&v20, 0x1Cu);
      }
    }
    else
    {
      int v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = [(CDPContext *)self altDSID];
        [(CDPContext *)v17 keychainSyncAllowedByServer];
      }

      p_super = &self->_keychainSyncAllowedByServerInternal->super.super;
      self->_keychainSyncAllowedByServerInternal = (NSNumber *)MEMORY[0x263EFFA80];
    }

    keychainSyncAllowedByServerInternal = self->_keychainSyncAllowedByServerInternal;
  }
  BOOL v18 = [(NSNumber *)keychainSyncAllowedByServerInternal BOOLValue];
  objc_sync_exit(v3);

  return v18;
}

- (void)setKeychainSyncAllowedByServer:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_keychainSyncAllowedByServerInternal;
  objc_sync_enter(obj);
  uint64_t v5 = [NSNumber numberWithBool:v3];
  keychainSyncAllowedByServerInternal = self->_keychainSyncAllowedByServerInternal;
  self->_keychainSyncAllowedByServerInternal = v5;

  objc_sync_exit(obj);
}

- (void)purgeResumeData
{
  resumeContext = self->_resumeContext;
  self->_resumeContext = 0;

  duplexSession = self->_duplexSession;
  self->_duplexSession = 0;

  sharingChannel = self->_sharingChannel;
  self->_sharingChannel = 0;
}

- (BOOL)desiresAllRecords
{
  if ([(CDPContext *)self idmsRecovery]) {
    return 1;
  }
  uint64_t v4 = [(CDPContext *)self findMyiPhoneUUID];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  appleID = self->_appleID;
  id v6 = a3;
  [v6 encodeObject:appleID forKey:@"_appleID"];
  [v6 encodeObject:self->_password forKey:@"_password"];
  [v6 encodeObject:self->_passwordEquivToken forKey:@"_passwordEquivToken"];
  [v6 encodeObject:self->_dsid forKey:@"_dsid"];
  [v6 encodeBool:self->_isHSA2Account forKey:@"_isHSA2Account"];
  [v6 encodeBool:self->_isManagedAccount forKey:@"_isManagedAccount"];
  [v6 encodeBool:self->_didUseSMSVerification forKey:@"_didUseSMSVerification"];
  [v6 encodeObject:self->_cachedLocalSecret forKey:@"_cachedLocalSecret"];
  [v6 encodeInteger:self->_cachedLocalSecretType forKey:@"_cachedLocalSecretType"];
  [v6 encodeBool:self->__alwaysCreateEscrowRecord forKey:@"__alwaysCreateEscrowRecord"];
  [v6 encodeBool:self->__skipEscrowFetches forKey:@"__skipEscrowFetches"];
  [v6 encodeBool:self->_guestMode forKey:@"_guestMode"];
  [v6 encodeBool:self->_idmsRecovery forKey:@"_idmsRecovery"];
  [v6 encodeBool:self->_idmsMasterKeyRecovery forKey:@"_idmsMasterKeyRecovery"];
  [v6 encodeObject:self->_duplexSession forKey:@"_duplexSession"];
  [v6 encodeObject:self->_resumeContext forKey:@"_resumeContext"];
  [v6 encodeObject:self->_sharingChannel forKey:@"_sharingChannel"];
  [v6 encodeInteger:self->_type forKey:@"_type"];
  [v6 encodeBool:self->_isAttemptingBackupRestore forKey:@"_isAttemptingBackupRestore"];
  [v6 encodeObject:self->_findMyiPhoneUUID forKey:@"_findMyiPhoneUUID"];
  [v6 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v6 encodeBool:self->_isFederatedAccount forKey:@"_isFederatedAccount"];
  [v6 encodeBool:self->_isBeneficiaryAccount forKey:@"_isBeneficiaryAccount"];
  [v6 encodeBool:self->__ignoreLockAssertErrors forKey:@"__ignoreLockAssertErrors"];
  [v6 encodeObject:self->_custodianRecoveryInfo forKey:@"_custodianRecoveryInfo"];
  [v6 encodeObject:self->_beneficiaryIdentifier forKey:@"_beneficiaryAccount"];
  [v6 encodeObject:self->_beneficiaryWrappedKeyData forKey:@"_beneficiaryWrappedKeyData"];
  [v6 encodeBool:self->__supportsCustodianRecovery forKey:@"__supportsCustodianRecovery"];
  [v6 encodeObject:self->_bundleID forKey:@"_bundleID"];
  [v6 encodeBool:self->__disableAsyncSecureBackupEnrollment forKey:@"__disableAsyncSecureBackupEnrollment"];
  [v6 encodeBool:self->_mandatesRecoveryKey forKey:@"_mandatesRecoveryKey"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_walrusStatus];
  [v6 encodeObject:v5 forKey:@"_walrusStatus"];

  [v6 encodeBool:self->__forceManateeReset forKey:@"__forceManateeReset"];
  [v6 encodeBool:self->__forceEDPReset forKey:@"__forceEDPReset"];
  [v6 encodeBool:self->__recoveryMethodAvailable forKey:@"__recoveryMethodAvailable"];
  [v6 encodeBool:self->_isSOSCFUFlow forKey:@"_isSOSCFUFlow"];
  [v6 encodeInteger:self->_sosCompatibilityType forKey:@"_sosCompatibilityType"];
  [v6 encodeInteger:self->_keychainSyncSystem forKey:@"_keychainSyncSystem"];
  [v6 encodeObject:self->_telemetryFlowID forKey:@"_telemetryFlowID"];
  [v6 encodeObject:self->_telemetryDeviceSessionID forKey:@"_telemetryDeviceSessionID"];
  [v6 encodeBool:self->_needsPreflight forKey:@"_needsPreflight"];
  [v6 encodeBool:self->_isSharediPad forKey:@"_isSharediPad"];
  [v6 encodeInteger:self->_securityLevel forKey:@"_securityLevel"];
  [v6 encodeObject:self->_followUpType forKey:@"_followUpType"];
  [v6 encodeBool:self->__useSecureBackupCachedPassphrase forKey:@"__useSecureBackupCachedPassphrase"];
  [v6 encodeBool:self->_cachedPassphraseMissing forKey:@"_cachedPassphraseMissing"];
  [v6 encodeObject:self->_adpCohort forKey:@"_adpCohort"];
  [v6 encodeBool:self->_newAccountCreated forKey:@"_newAccountCreated"];
  [v6 encodeInteger:self->_edpState forKey:@"_edpState"];
  [v6 encodeObject:self->_passwordVersion forKey:@"_passwordVersion"];
  [v6 encodeObject:self->_srpProtocol forKey:@"_srpProtocol"];
  [v6 encodeObject:self->_srpSalt forKey:@"_srpSalt"];
  [v6 encodeObject:self->_srpIteration forKey:@"_srpIteration"];
  [v6 encodeObject:self->_edpRecoveryToken forKey:@"_edpRecoveryToken"];
  [v6 encodeBool:self->__alwaysPromptForEDPRecoveryToken forKey:@"__alwaysPromptForEDPRecoveryToken"];
  [v6 encodeObject:self->_interactiveAuthDefaultButtonString forKey:@"_interactiveAuthDefaultButtonString"];
  [v6 encodeBool:self->_forceInteractiveCDPEDPRepair forKey:@"_forceInteractiveCDPEDPRepair"];
  [v6 encodeBool:self->_willAttemptAsyncSecureBackupEnablement forKey:@"_willAttemptAsyncSecureBackupEnablement"];
  [v6 encodeBool:self->_didAttemptSecureBackupEnablement forKey:@"_didAttemptSecureBackupEnablement"];
  [v6 encodeBool:self->_secureBackupEnablementNotRequired forKey:@"_secureBackupEnablementNotRequired"];
}

- (CDPContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CDPContext initNeedingPreflight:](self, "initNeedingPreflight:", [v4 decodeBoolForKey:@"_needsPreflight"]);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_password"];
    password = v5->_password;
    v5->_password = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passwordEquivToken"];
    passwordEquivToken = v5->_passwordEquivToken;
    v5->_passwordEquivToken = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v12;

    v5->_isHSA2Account = [v4 decodeBoolForKey:@"_isHSA2Account"];
    v5->_isManagedAccount = [v4 decodeBoolForKey:@"_isManagedAccount"];
    v5->_didUseSMSVerification = [v4 decodeBoolForKey:@"_didUseSMSVerification"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cachedLocalSecret"];
    cachedLocalSecret = v5->_cachedLocalSecret;
    v5->_cachedLocalSecret = (NSString *)v14;

    v5->_cachedLocalSecretType = [v4 decodeIntegerForKey:@"_cachedLocalSecretType"];
    v5->__alwaysCreateEscrowRecord = [v4 decodeBoolForKey:@"__alwaysCreateEscrowRecord"];
    v5->__skipEscrowFetches = [v4 decodeBoolForKey:@"__skipEscrowFetches"];
    v5->_guestMode = [v4 decodeBoolForKey:@"_guestMode"];
    v5->_idmsRecovery = [v4 decodeBoolForKey:@"_idmsRecovery"];
    v5->_idmsMasterKeyRecovery = [v4 decodeBoolForKey:@"_idmsMasterKeyRecovery"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_duplexSession"];
    duplexSession = v5->_duplexSession;
    v5->_duplexSession = (KCAESGCMDuplexSession *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resumeContext"];
    resumeContext = v5->_resumeContext;
    v5->_resumeContext = (AKCircleRequestContext *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sharingChannel"];
    sharingChannel = v5->_sharingChannel;
    v5->_sharingChannel = (CUMessageSession *)v20;

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_isAttemptingBackupRestore = [v4 decodeBoolForKey:@"_isAttemptingBackupRestore"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_findMyiPhoneUUID"];
    findMyiPhoneUUID = v5->_findMyiPhoneUUID;
    v5->_findMyiPhoneUUID = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v24;

    v5->_isFederatedAccount = [v4 decodeBoolForKey:@"_isFederatedAccount"];
    v5->_isBeneficiaryAccount = [v4 decodeBoolForKey:@"_isBeneficiaryAccount"];
    v5->__ignoreLockAssertErrors = [v4 decodeBoolForKey:@"__ignoreLockAssertErrors"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianRecoveryInfo"];
    custodianRecoveryInfo = v5->_custodianRecoveryInfo;
    v5->_custodianRecoveryInfo = (CDPCustodianRecoveryInfo *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryAccount"];
    beneficiaryIdentifier = v5->_beneficiaryIdentifier;
    v5->_beneficiaryIdentifier = (NSUUID *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryWrappedKeyData"];
    beneficiaryWrappedKeyData = v5->_beneficiaryWrappedKeyData;
    v5->_beneficiaryWrappedKeyData = (NSData *)v30;

    v5->__supportsCustodianRecovery = [v4 decodeBoolForKey:@"__supportsCustodianRecovery"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v32;

    v5->__disableAsyncSecureBackupEnrollment = [v4 decodeBoolForKey:@"__disableAsyncSecureBackupEnrollment"];
    v5->_mandatesRecoveryKey = [v4 decodeBoolForKey:@"_mandatesRecoveryKey"];
    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_walrusStatus"];
    v5->_walrusStatus = [v34 unsignedIntValue];

    v5->__forceManateeReset = [v4 decodeBoolForKey:@"__forceManateeReset"];
    v5->__forceEDPReset = [v4 decodeBoolForKey:@"__forceEDPReset"];
    v5->__recoveryMethodAvailable = [v4 decodeBoolForKey:@"__recoveryMethodAvailable"];
    v5->_isSOSCFUFlow = [v4 decodeBoolForKey:@"_isSOSCFUFlow"];
    v5->_sosCompatibilityType = (int)[v4 decodeIntForKey:@"_sosCompatibilityType"];
    v5->_keychainSyncSystem = [v4 decodeIntegerForKey:@"_keychainSyncSystem"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryFlowID"];
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_telemetryDeviceSessionID"];
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v37;

    v5->_isSharediPad = [v4 decodeBoolForKey:@"_isSharediPad"];
    v5->_securityLevel = [v4 decodeIntegerForKey:@"_securityLevel"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_followUpType"];
    followUpType = v5->_followUpType;
    v5->_followUpType = (NSString *)v39;

    v5->__useSecureBackupCachedPassphrase = [v4 decodeBoolForKey:@"__useSecureBackupCachedPassphrase"];
    v5->_cachedPassphraseMissing = [v4 decodeBoolForKey:@"_cachedPassphraseMissing"];
    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_adpCohort"];
    adpCohort = v5->_adpCohort;
    v5->_adpCohort = (NSNumber *)v41;

    v5->_newAccountCreated = [v4 decodeBoolForKey:@"_newAccountCreated"];
    v5->_edpState = [v4 decodeIntegerForKey:@"_edpState"];
    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passwordVersion"];
    passwordVersion = v5->_passwordVersion;
    v5->_passwordVersion = (NSNumber *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_srpProtocol"];
    srpProtocol = v5->_srpProtocol;
    v5->_srpProtocol = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_srpSalt"];
    srpSalt = v5->_srpSalt;
    v5->_srpSalt = (NSData *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_srpIteration"];
    srpIteration = v5->_srpIteration;
    v5->_srpIteration = (NSNumber *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_edpRecoveryToken"];
    edpRecoveryToken = v5->_edpRecoveryToken;
    v5->_edpRecoveryToken = (NSString *)v51;

    v5->__alwaysPromptForEDPRecoveryToken = [v4 decodeBoolForKey:@"__alwaysPromptForEDPRecoveryToken"];
    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interactiveAuthDefaultButtonString"];
    interactiveAuthDefaultButtonString = v5->_interactiveAuthDefaultButtonString;
    v5->_interactiveAuthDefaultButtonString = (NSString *)v53;

    v5->_forceInteractiveCDPEDPRepair = [v4 decodeBoolForKey:@"_forceInteractiveCDPEDPRepair"];
    v5->_willAttemptAsyncSecureBackupEnablement = [v4 decodeBoolForKey:@"_willAttemptAsyncSecureBackupEnablement"];
    v5->_didAttemptSecureBackupEnablement = [v4 decodeBoolForKey:@"_didAttemptSecureBackupEnablement"];
    v5->_secureBackupEnablementNotRequired = [v4 decodeBoolForKey:@"_secureBackupEnablementNotRequired"];
  }

  return v5;
}

- (void)_updateEDPWithAuthenticationResults:(id)a3
{
  id v19 = a3;
  objc_opt_class();
  id v4 = [v19 objectForKeyedSubscript:*MEMORY[0x263F29040]];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  self->_edpState = [(CDPContext *)self _parseEDPStateFromRawState:v5];
  objc_opt_class();
  id v6 = [v19 objectForKeyedSubscript:*MEMORY[0x263F29050]];
  if (objc_opt_isKindOfClass()) {
    int v7 = (NSNumber *)v6;
  }
  else {
    int v7 = 0;
  }

  passwordVersion = self->_passwordVersion;
  self->_passwordVersion = v7;

  objc_opt_class();
  id v9 = [v19 objectForKeyedSubscript:*MEMORY[0x263F29078]];
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = (NSString *)v9;
  }
  else {
    uint64_t v10 = 0;
  }

  srpProtocol = self->_srpProtocol;
  self->_srpProtocol = v10;

  objc_opt_class();
  id v12 = [v19 objectForKeyedSubscript:*MEMORY[0x263F29080]];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  objc_msgSend(v13, "aaf_toBase64DecodedData");
  uint64_t v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  srpSalt = self->_srpSalt;
  self->_srpSalt = v14;

  objc_opt_class();
  id v16 = [v19 objectForKeyedSubscript:*MEMORY[0x263F29070]];
  if (objc_opt_isKindOfClass()) {
    int v17 = (NSNumber *)v16;
  }
  else {
    int v17 = 0;
  }

  srpIteration = self->_srpIteration;
  self->_srpIteration = v17;
}

- (void)updateWithAuthenticationResults:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F28FF0];
  id v16 = a3;
  id v5 = [v16 objectForKeyedSubscript:v4];
  passwordEquivToken = self->_passwordEquivToken;
  self->_passwordEquivToken = v5;

  int v7 = [v16 objectForKeyedSubscript:*MEMORY[0x263F28FF8]];
  password = self->_password;
  self->_password = v7;

  id v9 = [v16 objectForKeyedSubscript:*MEMORY[0x263F28F80]];
  dsid = self->_dsid;
  self->_dsid = v9;

  uint64_t v11 = [v16 objectForKeyedSubscript:*MEMORY[0x263F28F60]];
  self->_isFederatedAccount = [v11 unsignedIntegerValue] == 2;

  id v12 = [v16 objectForKeyedSubscript:*MEMORY[0x263F28FC0]];
  self->_isBeneficiaryAccount = [v12 BOOLValue];

  id v13 = [v16 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  altDSID = self->_altDSID;
  self->_altDSID = v13;

  BOOL v15 = [v16 objectForKeyedSubscript:*MEMORY[0x263F29000]];
  self->_securityLevel = [v15 unsignedIntegerValue];

  [(CDPContext *)self _updateEDPWithAuthenticationResults:v16];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CDPContext);
  uint64_t v5 = [(NSString *)self->_appleID copy];
  appleID = v4->_appleID;
  v4->_appleID = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_password copy];
  password = v4->_password;
  v4->_password = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_passwordEquivToken copy];
  passwordEquivToken = v4->_passwordEquivToken;
  v4->_passwordEquivToken = (NSString *)v9;

  uint64_t v11 = [(NSNumber *)self->_dsid copy];
  dsid = v4->_dsid;
  v4->_dsid = (NSNumber *)v11;

  v4->_isHSA2Account = self->_isHSA2Account;
  v4->_isManagedAccount = self->_isManagedAccount;
  objc_storeStrong((id *)&v4->_isPrimaryAccountInternal, self->_isPrimaryAccountInternal);
  v4->_didUseSMSVerification = self->_didUseSMSVerification;
  uint64_t v13 = [(NSString *)self->_cachedLocalSecret copy];
  cachedLocalSecret = v4->_cachedLocalSecret;
  v4->_cachedLocalSecret = (NSString *)v13;

  v4->_cachedLocalSecretType = self->_cachedLocalSecretType;
  v4->__alwaysCreateEscrowRecord = self->__alwaysCreateEscrowRecord;
  v4->__skipEscrowFetches = self->__skipEscrowFetches;
  v4->_guestMode = self->_guestMode;
  v4->_idmsRecovery = self->_idmsRecovery;
  v4->_idmsMasterKeyRecovery = self->_idmsMasterKeyRecovery;
  v4->_type = self->_type;
  v4->_isAttemptingBackupRestore = self->_isAttemptingBackupRestore;
  objc_storeStrong((id *)&v4->_findMyiPhoneUUID, self->_findMyiPhoneUUID);
  objc_storeStrong((id *)&v4->_altDSID, self->_altDSID);
  objc_storeStrong((id *)&v4->_sharingChannel, self->_sharingChannel);
  v4->_isFederatedAccount = self->_isFederatedAccount;
  v4->_isBeneficiaryAccount = self->_isBeneficiaryAccount;
  uint64_t v15 = [(CDPCustodianRecoveryInfo *)self->_custodianRecoveryInfo copy];
  custodianRecoveryInfo = v4->_custodianRecoveryInfo;
  v4->_custodianRecoveryInfo = (CDPCustodianRecoveryInfo *)v15;

  uint64_t v17 = [(NSUUID *)self->_beneficiaryIdentifier copy];
  beneficiaryIdentifier = v4->_beneficiaryIdentifier;
  v4->_beneficiaryIdentifier = (NSUUID *)v17;

  uint64_t v19 = [(NSData *)self->_beneficiaryWrappedKeyData copy];
  beneficiaryWrappedKeyData = v4->_beneficiaryWrappedKeyData;
  v4->_beneficiaryWrappedKeyData = (NSData *)v19;

  v4->__supportsCustodianRecovery = self->__supportsCustodianRecovery;
  objc_storeStrong((id *)&v4->_bundleID, self->_bundleID);
  v4->__disableAsyncSecureBackupEnrollment = self->__disableAsyncSecureBackupEnrollment;
  v4->_mandatesRecoveryKey = self->_mandatesRecoveryKey;
  v4->_walrusStatus = self->_walrusStatus;
  v4->__forceManateeReset = self->__forceManateeReset;
  v4->__forceEDPReset = self->__forceEDPReset;
  v4->__recoveryMethodAvailable = self->__recoveryMethodAvailable;
  v4->_isSOSCFUFlow = self->_isSOSCFUFlow;
  v4->_sosCompatibilityType = self->_sosCompatibilityType;
  v4->_keychainSyncSystem = self->_keychainSyncSystem;
  objc_storeStrong((id *)&v4->_telemetryFlowID, self->_telemetryFlowID);
  objc_storeStrong((id *)&v4->_telemetryDeviceSessionID, self->_telemetryDeviceSessionID);
  v4->_isSharediPad = self->_isSharediPad;
  v4->_securityLevel = self->_securityLevel;
  objc_storeStrong((id *)&v4->_followUpType, self->_followUpType);
  v4->__useSecureBackupCachedPassphrase = self->__useSecureBackupCachedPassphrase;
  v4->_cachedPassphraseMissing = self->_cachedPassphraseMissing;
  objc_storeStrong((id *)&v4->_adpCohort, self->_adpCohort);
  v4->_edpState = self->_edpState;
  objc_storeStrong((id *)&v4->_passwordVersion, self->_passwordVersion);
  objc_storeStrong((id *)&v4->_srpProtocol, self->_srpProtocol);
  objc_storeStrong((id *)&v4->_srpSalt, self->_srpSalt);
  objc_storeStrong((id *)&v4->_srpIteration, self->_srpIteration);
  objc_storeStrong((id *)&v4->_edpRecoveryToken, self->_edpRecoveryToken);
  v4->__alwaysPromptForEDPRecoveryToken = self->__alwaysPromptForEDPRecoveryToken;
  objc_storeStrong((id *)&v4->_srpIteration, self->_srpIteration);
  objc_storeStrong((id *)&v4->_interactiveAuthDefaultButtonString, self->_interactiveAuthDefaultButtonString);
  v4->_forceInteractiveCDPEDPRepair = self->_forceInteractiveCDPEDPRepair;
  v4->_willAttemptAsyncSecureBackupEnablement = self->_willAttemptAsyncSecureBackupEnablement;
  v4->_didAttemptSecureBackupEnablement = self->_didAttemptSecureBackupEnablement;
  v4->_secureBackupEnablementNotRequired = self->_secureBackupEnablementNotRequired;
  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendString:@"CDPContext: \n"];
  [v3 appendFormat:@"\taltDSID: %@\n", self->_altDSID];
  [v3 appendFormat:@"\tdsid: %@\n", self->_dsid];
  objc_msgSend(v3, "appendFormat:", @"\tisHSA2Account: %d\n", self->_isHSA2Account);
  objc_msgSend(v3, "appendFormat:", @"\tisManagedAccount: %d\n", self->_isManagedAccount);
  [v3 appendFormat:@"\tisPrimaryAccountInternal: %@\n", self->_isPrimaryAccountInternal];
  objc_msgSend(v3, "appendFormat:", @"\tdidUseSMSVerification: %d\n", self->_didUseSMSVerification);
  [v3 appendFormat:@"\tisPrimaryAccountInternal: %@\n", self->_isPrimaryAccountInternal];
  objc_msgSend(v3, "appendFormat:", @"\tisSOSCFUFlow: %d\n", self->_isSOSCFUFlow);
  objc_msgSend(v3, "appendFormat:", @"\tsosCompatibilityType: %lu\n", self->_sosCompatibilityType);
  if (self->_keychainSyncSystem) {
    uint64_t v4 = @"SOS";
  }
  else {
    uint64_t v4 = @"Octagon";
  }
  [v3 appendFormat:@"\tkeychainSyncSystem: %@\n", v4];
  objc_msgSend(v3, "appendFormat:", @"\tisTTSURecovery: %d\n", -[CDPContext isTTSURecovery](self, "isTTSURecovery"));
  objc_msgSend(v3, "appendFormat:", @"\tisSharediPad: %d\n", -[CDPContext isSharediPad](self, "isSharediPad"));
  objc_msgSend(v3, "appendFormat:", @"\tnewAccountCreated: %d\n", -[CDPContext newAccountCreated](self, "newAccountCreated"));
  objc_msgSend(v3, "appendFormat:", @"\tcontextType: %ld\n", -[CDPContext type](self, "type"));
  objc_msgSend(v3, "appendFormat:", @"\tedpState: %ld\n", self->_edpState);
  [v3 appendFormat:@"\tpasswordVersion: %@\n", self->_passwordVersion];
  password = self->_password;
  id v6 = &stru_26C977DE8;
  if (password && [(NSString *)password length]) {
    id v6 = @"NOT";
  }
  [v3 appendFormat:@"\tpassword is %@ missing\n", v6];
  oldPassword = self->_oldPassword;
  uint64_t v8 = &stru_26C977DE8;
  if (oldPassword && [(NSString *)oldPassword length]) {
    uint64_t v8 = @"NOT";
  }
  [v3 appendFormat:@"\toldPassword is %@ missing\n", v8];
  srpProtocol = self->_srpProtocol;
  if (srpProtocol)
  {
    if ([(NSString *)srpProtocol length]) {
      uint64_t v10 = @"NOT";
    }
    else {
      uint64_t v10 = &stru_26C977DE8;
    }
  }
  else
  {
    uint64_t v10 = &stru_26C977DE8;
  }
  [v3 appendFormat:@"\tsrpProtocol is %@ missing\n", v10];
  if (self->_srpSalt) {
    uint64_t v11 = @"NOT";
  }
  else {
    uint64_t v11 = &stru_26C977DE8;
  }
  [v3 appendFormat:@"\tsrpSalt is %@ missing\n", v11];
  if (self->_srpIteration) {
    id v12 = @"NOT";
  }
  else {
    id v12 = &stru_26C977DE8;
  }
  [v3 appendFormat:@"\tsrpIteration is %@ missing\n", v12];
  [v3 appendFormat:@"\tInteractive Auth Button String: %@\n", self->_interactiveAuthDefaultButtonString];
  objc_msgSend(v3, "appendFormat:", @"\tforceInteractiveCDPEDPRepair: %d\n", -[CDPContext forceInteractiveCDPEDPRepair](self, "forceInteractiveCDPEDPRepair"));
  return v3;
}

- (void)augmentWithCredentialsFromContext:(id)a3
{
  id v20 = a3;
  if (!self->_appleID)
  {
    uint64_t v4 = [v20 appleID];
    appleID = self->_appleID;
    self->_appleID = v4;
  }
  if (!self->_password)
  {
    id v6 = [v20 password];
    password = self->_password;
    self->_password = v6;
  }
  if (!self->_oldPassword)
  {
    uint64_t v8 = [v20 oldPassword];
    oldPassword = self->_oldPassword;
    self->_oldPassword = v8;
  }
  if (!self->_passwordEquivToken)
  {
    uint64_t v10 = [v20 passwordEquivToken];
    passwordEquivToken = self->_passwordEquivToken;
    self->_passwordEquivToken = v10;
  }
  if (!self->_dsid)
  {
    id v12 = [v20 dsid];
    dsid = self->_dsid;
    self->_dsid = v12;
  }
  if (!self->_altDSID)
  {
    uint64_t v14 = [v20 altDSID];
    altDSID = self->_altDSID;
    self->_altDSID = v14;
  }
  if (!self->_telemetryDeviceSessionID)
  {
    id v16 = [v20 telemetryDeviceSessionID];
    telemetryDeviceSessionID = self->_telemetryDeviceSessionID;
    self->_telemetryDeviceSessionID = v16;
  }
  if (!self->_telemetryFlowID)
  {
    uint64_t v18 = [v20 telemetryFlowID];
    telemetryFlowID = self->_telemetryFlowID;
    self->_telemetryFlowID = v18;
  }
  if (!self->_securityLevel) {
    self->_securityLevel = [v20 securityLevel];
  }
}

- (id)cliqueConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x263F16D38]);
  [v3 setContext:*MEMORY[0x263F16D90]];
  uint64_t v4 = [(CDPContext *)self dsid];
  uint64_t v5 = [v4 stringValue];
  [v3 setDsid:v5];

  id v6 = [(CDPContext *)self altDSID];
  [v3 setAltDSID:v6];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(CDPContext *)self telemetryFlowID];
    [v3 setFlowID:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(CDPContext *)self telemetryDeviceSessionID];
    [v3 setDeviceSessionID:v8];
  }
  return v3;
}

- (BOOL)isPiggybackingRecovery
{
  id v3 = [(CDPContext *)self duplexSession];
  if (v3)
  {
    uint64_t v4 = [(CDPContext *)self resumeContext];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isTTSURecovery
{
  uint64_t v2 = [(CDPContext *)self sharingChannel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isiCDPEligible
{
  return [(CDPContext *)self isiCDPEligibleWithError:0];
}

- (BOOL)isiCDPEligibleWithError:(id *)a3
{
  if ([(CDPContext *)self isSharediPad])
  {
    BOOL v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "isiCDPEligible: managed accounts on shared iPad is not manatee eligible, returning NO", buf, 2u);
    }

    if (a3)
    {
      uint64_t v6 = -5004;
LABEL_33:
      _CDPStateError(v6, 0);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v17;
      return result;
    }
    return 0;
  }
  if ([(CDPContext *)self isHSA2Account])
  {
    if ([(CDPContext *)self isPrimaryAccount]
      || [(CDPContext *)self multiUserManateeAllowed])
    {
      uint64_t v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "isiCDPEligible: Account is HSA2 and primary: returning YES", v22, 2u);
      }

      return 1;
    }
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = 0;
      uint64_t v15 = "isiCDPEligible: Account is HSA2 and non-primary, and multi-user is not allowed: returning NO";
      id v16 = (uint8_t *)&v23;
LABEL_30:
      _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if (![(CDPContext *)self isManagedAccount])
  {
    id v12 = _CDPLogSystem();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    __int16 v18 = 0;
    uint64_t v13 = "isiCDPEligible: Account is not HSA or Managed, returning NO";
    uint64_t v14 = (uint8_t *)&v18;
    goto LABEL_25;
  }
  if ([(CDPContext *)self managedAccountsAllowedInCDP])
  {
    BOOL v9 = [(CDPContext *)self isPrimaryAccount];
    uint64_t v10 = _CDPLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "isiCDPEligible: Account is managed and primary: returning YES", v20, 2u);
      }

      return 1;
    }
    if (v11)
    {
      *(_WORD *)uint64_t v19 = 0;
      uint64_t v15 = "isiCDPEligible: Account is managed but non-primary: returning NO";
      id v16 = v19;
      goto LABEL_30;
    }
LABEL_31:

    if (a3)
    {
      uint64_t v6 = -5111;
      goto LABEL_33;
    }
    return 0;
  }
  id v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    uint64_t v13 = "isiCDPEligible: Account is managed, but managed accounts are not allowed in CDP: returning NO";
    uint64_t v14 = v21;
LABEL_25:
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
  }
LABEL_26:

  if (a3)
  {
    uint64_t v6 = -5110;
    goto LABEL_33;
  }
  return 0;
}

- (BOOL)isBeneficiaryFlow
{
  BOOL v3 = [(CDPContext *)self beneficiaryIdentifier];
  uint64_t v4 = [v3 UUIDString];
  if ([v4 length]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(CDPContext *)self isBeneficiaryAccount];
  }

  return v5;
}

- (BOOL)is2FAFAUserFromNetwork
{
  BOOL v3 = [(CDPContext *)self isHSA2Account];
  if (v3) {
    LOBYTE(v3) = ![(CDPContext *)self isICDPEnabledFromNetwork];
  }
  return v3;
}

- (BOOL)isICDPEnabledFromNetwork
{
  uint64_t v2 = [(CDPContext *)self dsid];
  BOOL v3 = [v2 stringValue];
  BOOL v4 = +[CDPAccount isICDPEnabledForDSID:v3 checkWithServer:1];

  return v4;
}

- (void)setValidEscrowDeviceCount:(int64_t)a3
{
  self->_validEscrowDeviceCount = a3;
}

- (BOOL)isSOSNeeded
{
  return (LOBYTE(self->_sosCompatibilityType) >> 1) & 1;
}

- (BOOL)isSOSCompatibilityOptInNeeded
{
  return self->_sosCompatibilityType & 1;
}

- (void)_fakeSOSFlagsWithUserDefaults
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "**** DEBUG **** FakeSOSNeeded mode is ENABLED", v2, v3, v4, v5, v6);
}

- (BOOL)isLocalSecretCached
{
  if (+[CDPUtilities useCDPContextSecretInsteadOfSBDSecretFeatureEnabled])
  {
    return [(CDPContext *)self _isLocalSecretCachedAcknowledgingInMemoryValue];
  }
  else
  {
    if ([(CDPContext *)self cachedPassphraseMissing]) {
      return 0;
    }
    uint64_t v5 = [(CDPContext *)self cachedLocalSecret];
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(CDPContext *)self _useSecureBackupCachedPassphrase];
    }

    return v4;
  }
}

- (BOOL)_isLocalSecretCachedAcknowledgingInMemoryValue
{
  uint64_t v3 = [(CDPContext *)self cachedLocalSecret];

  if (v3)
  {
    uint64_t v4 = [(CDPContext *)self cachedLocalSecret];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint8_t v6 = [(CDPContext *)self cachedLocalSecret];
      uint64_t v7 = [v6 length];

      if (!v7)
      {
        uint64_t v8 = _CDPLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          -[CDPContext _isLocalSecretCachedAcknowledgingInMemoryValue](v8);
        }
      }
    }
    LOBYTE(v9) = 1;
  }
  else
  {
    BOOL v9 = [(CDPContext *)self _useSecureBackupCachedPassphrase];
    if (v9) {
      LOBYTE(v9) = ![(CDPContext *)self cachedPassphraseMissing];
    }
  }
  return v9;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)oldPassword
{
  return self->_oldPassword;
}

- (NSString)passwordEquivToken
{
  return self->_passwordEquivToken;
}

- (void)setPasswordEquivToken:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setEdpState:(unint64_t)a3
{
  self->_edpState = a3;
}

- (void)setPasswordVersion:(id)a3
{
}

- (void)setSrpProtocol:(id)a3
{
}

- (NSString)edpRecoveryToken
{
  return self->_edpRecoveryToken;
}

- (void)setEdpRecoveryToken:(id)a3
{
}

- (void)setEdpHealth:(unint64_t)a3
{
  self->_edpHealth = a3;
}

- (BOOL)isHSA2Account
{
  return self->_isHSA2Account;
}

- (void)setIsHSA2Account:(BOOL)a3
{
  self->_isHSA2Account = a3;
}

- (BOOL)isFederatedAccount
{
  return self->_isFederatedAccount;
}

- (void)setIsFederatedAccount:(BOOL)a3
{
  self->_isFederatedAccount = a3;
}

- (BOOL)isBeneficiaryAccount
{
  return self->_isBeneficiaryAccount;
}

- (void)setIsBeneficiaryAccount:(BOOL)a3
{
  self->_isBeneficiaryAccount = a3;
}

- (BOOL)didUseSMSVerification
{
  return self->_didUseSMSVerification;
}

- (void)setDidUseSMSVerification:(BOOL)a3
{
  self->_didUseSMSVerification = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isAttemptingBackupRestore
{
  return self->_isAttemptingBackupRestore;
}

- (void)setIsAttemptingBackupRestore:(BOOL)a3
{
  self->_isAttemptingBackupRestore = a3;
}

- (NSString)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (void)setCachedLocalSecret:(id)a3
{
}

- (unint64_t)cachedLocalSecretType
{
  return self->_cachedLocalSecretType;
}

- (void)setCachedLocalSecretType:(unint64_t)a3
{
  self->_cachedLocalSecretType = a3;
}

- (BOOL)guestMode
{
  return self->_guestMode;
}

- (void)setGuestMode:(BOOL)a3
{
  self->_guestMode = a3;
}

- (NSString)findMyiPhoneUUID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFindMyiPhoneUUID:(id)a3
{
}

- (NSUUID)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)setBeneficiaryIdentifier:(id)a3
{
}

- (BOOL)newAccountCreated
{
  return self->_newAccountCreated;
}

- (CDPAuthProviderInternal)_authProvider
{
  return self->__authProvider;
}

- (void)set_authProvider:(id)a3
{
}

- (KCAESGCMDuplexSession)duplexSession
{
  return self->_duplexSession;
}

- (void)setDuplexSession:(id)a3
{
}

- (AKCircleRequestContext)resumeContext
{
  return self->_resumeContext;
}

- (void)setResumeContext:(id)a3
{
}

- (BOOL)failSignInOnError
{
  return self->_failSignInOnError;
}

- (void)setFailSignInOnError:(BOOL)a3
{
  self->_failSignInOnError = a3;
}

- (int64_t)validEscrowDeviceCount
{
  return self->_validEscrowDeviceCount;
}

- (int64_t)totalEscrowDeviceCount
{
  return self->_totalEscrowDeviceCount;
}

- (void)setTotalEscrowDeviceCount:(int64_t)a3
{
  self->_totalEscrowDeviceCount = a3;
}

- (int64_t)totalRecoveryAttempts
{
  return self->_totalRecoveryAttempts;
}

- (void)setTotalRecoveryAttempts:(int64_t)a3
{
  self->_totalRecoveryAttempts = a3;
}

- (int64_t)maxDeviceRecoveryAttempts
{
  return self->_maxDeviceRecoveryAttempts;
}

- (void)setMaxDeviceRecoveryAttempts:(int64_t)a3
{
  self->_maxDeviceRecoveryAttempts = a3;
}

- (double)newestEscrowRecordAge
{
  return self->_newestEscrowRecordAge;
}

- (void)setNewestEscrowRecordAge:(double)a3
{
  self->_newestEscrowRecordAge = a3;
}

- (BOOL)isManagedAccount
{
  return self->_isManagedAccount;
}

- (void)setIsManagedAccount:(BOOL)a3
{
  self->_isManagedAccount = a3;
}

- (BOOL)multiUserManateeAllowed
{
  return self->_multiUserManateeAllowed;
}

- (void)setMultiUserManateeAllowed:(BOOL)a3
{
  self->_multiUserManateeAllowed = a3;
}

- (BOOL)managedAccountsAllowedInCDP
{
  return self->_managedAccountsAllowedInCDP;
}

- (void)setManagedAccountsAllowedInCDP:(BOOL)a3
{
  self->_managedAccountsAllowedInCDP = a3;
}

- (BOOL)keychainSyncAllowedByMDM
{
  return self->_keychainSyncAllowedByMDM;
}

- (void)setKeychainSyncAllowedByMDM:(BOOL)a3
{
  self->_keychainSyncAllowedByMDM = a3;
}

- (unsigned)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unsigned int)a3
{
  self->_endpoint = a3;
}

- (unsigned)backupActivity
{
  return self->_backupActivity;
}

- (void)setBackupActivity:(unsigned int)a3
{
  self->_backupActivity = a3;
}

- (unint64_t)walrusStatus
{
  return self->_walrusStatus;
}

- (void)setWalrusStatus:(unint64_t)a3
{
  self->_walrusStatus = a3;
}

- (unint64_t)securityLevel
{
  return self->_securityLevel;
}

- (void)setSecurityLevel:(unint64_t)a3
{
  self->_securityLevel = a3;
}

- (BOOL)isSharediPad
{
  return self->_isSharediPad;
}

- (void)setIsSharediPad:(BOOL)a3
{
  self->_isSharediPad = a3;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
}

- (BOOL)willAttemptAsyncSecureBackupEnablement
{
  return self->_willAttemptAsyncSecureBackupEnablement;
}

- (void)setWillAttemptAsyncSecureBackupEnablement:(BOOL)a3
{
  self->_willAttemptAsyncSecureBackupEnablement = a3;
}

- (BOOL)didAttemptSecureBackupEnablement
{
  return self->_didAttemptSecureBackupEnablement;
}

- (void)setDidAttemptSecureBackupEnablement:(BOOL)a3
{
  self->_didAttemptSecureBackupEnablement = a3;
}

- (BOOL)secureBackupEnablementNotRequired
{
  return self->_secureBackupEnablementNotRequired;
}

- (void)setSecureBackupEnablementNotRequired:(BOOL)a3
{
  self->_secureBackupEnablementNotRequired = a3;
}

- (BOOL)forceInteractiveCDPEDPRepair
{
  return self->_forceInteractiveCDPEDPRepair;
}

- (void)setForceInteractiveCDPEDPRepair:(BOOL)a3
{
  self->_forceInteractiveCDPEDPRepair = a3;
}

- (BOOL)_supportsCustodianRecovery
{
  return self->__supportsCustodianRecovery;
}

- (void)set_supportsCustodianRecovery:(BOOL)a3
{
  self->__supportsCustodianRecovery = a3;
}

- (BOOL)needsPreflight
{
  return self->_needsPreflight;
}

- (CUMessageSession)sharingChannel
{
  return self->_sharingChannel;
}

- (void)setSharingChannel:(id)a3
{
}

- (BOOL)_forceManateeReset
{
  return self->__forceManateeReset;
}

- (void)set_forceManateeReset:(BOOL)a3
{
  self->__forceManateeReset = a3;
}

- (BOOL)_forceEDPReset
{
  return self->__forceEDPReset;
}

- (void)set_forceEDPReset:(BOOL)a3
{
  self->__forceEDPReset = a3;
}

- (BOOL)_recoveryMethodAvailable
{
  return self->__recoveryMethodAvailable;
}

- (void)set_recoveryMethodAvailable:(BOOL)a3
{
  self->__recoveryMethodAvailable = a3;
}

- (BOOL)_disableAsyncSecureBackupEnrollment
{
  return self->__disableAsyncSecureBackupEnrollment;
}

- (void)set_disableAsyncSecureBackupEnrollment:(BOOL)a3
{
  self->__disableAsyncSecureBackupEnrollment = a3;
}

- (BOOL)_useSecureBackupCachedPassphrase
{
  return self->__useSecureBackupCachedPassphrase;
}

- (void)set_useSecureBackupCachedPassphrase:(BOOL)a3
{
  self->__useSecureBackupCachedPassphrase = a3;
}

- (BOOL)_alwaysCreateEscrowRecord
{
  return self->__alwaysCreateEscrowRecord;
}

- (void)set_alwaysCreateEscrowRecord:(BOOL)a3
{
  self->__alwaysCreateEscrowRecord = a3;
}

- (BOOL)_skipEscrowFetches
{
  return self->__skipEscrowFetches;
}

- (void)set_skipEscrowFetches:(BOOL)a3
{
  self->__skipEscrowFetches = a3;
}

- (BOOL)_ignoreLockAssertErrors
{
  return self->__ignoreLockAssertErrors;
}

- (void)set_ignoreLockAssertErrors:(BOOL)a3
{
  self->__ignoreLockAssertErrors = a3;
}

- (BOOL)idmsRecovery
{
  return self->_idmsRecovery;
}

- (void)setIdmsRecovery:(BOOL)a3
{
  self->_idmsRecovery = a3;
}

- (BOOL)idmsMasterKeyRecovery
{
  return self->_idmsMasterKeyRecovery;
}

- (void)setIdmsMasterKeyRecovery:(BOOL)a3
{
  self->_idmsMasterKeyRecovery = a3;
}

- (BOOL)mandatesRecoveryKey
{
  return self->_mandatesRecoveryKey;
}

- (void)setMandatesRecoveryKey:(BOOL)a3
{
  self->_mandatesRecoveryKey = a3;
}

- (BOOL)cachedPassphraseMissing
{
  return self->_cachedPassphraseMissing;
}

- (void)setCachedPassphraseMissing:(BOOL)a3
{
  self->_cachedPassphraseMissing = a3;
}

- (CDPCustodianRecoveryInfo)custodianRecoveryInfo
{
  return self->_custodianRecoveryInfo;
}

- (void)setCustodianRecoveryInfo:(id)a3
{
}

- (NSData)beneficiaryWrappedKeyData
{
  return self->_beneficiaryWrappedKeyData;
}

- (void)setBeneficiaryWrappedKeyData:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isSOSCFUFlow
{
  return self->_isSOSCFUFlow;
}

- (void)setIsSOSCFUFlow:(BOOL)a3
{
  self->_isSOSCFUFlow = a3;
}

- (int64_t)keychainSyncSystem
{
  return self->_keychainSyncSystem;
}

- (void)setKeychainSyncSystem:(int64_t)a3
{
  self->_keychainSyncSystem = a3;
}

- (unint64_t)sosCompatibilityType
{
  return self->_sosCompatibilityType;
}

- (void)setSosCompatibilityType:(unint64_t)a3
{
  self->_sosCompatibilityType = a3;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (NSString)followUpType
{
  return self->_followUpType;
}

- (void)setFollowUpType:(id)a3
{
}

- (void)setAdpCohort:(id)a3
{
}

- (BOOL)ignorePasswordCache
{
  return self->_ignorePasswordCache;
}

- (void)setIgnorePasswordCache:(BOOL)a3
{
  self->_ignorePasswordCache = a3;
}

- (NSData)srpSalt
{
  return self->_srpSalt;
}

- (void)setSrpSalt:(id)a3
{
}

- (NSNumber)srpIteration
{
  return self->_srpIteration;
}

- (void)setSrpIteration:(id)a3
{
}

- (NSString)interactiveAuthDefaultButtonString
{
  return self->_interactiveAuthDefaultButtonString;
}

- (void)setInteractiveAuthDefaultButtonString:(id)a3
{
}

- (BOOL)_alwaysPromptForEDPRecoveryToken
{
  return self->__alwaysPromptForEDPRecoveryToken;
}

- (void)set_alwaysPromptForEDPRecoveryToken:(BOOL)a3
{
  self->__alwaysPromptForEDPRecoveryToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveAuthDefaultButtonString, 0);
  objc_storeStrong((id *)&self->_srpIteration, 0);
  objc_storeStrong((id *)&self->_srpSalt, 0);
  objc_storeStrong((id *)&self->_adpCohort, 0);
  objc_storeStrong((id *)&self->_followUpType, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_beneficiaryWrappedKeyData, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryInfo, 0);
  objc_storeStrong((id *)&self->_sharingChannel, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_resumeContext, 0);
  objc_storeStrong((id *)&self->_duplexSession, 0);
  objc_storeStrong((id *)&self->__authProvider, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_findMyiPhoneUUID, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
  objc_storeStrong((id *)&self->_edpRecoveryToken, 0);
  objc_storeStrong((id *)&self->_srpProtocol, 0);
  objc_storeStrong((id *)&self->_passwordVersion, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_passwordEquivToken, 0);
  objc_storeStrong((id *)&self->_oldPassword, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_keychainSyncAllowedByServerInternal, 0);
  objc_storeStrong((id *)&self->_isPrimaryAccountInternal, 0);
}

+ (id)preflightContext:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[CDPContext(Account) preflightContext:]();
    }

    id v14 = +[CDPContext contextForPrimaryAccount];
    goto LABEL_16;
  }
  if (([v3 needsPreflight] & 1) == 0)
  {
    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[CDPContext(Account) preflightContext:].cold.8();
    }

    id v14 = v4;
LABEL_16:
    id v16 = v14;
    goto LABEL_42;
  }
  uint64_t v5 = [v4 altDSID];

  if (v5)
  {
    uint8_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 altDSID];
      int v34 = 141558274;
      uint64_t v35 = 1752392040;
      __int16 v36 = 2112;
      uint64_t v37 = v7;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "preflightContext: Attempting to backfill context for altDSID %{mask.hash}@ . Please use +[CDPContext contextForAccountWithAltDSID:] to do this in the future.", (uint8_t *)&v34, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x263F290F0] sharedInstance];
    BOOL v9 = [v4 altDSID];
    uint64_t v10 = [v8 authKitAccountWithAltDSID:v9];

    if (v10) {
      goto LABEL_34;
    }
    BOOL v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CDPContext(Account) preflightContext:].cold.7(v4, v11);
    }

    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  id v17 = [v4 dsid];

  if (v17)
  {
    __int16 v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v4 dsid];
      int v34 = 141558274;
      uint64_t v35 = 1752392040;
      __int16 v36 = 2112;
      uint64_t v37 = v19;
      _os_log_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEFAULT, "preflightContext: Attempting to find account for dsid %{mask.hash}@ . Please use +[CDPContext contextForAccountWithAltDSID:] to do this in the future.", (uint8_t *)&v34, 0x16u);
    }
    id v20 = [MEMORY[0x263F290F0] sharedInstance];
    uint64_t v21 = [v4 dsid];
    uint64_t v10 = [v20 authKitAccountWithDSID:v21];

    if (v10) {
      goto LABEL_34;
    }
    uint64_t v22 = _CDPLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[CDPContext(Account) preflightContext:].cold.6(v4, v22);
    }

    int v12 = 1;
  }
  __int16 v23 = [v4 appleID];

  if (v23)
  {
    uint64_t v24 = _CDPLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v4 appleID];
      int v34 = 141558274;
      uint64_t v35 = 1752392040;
      __int16 v36 = 2112;
      uint64_t v37 = v25;
      _os_log_impl(&dword_2182AE000, v24, OS_LOG_TYPE_DEFAULT, "preflightContext: Attempting to find account for appleID %{mask.hash}@ . Please use +[CDPContext contextForAccountWithAppleID:] to do this in the future.", (uint8_t *)&v34, 0x16u);
    }
    uint64_t v26 = [MEMORY[0x263F290F0] sharedInstance];
    uint64_t v27 = [v4 appleID];
    uint64_t v10 = [v26 authKitAccountWithAppleID:v27];

    if (v10) {
      goto LABEL_34;
    }
    uint64_t v28 = _CDPLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[CDPContext(Account) preflightContext:].cold.5(v4, v28);
    }
  }
  else if (!v12)
  {
    id v33 = _CDPLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      +[CDPContext(Account) preflightContext:]();
    }

    v29 = [MEMORY[0x263F290F0] sharedInstance];
    uint64_t v10 = [v29 primaryAuthKitAccount];
    goto LABEL_36;
  }
  uint64_t v10 = 0;
LABEL_34:
  v29 = _CDPLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    +[CDPContext(Account) preflightContext:].cold.4();
  }
LABEL_36:

  if (v10)
  {
    id v30 = (id)[v4 initWithAccount:v10];
  }
  else
  {
    v31 = _CDPLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[CDPContext(Account) preflightContext:]();
    }

    id v30 = v4;
  }
  id v16 = v30;

LABEL_42:
  return v16;
}

- (void)setPassword:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_2182AE000, v0, v1, "setPassword is deprecated! Please use setNewPassword:oldPassword: instead.", v2, v3, v4, v5, v6);
}

+ (void)contextForPrimaryAccount
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_2182AE000, v0, v1, "No primary account found", v2, v3, v4, v5, v6);
}

+ (void)contextForAccountWithAppleID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, v0, v1, "No account found for username %{mask.hash}@", v2);
}

+ (void)contextForAccountWithAppleID:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9(&dword_2182AE000, v0, v1, "Creating context for username %{mask.hash}@", v2, v3, v4, v5, v6);
}

+ (void)contextForAccountWithAltDSID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, v0, v1, "No account found for altDSID %{mask.hash}@", v2);
}

+ (void)contextForAccountWithAltDSID:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9(&dword_2182AE000, v0, v1, "Creating context for altDSID %{mask.hash}@", v2, v3, v4, v5, v6);
}

+ (void)contextForAccountWithDSID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, v0, v1, "No account found for DSID %{mask.hash}@", v2);
}

+ (void)contextForAccountWithDSID:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9(&dword_2182AE000, v0, v1, "Creating context for DSID %{mask.hash}@", v2, v3, v4, v5, v6);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "[CDPContext init] called directly. Please use one of the class initializers instead.", v2, v3, v4, v5, v6);
}

- (void)initWithAccount:.cold.1()
{
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_2182AE000, v4, v5, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v6, v7, v8, v9, v10);
}

- (void)initWithAccount:.cold.2()
{
  OUTLINED_FUNCTION_13();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_2182AE000, v4, v5, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v6, v7, v8, v9, v10);
}

- (void)initWithAccount:.cold.3()
{
  OUTLINED_FUNCTION_13();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_2182AE000, v4, v5, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v6, v7, v8, v9, v10);
}

- (void)initWithAccount:.cold.4()
{
  OUTLINED_FUNCTION_13();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_2182AE000, v4, v5, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v6, v7, v8, v9, v10);
}

- (void)initWithAccount:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "SOS Compat: AKAccountManager isSOSNeededForAccount is True. Setting it in CDPContext.", v2, v3, v4, v5, v6);
}

- (void)initWithAccount:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "SOS Compat: AKAccountManager hasSOSActiveDeviceForAccount is True. Setting it in CDPContext.", v2, v3, v4, v5, v6);
}

- (void)initWithAccount:.cold.7()
{
  OUTLINED_FUNCTION_13();
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = (id)objc_opt_class();
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_10();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, v0, v5, "[%{pulbic}@ %{public}@]: Unknown security level. iCDP will not be available.", v6);
}

- (void)initWithAuthenticationResults:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
}

- (void)initWithAuthenticationResults:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_2182AE000, a1, a3, "%s: a new account was just created, setting up CDPContext=%ld", a5, a6, a7, a8, 2u);
}

- (void)adpCohort
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8(&dword_2182AE000, v0, v1, "%s: Unable to obtain the adpCohortForAccount because AKAccountManager (%@) doesn't respond to selector.", v2, v3, v4, v5, 2u);
}

- (void)_updateEDPAttributesFromAccountCacheWithAccount:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8(&dword_2182AE000, v0, v1, "%s: Unable to obtain the srpProtocolForAccount because AKAccountManager (%@) doesn't respond to selector.", v2, v3, v4, v5, 2u);
}

- (void)_updateEDPAttributesFromAccountCacheWithAccount:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8(&dword_2182AE000, v0, v1, "%s: Unable to obtain the passwordVersionForAccount because AKAccountManager (%@) doesn't respond to selector.", v2, v3, v4, v5, 2u);
}

- (void)_updateEDPAttributesFromAccountCacheWithAccount:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8(&dword_2182AE000, v0, v1, "%s: Unable to obtain the edpStateForAccount because AKAccountManager (%@) doesn't respond to selector.", v2, v3, v4, v5, 2u);
}

- (void)_parseEDPStateFromRawState:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, v0, v1, "%s: Rejecting out-of-range EDP state (%@).", (uint8_t *)v2);
}

- (void)akTrustedDeviceListChanged:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Received trusted device list notification for CDPContext", v2, v3, v4, v5, v6);
}

- (void)numberOfTrustedDevices
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Received number of trusted devices = %zd", (uint8_t *)&v3, 0xCu);
}

- (void)isPrimaryAccount
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, 7.2225e-34);
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, v3, (uint64_t)v3, "isPrimaryAccount: Did not find account for %{mask.hash}@ we can't determine if the account is primary!", v4);
}

- (void)keychainSyncAllowedByServer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "keychainSyncAllowedByServer: Keychain sync is not provisioned by server", v2, v3, v4, v5, v6);
}

- (void)_isLocalSecretCachedAcknowledgingInMemoryValue
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[CDPContext _isLocalSecretCachedAcknowledgingInMemoryValue]";
  _os_log_fault_impl(&dword_2182AE000, log, OS_LOG_TYPE_FAULT, "%s: Found a cached secret that was just an empty string.", (uint8_t *)&v1, 0xCu);
}

@end