@interface DMCEnrollmentFlowController
+ (id)_createEnrollmentNotAllowedDuringSDPError;
+ (id)_createEnterpriseApplicationExistsErrorWithAppName:(id)a3;
+ (id)_createEnterpriseApplicationMissingEntitlementsError;
+ (id)_createGeneralError;
+ (id)_createGeneralSignInError;
+ (id)_createInvalidCloudConfigError;
+ (id)_createMissingAppleAccountForUserEnrollmentError;
+ (id)_createMissingEnterpriseApplicationBundleIDError;
+ (id)_createMissingEnterpriseApplicationError;
+ (id)_createMissingRMAccountError;
+ (id)_createUnsupportedFeatureError;
+ (id)chooseServerFromUAORGOServers:(id)a3 error:(id *)a4;
+ (id)enrollmentFlowController;
+ (id)enrollmentFlowControllerWithPresenter:(id)a3 managedConfigurationHelper:(id)a4;
- (BOOL)_appWithBundleIDExists:(id)a3;
- (BOOL)_canSkipMDMEnrollmentWithEnrollmentType:(unint64_t)a3;
- (BOOL)_extractAndVerifyPropertiesFromProfileData:(id)a3 enrollmentMethod:(unint64_t)a4 isESSO:(BOOL)a5 essoAppITunesStoreID:(id)a6 error:(id *)a7;
- (BOOL)_handleNeedCredentialsError:(id)a3;
- (BOOL)_handleSoftwareUpdateRequiredError:(id)a3;
- (BOOL)_isBYODEnrollment:(unint64_t)a3;
- (BOOL)_isORGOEnrollment:(unint64_t)a3;
- (BOOL)_shouldDoReturnToService;
- (BOOL)_validEnrollmentMode:(id)a3 enrollmentMethod:(unint64_t)a4;
- (BOOL)_validateBundleID:(id)a3 personaID:(id)a4 requiredEntitlements:(id)a5 error:(id *)a6;
- (BOOL)_verifyAccountsInformationWithAltDSID:(id)a3 personaID:(id)a4;
- (BOOL)cleanupIfFail;
- (BOOL)hasExecutedUIStep;
- (BOOL)isPostBuddy;
- (BOOL)isPostRestoration;
- (BOOL)isProfileLocked;
- (BOOL)isRenewalFlow;
- (BOOL)isReturnToService;
- (BOOL)noCompletionScene;
- (BOOL)restartIfFail;
- (DMCEnrollmentDirtyState)dirtyState;
- (DMCEnrollmentFlowController)init;
- (DMCEnrollmentFlowController)initWithPresenter:(id)a3 managedConfigurationHelper:(id)a4;
- (DMCEnrollmentFlowDelegate)delegate;
- (DMCEnrollmentFlowMCBridge)managedConfigurationHelper;
- (DMCEnrollmentFlowPresenter)presenter;
- (DMCObliterationShelter)obliterationShelter;
- (DMCServiceDiscoveryHelper)serviceDiscoveryHelper;
- (MDMESSODetails)essoDetails;
- (NSArray)anchorCertificateRefs;
- (NSArray)extensionIdentifiersFromConfig;
- (NSArray)serverCapabilities;
- (NSArray)servers;
- (NSData)devicePasscodeData;
- (NSData)profileData;
- (NSDictionary)authParams;
- (NSDictionary)authTokens;
- (NSDictionary)cloudConfig;
- (NSMutableDictionary)authenticationResults;
- (NSNumber)essoAppITunesStoreID;
- (NSString)ESSOConfigurationProfileIdentifier;
- (NSString)altDSID;
- (NSString)appBundleID;
- (NSString)devicePasscode;
- (NSString)enrollmentURL;
- (NSString)expectedBuildVersion;
- (NSString)expectedOSVersion;
- (NSString)friendlyName;
- (NSString)managedAppleID;
- (NSString)organizationName;
- (NSString)password;
- (NSString)personaID;
- (NSString)profileIdentifier;
- (NSString)rmAccountIdentifier;
- (NSString)username;
- (NSString)wifiProfileIdentifier;
- (NSURL)serviceURL;
- (id)_ADE_RTS_commonSteps;
- (id)_ADE_commonSteps;
- (id)_ADE_deviceEnrollment_legacy_additionalNativeAuth_steps;
- (id)_ADE_deviceEnrollment_legacy_steps;
- (id)_ADE_deviceEnrollment_softwareUpdate_steps;
- (id)_ADE_deviceEnrollment_webURL_steps;
- (id)_ADE_postEnrollmentSteps;
- (id)_ADxE_MAID_firstPartSteps;
- (id)_ADxE_MAID_secondPartSteps_default;
- (id)_ADxE_MAID_secondPartSteps_orgToken;
- (id)_ADxE_commonSteps;
- (id)_ADxE_reauthSteps;
- (id)_ADxE_thirdParty_ESSO_firstPartSteps;
- (id)_ADxE_thirdParty_ESSO_secondPartSteps_default;
- (id)_ADxE_thirdParty_ESSO_secondPartSteps_orgToken;
- (id)_ADxE_thirdParty_firstPartSteps;
- (id)_ADxE_thirdParty_secondPartSteps_default;
- (id)_ADxE_thirdParty_secondPartSteps_orgToken;
- (id)_MDM_SharediPad_commonSteps;
- (id)_ORGO_MACBuddy_commonSteps;
- (id)_ORGO_MACBuddy_firstPartSteps;
- (id)_ORGO_MACBuddy_secondPartSteps;
- (id)_ORGO_MAIDEnrollmentSteps;
- (id)_ORGO_MAIDEnrollmentSteps_orgToken;
- (id)_ORGO_commonSteps;
- (id)_ORGO_deviceEnrollmentSteps;
- (id)_ORGO_pre_enrollment_steps;
- (id)_PDUE_UserEnrollment_commonSteps;
- (id)_Watch_deviceEnrollmentSteps;
- (id)_appNameWithBundleID:(id)a3;
- (id)_bundleIDsFromAppIDs:(id)a3;
- (id)_commonStepsForEnrollmentType:(unint64_t)a3 isReturnToService:(BOOL)a4;
- (id)_convertErrorToHumanReadableError:(id)a3;
- (id)_errorTranslation;
- (id)_findServerWithVersion:(id)a3 servers:(id)a4;
- (id)_guardAgainstConflictingAccountsWithUsername:(id)a3 altDSID:(id)a4;
- (id)_nameForStep:(unint64_t)a3;
- (id)_postEnrollmentSteps;
- (id)_readDirtyStateFromDisk;
- (id)_stepsWithUI;
- (id)_translatedErrorStringForError:(id)a3;
- (id)_trustedErrors;
- (id)enrollmentCompletionHandler;
- (unint64_t)devicePasscodeDataType;
- (unint64_t)enrollmentMethod;
- (unint64_t)enrollmentType;
- (unint64_t)serverInformationSource;
- (void)_addNotification;
- (void)_analyzeCloudConfig:(id)a3 enrollmentType:(unint64_t)a4 isReturnToService:(BOOL)a5 obliterationShelter:(id)a6;
- (void)_askForMDMUsernameAndCredential;
- (void)_askForPasscodeIfNeeded;
- (void)_askForRestoreChoiceWithMAID:(id)a3 personaID:(id)a4;
- (void)_askForUserConsentWithProfileData:(id)a3 managedAppleID:(id)a4 cloudConfig:(id)a5 isReturnToService:(BOOL)a6;
- (void)_askForUsernameWithDefaultUsername:(id)a3;
- (void)_authenticateMAID:(id)a3 authenticationResults:(id)a4 enrollmentType:(unint64_t)a5 personaID:(id)a6 ephemeral:(BOOL)a7 silent:(BOOL)a8 isRenewalFlow:(BOOL)a9;
- (void)_awaitESSOConfigActivationWithExtensionIdentifiers:(id)a3;
- (void)_chooseEnrollmentTypeWithAvailableServers:(id)a3 serverInformationSource:(unint64_t)a4;
- (void)_cleanupDirtyState:(id)a3;
- (void)_correlateMAIDWithAltDSID:(id)a3 withRMAccount:(id)a4 isProfileLocked:(BOOL)a5 organizationName:(id)a6 friendlyName:(id)a7 personaID:(id)a8;
- (void)_createEnterprisePersonaWithDevicePasscode:(id)a3 devicePasscodeData:(id)a4 devicePasscodeDataType:(unint64_t)a5;
- (void)_createRMAccountIfNeededWithSignInUserIdentifier:(id)a3 assignedMAID:(id)a4 existingRMAccountID:(id)a5 enrollmentType:(unint64_t)a6 enrollmentMethod:(unint64_t)a7 isRenewalFlow:(BOOL)a8;
- (void)_detectAuthTypeWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 isPostBuddy:(BOOL)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7;
- (void)_displayManagementDetailsOverviewWithProfileData:(id)a3 managedAppleID:(id)a4;
- (void)_enrollmentTypeAuthorizedBySDP:(unint64_t)a3 completion:(id)a4;
- (void)_ensureWiFiConnectionWithWiFiProfile:(id)a3;
- (void)_exchangeMAIDForBearerTokenWithRMAccountIdentifier:(id)a3 authParams:(id)a4 anchorCertificateRefs:(id)a5;
- (void)_fetchAppAttributesWithITunesItemID:(id)a3 completionHandler:(id)a4;
- (void)_fetchBundleIDsWithiTunesItemID:(id)a3 debuggingAppIDs:(id)a4 completionHandler:(id)a5;
- (void)_fetchCloudConfigWithEnrollmentType:(unint64_t)a3 isReturnToService:(BOOL)a4;
- (void)_fetchEnrollmentProfileFromServiceURL:(id)a3 authTokens:(id)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 enrollmentType:(unint64_t)a7 enrollmentMethod:(unint64_t)a8 isESSO:(BOOL)a9 essoAppITunesStoreID:(id)a10 isReturnToService:(BOOL)a11;
- (void)_fetchEnrollmentProfileFromServiceURL:(id)a3 username:(id)a4 password:(id)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7;
- (void)_fetchEnrollmentProfileFromWebURL:(id)a3 machineInfo:(id)a4 anchorCertificateRefs:(id)a5;
- (void)_fetchServerInformationWithUsername:(id)a3;
- (void)_flowTerminatedWithError:(id)a3 canceled:(BOOL)a4;
- (void)_installESSOConfigurationProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5;
- (void)_installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 isESSO:(BOOL)a7 essoAppITunesStoreID:(id)a8 essoConfigurationProfile:(id)a9 wifiProfileIdentifier:(id)a10 enrollmentType:(unint64_t)a11 isReturnToService:(BOOL)a12;
- (void)_installEnterpriseApplication:(id)a3 debuggingAppIDs:(id)a4 personaID:(id)a5;
- (void)_manageApplicationWithAppBundleID:(id)a3 essoDetails:(id)a4 organization:(id)a5 personaID:(id)a6;
- (void)_preflightEnrollmentWithEnrollmentType:(unint64_t)a3 isRenewalFlow:(BOOL)a4 isPostRestoration:(BOOL)a5 isPostBuddy:(BOOL)a6;
- (void)_processAuthServicesWithAuthParams:(id)a3 enrollmentMethod:(unint64_t)a4 username:(id)a5;
- (void)_promoteiCloudWithAltDSID:(id)a3;
- (void)_promptForSoftwareUpdateWithExpectedOSVersion:(id)a3 expectedBuildVersion:(id)a4;
- (void)_reauthenticationCompleteWithRMIdentifier:(id)a3;
- (void)_receivedApplicationWillTerminateNotification:(id)a3;
- (void)_requestiCloudSignInConfirmation;
- (void)_resetToInitialSteps;
- (void)_restoreSetAsideProfiles;
- (void)_signInMAIDWithAuthenticationResult:(id)a3 enrollmentType:(unint64_t)a4 personaID:(id)a5 isRenewalFlow:(BOOL)a6;
- (void)_startEnrollmentFlowWithType:(unint64_t)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6;
- (void)_storeCloudConfig:(id)a3;
- (void)_trackDirtyAppBundleIDs:(id)a3;
- (void)_unblockAppInstallsIfNecessaryWithCaller:(id)a3;
- (void)_unblockAppInstallsWithCaller:(id)a3;
- (void)_updateAccountsWithRMIdentifier:(id)a3 managedAppleID:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6 enrollmentURL:(id)a7 personaID:(id)a8;
- (void)_updateCredentialForAccount:(id)a3 authTokens:(id)a4;
- (void)_updateRMAccountWithIdentifier:(id)a3 authTokens:(id)a4 personaID:(id)a5;
- (void)_updateRMAccountWithIdentifier:(id)a3 authTokens:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6 personaID:(id)a7 enrollmentMethod:(unint64_t)a8;
- (void)_updateRMAccountWithIdentifier:(id)a3 authenticationResults:(id)a4 enrollmentMethod:(unint64_t)a5;
- (void)_waitForDeviceConfiguration;
- (void)_workerQueue_cleanupCachedValues;
- (void)_workerQueue_flowCompleted;
- (void)_workerQueue_performFlowStep:(unint64_t)a3;
- (void)_workerQueue_stopMonitorAndEmptyDiskValues;
- (void)_writeDirtyStateToDisk:(id)a3;
- (void)cleanUpDirtyState;
- (void)continueMacBuddyORGOEnrollmentFlowWithAuthenticationResults:(id)a3 serviceURL:(id)a4 bearerToken:(id)a5 profileData:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)reauthBYODEnrollmentFlowRestartIfFail:(BOOL)a3 rmAccountIdentifier:(id)a4 completionHandler:(id)a5;
- (void)renewORGOEnrollmentWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 cleanupIfFail:(BOOL)a6 completionHandler:(id)a7;
- (void)restartORGOEnrollmentWithServiceURL:(id)a3 anchorCertificates:(id)a4 isPostRestoration:(BOOL)a5 restartIfFail:(BOOL)a6 cleanupIfFail:(BOOL)a7 completionHandler:(id)a8;
- (void)setAltDSID:(id)a3;
- (void)setAnchorCertificateRefs:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setAuthParams:(id)a3;
- (void)setAuthTokens:(id)a3;
- (void)setAuthenticationResults:(id)a3;
- (void)setCleanupIfFail:(BOOL)a3;
- (void)setCloudConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevicePasscode:(id)a3;
- (void)setDevicePasscodeData:(id)a3;
- (void)setDevicePasscodeDataType:(unint64_t)a3;
- (void)setDirtyState:(id)a3;
- (void)setESSOConfigurationProfileIdentifier:(id)a3;
- (void)setEnrollmentCompletionHandler:(id)a3;
- (void)setEnrollmentMethod:(unint64_t)a3;
- (void)setEnrollmentType:(unint64_t)a3;
- (void)setEnrollmentURL:(id)a3;
- (void)setEssoAppITunesStoreID:(id)a3;
- (void)setEssoDetails:(id)a3;
- (void)setExpectedBuildVersion:(id)a3;
- (void)setExpectedOSVersion:(id)a3;
- (void)setExtensionIdentifiersFromConfig:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setHasExecutedUIStep:(BOOL)a3;
- (void)setIsPostBuddy:(BOOL)a3;
- (void)setIsPostRestoration:(BOOL)a3;
- (void)setIsProfileLocked:(BOOL)a3;
- (void)setIsRenewalFlow:(BOOL)a3;
- (void)setIsReturnToService:(BOOL)a3;
- (void)setManagedAppleID:(id)a3;
- (void)setManagedConfigurationHelper:(id)a3;
- (void)setNoCompletionScene:(BOOL)a3;
- (void)setObliterationShelter:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setRestartIfFail:(BOOL)a3;
- (void)setRmAccountIdentifier:(id)a3;
- (void)setServerCapabilities:(id)a3;
- (void)setServerInformationSource:(unint64_t)a3;
- (void)setServers:(id)a3;
- (void)setServiceDiscoveryHelper:(id)a3;
- (void)setServiceURL:(id)a3;
- (void)setUsername:(id)a3;
- (void)setWifiProfileIdentifier:(id)a3;
- (void)startBYODEnrollmentFlowRestartIfFail:(BOOL)a3 completionHandler:(id)a4;
- (void)startInBuddyEnrollmentFlowRestartIfFail:(BOOL)a3 completionHandler:(id)a4;
- (void)startMacBuddyORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6;
- (void)startORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6;
- (void)startPostBuddyORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6;
- (void)startUAORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6;
- (void)startWatchEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6;
- (void)terminateEnrollmentFlow;
- (void)updateMDMUserEnrollmentWithManagedAppleID:(id)a3 profileIdentifier:(id)a4 organizationName:(id)a5 personaID:(id)a6 completionHandler:(id)a7;
- (void)updateSharediPadUserChannelWithManagedAppleID:(id)a3 profileIdentifier:(id)a4 organizationName:(id)a5 enrollmentURL:(id)a6 completionHandler:(id)a7;
@end

@implementation DMCEnrollmentFlowController

+ (id)enrollmentFlowControllerWithPresenter:(id)a3 managedConfigurationHelper:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[DMCEnrollmentFlowController alloc] initWithPresenter:v6 managedConfigurationHelper:v5];

  return v7;
}

- (DMCEnrollmentFlowController)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentFlowController;
  result = [(DMCEnrollmentFlowControllerBase *)&v3 init];
  if (result) {
    result->_cleanupIfFail = 1;
  }
  return result;
}

- (DMCEnrollmentFlowController)initWithPresenter:(id)a3 managedConfigurationHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(DMCEnrollmentFlowController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    objc_storeStrong((id *)&v10->_managedConfigurationHelper, a4);
    [(DMCEnrollmentFlowController *)v10 _addNotification];
  }

  return v10;
}

- (void)_cleanupDirtyState:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225D9B000, v5, OS_LOG_TYPE_INFO, "Cleaning up dirty state...", buf, 2u);
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v6 = [v4 dirtyPersonaIDs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    char v10 = 0;
    uint64_t v11 = *(void *)v75;
    *(void *)&long long v8 = 138543362;
    long long v52 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v75 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v74 + 1) + 8 * i);
        v14 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v52;
          uint64_t v83 = v13;
          _os_log_impl(&dword_225D9B000, v14, OS_LOG_TYPE_INFO, "Removing dirty persona %{public}@...", buf, 0xCu);
        }
        id v73 = 0;
        objc_msgSend(MEMORY[0x263F38BB8], "removePersona:error:", v13, &v73, v52);
        id v15 = v73;
        if (!v15)
        {
          [v4 removeDirtyPersonaID:v13];
          char v10 = 1;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v16 = [v4 dirtyProfileIdentifiers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v70;
    *(void *)&long long v18 = 138543362;
    long long v53 = v18;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v69 + 1) + 8 * j);
        v23 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v53;
          uint64_t v83 = v22;
          _os_log_impl(&dword_225D9B000, v23, OS_LOG_TYPE_INFO, "Uninstalling MDM profile %{public}@...", buf, 0xCu);
        }
        v24 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
        [v24 removeProfileWithIdentifier:v22 async:1];

        [v4 removeDirtyProfileIdentifier:v22];
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v19);
    char v10 = 1;
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v25 = [v4 dirtyAltDISDs];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v65 objects:v80 count:16];
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v66;
    *(void *)&long long v27 = 138543362;
    long long v54 = v27;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v66 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * k);
        v32 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v54;
          uint64_t v83 = v31;
          _os_log_impl(&dword_225D9B000, v32, OS_LOG_TYPE_INFO, "Cleaning up dirty account with altDSID %{public}@...", buf, 0xCu);
        }
        v33 = objc_msgSend(MEMORY[0x263EFB210], "defaultStore", v54);
        objc_msgSend(v33, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:", v31, 1);

        [v4 removeDirtyAltDSID:v31];
      }
      uint64_t v28 = [v25 countByEnumeratingWithState:&v65 objects:v80 count:16];
    }
    while (v28);
    char v10 = 1;
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v34 = [v4 dirtyRMAccounts];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v62;
    *(void *)&long long v36 = 138543362;
    long long v55 = v36;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v34);
        }
        uint64_t v40 = *(void *)(*((void *)&v61 + 1) + 8 * m);
        v41 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v55;
          uint64_t v83 = v40;
          _os_log_impl(&dword_225D9B000, v41, OS_LOG_TYPE_INFO, "Cleaning up RM account with identifier %{public}@...", buf, 0xCu);
        }
        v42 = objc_msgSend(MEMORY[0x263EFB210], "defaultStore", v55);
        objc_msgSend(v42, "dmc_removeAccountWithIdentifier:asynchronous:", v40, 1);

        [v4 removeDirtyRMAccount:v40];
      }
      uint64_t v37 = [v34 countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v37);
    char v10 = 1;
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v43 = [v4 dirtyBundleIDs];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v57 objects:v78 count:16];
  if (v44)
  {
    uint64_t v46 = v44;
    uint64_t v47 = *(void *)v58;
    *(void *)&long long v45 = 138543362;
    long long v56 = v45;
    do
    {
      for (uint64_t n = 0; n != v46; ++n)
      {
        if (*(void *)v58 != v47) {
          objc_enumerationMutation(v43);
        }
        uint64_t v49 = *(void *)(*((void *)&v57 + 1) + 8 * n);
        v50 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v56;
          uint64_t v83 = v49;
          _os_log_impl(&dword_225D9B000, v50, OS_LOG_TYPE_INFO, "Cleaning up dirty application with bundle ID %{public}@...", buf, 0xCu);
        }
        v51 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
        [v51 removeApplicationWithBundleID:v49 completionHandler:0];

        [v4 removeDirtyBundleID:v49];
      }
      uint64_t v46 = [v43 countByEnumeratingWithState:&v57 objects:v78 count:16];
    }
    while (v46);

    goto LABEL_57;
  }

  if (v10) {
LABEL_57:
  }
    [(DMCEnrollmentFlowController *)self _writeDirtyStateToDisk:v4];
}

+ (id)enrollmentFlowController
{
  v2 = objc_opt_new();
  return v2;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v8 = "-[DMCEnrollmentFlowController dealloc]";
    _os_log_impl(&dword_225D9B000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  id v5 = NSStringFromSelector(a2);
  [(DMCEnrollmentFlowController *)self _unblockAppInstallsIfNecessaryWithCaller:v5];

  v6.receiver = self;
  v6.super_class = (Class)DMCEnrollmentFlowController;
  [(DMCEnrollmentFlowController *)&v6 dealloc];
}

- (DMCServiceDiscoveryHelper)serviceDiscoveryHelper
{
  serviceDiscoveryHelper = self->_serviceDiscoveryHelper;
  if (!serviceDiscoveryHelper)
  {
    id v4 = (DMCServiceDiscoveryHelper *)objc_opt_new();
    id v5 = self->_serviceDiscoveryHelper;
    self->_serviceDiscoveryHelper = v4;

    serviceDiscoveryHelper = self->_serviceDiscoveryHelper;
  }
  return serviceDiscoveryHelper;
}

- (DMCEnrollmentDirtyState)dirtyState
{
  dirtyState = self->_dirtyState;
  if (!dirtyState)
  {
    id v4 = [DMCEnrollmentDirtyState alloc];
    id v5 = [(DMCEnrollmentFlowController *)self _readDirtyStateFromDisk];
    objc_super v6 = [(DMCEnrollmentDirtyState *)v4 initWithDictionary:v5];
    uint64_t v7 = self->_dirtyState;
    self->_dirtyState = v6;

    dirtyState = self->_dirtyState;
  }
  return dirtyState;
}

- (DMCObliterationShelter)obliterationShelter
{
  obliterationShelter = self->_obliterationShelter;
  if (!obliterationShelter)
  {
    id v4 = (DMCObliterationShelter *)objc_opt_new();
    id v5 = self->_obliterationShelter;
    self->_obliterationShelter = v4;

    objc_super v6 = self->_obliterationShelter;
    uint64_t v8 = 0;
    [(DMCObliterationShelter *)v6 retrieveWithError:&v8];
    obliterationShelter = self->_obliterationShelter;
  }
  return obliterationShelter;
}

- (void)setEnrollmentType:(unint64_t)a3
{
  if (self->_enrollmentType != a3)
  {
    self->_enrollmentType = a3;
    id v5 = [(DMCEnrollmentFlowController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(DMCEnrollmentFlowController *)self delegate];
      [v7 enrollmentFlowController:self didUpdateEnrollmentType:a3];
    }
  }
}

+ (id)chooseServerFromUAORGOServers:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 count];
  id v7 = *(NSObject **)DMCLogObjects();
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v5 objectAtIndexedSubscript:0];
      *(_DWORD *)buf = 138543362;
      id v15 = v9;
      _os_log_impl(&dword_225D9B000, v8, OS_LOG_TYPE_DEBUG, "Chosen server: %{public}@", buf, 0xCu);
    }
    a4 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_ERROR, "Invalid servers list to choose from: no servers listed.", buf, 2u);
    }
    if (a4)
    {
      char v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F38A38];
      v12 = DMCErrorArray();
      objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v11, 15004, v12, 0, *MEMORY[0x263F38A40], 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (void)cleanUpDirtyState
{
  id v3 = [(DMCEnrollmentFlowController *)self dirtyState];
  [(DMCEnrollmentFlowController *)self _cleanupDirtyState:v3];
}

- (void)startInBuddyEnrollmentFlowRestartIfFail:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(DMCEnrollmentFlowController *)self _shouldDoReturnToService];
  uint64_t v8 = *(NSObject **)DMCLogObjects();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v8, OS_LOG_TYPE_DEFAULT, "Starting Return to Service Enrollment...", buf, 2u);
    }
    [(DMCEnrollmentFlowController *)self setIsReturnToService:1];
  }
  else if (v9)
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_225D9B000, v8, OS_LOG_TYPE_DEFAULT, "Starting in Buddy Enrollment...", v11, 2u);
  }
  if (v4) {
    uint64_t v10 = [(DMCEnrollmentFlowController *)self isReturnToService] ^ 1;
  }
  else {
    uint64_t v10 = 0;
  }
  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:9 anchorCertificates:0 restartIfFail:v10 completionHandler:v6];
}

- (void)startORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_DEFAULT, "Starting ORGO enrollment flow...", v14, 2u);
  }
  [(DMCEnrollmentFlowController *)self setServiceURL:v12];

  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:1 anchorCertificates:v11 restartIfFail:v6 completionHandler:v10];
}

- (void)startUAORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_DEFAULT, "Starting UAORGO enrollment flow...", v14, 2u);
  }
  [(DMCEnrollmentFlowController *)self setServiceURL:v12];

  [(DMCEnrollmentFlowController *)self setIsPostBuddy:1];
  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:3 anchorCertificates:v11 restartIfFail:v6 completionHandler:v10];
}

- (void)startPostBuddyORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  [(DMCEnrollmentFlowController *)self setServiceURL:a3];
  [(DMCEnrollmentFlowController *)self setIsPostBuddy:1];
  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:1 anchorCertificates:v11 restartIfFail:v6 completionHandler:v10];
}

- (void)startMacBuddyORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_DEFAULT, "Starting ORGO enrollment flow for MacBuddy...", v14, 2u);
  }
  [(DMCEnrollmentFlowController *)self setServiceURL:v12];

  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:2 anchorCertificates:v11 restartIfFail:v6 completionHandler:v10];
}

- (void)startWatchEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_DEFAULT, "Starting Watch enrollment flow...", v14, 2u);
  }
  [(DMCEnrollmentFlowController *)self setServiceURL:v12];

  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:8 anchorCertificates:v11 restartIfFail:v6 completionHandler:v10];
}

- (void)renewORGOEnrollmentWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 cleanupIfFail:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_DEFAULT, "Renewing ORGO enrollment flow...", v16, 2u);
  }
  [(DMCEnrollmentFlowController *)self setIsRenewalFlow:1];
  [(DMCEnrollmentFlowController *)self setCleanupIfFail:v7];
  [(DMCEnrollmentFlowController *)self setServiceURL:v14];

  [(DMCEnrollmentFlowController *)self setIsPostBuddy:1];
  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:1 anchorCertificates:v13 restartIfFail:v8 completionHandler:v12];
}

- (void)restartORGOEnrollmentWithServiceURL:(id)a3 anchorCertificates:(id)a4 isPostRestoration:(BOOL)a5 restartIfFail:(BOOL)a6 cleanupIfFail:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_225D9B000, v17, OS_LOG_TYPE_DEFAULT, "Restarting ORGO enrollment flow...", v18, 2u);
  }
  [(DMCEnrollmentFlowController *)self setIsRenewalFlow:1];
  [(DMCEnrollmentFlowController *)self setCleanupIfFail:v8];
  [(DMCEnrollmentFlowController *)self setServiceURL:v16];

  [(DMCEnrollmentFlowController *)self setIsPostRestoration:v10];
  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:1 anchorCertificates:v15 restartIfFail:v9 completionHandler:v14];
}

- (void)startBYODEnrollmentFlowRestartIfFail:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_DEFAULT, "Starting BYOD enrollment flow...", v8, 2u);
  }
  [(DMCEnrollmentFlowController *)self setIsPostBuddy:1];
  [(DMCEnrollmentFlowController *)self _startEnrollmentFlowWithType:4 anchorCertificates:0 restartIfFail:v4 completionHandler:v6];
}

- (void)continueMacBuddyORGOEnrollmentFlowWithAuthenticationResults:(id)a3 serviceURL:(id)a4 bearerToken:(id)a5 profileData:(id)a6 completionHandler:(id)a7
{
  v25[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  [(DMCEnrollmentFlowController *)self setEnrollmentType:2];
  [(DMCEnrollmentFlowController *)self setEnrollmentMethod:1];
  [(DMCEnrollmentFlowController *)self setEnrollmentCompletionHandler:v13];

  [(DMCEnrollmentFlowController *)self setRestartIfFail:0];
  [(DMCEnrollmentFlowController *)self setAuthenticationResults:v16];

  [(DMCEnrollmentFlowController *)self setServiceURL:v15];
  uint64_t v24 = *MEMORY[0x263F527B0];
  v25[0] = v12;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  [(DMCEnrollmentFlowController *)self setAuthTokens:v17];

  [(DMCEnrollmentFlowController *)self setProfileData:v14];
  long long v18 = [(DMCEnrollmentFlowController *)self profileData];
  id v23 = 0;
  LOBYTE(v16) = [(DMCEnrollmentFlowController *)self _extractAndVerifyPropertiesFromProfileData:v18 enrollmentMethod:[(DMCEnrollmentFlowController *)self enrollmentMethod] isESSO:0 essoAppITunesStoreID:0 error:&v23];
  id v19 = v23;

  if (v16)
  {
    uint64_t v20 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __144__DMCEnrollmentFlowController_continueMacBuddyORGOEnrollmentFlowWithAuthenticationResults_serviceURL_bearerToken_profileData_completionHandler___block_invoke;
    v22[3] = &unk_2647785B0;
    v22[4] = self;
    [v20 queueBlock:v22];

    v21 = [(DMCEnrollmentFlowController *)self _ORGO_MACBuddy_secondPartSteps];
    [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v21];

    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
  else
  {
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v19 canceled:0];
  }
}

void __144__DMCEnrollmentFlowController_continueMacBuddyORGOEnrollmentFlowWithAuthenticationResults_serviceURL_bearerToken_profileData_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stepQueue];
  [v1 removeAllObjects];
}

- (void)reauthBYODEnrollmentFlowRestartIfFail:(BOOL)a3 rmAccountIdentifier:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  v26[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225D9B000, v10, OS_LOG_TYPE_DEFAULT, "Re-authenticate BYOD", buf, 2u);
  }
  [(DMCEnrollmentFlowController *)self setCleanupIfFail:0];
  id v11 = [MEMORY[0x263EFB210] defaultStore];
  id v12 = objc_msgSend(v11, "dmc_remoteManagementAccountForIdentifier:", v8);

  if (v12)
  {
    id v13 = objc_msgSend(v12, "dmc_bearerReauthURL");
    if (v13)
    {
      id v14 = objc_msgSend(v12, "dmc_bearerReauthParams");
      if (!v14)
      {
        id v15 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_DEBUG, "Synthesizing re-authenticate parameters", buf, 2u);
        }
        v25[0] = *MEMORY[0x263F527A0];
        id v16 = [MEMORY[0x263F527F0] authenticationMethod];
        v25[1] = *MEMORY[0x263F527B8];
        v26[0] = v16;
        v26[1] = v13;
        id v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      }
      [(DMCEnrollmentFlowController *)self setEnrollmentType:4];
      -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", objc_msgSend(v12, "dmc_enrollmentMethod"));
      [(DMCEnrollmentFlowController *)self setEnrollmentCompletionHandler:v9];
      uint64_t v17 = objc_msgSend(v12, "dmc_personaIdentifier");
      [(DMCEnrollmentFlowController *)self setPersonaID:v17];

      [(DMCEnrollmentFlowController *)self setRmAccountIdentifier:v8];
      [(DMCEnrollmentFlowController *)self setRestartIfFail:v6];
      [(DMCEnrollmentFlowController *)self setAuthParams:v14];
      long long v18 = objc_msgSend(v12, "dmc_signInUserIdentifier");
      [(DMCEnrollmentFlowController *)self setUsername:v18];

      [(DMCEnrollmentFlowController *)self setNoCompletionScene:1];
      id v19 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __107__DMCEnrollmentFlowController_reauthBYODEnrollmentFlowRestartIfFail_rmAccountIdentifier_completionHandler___block_invoke;
      v23[3] = &unk_2647785B0;
      v23[4] = self;
      [v19 queueBlock:v23];

      uint64_t v20 = [(DMCEnrollmentFlowController *)self _ADxE_reauthSteps];
      [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v20];

      [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
    }
    else
    {
      uint64_t v22 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225D9B000, v22, OS_LOG_TYPE_ERROR, "Failed: RM account not set to re-authenticate", buf, 2u);
      }
      id v14 = +[DMCEnrollmentFlowController _createMissingRMAccountError];
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v14);
    }
  }
  else
  {
    v21 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v21, OS_LOG_TYPE_ERROR, "Failed: missing RM account to re-authenticate", buf, 2u);
    }
    id v13 = +[DMCEnrollmentFlowController _createMissingRMAccountError];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v13);
  }
}

void __107__DMCEnrollmentFlowController_reauthBYODEnrollmentFlowRestartIfFail_rmAccountIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stepQueue];
  [v1 removeAllObjects];
}

- (void)updateMDMUserEnrollmentWithManagedAppleID:(id)a3 profileIdentifier:(id)a4 organizationName:(id)a5 personaID:(id)a6 completionHandler:(id)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a5;
  uint64_t v17 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543874;
    id v19 = v12;
    __int16 v20 = 2114;
    id v21 = v13;
    __int16 v22 = 2114;
    id v23 = v14;
    _os_log_impl(&dword_225D9B000, v17, OS_LOG_TYPE_DEFAULT, "Update MDM User Enrollment managedAppleID: %{public}@, profileIdentifier: %{public}@, personaID: %{public}@", (uint8_t *)&v18, 0x20u);
  }
  [(DMCEnrollmentFlowController *)self setEnrollmentType:6];
  [(DMCEnrollmentFlowController *)self setEnrollmentMethod:4];
  [(DMCEnrollmentFlowController *)self setEnrollmentCompletionHandler:v15];

  [(DMCEnrollmentFlowController *)self setRestartIfFail:0];
  [(DMCEnrollmentFlowController *)self setManagedAppleID:v12];
  [(DMCEnrollmentFlowController *)self setProfileIdentifier:v13];
  [(DMCEnrollmentFlowController *)self setOrganizationName:v16];

  [(DMCEnrollmentFlowController *)self setPersonaID:v14];
  [(DMCEnrollmentFlowController *)self _resetToInitialSteps];
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

- (void)updateSharediPadUserChannelWithManagedAppleID:(id)a3 profileIdentifier:(id)a4 organizationName:(id)a5 enrollmentURL:(id)a6 completionHandler:(id)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544130;
    id v19 = v12;
    __int16 v20 = 2114;
    id v21 = v13;
    __int16 v22 = 2114;
    id v23 = v14;
    __int16 v24 = 2114;
    id v25 = v15;
    _os_log_impl(&dword_225D9B000, v17, OS_LOG_TYPE_DEFAULT, "Update Shared iPad User Channel managedAppleID: %{public}@, profileIdentifier: %{public}@, organizationName: %{public}@, enrollmentURL: %{public}@", (uint8_t *)&v18, 0x2Au);
  }
  [(DMCEnrollmentFlowController *)self setEnrollmentType:7];
  [(DMCEnrollmentFlowController *)self setEnrollmentMethod:3];
  [(DMCEnrollmentFlowController *)self setEnrollmentCompletionHandler:v16];

  [(DMCEnrollmentFlowController *)self setRestartIfFail:0];
  [(DMCEnrollmentFlowController *)self setManagedAppleID:v12];
  [(DMCEnrollmentFlowController *)self setProfileIdentifier:v13];
  [(DMCEnrollmentFlowController *)self setOrganizationName:v14];
  [(DMCEnrollmentFlowController *)self setEnrollmentURL:v15];
  [(DMCEnrollmentFlowController *)self _resetToInitialSteps];
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

- (void)terminateEnrollmentFlow
{
}

- (void)_startEnrollmentFlowWithType:(unint64_t)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  [(DMCEnrollmentFlowController *)self setEnrollmentType:a3];
  [(DMCEnrollmentFlowController *)self setEnrollmentCompletionHandler:v11];
  if (a3 - 1 >= 6 && a3 - 8 > 1)
  {
    id v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a3;
      _os_log_impl(&dword_225D9B000, v12, OS_LOG_TYPE_ERROR, "Failed: %lu feature is not supported", (uint8_t *)location, 0xCu);
    }
    id v13 = +[DMCEnrollmentFlowController _createUnsupportedFeatureError];
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v13 canceled:0];
  }
  else
  {
    objc_initWeak(location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __111__DMCEnrollmentFlowController__startEnrollmentFlowWithType_anchorCertificates_restartIfFail_completionHandler___block_invoke;
    v14[3] = &unk_2647785D8;
    objc_copyWeak(v16, location);
    v16[1] = (id)a3;
    BOOL v17 = a5;
    id v15 = v10;
    [(DMCEnrollmentFlowController *)self _enrollmentTypeAuthorizedBySDP:a3 completion:v14];

    objc_destroyWeak(v16);
    objc_destroyWeak(location);
  }
}

void __111__DMCEnrollmentFlowController__startEnrollmentFlowWithType_anchorCertificates_restartIfFail_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      BOOL v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v10 = 134217984;
        uint64_t v11 = v7;
        _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_ERROR, "Failed: %lu feature is not supported while SDP is unauthorized", (uint8_t *)&v10, 0xCu);
      }
      id v8 = [(id)objc_opt_class() _createEnrollmentNotAllowedDuringSDPError];
      [v5 _flowTerminatedWithError:v8 canceled:1];
    }
    else
    {
      [WeakRetained setRestartIfFail:*(unsigned __int8 *)(a1 + 56)];
      id v9 = certificatesFromDERCertificateDataArray();
      [v5 setAnchorCertificateRefs:v9];

      [v5 _resetToInitialSteps];
      [v5 _pollNextStep];
    }
  }
}

- (void)_workerQueue_performFlowStep:(unint64_t)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    uint64_t v7 = [(DMCEnrollmentFlowController *)self _nameForStep:a3];
    *(_DWORD *)buf = 138543362;
    long long v74 = v7;
    _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_DEFAULT, "Will perform enrollment step: %{public}@", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [MEMORY[0x263F38BB8] currentPersonaID];
    id v9 = [MEMORY[0x263F38BB8] currentPersonaTypeString];
    *(_DWORD *)buf = 136315906;
    long long v74 = "-[DMCEnrollmentFlowController _workerQueue_performFlowStep:]";
    __int16 v75 = 1024;
    int v76 = 386;
    __int16 v77 = 2114;
    v78 = v8;
    __int16 v79 = 2114;
    v80 = v9;
    _os_log_impl(&dword_225D9B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);
  }
  [(DMCEnrollmentFlowControllerBase *)self setCurrentStep:a3];
  int v10 = [(DMCEnrollmentFlowController *)self _stepsWithUI];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
  int v12 = [v10 containsObject:v11];

  if (v12) {
    [(DMCEnrollmentFlowController *)self setHasExecutedUIStep:1];
  }
  id v13 = [(DMCEnrollmentFlowController *)self _postEnrollmentSteps];
  id v14 = [NSNumber numberWithUnsignedInteger:a3];
  int v15 = [v13 containsObject:v14];

  if (v15)
  {
    id v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v16, OS_LOG_TYPE_DEFAULT, "The core part of the enrollment flow is done. Cleaning up disk values...", buf, 2u);
    }
    [(DMCEnrollmentFlowController *)self _workerQueue_stopMonitorAndEmptyDiskValues];
  }
  switch(a3)
  {
    case 0uLL:
      [(DMCEnrollmentFlowController *)self _preflightEnrollmentWithEnrollmentType:[(DMCEnrollmentFlowController *)self enrollmentType] isRenewalFlow:[(DMCEnrollmentFlowController *)self isRenewalFlow] isPostRestoration:[(DMCEnrollmentFlowController *)self isPostRestoration] isPostBuddy:[(DMCEnrollmentFlowController *)self isPostBuddy]];
      return;
    case 1uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self username];
      [(DMCEnrollmentFlowController *)self _askForUsernameWithDefaultUsername:v17];
      goto LABEL_62;
    case 2uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self username];
      [(DMCEnrollmentFlowController *)self _fetchServerInformationWithUsername:v17];
      goto LABEL_62;
    case 3uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self servers];
      [(DMCEnrollmentFlowController *)self _chooseEnrollmentTypeWithAvailableServers:v17 serverInformationSource:[(DMCEnrollmentFlowController *)self serverInformationSource]];
      goto LABEL_62;
    case 4uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self serviceURL];
      unint64_t v18 = [(DMCEnrollmentFlowController *)self enrollmentType];
      BOOL v19 = [(DMCEnrollmentFlowController *)self isPostBuddy];
      __int16 v20 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      id v21 = objc_msgSend(v20, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), 0);
      __int16 v22 = [(DMCEnrollmentFlowController *)self anchorCertificateRefs];
      [(DMCEnrollmentFlowController *)self _detectAuthTypeWithServiceURL:v17 enrollmentType:v18 isPostBuddy:v19 machineInfo:v21 anchorCertificateRefs:v22];

      goto LABEL_53;
    case 5uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self essoDetails];
      id v23 = [v17 configurationProfile];
      __int16 v24 = [(DMCEnrollmentFlowController *)self devicePasscode];
      id v25 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _installESSOConfigurationProfile:v23 devicePasscode:v24 personaID:v25];
      goto LABEL_59;
    case 6uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self essoDetails];
      id v23 = [v17 iTunesStoreID];
      __int16 v24 = [(DMCEnrollmentFlowController *)self essoDetails];
      id v25 = [v24 appIDs];
      uint64_t v26 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _installEnterpriseApplication:v23 debuggingAppIDs:v25 personaID:v26];
      goto LABEL_58;
    case 7uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self extensionIdentifiersFromConfig];
      [(DMCEnrollmentFlowController *)self _awaitESSOConfigActivationWithExtensionIdentifiers:v17];
      goto LABEL_62;
    case 8uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self authParams];
      unint64_t v27 = [(DMCEnrollmentFlowController *)self enrollmentMethod];
      uint64_t v28 = [(DMCEnrollmentFlowController *)self username];
      [(DMCEnrollmentFlowController *)self _processAuthServicesWithAuthParams:v17 enrollmentMethod:v27 username:v28];
      goto LABEL_28;
    case 9uLL:
      [(DMCEnrollmentFlowController *)self _askForPasscodeIfNeeded];
      return;
    case 0xAuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self devicePasscode];
      id v23 = [(DMCEnrollmentFlowController *)self devicePasscodeData];
      [(DMCEnrollmentFlowController *)self _createEnterprisePersonaWithDevicePasscode:v17 devicePasscodeData:v23 devicePasscodeDataType:[(DMCEnrollmentFlowController *)self devicePasscodeDataType]];
      goto LABEL_61;
    case 0xBuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self managedAppleID];
      unint64_t v29 = [(DMCEnrollmentFlowController *)self enrollmentType];
      uint64_t v28 = [(DMCEnrollmentFlowController *)self personaID];
      LOBYTE(v68) = [(DMCEnrollmentFlowController *)self isRenewalFlow];
      v30 = self;
      uint64_t v31 = v17;
      unint64_t v32 = v29;
      v33 = v28;
      uint64_t v34 = 0;
      goto LABEL_25;
    case 0xCuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self managedAppleID];
      unint64_t v35 = [(DMCEnrollmentFlowController *)self enrollmentType];
      uint64_t v28 = [(DMCEnrollmentFlowController *)self personaID];
      LOBYTE(v68) = [(DMCEnrollmentFlowController *)self isRenewalFlow];
      v30 = self;
      uint64_t v31 = v17;
      unint64_t v32 = v35;
      v33 = v28;
      uint64_t v34 = 1;
LABEL_25:
      [(DMCEnrollmentFlowController *)v30 _authenticateMAID:v31 authenticationResults:0 enrollmentType:v32 personaID:v33 ephemeral:v34 silent:0 isRenewalFlow:v68];
      goto LABEL_28;
    case 0xDuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self managedAppleID];
      id v23 = [(DMCEnrollmentFlowController *)self authenticationResults];
      unint64_t v36 = [(DMCEnrollmentFlowController *)self enrollmentType];
      uint64_t v37 = [(DMCEnrollmentFlowController *)self personaID];
      LOBYTE(v68) = [(DMCEnrollmentFlowController *)self isRenewalFlow];
      [(DMCEnrollmentFlowController *)self _authenticateMAID:v17 authenticationResults:v23 enrollmentType:v36 personaID:v37 ephemeral:0 silent:1 isRenewalFlow:v68];
      goto LABEL_38;
    case 0xEuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self authenticationResults];
      unint64_t v38 = [(DMCEnrollmentFlowController *)self enrollmentType];
      uint64_t v28 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _signInMAIDWithAuthenticationResult:v17 enrollmentType:v38 personaID:v28 isRenewalFlow:[(DMCEnrollmentFlowController *)self isRenewalFlow]];
LABEL_28:

      goto LABEL_62;
    case 0xFuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self username];
      id v23 = [(DMCEnrollmentFlowController *)self managedAppleID];
      __int16 v24 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      [(DMCEnrollmentFlowController *)self _createRMAccountIfNeededWithSignInUserIdentifier:v17 assignedMAID:v23 existingRMAccountID:v24 enrollmentType:[(DMCEnrollmentFlowController *)self enrollmentType] enrollmentMethod:[(DMCEnrollmentFlowController *)self enrollmentMethod] isRenewalFlow:[(DMCEnrollmentFlowController *)self isRenewalFlow]];
      goto LABEL_60;
    case 0x10uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      id v23 = [(DMCEnrollmentFlowController *)self authParams];
      __int16 v24 = [(DMCEnrollmentFlowController *)self anchorCertificateRefs];
      [(DMCEnrollmentFlowController *)self _exchangeMAIDForBearerTokenWithRMAccountIdentifier:v17 authParams:v23 anchorCertificateRefs:v24];
      goto LABEL_60;
    case 0x11uLL:
      uint64_t v71 = [(DMCEnrollmentFlowController *)self serviceURL];
      v39 = [(DMCEnrollmentFlowController *)self authTokens];
      uint64_t v40 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      v41 = objc_msgSend(v40, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      v42 = [(DMCEnrollmentFlowController *)self anchorCertificateRefs];
      unint64_t v43 = [(DMCEnrollmentFlowController *)self enrollmentType];
      unint64_t v44 = [(DMCEnrollmentFlowController *)self enrollmentMethod];
      long long v45 = [(DMCEnrollmentFlowController *)self essoDetails];
      uint64_t v46 = [(DMCEnrollmentFlowController *)self essoAppITunesStoreID];
      LOBYTE(v69) = [(DMCEnrollmentFlowController *)self isReturnToService];
      LOBYTE(v68) = v45 != 0;
      uint64_t v47 = self;
      v48 = (void *)v71;
      [(DMCEnrollmentFlowController *)v47 _fetchEnrollmentProfileFromServiceURL:v71 authTokens:v39 machineInfo:v41 anchorCertificateRefs:v42 enrollmentType:v43 enrollmentMethod:v44 isESSO:v68 essoAppITunesStoreID:v46 isReturnToService:v69];

      goto LABEL_40;
    case 0x12uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self profileData];
      id v23 = [(DMCEnrollmentFlowController *)self managedAppleID];
      __int16 v24 = [(DMCEnrollmentFlowController *)self cloudConfig];
      [(DMCEnrollmentFlowController *)self _askForUserConsentWithProfileData:v17 managedAppleID:v23 cloudConfig:v24 isReturnToService:[(DMCEnrollmentFlowController *)self isReturnToService]];
      goto LABEL_60;
    case 0x13uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self profileData];
      id v23 = [(DMCEnrollmentFlowController *)self managedAppleID];
      [(DMCEnrollmentFlowController *)self _displayManagementDetailsOverviewWithProfileData:v17 managedAppleID:v23];
      goto LABEL_61;
    case 0x14uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      id v23 = [(DMCEnrollmentFlowController *)self authenticationResults];
      [(DMCEnrollmentFlowController *)self _updateRMAccountWithIdentifier:v17 authenticationResults:v23 enrollmentMethod:[(DMCEnrollmentFlowController *)self enrollmentMethod]];
      goto LABEL_61;
    case 0x15uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      id v23 = [(DMCEnrollmentFlowController *)self authTokens];
      __int16 v24 = [(DMCEnrollmentFlowController *)self profileIdentifier];
      id v25 = [(DMCEnrollmentFlowController *)self organizationName];
      uint64_t v26 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _updateRMAccountWithIdentifier:v17 authTokens:v23 profileIdentifier:v24 organizationName:v25 personaID:v26 enrollmentMethod:[(DMCEnrollmentFlowController *)self enrollmentMethod]];
      goto LABEL_58;
    case 0x16uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      id v23 = [(DMCEnrollmentFlowController *)self authTokens];
      __int16 v24 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _updateRMAccountWithIdentifier:v17 authTokens:v23 personaID:v24];
      goto LABEL_60;
    case 0x17uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self altDSID];
      id v23 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      BOOL v49 = [(DMCEnrollmentFlowController *)self isProfileLocked];
      uint64_t v37 = [(DMCEnrollmentFlowController *)self organizationName];
      v50 = [(DMCEnrollmentFlowController *)self friendlyName];
      v51 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _correlateMAIDWithAltDSID:v17 withRMAccount:v23 isProfileLocked:v49 organizationName:v37 friendlyName:v50 personaID:v51];

LABEL_38:
      goto LABEL_61;
    case 0x18uLL:
      uint64_t v72 = [(DMCEnrollmentFlowController *)self profileData];
      v39 = [(DMCEnrollmentFlowController *)self devicePasscode];
      uint64_t v40 = [(DMCEnrollmentFlowController *)self personaID];
      v41 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      v42 = [(DMCEnrollmentFlowController *)self essoDetails];
      long long v52 = [(DMCEnrollmentFlowController *)self essoAppITunesStoreID];
      long long v53 = [(DMCEnrollmentFlowController *)self ESSOConfigurationProfileIdentifier];
      long long v54 = [(DMCEnrollmentFlowController *)self wifiProfileIdentifier];
      unint64_t v55 = [(DMCEnrollmentFlowController *)self enrollmentType];
      LOBYTE(v70) = [(DMCEnrollmentFlowController *)self isReturnToService];
      long long v56 = self;
      v48 = (void *)v72;
      [(DMCEnrollmentFlowController *)v56 _installEnrollmentProfile:v72 devicePasscode:v39 personaID:v40 rmAccountIdentifier:v41 isESSO:v42 != 0 essoAppITunesStoreID:v52 essoConfigurationProfile:v53 wifiProfileIdentifier:v54 enrollmentType:v55 isReturnToService:v70];

LABEL_40:
      return;
    case 0x19uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self appBundleID];
      id v23 = [(DMCEnrollmentFlowController *)self essoDetails];
      __int16 v24 = [(DMCEnrollmentFlowController *)self organizationName];
      id v25 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _manageApplicationWithAppBundleID:v17 essoDetails:v23 organization:v24 personaID:v25];
      goto LABEL_59;
    case 0x1AuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      id v23 = [(DMCEnrollmentFlowController *)self managedAppleID];
      __int16 v24 = [(DMCEnrollmentFlowController *)self profileIdentifier];
      id v25 = [(DMCEnrollmentFlowController *)self organizationName];
      uint64_t v26 = [(DMCEnrollmentFlowController *)self personaID];
      long long v57 = self;
      long long v58 = v17;
      long long v59 = v23;
      long long v60 = v24;
      long long v61 = v25;
      long long v62 = 0;
      long long v63 = v26;
      goto LABEL_47;
    case 0x1BuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      [(DMCEnrollmentFlowController *)self _reauthenticationCompleteWithRMIdentifier:v17];
      goto LABEL_62;
    case 0x1CuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self altDSID];
      [(DMCEnrollmentFlowController *)self _promoteiCloudWithAltDSID:v17];
      goto LABEL_62;
    case 0x1DuLL:
      [(DMCEnrollmentFlowController *)self _requestiCloudSignInConfirmation];
      return;
    case 0x1EuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self rmAccountIdentifier];
      id v23 = [(DMCEnrollmentFlowController *)self managedAppleID];
      __int16 v24 = [(DMCEnrollmentFlowController *)self profileIdentifier];
      id v25 = [(DMCEnrollmentFlowController *)self organizationName];
      uint64_t v26 = [(DMCEnrollmentFlowController *)self enrollmentURL];
      long long v57 = self;
      long long v58 = v17;
      long long v59 = v23;
      long long v60 = v24;
      long long v61 = v25;
      long long v62 = v26;
      long long v63 = 0;
LABEL_47:
      [(DMCEnrollmentFlowController *)v57 _updateAccountsWithRMIdentifier:v58 managedAppleID:v59 profileIdentifier:v60 organizationName:v61 enrollmentURL:v62 personaID:v63];
      goto LABEL_58;
    case 0x1FuLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self managedAppleID];
      id v23 = [(DMCEnrollmentFlowController *)self personaID];
      [(DMCEnrollmentFlowController *)self _askForRestoreChoiceWithMAID:v17 personaID:v23];
      goto LABEL_61;
    case 0x20uLL:
      [(DMCEnrollmentFlowController *)self _restoreSetAsideProfiles];
      return;
    case 0x21uLL:
      [(DMCEnrollmentFlowController *)self _fetchCloudConfigWithEnrollmentType:[(DMCEnrollmentFlowController *)self enrollmentType] isReturnToService:[(DMCEnrollmentFlowController *)self isReturnToService]];
      return;
    case 0x22uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self cloudConfig];
      [(DMCEnrollmentFlowController *)self _storeCloudConfig:v17];
      goto LABEL_62;
    case 0x23uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self cloudConfig];
      unint64_t v64 = [(DMCEnrollmentFlowController *)self enrollmentType];
      BOOL v65 = [(DMCEnrollmentFlowController *)self isReturnToService];
      __int16 v20 = [(DMCEnrollmentFlowController *)self obliterationShelter];
      [(DMCEnrollmentFlowController *)self _analyzeCloudConfig:v17 enrollmentType:v64 isReturnToService:v65 obliterationShelter:v20];
LABEL_53:

      goto LABEL_62;
    case 0x24uLL:
      [(DMCEnrollmentFlowController *)self _askForMDMUsernameAndCredential];
      return;
    case 0x25uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self serviceURL];
      id v23 = [(DMCEnrollmentFlowController *)self username];
      __int16 v24 = [(DMCEnrollmentFlowController *)self password];
      id v25 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      uint64_t v26 = objc_msgSend(v25, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      long long v66 = [(DMCEnrollmentFlowController *)self anchorCertificateRefs];
      [(DMCEnrollmentFlowController *)self _fetchEnrollmentProfileFromServiceURL:v17 username:v23 password:v24 machineInfo:v26 anchorCertificateRefs:v66];
      goto LABEL_57;
    case 0x26uLL:
      long long v67 = NSURL;
      BOOL v17 = [(DMCEnrollmentFlowController *)self cloudConfig];
      id v23 = [v17 objectForKeyedSubscript:*MEMORY[0x263F52890]];
      __int16 v24 = [v67 URLWithString:v23];
      id v25 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      uint64_t v26 = objc_msgSend(v25, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      long long v66 = [(DMCEnrollmentFlowController *)self anchorCertificateRefs];
      [(DMCEnrollmentFlowController *)self _fetchEnrollmentProfileFromWebURL:v24 machineInfo:v26 anchorCertificateRefs:v66];
LABEL_57:

LABEL_58:
LABEL_59:

LABEL_60:
      goto LABEL_61;
    case 0x27uLL:
      [(DMCEnrollmentFlowController *)self _waitForDeviceConfiguration];
      return;
    case 0x28uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self expectedOSVersion];
      id v23 = [(DMCEnrollmentFlowController *)self expectedBuildVersion];
      [(DMCEnrollmentFlowController *)self _promptForSoftwareUpdateWithExpectedOSVersion:v17 expectedBuildVersion:v23];
      goto LABEL_61;
    case 0x29uLL:
      BOOL v17 = [(DMCEnrollmentFlowController *)self obliterationShelter];
      id v23 = [v17 wifiProfileData];
      [(DMCEnrollmentFlowController *)self _ensureWiFiConnectionWithWiFiProfile:v23];
LABEL_61:

LABEL_62:
      break;
    default:
      return;
  }
}

- (void)_resetToInitialSteps
{
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentFlowController;
  [(DMCEnrollmentFlowControllerBase *)&v4 _resetToInitialSteps];
  id v3 = [(DMCEnrollmentFlowController *)self _commonStepsForEnrollmentType:[(DMCEnrollmentFlowController *)self enrollmentType] isReturnToService:[(DMCEnrollmentFlowController *)self isReturnToService]];
  [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v3];
}

- (void)_workerQueue_stopMonitorAndEmptyDiskValues
{
  id v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_225D9B000, v3, OS_LOG_TYPE_DEFAULT, "Clean up local stored stuffs", v7, 2u);
  }
  objc_super v4 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    [v6 stopEnrollmentFlowMonitor];
  }
  [(DMCEnrollmentFlowController *)self _writeDirtyStateToDisk:0];
}

- (void)_workerQueue_flowCompleted
{
  objc_super v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl(&dword_225D9B000, v4, OS_LOG_TYPE_DEFAULT, "Enrollment flow completed!", v10, 2u);
  }
  if ([(DMCEnrollmentFlowController *)self isReturnToService])
  {
    char v5 = [(DMCEnrollmentFlowController *)self obliterationShelter];
    [v5 clear];
  }
  [(DMCEnrollmentFlowController *)self _workerQueue_stopMonitorAndEmptyDiskValues];
  [(DMCEnrollmentFlowController *)self _workerQueue_cleanupCachedValues];
  if (![(DMCEnrollmentFlowController *)self noCompletionScene])
  {
    BOOL v6 = [(DMCEnrollmentFlowController *)self presenter];
    [v6 showEnrollmentCompletionScene];
  }
  uint64_t v7 = NSStringFromSelector(a2);
  [(DMCEnrollmentFlowController *)self _unblockAppInstallsIfNecessaryWithCaller:v7];

  id v8 = [(DMCEnrollmentFlowController *)self enrollmentCompletionHandler];

  if (v8)
  {
    id v9 = [(DMCEnrollmentFlowController *)self enrollmentCompletionHandler];
    v9[2](v9, 1, 0, 0);

    [(DMCEnrollmentFlowController *)self setEnrollmentCompletionHandler:0];
  }
}

- (void)_flowTerminatedWithError:(id)a3 canceled:(BOOL)a4
{
  id v7 = a3;
  id v8 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__DMCEnrollmentFlowController__flowTerminatedWithError_canceled___block_invoke;
  v10[3] = &unk_264778600;
  BOOL v14 = a4;
  id v11 = v7;
  int v12 = self;
  SEL v13 = a2;
  id v9 = v7;
  [v8 queueBlock:v10];
}

void __65__DMCEnrollmentFlowController__flowTerminatedWithError_canceled___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 56);
    int v22 = 138543618;
    uint64_t v23 = v3;
    __int16 v24 = 1024;
    int v25 = v4;
    _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_DEFAULT, "Enrollment flow terminated with error: %{public}@, canceled: %d", (uint8_t *)&v22, 0x12u);
  }
  if ([*(id *)(a1 + 40) hasExecutedUIStep] && *(void *)(a1 + 32)) {
    int v5 = [*(id *)(a1 + 40) restartIfFail];
  }
  else {
    int v5 = 0;
  }
  int v6 = [*(id *)(a1 + 40) cleanupIfFail];
  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    id v8 = [*(id *)(a1 + 40) dirtyState];
    [v7 _cleanupDirtyState:v8];
  }
  else
  {
    [*(id *)(a1 + 40) _writeDirtyStateToDisk:0];
  }
  if ([*(id *)(a1 + 40) isReturnToService])
  {
    id v9 = [*(id *)(a1 + 40) obliterationShelter];
    [v9 clear];
  }
  objc_msgSend(*(id *)(a1 + 40), "_workerQueue_cleanupCachedValues");
  int v10 = [*(id *)(a1 + 40) managedConfigurationHelper];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [*(id *)(a1 + 40) managedConfigurationHelper];
    [v12 stopEnrollmentFlowMonitor];
  }
  if (*(unsigned char *)(a1 + 56)
    || *(void *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "_convertErrorToHumanReadableError:"),
        __int16 v20 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 40) presenter],
        id v21 = objc_claimAutoreleasedReturnValue(),
        [v21 showEnrollmentFailure:v20],
        v21,
        v20,
        *(unsigned char *)(a1 + 56)))
  {
    SEL v13 = [*(id *)(a1 + 40) presenter];
    if (objc_opt_respondsToSelector())
    {
      char v14 = [*(id *)(a1 + 40) noCompletionScene];

      if (v14) {
        goto LABEL_19;
      }
      SEL v13 = [*(id *)(a1 + 40) presenter];
      [v13 dismissEnrollmentScene];
    }
  }
LABEL_19:
  int v15 = *(void **)(a1 + 40);
  id v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [v15 _unblockAppInstallsIfNecessaryWithCaller:v16];

  BOOL v17 = *(void **)(a1 + 40);
  if (v5)
  {
    [v17 _resetToInitialSteps];
    [*(id *)(a1 + 40) _pollNextStep];
  }
  else
  {
    unint64_t v18 = [v17 enrollmentCompletionHandler];

    if (v18)
    {
      BOOL v19 = [*(id *)(a1 + 40) enrollmentCompletionHandler];
      v19[2](v19, 0, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));

      [*(id *)(a1 + 40) setEnrollmentCompletionHandler:0];
    }
  }
}

- (void)_workerQueue_cleanupCachedValues
{
  [(DMCEnrollmentFlowControllerBase *)self setNextStepIndex:0];
  [(DMCEnrollmentFlowController *)self setDevicePasscode:0];
  [(DMCEnrollmentFlowController *)self setDevicePasscodeData:0];
  [(DMCEnrollmentFlowController *)self setManagedAppleID:0];
  [(DMCEnrollmentFlowController *)self setServiceURL:0];
  [(DMCEnrollmentFlowController *)self setServers:0];
  [(DMCEnrollmentFlowController *)self setServerInformationSource:0];
  [(DMCEnrollmentFlowController *)self setAuthTokens:0];
  [(DMCEnrollmentFlowController *)self setPersonaID:0];
  [(DMCEnrollmentFlowController *)self setAuthenticationResults:0];
  [(DMCEnrollmentFlowController *)self setAltDSID:0];
  [(DMCEnrollmentFlowController *)self setProfileData:0];
  [(DMCEnrollmentFlowController *)self setProfileIdentifier:0];
  [(DMCEnrollmentFlowController *)self setRmAccountIdentifier:0];
  [(DMCEnrollmentFlowController *)self setAnchorCertificateRefs:0];
  [(DMCEnrollmentFlowController *)self setAuthParams:0];
  [(DMCEnrollmentFlowController *)self setHasExecutedUIStep:0];
  [(DMCEnrollmentFlowController *)self setEnrollmentMethod:0];
  [(DMCEnrollmentFlowController *)self setDirtyState:0];
  [(DMCEnrollmentFlowController *)self setOrganizationName:0];
  [(DMCEnrollmentFlowController *)self setFriendlyName:0];
  [(DMCEnrollmentFlowController *)self setEssoDetails:0];
  [(DMCEnrollmentFlowController *)self setAppBundleID:0];
  [(DMCEnrollmentFlowController *)self setESSOConfigurationProfileIdentifier:0];
  [(DMCEnrollmentFlowController *)self setServerCapabilities:0];
  [(DMCEnrollmentFlowController *)self setEssoAppITunesStoreID:0];
  [(DMCEnrollmentFlowController *)self setCloudConfig:0];
  [(DMCEnrollmentFlowController *)self setPassword:0];
  [(DMCEnrollmentFlowController *)self setWifiProfileIdentifier:0];
  [(DMCEnrollmentFlowController *)self setExpectedOSVersion:0];
  [(DMCEnrollmentFlowController *)self setExpectedBuildVersion:0];
  [(DMCEnrollmentFlowController *)self setIsReturnToService:0];
  [(DMCEnrollmentFlowController *)self setObliterationShelter:0];
  [(DMCEnrollmentFlowController *)self setExtensionIdentifiersFromConfig:0];
}

- (void)_preflightEnrollmentWithEnrollmentType:(unint64_t)a3 isRenewalFlow:(BOOL)a4 isPostRestoration:(BOOL)a5 isPostBuddy:(BOOL)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    char v11 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    if (objc_opt_respondsToSelector())
    {
      int v12 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      int v13 = [v12 isDeviceMDMEnrolled];

      if (v13
        && (a6
         || ![(DMCEnrollmentFlowController *)self _canSkipMDMEnrollmentWithEnrollmentType:a3]))
      {
        char v14 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225D9B000, v14, OS_LOG_TYPE_ERROR, "The device is enrolled in MDM already! Aborting...", buf, 2u);
        }
        int v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = *MEMORY[0x263F38A38];
        BOOL v17 = DMCErrorArray();
        uint64_t v18 = *MEMORY[0x263F38A40];
        BOOL v19 = v15;
        uint64_t v20 = v16;
        uint64_t v21 = 15010;
LABEL_16:
        uint64_t v28 = objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, v21, v17, v18, 0);
        [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v28 canceled:0];

        return;
      }
    }
    else
    {
    }
  }
  if (a3 == 4)
  {
    int v22 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v23 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      int v24 = [v23 isDeviceSupervised];

      if (v24)
      {
        int v25 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225D9B000, v25, OS_LOG_TYPE_ERROR, "Trying to start BYOD enrollment on a supervised device!", buf, 2u);
        }
        uint64_t v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F38A38];
        BOOL v17 = DMCErrorArray();
        uint64_t v18 = *MEMORY[0x263F38A40];
        BOOL v19 = v26;
        uint64_t v20 = v27;
        uint64_t v21 = 15012;
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  unint64_t v29 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_21;
  }
  v30 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  char v31 = [v30 isDeviceMDMEnrolled];

  if ((v31 & 1) == 0)
  {
    unint64_t v29 = [(DMCEnrollmentFlowController *)self dirtyState];
    [(DMCEnrollmentFlowController *)self _cleanupDirtyState:v29];
LABEL_21:
  }
  if (!v7 || ![(DMCEnrollmentFlowController *)self _isORGOEnrollment:a3]) {
    goto LABEL_46;
  }
  unint64_t v32 = [MEMORY[0x263EFB210] defaultStore];
  v33 = objc_msgSend(v32, "dmc_visibleRemoteManagementAccounts");

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v51;
LABEL_26:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v51 != v37) {
        objc_enumerationMutation(v34);
      }
      v39 = *(void **)(*((void *)&v50 + 1) + 8 * v38);
      if (-[DMCEnrollmentFlowController _isORGOEnrollment:](self, "_isORGOEnrollment:", objc_msgSend(v39, "dmc_enrollmentType")))
      {
        break;
      }
      if (v36 == ++v38)
      {
        uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v36) {
          goto LABEL_26;
        }
        goto LABEL_32;
      }
    }
    id v40 = v39;

    if (!v40) {
      goto LABEL_37;
    }
    v41 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v55 = v40;
      _os_log_impl(&dword_225D9B000, v41, OS_LOG_TYPE_ERROR, "Have existing RM Account: %{public}@!", buf, 0xCu);
    }
    v42 = [v40 identifier];
    [(DMCEnrollmentFlowController *)self setRmAccountIdentifier:v42];

    unint64_t v43 = objc_msgSend(v40, "dmc_signInUserIdentifier");
    [(DMCEnrollmentFlowController *)self setUsername:v43];

    unint64_t v44 = [v40 username];
    [(DMCEnrollmentFlowController *)self setManagedAppleID:v44];

    long long v45 = objc_msgSend(v40, "dmc_altDSID");
    [(DMCEnrollmentFlowController *)self setAltDSID:v45];

    -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", objc_msgSend(v40, "dmc_enrollmentType"));
  }
  else
  {
LABEL_32:

LABEL_37:
    if (!v6) {
      goto LABEL_45;
    }
    uint64_t v46 = [MEMORY[0x263EFB210] defaultStore];
    objc_msgSend(v46, "dmc_primaryiCloudAccount");
    id v40 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v47 = *(NSObject **)DMCLogObjects();
    if (v40)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225D9B000, v47, OS_LOG_TYPE_DEFAULT, "We don't have RM Account but we have Apple Account! Using the information from the Apple Account.", buf, 2u);
      }
      v48 = [v40 username];
      [(DMCEnrollmentFlowController *)self setUsername:v48];

      BOOL v49 = [v40 username];
      [(DMCEnrollmentFlowController *)self setManagedAppleID:v49];
    }
    else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v47, OS_LOG_TYPE_ERROR, "No Primary AppleAccount after restoration!", buf, 2u);
    }
  }

LABEL_45:
LABEL_46:
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

- (void)_askForUsernameWithDefaultUsername:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment])
  {
    uint64_t v5 = [MEMORY[0x263F38B70] simulatedMDMAccountDrivenEnrollmentDefaultUsername];

    id v4 = (id)v5;
  }
  objc_initWeak(&location, self);
  BOOL v6 = [(DMCEnrollmentFlowController *)self presenter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke;
  v7[3] = &unk_264778650;
  objc_copyWeak(&v8, &location);
  [v6 requestUsernameWithDefaultUsername:v4 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained workerQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke_2;
    v9[3] = &unk_264778628;
    v9[4] = v7;
    char v11 = a3;
    id v10 = v5;
    [v8 queueBlock:v9];
  }
}

uint64_t __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 1)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[DMCEnrollmentFlowController _askForUsernameWithDefaultUsername:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 48)) {
    return [*(id *)(a1 + 32) _flowTerminatedWithError:0 canceled:1];
  }
  [*(id *)(a1 + 32) setUsername:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_fetchServerInformationWithUsername:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DMCEnrollmentFlowController *)self serviceDiscoveryHelper];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke;
  v6[3] = &unk_2647786A0;
  objc_copyWeak(&v7, &location);
  [v5 discoverServerForUserIdentifier:v4 anchorCertificateRefs:0 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    char v11 = [WeakRetained workerQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke_2;
    v12[3] = &unk_264778678;
    v12[4] = v10;
    id v13 = v8;
    id v14 = v7;
    uint64_t v15 = a3;
    [v11 queueBlock:v12];
  }
}

uint64_t __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 2)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[DMCEnrollmentFlowController _fetchServerInformationWithUsername:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    return [*(id *)(a1 + 32) _flowTerminatedWithError:v3 canceled:0];
  }
  [*(id *)(a1 + 32) setServers:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setServerInformationSource:*(void *)(a1 + 56)];
  return [*(id *)(a1 + 32) _pollNextStep];
}

- (id)_findServerWithVersion:(id)a3 servers:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "responseVersion", (void)v19);
        char v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          id v17 = v11;

          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    uint64_t v16 = [v6 count];
    *(_DWORD *)buf = 138543618;
    id v24 = v5;
    __int16 v25 = 2048;
    uint64_t v26 = v16;
    _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_INFO, "No %{public}@ server found. Total servers amount: %ld", buf, 0x16u);
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

- (void)_chooseEnrollmentTypeWithAvailableServers:(id)a3 serverInformationSource:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(DMCEnrollmentFlowController *)self _findServerWithVersion:*MEMORY[0x263F38C40] servers:v6];
  uint64_t v8 = [(DMCEnrollmentFlowController *)self _findServerWithVersion:*MEMORY[0x263F38C20] servers:v6];
  uint64_t v9 = [(DMCEnrollmentFlowController *)self _findServerWithVersion:*MEMORY[0x263F38C30] servers:v6];
  id v10 = [(DMCEnrollmentFlowController *)self _findServerWithVersion:*MEMORY[0x263F38C28] servers:v6];
  uint64_t v11 = [(DMCEnrollmentFlowController *)self _findServerWithVersion:*MEMORY[0x263F38C38] servers:v6];
  if ([MEMORY[0x263F38B68] isAppleInternal]
    && [MEMORY[0x263F38B58] DSLiveOnModeEnabled])
  {
    int v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_225D9B000, v12, OS_LOG_TYPE_DEFAULT, "We are on Apple internal device with DS live on feature enabled.", (uint8_t *)&v26, 2u);
    }
    a4 = 3;
  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    goto LABEL_11;
  }
  if (v7)
  {
    uint64_t v13 = 4;
    id v14 = v7;
LABEL_20:
    [(DMCEnrollmentFlowController *)self setEnrollmentType:v13];
    id v16 = v14;
LABEL_21:
    id v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v17;
      long long v19 = [v16 responseVersion];
      int v26 = 138543362;
      id v27 = v19;
      _os_log_impl(&dword_225D9B000, v18, OS_LOG_TYPE_DEFAULT, "Picked server with version: %{public}@", (uint8_t *)&v26, 0xCu);
    }
    long long v20 = NSURL;
    long long v21 = [v16 responseBaseURL];
    long long v22 = [v20 URLWithString:v21];
    [(DMCEnrollmentFlowController *)self setServiceURL:v22];

    goto LABEL_27;
  }
  if (v8)
  {
    uint64_t v13 = 5;
    id v14 = v8;
    goto LABEL_20;
  }
LABEL_11:
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v9 | v11)
    {
      [(DMCEnrollmentFlowController *)self setEnrollmentType:4];
      if (v9) {
        uint64_t v15 = (void *)v9;
      }
      else {
        uint64_t v15 = (void *)v11;
      }
      id v16 = v15;
      if (v16) {
        goto LABEL_21;
      }
    }
    else if (v10)
    {
      uint64_t v13 = 5;
      id v14 = v10;
      goto LABEL_20;
    }
  }
  uint64_t v23 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int v26 = 138543362;
    id v27 = v6;
    _os_log_impl(&dword_225D9B000, v23, OS_LOG_TYPE_ERROR, "Failed to pick server from: %{public}@", (uint8_t *)&v26, 0xCu);
  }
  [(DMCEnrollmentFlowController *)self setServiceURL:0];
  id v16 = 0;
LABEL_27:
  id v24 = [(DMCEnrollmentFlowController *)self serviceURL];

  if (v24)
  {
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
  else
  {
    __int16 v25 = +[DMCEnrollmentFlowController _createGeneralError];
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v25 canceled:0];
  }
}

- (void)_detectAuthTypeWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 isPostBuddy:(BOOL)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  objc_initWeak(&location, self);
  uint64_t v15 = [(DMCEnrollmentFlowController *)self serviceDiscoveryHelper];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke;
  v16[3] = &unk_2647786F0;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a4;
  BOOL v18 = a5;
  [v15 determineEnrollmentMethodWithServiceURL:v12 enrollmentType:a4 machineInfo:v13 anchorCertificateRefs:v14 completionHandler:v16];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = [WeakRetained workerQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    id v17[2] = __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke_2;
    v17[3] = &unk_2647786C8;
    v17[4] = v13;
    id v15 = v11;
    uint64_t v16 = *(void *)(a1 + 40);
    id v18 = v15;
    uint64_t v21 = v16;
    uint64_t v22 = a2;
    id v19 = v10;
    char v23 = *(unsigned char *)(a1 + 48);
    id v20 = v9;
    [v14 queueBlock:v17];
  }
}

void __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 4)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v28 = 136315138;
      *(void *)&v28[4] = "-[DMCEnrollmentFlowController _detectAuthTypeWithServiceURL:enrollmentType:isPostBuddy:machin"
                           "eInfo:anchorCertificateRefs:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", v28, 0xCu);
    }
  }
  if (!*(void *)(a1 + 40))
  {
    if (*(void *)(a1 + 64) == 3 && *(void *)(a1 + 72) != 1)
    {
      id v10 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_225D9B000, v10, OS_LOG_TYPE_ERROR, "Failed: UAORGO is only supported for Apple user authentication", v28, 2u);
      }
      id v11 = *(void **)(a1 + 32);
      id v5 = +[DMCEnrollmentFlowController _createUnsupportedFeatureError];
      [v11 _flowTerminatedWithError:v5 canceled:0];
      goto LABEL_64;
    }
    id v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F527C8]];
    if (v5)
    {
      id v6 = [MEMORY[0x263F52828] essoDetailsWithJSONDictionary:v5];
      uint64_t v7 = *(NSObject **)DMCLogObjects();
      if (!v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v28 = 138543362;
          *(void *)&v28[4] = v5;
          _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_ERROR, "Invalid ESSO details are present: %{public}@", v28, 0xCu);
        }
        id v12 = *(void **)(a1 + 32);
        id v6 = +[DMCEnrollmentFlowController _createGeneralError];
        id v13 = v12;
        id v14 = v6;
        uint64_t v15 = 0;
LABEL_32:
        objc_msgSend(v13, "_flowTerminatedWithError:canceled:", v14, v15, *(void *)v28);
        goto LABEL_63;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_DEBUG, "ESSO details are present", v28, 2u);
      }
      [*(id *)(a1 + 32) setEssoDetails:v6];
    }
    else
    {
      id v6 = 0;
    }
    [*(id *)(a1 + 32) setEnrollmentMethod:*(void *)(a1 + 72)];
    switch(*(void *)(a1 + 72))
    {
      case 0:
        uint64_t v16 = *(NSObject **)DMCLogObjects();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_WORD *)uint64_t v28 = 0;
        id v17 = "Unknown enrollment method!";
        goto LABEL_30;
      case 1:
        switch(*(void *)(a1 + 64))
        {
          case 0:
            id v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_55;
            }
            *(_WORD *)uint64_t v28 = 0;
            uint64_t v21 = "Enrollment type is Unknown!";
            break;
          case 1:
            uint64_t v22 = *(void **)(a1 + 32);
            if (*(unsigned char *)(a1 + 80)) {
              goto LABEL_44;
            }
            uint64_t v18 = objc_msgSend(v22, "_ORGO_MAIDEnrollmentSteps");
            goto LABEL_45;
          case 2:
            uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "_ORGO_MACBuddy_firstPartSteps");
            goto LABEL_45;
          case 3:
            uint64_t v22 = *(void **)(a1 + 32);
LABEL_44:
            uint64_t v18 = objc_msgSend(v22, "_ORGO_MAIDEnrollmentSteps_orgToken");
            goto LABEL_45;
          case 4:
          case 5:
            uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "_ADxE_MAID_firstPartSteps");
LABEL_45:
            id v19 = (void *)v18;
            goto LABEL_56;
          case 6:
            id v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_55;
            }
            *(_WORD *)uint64_t v28 = 0;
            uint64_t v21 = "Enrollment type MDMUserEnrollment is not supported!";
            break;
          case 7:
            id v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_55;
            }
            *(_WORD *)uint64_t v28 = 0;
            uint64_t v21 = "Enrollment type SharediPadUserChannel is not supported!";
            break;
          case 8:
            id v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_55;
            }
            *(_WORD *)uint64_t v28 = 0;
            uint64_t v21 = "Enrollment type Watch is not supported!";
            break;
          case 9:
            id v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_55;
            }
            *(_WORD *)uint64_t v28 = 0;
            uint64_t v21 = "Enrollment type ADE is not supported!";
            break;
          default:
            goto LABEL_55;
        }
        _os_log_impl(&dword_225D9B000, v20, OS_LOG_TYPE_ERROR, v21, v28, 2u);
LABEL_55:
        id v19 = 0;
LABEL_56:
        objc_msgSend(*(id *)(a1 + 32), "_appendSteps:", v19, *(void *)v28);
        char v23 = [*(id *)(a1 + 32) managedAppleID];
        uint64_t v24 = [v23 length];

        if (!v24)
        {
          __int16 v25 = [*(id *)(a1 + 32) username];
          [*(id *)(a1 + 32) setManagedAppleID:v25];
        }
        [*(id *)(a1 + 32) setAuthParams:*(void *)(a1 + 56)];
        goto LABEL_59;
      case 2:
      case 5:
        [*(id *)(a1 + 32) setAuthParams:*(void *)(a1 + 56)];
        uint64_t v8 = *(void **)(a1 + 32);
        if (v6) {
          objc_msgSend(v8, "_ADxE_thirdParty_ESSO_firstPartSteps");
        }
        else {
        uint64_t v9 = objc_msgSend(v8, "_ADxE_thirdParty_firstPartSteps");
        }
        goto LABEL_37;
      case 3:
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v9 = objc_msgSend(v8, "_ORGO_deviceEnrollmentSteps");
LABEL_37:
        id v19 = (void *)v9;
        [v8 _appendSteps:v9];
LABEL_59:

        goto LABEL_60;
      case 4:
      case 6:
        uint64_t v16 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v28 = 0;
          id v17 = "Unsupported enrollment method!";
LABEL_30:
          _os_log_impl(&dword_225D9B000, v16, OS_LOG_TYPE_ERROR, v17, v28, 2u);
        }
LABEL_31:
        id v13 = *(void **)(a1 + 32);
        id v14 = 0;
        uint64_t v15 = 1;
        goto LABEL_32;
      default:
LABEL_60:
        if (!*(unsigned char *)(a1 + 80))
        {
          int v26 = *(void **)(a1 + 32);
          id v27 = objc_msgSend(v26, "_ADE_postEnrollmentSteps");
          [v26 _appendSteps:v27];
        }
        [*(id *)(a1 + 32) _pollNextStep];
        break;
    }
LABEL_63:

LABEL_64:
    return;
  }
  uint64_t v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v28 = 138543362;
    *(void *)&v28[4] = v4;
    _os_log_impl(&dword_225D9B000, v3, OS_LOG_TYPE_ERROR, "Failed to retrieve enrollment method with error: %{public}@", v28, 0xCu);
  }
  [*(id *)(a1 + 32) _flowTerminatedWithError:*(void *)(a1 + 40) canceled:0];
}

- (void)_processAuthServicesWithAuthParams:(id)a3 enrollmentMethod:(unint64_t)a4 username:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if (a4 == 2 || a4 == 5)
    {
      id v10 = objc_opt_new();
      if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment])
      {
        id v11 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_DEFAULT, "Simulating web auth session.", (uint8_t *)&buf, 2u);
        }
        uint64_t v20 = *MEMORY[0x263F527B0];
        v21[0] = @"simulated-enrollment";
        id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
        [(DMCEnrollmentFlowController *)self setAuthTokens:v12];

        [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
      }
      else
      {
        id v13 = [v10 webAuthenticationURLForAuthParams:v8 userIdentifier:v9];
        if (v13)
        {
          objc_initWeak(&buf, self);
          id v14 = [(DMCEnrollmentFlowController *)self presenter];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          id v17[2] = __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke;
          v17[3] = &unk_264778740;
          objc_copyWeak(&v18, &buf);
          [v14 requestWebAuthenticationWithWebAuthURL:v13 authenticator:v10 authParams:v8 completionHandler:v17];

          objc_destroyWeak(&v18);
          objc_destroyWeak(&buf);
        }
        else
        {
          uint64_t v16 = +[DMCEnrollmentFlowController _createGeneralError];
          [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v16 canceled:1];
        }
      }
    }
    else
    {
      uint64_t v15 = +[DMCEnrollmentFlowController _createGeneralError];
      [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v15 canceled:1];
    }
  }
  else
  {
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:0 canceled:1];
  }
}

void __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained workerQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke_2;
    v12[3] = &unk_264778718;
    v12[4] = v10;
    char v15 = a3;
    id v13 = v8;
    id v14 = v7;
    [v11 queueBlock:v12];
  }
}

uint64_t __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 8)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      id v13 = "-[DMCEnrollmentFlowController _processAuthServicesWithAuthParams:enrollmentMethod:username:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v12, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = 0;
    uint64_t v5 = 1;
    return [v3 _flowTerminatedWithError:v4 canceled:v5];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(NSObject **)DMCLogObjects();
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(const char **)(a1 + 40);
      int v12 = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_ERROR, "Web authentication failed with error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = 0;
    return [v3 _flowTerminatedWithError:v4 canceled:v5];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(const char **)(a1 + 48);
    int v12 = 138543362;
    id v13 = v10;
    _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_DEBUG, "Web authentication tokens retrieved: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v11 = (void *)[*(id *)(a1 + 48) copy];
  [*(id *)(a1 + 32) setAuthTokens:v11];

  return [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_askForPasscodeIfNeeded
{
  uint64_t v3 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  int v4 = [v3 isDevicePasscodeSet];

  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [(DMCEnrollmentFlowController *)self presenter];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke;
    v6[3] = &unk_264778650;
    objc_copyWeak(&v7, &location);
    [v5 requestDevicePasscodeWithCompletionHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
}

void __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained workerQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2;
    v9[3] = &unk_264778628;
    v9[4] = v7;
    char v11 = a3;
    id v10 = v5;
    [v8 queueBlock:v9];
  }
}

uint64_t __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 9)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[DMCEnrollmentFlowController _askForPasscodeIfNeeded]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 32), "setNextStepIndex:", objc_msgSend(*(id *)(a1 + 32), "nextStepIndex") - 2);
  }
  else {
    [*(id *)(a1 + 32) setDevicePasscode:*(void *)(a1 + 40)];
  }
  return [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_createEnterprisePersonaWithDevicePasscode:(id)a3 devicePasscodeData:(id)a4 devicePasscodeDataType:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263F38BB8] enterprisePersonaIdentifier];
  if (!v10) {
    goto LABEL_6;
  }
  char v11 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_ERROR, "Enterprise persona exists without any MDM enrollment! Cleaning up anyway...", buf, 2u);
  }
  id v25 = 0;
  [MEMORY[0x263F38BB8] removePersona:v10 error:&v25];
  id v12 = v25;
  if (v12)
  {
    id v13 = v12;
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v12 canceled:0];
  }
  else
  {
LABEL_6:
    if (v9)
    {
      uint64_t v24 = 0;
      uint64_t v14 = (id *)&v24;
      uint64_t v15 = [MEMORY[0x263F38BB8] createEnterprisePersonaWithPasscodeData:v9 passcodeDataType:a5 error:&v24];
    }
    else
    {
      uint64_t v23 = 0;
      uint64_t v14 = (id *)&v23;
      uint64_t v15 = [MEMORY[0x263F38BB8] createEnterprisePersonaWithDevicePasscode:v8 error:&v23];
    }
    uint64_t v16 = (void *)v15;
    id v13 = *v14;
    id v17 = *(NSObject **)DMCLogObjects();
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        id v27 = v16;
        _os_log_impl(&dword_225D9B000, v17, OS_LOG_TYPE_DEFAULT, "Enterprise persona created. ID: %{public}@", buf, 0xCu);
      }
      [(DMCEnrollmentFlowController *)self setPersonaID:v16];
      id v18 = [(DMCEnrollmentFlowController *)self dirtyState];
      [v18 addDirtyPersonaID:v16];

      id v19 = [(DMCEnrollmentFlowController *)self dirtyState];
      [(DMCEnrollmentFlowController *)self _writeDirtyStateToDisk:v19];

      uint64_t v20 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        uint64_t v22 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
        [v22 requestEnrollmentFlowMonitorWithPersonaID:v16];
      }
      [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138543362;
        id v27 = v13;
        _os_log_impl(&dword_225D9B000, v17, OS_LOG_TYPE_ERROR, "Failed to create enterprise persona with error: %{public}@", buf, 0xCu);
      }
      [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v13 canceled:0];
    }
  }
}

- (void)_authenticateMAID:(id)a3 authenticationResults:(id)a4 enrollmentType:(unint64_t)a5 personaID:(id)a6 ephemeral:(BOOL)a7 silent:(BOOL)a8 isRenewalFlow:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v42 = a4;
  id v16 = a6;
  if (!a9)
  {
    id v17 = [(DMCEnrollmentFlowController *)self _guardAgainstConflictingAccountsWithUsername:v15 altDSID:0];
    if (v17)
    {
      +[DMCEnrollmentAccountUtilities removeOrphanedEnrollmentAccounts];
      id v18 = [(DMCEnrollmentFlowController *)self _guardAgainstConflictingAccountsWithUsername:v15 altDSID:0];

      if (v18)
      {
        id v19 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_225D9B000, v19, OS_LOG_TYPE_ERROR, "Duplicate account still exists after cleanup. Abort enrollment flow...", buf, 2u);
        }
        [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v18 canceled:0];

        goto LABEL_34;
      }
    }
  }
  if ([(DMCEnrollmentFlowController *)self _isORGOEnrollment:a5])
  {
    uint64_t v20 = [MEMORY[0x263EFB210] defaultStore];
    id v48 = 0;
    int v21 = objc_msgSend(v20, "dmc_hasPrimaryAccount:", &v48);
    id v22 = v48;

    if (v22)
    {
      uint64_t v23 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138543362;
        id v50 = v22;
        _os_log_impl(&dword_225D9B000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch accounts with error: %{public}@", buf, 0xCu);
      }
      [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v22 canceled:0];
LABEL_12:

      goto LABEL_34;
    }
    if (v21)
    {
      if (!a9) {
        goto LABEL_35;
      }
      id v27 = [MEMORY[0x263EFB210] defaultStore];
      uint64_t v28 = objc_msgSend(v27, "dmc_primaryiCloudAccount");

      uint64_t v29 = [v28 username];
      char v30 = [v29 isEqualToString:v15];

      if ((v30 & 1) == 0)
      {
LABEL_35:
        uint64_t v38 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_225D9B000, v38, OS_LOG_TYPE_ERROR, "The device already has a primary account! Aborting...", buf, 2u);
        }
        v39 = (void *)MEMORY[0x263F087E8];
        id v40 = DMCErrorArray();
        v41 = objc_msgSend(v39, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38A38], 15011, v40, *MEMORY[0x263F38A40], 0);
        [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v41 canceled:0];

        goto LABEL_12;
      }
    }
  }
  else if ([(DMCEnrollmentFlowController *)self _isBYODEnrollment:a5] {
         && ![v16 length]
  }
         && !v10)
  {
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    id v25 = DMCErrorArray();
    int v26 = objc_msgSend(v24, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38A38], 15019, v25, *MEMORY[0x263F38A40], 0);
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v26 canceled:0];

    goto LABEL_34;
  }
  objc_initWeak((id *)buf, self);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke;
  v43[3] = &unk_264778790;
  objc_copyWeak(&v45, (id *)buf);
  BOOL v46 = a9;
  BOOL v47 = v10;
  id v15 = v15;
  id v44 = v15;
  char v31 = (void *)MEMORY[0x22A6404E0](v43);
  if (!v15)
  {
    if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment])
    {
      id v15 = [MEMORY[0x263F38B70] simulatedMDMAccountDrivenEnrollmentDefaultUsername];
    }
    else
    {
      id v15 = 0;
    }
  }
  unint64_t v32 = [(DMCEnrollmentFlowController *)self enrollmentMethod];
  uint64_t v33 = v32 == 1;
  if ([MEMORY[0x263F38B68] isAppleInternal])
  {
    unsigned int v34 = [MEMORY[0x263F38B58] DSLiveOnModeEnabled];
    if (v32 == 1) {
      uint64_t v33 = 1;
    }
    else {
      uint64_t v33 = v34;
    }
  }
  if (v9)
  {
    uint64_t v35 = [(DMCEnrollmentFlowController *)self presenter];
    [v35 requestSilentMAIDAuthenticationWithAuthenticationResults:v42 personaID:v16 requireAppleMAID:v33 completionHandler:v31];
  }
  else
  {
    uint64_t v36 = [(DMCEnrollmentFlowController *)self presenter];
    char v37 = objc_opt_respondsToSelector();

    uint64_t v35 = [(DMCEnrollmentFlowController *)self presenter];
    if (v37) {
      [v35 requestMAIDAuthenticationWithManagedAppleID:v15 personaID:v16 ephemeral:v10 requireAppleMAID:v33 completionHandler:v31];
    }
    else {
      [v35 requestMAIDAuthenticationWithManagedAppleID:v15 personaID:v16 ephemeral:v10 completionHandler:v31];
    }
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);
LABEL_34:
}

void __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v10 = WeakRetained;
  if (WeakRetained)
  {
    char v11 = [WeakRetained workerQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke_2;
    v12[3] = &unk_264778768;
    v12[4] = v10;
    char v16 = a3;
    id v13 = v8;
    id v14 = v7;
    __int16 v17 = *(_WORD *)(a1 + 48);
    id v15 = *(id *)(a1 + 32);
    [v11 queueBlock:v12];
  }
}

void __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ((unint64_t)([*(id *)(a1 + 32) currentStep] - 11) >= 3)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136315138;
      uint64_t v28 = "-[DMCEnrollmentFlowController _authenticateMAID:authenticationResults:enrollmentType:personaID:ephemeral:sil"
            "ent:isRenewalFlow:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = *(const char **)(a1 + 40);
        *(_DWORD *)id buf = 138543362;
        uint64_t v28 = v7;
        _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_ERROR, "MAID authentication failed with error: %{public}@", buf, 0xCu);
      }
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = 0;
      goto LABEL_10;
    }
    id v8 = [*(id *)(a1 + 32) authenticationResults];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      BOOL v10 = [*(id *)(a1 + 32) authenticationResults];
      [v10 addEntriesFromDictionary:*(void *)(a1 + 48)];
    }
    else
    {
      [*(id *)(a1 + 32) setAuthenticationResults:*(void *)(a1 + 48)];
    }
    char v11 = [*(id *)(a1 + 32) authenticationResults];
    id v12 = DMCAKAuthenticationAlternateDSIDKey();
    id v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      [*(id *)(a1 + 32) setAltDSID:v13];
      if (!*(unsigned char *)(a1 + 65))
      {
        uint64_t v23 = [*(id *)(a1 + 32) _guardAgainstConflictingAccountsWithUsername:0 altDSID:v13];
        if (v23)
        {
          uint64_t v24 = (void *)v23;
          id v25 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_225D9B000, v25, OS_LOG_TYPE_ERROR, "Duplicate account exists. Abort enrollment flow...", buf, 2u);
          }
          [*(id *)(a1 + 32) _flowTerminatedWithError:v24 canceled:0];

          goto LABEL_26;
        }
      }
      if (!*(unsigned char *)(a1 + 66))
      {
        id v14 = [*(id *)(a1 + 32) dirtyState];
        [v14 addDirtyAltDSID:v13];

        id v15 = *(void **)(a1 + 32);
        char v16 = [v15 dirtyState];
        [v15 _writeDirtyStateToDisk:v16];
      }
    }
    __int16 v17 = [*(id *)(a1 + 32) altDSID];

    id v18 = *(void **)(a1 + 32);
    if (v17)
    {
      [*(id *)(a1 + 32) _pollNextStep];
    }
    else
    {
      id v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F38A38];
      uint64_t v26 = *(void *)(a1 + 56);
      int v21 = DMCErrorArray();
      id v22 = objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 15031, v21, *MEMORY[0x263F38A40], v26, 0);
      [v18 _flowTerminatedWithError:v22 canceled:0];
    }
LABEL_26:

    return;
  }
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = 0;
  uint64_t v5 = 1;
LABEL_10:
  [v3 _flowTerminatedWithError:v4 canceled:v5];
}

- (void)_signInMAIDWithAuthenticationResult:(id)a3 enrollmentType:(unint64_t)a4 personaID:(id)a5 isRenewalFlow:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6) {
    goto LABEL_4;
  }
  id v12 = DMCAKAuthenticationUsernameKey();
  id v13 = [v10 objectForKeyedSubscript:v12];
  id v14 = DMCAKAuthenticationAlternateDSIDKey();
  id v15 = [v10 objectForKeyedSubscript:v14];
  char v16 = [(DMCEnrollmentFlowController *)self _guardAgainstConflictingAccountsWithUsername:v13 altDSID:v15];

  if (!v16)
  {
LABEL_4:
    objc_initWeak(&location, self);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke;
    uint64_t v24 = &unk_2647787E0;
    objc_copyWeak(&v27, &location);
    id v17 = v10;
    id v25 = v17;
    id v18 = v11;
    id v26 = v18;
    id v19 = (void *)MEMORY[0x22A6404E0](&v21);
    uint64_t v20 = [(DMCEnrollmentFlowController *)self presenter];
    [v20 requestMAIDSignInWithAuthenticationResults:v17 personaID:v18 makeiTunesAccountActive:a4 - 6 < 0xFFFFFFFFFFFFFFFELL completionHandler:v19];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v16 canceled:0];
  }
}

void __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke(id *a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained workerQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke_2;
    v11[3] = &unk_2647787B8;
    v11[4] = v9;
    char v15 = a3;
    char v16 = a2;
    id v12 = v7;
    id v13 = a1[4];
    id v14 = a1[5];
    [v10 queueBlock:v11];
  }
}

void __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 14)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      id v17 = "-[DMCEnrollmentFlowController _signInMAIDWithAuthenticationResult:enrollmentType:personaID:isRenewalFlow:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v16, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = 0;
    uint64_t v5 = 1;
LABEL_6:
    [v3 _flowTerminatedWithError:v4 canceled:v5];
    return;
  }
  if (!*(unsigned char *)(a1 + 65))
  {
    id v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = *(const char **)(a1 + 40);
      int v16 = 138543362;
      id v17 = v12;
      _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_ERROR, "MAID sign-in failed with error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    id v13 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4)
    {
      char v15 = +[DMCEnrollmentFlowController _createGeneralSignInError];
      [v13 _flowTerminatedWithError:v15 canceled:0];

      return;
    }
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 48);
  id v8 = DMCAKAuthenticationAlternateDSIDKey();
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  LOBYTE(v6) = [v6 _verifyAccountsInformationWithAltDSID:v9 personaID:*(void *)(a1 + 56)];

  id v10 = *(void **)(a1 + 32);
  if (v6)
  {
    [v10 _pollNextStep];
  }
  else
  {
    id v14 = +[DMCEnrollmentFlowController _createGeneralSignInError];
    [v10 _flowTerminatedWithError:v14 canceled:0];
  }
}

- (BOOL)_verifyAccountsInformationWithAltDSID:(id)a3 personaID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = 1;
  if (v6)
  {
    id v8 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    uint64_t v9 = (void *)MEMORY[0x263F38BB8];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __79__DMCEnrollmentFlowController__verifyAccountsInformationWithAltDSID_personaID___block_invoke;
    v13[3] = &unk_264778808;
    id v10 = v8;
    id v14 = v10;
    id v15 = v5;
    id v16 = v6;
    id v17 = &v18;
    id v11 = (id)[v9 performBlockUnderPersona:v16 block:v13];
    BOOL v7 = *((unsigned char *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }

  return v7;
}

void __79__DMCEnrollmentFlowController__verifyAccountsInformationWithAltDSID_personaID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", *(void *)(a1 + 40));
  uint64_t v3 = [v2 personaIdentifier];
  char v4 = [v3 isEqualToString:*(void *)(a1 + 48)];

  if ((v4 & 1) == 0)
  {
    id v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      BOOL v7 = [v2 personaIdentifier];
      uint64_t v8 = *(void *)(a1 + 48);
      int v16 = 138543874;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v2;
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_ERROR, "The persona ID (%{public}@) of the iCloud account (%{public}@) is different from the persona ID (%{public}@) used in this enrollment.", (uint8_t *)&v16, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "dmc_iTunesAccountForRemoteManagingAccountWithAltDSID:", *(void *)(a1 + 40));
  id v10 = [v9 personaIdentifier];
  char v11 = [v10 isEqualToString:*(void *)(a1 + 48)];

  if ((v11 & 1) == 0)
  {
    id v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      id v14 = [v9 personaIdentifier];
      uint64_t v15 = *(void *)(a1 + 48);
      int v16 = 138543874;
      id v17 = v14;
      __int16 v18 = 2114;
      id v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_ERROR, "The persona ID (%{public}@) of the iTunes account (%{public}@) is different from the persona ID (%{public}@) used in this enrollment.", (uint8_t *)&v16, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (void)_exchangeMAIDForBearerTokenWithRMAccountIdentifier:(id)a3 authParams:(id)a4 anchorCertificateRefs:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment])
  {
    char v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_DEFAULT, "Simulating exchange MAID for bearer token.", (uint8_t *)&buf, 2u);
    }
    uint64_t v17 = *MEMORY[0x263F527B0];
    v18[0] = @"simulated-enrollment";
    id v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [(DMCEnrollmentFlowController *)self setAuthTokens:v12];

    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
  else
  {
    objc_initWeak(&buf, self);
    id v13 = [MEMORY[0x263F52838] authenticatorWithAnchorCertificateRefs:v10];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke;
    v14[3] = &unk_264778858;
    objc_copyWeak(&v15, &buf);
    [v13 fetchTokenWithAuthParams:v9 accountID:v8 completionHandler:v14];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&buf);
  }
}

void __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained currentStep] != 16)
    {
      id v9 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 136315138;
        int v16 = "-[DMCEnrollmentFlowController _exchangeMAIDForBearerTokenWithRMAccountIdentifier:authParams:anchorCertific"
              "ateRefs:]_block_invoke";
        _os_log_impl(&dword_225D9B000, v9, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
      }
    }
    id v10 = [v8 workerQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke_65;
    v11[3] = &unk_264778830;
    id v12 = v6;
    id v13 = v8;
    id v14 = v5;
    [v10 queueBlock:v11];
  }
}

uint64_t __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke_65(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    return objc_msgSend(v2, "_flowTerminatedWithError:canceled:");
  }
  else
  {
    char v4 = (void *)[*(id *)(a1 + 48) copy];
    [*(id *)(a1 + 40) setAuthTokens:v4];

    id v5 = *(void **)(a1 + 40);
    return [v5 _pollNextStep];
  }
}

- (void)_fetchEnrollmentProfileFromServiceURL:(id)a3 authTokens:(id)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 enrollmentType:(unint64_t)a7 enrollmentMethod:(unint64_t)a8 isESSO:(BOOL)a9 essoAppITunesStoreID:(id)a10 isReturnToService:(BOOL)a11
{
  id v28 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke;
  v30[3] = &unk_264778880;
  objc_copyWeak(v32, &location);
  v32[1] = (id)a8;
  BOOL v33 = a9;
  id v21 = v20;
  id v31 = v21;
  v32[2] = (id)a7;
  uint64_t v22 = (void (**)(void, void, void))MEMORY[0x22A6404E0](v30);
  if (a11
    && ([(DMCEnrollmentFlowController *)self obliterationShelter],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        [v23 mdmProfileData],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        v24))
  {
    id v25 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_225D9B000, v25, OS_LOG_TYPE_DEFAULT, "Return to Service: Has local MDM profile.", buf, 2u);
    }
    id v26 = [(DMCEnrollmentFlowController *)self obliterationShelter];
    id v27 = [v26 mdmProfileData];
    ((void (**)(void, void *, void))v22)[2](v22, v27, 0);
  }
  else
  {
    id v26 = [(DMCEnrollmentFlowController *)self serviceDiscoveryHelper];
    [v26 fetchEnrollmentProfileWithServiceURL:v28 authTokens:v17 enrollmentMethod:a8 machineInfo:v18 anchorCertificateRefs:v19 completionHandler:v22];
  }

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

void __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workerQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke_2;
    v14[3] = &unk_2647786C8;
    void v14[4] = v8;
    id v15 = v6;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 48);
    id v16 = v10;
    uint64_t v18 = v11;
    char v20 = *(unsigned char *)(a1 + 64);
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    id v17 = v12;
    uint64_t v19 = v13;
    [v9 queueBlock:v14];
  }
}

void __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 17)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136315138;
      id v25 = "-[DMCEnrollmentFlowController _fetchEnrollmentProfileFromServiceURL:authTokens:machineInfo:anchorCertificate"
            "Refs:enrollmentType:enrollmentMethod:isESSO:essoAppITunesStoreID:isReturnToService:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  uint64_t v3 = *(void **)(a1 + 40);
  if (!v3)
  {
    [*(id *)(a1 + 32) setProfileData:*(void *)(a1 + 48)];
    id v6 = *(void **)(a1 + 32);
    BOOL v7 = [v6 profileData];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    id v23 = 0;
    char v11 = [v6 _extractAndVerifyPropertiesFromProfileData:v7 enrollmentMethod:v9 isESSO:v8 essoAppITunesStoreID:v10 error:&v23];
    id v12 = v23;

    if (v11)
    {
      if ((*(void *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
LABEL_30:
        [*(id *)(a1 + 32) _pollNextStep];
        goto LABEL_31;
      }
      uint64_t v13 = [*(id *)(a1 + 32) serverCapabilities];
      char v14 = [v13 containsObject:*MEMORY[0x263F52EF0]];

      uint64_t v15 = *(void *)(a1 + 64);
      if (v15 == 1)
      {
        uint64_t v19 = *(void **)(a1 + 32);
        if (v14) {
          objc_msgSend(v19, "_ADxE_MAID_secondPartSteps_orgToken");
        }
        else {
          objc_msgSend(v19, "_ADxE_MAID_secondPartSteps_default");
        }
        goto LABEL_26;
      }
      if (v15 == 5 || v15 == 2)
      {
        id v16 = *(void **)(a1 + 32);
        if (*(unsigned char *)(a1 + 80))
        {
          if (v14) {
            objc_msgSend(v16, "_ADxE_thirdParty_ESSO_secondPartSteps_orgToken");
          }
          else {
            objc_msgSend(v16, "_ADxE_thirdParty_ESSO_secondPartSteps_default");
          }
        }
        else if (v14)
        {
          objc_msgSend(v16, "_ADxE_thirdParty_secondPartSteps_orgToken");
        }
        else
        {
          objc_msgSend(v16, "_ADxE_thirdParty_secondPartSteps_default");
        }
        uint64_t v21 = LABEL_26:;
        uint64_t v22 = (void *)v21;
        [*(id *)(a1 + 32) _appendSteps:v21];

        goto LABEL_30;
      }
      char v20 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_225D9B000, v20, OS_LOG_TYPE_ERROR, "No next step: unsupported enrollment method", buf, 2u);
      }
      id v17 = *(void **)(a1 + 32);
      id v18 = 0;
    }
    else
    {
      id v17 = *(void **)(a1 + 32);
      id v18 = v12;
    }
    [v17 _flowTerminatedWithError:v18 canceled:0];
LABEL_31:

    return;
  }
  char v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F38AB0]];

  if (!v5
    || ([*(id *)(a1 + 32) _handleSoftwareUpdateRequiredError:*(void *)(a1 + 40)] & 1) == 0
    && ([*(id *)(a1 + 32) _handleNeedCredentialsError:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(a1 + 32) _flowTerminatedWithError:*(void *)(a1 + 40) canceled:0];
  }
}

- (void)_askForUserConsentWithProfileData:(id)a3 managedAppleID:(id)a4 cloudConfig:(id)a5 isReturnToService:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6)
  {
    uint64_t v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_DEFAULT, "No need to ask for consent during Return to Service", (uint8_t *)buf, 2u);
    }
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
  else
  {
    objc_initWeak(buf, self);
    char v14 = [(DMCEnrollmentFlowController *)self presenter];
    if (v12)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      void v18[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke;
      v18[3] = &unk_2647788F8;
      uint64_t v15 = &v19;
      objc_copyWeak(&v19, buf);
      [v14 requestUserConsentWithCloudConfig:v12 completionHandler:v18];
    }
    else
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      id v16[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2_71;
      v16[3] = &unk_2647788F8;
      uint64_t v15 = &v17;
      objc_copyWeak(&v17, buf);
      [v14 requestUserConsentWithProfileData:v10 managedAppleID:v11 completionHandler:v16];
    }

    objc_destroyWeak(v15);
    objc_destroyWeak(buf);
  }
}

void __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = [WeakRetained workerQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2;
    v6[3] = &unk_2647788D0;
    void v6[4] = v4;
    char v7 = a2;
    [v5 queueBlock:v6];
  }
}

void __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 18)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136315138;
      char v7 = "-[DMCEnrollmentFlowController _askForUserConsentWithProfileData:managedAppleID:cloudConfig:isReturnToService:"
           "]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    char v4 = [v3 managedConfigurationHelper];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_68;
    v5[3] = &unk_2647788A8;
    v5[4] = *(void *)(a1 + 32);
    [v4 markCloudConfigurationAsUICompletedWithCompletionHandler:v5];
  }
  else
  {
    [v3 _flowTerminatedWithError:0 canceled:1];
  }
}

uint64_t __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_68(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 _flowTerminatedWithError:a2 canceled:0];
  }
  else {
    return [v2 _pollNextStep];
  }
}

void __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2_71(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = [WeakRetained workerQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_3;
    v6[3] = &unk_2647788D0;
    void v6[4] = v4;
    char v7 = a2;
    [v5 queueBlock:v6];
  }
}

uint64_t __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 18)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      BOOL v6 = "-[DMCEnrollmentFlowController _askForUserConsentWithProfileData:managedAppleID:cloudConfig:isReturnToService:"
           "]_block_invoke_3";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [v3 _pollNextStep];
  }
  else {
    return [v3 _flowTerminatedWithError:0 canceled:1];
  }
}

- (void)_displayManagementDetailsOverviewWithProfileData:(id)a3 managedAppleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(DMCEnrollmentFlowController *)self presenter];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke;
  v9[3] = &unk_2647788F8;
  objc_copyWeak(&v10, &location);
  [v8 displayManagementDetailsOverviewWithProfileData:v6 managedAppleID:v7 completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = [WeakRetained workerQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke_2;
    v6[3] = &unk_2647788D0;
    void v6[4] = v4;
    char v7 = a2;
    [v5 queueBlock:v6];
  }
}

uint64_t __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 19)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[DMCEnrollmentFlowController _displayManagementDetailsOverviewWithProfileData:managedAppleID:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [v3 _pollNextStep];
  }
  else {
    return [v3 _flowTerminatedWithError:0 canceled:1];
  }
}

- (void)_installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 isESSO:(BOOL)a7 essoAppITunesStoreID:(id)a8 essoConfigurationProfile:(id)a9 wifiProfileIdentifier:(id)a10 enrollmentType:(unint64_t)a11 isReturnToService:(BOOL)a12
{
  BOOL v31 = a7;
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a8;
  id v17 = a9;
  id v18 = a10;
  [(DMCEnrollmentFlowController *)self _blockAppInstallsIfNecessary];
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke;
  v37[3] = &unk_264778948;
  objc_copyWeak(v38, &location);
  v38[1] = (id)a11;
  id v19 = (void *)MEMORY[0x22A6404E0](v37);
  char v20 = [(DMCEnrollmentFlowController *)self presenter];
  LOBYTE(a6) = objc_opt_respondsToSelector();

  if (a6)
  {
    uint64_t v21 = [(DMCEnrollmentFlowController *)self presenter];
    [v21 showInstallingEnrollmentProfileScene];
  }
  if (a11 == 4)
  {
    uint64_t v22 = (id *)MEMORY[0x263F38C10];
    goto LABEL_9;
  }
  if (a11 == 5)
  {
    uint64_t v22 = (id *)MEMORY[0x263F38C08];
LABEL_9:
    id v23 = *v22;
    goto LABEL_10;
  }
  if (a12)
  {
    uint64_t v22 = (id *)MEMORY[0x263F38C18];
    goto LABEL_9;
  }
  id v23 = 0;
LABEL_10:
  uint64_t v24 = objc_opt_new();
  id v25 = v24;
  if (v17) {
    [v24 addObject:v17];
  }
  if (v18) {
    [v25 addObject:v18];
  }
  uint64_t v26 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  char v27 = objc_opt_respondsToSelector();

  if (a11 == 1 || (v27 & 1) == 0)
  {
    uint64_t v29 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    char v30 = objc_opt_respondsToSelector();

    id v28 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    if (v30) {
      [v28 installEnrollmentProfile:v36 devicePasscode:v35 personaID:v34 rmAccountIdentifier:v33 managedProfileIdentifiers:v25 installationSource:v23 completionHandler:v19];
    }
    else {
      [v28 installEnrollmentProfile:v36 devicePasscode:v35 personaID:v34 rmAccountIdentifier:v33 completionHandler:v19];
    }
  }
  else
  {
    id v28 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    [v28 installEnrollmentProfile:v36 devicePasscode:v35 personaID:v34 rmAccountIdentifier:v33 isESSO:v31 essoAppITunesStoreID:v32 managedProfileIdentifiers:v25 installationSource:v23 completionHandler:v19];
  }

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
}

void __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained workerQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke_2;
    v14[3] = &unk_264778920;
    id v15 = v8;
    id v16 = v10;
    char v19 = a3;
    id v12 = v7;
    uint64_t v13 = *(void *)(a1 + 40);
    id v17 = v12;
    uint64_t v18 = v13;
    [v11 queueBlock:v14];
  }
}

uint64_t __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v19 = 138543362;
      uint64_t v20 = v3;
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "profile installation failed with error: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    char v4 = *(void **)(a1 + 40);
    uint64_t v6 = 0;
    return [v4 _flowTerminatedWithError:v5 canceled:v6];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    id v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_DEFAULT, "profile installation canceled", (uint8_t *)&v19, 2u);
    }
    char v4 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 1;
    return [v4 _flowTerminatedWithError:v5 canceled:v6];
  }
  [*(id *)(a1 + 40) setProfileIdentifier:*(void *)(a1 + 48)];
  uint64_t v9 = [*(id *)(a1 + 40) dirtyState];
  [v9 addDirtyProfileIdentifier:*(void *)(a1 + 48)];

  id v10 = *(void **)(a1 + 40);
  id v11 = [v10 dirtyState];
  [v10 _writeDirtyStateToDisk:v11];

  if ((*(void *)(a1 + 56) | 8) == 9)
  {
    id v12 = [*(id *)(a1 + 40) managedConfigurationHelper];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      char v14 = [*(id *)(a1 + 40) managedConfigurationHelper];
      [v14 markStoredProfileAsInstalled];
    }
  }
  id v15 = [*(id *)(a1 + 40) delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = [*(id *)(a1 + 40) delegate];
    [v17 enrollmentFlowController:*(void *)(a1 + 40) didInstallEnrollmentProfile:*(void *)(a1 + 48)];
  }
  uint64_t v18 = *(void **)(a1 + 40);
  return [v18 _pollNextStep];
}

- (void)_createRMAccountIfNeededWithSignInUserIdentifier:(id)a3 assignedMAID:(id)a4 existingRMAccountID:(id)a5 enrollmentType:(unint64_t)a6 enrollmentMethod:(unint64_t)a7 isRenewalFlow:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (v16 && v8)
  {
    id v17 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v18 = [v17 accountWithIdentifier:v16];

    if (objc_msgSend(v18, "dmc_enrollmentType") == a6 && objc_msgSend(v18, "dmc_enrollmentMethod") == a7)
    {
      int v19 = [(DMCEnrollmentFlowController *)self dirtyState];
      [v19 addDirtyRMAccount:v16];

      [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
      goto LABEL_12;
    }
  }
  uint64_t v20 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v21 = objc_msgSend(MEMORY[0x263EFB1F8], "dmc_createManagementAccountWithStore:", v20);
  uint64_t v22 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543362;
    id v28 = v21;
    _os_log_impl(&dword_225D9B000, v22, OS_LOG_TYPE_INFO, "Will save remote management account: %{public}@", buf, 0xCu);
  }
  [v21 setUsername:v15];
  objc_msgSend(v21, "dmc_setSignInUserIdentifier:", v14);
  objc_msgSend(v21, "dmc_setEnrollmentType:", a6);
  objc_msgSend(v21, "dmc_setEnrollmentMethod:", a7);
  if (a6 == 7) {
    objc_msgSend(v21, "dmc_setAccountScheme:", *MEMORY[0x263F38A30]);
  }
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke;
  v24[3] = &unk_264778970;
  objc_copyWeak(&v26, (id *)buf);
  id v23 = v21;
  id v25 = v23;
  [v20 saveAccount:v23 withCompletionHandler:v24];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

void __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v8 = [WeakRetained workerQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke_2;
    v9[3] = &unk_264778718;
    char v13 = a2;
    id v10 = v5;
    id v11 = v7;
    id v12 = *(id *)(a1 + 32);
    [v8 queueBlock:v9];
  }
}

uint64_t __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(NSObject **)DMCLogObjects();
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = *(void **)(a1 + 48);
      id v5 = v3;
      uint64_t v6 = [v4 identifier];
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_225D9B000, v5, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v7 = [*(id *)(a1 + 48) identifier];
    [*(id *)(a1 + 40) setRmAccountIdentifier:v7];

    BOOL v8 = [*(id *)(a1 + 40) dirtyState];
    uint64_t v9 = [*(id *)(a1 + 48) identifier];
    [v8 addDirtyRMAccount:v9];

    id v10 = *(void **)(a1 + 40);
    id v11 = [v10 dirtyState];
    [v10 _writeDirtyStateToDisk:v11];

    return [*(id *)(a1 + 40) _pollNextStep];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      char v13 = *(void **)(a1 + 32);
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_225D9B000, v3, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    return [*(id *)(a1 + 40) _flowTerminatedWithError:*(void *)(a1 + 32) canceled:0];
  }
}

- (void)_updateRMAccountWithIdentifier:(id)a3 authenticationResults:(id)a4 enrollmentMethod:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(DMCEnrollmentFlowController *)self managedAppleID];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    char v13 = DMCAKAuthenticationUsernameKey();
    id v12 = [v9 objectForKeyedSubscript:v13];
  }
  int v14 = [MEMORY[0x263EFB210] defaultStore];
  id v27 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __101__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authenticationResults_enrollmentMethod___block_invoke;
  id v23 = &unk_264778998;
  id v15 = v12;
  id v24 = v15;
  id v16 = v9;
  id v25 = v16;
  unint64_t v26 = a5;
  char v17 = objc_msgSend(v14, "dmc_updateAccountWithIdentifier:error:updateBlock:", v8, &v27, &v20);
  id v18 = v27;

  int v19 = *(NSObject **)DMCLogObjects();
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v29 = v8;
      _os_log_impl(&dword_225D9B000, v19, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
    }
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      id v29 = v18;
      _os_log_impl(&dword_225D9B000, v19, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v18, 0, v20, v21, v22, v23, v24);
  }
}

void __101__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authenticationResults_enrollmentMethod___block_invoke(void *a1, void *a2)
{
  id v15 = a2;
  [v15 setUsername:a1[4]];
  [v15 setAccountDescription:a1[4]];
  uint64_t v3 = (void *)a1[5];
  char v4 = DMCAKAuthenticationAlternateDSIDKey();
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = (void *)a1[5];
    id v7 = DMCAKAuthenticationAlternateDSIDKey();
    id v8 = [v6 objectForKeyedSubscript:v7];
    objc_msgSend(v15, "dmc_setAltDSID:", v8);
  }
  id v9 = (void *)a1[5];
  id v10 = DMCAKAuthenticationDSIDKey();
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = (void *)a1[5];
    char v13 = DMCAKAuthenticationDSIDKey();
    int v14 = [v12 objectForKeyedSubscript:v13];
    objc_msgSend(v15, "dmc_setDSID:", v14);
  }
  if (a1[6] == 1) {
    [MEMORY[0x263F527E0] stashMAIDShortLivedTokenWithAccount:v15 authenticationResults:a1[5]];
  }
}

- (void)_updateRMAccountWithIdentifier:(id)a3 authTokens:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6 personaID:(id)a7 enrollmentMethod:(unint64_t)a8
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  BOOL v46 = __Block_byref_object_copy_;
  BOOL v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  int v19 = (void *)MEMORY[0x263F38BB8];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke;
  v29[3] = &unk_2647789E8;
  id v36 = &v39;
  id v20 = v14;
  id v30 = v20;
  char v37 = &v43;
  id v21 = v17;
  id v31 = v21;
  id v32 = self;
  id v22 = v15;
  id v33 = v22;
  id v23 = v16;
  id v34 = v23;
  id v24 = v18;
  id v35 = v24;
  unint64_t v38 = a8;
  id v25 = (id)[v19 performBlockUnderPersona:v24 block:v29];
  if (*((unsigned char *)v40 + 24))
  {
    unint64_t v26 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v50 = v20;
      _os_log_impl(&dword_225D9B000, v26, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
    }
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
  else
  {
    id v27 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = (void *)v44[5];
      *(_DWORD *)id buf = 138543362;
      id v50 = v28;
      _os_log_impl(&dword_225D9B000, v27, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
    }
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v44[5] canceled:0];
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

void __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  id v17 = *(id *)(v3 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke_2;
  v10[3] = &unk_2647789C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v14 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 96);
  id v15 = v8;
  uint64_t v16 = v9;
  LOBYTE(v4) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &v17, v10);
  objc_storeStrong((id *)(v3 + 40), v17);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v4;
}

void __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAccountDescription:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _updateCredentialForAccount:v3 authTokens:*(void *)(a1 + 48)];
  objc_msgSend(v3, "dmc_setManagementProfileIdentifier:", *(void *)(a1 + 56));
  objc_msgSend(v3, "dmc_setPersonaIdentifier:", *(void *)(a1 + 64));
  if (*(void *)(a1 + 72) == 1) {
    [MEMORY[0x263F527E0] removeMAIDShortLivedTokenWithAccount:v3];
  }
}

- (void)_updateRMAccountWithIdentifier:(id)a3 authTokens:(id)a4 personaID:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v11 = (void *)MEMORY[0x263F38BB8];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke;
  v18[3] = &unk_264778A38;
  id v22 = &v24;
  id v12 = v8;
  id v23 = &v28;
  id v19 = v12;
  id v20 = self;
  id v13 = v9;
  id v21 = v13;
  id v14 = (id)[v11 performBlockUnderPersona:v10 block:v18];
  if (*((unsigned char *)v25 + 24))
  {
    id v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v35 = v12;
      _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
    }
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
  else
  {
    uint64_t v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = (void *)v29[5];
      *(_DWORD *)id buf = 138543362;
      id v35 = v17;
      _os_log_impl(&dword_225D9B000, v16, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
    }
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v29[5] canceled:0];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

void __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke(void *a1)
{
  int v2 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v3 = *(void *)(a1[8] + 8);
  id v8 = *(id *)(v3 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke_2;
  v6[3] = &unk_264778A10;
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[6];
  void v6[4] = a1[5];
  id v7 = v5;
  LOBYTE(v4) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &v8, v6);
  objc_storeStrong((id *)(v3 + 40), v8);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v4;
}

void __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 _updateCredentialForAccount:v4 authTokens:v3];
  objc_msgSend(v4, "dmc_setBearerReauthURL:", 0);
  objc_msgSend(v4, "dmc_setBearerReauthParams:", 0);
}

- (void)_correlateMAIDWithAltDSID:(id)a3 withRMAccount:(id)a4 isProfileLocked:(BOOL)a5 organizationName:(id)a6 friendlyName:(id)a7 personaID:(id)a8
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [MEMORY[0x263EFB210] defaultStore];
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke;
  v74[3] = &unk_264778A60;
  id v43 = v15;
  id v75 = v43;
  id v41 = v14;
  id v76 = v41;
  id v19 = v16;
  id v77 = v19;
  BOOL v78 = a5;
  id v20 = (void *)MEMORY[0x22A6404E0](v74);
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = __Block_byref_object_copy_;
  uint64_t v72 = __Block_byref_object_dispose_;
  id v73 = 0;
  uint64_t v64 = 0;
  BOOL v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 1;
  id v21 = (void *)MEMORY[0x263F38BB8];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2;
  v58[3] = &unk_264778A88;
  long long v62 = &v64;
  id v22 = v18;
  id v59 = v22;
  id v23 = v13;
  id v60 = v23;
  long long v63 = &v68;
  id v24 = v20;
  id v61 = v24;
  id v25 = (id)[v21 performBlockUnderPersona:v17 block:v58];
  if (*((unsigned char *)v65 + 24))
  {
    uint64_t v26 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_225D9B000, v26, OS_LOG_TYPE_DEFAULT, "iCloud Account Saved Successfully.", buf, 2u);
    }
    char v27 = (void *)MEMORY[0x263F38BB8];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_88;
    v52[3] = &unk_264778A88;
    long long v56 = &v64;
    id v28 = v22;
    id v53 = v28;
    id v29 = v23;
    id v54 = v29;
    uint64_t v57 = &v68;
    id v55 = v24;
    id v30 = (id)objc_msgSend(v27, "performBlockUnderPersona:block:", v17, v52, v41, v43);
    if (*((unsigned char *)v65 + 24))
    {
      id v31 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_225D9B000, v31, OS_LOG_TYPE_DEFAULT, "iTunes Account Saved Successfully.", buf, 2u);
      }
      id v32 = (void *)MEMORY[0x263F38BB8];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_89;
      v46[3] = &unk_264778AD0;
      BOOL v49 = &v64;
      id v47 = v28;
      id v48 = v29;
      id v50 = &v68;
      BOOL v51 = a5;
      id v33 = (id)[v32 performBlockUnderPersona:v17 block:v46];
      if (*((unsigned char *)v65 + 24))
      {
        id v34 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_225D9B000, v34, OS_LOG_TYPE_DEFAULT, "RM Account Saved Successfully.", buf, 2u);
        }
        [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
      }
      else
      {
        uint64_t v39 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = v69[5];
          *(_DWORD *)id buf = 138543362;
          uint64_t v80 = v40;
          _os_log_impl(&dword_225D9B000, v39, OS_LOG_TYPE_ERROR, "Error Updating RM Account: %{public}@", buf, 0xCu);
        }
        [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v69[5] canceled:0];
      }
    }
    else
    {
      char v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = v69[5];
        *(_DWORD *)id buf = 138543362;
        uint64_t v80 = v38;
        _os_log_impl(&dword_225D9B000, v37, OS_LOG_TYPE_ERROR, "Error Updating iTunes Account: %{public}@", buf, 0xCu);
      }
      [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v69[5] canceled:0];
    }
  }
  else
  {
    id v35 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = v69[5];
      *(_DWORD *)id buf = 138543362;
      uint64_t v80 = v36;
      _os_log_impl(&dword_225D9B000, v35, OS_LOG_TYPE_ERROR, "Error Updating iCloud Account: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v69[5], 0, v41, v43);
  }

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAccountDescription:v3];
  objc_msgSend(v4, "dmc_setRemoteManagingAccountIdentifier:", *(void *)(a1 + 40));
  [v4 setManagingOwnerIdentifier:*MEMORY[0x263F528C8]];
  [v4 setManagingSourceName:*(void *)(a1 + 48)];
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F528C0]];
  objc_msgSend(v4, "dmc_setManagementProfileLocked:", *(unsigned __int8 *)(a1 + 56));
}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EFAE58];
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  char v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_88(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EFB000];
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  char v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_89(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EFAF90];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  obuint64_t j = *(id *)(v3 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2_90;
  v7[3] = &__block_descriptor_33_e19_v16__0__ACAccount_8l;
  char v8 = *(unsigned char *)(a1 + 64);
  char v6 = objc_msgSend(v4, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v5, &obj, v7);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
}

uint64_t __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2_90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_setManagementProfileLocked:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateAccountsWithRMIdentifier:(id)a3 managedAppleID:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6 enrollmentURL:(id)a7 personaID:(id)a8
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v13 = a4;
  id v49 = a5;
  id v50 = a6;
  id v51 = a7;
  id v52 = a8;
  id v14 = [MEMORY[0x263EFB210] defaultStore];
  id v15 = objc_msgSend(v14, "dmc_iCloudAccountWithUsername:", v13);
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 username];
    id v18 = objc_msgSend(v16, "dmc_altDSID");
    uint64_t v84 = 0;
    uint64_t v85 = &v84;
    uint64_t v86 = 0x2020000000;
    char v87 = 1;
    id v19 = v13;
    *(void *)BOOL v78 = 0;
    __int16 v79 = v78;
    uint64_t v80 = 0x3032000000;
    uint64_t v81 = __Block_byref_object_copy_;
    v82 = __Block_byref_object_dispose_;
    id v83 = 0;
    id v20 = (void *)MEMORY[0x263F38BB8];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke;
    v67[3] = &unk_264778B20;
    id v76 = &v84;
    uint64_t v45 = v14;
    id v21 = v14;
    id v68 = v21;
    id v22 = v48;
    id v69 = v22;
    id v77 = v78;
    id v23 = v17;
    id v70 = v23;
    id v71 = v50;
    id v46 = v18;
    id v72 = v46;
    id v24 = v52;
    id v73 = v24;
    id v74 = v49;
    id v75 = v51;
    id v25 = (id)[v20 performBlockUnderPersona:v24 block:v67];
    if (*((unsigned char *)v85 + 24))
    {
      uint64_t v26 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        id v89 = v22;
        _os_log_impl(&dword_225D9B000, v26, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
      }
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_91;
      v65[3] = &unk_264778B48;
      id v66 = v22;
      char v27 = (void *)MEMORY[0x22A6404E0](v65);
      id v28 = (void *)MEMORY[0x263F38BB8];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2_92;
      v59[3] = &unk_264778A88;
      long long v63 = &v84;
      id v29 = v21;
      id v60 = v29;
      id v30 = v46;
      id v61 = v30;
      uint64_t v64 = v78;
      id v31 = v27;
      id v62 = v31;
      id v32 = v28;
      id v13 = v19;
      id v33 = (id)[v32 performBlockUnderPersona:v24 block:v59];
      if (*((unsigned char *)v85 + 24))
      {
        id v34 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_225D9B000, v34, OS_LOG_TYPE_DEFAULT, "iCloud Account Saved Successfully.", buf, 2u);
        }
        id v35 = (void *)MEMORY[0x263F38BB8];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_93;
        v53[3] = &unk_264778A88;
        uint64_t v57 = &v84;
        id v54 = v29;
        id v55 = v30;
        long long v58 = v78;
        id v56 = v31;
        id v36 = (id)[v35 performBlockUnderPersona:v24 block:v53];
        id v13 = v19;
        if (*((unsigned char *)v85 + 24))
        {
          char v37 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_225D9B000, v37, OS_LOG_TYPE_DEFAULT, "iTunes Account Saved Successfully.", buf, 2u);
          }
          [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
        }
        else
        {
          id v43 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            id v44 = (void *)*((void *)v79 + 5);
            *(_DWORD *)id buf = 138543362;
            id v89 = v44;
            _os_log_impl(&dword_225D9B000, v43, OS_LOG_TYPE_ERROR, "Error Updating iTunes Account: %{public}@", buf, 0xCu);
          }
          [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:*((void *)v79 + 5) canceled:0];
        }
      }
      else
      {
        id v41 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          char v42 = (void *)*((void *)v79 + 5);
          *(_DWORD *)id buf = 138543362;
          id v89 = v42;
          _os_log_impl(&dword_225D9B000, v41, OS_LOG_TYPE_ERROR, "Error Updating iCloud Account: %{public}@", buf, 0xCu);
        }
        [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:*((void *)v79 + 5) canceled:0];
      }
    }
    else
    {
      uint64_t v39 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = (void *)*((void *)v79 + 5);
        *(_DWORD *)id buf = 138543362;
        id v89 = v40;
        _os_log_impl(&dword_225D9B000, v39, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
      }
      [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:*((void *)v79 + 5) canceled:0];
    }

    id v14 = v45;
    _Block_object_dispose(v78, 8);

    _Block_object_dispose(&v84, 8);
  }
  else
  {
    uint64_t v38 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v78 = 0;
      _os_log_impl(&dword_225D9B000, v38, OS_LOG_TYPE_ERROR, "Error Missing Apple Account during User Enrollment", v78, 2u);
    }
    id v23 = +[DMCEnrollmentFlowController _createMissingAppleAccountForUserEnrollmentError];
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v23 canceled:0];
  }
}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 104) + 8);
  id v12 = *(id *)(v4 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2;
  v5[3] = &unk_264778AF8;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 88);
  LOBYTE(v2) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v3, &v12, v5);
  objc_storeStrong((id *)(v4 + 40), v12);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = (_BYTE)v2;
}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setUsername:v3];
  [v4 setAccountDescription:a1[5]];
  objc_msgSend(v4, "dmc_setAltDSID:", a1[6]);
  objc_msgSend(v4, "dmc_setPersonaIdentifier:", a1[7]);
  objc_msgSend(v4, "dmc_setManagementProfileIdentifier:", a1[8]);
  objc_msgSend(v4, "dmc_setEnrollmentURL:", a1[9]);
}

uint64_t __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_91(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_setRemoteManagingAccountIdentifier:", *(void *)(a1 + 32));
}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2_92(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EFAE58];
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  char v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_93(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EFB000];
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v6 + 40);
  char v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
}

- (void)_reauthenticationCompleteWithRMIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  char v6 = objc_opt_respondsToSelector();

  char v7 = *(NSObject **)DMCLogObjects();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_DEBUG, "Reauthentication complete for: %{public}@.", (uint8_t *)&v10, 0xCu);
    }
    id v9 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    [v9 reauthenticationComplete];
  }
  else if (v8)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_225D9B000, v7, OS_LOG_TYPE_DEBUG, "Cannot complete reauthentication.", (uint8_t *)&v10, 2u);
  }
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

- (void)_requestiCloudSignInConfirmation
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(DMCEnrollmentFlowController *)self presenter];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke;
  v4[3] = &unk_2647788F8;
  objc_copyWeak(&v5, &location);
  [v3 requestiCloudSignInConfirmationWithCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained workerQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke_2;
    v6[3] = &unk_2647788D0;
    void v6[4] = v4;
    char v7 = a2;
    [v5 queueBlock:v6];
  }
}

uint64_t __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 29)
  {
    uint64_t v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      char v6 = "-[DMCEnrollmentFlowController _requestiCloudSignInConfirmation]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [v3 _pollNextStep];
  }
  else {
    return [v3 _flowTerminatedWithError:0 canceled:1];
  }
}

- (void)_promoteiCloudWithAltDSID:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263EFB210] defaultStore];
  char v6 = objc_msgSend(v5, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v4);

  objc_initWeak(&location, self);
  uint64_t v7 = [(DMCEnrollmentFlowController *)self presenter];
  BOOL v8 = objc_msgSend(v6, "dmc_accountQuotaString");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke;
  v9[3] = &unk_264778B70;
  objc_copyWeak(&v10, &location);
  [v7 showiCloudPromotionPageWithiCloudQuotaString:v8 completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained workerQueue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke_2;
    v4[3] = &unk_2647785B0;
    void v4[4] = v2;
    [v3 queueBlock:v4];
  }
}

uint64_t __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 28)
  {
    uint64_t v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      int v5 = "-[DMCEnrollmentFlowController _promoteiCloudWithAltDSID:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_askForRestoreChoiceWithMAID:(id)a3 personaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  BOOL v8 = [(DMCEnrollmentFlowController *)self presenter];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke;
  v9[3] = &unk_2647788F8;
  objc_copyWeak(&v10, &location);
  [v8 suggestRestoreForAccountWithUsername:v6 personaID:v7 completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained workerQueue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke_2;
    v4[3] = &unk_2647785B0;
    void v4[4] = v2;
    [v3 queueBlock:v4];
  }
}

uint64_t __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 31)
  {
    uint64_t v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      int v5 = "-[DMCEnrollmentFlowController _askForRestoreChoiceWithMAID:personaID:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_installEnterpriseApplication:(id)a3 debuggingAppIDs:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke;
  v12[3] = &unk_264778C88;
  v12[4] = self;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  [(DMCEnrollmentFlowController *)self _fetchBundleIDsWithiTunesItemID:v10 debuggingAppIDs:a4 completionHandler:v12];
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) workerQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2;
  v8[3] = &unk_264778B98;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  [v4 queueBlock:v8];
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    if ([MEMORY[0x263F38B58] ESSOTestModeEnabled])
    {
LABEL_16:
      if ([MEMORY[0x263F38B70] allowAnyESSOApplicationEntitlements])
      {
        id v14 = 0;
      }
      else
      {
        uint64_t v40 = @"com.apple.developer.enrollment-sso-capable";
        id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
      }
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_97;
      v30[3] = &unk_264778B98;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = *(void **)(a1 + 48);
      id v31 = v15;
      uint64_t v32 = v16;
      id v33 = v17;
      id v18 = v14;
      id v34 = v18;
      id v19 = (void *)MEMORY[0x22A6404E0](v30);
      id v20 = (void *)MEMORY[0x263F38BB8];
      uint64_t v21 = *(void *)(a1 + 48);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      void v25[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_98;
      v25[3] = &unk_264778C60;
      int8x16_t v24 = *(int8x16_t *)(a1 + 32);
      id v22 = (id)v24.i64[0];
      int8x16_t v26 = vextq_s8(v24, v24, 8uLL);
      id v27 = v18;
      id v29 = v19;
      id v28 = *(id *)(a1 + 56);
      id v23 = v19;
      id v9 = v18;
      [v20 setPersonaIdentifierForApps:v22 personaID:v21 completionHandler:v25];
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v2 = *(id *)(a1 + 32);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v36;
        while (2)
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v36 != v5) {
              objc_enumerationMutation(v2);
            }
            if (![*(id *)(a1 + 40) _appWithBundleIDExists:*(void *)(*((void *)&v35 + 1) + 8 * v6)])
            {

              goto LABEL_16;
            }
            ++v6;
          }
          while (v4 != v6);
          uint64_t v4 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }

      id v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) firstObject];
      id v9 = [v7 _appNameWithBundleID:v8];

      uint64_t v10 = *(void **)(a1 + 40);
      id v11 = +[DMCEnrollmentFlowController _createEnterpriseApplicationExistsErrorWithAppName:v9];
      [v10 _flowTerminatedWithError:v11 canceled:0];
    }
  }
  else
  {
    id v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_225D9B000, v12, OS_LOG_TYPE_ERROR, "No application bundle ID", buf, 2u);
    }
    id v13 = *(void **)(a1 + 40);
    id v9 = +[DMCEnrollmentFlowController _createMissingEnterpriseApplicationBundleIDError];
    [v13 _flowTerminatedWithError:v9 canceled:0];
  }
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_97(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3)
  {

    id v14 = *(void **)(a1 + 40);
LABEL_13:
    id v5 = +[DMCEnrollmentFlowController _createMissingEnterpriseApplicationError];
    goto LABEL_14;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v17;
  while (2)
  {
    uint64_t v7 = 0;
    id v8 = v5;
    do
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      id v15 = v8;
      char v13 = [v10 _validateBundleID:v9 personaID:v11 requiredEntitlements:v12 error:&v15];
      id v5 = v15;

      if (v13)
      {
        [*(id *)(a1 + 40) setAppBundleID:v9];

        [*(id *)(a1 + 40) _pollNextStep];
        goto LABEL_15;
      }
      ++v7;
      id v8 = v5;
    }
    while (v4 != v7);
    uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4) {
      continue;
    }
    break;
  }

  id v14 = *(void **)(a1 + 40);
  if (!v5) {
    goto LABEL_13;
  }
LABEL_14:
  [v14 _flowTerminatedWithError:v5 canceled:0];
LABEL_15:
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _flowTerminatedWithError:v3 canceled:0];
  }
  else
  {
    if ([MEMORY[0x263F38B58] ESSOTestModeEnabled])
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v4 = [*(id *)(a1 + 32) presenter];
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_3;
      v15[3] = &unk_264778BE8;
      uint64_t v7 = &v18;
      objc_copyWeak(&v18, &location);
      id v16 = *(id *)(a1 + 40);
      id v17 = *(id *)(a1 + 64);
      [v4 requestDebuggingApplicationsInstallation:v5 requiredEntitlements:v6 completionHandler:v15];

      id v8 = v16;
    }
    else
    {
      [*(id *)(a1 + 32) _trackDirtyAppBundleIDs:*(void *)(a1 + 40)];
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v9 = [*(id *)(a1 + 32) presenter];
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_99;
      v12[3] = &unk_264778C38;
      uint64_t v7 = &v14;
      objc_copyWeak(&v14, &location);
      id v13 = *(id *)(a1 + 64);
      [v9 requestESSOApplicationInstallationWithITunesItemID:v10 requiredEntitlements:v11 completionHandler:v12];

      id v8 = v13;
    }

    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_3(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained workerQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_4;
    v9[3] = &unk_264778BC0;
    void v9[4] = v7;
    char v13 = a2;
    id v10 = v5;
    id v11 = a1[4];
    id v12 = a1[5];
    [v8 queueBlock:v9];
  }
}

uint64_t __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 6)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[DMCEnrollmentFlowController _installEnterpriseApplication:debuggingAppIDs:personaID:]_block_invoke_4";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v6, 0xCu);
    }
  }
  id v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = *(void *)(a1 + 40) == 0;
  }
  if (!v4) {
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:");
  }
  [v3 _trackDirtyAppBundleIDs:*(void *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_99(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained workerQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_100;
    v9[3] = &unk_264778C10;
    void v9[4] = v7;
    char v12 = a2;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    [v8 queueBlock:v9];
  }
}

uint64_t __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_100(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 6)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      int v6 = "-[DMCEnrollmentFlowController _installEnterpriseApplication:debuggingAppIDs:personaID:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(void *)(a1 + 40) == 0;
  }
  if (v3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:");
  }
}

- (BOOL)_validateBundleID:(id)a3 personaID:(id)a4 requiredEntitlements:(id)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v30 = v9;
  char v12 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:a6];
  char v13 = v12;
  id v31 = a6;
  if (*a6)
  {
    id v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = *a6;
      *(_DWORD *)id buf = 138543618;
      id v39 = v9;
      __int16 v40 = 2114;
      id v41 = v15;
      _os_log_impl(&dword_225D9B000, v14, OS_LOG_TYPE_ERROR, "Failed to load record for app: %{public}@ with error: %{public}@", buf, 0x16u);
    }
    char v16 = 0;
  }
  else
  {
    id v17 = [v12 managedPersonas];
    if ([v17 containsObject:v10])
    {
      id v28 = v11;
      id v29 = v10;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      obuint64_t j = v11;
      uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        char v16 = 1;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            id v23 = [v13 entitlements];
            int8x16_t v24 = [v23 objectForKey:v22 ofClass:objc_opt_class()];
            char v25 = [v24 BOOLValue];

            if ((v25 & 1) == 0)
            {
              int8x16_t v26 = *(NSObject **)DMCLogObjects();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)id buf = 138543618;
                id v39 = v30;
                __int16 v40 = 2114;
                id v41 = v22;
                _os_log_impl(&dword_225D9B000, v26, OS_LOG_TYPE_ERROR, "Application (%{public}@) doesn't have the required entitlement: %{public}@", buf, 0x16u);
              }
              +[DMCEnrollmentFlowController _createEnterpriseApplicationMissingEntitlementsError];
              char v16 = 0;
              *id v31 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v19);
      }
      else
      {
        char v16 = 1;
      }

      id v11 = v28;
      id v10 = v29;
    }
    else
    {
      char v16 = 0;
    }
  }
  return v16 & 1;
}

- (void)_trackDirtyAppBundleIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = [(DMCEnrollmentFlowController *)self dirtyState];
        [v10 addDirtyBundleID:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  id v11 = [(DMCEnrollmentFlowController *)self dirtyState];
  [(DMCEnrollmentFlowController *)self _writeDirtyStateToDisk:v11];
}

- (void)_installESSOConfigurationProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  id v18 = 0;
  char v12 = [v11 validateESSOConfigurationProfile:v8 error:&v18];
  id v13 = v18;

  if (v12)
  {
    long long v14 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    long long v15 = [v14 extensionIDsFromESSOConfigurationProfile:v8];
    [(DMCEnrollmentFlowController *)self setExtensionIdentifiersFromConfig:v15];

    char v16 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    id v17[2] = __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke;
    v17[3] = &unk_264778CB0;
    void v17[4] = self;
    [v16 installEnrollmentProfile:v8 devicePasscode:v9 personaID:v10 rmAccountIdentifier:0 completionHandler:v17];
  }
  else
  {
    [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v13 canceled:0];
  }
}

void __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) workerQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke_2;
  v12[3] = &unk_264778830;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v9;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 queueBlock:v12];
}

uint64_t __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v3;
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "ESSO configuration profile installation failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    return [*(id *)(a1 + 40) _flowTerminatedWithError:*(void *)(a1 + 32) canceled:0];
  }
  else
  {
    [*(id *)(a1 + 40) setESSOConfigurationProfileIdentifier:*(void *)(a1 + 48)];
    uint64_t v5 = [*(id *)(a1 + 40) dirtyState];
    [v5 addDirtyProfileIdentifier:*(void *)(a1 + 48)];

    id v6 = *(void **)(a1 + 40);
    id v7 = [v6 dirtyState];
    [v6 _writeDirtyStateToDisk:v7];

    id v8 = *(void **)(a1 + 40);
    return [v8 _pollNextStep];
  }
}

- (void)_awaitESSOConfigActivationWithExtensionIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__DMCEnrollmentFlowController__awaitESSOConfigActivationWithExtensionIdentifiers___block_invoke;
  v6[3] = &unk_2647788A8;
  void v6[4] = self;
  [v5 _awaitESSOConfigActivationWithExtensionIdentifiers:v4 completionHandler:v6];
}

void __82__DMCEnrollmentFlowController__awaitESSOConfigActivationWithExtensionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__DMCEnrollmentFlowController__awaitESSOConfigActivationWithExtensionIdentifiers___block_invoke_2;
  v7[3] = &unk_264778CD8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 queueBlock:v7];
}

uint64_t __82__DMCEnrollmentFlowController__awaitESSOConfigActivationWithExtensionIdentifiers___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v1 = *(void **)(a1 + 40);
  if (v2) {
    return [v1 _flowTerminatedWithError:v2 canceled:0];
  }
  else {
    return [v1 _pollNextStep];
  }
}

- (void)_manageApplicationWithAppBundleID:(id)a3 essoDetails:(id)a4 organization:(id)a5 personaID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  id v15 = [v12 iTunesStoreID];
  char v16 = [v12 associatedDomains];
  uint64_t v17 = [v12 associatedDomainsEnableDirectDownloads];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __100__DMCEnrollmentFlowController__manageApplicationWithAppBundleID_essoDetails_organization_personaID___block_invoke;
  v18[3] = &unk_2647788A8;
  void v18[4] = self;
  [v14 manageApplicationWithBundleID:v13 iTunesItemID:v15 organization:v11 personaID:v10 associatedDomains:v16 associatedDomainsEnableDirectDownloads:v17 configuration:0 completionHandler:v18];
}

uint64_t __100__DMCEnrollmentFlowController__manageApplicationWithAppBundleID_essoDetails_organization_personaID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 _flowTerminatedWithError:a2 canceled:0];
  }
  else {
    return [v2 _pollNextStep];
  }
}

- (void)_restoreSetAsideProfiles
{
  id v3 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__DMCEnrollmentFlowController__restoreSetAsideProfiles__block_invoke;
    v8[3] = &unk_2647788A8;
    void v8[4] = self;
    [v5 restoreSetAsideCloudConfigAndProfilesWithCompletionHandler:v8];
  }
  else
  {
    id v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_DEFAULT, "Nothing to restore, continue...", v7, 2u);
    }
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
}

void __55__DMCEnrollmentFlowController__restoreSetAsideProfiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    char v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_225D9B000, v4, OS_LOG_TYPE_ERROR, "Failed to restore set aside profiles with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_fetchCloudConfigWithEnrollmentType:(unint64_t)a3 isReturnToService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(DMCEnrollmentFlowController *)self presenter];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(DMCEnrollmentFlowController *)self presenter];
    [v8 showFetchingCloudConfigurationScene];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke;
  v18[3] = &unk_264778D00;
  void v18[4] = self;
  BOOL v19 = v4;
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x22A6404E0](v18);
  if (v4
    && ([(DMCEnrollmentFlowController *)self obliterationShelter],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 cloudConfigurationDetails],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    id v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_225D9B000, v12, OS_LOG_TYPE_DEFAULT, "Device has local Cloud Config profile from Return to Service, restoring...", buf, 2u);
    }
    ((void (**)(void, void *, void))v9)[2](v9, v11, 0);
  }
  else if ([MEMORY[0x263F38B70] shouldSimulateDEPCommunication])
  {
    dispatch_time_t v13 = dispatch_time(0, 1000000000);
    uint64_t v14 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke_107;
    block[3] = &unk_264778D28;
    char v16 = v9;
    dispatch_after(v13, v14, block);

    id v11 = v16;
  }
  else
  {
    id v11 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    [v11 fetchCloudConfigWithCompletionHandler:v9];
  }
}

void __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void *)[v10 copy];
    [*(id *)(a1 + 32) setCloudConfig:v6];

    char v7 = *(void **)(a1 + 32);
LABEL_3:
    [v7 _pollNextStep];
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    char v7 = *(void **)(a1 + 32);
    if (!v5) {
      goto LABEL_3;
    }
    id v8 = v5;
    BOOL v9 = 0;
  }
  else
  {
    char v7 = *(void **)(a1 + 32);
    BOOL v9 = v5 == 0;
    id v8 = v5;
  }
  [v7 _flowTerminatedWithError:v8 canceled:v9];
LABEL_9:
}

void __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke_107(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F38B70] simulatedCloudConfigProfile];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)_analyzeCloudConfig:(id)a3 enrollmentType:(unint64_t)a4 isReturnToService:(BOOL)a5 obliterationShelter:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = v11;
  if (!v7)
  {
LABEL_7:
    int v16 = 0;
    goto LABEL_9;
  }
  if (([v11 isSupervised] & 1) == 0)
  {
    dispatch_time_t v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F528B0]];
    int v14 = [v13 BOOLValue];

    if (v14)
    {
      id v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_DEFAULT, "Supervision state has changed, continue as non-RTS flow.", buf, 2u);
      }
      [(DMCEnrollmentFlowController *)self setIsReturnToService:0];
      [v12 clear];
      goto LABEL_7;
    }
  }
  int v16 = 1;
LABEL_9:
  uint64_t v17 = [v10 objectForKeyedSubscript:*MEMORY[0x263F528A0]];
  id v18 = v17;
  if (!v17)
  {
    uint64_t v21 = [v10 objectForKeyedSubscript:*MEMORY[0x263F52870]];
    id v22 = certificatesFromDERCertificateDataArray();
    [(DMCEnrollmentFlowController *)self setAnchorCertificateRefs:v22];
    int8x16_t v26 = NSURL;
    id v27 = [v10 objectForKeyedSubscript:*MEMORY[0x263F52890]];
    id v23 = [v26 URLWithString:v27];

    if ([(DMCEnrollmentFlowController *)self _canSkipMDMEnrollmentWithEnrollmentType:a4])
    {
      id v28 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v46 = 0;
        _os_log_impl(&dword_225D9B000, v28, OS_LOG_TYPE_DEFAULT, "The MDM enrollment is done already! Fast forward to AwaitDeviceConfiguration", v46, 2u);
      }
      goto LABEL_34;
    }
    if (v23)
    {
      id v30 = *(NSObject **)DMCLogObjects();
      if (v16)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v45 = 0;
          _os_log_impl(&dword_225D9B000, v30, OS_LOG_TYPE_ERROR, "Return to Service: Does not support webURL!", v45, 2u);
        }
        uint64_t v29 = +[DMCEnrollmentFlowController _createUnsupportedFeatureError];
        goto LABEL_21;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v44 = 0;
        _os_log_impl(&dword_225D9B000, v30, OS_LOG_TYPE_DEFAULT, "Cloud config has Web URL", v44, 2u);
      }
      [(DMCEnrollmentFlowController *)self setServiceURL:v23];
      [(DMCEnrollmentFlowController *)self setEnrollmentMethod:6];
      long long v34 = [(DMCEnrollmentFlowController *)self _ADE_deviceEnrollment_webURL_steps];
      [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v34];
      goto LABEL_33;
    }
    uint64_t v32 = NSURL;
    long long v33 = [v10 objectForKeyedSubscript:*MEMORY[0x263F52888]];
    long long v34 = [v32 URLWithString:v33];

    [(DMCEnrollmentFlowController *)self setServiceURL:v34];
    [(DMCEnrollmentFlowController *)self setEnrollmentMethod:3];
    long long v35 = *(NSObject **)DMCLogObjects();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (!v36)
      {
LABEL_32:
        id v39 = [(DMCEnrollmentFlowController *)self _ADE_deviceEnrollment_legacy_steps];
        [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v39];

LABEL_33:
LABEL_34:
        uint64_t v25 = [(DMCEnrollmentFlowController *)self _ADE_postEnrollmentSteps];
        goto LABEL_35;
      }
      __int16 v43 = 0;
      long long v37 = "Cloud config has traditional configuration URL.";
      long long v38 = (uint8_t *)&v43;
    }
    else
    {
      if (!v16)
      {
        if (v36)
        {
          *(_WORD *)id v41 = 0;
          _os_log_impl(&dword_225D9B000, v35, OS_LOG_TYPE_DEFAULT, "Cloud config doesn't require an enrollment.", v41, 2u);
        }
        goto LABEL_36;
      }
      if (!v36) {
        goto LABEL_32;
      }
      *(_WORD *)uint64_t v42 = 0;
      long long v37 = "Cloud config has no configuration URL. But we are doing Return to Service!";
      long long v38 = v42;
    }
    _os_log_impl(&dword_225D9B000, v35, OS_LOG_TYPE_DEFAULT, v37, v38, 2u);
    goto LABEL_32;
  }
  BOOL v19 = NSURL;
  uint64_t v20 = [v17 objectForKeyedSubscript:*MEMORY[0x263F528A8]];
  uint64_t v21 = [v19 URLWithString:v20];

  id v22 = [v18 objectForKeyedSubscript:*MEMORY[0x263F52898]];
  id v23 = certificatesFromDERCertificateDataArray();
  if (v21)
  {
    [(DMCEnrollmentFlowController *)self setAnchorCertificateRefs:v23];
    [(DMCEnrollmentFlowController *)self setServiceURL:v21];
    [(DMCEnrollmentFlowController *)self setEnrollmentType:1];
    int8x16_t v24 = [(DMCEnrollmentFlowController *)self _ORGO_pre_enrollment_steps];
    [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v24];

    uint64_t v25 = [(DMCEnrollmentFlowController *)self _ORGO_commonSteps];
LABEL_35:
    __int16 v40 = (void *)v25;
    [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v25];

LABEL_36:
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
    goto LABEL_37;
  }
  uint64_t v29 = +[DMCEnrollmentFlowController _createInvalidCloudConfigError];
LABEL_21:
  id v31 = (void *)v29;
  [(DMCEnrollmentFlowController *)self _flowTerminatedWithError:v29 canceled:0];

LABEL_37:
}

- (void)_storeCloudConfig:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__DMCEnrollmentFlowController__storeCloudConfig___block_invoke;
    v7[3] = &unk_264778D50;
    void v7[4] = self;
    id v8 = v4;
    [v5 storeCloudConfig:v8 completionHandler:v7];
  }
  else
  {
    id v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_DEFAULT, "No cloud config to store. Skipping...", buf, 2u);
    }
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
}

void __49__DMCEnrollmentFlowController__storeCloudConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_225D9B000, v4, OS_LOG_TYPE_DEFAULT, "Failed to store cloud config. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 32) _flowTerminatedWithError:v3 canceled:0];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      BOOL v7 = [*(id *)(a1 + 32) delegate];
      [v7 enrollmentFlowController:*(void *)(a1 + 32) didReceiveCloudConfiguration:*(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 32) _pollNextStep];
  }
}

- (void)_waitForDeviceConfiguration
{
  id v3 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      int v7 = [v6 isDeviceConfigured];

      if (v7)
      {
        [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
      }
      else
      {
        id v9 = [(DMCEnrollmentFlowController *)self presenter];
        int v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          id v11 = [(DMCEnrollmentFlowController *)self presenter];
          [v11 showAwaitingDeviceConfigurationScene];
        }
        objc_initWeak(buf, self);
        id v12 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke;
        v13[3] = &unk_264778B70;
        objc_copyWeak(&v14, buf);
        [v12 awaitDeviceConfiguredWithCompletionHandler:v13];

        objc_destroyWeak(&v14);
        objc_destroyWeak(buf);
      }
      return;
    }
  }
  else
  {
  }
  int v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_225D9B000, v8, OS_LOG_TYPE_DEFAULT, "Client doesn't support isDeviceConfigured method, returning...", (uint8_t *)buf, 2u);
  }
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

void __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained workerQueue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke_2;
    v4[3] = &unk_2647785B0;
    void v4[4] = v2;
    [v3 queueBlock:v4];
  }
}

uint64_t __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 39)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      char v5 = "-[DMCEnrollmentFlowController _waitForDeviceConfiguration]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_askForMDMUsernameAndCredential
{
  id v3 = [(DMCEnrollmentFlowController *)self presenter];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_initWeak(&location, self);
    char v5 = [(DMCEnrollmentFlowController *)self presenter];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke;
    v6[3] = &unk_264778D78;
    objc_copyWeak(&v7, &location);
    [v5 requestMDMUsernameAndPasswordWithCompletionHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained workerQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke_2;
    v12[3] = &unk_264778718;
    void v12[4] = v10;
    char v15 = a4;
    id v13 = v7;
    id v14 = v8;
    [v11 queueBlock:v12];
  }
}

uint64_t __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 36)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      char v5 = "-[DMCEnrollmentFlowController _askForMDMUsernameAndCredential]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*(unsigned char *)(a1 + 56)) {
    return [*(id *)(a1 + 32) _flowTerminatedWithError:0 canceled:1];
  }
  [*(id *)(a1 + 32) setUsername:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPassword:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) _pollNextStep];
}

- (void)_fetchEnrollmentProfileFromServiceURL:(id)a3 username:(id)a4 password:(id)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  uint64_t v17 = [(DMCEnrollmentFlowController *)self serviceDiscoveryHelper];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke;
  v18[3] = &unk_264778DA0;
  objc_copyWeak(&v19, &location);
  [v17 fetchEnrollmentProfileWithServiceURL:v12 username:v13 password:v14 authTokens:0 enrollmentMethod:3 machineInfo:v15 anchorCertificateRefs:v16 completionHandler:v18];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workerQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke_2;
    v10[3] = &unk_264778830;
    void v10[4] = v8;
    id v11 = v6;
    id v12 = v5;
    [v9 queueBlock:v10];
  }
}

void __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 37)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136315138;
      id v13 = "-[DMCEnrollmentFlowController _fetchEnrollmentProfileFromServiceURL:username:password:machineInfo:anchorCert"
            "ificateRefs:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    int v4 = [v3 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x263F38AB0]];

    if (!v5
      || ([*(id *)(a1 + 32) _handleSoftwareUpdateRequiredError:*(void *)(a1 + 40)] & 1) == 0
      && ([*(id *)(a1 + 32) _handleNeedCredentialsError:*(void *)(a1 + 40)] & 1) == 0)
    {
      [*(id *)(a1 + 32) _flowTerminatedWithError:*(void *)(a1 + 40) canceled:0];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setProfileData:*(void *)(a1 + 48)];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 profileData];
    id v11 = 0;
    char v8 = [v6 _extractAndVerifyPropertiesFromProfileData:v7 enrollmentMethod:3 isESSO:0 essoAppITunesStoreID:0 error:&v11];
    id v9 = v11;

    int v10 = *(void **)(a1 + 32);
    if (v8) {
      [v10 _pollNextStep];
    }
    else {
      [v10 _flowTerminatedWithError:v9 canceled:0];
    }
  }
}

- (BOOL)_handleNeedCredentialsError:(id)a3
{
  id v4 = a3;
  int v5 = [v4 domain];
  if (([v5 isEqualToString:*MEMORY[0x263F38AB0]] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 23003)
  {
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  id v7 = [(DMCEnrollmentFlowControllerBase *)self stepQueue];
  char v8 = [(DMCEnrollmentFlowController *)self _ADE_deviceEnrollment_legacy_additionalNativeAuth_steps];
  id v9 = [v8 firstObject];
  uint64_t v10 = [v7 indexOfObject:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [(DMCEnrollmentFlowController *)self _ADE_deviceEnrollment_legacy_additionalNativeAuth_steps];
    id v12 = [(DMCEnrollmentFlowControllerBase *)self stepQueue];
    id v13 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", -[DMCEnrollmentFlowControllerBase nextStepIndex](self, "nextStepIndex"), objc_msgSend(v11, "count"));
    [v12 insertObjects:v11 atIndexes:v13];
  }
  else
  {
    id v15 = [(DMCEnrollmentFlowController *)self presenter];
    [v15 showEnrollmentFailure:v4];

    [(DMCEnrollmentFlowControllerBase *)self setNextStepIndex:v10];
  }
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  BOOL v14 = 1;
LABEL_9:

  return v14;
}

- (void)_fetchEnrollmentProfileFromWebURL:(id)a3 machineInfo:(id)a4 anchorCertificateRefs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DMCEnrollmentFlowController *)self presenter];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    objc_initWeak(&location, self);
    id v13 = [(DMCEnrollmentFlowController *)self presenter];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke;
    v14[3] = &unk_264778DC8;
    objc_copyWeak(&v15, &location);
    [v13 fetchEnrollmentProfileWithWebAuthURL:v8 machineInfo:v9 anchorCertificateRefs:v10 completionHandler:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained workerQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke_2;
    v12[3] = &unk_264778718;
    void v12[4] = v10;
    id v13 = v8;
    char v15 = a3;
    id v14 = v7;
    [v11 queueBlock:v12];
  }
}

void __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 38)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 136315138;
      id v11 = "-[DMCEnrollmentFlowController _fetchEnrollmentProfileFromWebURL:machineInfo:anchorCertificateRefs:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  if (([*(id *)(a1 + 32) _handleSoftwareUpdateRequiredError:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56) || v3)
    {
      [*(id *)(a1 + 32) _flowTerminatedWithError:v3 canceled:*(unsigned __int8 *)(a1 + 56) != 0];
    }
    else
    {
      [*(id *)(a1 + 32) setProfileData:*(void *)(a1 + 48)];
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 48);
      id v9 = 0;
      char v6 = [v4 _extractAndVerifyPropertiesFromProfileData:v5 enrollmentMethod:6 isESSO:0 essoAppITunesStoreID:0 error:&v9];
      id v7 = v9;
      id v8 = *(void **)(a1 + 32);
      if (v6) {
        [v8 _pollNextStep];
      }
      else {
        [v8 _flowTerminatedWithError:v7 canceled:0];
      }
    }
  }
}

- (BOOL)_handleSoftwareUpdateRequiredError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F38AB0]];
  if (v6)
  {
    uint64_t v7 = [v4 code];

    if (v7 != 23006)
    {
      LOBYTE(v6) = 0;
      goto LABEL_6;
    }
    id v8 = [v4 userInfo];
    uint64_t v5 = [v8 objectForKeyedSubscript:*MEMORY[0x263F38C00]];

    id v9 = [v4 userInfo];
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F38BF8]];

    [(DMCEnrollmentFlowController *)self setExpectedOSVersion:v5];
    [(DMCEnrollmentFlowController *)self setExpectedBuildVersion:v10];
    id v11 = [(DMCEnrollmentFlowController *)self _ADE_deviceEnrollment_softwareUpdate_steps];
    uint64_t v12 = [(DMCEnrollmentFlowControllerBase *)self stepQueue];
    id v13 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", -[DMCEnrollmentFlowControllerBase nextStepIndex](self, "nextStepIndex"), objc_msgSend(v11, "count"));
    [v12 insertObjects:v11 atIndexes:v13];

    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }

LABEL_6:
  return v6;
}

- (void)_ensureWiFiConnectionWithWiFiProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke;
    v9[3] = &unk_264778DF0;
    objc_copyWeak(&v10, &location);
    [v5 installEnrollmentProfile:v4 devicePasscode:0 personaID:0 rmAccountIdentifier:0 completionHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  int v6 = [(DMCEnrollmentFlowController *)self presenter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_123;
  v7[3] = &unk_264778E18;
  objc_copyWeak(&v8, &location);
  [v6 ensureNetworkConnectionWithCompletionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained workerQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2;
    v12[3] = &unk_264778718;
    char v16 = a3;
    id v13 = v8;
    id v14 = v10;
    id v15 = v7;
    [v11 queueBlock:v12];
  }
}

void __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v14 = 138543362;
    uint64_t v15 = v3;
    id v4 = "Failed to install WiFi profile: %{public}@";
    uint64_t v5 = v2;
    os_log_type_t v6 = OS_LOG_TYPE_ERROR;
    uint32_t v7 = 12;
LABEL_7:
    _os_log_impl(&dword_225D9B000, v5, v6, v4, (uint8_t *)&v14, v7);
    return;
  }
  int v8 = *(unsigned __int8 *)(a1 + 56);
  id v9 = *(NSObject **)DMCLogObjects();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v10) {
      return;
    }
    LOWORD(v14) = 0;
    id v4 = "WiFi profile installation canceled";
    uint64_t v5 = v9;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    uint32_t v7 = 2;
    goto LABEL_7;
  }
  if (v10)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_225D9B000, v9, OS_LOG_TYPE_DEFAULT, "WiFi profile installed", (uint8_t *)&v14, 2u);
  }
  [*(id *)(a1 + 40) setWifiProfileIdentifier:*(void *)(a1 + 48)];
  id v11 = [*(id *)(a1 + 40) dirtyState];
  [v11 addDirtyProfileIdentifier:*(void *)(a1 + 48)];

  uint64_t v12 = *(void **)(a1 + 40);
  id v13 = [v12 dirtyState];
  [v12 _writeDirtyStateToDisk:v13];
}

void __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_123(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    os_log_type_t v6 = [WeakRetained workerQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2_124;
    v7[3] = &unk_264778CD8;
    void v7[4] = v5;
    id v8 = v3;
    [v6 queueBlock:v7];
  }
}

uint64_t __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2_124(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 41)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint32_t v7 = "-[DMCEnrollmentFlowController _ensureWiFiConnectionWithWiFiProfile:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v6, 0xCu);
    }
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    return [v3 _flowTerminatedWithError:v4 canceled:0];
  }
  else {
    return [v3 _pollNextStep];
  }
}

- (void)_promptForSoftwareUpdateWithExpectedOSVersion:(id)a3 expectedBuildVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(DMCEnrollmentFlowController *)self presenter];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke;
  v9[3] = &unk_264778E18;
  objc_copyWeak(&v10, &location);
  [v8 requestSoftwareUpdateWithOSVersion:v6 buildVersion:v7 completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workerQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke_2;
    v7[3] = &unk_264778CD8;
    void v7[4] = v5;
    id v8 = v3;
    [v6 queueBlock:v7];
  }
}

uint64_t __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 40)
  {
    id v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[DMCEnrollmentFlowController _promptForSoftwareUpdateWithExpectedOSVersion:expectedBuildVersion:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v7, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v3 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(const char **)(a1 + 40);
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_225D9B000, v3, OS_LOG_TYPE_ERROR, "Failed to trigger software update due to error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return [*(id *)(a1 + 32) _flowTerminatedWithError:v5 canceled:v5 == 0];
}

- (void)_enrollmentTypeAuthorizedBySDP:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 > 9 || ((1 << a3) & 0x38F) != 0) {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
  else {
    [MEMORY[0x263F38BD8] isAuthorizedForOperation:1 completion:v5];
  }
}

- (DMCEnrollmentFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)rmAccountIdentifier
{
  return self->_rmAccountIdentifier;
}

- (void)setRmAccountIdentifier:(id)a3
{
}

- (unint64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (void)setDirtyState:(id)a3
{
}

- (DMCEnrollmentFlowPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (DMCEnrollmentFlowMCBridge)managedConfigurationHelper
{
  return self->_managedConfigurationHelper;
}

- (void)setManagedConfigurationHelper:(id)a3
{
}

- (id)enrollmentCompletionHandler
{
  return self->_enrollmentCompletionHandler;
}

- (void)setEnrollmentCompletionHandler:(id)a3
{
}

- (BOOL)restartIfFail
{
  return self->_restartIfFail;
}

- (void)setRestartIfFail:(BOOL)a3
{
  self->_restartIfFail = a3;
}

- (BOOL)cleanupIfFail
{
  return self->_cleanupIfFail;
}

- (void)setCleanupIfFail:(BOOL)a3
{
  self->_cleanupIfFail = a3;
}

- (BOOL)isRenewalFlow
{
  return self->_isRenewalFlow;
}

- (void)setIsRenewalFlow:(BOOL)a3
{
  self->_isRenewalFlow = a3;
}

- (BOOL)isPostRestoration
{
  return self->_isPostRestoration;
}

- (void)setIsPostRestoration:(BOOL)a3
{
  self->_isPostRestoratiouint64_t n = a3;
}

- (BOOL)isPostBuddy
{
  return self->_isPostBuddy;
}

- (void)setIsPostBuddy:(BOOL)a3
{
  self->_isPostBuddy = a3;
}

- (void)setServiceDiscoveryHelper:(id)a3
{
}

- (BOOL)hasExecutedUIStep
{
  return self->_hasExecutedUIStep;
}

- (void)setHasExecutedUIStep:(BOOL)a3
{
  self->_hasExecutedUIStep = a3;
}

- (BOOL)noCompletionScene
{
  return self->_noCompletionScene;
}

- (void)setNoCompletionScene:(BOOL)a3
{
  self->_noCompletionScene = a3;
}

- (NSArray)anchorCertificateRefs
{
  return self->_anchorCertificateRefs;
}

- (void)setAnchorCertificateRefs:(id)a3
{
}

- (unint64_t)enrollmentMethod
{
  return self->_enrollmentMethod;
}

- (void)setEnrollmentMethod:(unint64_t)a3
{
  self->_enrollmentMethod = a3;
}

- (NSString)devicePasscode
{
  return self->_devicePasscode;
}

- (void)setDevicePasscode:(id)a3
{
}

- (NSData)devicePasscodeData
{
  return self->_devicePasscodeData;
}

- (void)setDevicePasscodeData:(id)a3
{
}

- (unint64_t)devicePasscodeDataType
{
  return self->_devicePasscodeDataType;
}

- (void)setDevicePasscodeDataType:(unint64_t)a3
{
  self->_devicePasscodeDataType = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
}

- (NSArray)servers
{
  return self->_servers;
}

- (void)setServers:(id)a3
{
}

- (unint64_t)serverInformationSource
{
  return self->_serverInformationSource;
}

- (void)setServerInformationSource:(unint64_t)a3
{
  self->_serverInformationSource = a3;
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
}

- (NSDictionary)authParams
{
  return self->_authParams;
}

- (void)setAuthParams:(id)a3
{
}

- (NSString)enrollmentURL
{
  return self->_enrollmentURL;
}

- (void)setEnrollmentURL:(id)a3
{
}

- (NSDictionary)authTokens
{
  return self->_authTokens;
}

- (void)setAuthTokens:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (NSMutableDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (BOOL)isProfileLocked
{
  return self->_isProfileLocked;
}

- (void)setIsProfileLocked:(BOOL)a3
{
  self->_isProfileLocked = a3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
}

- (NSArray)serverCapabilities
{
  return self->_serverCapabilities;
}

- (void)setServerCapabilities:(id)a3
{
}

- (MDMESSODetails)essoDetails
{
  return self->_essoDetails;
}

- (void)setEssoDetails:(id)a3
{
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSNumber)essoAppITunesStoreID
{
  return self->_essoAppITunesStoreID;
}

- (void)setEssoAppITunesStoreID:(id)a3
{
}

- (NSString)ESSOConfigurationProfileIdentifier
{
  return self->_ESSOConfigurationProfileIdentifier;
}

- (void)setESSOConfigurationProfileIdentifier:(id)a3
{
}

- (NSArray)extensionIdentifiersFromConfig
{
  return self->_extensionIdentifiersFromConfig;
}

- (void)setExtensionIdentifiersFromConfig:(id)a3
{
}

- (NSString)wifiProfileIdentifier
{
  return self->_wifiProfileIdentifier;
}

- (void)setWifiProfileIdentifier:(id)a3
{
}

- (NSString)expectedOSVersion
{
  return self->_expectedOSVersion;
}

- (void)setExpectedOSVersion:(id)a3
{
}

- (NSString)expectedBuildVersion
{
  return self->_expectedBuildVersion;
}

- (void)setExpectedBuildVersion:(id)a3
{
}

- (NSDictionary)cloudConfig
{
  return self->_cloudConfig;
}

- (void)setCloudConfig:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void)setObliterationShelter:(id)a3
{
}

- (BOOL)isReturnToService
{
  return self->_isReturnToService;
}

- (void)setIsReturnToService:(BOOL)a3
{
  self->_isReturnToService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obliterationShelter, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_cloudConfig, 0);
  objc_storeStrong((id *)&self->_expectedBuildVersion, 0);
  objc_storeStrong((id *)&self->_expectedOSVersion, 0);
  objc_storeStrong((id *)&self->_wifiProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifiersFromConfig, 0);
  objc_storeStrong((id *)&self->_ESSOConfigurationProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_essoAppITunesStoreID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_essoDetails, 0);
  objc_storeStrong((id *)&self->_serverCapabilities, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_authTokens, 0);
  objc_storeStrong((id *)&self->_enrollmentURL, 0);
  objc_storeStrong((id *)&self->_authParams, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_devicePasscodeData, 0);
  objc_storeStrong((id *)&self->_devicePasscode, 0);
  objc_storeStrong((id *)&self->_anchorCertificateRefs, 0);
  objc_storeStrong((id *)&self->_serviceDiscoveryHelper, 0);
  objc_storeStrong(&self->_enrollmentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_managedConfigurationHelper, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_dirtyState, 0);
  objc_storeStrong((id *)&self->_rmAccountIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)_commonStepsForEnrollmentType:(unint64_t)a3 isReturnToService:(BOOL)a4
{
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      id v6 = [(DMCEnrollmentFlowController *)self _ORGO_commonSteps];
      goto LABEL_12;
    case 2uLL:
      id v6 = [(DMCEnrollmentFlowController *)self _ORGO_MACBuddy_commonSteps];
      goto LABEL_12;
    case 4uLL:
    case 5uLL:
      id v6 = [(DMCEnrollmentFlowController *)self _ADxE_commonSteps];
      goto LABEL_12;
    case 6uLL:
      id v6 = [(DMCEnrollmentFlowController *)self _PDUE_UserEnrollment_commonSteps];
      goto LABEL_12;
    case 7uLL:
      id v6 = [(DMCEnrollmentFlowController *)self _MDM_SharediPad_commonSteps];
      goto LABEL_12;
    case 8uLL:
      id v6 = [(DMCEnrollmentFlowController *)self _Watch_deviceEnrollmentSteps];
      goto LABEL_12;
    case 9uLL:
      id v6 = [(DMCEnrollmentFlowController *)self _ADE_commonSteps];
LABEL_12:
      break;
    default:
      id v6 = (void *)MEMORY[0x263EFFA68];
      break;
  }
  return v6;
}

- (id)_ORGO_commonSteps
{
  return &unk_26D985BD0;
}

- (id)_ORGO_deviceEnrollmentSteps
{
  return &unk_26D985BE8;
}

- (id)_ORGO_MAIDEnrollmentSteps
{
  return &unk_26D985C00;
}

- (id)_ORGO_MAIDEnrollmentSteps_orgToken
{
  return &unk_26D985C18;
}

- (id)_ORGO_MACBuddy_commonSteps
{
  return &unk_26D985C30;
}

- (id)_ORGO_MACBuddy_firstPartSteps
{
  return &unk_26D985C48;
}

- (id)_ORGO_MACBuddy_secondPartSteps
{
  return &unk_26D985C60;
}

- (id)_ORGO_pre_enrollment_steps
{
  return &unk_26D985C78;
}

- (id)_ADxE_commonSteps
{
  return &unk_26D985C90;
}

- (id)_ADxE_MAID_firstPartSteps
{
  return &unk_26D985CA8;
}

- (id)_ADxE_MAID_secondPartSteps_default
{
  return &unk_26D985CC0;
}

- (id)_ADxE_MAID_secondPartSteps_orgToken
{
  return &unk_26D985CD8;
}

- (id)_ADxE_thirdParty_firstPartSteps
{
  return &unk_26D985CF0;
}

- (id)_ADxE_thirdParty_secondPartSteps_default
{
  return &unk_26D985D08;
}

- (id)_ADxE_thirdParty_secondPartSteps_orgToken
{
  return &unk_26D985D20;
}

- (id)_ADxE_thirdParty_ESSO_firstPartSteps
{
  return &unk_26D985D38;
}

- (id)_ADxE_thirdParty_ESSO_secondPartSteps_default
{
  return &unk_26D985D50;
}

- (id)_ADxE_thirdParty_ESSO_secondPartSteps_orgToken
{
  return &unk_26D985D68;
}

- (id)_ADxE_reauthSteps
{
  return &unk_26D985D80;
}

- (id)_ADE_commonSteps
{
  return &unk_26D985D98;
}

- (id)_ADE_RTS_commonSteps
{
  return &unk_26D985DB0;
}

- (id)_ADE_deviceEnrollment_legacy_steps
{
  return &unk_26D985DC8;
}

- (id)_ADE_deviceEnrollment_legacy_additionalNativeAuth_steps
{
  return &unk_26D985DE0;
}

- (id)_ADE_deviceEnrollment_softwareUpdate_steps
{
  return &unk_26D985DF8;
}

- (id)_ADE_deviceEnrollment_webURL_steps
{
  return &unk_26D985E10;
}

- (id)_ADE_postEnrollmentSteps
{
  return &unk_26D985E28;
}

- (id)_PDUE_UserEnrollment_commonSteps
{
  return &unk_26D985E40;
}

- (id)_MDM_SharediPad_commonSteps
{
  return &unk_26D985E58;
}

- (id)_Watch_deviceEnrollmentSteps
{
  return &unk_26D985E70;
}

- (id)_stepsWithUI
{
  if (_stepsWithUI_onceToken != -1) {
    dispatch_once(&_stepsWithUI_onceToken, &__block_literal_global_0);
  }
  id v2 = (void *)_stepsWithUI_steps;
  return v2;
}

uint64_t __53__DMCEnrollmentFlowController_Sequence___stepsWithUI__block_invoke()
{
  _stepsWithUI_steps = [MEMORY[0x263EFFA08] setWithArray:&unk_26D985E88];
  return MEMORY[0x270F9A758]();
}

- (id)_postEnrollmentSteps
{
  if (_postEnrollmentSteps_onceToken != -1) {
    dispatch_once(&_postEnrollmentSteps_onceToken, &__block_literal_global_173);
  }
  id v2 = (void *)_postEnrollmentSteps_steps;
  return v2;
}

uint64_t __61__DMCEnrollmentFlowController_Sequence___postEnrollmentSteps__block_invoke()
{
  _postEnrollmentSteps_steps = [MEMORY[0x263EFFA08] setWithArray:&unk_26D985EA0];
  return MEMORY[0x270F9A758]();
}

- (id)_nameForStep:(unint64_t)a3
{
  if (a3 > 0x29) {
    return @"PromptForUsername";
  }
  else {
    return off_264778E58[a3];
  }
}

- (void)_addNotification
{
  id v7 = [(DMCEnrollmentFlowController *)self presenter];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(DMCEnrollmentFlowController *)self presenter];
    uint64_t v4 = [v3 notificationNameForApplicationWillTerminate];

    if (!v4) {
      return;
    }
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__receivedApplicationWillTerminateNotification_ name:v4 object:0];

    id v6 = (void *)v4;
  }
  else
  {
    id v6 = v7;
  }
}

- (void)_receivedApplicationWillTerminateNotification:(id)a3
{
  uint64_t v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_225D9B000, v4, OS_LOG_TYPE_DEFAULT, "DMCEnrollmentFlowController: Settings app will be terminated!", v5, 2u);
  }
  [(DMCEnrollmentFlowController *)self terminateEnrollmentFlow];
}

- (id)_guardAgainstConflictingAccountsWithUsername:(id)a3 altDSID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = [MEMORY[0x263EFB210] defaultStore];
    id v17 = 0;
    int v8 = objc_msgSend(v7, "dmc_conflictingAccountsExistWithUsername:error:", v5, &v17);
    id v9 = v17;

    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = 0;
    int v8 = 0;
  }
  if ((v8 & 1) == 0)
  {
    if (![v6 length])
    {
LABEL_13:
      id v9 = 0;
      goto LABEL_14;
    }
    id v10 = [MEMORY[0x263EFB210] defaultStore];
    id v16 = 0;
    int v8 = objc_msgSend(v10, "dmc_conflictingAccountsExistWithAltDSID:error:", v6, &v16);
    id v9 = v16;
  }
LABEL_8:
  if (!v9)
  {
    if (v8)
    {
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F38A38];
      int v14 = DMCErrorArray();
      objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v13, 15007, v14, 0, *MEMORY[0x263F38A40], 0);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v11 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id buf = 138543362;
    id v19 = v9;
    _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch accounts with error: %{public}@", buf, 0xCu);
  }
LABEL_14:

  return v9;
}

- (void)_updateCredentialForAccount:(id)a3 authTokens:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = objc_msgSend(v9, "dmc_enrollmentMethod");
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (v6 != 5) {
      goto LABEL_6;
    }
    uint64_t v7 = [MEMORY[0x263F52848] serializeTokens:v5];
  }
  else
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F527B0]];
  }
  int v8 = (void *)v7;
  objc_msgSend(v9, "dmc_setBearerToken:", v7);

LABEL_6:
}

- (BOOL)_appWithBundleIDExists:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v9 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = *(NSObject **)DMCLogObjects();
    BOOL v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543618;
      id v11 = v3;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load record for app: %{public}@ with error: %{public}@. This could mean that the app doesn't exist on the device.", buf, 0x16u);
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = v4 != 0;
  }

  return v7;
}

- (id)_appNameWithBundleID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v11 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v11];
  id v5 = v11;
  if (v5)
  {
    uint64_t v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543618;
      id v13 = v3;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_ERROR, "Failed to load record for app: %{public}@ with error: %{public}@.", buf, 0x16u);
    }
  }
  BOOL v7 = [v4 localizedName];
  int v8 = v7;
  if (!v7) {
    BOOL v7 = v3;
  }
  id v9 = v7;

  return v9;
}

- (void)_fetchAppAttributesWithITunesItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2050000000;
  BOOL v7 = (void *)getAMSMediaTaskClass_softClass;
  uint64_t v39 = getAMSMediaTaskClass_softClass;
  if (!getAMSMediaTaskClass_softClass)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    long long v33 = __getAMSMediaTaskClass_block_invoke;
    long long v34 = &unk_264779020;
    long long v35 = &v36;
    __getAMSMediaTaskClass_block_invoke((uint64_t)&v31);
    BOOL v7 = (void *)v37[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v36, 8);
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2050000000;
  id v9 = (void *)getAMSBagClass_softClass;
  uint64_t v39 = getAMSBagClass_softClass;
  if (!getAMSBagClass_softClass)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    long long v33 = __getAMSBagClass_block_invoke;
    long long v34 = &unk_264779020;
    long long v35 = &v36;
    __getAMSBagClass_block_invoke((uint64_t)&v31);
    id v9 = (void *)v37[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v36, 8);
  id v11 = [v8 bagSubProfile];
  __int16 v12 = [v8 bagSubProfileVersion];
  id v13 = [v10 bagForProfile:v11 profileVersion:v12];

  __int16 v14 = (void *)[objc_alloc((Class)v8) initWithType:0 clientIdentifier:@"com.apple.devicemanagementclient" clientVersion:@"1" bag:v13];
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  id v15 = (id *)getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr;
  uint64_t v39 = getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr;
  if (!getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    long long v33 = __getAMSMediaTaskPlatformiPhoneSymbolLoc_block_invoke;
    long long v34 = &unk_264779020;
    long long v35 = &v36;
    uint64_t v16 = (void *)AppleMediaServicesLibrary();
    id v17 = dlsym(v16, "AMSMediaTaskPlatformiPhone");
    *(void *)(v35[1] + 24) = v17;
    getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr = *(void *)(v35[1] + 24);
    id v15 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v15) {
    -[DMCEnrollmentFlowController(Utilities) _fetchAppAttributesWithITunesItemID:completionHandler:]();
  }
  id v18 = *v15;
  id v41 = v18;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  id v19 = (id *)getAMSMediaTaskPlatformiPadSymbolLoc_ptr;
  uint64_t v39 = getAMSMediaTaskPlatformiPadSymbolLoc_ptr;
  if (!getAMSMediaTaskPlatformiPadSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    long long v33 = __getAMSMediaTaskPlatformiPadSymbolLoc_block_invoke;
    long long v34 = &unk_264779020;
    long long v35 = &v36;
    uint64_t v20 = (void *)AppleMediaServicesLibrary();
    uint64_t v21 = dlsym(v20, "AMSMediaTaskPlatformiPad");
    *(void *)(v35[1] + 24) = v21;
    getAMSMediaTaskPlatformiPadSymbolLoc_ptr = *(void *)(v35[1] + 24);
    id v19 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v19) {
    -[DMCEnrollmentFlowController(Utilities) _fetchAppAttributesWithITunesItemID:completionHandler:]();
  }
  id v42 = *v19;
  id v22 = (void *)MEMORY[0x263EFF8C0];
  id v23 = v42;
  int8x16_t v24 = [v22 arrayWithObjects:&v41 count:2];

  [v14 setAdditionalPlatforms:v24];
  uint64_t v25 = [v5 stringValue];
  __int16 v40 = v25;
  int8x16_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
  [v14 setItemIdentifiers:v26];

  [v14 setAdditionalQueryParams:&unk_26D985F30];
  id v27 = [v14 perform];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __96__DMCEnrollmentFlowController_Utilities___fetchAppAttributesWithITunesItemID_completionHandler___block_invoke;
  v29[3] = &unk_264778FB0;
  id v30 = v6;
  id v28 = v6;
  [v27 resultWithCompletion:v29];
}

void __96__DMCEnrollmentFlowController_Utilities___fetchAppAttributesWithITunesItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_ERROR, "Failed to get app attributes with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    BOOL v7 = [a2 responseDataItems];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v7 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v7 firstObject];
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v10, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
    }
  }
}

- (BOOL)_isORGOEnrollment:(unint64_t)a3
{
  return a3 == 2 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)_isBYODEnrollment:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

- (BOOL)_validEnrollmentMode:(id)a3 enrollmentMethod:(unint64_t)a4
{
  id v6 = a3;
  switch([(DMCEnrollmentFlowController *)self enrollmentType])
  {
    case 1uLL:
    case 2uLL:
      if (a4 == 3) {
        BOOL v7 = (void *)MEMORY[0x263F529C8];
      }
      else {
        BOOL v7 = (void *)MEMORY[0x263F529D0];
      }
      goto LABEL_9;
    case 3uLL:
      BOOL v7 = (void *)MEMORY[0x263F529D8];
      goto LABEL_9;
    case 4uLL:
      BOOL v7 = (void *)MEMORY[0x263F529C0];
      goto LABEL_9;
    case 5uLL:
      BOOL v7 = (void *)MEMORY[0x263F529B8];
LABEL_9:
      char v8 = [v6 isEqualToString:*v7];
      break;
    default:
      char v8 = v6 == 0;
      break;
  }

  return v8;
}

- (BOOL)_canSkipMDMEnrollmentWithEnrollmentType:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFF7) != 1) {
    return 0;
  }
  uint64_t v4 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    if ([v5 isDeviceSupervised])
    {
      id v6 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
      if (objc_opt_respondsToSelector())
      {
        BOOL v7 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
        char v8 = [v7 isStoredProfileInstalled];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_writeDirtyStateToDisk:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a3 dictionary];
  uint64_t v4 = MDMDirtyEnrollmentStateFilePath();
  if ([v3 count])
  {
    [v3 DMCWriteToBinaryFile:v4];
    DMCSetSkipBackupAttributeToItemAtPath();
  }
  else
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    int v6 = [v5 fileExistsAtPath:v4];

    if (v6)
    {
      BOOL v7 = [MEMORY[0x263F08850] defaultManager];
      id v13 = 0;
      [v7 removeItemAtPath:v4 error:&v13];
      id v8 = v13;

      if (v8)
      {
        id v9 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id buf = 138543362;
          id v15 = v8;
          _os_log_impl(&dword_225D9B000, v9, OS_LOG_TYPE_ERROR, "Failed to remove dirty state file! Error: %{public}@", buf, 0xCu);
        }
        id v10 = [MEMORY[0x263F08850] defaultManager];
        id v12 = v8;
        [v10 removeItemAtPath:v4 error:&v12];
        id v11 = v12;
      }
    }
  }
}

- (id)_readDirtyStateFromDisk
{
  id v2 = MDMDirtyEnrollmentStateFilePath();
  id v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    id v5 = [NSDictionary DMCDictionaryFromFile:v2];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_extractAndVerifyPropertiesFromProfileData:(id)a3 enrollmentMethod:(unint64_t)a4 isESSO:(BOOL)a5 essoAppITunesStoreID:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v66 = a6;
  id v13 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  char v14 = objc_opt_respondsToSelector();

  BOOL v65 = v12;
  if ((v14 & 1) == 0)
  {
    BOOL v17 = v9;
    uint64_t v62 = 0;
    long long v63 = 0;
    id v61 = 0;
    id v22 = 0;
    uint64_t v21 = 0;
    uint64_t v20 = 0;
    id v19 = 0;
    id v18 = 0;
    id v64 = 0;
    goto LABEL_5;
  }
  id v15 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  id v67 = 0;
  uint64_t v16 = [v15 detailsFromMDMProfile:v12 error:&v67];
  id v64 = v67;

  if (v16)
  {
    BOOL v17 = v9;
    id v18 = [v16 objectForKeyedSubscript:@"ProfileIdentifier"];
    id v19 = [v16 objectForKeyedSubscript:@"ManagedAppleID"];
    uint64_t v20 = [v16 objectForKeyedSubscript:@"AssignedManagedAppleID"];
    uint64_t v21 = [v16 objectForKeyedSubscript:@"OrganizationName"];
    uint64_t v62 = [v16 objectForKeyedSubscript:@"FriendlyName"];
    id v22 = [v16 objectForKeyedSubscript:@"EnrollmentMode"];
    id v61 = [v16 objectForKeyedSubscript:@"ServerCapabilities"];
    long long v63 = [v16 objectForKeyedSubscript:@"RequiredAppID"];

LABEL_5:
    if ([(DMCEnrollmentFlowController *)self _validEnrollmentMode:v22 enrollmentMethod:a4])
    {
      goto LABEL_9;
    }
    id v23 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int8x16_t v24 = v23;
      unint64_t v25 = [(DMCEnrollmentFlowController *)self enrollmentType];
      *(_DWORD *)id buf = 138543874;
      id v69 = v22;
      __int16 v70 = 2048;
      unint64_t v71 = v25;
      __int16 v72 = 2048;
      unint64_t v73 = a4;
      _os_log_impl(&dword_225D9B000, v24, OS_LOG_TYPE_ERROR, "Enrollment mode in profile: %{public}@ does not match enrollment type %lu and method %lu", buf, 0x20u);
    }
    if ([MEMORY[0x263F38B70] ignoreEnrollmentMode])
    {
LABEL_9:
      if (!v19)
      {
        BOOL v34 = a4 == 5 || a4 == 2;
        if (!v34 || v20)
        {
          if (!v66 || !v17 || !v63 || ([v63 isEqualToNumber:v66] & 1) != 0)
          {
            [(DMCEnrollmentFlowController *)self setProfileIdentifier:v18];
            if (a4 == 5 || a4 == 2) {
              [(DMCEnrollmentFlowController *)self setManagedAppleID:v20];
            }
            [(DMCEnrollmentFlowController *)self setOrganizationName:v21];
            [(DMCEnrollmentFlowController *)self setFriendlyName:v62];
            id v51 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
            char v52 = objc_opt_respondsToSelector();

            if (v52)
            {
              id v53 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
              -[DMCEnrollmentFlowController setIsProfileLocked:](self, "setIsProfileLocked:", [v53 isMDMProfileLocked]);
            }
            id v54 = (void *)[v61 copy];
            id v55 = self;
            id v47 = v61;
            [(DMCEnrollmentFlowController *)v55 setServerCapabilities:v54];

            id v19 = 0;
            BOOL v44 = 1;
            id v45 = v64;
            id v46 = (void *)v62;
            goto LABEL_36;
          }
          id v56 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_225D9B000, v56, OS_LOG_TYPE_ERROR, "Enrollment profile contains a required app ID that is different from the esso app's iTunes store ID. Aborting...", buf, 2u);
          }
          if (a7)
          {
            uint64_t v57 = (void *)MEMORY[0x263F087E8];
            uint64_t v58 = *MEMORY[0x263F38A38];
            id v59 = DMCErrorArray();
            id v60 = objc_msgSend(v57, "DMCErrorWithDomain:code:descriptionArray:errorType:", v58, 15016, v59, *MEMORY[0x263F38A40], 0);

            if (v60) {
              *a7 = v60;
            }
          }
        }
        else
        {
          long long v35 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_225D9B000, v35, OS_LOG_TYPE_ERROR, "3rd party enrollment profile doesn't have the AssignedManagedAppleID key. Aborting...", buf, 2u);
          }
          if (a7)
          {
            uint64_t v36 = (void *)MEMORY[0x263F087E8];
            uint64_t v37 = *MEMORY[0x263F38A38];
            uint64_t v38 = DMCErrorArray();
            uint64_t v39 = objc_msgSend(v36, "DMCErrorWithDomain:code:descriptionArray:errorType:", v37, 15013, v38, *MEMORY[0x263F38A40], 0);

            if (v39) {
              *a7 = v39;
            }
          }
          uint64_t v20 = 0;
        }
        id v19 = 0;
LABEL_35:
        BOOL v44 = 0;
        id v45 = v64;
        id v47 = v61;
        id v46 = (void *)v62;
LABEL_36:
        id v48 = v63;
        goto LABEL_37;
      }
      int8x16_t v26 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_225D9B000, v26, OS_LOG_TYPE_ERROR, "Enrollment profile must not have the ManagedAppleID key. Aborting...", buf, 2u);
      }
      if (!a7) {
        goto LABEL_35;
      }
      id v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F38A38];
      uint64_t v29 = DMCErrorArray();
      uint64_t v30 = *MEMORY[0x263F38A40];
      uint64_t v31 = v27;
      uint64_t v32 = v28;
      uint64_t v33 = 15018;
    }
    else
    {
      __int16 v40 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_225D9B000, v40, OS_LOG_TYPE_ERROR, "Enrollment profile has invalid EnrollmentMode key. Aborting...", buf, 2u);
      }
      if (!a7) {
        goto LABEL_35;
      }
      id v41 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F38A38];
      uint64_t v29 = DMCErrorArray();
      uint64_t v30 = *MEMORY[0x263F38A40];
      uint64_t v31 = v41;
      uint64_t v32 = v42;
      uint64_t v33 = 15017;
    }
    uint64_t v43 = objc_msgSend(v31, "DMCErrorWithDomain:code:descriptionArray:errorType:", v32, v33, v29, v30, 0);

    if (v43) {
      *a7 = v43;
    }

    goto LABEL_35;
  }
  BOOL v44 = 0;
  id v48 = 0;
  if (a7)
  {
    id v45 = v64;
    if (v64)
    {
      id v45 = v64;
      id v48 = 0;
      id v47 = 0;
      id v22 = 0;
      id v50 = a7;
      id v46 = 0;
      uint64_t v21 = 0;
      uint64_t v20 = 0;
      id v19 = 0;
      id v18 = 0;
      BOOL v44 = 0;
      id *v50 = v45;
    }
    else
    {
      id v47 = 0;
      id v22 = 0;
      id v46 = 0;
      uint64_t v21 = 0;
      uint64_t v20 = 0;
      id v19 = 0;
      id v18 = 0;
    }
  }
  else
  {
    id v47 = 0;
    id v22 = 0;
    id v46 = 0;
    uint64_t v21 = 0;
    uint64_t v20 = 0;
    id v19 = 0;
    id v18 = 0;
    id v45 = v64;
  }
LABEL_37:

  return v44;
}

- (id)_convertErrorToHumanReadableError:(id)a3
{
  void v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DMCErrorArray();
  int v6 = [(DMCEnrollmentFlowController *)self _trustedErrors];
  BOOL v7 = [v4 domain];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    id v10 = [v4 domain];
    id v11 = [v6 objectForKeyedSubscript:v10];
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    if ([v11 containsObject:v12])
    {

LABEL_6:
      id v15 = [v4 localizedDescription];
      v25[0] = v15;
      uint64_t v16 = [MEMORY[0x263EFF9D0] null];
      v25[1] = v16;
      BOOL v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

      goto LABEL_10;
    }
    [v4 domain];
    id v13 = v24 = v5;
    char v14 = [v6 objectForKeyedSubscript:v13];
    char v23 = [v14 containsObject:&unk_26D9859C0];

    id v5 = v24;
    if (v23) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v18 = [(DMCEnrollmentFlowController *)self _translatedErrorStringForError:v4];
  if (v18)
  {
    uint64_t v22 = 0;
    uint64_t v19 = DMCUnformattedErrorArray();

    id v5 = (void *)v19;
  }

  BOOL v17 = v5;
LABEL_10:
  uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", *MEMORY[0x263F38A38], 15022, v17, v4, *MEMORY[0x263F38A40], v22);

  return v20;
}

- (id)_trustedErrors
{
  if (_trustedErrors_onceToken != -1) {
    dispatch_once(&_trustedErrors_onceToken, &__block_literal_global_1);
  }
  id v2 = (void *)_trustedErrors_dict;
  return v2;
}

void __56__DMCEnrollmentFlowController_Utilities___trustedErrors__block_invoke()
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v0 = (id *)getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  uint64_t v12 = getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  if (!getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getAKAppleIDAuthenticationErrorDomainSymbolLoc_block_invoke;
    v8[3] = &unk_264779020;
    void v8[4] = &v9;
    __getAKAppleIDAuthenticationErrorDomainSymbolLoc_block_invoke((uint64_t)v8);
    v0 = (id *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v0) {
    -[DMCEnrollmentFlowController(Utilities) _fetchAppAttributesWithITunesItemID:completionHandler:]();
  }
  v13[0] = *v0;
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  id v2 = v13[0];
  id v3 = [v1 setWithArray:&unk_26D985EB8];
  v14[0] = v3;
  v13[1] = *(id *)MEMORY[0x263F38A38];
  id v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D985ED0];
  v14[1] = v4;
  v13[2] = *(id *)MEMORY[0x263F38AB0];
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D985EE8];
  v14[2] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  BOOL v7 = (void *)_trustedErrors_dict;
  _trustedErrors_dict = v6;
}

- (id)_errorTranslation
{
  if (_errorTranslation_onceToken != -1) {
    dispatch_once(&_errorTranslation_onceToken, &__block_literal_global_93);
  }
  id v2 = (void *)_errorTranslation_dict;
  return v2;
}

void __59__DMCEnrollmentFlowController_Utilities___errorTranslation__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F38A38];
  v3[0] = &unk_26D985B28;
  v3[1] = &unk_26D985B40;
  v4[0] = @"DMC_SERVER_RESPONSE_USER_UNAUTHORIZED";
  v4[1] = @"DEVICE_MISSING_APPLEACCOUNT_NEEDS_ERASE";
  v3[2] = &unk_26D985B58;
  v4[2] = @"DMC_SERVER_RESPONSE_UNEXPECTED_403_UI";
  v0 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  v6[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v2 = (void *)_errorTranslation_dict;
  _errorTranslation_dict = v1;
}

- (id)_translatedErrorStringForError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMCEnrollmentFlowController *)self _errorTranslation];
  uint64_t v6 = [v4 domain];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_createGeneralError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15022, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createUnsupportedFeatureError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15008, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createEnrollmentNotAllowedDuringSDPError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15035, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createMissingRMAccountError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15005, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createMissingAppleAccountForUserEnrollmentError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15014, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createMissingEnterpriseApplicationError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  id v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15028, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createEnterpriseApplicationExistsErrorWithAppName:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38A38];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 15030, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

+ (id)_createEnterpriseApplicationMissingEntitlementsError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15029, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createMissingEnterpriseApplicationBundleIDError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15028, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

+ (id)_createGeneralSignInError
{
  id v2 = DMCErrorArray();
  uint64_t v3 = objc_msgSend(MEMORY[0x263F087E8], "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38A38], 15032, v2, *MEMORY[0x263F38A40], 0);

  return v3;
}

+ (id)_createInvalidCloudConfigError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38A38];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15034, v4, 0, *MEMORY[0x263F38A40], 0);

  return v5;
}

void __59__DMCEnrollmentFlowController_Utilities___blockAppInstalls__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [v2 DMCVerboseDescription];
    int v6 = 138543362;
    BOOL v7 = v5;
    _os_log_impl(&dword_225D9B000, v4, OS_LOG_TYPE_DEFAULT, "block app installs, enrollment flow controller, blocking end, error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_unblockAppInstallsIfNecessaryWithCaller:(id)a3
{
  id v4 = a3;
  if ([(DMCEnrollmentFlowController *)self enrollmentType] == 4
    || [(DMCEnrollmentFlowController *)self enrollmentType] == 5)
  {
    [(DMCEnrollmentFlowController *)self _unblockAppInstallsWithCaller:v4];
  }
}

- (void)_unblockAppInstallsWithCaller:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v13 = v4;
    _os_log_impl(&dword_225D9B000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, unblocking begin (%{public}@)", buf, 0xCu);
  }
  int v6 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(DMCEnrollmentFlowController *)self managedConfigurationHelper];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __72__DMCEnrollmentFlowController_Utilities___unblockAppInstallsWithCaller___block_invoke;
    v10[3] = &unk_2647788A8;
    id v11 = v4;
    [v8 unblockAppInstallsWithCompletion:v10];
  }
  else
  {
    uint64_t v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_225D9B000, v9, OS_LOG_TYPE_DEFAULT, "block app installs, enrollment flow controller, app unblocking not supported, ignoring", buf, 2u);
    }
  }
}

void __72__DMCEnrollmentFlowController_Utilities___unblockAppInstallsWithCaller___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = v4;
    char v7 = [v3 DMCVerboseDescription];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_DEFAULT, "block app installs, unblocking end (%{public}@), error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_fetchBundleIDsWithiTunesItemID:(id)a3 debuggingAppIDs:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void *, void))a5;
  if ([MEMORY[0x263F38B58] ESSOTestModeEnabled])
  {
    id v11 = [(DMCEnrollmentFlowController *)self _bundleIDsFromAppIDs:v9];
    v10[2](v10, v11, 0);
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __108__DMCEnrollmentFlowController_Utilities___fetchBundleIDsWithiTunesItemID_debuggingAppIDs_completionHandler___block_invoke;
    v12[3] = &unk_264778FF8;
    uint64_t v14 = v10;
    void v12[4] = self;
    id v13 = v8;
    [(DMCEnrollmentFlowController *)self _fetchAppAttributesWithITunesItemID:v13 completionHandler:v12];
  }
}

void __108__DMCEnrollmentFlowController_Utilities___fetchBundleIDsWithiTunesItemID_debuggingAppIDs_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    char v7 = [v5 objectForKeyedSubscript:@"attributes"];
    id v8 = [v7 objectForKeyedSubscript:@"name"];

    id v9 = [v6 objectForKeyedSubscript:@"attributes"];
    __int16 v10 = [v9 objectForKeyedSubscript:@"platformAttributes"];
    id v11 = [v10 objectForKeyedSubscript:@"ios"];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"bundleId"];

    if (v12)
    {
      v24[0] = v12;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      [*(id *)(a1 + 32) setEssoAppITunesStoreID:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = v14;
        uint64_t v16 = [v6 objectForKeyedSubscript:@"attributes"];
        BOOL v17 = [v16 objectForKeyedSubscript:@"platformAttributes"];
        id v18 = [v17 objectForKeyedSubscript:@"ios"];
        int v20 = 138543362;
        uint64_t v21 = v18;
        _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_ERROR, "App attributes dictionary does not contain bundleID: %{public}@", (uint8_t *)&v20, 0xCu);
      }
      id v13 = 0;
    }
    uint64_t v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138543618;
      uint64_t v21 = v8;
      __int16 v22 = 2114;
      char v23 = v12;
      _os_log_impl(&dword_225D9B000, v19, OS_LOG_TYPE_DEBUG, "Found application with name: '%{public}@', bundle ID: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_bundleIDsFromAppIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          __int16 v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "rangeOfString:", @".", (void)v16);
          id v13 = [v10 substringFromIndex:v11 + v12];
          if (v13) {
            [v4 addObject:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v14 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldDoReturnToService
{
  id v2 = [(DMCEnrollmentFlowController *)self obliterationShelter];
  char v3 = [v2 hasConfigFile];

  return v3;
}

@end