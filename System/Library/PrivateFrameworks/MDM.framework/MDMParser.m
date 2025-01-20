@interface MDMParser
+ (BOOL)_dmfAction:(unint64_t *)a3 fromMDMActionString:(id)a4;
+ (BOOL)_useDelayFlagAllowed;
+ (id)_DMFKeysToMCKeys;
+ (id)_MCKeysToDMFKeys;
+ (id)_MCKeysWithNoMatchingDMFKey;
+ (id)_errorFromDMFSoftwareUpdateError:(id)a3;
+ (id)_errorWithDomain:(id)a3 code:(int64_t)a4 descriptionKey:(id)a5 underlyingError:(id)a6 type:(id)a7;
+ (id)_numericAccessibilitySettingsKeys;
+ (id)_resolvedInstallActionStringForAction:(unint64_t)a3;
+ (id)_statusFromError:(id)a3 action:(unint64_t)a4;
+ (id)_stringForAppState:(unint64_t)a3;
+ (id)_updateDictionaryFromUpdate:(id)a3;
+ (id)errorChainFromError:(id)a3;
+ (id)malformedRequestErrorResult;
+ (unint64_t)_shouldUseDelayWithRequest:(id)a3;
- (BOOL)_analyticsRequiresNetworkTetheringFromRequest:(id)a3;
- (BOOL)_identifiersIsStringArray:(id)a3;
- (BOOL)_isChlorineEligible;
- (BOOL)_isDDMProfileIdentifier:(id)a3;
- (BOOL)_isManagedApp:(id)a3;
- (BOOL)_isManagedAppFromManagementInformation:(id)a3;
- (BOOL)_isProfileIdentifierManaged:(id)a3;
- (BOOL)_isProvisioningProfileUUIDManaged:(id)a3;
- (BOOL)_isPurchaseMethodAllowed:(int)a3 onUserEnrollment:(BOOL)a4;
- (BOOL)_isTriggerDiagnosticsAllowed;
- (BOOL)_platformHasPasscode;
- (BOOL)_platformSupportsActivationLock;
- (BOOL)_platformSupportsApplicationFeedback;
- (BOOL)_platformSupportsCellularPlan;
- (BOOL)_platformSupportsClearingRestrictionsPassword;
- (BOOL)_platformSupportsDEP;
- (BOOL)_platformSupportsInviteToVPP;
- (BOOL)_platformSupportsLostMode;
- (BOOL)_platformSupportsMediaCommands;
- (BOOL)_platformSupportsMirroring;
- (BOOL)_platformSupportsOSUpdateManagement;
- (BOOL)_platformSupportsRestart;
- (BOOL)_platformSupportsShutdown;
- (BOOL)_platformSupportsTriggerDiagnostics;
- (BOOL)_platformSupportsValidatingApplications;
- (BOOL)_platfromSupportsRedemptionCodes;
- (BOOL)_rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:(id)a3;
- (BOOL)_validateSetting:(id)a3 accessRights:(unint64_t)a4 outError:(id *)a5;
- (BOOL)isChaperoned;
- (BOOL)isMDM;
- (CATOperationQueue)operationQueue;
- (MDMBackupManager)backupManagerForEnterprisePersona;
- (MDMBackupManager)backupManagerForMainPersona;
- (MDMParser)initWithManagingProfileIdentifier:(id)a3;
- (MDMServerCore)server;
- (NSString)managingProfileIdentifier;
- (id)_accessibilitySettings;
- (id)_allCommands;
- (id)_allSettingsItems;
- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3;
- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3 isDataSeparated:(BOOL)a4;
- (id)_analyticsCommandNameFromRequest:(id)a3;
- (id)_analyticsErrorFromResponse:(id)a3;
- (id)_appAlreadyInstalledErrorWithBundleID:(id)a3;
- (id)_appAlreadyInstalledErrorWithiTunesStoreID:(id)a3;
- (id)_appAlreadyQueuedErrorWithBundleID:(id)a3;
- (id)_appAlreadyQueuedErrorWithiTunesStoreID:(id)a3;
- (id)_appAttributesWithRequestedAttributes:(id)a3;
- (id)_appManagementFlagsWithRequestedFlags:(id)a3;
- (id)_appStoreDisabledError;
- (id)_applyRedemptionCode:(id)a3 assertion:(id)a4;
- (id)_cannotValidateAppIDErrorUnderlyingError:(id)a3;
- (id)_certificateList:(id)a3;
- (id)_clearPasscode:(id)a3;
- (id)_commandSetDataSeparatedDeviceEnrollment;
- (id)_commandSetDataSeparatedDeviceEnrollment_once;
- (id)_commandSetDeviceEnrollment;
- (id)_commandSetDeviceEnrollment_once;
- (id)_commandSetSharediPad;
- (id)_commandSetSharediPad_once;
- (id)_commandSetSupervised;
- (id)_commandSetSupervised_once;
- (id)_commandSetUserEnrollment;
- (id)_commandSetUserEnrollment_once;
- (id)_declarativeManagement:(id)a3;
- (id)_deleteAllUsersWithForceDeletion:(BOOL)a3;
- (id)_deleteUser:(id)a3;
- (id)_deviceInformationWithRequest:(id)a3 accessRights:(unint64_t)a4;
- (id)_deviceInformationWithRequest:(id)a3 allowedQueries:(id)a4;
- (id)_ephemeralSupervisedSettingsSet;
- (id)_ephemeralSupervisedSettingsSet_once;
- (id)_handleFetchAppsRequest:(id)a3 managedOnly:(BOOL)a4 deleteFeedback:(BOOL)a5 advanceTransientStates:(BOOL)a6 propertyKeys:(id)a7 block:(id)a8;
- (id)_handleSetAppManagementInfoRequest:(id)a3 outAdditionalResponseKeys:(id *)a4 block:(id)a5;
- (id)_installApplicationCouldNotModifyDDMAppsError;
- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4;
- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4 installationType:(int64_t)a5;
- (id)_installProvisioningProfile:(id)a3;
- (id)_installedApplicationList:(id)a3;
- (id)_invalidManifestErrorWithURL:(id)a3 underlyingError:(id)a4;
- (id)_invalidRequestTypeError:(id)a3;
- (id)_invalidRequestTypeInMDMLostModeError:(id)a3;
- (id)_invalidRequestTypeInSingleAppModeError:(id)a3;
- (id)_licenseNotFoundErrorWithBundleID:(id)a3 underlyingError:(id)a4;
- (id)_licenseNotFoundErrorWithiTunesStoreID:(id)a3 underlyingError:(id)a4;
- (id)_malformedRequestError;
- (id)_managedApplicationAttributes:(id)a3;
- (id)_managedApplicationConfiguration:(id)a3;
- (id)_managedApplicationFeedback:(id)a3;
- (id)_managedApplicationList:(id)a3;
- (id)_managedByDDMError:(id)a3;
- (id)_nonSupervisedSettingsSet;
- (id)_nonSupervisedSettingsSetWithUserEnrollment;
- (id)_nonSupervisedSettingsSetWithUserEnrollment_once;
- (id)_nonSupervisedSettingsSet_once;
- (id)_notAuthorizedError;
- (id)_notManagedErrorAppID:(id)a3;
- (id)_notNetworkTetheredError;
- (id)_originator;
- (id)_performSetAccessibilitySettings:(id)a3;
- (id)_performSetAppAnalytics:(id)a3;
- (id)_performSetAppAttributes:(id)a3 outAdditionalResponseKeys:(id *)a4;
- (id)_performSetAppConfig:(id)a3 outAdditionalResponseKeys:(id *)a4;
- (id)_performSetAwaitUserConfiguration:(id)a3;
- (id)_performSetBluetooth:(id)a3;
- (id)_performSetDataRoaming:(id)a3;
- (id)_performSetDefaultApplications:(id)a3;
- (id)_performSetDeviceName:(id)a3;
- (id)_performSetDiagnosticSubmission:(id)a3;
- (id)_performSetGracePeriod:(id)a3;
- (id)_performSetMAIDDefaultDomains:(id)a3;
- (id)_performSetMDMOptions:(id)a3;
- (id)_performSetMaximumResidentUsers:(id)a3;
- (id)_performSetOnlineAuthenticationGracePeriod:(id)a3;
- (id)_performSetOrganizationInfo:(id)a3;
- (id)_performSetPersonalHotspot:(id)a3;
- (id)_performSetResidentUserQuotaSize:(id)a3;
- (id)_performSetResidentUsers:(id)a3;
- (id)_performSetSessionTimeout:(id)a3;
- (id)_performSetSharedDeviceConfiguration:(id)a3;
- (id)_performSetSkipLanguageAndLocaleSetupForNewUsers:(id)a3;
- (id)_performSetTemporarySessionOnly:(id)a3;
- (id)_performSetTimezone:(id)a3;
- (id)_performSetUpdatePath:(id)a3;
- (id)_performSetVoiceRoaming:(id)a3;
- (id)_performSetWallpaper:(id)a3;
- (id)_performSetting:(id)a3 outAdditionalResponseKeys:(id *)a4 outRestartAppleTVApp:(BOOL *)a5;
- (id)_profileList:(id)a3;
- (id)_profileList:(id)a3 filterFlags:(int)a4;
- (id)_provisioningProfileList:(id)a3;
- (id)_refreshCellularPlans:(id)a3;
- (id)_removeApplication:(id)a3;
- (id)_removeProfile:(id)a3;
- (id)_removeProfileWithIdentifier:(id)a3 forInstalledProfilesWithFilterFlags:(int)a4;
- (id)_removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4;
- (id)_removeProvisioningProfile:(id)a3;
- (id)_requestUnlockToken:(id)a3;
- (id)_responseForMalformedUpdateRequest;
- (id)_restrictions:(id)a3;
- (id)_restrictions:(id)a3 withProfileFilterFlags:(int)a4;
- (id)_serviceSubscriptionPropertiesWithDMFKeysMappedToMCKeys:(id)a3;
- (id)_serviceSubscriptionsWithDMFKeysMappedToMCKeys:(id)a3;
- (id)_setAppAnalyticsEnabled:(BOOL)a3;
- (id)_setDiagnosticSubmissionEnabled:(BOOL)a3;
- (id)_setResidentUsersNumber:(id)a3;
- (id)_settings:(id)a3 accessRights:(unint64_t)a4;
- (id)_softwareUpdatesNotPermittedWithLoggedInUserError;
- (id)_stringForBookState:(unint64_t)a3;
- (id)_supervisedSettingsSet;
- (id)_supervisedSettingsSet_once;
- (id)_triggerDiagnostics:(id)a3;
- (id)_unavailableCommandsBeforeFirstUnlock;
- (id)_unavailableCommandsDuringIncompleteAccountDrivenEnrollment;
- (id)_unavailableCommandsInLimitedAppsMode;
- (id)_unavailableCommandsWhileLocked;
- (id)_validateApplications:(id)a3;
- (id)unavailableCommandsDuringBuddy;
- (id)unavailableCommandsWhileInMDMLostMode;
- (unint64_t)_profileInstallationStyleForRequest:(id)a3;
- (void)_activationLockBypassCodeRequest:(id)a3 completionBlock:(id)a4;
- (void)_applyOverridesToDeviceInformationDictionary:(id)a3;
- (void)_availableOSUpdates:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_clearActivationLockBypassCodeRequest:(id)a3 completionBlock:(id)a4;
- (void)_deviceConfigured:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_dmfScheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_installApplication:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_installMedia:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_inviteToProgramRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_managedMediaList:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_mdmScheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_performInstallApplicationRequestWithManifestURL:(id)a3 iTunesStoreIDObj:(id)a4 bundleId:(id)a5 flagsObj:(id)a6 attributes:(id)a7 configuration:(id)a8 manageChangeStr:(id)a9 purchaseMethodValue:(int)a10 personaID:(id)a11 completionBlock:(id)a12;
- (void)_performSetDefaultBrowser:(id)a3 completion:(id)a4;
- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6;
- (void)_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:(id)a3;
- (void)_removeMedia:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_requestMirroringRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_scheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_scheduleOSUpdateScan:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_sendAnalyticsMDMCommandEventWithRequest:(id)a3 response:(id)a4;
- (void)_statusOfOSUpdates:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)_stopMirroringRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)didInitiateSwitchUser;
- (void)processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6;
- (void)setBackupManagerForEnterprisePersona:(id)a3;
- (void)setBackupManagerForMainPersona:(id)a3;
- (void)setIsMDM:(BOOL)a3;
- (void)setManagingProfileIdentifier:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setServer:(id)a3;
- (void)willTerminateProcess:(id)a3;
@end

@implementation MDMParser

- (MDMParser)initWithManagingProfileIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MDMParser;
  v6 = [(MDMParser *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_managingProfileIdentifier, a3);
    v8 = [MEMORY[0x263F52808] sharedConfiguration];
    v7->_isChaperoned = [v8 isSupervised];

    v7->_isMDM = v5 != 0;
    uint64_t v9 = objc_opt_new();
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = (CATOperationQueue *)v9;
  }
  return v7;
}

- (id)_unavailableCommandsWhileLocked
{
  if (_unavailableCommandsWhileLocked_once != -1) {
    dispatch_once(&_unavailableCommandsWhileLocked_once, &__block_literal_global_2);
  }
  v2 = (void *)_unavailableCommandsWhileLocked_set;
  return v2;
}

void __44__MDMParser__unavailableCommandsWhileLocked__block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"InstallProfile";
  v4[1] = @"InstallProfileSilent";
  v4[2] = @"InstallProvisioningProfile";
  v4[3] = @"RequestUnlockToken";
  v4[4] = @"SecurityInfo";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_unavailableCommandsWhileLocked_set;
  _unavailableCommandsWhileLocked_set = v2;
}

- (id)_unavailableCommandsBeforeFirstUnlock
{
  if (_unavailableCommandsBeforeFirstUnlock_once != -1) {
    dispatch_once(&_unavailableCommandsBeforeFirstUnlock_once, &__block_literal_global_918);
  }
  uint64_t v2 = (void *)_unavailableCommandsBeforeFirstUnlock_set;
  return v2;
}

void __50__MDMParser__unavailableCommandsBeforeFirstUnlock__block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"ManagedMediaList";
  v4[1] = @"InstallMedia";
  v4[2] = @"RemoveMedia";
  v4[3] = @"CertificateList";
  v4[4] = @"DeclarativeManagement";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_unavailableCommandsBeforeFirstUnlock_set;
  _unavailableCommandsBeforeFirstUnlock_set = v2;
}

- (id)_unavailableCommandsInLimitedAppsMode
{
  if (_unavailableCommandsInLimitedAppsMode_onceToken != -1) {
    dispatch_once(&_unavailableCommandsInLimitedAppsMode_onceToken, &__block_literal_global_920);
  }
  uint64_t v2 = (void *)_unavailableCommandsInLimitedAppsMode_set;
  return v2;
}

void __50__MDMParser__unavailableCommandsInLimitedAppsMode__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"ApplyRedemptionCode";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_unavailableCommandsInLimitedAppsMode_set;
  _unavailableCommandsInLimitedAppsMode_set = v2;
}

- (id)_unavailableCommandsDuringIncompleteAccountDrivenEnrollment
{
  if (_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_onceToken != -1) {
    dispatch_once(&_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_onceToken, &__block_literal_global_922);
  }
  uint64_t v2 = (void *)_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_set;
  return v2;
}

void __72__MDMParser__unavailableCommandsDuringIncompleteAccountDrivenEnrollment__block_invoke()
{
  v4[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"InviteToProgram";
  v4[1] = @"InstallApplication";
  void v4[2] = @"ApplyRedemptionCode";
  v4[3] = @"InstallMedia";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_set;
  _unavailableCommandsDuringIncompleteAccountDrivenEnrollment_set = v2;
}

- (id)unavailableCommandsDuringBuddy
{
  if (unavailableCommandsDuringBuddy_onceToken != -1) {
    dispatch_once(&unavailableCommandsDuringBuddy_onceToken, &__block_literal_global_924);
  }
  uint64_t v2 = [MEMORY[0x263F52808] sharedConfiguration];
  int v3 = [v2 isSupervised];
  v4 = &unavailableCommandsDuringBuddy_supervisedSet;
  if (!v3) {
    v4 = &unavailableCommandsDuringBuddy_unsupervisedSet;
  }
  id v5 = (id)*v4;

  return v5;
}

void __43__MDMParser_unavailableCommandsDuringBuddy__block_invoke()
{
  v9[8] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v9[0] = @"ApplyRedemptionCode";
  v9[1] = @"DeviceLock";
  v9[2] = @"DisableLostMode";
  v9[3] = @"EnableLostMode";
  v9[4] = @"InstallMedia";
  v9[5] = @"InviteToProgram";
  v9[6] = @"RequestMirroring";
  v9[7] = @"UserList";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:8];
  uint64_t v2 = [v0 setWithArray:v1];
  int v3 = (void *)unavailableCommandsDuringBuddy_supervisedSet;
  unavailableCommandsDuringBuddy_supervisedSet = v2;

  v4 = (void *)MEMORY[0x263EFFA08];
  v8[0] = @"ApplyRedemptionCode";
  v8[1] = @"DeviceLock";
  v8[2] = @"DisableLostMode";
  v8[3] = @"EnableLostMode";
  v8[4] = @"InstallApplication";
  v8[5] = @"InstallMedia";
  v8[6] = @"InviteToProgram";
  v8[7] = @"RequestMirroring";
  v8[8] = @"UserList";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:9];
  uint64_t v6 = [v4 setWithArray:v5];
  v7 = (void *)unavailableCommandsDuringBuddy_unsupervisedSet;
  unavailableCommandsDuringBuddy_unsupervisedSet = v6;
}

- (id)unavailableCommandsWhileInMDMLostMode
{
  if (unavailableCommandsWhileInMDMLostMode_onceToken != -1) {
    dispatch_once(&unavailableCommandsWhileInMDMLostMode_onceToken, &__block_literal_global_926);
  }
  uint64_t v2 = (void *)unavailableCommandsWhileInMDMLostMode_set;
  return v2;
}

void __50__MDMParser_unavailableCommandsWhileInMDMLostMode__block_invoke()
{
  void v4[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"InviteToProgram";
  v4[1] = @"InstallApplication";
  void v4[2] = @"ApplyRedemptionCode";
  v4[3] = @"InstallMedia";
  v4[4] = @"RequestMirroring";
  void v4[5] = @"DeviceLock";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  int v3 = (void *)unavailableCommandsWhileInMDMLostMode_set;
  unavailableCommandsWhileInMDMLostMode_set = v2;
}

- (BOOL)_platformHasPasscode
{
  return [MEMORY[0x263F38B98] isAppleTV] ^ 1;
}

- (BOOL)_platformSupportsMirroring
{
  if (([MEMORY[0x263F38B98] isAppleTV] & 1) != 0
    || ([MEMORY[0x263F38B98] isVisionDevice] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [MEMORY[0x263F38B98] isWatch] ^ 1;
  }
}

- (BOOL)_platformSupportsInviteToVPP
{
  if (([MEMORY[0x263F38B98] isAppleTV] & 1) != 0
    || ([MEMORY[0x263F38B98] isVisionDevice] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [MEMORY[0x263F38B98] isWatch] ^ 1;
  }
}

- (BOOL)_platformSupportsMediaCommands
{
  if (([MEMORY[0x263F38B98] isAppleTV] & 1) != 0
    || ([MEMORY[0x263F38B98] isVisionDevice] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [MEMORY[0x263F38B98] isWatch] ^ 1;
  }
}

- (BOOL)_platfromSupportsRedemptionCodes
{
  if (([MEMORY[0x263F38B98] isAppleTV] & 1) != 0
    || ([MEMORY[0x263F38B98] isVisionDevice] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [MEMORY[0x263F38B98] isWatch] ^ 1;
  }
}

- (BOOL)_platformSupportsCellularPlan
{
  if (([MEMORY[0x263F38B98] isAppleTV] & 1) != 0
    || ([MEMORY[0x263F38B98] isVisionDevice] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [MEMORY[0x263F38B98] isWatch] ^ 1;
  }
}

- (BOOL)_platformSupportsLostMode
{
  if ([MEMORY[0x263F38B98] isAppleTV]) {
    return 0;
  }
  else {
    return [MEMORY[0x263F38B98] isVisionDevice] ^ 1;
  }
}

- (BOOL)_platformSupportsDEP
{
  return [MEMORY[0x263F38B98] isWatch] ^ 1;
}

- (BOOL)_platformSupportsOSUpdateManagement
{
  if ([MEMORY[0x263F38B98] isWatch]) {
    return 0;
  }
  else {
    return [MEMORY[0x263F38B98] isVisionDevice] ^ 1;
  }
}

- (BOOL)_platformSupportsActivationLock
{
  return [MEMORY[0x263F38B98] isWatch] ^ 1;
}

- (BOOL)_platformSupportsApplicationFeedback
{
  return [MEMORY[0x263F38B98] isWatch] ^ 1;
}

- (BOOL)_platformSupportsValidatingApplications
{
  return [MEMORY[0x263F38B98] isWatch] ^ 1;
}

- (BOOL)_platformSupportsRestart
{
  if ([MEMORY[0x263F38B98] isWatch]) {
    return 0;
  }
  else {
    return [MEMORY[0x263F38B98] isVisionDevice] ^ 1;
  }
}

- (BOOL)_platformSupportsShutdown
{
  if (([MEMORY[0x263F38B98] isWatch] & 1) != 0
    || ([MEMORY[0x263F38B98] isAppleTV] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [MEMORY[0x263F38B98] isVisionDevice] ^ 1;
  }
}

- (BOOL)_platformSupportsTriggerDiagnostics
{
  return [MEMORY[0x263F38B98] isAppleTV];
}

- (BOOL)_platformSupportsClearingRestrictionsPassword
{
  if ([MEMORY[0x263F38B98] isWatch]) {
    return 0;
  }
  else {
    return [MEMORY[0x263F38B98] isVisionDevice] ^ 1;
  }
}

- (id)_commandSetDeviceEnrollment
{
  v23[20] = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263EFF9C0];
  v23[0] = @"CertificateList";
  v23[1] = @"DeclarativeManagement";
  v23[2] = @"DeviceInformation";
  v23[3] = @"DeviceLock";
  v23[4] = @"EraseDevice";
  v23[5] = @"InstallApplication";
  v23[6] = @"InstallProfile";
  v23[7] = @"InstallProvisioningProfile";
  v23[8] = @"InstalledApplicationList";
  v23[9] = @"ManagedApplicationAttributes";
  v23[10] = @"ManagedApplicationConfiguration";
  v23[11] = @"ManagedApplicationList";
  v23[12] = @"ProfileList";
  v23[13] = @"ProvisioningProfileList";
  v23[14] = @"RemoveApplication";
  v23[15] = @"RemoveProfile";
  v23[16] = @"RemoveProvisioningProfile";
  v23[17] = @"Restrictions";
  v23[18] = @"SecurityInfo";
  v23[19] = @"Settings";
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:20];
  id v5 = [v3 setWithArray:v4];

  if ([(MDMParser *)self _platformSupportsApplicationFeedback])
  {
    v22 = @"ManagedApplicationFeedback";
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    [v5 addObjectsFromArray:v6];
  }
  if ([(MDMParser *)self _platformSupportsValidatingApplications])
  {
    v21 = @"ValidateApplications";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    [v5 addObjectsFromArray:v7];
  }
  if ([(MDMParser *)self _platformHasPasscode])
  {
    v20 = @"ClearPasscode";
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    [v5 addObjectsFromArray:v8];
  }
  if ([(MDMParser *)self _platfromSupportsRedemptionCodes])
  {
    v19 = @"ApplyRedemptionCode";
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    [v5 addObjectsFromArray:v9];
  }
  if ([(MDMParser *)self _platformSupportsInviteToVPP])
  {
    v18 = @"InviteToProgram";
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [v5 addObjectsFromArray:v10];
  }
  if ([(MDMParser *)self _platformSupportsMirroring])
  {
    v17 = @"RequestMirroring";
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    [v5 addObjectsFromArray:v11];
  }
  if ([(MDMParser *)self _platformSupportsCellularPlan])
  {
    v16 = @"RefreshCellularPlans";
    objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [v5 addObjectsFromArray:v12];
  }
  if ([(MDMParser *)self _platformSupportsMediaCommands]
    || [MEMORY[0x263F38B70] forceMediaCommandSupport])
  {
    v15[0] = @"InstallMedia";
    v15[1] = @"ManagedMediaList";
    v15[2] = @"RemoveMedia";
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
    [v5 addObjectsFromArray:v13];
  }
  return v5;
}

- (id)_commandSetDeviceEnrollment_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__MDMParser__commandSetDeviceEnrollment_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_commandSetDeviceEnrollment_once_once != -1) {
    dispatch_once(&_commandSetDeviceEnrollment_once_once, block);
  }
  return (id)_commandSetDeviceEnrollment_once_commandSet;
}

uint64_t __45__MDMParser__commandSetDeviceEnrollment_once__block_invoke(uint64_t a1)
{
  _commandSetDeviceEnrollment_once_commandSet = [*(id *)(a1 + 32) _commandSetDeviceEnrollment];
  return MEMORY[0x270F9A758]();
}

- (id)_commandSetSupervised
{
  v23[4] = *MEMORY[0x263EF8340];
  int v3 = [(MDMParser *)self _commandSetDeviceEnrollment];
  v4 = (void *)[v3 mutableCopy];

  if ([(MDMParser *)self _platformSupportsLostMode])
  {
    v23[0] = @"EnableLostMode";
    v23[1] = @"PlayLostModeSound";
    v23[2] = @"DisableLostMode";
    v23[3] = @"DeviceLocation";
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    [v4 addObjectsFromArray:v5];
  }
  if ([(MDMParser *)self _platformSupportsMirroring])
  {
    v22 = @"StopMirroring";
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    [v4 addObjectsFromArray:v6];
  }
  if ([(MDMParser *)self _platformSupportsOSUpdateManagement])
  {
    v21[0] = @"ScheduleOSUpdate";
    v21[1] = @"ScheduleOSUpdateScan";
    v21[2] = @"AvailableOSUpdates";
    v21[3] = @"OSUpdateStatus";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    [v4 addObjectsFromArray:v7];
  }
  if ([(MDMParser *)self _platformSupportsDEP])
  {
    v20 = @"DeviceConfigured";
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    [v4 addObjectsFromArray:v8];
  }
  if ([(MDMParser *)self _platformSupportsActivationLock])
  {
    v19[0] = @"ActivationLockBypassCode";
    v19[1] = @"ClearActivationLockBypassCode";
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [v4 addObjectsFromArray:v9];
  }
  if ([(MDMParser *)self _platformSupportsRestart])
  {
    v18 = @"RestartDevice";
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [v4 addObjectsFromArray:v10];
  }
  if ([(MDMParser *)self _platformSupportsShutdown])
  {
    v17 = @"ShutDownDevice";
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    [v4 addObjectsFromArray:v11];
  }
  if ([(MDMParser *)self _platformSupportsTriggerDiagnostics])
  {
    v16 = @"TriggerDiagnostics";
    objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [v4 addObjectsFromArray:v12];
  }
  if ([(MDMParser *)self _platformSupportsClearingRestrictionsPassword])
  {
    v15 = @"ClearRestrictionsPassword";
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    [v4 addObjectsFromArray:v13];
  }
  return v4;
}

- (id)_commandSetSupervised_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__MDMParser__commandSetSupervised_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_commandSetSupervised_once_once != -1) {
    dispatch_once(&_commandSetSupervised_once_once, block);
  }
  return (id)_commandSetSupervised_once_commandSet;
}

uint64_t __39__MDMParser__commandSetSupervised_once__block_invoke(uint64_t a1)
{
  _commandSetSupervised_once_commandSet = [*(id *)(a1 + 32) _commandSetSupervised];
  return MEMORY[0x270F9A758]();
}

- (id)_commandSetDataSeparatedDeviceEnrollment
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(MDMParser *)self _commandSetDeviceEnrollment];
  int v3 = (void *)[v2 mutableCopy];

  v4 = (void *)MEMORY[0x263EFFA08];
  v8[0] = @"InviteToProgram";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v6 = [v4 setWithArray:v5];
  [v3 minusSet:v6];

  return v3;
}

- (id)_commandSetDataSeparatedDeviceEnrollment_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__MDMParser__commandSetDataSeparatedDeviceEnrollment_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_commandSetDataSeparatedDeviceEnrollment_once_once != -1) {
    dispatch_once(&_commandSetDataSeparatedDeviceEnrollment_once_once, block);
  }
  return (id)_commandSetDataSeparatedDeviceEnrollment_once_commandSet;
}

uint64_t __58__MDMParser__commandSetDataSeparatedDeviceEnrollment_once__block_invoke(uint64_t a1)
{
  _commandSetDataSeparatedDeviceEnrollment_once_commandSet = [*(id *)(a1 + 32) _commandSetDataSeparatedDeviceEnrollment];
  return MEMORY[0x270F9A758]();
}

- (id)_commandSetUserEnrollment
{
  v9[20] = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263EFF9C0];
  v9[0] = @"DeviceInformation";
  v9[1] = @"InstallApplication";
  v9[2] = @"InstalledApplicationList";
  v9[3] = @"InstallProfile";
  v9[4] = @"InstallProvisioningProfile";
  v9[5] = @"ManagedApplicationAttributes";
  v9[6] = @"ManagedApplicationConfiguration";
  v9[7] = @"ManagedApplicationFeedback";
  v9[8] = @"ManagedApplicationList";
  void v9[9] = @"ProfileList";
  v9[10] = @"ProvisioningProfileList";
  v9[11] = @"RemoveApplication";
  v9[12] = @"RemoveProfile";
  v9[13] = @"RemoveProvisioningProfile";
  v9[14] = @"SecurityInfo";
  v9[15] = @"Settings";
  v9[16] = @"ValidateApplications";
  v9[17] = @"CertificateList";
  v9[18] = @"DeclarativeManagement";
  v9[19] = @"DeviceLock";
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:20];
  id v5 = [v3 setWithArray:v4];

  if ([(MDMParser *)self _platformSupportsMediaCommands]
    || [MEMORY[0x263F38B70] forceMediaCommandSupport])
  {
    v8[0] = @"InstallMedia";
    v8[1] = @"ManagedMediaList";
    void v8[2] = @"RemoveMedia";
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
    [v5 addObjectsFromArray:v6];
  }
  return v5;
}

- (id)_commandSetUserEnrollment_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MDMParser__commandSetUserEnrollment_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_commandSetUserEnrollment_once_once != -1) {
    dispatch_once(&_commandSetUserEnrollment_once_once, block);
  }
  return (id)_commandSetUserEnrollment_once_commandSet;
}

uint64_t __43__MDMParser__commandSetUserEnrollment_once__block_invoke(uint64_t a1)
{
  _commandSetUserEnrollment_once_commandSet = [*(id *)(a1 + 32) _commandSetUserEnrollment];
  return MEMORY[0x270F9A758]();
}

- (id)_commandSetSharediPad
{
  v10[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(MDMParser *)self _commandSetSupervised];
  int v3 = (void *)[v2 mutableCopy];

  v10[0] = @"UserList";
  v10[1] = @"LogOutUser";
  v10[2] = @"DeleteUser";
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];
  id v5 = (void *)MEMORY[0x263EFFA08];
  v9[0] = @"ApplyRedemptionCode";
  v9[1] = @"ClearPasscode";
  v9[2] = @"ActivationLockBypassCode";
  v9[3] = @"ClearActivationLockBypassCode";
  v9[4] = @"ClearRestrictionsPassword";
  v9[5] = @"InviteToProgram";
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:6];
  v7 = [v5 setWithArray:v6];

  [v3 addObjectsFromArray:v4];
  [v3 minusSet:v7];

  return v3;
}

- (id)_commandSetSharediPad_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__MDMParser__commandSetSharediPad_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_commandSetSharediPad_once_once != -1) {
    dispatch_once(&_commandSetSharediPad_once_once, block);
  }
  return (id)_commandSetSharediPad_once_commandSet;
}

uint64_t __39__MDMParser__commandSetSharediPad_once__block_invoke(uint64_t a1)
{
  _commandSetSharediPad_once_commandSet = [*(id *)(a1 + 32) _commandSetSharediPad];
  return MEMORY[0x270F9A758]();
}

- (id)_allCommands
{
  int v3 = [MEMORY[0x263F52808] sharedConfiguration];
  if ([v3 userMode] == 1)
  {
  }
  else
  {
    char v4 = [MEMORY[0x263F38BA0] isSharediPad];

    if ((v4 & 1) == 0)
    {
      v7 = [MEMORY[0x263F52808] sharedConfiguration];
      int v8 = [v7 isSupervised];

      if (v8)
      {
        id v5 = [(MDMParser *)self _commandSetSupervised_once];
      }
      else
      {
        uint64_t v9 = [MEMORY[0x263F52810] sharedConfiguration];
        int v10 = [v9 isUserEnrollment];

        if (v10)
        {
          id v5 = [(MDMParser *)self _commandSetUserEnrollment_once];
        }
        else
        {
          v11 = [MEMORY[0x263F52810] sharedConfiguration];
          objc_super v12 = [v11 personaID];

          if (v12) {
            [(MDMParser *)self _commandSetDataSeparatedDeviceEnrollment_once];
          }
          else {
          id v5 = [(MDMParser *)self _commandSetDeviceEnrollment_once];
          }
        }
      }
      goto LABEL_5;
    }
  }
  id v5 = [(MDMParser *)self _commandSetSharediPad_once];
LABEL_5:
  return v5;
}

- (id)_ephemeralSupervisedSettingsSet
{
  v6[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(MDMParser *)self _supervisedSettingsSet];
  int v3 = (void *)[v2 mutableCopy];

  v6[0] = @"MaximumResidentUsers";
  v6[1] = @"SharedDeviceConfiguration";
  v6[2] = @"DiagnosticSubmission";
  v6[3] = @"AppAnalytics";
  v6[4] = @"PasscodeLockGracePeriod";
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  [v3 addObjectsFromArray:v4];

  [v3 removeObject:@"AccessibilitySettings"];
  [v3 removeObject:@"DefaultApplications"];
  return v3;
}

- (id)_supervisedSettingsSet
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(MDMParser *)self _nonSupervisedSettingsSet];
  int v3 = (void *)[v2 mutableCopy];

  if ([MEMORY[0x263F38B98] isAppleTV])
  {
    v18 = @"DeviceName";
    v19 = @"TimeZone";
    char v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = &v18;
LABEL_3:
    uint64_t v6 = 2;
LABEL_9:
    v7 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
    [v3 addObjectsFromArray:v7];

    goto LABEL_10;
  }
  if ([MEMORY[0x263F38B98] isWatch])
  {
    v17 = @"AccessibilitySettings";
    char v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = &v17;
    uint64_t v6 = 1;
    goto LABEL_9;
  }
  if (([MEMORY[0x263F38B98] isPhone] & 1) != 0
    || [MEMORY[0x263F38B98] isPad])
  {
    v11 = @"AccessibilitySettings";
    objc_super v12 = @"DeviceName";
    v13 = @"TimeZone";
    v14 = @"Bluetooth";
    v15 = @"SoftwareUpdateSettings";
    v16 = @"Wallpaper";
    char v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = &v11;
    uint64_t v6 = 6;
    goto LABEL_9;
  }
  if ([MEMORY[0x263F38B98] isVisionDevice])
  {
    uint64_t v9 = @"DeviceName";
    int v10 = @"TimeZone";
    char v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = &v9;
    goto LABEL_3;
  }
LABEL_10:
  return v3;
}

- (id)_nonSupervisedSettingsSetWithUserEnrollment
{
  v6[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  v6[0] = @"ApplicationAttributes";
  v6[1] = @"ApplicationConfiguration";
  v6[2] = @"OrganizationInfo";
  int v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  char v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)_nonSupervisedSettingsSet
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  v12[0] = @"OrganizationInfo";
  v12[1] = @"ApplicationAttributes";
  v12[2] = @"ApplicationConfiguration";
  int v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  char v4 = [v2 setWithArray:v3];

  if (([MEMORY[0x263F38B98] isPhone] & 1) != 0
    || ([MEMORY[0x263F38B98] isPad] & 1) != 0
    || ([MEMORY[0x263F38B98] isAppleTV] & 1) != 0
    || [MEMORY[0x263F38B98] isVisionDevice])
  {
    v11 = @"MDMOptions";
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    [v4 addObjectsFromArray:v5];
  }
  if (([MEMORY[0x263F38B98] isPhone] & 1) != 0
    || ([MEMORY[0x263F38B98] isPad] & 1) != 0
    || [MEMORY[0x263F38B98] isVisionDevice])
  {
    int v10 = @"DefaultApplications";
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    [v4 addObjectsFromArray:v6];
  }
  if (([MEMORY[0x263F38B98] isPhone] & 1) != 0
    || [MEMORY[0x263F38B98] isPad])
  {
    v9[0] = @"DataRoaming";
    v9[1] = @"VoiceRoaming";
    v9[2] = @"PersonalHotspot";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    [v4 addObjectsFromArray:v7];
  }
  return v4;
}

- (id)_ephemeralSupervisedSettingsSet_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MDMParser__ephemeralSupervisedSettingsSet_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_ephemeralSupervisedSettingsSet_once_once != -1) {
    dispatch_once(&_ephemeralSupervisedSettingsSet_once_once, block);
  }
  return (id)_ephemeralSupervisedSettingsSet_once_commandSet;
}

uint64_t __49__MDMParser__ephemeralSupervisedSettingsSet_once__block_invoke(uint64_t a1)
{
  _ephemeralSupervisedSettingsSet_once_commandSet = [*(id *)(a1 + 32) _ephemeralSupervisedSettingsSet];
  return MEMORY[0x270F9A758]();
}

- (id)_supervisedSettingsSet_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__MDMParser__supervisedSettingsSet_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_supervisedSettingsSet_once_once != -1) {
    dispatch_once(&_supervisedSettingsSet_once_once, block);
  }
  return (id)_supervisedSettingsSet_once_commandSet;
}

uint64_t __40__MDMParser__supervisedSettingsSet_once__block_invoke(uint64_t a1)
{
  _supervisedSettingsSet_once_commandSet = [*(id *)(a1 + 32) _supervisedSettingsSet];
  return MEMORY[0x270F9A758]();
}

- (id)_nonSupervisedSettingsSetWithUserEnrollment_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__MDMParser__nonSupervisedSettingsSetWithUserEnrollment_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_nonSupervisedSettingsSetWithUserEnrollment_once_once != -1) {
    dispatch_once(&_nonSupervisedSettingsSetWithUserEnrollment_once_once, block);
  }
  return (id)_nonSupervisedSettingsSetWithUserEnrollment_once_commandSet;
}

uint64_t __61__MDMParser__nonSupervisedSettingsSetWithUserEnrollment_once__block_invoke(uint64_t a1)
{
  _nonSupervisedSettingsSetWithUserEnrollment_once_commandSet = [*(id *)(a1 + 32) _nonSupervisedSettingsSetWithUserEnrollment];
  return MEMORY[0x270F9A758]();
}

- (id)_nonSupervisedSettingsSet_once
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MDMParser__nonSupervisedSettingsSet_once__block_invoke;
  block[3] = &unk_264B9D3E0;
  block[4] = self;
  if (_nonSupervisedSettingsSet_once_once != -1) {
    dispatch_once(&_nonSupervisedSettingsSet_once_once, block);
  }
  return (id)_nonSupervisedSettingsSet_once_commandSet;
}

uint64_t __43__MDMParser__nonSupervisedSettingsSet_once__block_invoke(uint64_t a1)
{
  _nonSupervisedSettingsSet_once_commandSet = [*(id *)(a1 + 32) _nonSupervisedSettingsSet];
  return MEMORY[0x270F9A758]();
}

- (id)_allSettingsItems
{
  if ([(MDMParser *)self isChaperoned])
  {
    int v3 = [MEMORY[0x263F52808] sharedConfiguration];
    if ([v3 userMode] == 1) {
      [(MDMParser *)self _ephemeralSupervisedSettingsSet_once];
    }
    else {
    uint64_t v6 = [(MDMParser *)self _supervisedSettingsSet_once];
    }
  }
  else
  {
    char v4 = [MEMORY[0x263F52810] sharedConfiguration];
    int v5 = [v4 isUserEnrollment];

    if (v5) {
      [(MDMParser *)self _nonSupervisedSettingsSetWithUserEnrollment_once];
    }
    else {
    uint64_t v6 = [(MDMParser *)self _nonSupervisedSettingsSet_once];
    }
  }
  return v6;
}

- (void)processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = (void (**)(id, void *))a6;
  v11 = [v8 objectForKey:@"RequestType"];
  objc_super v12 = [v8 objectForKey:@"RequestRequiresNetworkTether"];
  v13 = MDMDirtyEnrollmentStateFilePath();
  v14 = [MEMORY[0x263F08850] defaultManager];
  int v15 = [v14 fileExistsAtPath:v13];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x263F389C0]);
    v17 = [NSDictionary DMCDictionaryFromFile:v13];
    v18 = (void *)[v16 initWithDictionary:v17];
  }
  else
  {
    v18 = 0;
  }
  objc_opt_class();
  v19 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0 || v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v25 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
    goto LABEL_67;
  }
  v93 = v18;
  uint64_t v20 = [(MDMParser *)self _allCommands];
  char v21 = [v20 containsObject:v11];

  id v92 = v9;
  if ((v21 & 1) == 0)
  {
    v26 = [(MDMParser *)self _invalidRequestTypeError:v11];
    v25 = +[MDMAbstractTunnelParser responseWithError:v26];

    goto LABEL_17;
  }
  v22 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v22;
    BOOL v23 = [(MDMParser *)self isChaperoned];
    v24 = @"MDM";
    if (v23) {
      v24 = @"Supervised";
    }
    *(_DWORD *)buf = 138543618;
    v97 = v24;
    __int16 v98 = 2114;
    v99 = v11;
    _os_log_impl(&dword_230A49000, v22, OS_LOG_TYPE_DEFAULT, "Attempting to perform %{public}@ request: %{public}@", buf, 0x16u);
  }
  if ((objc_msgSend(v11, "isEqualToString:", @"ClearPasscode", v9) & 1) == 0)
  {
    v22 = [v8 objectForKey:@"UnlockToken"];

    if (v22)
    {
      v25 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
LABEL_17:
      id v9 = v92;
      v18 = v93;
      goto LABEL_67;
    }
  }
  int v27 = MKBGetDeviceLockState();
  int v28 = v27;
  int v29 = 0;
  if (v27 && v27 != 3)
  {
    v22 = [(MDMParser *)self _unavailableCommandsWhileLocked];
    int v29 = [v22 containsObject:v11];
  }
  if (v28 && v28 != 3) {

  }
  if (v29)
  {
    v30 = *(NSObject **)(DMCLogObjects() + 8);
    id v9 = v92;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v30, OS_LOG_TYPE_DEFAULT, "Device is locked", buf, 2u);
    }
    uint64_t v31 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
    goto LABEL_28;
  }
  v32 = [v93 dirtyPersonaIDs];
  v33 = [MEMORY[0x263F52810] sharedConfiguration];
  v34 = [v33 personaID];
  int v35 = [v32 containsObject:v34];

  if (v35)
  {
    v36 = [(MDMParser *)self _unavailableCommandsDuringIncompleteAccountDrivenEnrollment];
    int v37 = [v36 containsObject:v11];

    if (v37)
    {
      v38 = *(NSObject **)(DMCLogObjects() + 8);
      id v9 = v92;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v39 = "Account Driven Enrollment is not done yet";
LABEL_49:
        _os_log_impl(&dword_230A49000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
        goto LABEL_50;
      }
      goto LABEL_50;
    }
  }
  int v40 = MKBDeviceUnlockedSinceBoot();
  id v9 = v92;
  if (v40 != 1)
  {
    int v41 = v40;
    if (v40)
    {
      v44 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v97) = v41;
        _os_log_impl(&dword_230A49000, v44, OS_LOG_TYPE_ERROR, "MKB returned error for device unlocked since boot: %d", buf, 8u);
      }
    }
    else
    {
      v42 = [(MDMParser *)self _unavailableCommandsBeforeFirstUnlock];
      int v43 = [v42 containsObject:v11];

      if (v43)
      {
        v38 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v39 = "Device has not unlocked since boot";
          goto LABEL_49;
        }
LABEL_50:
        v25 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
LABEL_51:
        v19 = self;
        goto LABEL_66;
      }
    }
  }
  if (+[MDMMCInterface isLimitedAppsMode])
  {
    v45 = [(MDMParser *)self _unavailableCommandsInLimitedAppsMode];
    int v46 = [v45 containsObject:v11];

    if (v46)
    {
      v47 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v47, OS_LOG_TYPE_DEFAULT, "Device is in a limited apps mode", buf, 2u);
      }
      v48 = [(MDMParser *)self _invalidRequestTypeInSingleAppModeError:v11];
      v25 = +[MDMAbstractTunnelParser responseWithError:v48];

      v19 = self;
      goto LABEL_66;
    }
  }
  if ((DMCIsSetupBuddyDone() & 1) == 0)
  {
    v49 = [(MDMParser *)self unavailableCommandsDuringBuddy];
    int v50 = [v49 containsObject:v11];

    if (v50)
    {
      v38 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v39 = "Device is in Setup Assistant";
        goto LABEL_49;
      }
      goto LABEL_50;
    }
  }
  if (+[MDMFindMyUtilities isManagedLostModeActive])
  {
    v51 = [(MDMParser *)self unavailableCommandsWhileInMDMLostMode];
    int v52 = [v51 containsObject:v11];

    if (v52)
    {
      v53 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v53, OS_LOG_TYPE_DEFAULT, "Device is in MDM Lost Mode", buf, 2u);
      }
      v19 = self;
      v54 = [(MDMParser *)self _invalidRequestTypeInMDMLostModeError:v11];
      uint64_t v55 = +[MDMAbstractTunnelParser responseWithError:v54];
      goto LABEL_65;
    }
  }
  v19 = self;
  if (v12 && [v12 BOOLValue])
  {
    v56 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v56, OS_LOG_TYPE_DEFAULT, "Request requires network tether", buf, 2u);
    }
    if ((DMCDeviceIsNetworkTethered() & 1) == 0)
    {
      v59 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v59, OS_LOG_TYPE_ERROR, "No network tether was found. Failing command.", buf, 2u);
      }
      v60 = [(MDMParser *)self _notNetworkTetheredError];
      v25 = +[MDMAbstractTunnelParser responseWithError:v60];

      goto LABEL_51;
    }
  }
  if (![v11 isEqualToString:@"DeviceInformation"])
  {
    if (([v11 isEqualToString:@"InstallProfile"] & 1) != 0
      || [v11 isEqualToString:@"InstallProfileSilent"])
    {
      uint64_t v31 = [(MDMParser *)self _installProfile:v8 accessRights:a4];
      goto LABEL_28;
    }
    if (![(MDMParser *)self isChaperoned]
      && self->_managingProfileIdentifier
      && [v11 isEqualToString:@"RemoveProfile"])
    {
      v61 = [v8 objectForKey:@"Identifier"];
      if (v61)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v61 isEqualToString:self->_managingProfileIdentifier])
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

            if (WeakRetained)
            {
              id v63 = objc_loadWeakRetained((id *)&self->_server);
              v64 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
              v65 = [v63 responseFromBasicResponse:v64];
              id v66 = (id)[v63 sendResponseSynchronously:v65 outStatusCode:0 outError:0];
            }
            id v67 = [(MDMParser *)self _removeProfile:v8];
          }
        }
      }

      id v9 = v92;
    }
    v68 = [MEMORY[0x263F52810] sharedConfiguration];
    char v69 = [v68 isUserEnrollment];

    if (v69) {
      goto LABEL_88;
    }
    v70 = self;
    if ([(MDMParser *)self isChaperoned])
    {
      unint64_t v71 = 0x1FFFLL;
      goto LABEL_93;
    }
    int v72 = [v11 isEqualToString:@"ProfileList"];
    unint64_t v71 = a4;
    if ((a4 & 1) != 0 && v72) {
      goto LABEL_93;
    }
    if ([v11 isEqualToString:@"InstallProfile"])
    {
      if ((a4 & 2) != 0) {
        goto LABEL_93;
      }
    }
    else
    {
      char v73 = [v11 isEqualToString:@"RemoveProfile"];
      if (a4 & 2) != 0 && (v73) {
        goto LABEL_93;
      }
    }
    int v74 = [v11 isEqualToString:@"DeviceLock"];
    if ((a4 & 4) != 0 && v74) {
      goto LABEL_93;
    }
    int v75 = [v11 isEqualToString:@"RequestUnlockToken"];
    if ((a4 & 4) == 0 || !v75)
    {
      int v76 = [v11 isEqualToString:@"ClearPasscode"];
      if ((a4 & 4) == 0 || !v76)
      {
        int v77 = [v11 isEqualToString:@"RestartDevice"];
        if ((a4 & 4) == 0 || !v77)
        {
          int v78 = [v11 isEqualToString:@"ShutDownDevice"];
          if ((a4 & 4) == 0 || !v78)
          {
            char v79 = [v11 isEqualToString:@"EraseDevice"];
            if ((a4 & 8) == 0 || (v79 & 1) == 0)
            {
              int v80 = [v11 isEqualToString:@"CertificateList"];
              if ((a4 & 1) == 0 || !v80)
              {
                char v81 = [v11 isEqualToString:@"ProvisioningProfileList"];
                if ((a4 & 0x40) == 0 || (v81 & 1) == 0)
                {
                  int v82 = [v11 isEqualToString:@"InstallProvisioningProfile"];
                  if ((a4 & 0x80) == 0 || !v82)
                  {
                    int v83 = [v11 isEqualToString:@"RemoveProvisioningProfile"];
                    if ((a4 & 0x80) == 0 || !v83)
                    {
                      char v84 = [v11 isEqualToString:@"InstalledApplicationList"];
                      if ((a4 & 0x100) == 0 || (v84 & 1) == 0)
                      {
                        int v85 = [v11 isEqualToString:@"Restrictions"];
                        if ((a4 & 0x200) != 0 && v85)
                        {
                          if ((a4 & 0x40) == 0)
                          {
                            v86 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
                            [v86 removeObjectForKey:@"ProfileRestrictions"];

                            id v8 = v86;
                          }
                          goto LABEL_121;
                        }
                        char v87 = [v11 isEqualToString:@"SecurityInfo"];
                        if ((a4 & 0x400) == 0 || (v87 & 1) == 0)
                        {
                          char v88 = [v11 isEqualToString:@"Settings"];
                          if ((a4 & 0x800) == 0 || (v88 & 1) == 0)
                          {
                            int v89 = [v11 isEqualToString:@"InviteToProgram"];
                            if ((a4 & 0x1000) == 0 || !v89)
                            {
                              if (([v11 isEqualToString:@"InstallApplication"] & 1) != 0
                                || ([v11 isEqualToString:@"ValidateApplications"] & 1) != 0
                                || ([v11 isEqualToString:@"ApplyRedemptionCode"] & 1) != 0
                                || ([v11 isEqualToString:@"ManagedApplicationList"] & 1) != 0
                                || ([v11 isEqualToString:@"RemoveApplication"] & 1) != 0
                                || ([v11 isEqualToString:@"ManagedApplicationConfiguration"] & 1) != 0
                                || ([v11 isEqualToString:@"ManagedApplicationAttributes"] & 1) != 0
                                || ([v11 isEqualToString:@"ManagedApplicationFeedback"] & 1) != 0
                                || ([v11 isEqualToString:@"InstallMedia"] & 1) != 0
                                || ([v11 isEqualToString:@"ManagedMediaList"] & 1) != 0
                                || ([v11 isEqualToString:@"RemoveMedia"] & 1) != 0
                                || ([v11 isEqualToString:@"AvailableOSUpdates"] & 1) != 0
                                || ([v11 isEqualToString:@"OSUpdateStatus"] & 1) != 0
                                || ([v11 isEqualToString:@"ScheduleOSUpdate"] & 1) != 0)
                              {
                                if ((a4 & 0x1000) == 0) {
                                  goto LABEL_147;
                                }
                              }
                              else
                              {
                                int v91 = [v11 isEqualToString:@"ScheduleOSUpdateScan"];
                                if ((a4 & 0x1000) == 0 || !v91)
                                {
LABEL_147:
                                  if (([v11 isEqualToString:@"RequestMirroring"] & 1) == 0
                                    && ([v11 isEqualToString:@"RefreshCellularPlans"] & 1) == 0
                                    && ([v11 isEqualToString:@"DeclarativeManagement"] & 1) == 0)
                                  {
                                    v90 = [(MDMParser *)self _notAuthorizedError];
                                    v25 = +[MDMAbstractTunnelParser responseWithError:v90];

                                    v19 = self;
                                    goto LABEL_17;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_121:
    id v9 = v92;
LABEL_88:
    unint64_t v71 = a4;
    v70 = self;
LABEL_93:
    [(MDMParser *)v70 _processRequest:v8 accessRights:v71 assertion:v9 completionBlock:v10];
    v25 = 0;
    v18 = v93;
    goto LABEL_69;
  }
  v57 = [MEMORY[0x263F52810] sharedConfiguration];
  int v58 = [v57 isUserEnrollment];

  if (v58)
  {
    v54 = [MEMORY[0x263F52820] allowedDeviceQueriesWithUserEnrollment];
    v19 = self;
    uint64_t v55 = [(MDMParser *)self _deviceInformationWithRequest:v8 allowedQueries:v54];
LABEL_65:
    v25 = (void *)v55;

    goto LABEL_66;
  }
  v19 = self;
  uint64_t v31 = [(MDMParser *)self _deviceInformationWithRequest:v8 accessRights:a4];
LABEL_28:
  v25 = (void *)v31;
LABEL_66:
  v18 = v93;
LABEL_67:
  -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](v19, "_sendAnalyticsMDMCommandEventWithRequest:response:", v8, v25, v92);
  if (v10) {
    v10[2](v10, v25);
  }
LABEL_69:
}

- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke;
  v44[3] = &unk_264B9DA58;
  id v13 = v12;
  id v46 = v13;
  id v14 = v11;
  id v45 = v14;
  int v15 = (void *)MEMORY[0x230FC63F0](v44);
  id v16 = [v10 objectForKey:@"RequestType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v28 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
LABEL_13:
    id v29 = (id)v28;
    goto LABEL_14;
  }
  v17 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v16;
    _os_log_impl(&dword_230A49000, v17, OS_LOG_TYPE_DEFAULT, "Handling request type: %{public}@", buf, 0xCu);
  }
  v18 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = v18;
    uint64_t v20 = [v10 DMCShortenedPlistDescription];
    *(_DWORD *)buf = 138543362;
    id v48 = v20;
    _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_DEBUG, "Handling request: %{public}@", buf, 0xCu);
  }
  char v21 = +[MDMRequestClasses classForRequestType:v16];
  if ([(objc_class *)v21 isSubclassOfClass:objc_opt_class()])
  {
    id v43 = 0;
    v22 = [(objc_class *)v21 load:v10 serializationType:0 error:&v43];
    id v23 = v43;
    if (v22)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      objc_msgSend(v22, "setChannelType:", objc_msgSend(WeakRetained, "channelType"));

      [v22 setDelegate:self];
      [v22 setAccessRights:a4];
      v25 = [MEMORY[0x263F52810] sharedConfiguration];
      objc_msgSend(v22, "setIsUserEnrollment:", objc_msgSend(v25, "isUserEnrollment"));

      id v42 = v23;
      LOBYTE(WeakRetained) = [v22 isRequestAllowedWithError:&v42];
      id v26 = v42;

      if (WeakRetained)
      {
        if ([v22 shouldBlockUserSwitch])
        {
          uint64_t v27 = MEMORY[0x230FC63F0](v15);

          id v13 = (id)v27;
        }
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_951;
        v39[3] = &unk_264B9DA80;
        v39[4] = self;
        id v40 = v10;
        id v13 = v13;
        id v41 = v13;
        [v22 processRequest:v40 completionHandler:v39];

        goto LABEL_25;
      }
      v32 = +[MDMAbstractTunnelParser responseWithError:v26];
      id v23 = v26;
    }
    else
    {
      uint64_t v31 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v23;
        _os_log_impl(&dword_230A49000, v31, OS_LOG_TYPE_ERROR, "Malformed command %{public}@.", buf, 0xCu);
      }
      v32 = +[MDMParser malformedRequestErrorResult];
    }
    (*((void (**)(id, void *))v13 + 2))(v13, v32);

LABEL_25:
    id v29 = 0;
    goto LABEL_26;
  }
  if ([v16 isEqualToString:@"ClearPasscode"])
  {
    uint64_t v28 = [(MDMParser *)self _clearPasscode:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"RequestUnlockToken"])
  {
    uint64_t v28 = [(MDMParser *)self _requestUnlockToken:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"ProfileList"])
  {
    uint64_t v28 = [(MDMParser *)self _profileList:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"CertificateList"])
  {
    uint64_t v28 = [(MDMParser *)self _certificateList:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"RemoveProfile"])
  {
    uint64_t v28 = [(MDMParser *)self _removeProfile:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"ProvisioningProfileList"])
  {
    uint64_t v28 = [(MDMParser *)self _provisioningProfileList:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"InstallProvisioningProfile"])
  {
    uint64_t v28 = [(MDMParser *)self _installProvisioningProfile:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"RemoveProvisioningProfile"])
  {
    uint64_t v28 = [(MDMParser *)self _removeProvisioningProfile:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"InstalledApplicationList"])
  {
    uint64_t v28 = [(MDMParser *)self _installedApplicationList:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"Restrictions"])
  {
    uint64_t v28 = [(MDMParser *)self _restrictions:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"Settings"])
  {
    uint64_t v28 = [(MDMParser *)self _settings:v10 accessRights:a4];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"InstallApplication"])
  {
    [(MDMParser *)self _installApplication:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"ValidateApplications"])
  {
    uint64_t v28 = [(MDMParser *)self _validateApplications:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"ApplyRedemptionCode"])
  {
    uint64_t v28 = [(MDMParser *)self _applyRedemptionCode:v10 assertion:v14];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"ManagedApplicationList"])
  {
    uint64_t v28 = [(MDMParser *)self _managedApplicationList:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"ManagedApplicationConfiguration"])
  {
    uint64_t v28 = [(MDMParser *)self _managedApplicationConfiguration:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"ManagedApplicationAttributes"])
  {
    uint64_t v28 = [(MDMParser *)self _managedApplicationAttributes:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"ManagedApplicationFeedback"])
  {
    uint64_t v28 = [(MDMParser *)self _managedApplicationFeedback:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"RemoveApplication"])
  {
    uint64_t v28 = [(MDMParser *)self _removeApplication:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"RequestMirroring"])
  {
    [(MDMParser *)self _requestMirroringRequest:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"StopMirroring"])
  {
    [(MDMParser *)self _stopMirroringRequest:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"InviteToProgram"])
  {
    [(MDMParser *)self _inviteToProgramRequest:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"ActivationLockBypassCode"])
  {
    [(MDMParser *)self _activationLockBypassCodeRequest:v10 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"ClearActivationLockBypassCode"])
  {
    [(MDMParser *)self _clearActivationLockBypassCodeRequest:v10 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"InstallMedia"])
  {
    [(MDMParser *)self _installMedia:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"ManagedMediaList"])
  {
    [(MDMParser *)self _managedMediaList:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"RemoveMedia"])
  {
    [(MDMParser *)self _removeMedia:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"DeviceConfigured"])
  {
    [(MDMParser *)self _deviceConfigured:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"UserConfigured"])
  {
    [(MDMParser *)self _userConfigured:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"ScheduleOSUpdate"])
  {
    [(MDMParser *)self _scheduleOSUpdate:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"ScheduleOSUpdateScan"])
  {
    [(MDMParser *)self _scheduleOSUpdateScan:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"AvailableOSUpdates"])
  {
    [(MDMParser *)self _availableOSUpdates:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"OSUpdateStatus"])
  {
    [(MDMParser *)self _statusOfOSUpdates:v10 assertion:v14 completionBlock:v15];
    goto LABEL_25;
  }
  if ([v16 isEqualToString:@"DeleteUser"])
  {
    uint64_t v28 = [(MDMParser *)self _deleteUser:v10];
    goto LABEL_13;
  }
  if ([v16 isEqualToString:@"DeclarativeManagement"])
  {
    uint64_t v28 = [(MDMParser *)self _declarativeManagement:v10];
    goto LABEL_13;
  }
  if (![v16 isEqualToString:@"TriggerDiagnostics"])
  {
    if (![v16 isEqualToString:@"RefreshCellularPlans"])
    {
      v38.receiver = self;
      v38.super_class = (Class)MDMParser;
      [(MDMAbstractTunnelParser *)&v38 processRequest:v10 assertion:v14 completionBlock:v15];
      goto LABEL_25;
    }
    uint64_t v28 = [(MDMParser *)self _refreshCellularPlans:v10];
    goto LABEL_13;
  }
  if ([(MDMParser *)self _isTriggerDiagnosticsAllowed])
  {
    uint64_t v28 = [(MDMParser *)self _triggerDiagnostics:v10];
    goto LABEL_13;
  }
  v33 = [(MDMParser *)self _invalidRequestTypeError:v16];
  id v29 = +[MDMAbstractTunnelParser responseWithError:v33];

LABEL_14:
  [(MDMParser *)self _sendAnalyticsMDMCommandEventWithRequest:v10 response:v29];
  if (v13)
  {
    v30 = dispatch_get_global_queue(0, 0);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_2;
    v34[3] = &unk_264B9DAA8;
    id v13 = v13;
    id v37 = v13;
    id v29 = v29;
    id v35 = v29;
    id v36 = v14;
    dispatch_async(v30, v34);
  }
LABEL_26:
}

uint64_t __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_951(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

uint64_t __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)willTerminateProcess:(id)a3
{
  id v9 = a3;
  p_server = &self->_server;
  id WeakRetained = objc_loadWeakRetained((id *)p_server);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_server);
    v7 = [v6 responseFromBasicResponse:v9];
    id v8 = (id)[v6 sendResponseSynchronously:v7 outStatusCode:0 outError:0];
  }
}

- (void)didInitiateSwitchUser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  [WeakRetained setUserSwitchAlreadyInitiated:1];
}

- (id)_profileList:(id)a3
{
  return [(MDMParser *)self _profileList:a3 filterFlags:17];
}

- (id)_profileList:(id)a3 filterFlags:(int)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v5 = [a3 objectForKeyedSubscript:@"ManagedOnly"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v13 = +[MDMParser malformedRequestErrorResult];
  }
  else
  {
    int v6 = [v5 BOOLValue];
    v7 = [MEMORY[0x263F52810] sharedConfiguration];
    int v8 = [v7 isUserEnrollment];

    if (v8 | v6) {
      uint64_t v9 = a4 | 0x20u;
    }
    else {
      uint64_t v9 = a4;
    }
    id v10 = +[MDMMCInterface profileListWithFilterFlags:v9];
    id v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_INFO, "Returning profile array: %{public}@", buf, 0xCu);
    }
    uint64_t v12 = *MEMORY[0x263F52DE8];
    v15[0] = @"Status";
    v15[1] = v12;
    v16[0] = @"Acknowledged";
    v16[1] = v10;
    id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  return v13;
}

- (id)_originator
{
  uint64_t v3 = [(MDMParser *)self server];
  id v4 = [v3 organizationName];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(MDMParser *)self server];
    uint64_t v9 = [v7 serverName];
    DMCLocalizedFormat();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_clearPasscode:(id)a3
{
  uint64_t v3 = [a3 objectForKey:@"UnlockToken"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = (void *)MEMORY[0x263F38B90];
    uint64_t v5 = *MEMORY[0x263F52EA0];
    uint64_t v6 = *MEMORY[0x263F529E8];
    v7 = [MEMORY[0x263F52810] sharedConfiguration];
    id v21 = 0;
    LOBYTE(v19) = [v7 isUserEnrollment];
    int v8 = [v4 dataFromService:v5 account:v6 label:0 description:0 group:0 useSystemKeychain:0 enforcePersonalPersona:v19 outError:&v21];
    id v9 = v21;

    id v10 = [MEMORY[0x263F38B90] stringFromServiceData:v8];
    id v11 = v10;
    if (v9)
    {
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F38B10];
      id v14 = DMCErrorArray();
      objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v13, 12019, v14, v9, *MEMORY[0x263F38A40], 0);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = [v10 dataUsingEncoding:4];
      id v20 = 0;
      +[MDMMCInterface clearPasscodeWithEscrowKeybagData:v3 secret:v14 outError:&v20];
      id v15 = v20;
    }
    v17 = v15;

    if (v17) {
      +[MDMAbstractTunnelParser responseWithError:v17];
    }
    else {
    id v16 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    }
  }
  else
  {
    id v16 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
  }

  return v16;
}

- (id)_requestUnlockToken:(id)a3
{
  return +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
}

- (id)_deleteUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ForceDeletion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ForceDeletion"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  v7 = [v4 objectForKeyedSubscript:@"DeleteAllUsers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v4 objectForKeyedSubscript:@"DeleteAllUsers"];
  }
  else
  {
    int v8 = 0;
  }

  if ([v8 BOOLValue])
  {
    uint64_t v9 = -[MDMParser _deleteAllUsersWithForceDeletion:](self, "_deleteAllUsersWithForceDeletion:", [v6 BOOLValue]);
LABEL_16:
    uint64_t v13 = (void *)v9;
    goto LABEL_17;
  }
  id v10 = [v4 objectForKeyedSubscript:@"UserName"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  id v11 = [v4 objectForKeyedSubscript:@"UserName"];

  if (!v11)
  {
LABEL_15:
    uint64_t v9 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
    goto LABEL_16;
  }
  uint64_t v12 = objc_opt_new();
  [v12 setUsername:v11];
  objc_msgSend(v12, "setForceDeletion:", objc_msgSend(v6, "BOOLValue"));
  uint64_t v13 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  id v14 = [MEMORY[0x263F39D18] systemConnection];
  id v36 = 0;
  id v15 = (id)[v14 performRequest:v12 error:&v36];
  id v16 = v36;

  if (v16)
  {
    uint64_t v17 = [v16 code];
    switch(v17)
    {
      case 1801:
        uint64_t v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = *MEMORY[0x263F38B10];
        uint64_t v19 = DMCErrorArray();
        uint64_t v20 = *MEMORY[0x263F38A40];
        id v21 = v31;
        uint64_t v22 = v18;
        uint64_t v23 = 12072;
        goto LABEL_25;
      case 1802:
        v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = *MEMORY[0x263F38B10];
        uint64_t v19 = DMCErrorArray();
        uint64_t v20 = *MEMORY[0x263F38A40];
        id v21 = v33;
        uint64_t v22 = v26;
        uint64_t v23 = 12071;
        goto LABEL_25;
      case 1803:
        v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F38B10];
        uint64_t v19 = DMCErrorArray();
        uint64_t v20 = *MEMORY[0x263F38A40];
        id v21 = v34;
        uint64_t v22 = v27;
        uint64_t v23 = 12073;
        goto LABEL_25;
      case 1804:
        id v35 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F38B10];
        uint64_t v19 = DMCErrorArray();
        uint64_t v20 = *MEMORY[0x263F38A40];
        id v21 = v35;
        uint64_t v22 = v28;
        uint64_t v23 = 12074;
        goto LABEL_25;
      default:
        if (v17 != 1700) {
          goto LABEL_26;
        }
        v32 = (void *)MEMORY[0x263F087E8];
        uint64_t v25 = *MEMORY[0x263F38B10];
        uint64_t v19 = DMCErrorArray();
        uint64_t v20 = *MEMORY[0x263F38A40];
        id v21 = v32;
        uint64_t v22 = v25;
        uint64_t v23 = 12070;
LABEL_25:
        uint64_t v29 = objc_msgSend(v21, "DMCErrorWithDomain:code:descriptionArray:errorType:", v22, v23, v19, v20, 0);

        id v16 = (id)v29;
LABEL_26:
        uint64_t v30 = +[MDMAbstractTunnelParser responseWithError:v16];

        uint64_t v13 = (void *)v30;
        break;
    }
  }

LABEL_17:
  return v13;
}

- (id)_deleteAllUsersWithForceDeletion:(BOOL)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all users...", buf, 2u);
  }
  id v4 = [(id)DMCUMUserManagerClass() sharedManager];
  uint64_t v5 = [v4 allUsers];
  uint64_t v27 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v12 = [v11 username];
        uint64_t v13 = (void *)v12;
        if (v12) {
          id v14 = (__CFString *)v12;
        }
        else {
          id v14 = @"Unknown";
        }
        id v15 = v14;

        id v16 = [v4 currentUser];
        int v17 = [v16 isEqualToUser:v11];

        if (v17) {
          goto LABEL_16;
        }
        if ([v11 hasDataToSync] && !a3)
        {
          uint64_t v18 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v11;
            _os_log_impl(&dword_230A49000, v18, OS_LOG_TYPE_DEFAULT, "User %{public}@ has data to sync.", buf, 0xCu);
          }
LABEL_16:
          uint64_t v19 = DMCLocalizedString();
          [v6 setObject:v19 forKeyedSubscript:v15];
          goto LABEL_18;
        }
        dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __46__MDMParser__deleteAllUsersWithForceDeletion___block_invoke;
        v30[3] = &unk_264B9DAD0;
        v30[4] = v11;
        id v31 = v6;
        v32 = v15;
        dispatch_semaphore_t v33 = v20;
        uint64_t v19 = v20;
        [v4 deleteUser:v11 completionHandler:v30];
        dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

LABEL_18:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    id v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F38B10];
    uint64_t v23 = DMCErrorArray();
    v24 = objc_msgSend(v21, "DMCErrorWithDomain:code:descriptionArray:errorType:", v22, 12074, v23, *MEMORY[0x263F38A40], v6, 0);

    uint64_t v25 = +[MDMAbstractTunnelParser responseWithError:v24];
  }
  else
  {
    uint64_t v25 = v27;
  }

  return v25;
}

void __46__MDMParser__deleteAllUsersWithForceDeletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "Failed to delete user: %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x16u);
    }
    uint64_t v6 = DMCLocalizedString();
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (id)_refreshCellularPlans:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"eSIMServerURL"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    int v7 = 0;
    uint64_t v5 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"eSIMServerURL"];

  if (!v5)
  {
    int v7 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = [NSURL URLWithString:v5];
  int v7 = v6;
  if (!v6)
  {
LABEL_16:
    uint64_t v13 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
    goto LABEL_17;
  }
  uint64_t v8 = [v6 scheme];
  if (![v8 isEqualToString:@"http"])
  {
    __int16 v9 = [v7 scheme];
    char v10 = [v9 isEqualToString:@"https"];

    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }

LABEL_9:
  uint64_t v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v7;
    _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEFAULT, "Refreshing available data plans from URL: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  [v12 setESIMServerURL:v7];
  id v14 = [MEMORY[0x263F39D18] systemConnection];
  id v30 = 0;
  id v15 = (id)[v14 performRequest:v12 error:&v30];
  id v16 = v30;

  if (v16)
  {
    uint64_t v17 = [v16 code];
    if ((unint64_t)(v17 - 203) < 2 || v17 == 201)
    {
      uint64_t v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F38B10];
      dispatch_semaphore_t v20 = DMCErrorArray();
      uint64_t v21 = *MEMORY[0x263F38A40];
      uint64_t v22 = v26;
      uint64_t v23 = v27;
      uint64_t v24 = 36003;
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F38B10];
      if (v17 == 202)
      {
        dispatch_semaphore_t v20 = DMCErrorArray();
        uint64_t v21 = *MEMORY[0x263F38A40];
        uint64_t v22 = v18;
        uint64_t v23 = v19;
        uint64_t v24 = 36002;
      }
      else
      {
        dispatch_semaphore_t v20 = DMCErrorArray();
        uint64_t v21 = *MEMORY[0x263F38A40];
        uint64_t v22 = v18;
        uint64_t v23 = v19;
        uint64_t v24 = 36001;
      }
    }
    uint64_t v28 = objc_msgSend(v22, "DMCErrorWithDomain:code:descriptionArray:errorType:", v23, v24, v20, v21, 0);

    uint64_t v29 = +[MDMAbstractTunnelParser responseWithError:v28];

    uint64_t v13 = (void *)v29;
  }

LABEL_17:
  return v13;
}

- (id)_declarativeManagement:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Processing DeclarativeManagement command", buf, 2u);
  }
  uint64_t v6 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  managingProfileIdentifier = self->_managingProfileIdentifier;
  id v15 = 0;
  BOOL v8 = +[MDMDeclarativeManagementCommand processRequestTypeWithProfileIdentifier:managingProfileIdentifier request:v4 error:&v15];

  id v9 = v15;
  if (!v8)
  {
    char v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v10;
      uint64_t v12 = [v9 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_ERROR, "Failed to process DeclarativeManagement command with error: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = +[MDMAbstractTunnelParser responseWithError:v9];

    uint64_t v6 = (void *)v13;
  }

  return v6;
}

+ (id)_MCKeysToDMFKeys
{
  if (_MCKeysToDMFKeys_onceToken != -1) {
    dispatch_once(&_MCKeysToDMFKeys_onceToken, &__block_literal_global_1018);
  }
  uint64_t v2 = (void *)_MCKeysToDMFKeys_MCKeysToDMFKeys;
  return v2;
}

void __29__MDMParser__MCKeysToDMFKeys__block_invoke()
{
  v83[54] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F39BA0];
  uint64_t v1 = *MEMORY[0x263F52D50];
  v82[0] = *MEMORY[0x263F52CC0];
  v82[1] = v1;
  uint64_t v2 = *MEMORY[0x263F39C00];
  v83[0] = v0;
  v83[1] = v2;
  uint64_t v3 = *MEMORY[0x263F39AB8];
  uint64_t v4 = *MEMORY[0x263F52C20];
  v82[2] = *MEMORY[0x263F52B90];
  v82[3] = v4;
  uint64_t v5 = *MEMORY[0x263F39B10];
  v83[2] = v3;
  v83[3] = v5;
  uint64_t v6 = *MEMORY[0x263F39A28];
  uint64_t v7 = *MEMORY[0x263F52D80];
  v82[4] = *MEMORY[0x263F52B38];
  v82[5] = v7;
  uint64_t v8 = *MEMORY[0x263F39C58];
  v83[4] = v6;
  v83[5] = v8;
  uint64_t v9 = *MEMORY[0x263F39C50];
  uint64_t v10 = *MEMORY[0x263F52B98];
  v82[6] = *MEMORY[0x263F52D78];
  v82[7] = v10;
  uint64_t v11 = *MEMORY[0x263F39B48];
  v83[6] = v9;
  v83[7] = v11;
  uint64_t v12 = *MEMORY[0x263F39B38];
  uint64_t v13 = *MEMORY[0x263F52C98];
  v82[8] = *MEMORY[0x263F52C58];
  v82[9] = v13;
  uint64_t v14 = *MEMORY[0x263F39B80];
  v83[8] = v12;
  v83[9] = v14;
  uint64_t v15 = *MEMORY[0x263F39A48];
  uint64_t v16 = *MEMORY[0x263F52B30];
  v82[10] = *MEMORY[0x263F52B88];
  v82[11] = v16;
  uint64_t v17 = *MEMORY[0x263F39A20];
  v83[10] = v15;
  v83[11] = v17;
  uint64_t v18 = *MEMORY[0x263F39A58];
  uint64_t v19 = *MEMORY[0x263F52B40];
  v82[12] = *MEMORY[0x263F52B60];
  v82[13] = v19;
  uint64_t v20 = *MEMORY[0x263F39A30];
  v83[12] = v18;
  v83[13] = v20;
  uint64_t v21 = *MEMORY[0x263F39B08];
  uint64_t v22 = *MEMORY[0x263F52BB0];
  v82[14] = *MEMORY[0x263F52C18];
  v82[15] = v22;
  uint64_t v23 = *MEMORY[0x263F39A98];
  v83[14] = v21;
  v83[15] = v23;
  uint64_t v24 = *MEMORY[0x263F39AF0];
  uint64_t v25 = *MEMORY[0x263F52BF0];
  v82[16] = *MEMORY[0x263F52BF8];
  v82[17] = v25;
  uint64_t v26 = *MEMORY[0x263F39AE0];
  v83[16] = v24;
  v83[17] = v26;
  uint64_t v27 = *MEMORY[0x263F39AC8];
  uint64_t v28 = *MEMORY[0x263F52BE8];
  v82[18] = *MEMORY[0x263F52BD8];
  v82[19] = v28;
  uint64_t v29 = *MEMORY[0x263F39AD8];
  v83[18] = v27;
  v83[19] = v29;
  uint64_t v30 = *MEMORY[0x263F39AD0];
  uint64_t v31 = *MEMORY[0x263F52D70];
  v82[20] = *MEMORY[0x263F52BE0];
  v82[21] = v31;
  uint64_t v32 = *MEMORY[0x263F39C48];
  v83[20] = v30;
  v83[21] = v32;
  uint64_t v33 = *MEMORY[0x263F39B60];
  uint64_t v34 = *MEMORY[0x263F52BD0];
  v82[22] = *MEMORY[0x263F52C88];
  v82[23] = v34;
  uint64_t v35 = *MEMORY[0x263F39AB0];
  v83[22] = v33;
  v83[23] = v35;
  uint64_t v36 = *MEMORY[0x263F39B20];
  uint64_t v37 = *MEMORY[0x263F52C68];
  v82[24] = *MEMORY[0x263F52C30];
  v82[25] = v37;
  uint64_t v38 = *MEMORY[0x263F39B40];
  v83[24] = v36;
  v83[25] = v38;
  uint64_t v39 = *MEMORY[0x263F39AA8];
  uint64_t v40 = *MEMORY[0x263F52BB8];
  v82[26] = *MEMORY[0x263F52BC8];
  v82[27] = v40;
  uint64_t v41 = *MEMORY[0x263F39AA0];
  v83[26] = v39;
  v83[27] = v41;
  uint64_t v42 = *MEMORY[0x263F39A68];
  uint64_t v43 = *MEMORY[0x263F52CB8];
  v82[28] = *MEMORY[0x263F52B68];
  v82[29] = v43;
  uint64_t v44 = *MEMORY[0x263F39B88];
  v83[28] = v42;
  v83[29] = v44;
  uint64_t v45 = *MEMORY[0x263F39BD8];
  uint64_t v46 = *MEMORY[0x263F52B58];
  v82[30] = *MEMORY[0x263F52D10];
  v82[31] = v46;
  uint64_t v47 = *MEMORY[0x263F39A50];
  v83[30] = v45;
  v83[31] = v47;
  uint64_t v48 = *MEMORY[0x263F39B68];
  uint64_t v49 = *MEMORY[0x263F52D18];
  v82[32] = *MEMORY[0x263F52C90];
  v82[33] = v49;
  uint64_t v50 = *MEMORY[0x263F39BE0];
  v83[32] = v48;
  v83[33] = v50;
  uint64_t v51 = *MEMORY[0x263F39BE8];
  uint64_t v52 = *MEMORY[0x263F52B70];
  v82[34] = *MEMORY[0x263F52D20];
  v82[35] = v52;
  uint64_t v53 = *MEMORY[0x263F39A70];
  v83[34] = v51;
  v83[35] = v53;
  uint64_t v54 = *MEMORY[0x263F39A78];
  uint64_t v55 = *MEMORY[0x263F52B80];
  v82[36] = *MEMORY[0x263F52B78];
  v82[37] = v55;
  uint64_t v56 = *MEMORY[0x263F39A80];
  v83[36] = v54;
  v83[37] = v56;
  uint64_t v57 = *MEMORY[0x263F39C38];
  uint64_t v58 = *MEMORY[0x263F52C10];
  v82[38] = *MEMORY[0x263F52D68];
  v82[39] = v58;
  uint64_t v59 = *MEMORY[0x263F39B00];
  v83[38] = v57;
  v83[39] = v59;
  uint64_t v60 = *MEMORY[0x263F39A90];
  uint64_t v61 = *MEMORY[0x263F52B20];
  v82[40] = *MEMORY[0x263F52BA8];
  v82[41] = v61;
  uint64_t v62 = *MEMORY[0x263F39A08];
  v83[40] = v60;
  v83[41] = v62;
  uint64_t v63 = *MEMORY[0x263F39AE8];
  uint64_t v64 = *MEMORY[0x263F52C70];
  v82[42] = *MEMORY[0x263F52C00];
  v82[43] = v64;
  uint64_t v65 = *MEMORY[0x263F39B50];
  v83[42] = v63;
  v83[43] = v65;
  uint64_t v66 = *MEMORY[0x263F39A40];
  uint64_t v67 = *MEMORY[0x263F52C50];
  v82[44] = *MEMORY[0x263F52B50];
  v82[45] = v67;
  uint64_t v68 = *MEMORY[0x263F39B30];
  v83[44] = v66;
  v83[45] = v68;
  uint64_t v69 = *MEMORY[0x263F39A38];
  uint64_t v70 = *MEMORY[0x263F52C08];
  v82[46] = *MEMORY[0x263F52B48];
  v82[47] = v70;
  uint64_t v71 = *MEMORY[0x263F39AF8];
  v83[46] = v69;
  v83[47] = v71;
  uint64_t v72 = *MEMORY[0x263F39BD0];
  uint64_t v73 = *MEMORY[0x263F52CC8];
  v82[48] = *MEMORY[0x263F52CF0];
  v82[49] = v73;
  uint64_t v74 = *MEMORY[0x263F39BA8];
  v83[48] = v72;
  v83[49] = v74;
  uint64_t v75 = *MEMORY[0x263F39BB0];
  uint64_t v76 = *MEMORY[0x263F52CD8];
  v82[50] = *MEMORY[0x263F52CD0];
  v82[51] = v76;
  uint64_t v77 = *MEMORY[0x263F39BC0];
  v83[50] = v75;
  v83[51] = v77;
  uint64_t v78 = *MEMORY[0x263F52CE8];
  v82[52] = *MEMORY[0x263F52CE0];
  v82[53] = v78;
  uint64_t v79 = *MEMORY[0x263F39BC8];
  v83[52] = *MEMORY[0x263F39BB8];
  v83[53] = v79;
  uint64_t v80 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:54];
  char v81 = (void *)_MCKeysToDMFKeys_MCKeysToDMFKeys;
  _MCKeysToDMFKeys_MCKeysToDMFKeys = v80;
}

+ (id)_MCKeysWithNoMatchingDMFKey
{
  v17[23] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F52B28];
  v17[0] = *MEMORY[0x263F52B18];
  v17[1] = v3;
  uint64_t v4 = *MEMORY[0x263F52BC0];
  v17[2] = *MEMORY[0x263F52BA0];
  v17[3] = v4;
  uint64_t v5 = *MEMORY[0x263F52C48];
  v17[4] = *MEMORY[0x263F52C40];
  v17[5] = v5;
  uint64_t v6 = *MEMORY[0x263F52C38];
  v17[6] = *MEMORY[0x263F52C28];
  v17[7] = v6;
  uint64_t v7 = *MEMORY[0x263F52C78];
  v17[8] = *MEMORY[0x263F52C60];
  v17[9] = v7;
  uint64_t v8 = *MEMORY[0x263F52CA8];
  v17[10] = *MEMORY[0x263F52C80];
  v17[11] = v8;
  uint64_t v9 = *MEMORY[0x263F52CF8];
  v17[12] = *MEMORY[0x263F52CB0];
  v17[13] = v9;
  uint64_t v10 = *MEMORY[0x263F52D08];
  v17[14] = *MEMORY[0x263F52D00];
  v17[15] = v10;
  uint64_t v11 = *MEMORY[0x263F52D30];
  v17[16] = *MEMORY[0x263F52D28];
  v17[17] = v11;
  uint64_t v12 = *MEMORY[0x263F52D40];
  v17[18] = *MEMORY[0x263F52D38];
  v17[19] = v12;
  uint64_t v13 = *MEMORY[0x263F52D58];
  v17[20] = *MEMORY[0x263F52D48];
  v17[21] = v13;
  v17[22] = *MEMORY[0x263F52D60];
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:23];
  uint64_t v15 = [v2 setWithArray:v14];

  return v15;
}

+ (id)_DMFKeysToMCKeys
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__MDMParser__DMFKeysToMCKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_DMFKeysToMCKeys_onceToken != -1) {
    dispatch_once(&_DMFKeysToMCKeys_onceToken, block);
  }
  uint64_t v2 = (void *)_DMFKeysToMCKeys_DMFKeysToMCKeys;
  return v2;
}

void __29__MDMParser__DMFKeysToMCKeys__block_invoke()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v0 = [(id)objc_opt_class() _MCKeysToDMFKeys];
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v0, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v2, "objectForKeyedSubscript:", v7, (void)v11);
        [v1 setObject:v7 forKeyedSubscript:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v9 = [v1 copy];
  uint64_t v10 = (void *)_DMFKeysToMCKeys_DMFKeysToMCKeys;
  _DMFKeysToMCKeys_DMFKeysToMCKeys = v9;
}

- (id)_serviceSubscriptionPropertiesWithDMFKeysMappedToMCKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _DMFKeysToMCKeys];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11, (void)v16);
        if (v12)
        {
          long long v13 = [v6 objectForKeyedSubscript:v11];
          [v5 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];
  return v14;
}

- (id)_serviceSubscriptionsWithDMFKeysMappedToMCKeys:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[MDMParser _serviceSubscriptionPropertiesWithDMFKeysMappedToMCKeys:](self, "_serviceSubscriptionPropertiesWithDMFKeysMappedToMCKeys:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)[v5 copy];
  return v12;
}

- (id)_deviceInformationWithRequest:(id)a3 accessRights:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x263F52810];
  id v7 = a3;
  uint64_t v8 = [v6 sharedConfiguration];
  uint64_t v9 = [v8 personaID];
  BOOL v10 = v9 != 0;

  uint64_t v11 = [(MDMParser *)self _allowedDeviceQueriesForAccessRights:a4 isDataSeparated:v10];
  long long v12 = [(MDMParser *)self _deviceInformationWithRequest:v7 allowedQueries:v11];

  return v12;
}

- (id)_deviceInformationWithRequest:(id)a3 allowedQueries:(id)a4
{
  uint64_t v236 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKey:@"DeviceAttestationNonce"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![v8 length]
      || (unint64_t v9 = [v8 length], v9 > *MEMORY[0x263F52980]))
    {
      BOOL v10 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
      goto LABEL_34;
    }
  }
  uint64_t v11 = [v6 objectForKey:@"Queries"];
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v11 count])
  {
    BOOL v10 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
    goto LABEL_33;
  }
  v193 = self;
  v191 = [MEMORY[0x263EFF9C0] set];
  long long v221 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  v187 = v11;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v221 objects:v235 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v222;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v222 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v221 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v10 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
          uint64_t v11 = v187;
          goto LABEL_187;
        }
        if ([v7 containsObject:v17]) {
          [v191 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v221 objects:v235 count:16];
    }
    while (v14);
  }

  if (([MEMORY[0x263F38B98] hasInternetTetheringCapability] & 1) == 0) {
    [v191 removeObject:*MEMORY[0x263F52C88]];
  }
  id v12 = [(id)objc_opt_class() _MCKeysToDMFKeys];
  v200 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v191, "count"));
  long long v217 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  id v18 = v191;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v217 objects:v234 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v218;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v218 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v217 + 1) + 8 * j)];
        if (v23) {
          [v200 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v217 objects:v234 count:16];
    }
    while (v20);
  }
  v185 = v8;

  uint64_t v24 = objc_opt_new();
  [v24 setPropertyKeys:v200];
  uint64_t v25 = [MEMORY[0x263F39D18] systemConnection];
  id v216 = 0;
  uint64_t v26 = [v25 performRequest:v24 error:&v216];
  id v27 = v216;

  uint64_t v28 = objc_opt_class();
  if (v27)
  {
    BOOL v10 = [v28 responseWithError:v27];
    uint64_t v11 = v187;
    goto LABEL_186;
  }
  v180 = v24;
  id v182 = v6;
  id v183 = v7;
  v198 = [v28 _DMFKeysToMCKeys];
  v184 = v26;
  uint64_t v30 = [v26 valuesByPropertyKey];
  v196 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
  v186 = [MEMORY[0x263F52810] sharedConfiguration];
  int v192 = [v186 isUserEnrollment];
  long long v212 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  id obj = v30;
  uint64_t v31 = [obj countByEnumeratingWithState:&v212 objects:v233 count:16];
  id v181 = v12;
  id v197 = v18;
  if (!v31) {
    goto LABEL_73;
  }
  uint64_t v32 = v31;
  uint64_t v33 = *(void *)v213;
  uint64_t v34 = *MEMORY[0x263F52C00];
  uint64_t v35 = *MEMORY[0x263F52CF0];
  uint64_t v194 = *MEMORY[0x263F52B88];
  uint64_t v190 = *MEMORY[0x263F52B30];
  uint64_t v188 = *MEMORY[0x263F52BB0];
  uint64_t v189 = *MEMORY[0x263EFF848];
  do
  {
    uint64_t v36 = 0;
    do
    {
      if (*(void *)v213 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v37 = *(void *)(*((void *)&v212 + 1) + 8 * v36);
      uint64_t v38 = [obj objectForKeyedSubscript:v37];
      uint64_t v39 = [v198 objectForKeyedSubscript:v37];
      if ([v39 isEqualToString:v34])
      {
        uint64_t v40 = NSNumber;
        id v41 = [MEMORY[0x263F52808] sharedConfiguration];
        objc_msgSend(v40, "numberWithBool:", objc_msgSend(v41, "userMode") == 1);
        id v42 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_45;
      }
      if ([v39 isEqualToString:v35])
      {
        uint64_t v43 = [(MDMParser *)v193 _serviceSubscriptionsWithDMFKeysMappedToMCKeys:v38];
        goto LABEL_49;
      }
      if (![v39 isEqualToString:v194])
      {
        if ([v39 isEqualToString:v190])
        {
          id v41 = [NSURL fileURLWithPath:@"/private/var"];
          id v211 = 0;
          [v41 getResourceValue:&v211 forKey:v189 error:0];
          id v48 = v211;
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = NSNumber;
            [v48 floatValue];
            if (v192)
            {
              *(float *)&double v51 = *(float *)&v51 / 1000000000.0;
              [v50 numberWithFloat:v51];
            }
            else
            {
              [v50 numberWithDouble:*(float *)&v51 / 1000000000.0];
            uint64_t v55 = };

            id v42 = v55;
LABEL_45:
            uint64_t v38 = v42;
LABEL_46:
            id v18 = v197;
          }
        }
        else
        {
          if (!v192 || ![v39 isEqualToString:v188])
          {
            uint64_t v52 = [MEMORY[0x263EFF9D0] null];
            char v53 = [v38 isEqual:v52];

            id v18 = v197;
            if (v53) {
              goto LABEL_53;
            }
            goto LABEL_51;
          }
          uint64_t v43 = [v186 easEnrollmentID];
LABEL_49:
          id v41 = v38;
          uint64_t v38 = (void *)v43;
        }

        goto LABEL_51;
      }
      uint64_t v44 = [MEMORY[0x263F38B98] diskCapacity];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = NSNumber;
        [v44 floatValue];
        if (v192)
        {
          *(float *)&double v47 = *(float *)&v47 / 1000000000.0;
          [v46 numberWithFloat:v47];
        }
        else
        {
          [v46 numberWithDouble:*(float *)&v47 / 1000000000.0];
        uint64_t v54 = };

        id v41 = v54;
        uint64_t v38 = v41;
        goto LABEL_46;
      }
LABEL_51:
      if (v39) {
        [v196 setObject:v38 forKeyedSubscript:v39];
      }
LABEL_53:

      ++v36;
    }
    while (v32 != v36);
    uint64_t v56 = [obj countByEnumeratingWithState:&v212 objects:v233 count:16];
    uint64_t v32 = v56;
  }
  while (v56);
LABEL_73:

  [v184 errorsByPropertyKey];
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v58 = [v57 countByEnumeratingWithState:&v207 objects:v232 count:16];
  v195 = v57;
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v208;
    do
    {
      for (uint64_t k = 0; k != v59; ++k)
      {
        if (*(void *)v208 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void **)(*((void *)&v207 + 1) + 8 * k);
        uint64_t v63 = [v57 objectForKeyedSubscript:v62];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v64 = *(id *)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            uint64_t v65 = [v63 DMCVerboseDescription];
            *(_DWORD *)buf = 138543618;
            uint64_t v229 = (uint64_t)v62;
            __int16 v230 = 2114;
            v231 = v65;
            _os_log_impl(&dword_230A49000, v64, OS_LOG_TYPE_ERROR, "Failed to retrieve device information key %{public}@ with error: %{public}@", buf, 0x16u);

            id v18 = v197;
          }

          id v57 = v195;
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v207 objects:v232 count:16];
    }
    while (v59);
  }

  uint64_t v66 = *MEMORY[0x263F52C80];
  id v7 = v183;
  uint64_t v67 = v185;
  id v12 = v181;
  uint64_t v68 = v193;
  uint64_t v69 = v196;
  if ([v18 containsObject:*MEMORY[0x263F52C80]])
  {
    uint64_t v70 = [(MDMParser *)v193 server];
    uint64_t v71 = [v70 organizationInfo];

    if (v71) {
      [v196 setObject:v71 forKeyedSubscript:v66];
    }

    id v18 = v197;
  }
  uint64_t v72 = *MEMORY[0x263F52C28];
  if ([v18 containsObject:*MEMORY[0x263F52C28]])
  {
    uint64_t v73 = [(MDMParser *)v193 server];
    uint64_t v74 = [v73 MDMOptions];
    uint64_t v75 = (void *)v74;
    if (v74) {
      uint64_t v76 = v74;
    }
    else {
      uint64_t v76 = MEMORY[0x263EFFA78];
    }
    [v196 setObject:v76 forKeyedSubscript:v72];

    id v18 = v197;
  }
  uint64_t v77 = *MEMORY[0x263F52C08];
  id v6 = v182;
  if ([v18 containsObject:*MEMORY[0x263F52C08]])
  {
    uint64_t v78 = [NSNumber numberWithBool:DMCDeviceIsNetworkTethered()];
    [v196 setObject:v78 forKeyedSubscript:v77];
  }
  uint64_t v79 = *MEMORY[0x263F52C50];
  if ([v18 containsObject:*MEMORY[0x263F52C50]])
  {
    uint64_t v80 = DMCIOModelString();
    [v196 setObject:v80 forKeyedSubscript:v79];
  }
  uint64_t v81 = *MEMORY[0x263F52C60];
  if ([v18 containsObject:*MEMORY[0x263F52C60]])
  {
    int v82 = [MEMORY[0x263F38B98] modelNumber];
    int v83 = [MEMORY[0x263F38B98] regionInfo];
    char v84 = [NSString stringWithFormat:@"%@%@", v82, v83];
    [v196 setObject:v84 forKeyedSubscript:v81];

    uint64_t v67 = v185;
    id v18 = v197;
  }
  uint64_t v85 = *MEMORY[0x263F52C70];
  if ([v18 containsObject:*MEMORY[0x263F52C70]])
  {
    v86 = [MEMORY[0x263F38B98] marketingVersion];
    [v196 setObject:v86 forKeyedSubscript:v85];
  }
  uint64_t v87 = *MEMORY[0x263F52B50];
  if ([v18 containsObject:*MEMORY[0x263F52B50]])
  {
    char v88 = [MEMORY[0x263F38B98] buildVersion];
    [v196 setObject:v88 forKeyedSubscript:v87];
  }
  uint64_t v89 = *MEMORY[0x263F52D30];
  if ([v18 containsObject:*MEMORY[0x263F52D30]])
  {
    v90 = [MEMORY[0x263F38B98] supplementalMarketingVersionExtra];
    [v196 setObject:v90 forKeyedSubscript:v89];
  }
  uint64_t v91 = *MEMORY[0x263F52D28];
  if ([v18 containsObject:*MEMORY[0x263F52D28]])
  {
    id v92 = [MEMORY[0x263F38B98] supplementalBuildVersion];
    [v196 setObject:v92 forKeyedSubscript:v91];
  }
  uint64_t v93 = *MEMORY[0x263F52B48];
  if ([v18 containsObject:*MEMORY[0x263F52B48]])
  {
    v94 = DMCIOBluetoothMAC();
    [v196 setObject:v94 forKeyedSubscript:v93];
  }
  uint64_t v95 = *MEMORY[0x263F52D48];
  if ([v18 containsObject:*MEMORY[0x263F52D48]])
  {
    v96 = [MEMORY[0x263EFFA18] systemTimeZone];
    v97 = [v96 name];
    [v196 setObject:v97 forKeyedSubscript:v95];

    id v18 = v197;
  }
  uint64_t v98 = *MEMORY[0x263F52D00];
  if ([v18 containsObject:*MEMORY[0x263F52D00]])
  {
    v99 = [(MDMParser *)v193 server];
    uint64_t v100 = [v99 softwareUpdatePathFromDisk];

    if (v100) {
      [v196 setObject:v100 forKeyedSubscript:v98];
    }

    id v18 = v197;
  }
  uint64_t v101 = *MEMORY[0x263F52B38];
  if ([v18 containsObject:*MEMORY[0x263F52B38]])
  {
    v102 = [(MDMParser *)v193 server];
    uint64_t v103 = [v102 channelType];

    BOOL v104 = v103 == 1;
    id v18 = v197;
    if (v104)
    {
      v105 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F38BA0], "isCurrentUserConfigured") ^ 1);
      [v196 setObject:v105 forKeyedSubscript:v101];
    }
  }
  uint64_t v106 = *MEMORY[0x263F52D70];
  if ([v18 containsObject:*MEMORY[0x263F52D70]])
  {
    long long v203 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    CFArrayRef v107 = SCNetworkInterfaceCopyAll();
    uint64_t v108 = [(__CFArray *)v107 countByEnumeratingWithState:&v203 objects:v227 count:16];
    v109 = v107;
    if (v108)
    {
      uint64_t v110 = v108;
      uint64_t v111 = *(void *)v204;
      uint64_t v112 = *MEMORY[0x263F1BCA8];
LABEL_122:
      uint64_t v113 = 0;
      while (1)
      {
        if (*(void *)v204 != v111) {
          objc_enumerationMutation(v107);
        }
        v114 = *(const __SCNetworkInterface **)(*((void *)&v203 + 1) + 8 * v113);
        if ([(__CFString *)(id)SCNetworkInterfaceGetInterfaceType(v114) isEqualToString:v112]) {
          break;
        }
        if (v110 == ++v113)
        {
          uint64_t v110 = [(__CFArray *)v107 countByEnumeratingWithState:&v203 objects:v227 count:16];
          if (v110) {
            goto LABEL_122;
          }
          v109 = v107;
          id v7 = v183;
          uint64_t v68 = v193;
          goto LABEL_131;
        }
      }
      v109 = SCNetworkInterfaceGetHardwareAddressString(v114);

      id v7 = v183;
      uint64_t v68 = v193;
      if (!v109) {
        goto LABEL_132;
      }
      [v196 setObject:v109 forKeyedSubscript:v106];
    }
LABEL_131:

LABEL_132:
    uint64_t v67 = v185;
    uint64_t v69 = v196;
  }
  uint64_t v115 = *MEMORY[0x263F52CA8];
  if ([v18 containsObject:*MEMORY[0x263F52CA8]])
  {
    v116 = *(id *)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      v117 = [(id)DMCUMUserManagerClass() sharedManager];
      uint64_t v118 = [v117 userQuotaSize];
      *(_DWORD *)buf = 134217984;
      uint64_t v229 = v118;
      _os_log_impl(&dword_230A49000, v116, OS_LOG_TYPE_DEFAULT, "Quota Size is:%llu", buf, 0xCu);
    }
    v119 = NSNumber;
    v120 = [(id)DMCUMUserManagerClass() sharedManager];
    v121 = objc_msgSend(v119, "numberWithUnsignedLongLong:", objc_msgSend(v120, "userQuotaSize") / 0xF4240uLL);
    [v69 setObject:v121 forKeyedSubscript:v115];

    id v18 = v197;
  }
  uint64_t v122 = *MEMORY[0x263F52CB0];
  if ([v18 containsObject:*MEMORY[0x263F52CB0]])
  {
    v123 = NSNumber;
    v124 = [(id)DMCUMUserManagerClass() sharedManager];
    v125 = [v124 allUsers];
    v126 = objc_msgSend(v123, "numberWithUnsignedInteger:", objc_msgSend(v125, "count"));
    [v69 setObject:v126 forKeyedSubscript:v122];

    uint64_t v67 = v185;
    id v18 = v197;
  }
  uint64_t v127 = *MEMORY[0x263F52C48];
  if ([v18 containsObject:*MEMORY[0x263F52C48]]) {
    [v69 setObject:&unk_26E553CF8 forKeyedSubscript:v127];
  }
  uint64_t v128 = *MEMORY[0x263F52BC0];
  if ([v18 containsObject:*MEMORY[0x263F52BC0]])
  {
    v129 = [(id)DMCUMUserManagerClass() sharedManager];
    v130 = [v129 allUsers];
    uint64_t v131 = [v130 count];

    v132 = [(id)DMCUMUserManagerClass() sharedManager];
    unint64_t v133 = [v132 userQuotaSize];

    if (v133) {
      unint64_t v134 = [MEMORY[0x263F38BA0] getDiskAvailableSize] / v133;
    }
    else {
      unint64_t v134 = 0;
    }
    unint64_t v135 = v134 + v131;
    if (v135 >= 0x20) {
      uint64_t v136 = 32;
    }
    else {
      uint64_t v136 = v135;
    }
    v137 = [NSNumber numberWithUnsignedInteger:v136];
    [v69 setObject:v137 forKeyedSubscript:v128];

    uint64_t v67 = v185;
    id v18 = v197;
  }
  uint64_t v138 = *MEMORY[0x263F52D58];
  if ([v18 containsObject:*MEMORY[0x263F52D58]])
  {
    v139 = NSNumber;
    [MEMORY[0x263F38BA0] userSessionTimeout];
    v141 = [v139 numberWithInteger:(uint64_t)v140];
    [v69 setObject:v141 forKeyedSubscript:v138];
  }
  uint64_t v142 = *MEMORY[0x263F52D40];
  if ([v18 containsObject:*MEMORY[0x263F52D40]])
  {
    v143 = NSNumber;
    [MEMORY[0x263F38BA0] temporarySessionTimeout];
    v145 = [v143 numberWithInteger:(uint64_t)v144];
    [v69 setObject:v145 forKeyedSubscript:v142];
  }
  uint64_t v146 = *MEMORY[0x263F52D38];
  if ([v18 containsObject:*MEMORY[0x263F52D38]])
  {
    v147 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F38BA0], "temporarySessionOnly"));
    [v69 setObject:v147 forKeyedSubscript:v146];
  }
  uint64_t v148 = *MEMORY[0x263F52C40];
  if ([v18 containsObject:*MEMORY[0x263F52C40]])
  {
    v149 = [MEMORY[0x263F38BA0] managedAppleIDDefaultDomains];
    [v69 setObject:v149 forKeyedSubscript:v148];
  }
  uint64_t v150 = *MEMORY[0x263F52C78];
  if ([v18 containsObject:*MEMORY[0x263F52C78]])
  {
    v151 = [MEMORY[0x263F38BA0] onlineAuthenticationGracePeriod];
    [v69 setObject:v151 forKeyedSubscript:v150];
  }
  uint64_t v152 = *MEMORY[0x263F52CF8];
  if ([v18 containsObject:*MEMORY[0x263F52CF8]])
  {
    v153 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F38BA0], "shouldSkipLanguageAndLocaleSetupForNewUsers"));
    [v69 setObject:v153 forKeyedSubscript:v152];
  }
  uint64_t v154 = *MEMORY[0x263F52C38];
  if ([v18 containsObject:*MEMORY[0x263F52C38]])
  {
    id v202 = 0;
    v155 = [MEMORY[0x263F38B38] midWithError:&v202];
    id v156 = v202;
    if (v156)
    {
      v157 = v156;
      BOOL v10 = [(id)objc_opt_class() responseWithError:v156];

      goto LABEL_184;
    }
    [v69 setObject:v155 forKeyedSubscript:v154];

    uint64_t v67 = v185;
  }
  uint64_t v158 = *MEMORY[0x263F52B28];
  if ([v18 containsObject:*MEMORY[0x263F52B28]])
  {
    v159 = [(id)objc_opt_class() appstoredUserAgent];
    [v69 setObject:v159 forKeyedSubscript:v158];
  }
  uint64_t v160 = *MEMORY[0x263F52D60];
  if ([v18 containsObject:*MEMORY[0x263F52D60]])
  {
    v161 = [MEMORY[0x263F01880] defaultWorkspace];
    v157 = [v161 deviceIdentifierForVendorSeedData];

    if ([v157 length])
    {
      [v69 setObject:v157 forKeyedSubscript:v160];

      id v18 = v197;
      goto LABEL_170;
    }
    v176 = *(id *)DMCLogObjects();
    if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v176, OS_LOG_TYPE_ERROR, "Failed to fetch VID seed", buf, 2u);
    }

    v177 = (void *)MEMORY[0x263F087E8];
    uint64_t v178 = *MEMORY[0x263F38B10];
    v179 = DMCErrorArray();
    objc_msgSend(v177, "DMCErrorWithDomain:code:descriptionArray:errorType:", v178, 12103, v179, *MEMORY[0x263F38A40], 0);
    id v27 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v10 = [(id)objc_opt_class() responseWithError:v27];
  }
  else
  {
LABEL_170:
    uint64_t v162 = *MEMORY[0x263F52D08];
    if ([v18 containsObject:*MEMORY[0x263F52D08]])
    {
      v163 = [MEMORY[0x263F78250] currentProductType];
      [v69 setObject:v163 forKeyedSubscript:v162];
    }
    uint64_t v164 = *MEMORY[0x263F52B18];
    if ([v18 containsObject:*MEMORY[0x263F52B18]])
    {
      v165 = [(MDMParser *)v68 _accessibilitySettings];
      [v69 setObject:v165 forKeyedSubscript:v164];
    }
    uint64_t v166 = *MEMORY[0x263F52BA0];
    if ([v18 containsObject:*MEMORY[0x263F52BA0]])
    {
      v167 = +[MDMAttestation sharedInstance];
      id v201 = 0;
      v168 = objc_msgSend(v167, "attestationCertificateChainAnonymous:nonce:outError:", objc_msgSend(v186, "isUserEnrollment"), v67, &v201);
      id v169 = v201;

      if (!v168 || v169)
      {
        v170 = *(id *)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v229 = (uint64_t)v169;
          _os_log_impl(&dword_230A49000, v170, OS_LOG_TYPE_ERROR, "Failed obtaining device attestation certificate chain. Continuing without attestation. Error: %@", buf, 0xCu);
        }
      }
      if ([v168 count] == 2)
      {
        v171 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
        v172 = [v168 objectAtIndexedSubscript:0];
        CFDataRef v173 = SecCertificateCopyData(v172);
        [v171 setObject:v173 atIndexedSubscript:0];

        v174 = [v168 objectAtIndexedSubscript:1];
        CFDataRef v175 = SecCertificateCopyData(v174);
        [v171 setObject:v175 atIndexedSubscript:1];

        uint64_t v69 = v196;
        [v196 setObject:v171 forKeyedSubscript:v166];
      }
      uint64_t v68 = v193;
    }
    [(MDMParser *)v68 _applyOverridesToDeviceInformationDictionary:v69];
    v226[0] = @"Acknowledged";
    v225[0] = @"Status";
    v225[1] = @"QueryResponses";
    v157 = (void *)[v69 copy];
    v226[1] = v157;
    BOOL v10 = [NSDictionary dictionaryWithObjects:v226 forKeys:v225 count:2];
LABEL_184:
    id v27 = 0;
  }
  uint64_t v11 = v187;

  uint64_t v24 = v180;
  uint64_t v26 = v184;
LABEL_186:

  uint64_t v8 = v185;
LABEL_187:

LABEL_33:
LABEL_34:

  return v10;
}

- (void)_applyOverridesToDeviceInformationDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F52C58];
  id v29 = v3;
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F52C58]];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F38B70];
    id v7 = [v29 objectForKeyedSubscript:v4];
    uint64_t v8 = [v6 modelNameWithDefaultValue:v7];
    [v29 setObject:v8 forKeyedSubscript:v4];
  }
  uint64_t v9 = *MEMORY[0x263F52C60];
  BOOL v10 = [v29 objectForKeyedSubscript:*MEMORY[0x263F52C60]];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263F38B70];
    id v12 = [v29 objectForKeyedSubscript:v9];
    uint64_t v13 = [v11 modelNumberWithDefaultValue:v12];
    [v29 setObject:v13 forKeyedSubscript:v9];
  }
  uint64_t v14 = *MEMORY[0x263F52C98];
  uint64_t v15 = [v29 objectForKeyedSubscript:*MEMORY[0x263F52C98]];

  if (v15)
  {
    long long v16 = (void *)MEMORY[0x263F38B70];
    uint64_t v17 = [v29 objectForKeyedSubscript:v14];
    id v18 = [v16 productNameWithDefaultValue:v17];
    [v29 setObject:v18 forKeyedSubscript:v14];
  }
  uint64_t v19 = *MEMORY[0x263F52B98];
  uint64_t v20 = [v29 objectForKeyedSubscript:*MEMORY[0x263F52B98]];

  if (v20)
  {
    uint64_t v21 = (void *)MEMORY[0x263F38B70];
    uint64_t v22 = [v29 objectForKeyedSubscript:v19];
    uint64_t v23 = [v21 deviceNameWithDefaultValue:v22];
    [v29 setObject:v23 forKeyedSubscript:v19];
  }
  uint64_t v24 = *MEMORY[0x263F52D08];
  uint64_t v25 = [v29 objectForKeyedSubscript:*MEMORY[0x263F52D08]];

  if (v25)
  {
    uint64_t v26 = (void *)MEMORY[0x263F38B70];
    id v27 = [v29 objectForKeyedSubscript:v24];
    uint64_t v28 = [v26 softwareUpdateDeviceIDWithDefaultValue:v27];
    [v29 setObject:v28 forKeyedSubscript:v24];
  }
}

- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3
{
  return [(MDMParser *)self _allowedDeviceQueriesForAccessRights:a3 isDataSeparated:0];
}

- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3 isDataSeparated:(BOOL)a4
{
  return (id)[MEMORY[0x263F52820] allowedDeviceQueriesForAccessRights:a3 isDataSeparated:a4];
}

- (id)_certificateList:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKeyedSubscript:@"ManagedOnly"];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v30 = v3;
    int v4 = [v3 BOOLValue];
    uint64_t v5 = [MEMORY[0x263F52810] sharedConfiguration];
    int v6 = [v5 isUserEnrollment];

    id v29 = [MEMORY[0x263F53C50] sharedConnection];
    id v7 = [v29 installedProfilesWithFilterFlags:1];
    uint64_t v36 = objc_opt_new();
    CFTypeID TypeID = SecIdentityGetTypeID();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v7;
    uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (!v34) {
      goto LABEL_31;
    }
    int v33 = v6 | v4;
    uint64_t v32 = *(void *)v43;
    while (1)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (!v33 || [*(id *)(*((void *)&v42 + 1) + 8 * i) isManagedByMDM])
        {
          uint64_t v35 = i;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v11 = [v10 payloads];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v48 count:16];
          if (!v12) {
            goto LABEL_28;
          }
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v39;
          while (1)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(id *)(*((void *)&v38 + 1) + 8 * j);
              uint64_t v17 = objc_opt_new();
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = (void *)MEMORY[0x263F53C18];
                uint64_t v19 = [v16 certificatePersistentID];
                SecCertificateRef v20 = (SecCertificateRef)[v18 copyItemWithPersistentID:v19 useSystemKeychain:1];

                if (v20)
                {
                  SecCertificateRef certificateRef = 0;
                  CFTypeID v21 = CFGetTypeID(v20);
                  if (v21 == TypeID)
                  {
                    SecIdentityCopyCertificate(v20, &certificateRef);
                    CFRelease(v20);
                    SecCertificateRef v20 = certificateRef;
                    if (!certificateRef) {
                      goto LABEL_26;
                    }
                  }
                  else
                  {
                    SecCertificateRef certificateRef = v20;
                  }
                  CFDataRef v22 = SecCertificateCopyData(v20);
                  if (v22)
                  {
                    CFDataRef v23 = v22;
                    [v17 setObject:v22 forKeyedSubscript:@"Data"];
                  }
                  uint64_t v24 = (void *)SecCertificateCopyCommonNames();
                  CFRelease(certificateRef);
                  if (v24)
                  {
                    uint64_t v25 = [v24 firstObject];
                    [v17 setObject:v25 forKeyedSubscript:@"CommonName"];
                  }
                  uint64_t v26 = [NSNumber numberWithBool:v21 == TypeID];
                  [v17 setObject:v26 forKeyedSubscript:@"IsIdentity"];

                  [v36 addObject:v17];
                }
              }
LABEL_26:
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v48 count:16];
            if (!v13)
            {
LABEL_28:

              uint64_t i = v35;
              break;
            }
          }
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (!v34)
      {
LABEL_31:

        v46[0] = @"Status";
        v46[1] = @"CertificateList";
        v47[0] = @"Acknowledged";
        v47[1] = v36;
        id v27 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

        id v3 = v30;
        goto LABEL_33;
      }
    }
  }
  id v27 = +[MDMParser malformedRequestErrorResult];
LABEL_33:

  return v27;
}

- (id)_provisioningProfileList:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKeyedSubscript:@"ManagedOnly"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v16 = +[MDMParser malformedRequestErrorResult];
  }
  else
  {
    uint64_t v25 = v3;
    unsigned int v4 = [v3 BOOLValue];
    uint64_t v5 = [MEMORY[0x263F52810] sharedConfiguration];
    int v6 = [v5 isUserEnrollment];

    id v7 = +[MDMMCInterface provisioningProfileUUIDsWithManagedOnly:v6 | v4];
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          cf[0] = 0;
          uint64_t v14 = MISCopyProvisioningProfile();
          if (v14)
          {
            uint64_t v17 = v14;

            id v18 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              LOWORD(cf[0]) = 0;
              _os_log_impl(&dword_230A49000, v18, OS_LOG_TYPE_ERROR, "Could not retrieve the list of provisioning profiles.", (uint8_t *)cf, 2u);
            }
            uint64_t v19 = (void *)MEMORY[0x263F087E8];
            uint64_t v20 = *MEMORY[0x263F38AD8];
            CFTypeID v21 = [NSNumber numberWithInt:v17];
            CFDataRef v22 = DMCErrorArray();
            CFDataRef v23 = objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 25003, v22, *MEMORY[0x263F38A40], v21, 0);
            id v16 = +[MDMAbstractTunnelParser responseWithError:v23];

            goto LABEL_15;
          }
          uint64_t v15 = objc_opt_new();
          [v15 setObject:MISProvisioningProfileGetName() forKeyedSubscript:@"Name"];
          [v15 setObject:MISProvisioningProfileGetUUID() forKeyedSubscript:@"UUID"];
          [v15 setObject:MISProvisioningProfileGetExpirationDate() forKeyedSubscript:@"ExpiryDate"];
          CFRelease(cf[0]);
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v31[0] = @"Status";
    v31[1] = @"ProvisioningProfileList";
    v32[0] = @"Acknowledged";
    v32[1] = v8;
    id v16 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
LABEL_15:
    id v3 = v25;
  }
  return v16;
}

- (id)_installProvisioningProfile:(id)a3
{
  unsigned int v4 = [a3 objectForKeyedSubscript:@"ProvisioningProfile"];
  uint64_t v5 = [(MDMParser *)self managingProfileIdentifier];
  id v9 = 0;
  +[MDMMCInterface installProvisioningProfileData:v4 managingProfileIdentifier:v5 outError:&v9];
  id v6 = v9;

  if (v6) {
    +[MDMAbstractTunnelParser responseWithError:v6];
  }
  else {
  id v7 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  }

  return v7;
}

- (BOOL)_isProfileIdentifierManaged:(id)a3
{
  id v4 = a3;
  if ([(MDMParser *)self isChaperoned])
  {
    BOOL v5 = 1;
  }
  else if (self->_managingProfileIdentifier)
  {
    BOOL v5 = +[MDMMCInterface isProfileWithIdentifier:managedByProfileWithIdentifier:](MDMMCInterface, "isProfileWithIdentifier:managedByProfileWithIdentifier:", v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isDDMProfileIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  BOOL v5 = [v3 sharedConnection];
  id v6 = [v5 installedProfileWithIdentifier:v4];

  id v7 = [v6 installOptions];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F53DB8]];
    char v10 = [v9 BOOLValue];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_isProvisioningProfileUUIDManaged:(id)a3
{
  id v4 = a3;
  if ([(MDMParser *)self isChaperoned])
  {
    BOOL v5 = 1;
  }
  else if (self->_managingProfileIdentifier)
  {
    BOOL v5 = +[MDMMCInterface isProvisioningProfileWithUUID:managedByProfileWithIdentifier:](MDMMCInterface, "isProvisioningProfileWithUUID:managedByProfileWithIdentifier:", v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_removeProvisioningProfile:(id)a3
{
  id v4 = [a3 objectForKey:@"UUID"];
  if (!v4)
  {
    uint64_t v8 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
    goto LABEL_10;
  }
  if (![(MDMParser *)self isChaperoned]
    && ![(MDMParser *)self _isProvisioningProfileUUIDManaged:v4])
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F38B10];
    uint64_t v11 = DMCErrorArray();
    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 12014, v11, *MEMORY[0x263F38A40], v4, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  BOOL v5 = [(MDMParser *)self managingProfileIdentifier];
  id v13 = 0;
  +[MDMMCInterface removeProvisioningProfileWithUUID:v4 managingProfileIdentifier:v5 outError:&v13];
  id v6 = v13;

  if (v6)
  {
LABEL_8:
    uint64_t v7 = +[MDMAbstractTunnelParser responseWithError:v6];
    goto LABEL_9;
  }
  uint64_t v7 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
LABEL_9:
  uint64_t v8 = (void *)v7;

LABEL_10:
  return v8;
}

- (BOOL)_identifiersIsStringArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              BOOL v9 = 0;
              goto LABEL_15;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      BOOL v9 = 1;
LABEL_15:
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)_installedApplicationList:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MDMInstalledApplicationListCommand);
  uint64_t v5 = objc_alloc_init(MDMAppPropertyShim);
  [(MDMInstalledApplicationListCommand *)v4 setDataSource:v5];

  uint64_t v6 = [MEMORY[0x263F52810] sharedConfiguration];
  -[MDMInstalledApplicationListCommand setIsUserEnrollment:](v4, "setIsUserEnrollment:", [v6 isUserEnrollment]);

  uint64_t v7 = [(MDMInstalledApplicationListCommand *)v4 responseForRequest:v3];

  return v7;
}

- (id)_restrictions:(id)a3
{
  return [(MDMParser *)self _restrictions:a3 withProfileFilterFlags:19];
}

- (id)_restrictions:(id)a3 withProfileFilterFlags:(int)a4
{
  v57[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_restrictions_withProfileFilterFlags__onceToken != -1) {
    dispatch_once(&_restrictions_withProfileFilterFlags__onceToken, &__block_literal_global_1062);
  }
  uint64_t v56 = @"Status";
  v57[0] = @"Acknowledged";
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = objc_opt_new();
  BOOL v9 = [MEMORY[0x263F39D18] systemConnection];
  id v54 = 0;
  uint64_t v10 = [v9 performRequest:v8 error:&v54];
  id v11 = v54;

  if (v11)
  {
    long long v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F38B10];
    DMCErrorArray();
    uint64_t v15 = v14 = v7;
    uint64_t v16 = objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12082, v15, *MEMORY[0x263F38A40], 0);

    uint64_t v7 = v14;
    id v17 = [(id)objc_opt_class() responseWithError:v16];
    goto LABEL_23;
  }
  id v48 = v8;
  id v18 = [v10 restrictions];
  uint64_t v19 = +[MDMMCInterface filterMDMRestrictions:v18 acceptingKeysFromDictionary:_restrictions_withProfileFilterFlags__mdmQueryableRestrictions];
  [v7 setObject:v19 forKeyedSubscript:@"GlobalRestrictions"];
  [v7 setObject:v19 forKeyedSubscript:@"GlobalRestrictions"];

  uint64_t v20 = [v5 objectForKeyedSubscript:@"ProfileRestrictions"];
  if (!v20) {
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v20 BOOLValue]) {
    goto LABEL_21;
  }
  double v47 = v7;
  CFTypeID v21 = objc_opt_new();
  CFDataRef v22 = v21;
  if (a4 == 3) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = a4 & 0x3F;
  }
  [v21 setFilterFlags:v23];
  uint64_t v24 = v22;
  uint64_t v25 = [MEMORY[0x263F39D18] systemConnection];
  id v53 = 0;
  uint64_t v26 = [v25 performRequest:v22 error:&v53];
  id v27 = v53;

  if (!v27)
  {
    long long v44 = v24;
    long long v45 = v20;
    id v46 = v5;
    uint64_t v32 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v43 = v26;
    int v33 = [v26 profiles];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v50 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v38 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v39 = [v38 restrictions];
          long long v40 = +[MDMMCInterface filterMDMRestrictions:v39 acceptingKeysFromDictionary:_restrictions_withProfileFilterFlags__mdmQueryableRestrictions];
          long long v41 = [v38 identifier];
          [v32 setObject:v40 forKeyedSubscript:v41];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v35);
    }

    uint64_t v7 = v47;
    [v47 setObject:v32 forKeyedSubscript:@"ProfileRestrictions"];

    uint64_t v20 = v45;
    id v5 = v46;
LABEL_21:
    id v17 = v7;
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  long long v28 = (void *)MEMORY[0x263F087E8];
  uint64_t v29 = *MEMORY[0x263F38B10];
  DMCErrorArray();
  uint64_t v31 = v30 = v26;
  uint64_t v16 = objc_msgSend(v28, "DMCErrorWithDomain:code:descriptionArray:errorType:", v29, 12083, v31, *MEMORY[0x263F38A40], 0);

  id v17 = [(id)objc_opt_class() responseWithError:v16];

  uint64_t v7 = v47;
LABEL_22:

  uint64_t v8 = v48;
LABEL_23:

  return v17;
}

uint64_t __50__MDMParser__restrictions_withProfileFilterFlags___block_invoke()
{
  _restrictions_withProfileFilterFlags__mdmQueryableRestrictions = +[MDMMCInterface mdmQueryableRestrictions];
  return MEMORY[0x270F9A758]();
}

- (unint64_t)_profileInstallationStyleForRequest:(id)a3
{
  id v3 = [(MDMParser *)self managingProfileIdentifier];
  unint64_t v4 = v3 != 0;

  return v4;
}

- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4
{
  return [(MDMParser *)self _installProfile:a3 accessRights:a4 installationType:0];
}

- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4 installationType:(int64_t)a5
{
  char v6 = a4;
  id v8 = a3;
  BOOL v9 = [v8 objectForKey:@"Payload"];
  if (!v9)
  {
    long long v12 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
    goto LABEL_25;
  }
  char v30 = 0;
  id v29 = 0;
  uint64_t v10 = +[MDMMCInterface profileIdentifierForProfileData:v9 allowEmptyPayload:0 outIsSupervisionProfile:&v30 outProfileSigner:0 outMayInstallCloudProfile:0 outError:&v29];
  id v11 = v29;
  if (v11) {
    goto LABEL_3;
  }
  if (![(MDMParser *)self isChaperoned]
    && (!self->_managingProfileIdentifier || (objc_msgSend(v10, "isEqualToString:") & 1) == 0))
  {
    uint64_t v13 = [MEMORY[0x263F52810] sharedConfiguration];
    char v14 = [v13 isUserEnrollment];

    if ((v6 & 2) == 0 && (v14 & 1) == 0)
    {
      uint64_t v15 = [(MDMParser *)self _notAuthorizedError];
      goto LABEL_13;
    }
  }
  if ([(MDMParser *)self _isDDMProfileIdentifier:v10])
  {
    uint64_t v15 = [(MDMParser *)self _managedByDDMError:v10];
LABEL_13:
    id v11 = (id)v15;
    if (!v15)
    {
LABEL_23:
      long long v12 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
      goto LABEL_24;
    }
    goto LABEL_3;
  }
  if (v30)
  {
    uint64_t v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring supervision profile.", buf, 2u);
    }
    goto LABEL_23;
  }
  id v17 = objc_opt_new();
  id v18 = [(MDMParser *)self managingProfileIdentifier];
  [v17 setManagingProfileIdentifier:v18];

  objc_msgSend(v17, "setStyle:", -[MDMParser _profileInstallationStyleForRequest:](self, "_profileInstallationStyleForRequest:", v8));
  [v17 setProfileData:v9];
  [v17 setType:a5 == 1];
  uint64_t v19 = [MEMORY[0x263F52810] sharedConfiguration];
  uint64_t v20 = [v19 personaID];

  if (v20) {
    [v17 setPersonaID:v20];
  }
  CFTypeID v21 = [MEMORY[0x263F39D18] systemConnection];
  id v27 = 0;
  id v22 = (id)[v21 performRequest:v17 error:&v27];
  id v11 = v27;

  uint64_t v23 = [v11 userInfo];
  uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v24)
  {
    id v25 = v24;

    id v11 = v25;
  }

  if (!v11) {
    goto LABEL_23;
  }
LABEL_3:
  long long v12 = +[MDMAbstractTunnelParser responseWithError:v11];

LABEL_24:
LABEL_25:

  return v12;
}

- (id)_removeProfile:(id)a3
{
  unint64_t v4 = [a3 objectForKey:@"Identifier"];
  if (v4) {
    [(MDMParser *)self _removeProfileWithIdentifier:v4 forInstalledProfilesWithFilterFlags:19];
  }
  else {
  id v5 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
  }

  return v5;
}

- (id)_removeProfileWithIdentifier:(id)a3 forInstalledProfilesWithFilterFlags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = +[MDMMCInterface profileIdentifiersWithFilterFlags:v4];
  if ([v7 containsObject:v6])
  {
    id v8 = [(MDMParser *)self _removeProfileWithIdentifier:v6 installationType:(~v4 & 9) == 0];
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F38B10];
    uint64_t v11 = DMCErrorArray();

    long long v12 = objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 12075, v11, *MEMORY[0x263F38A40], v6, 0);
    id v8 = +[MDMAbstractTunnelParser responseWithError:v12];

    id v6 = (id)v11;
  }

  return v8;
}

- (id)_removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  if (!self->_managingProfileIdentifier) {
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isEqualToString:"))
  {
    id v8 = objc_opt_new();

    [v8 setProfileIdentifier:v6];
    [v8 setType:a4 == 1];
    BOOL v9 = [MEMORY[0x263F39D18] systemConnection];
    [v9 performRequest:v8 completion:&__block_literal_global_1079];

    uint64_t v10 = 0;
    goto LABEL_14;
  }
  if ([(MDMParser *)self _isDDMProfileIdentifier:v6])
  {
    id v11 = [(MDMParser *)self _managedByDDMError:v6];
    goto LABEL_9;
  }
  if ([(MDMParser *)self isChaperoned]
    || [(MDMParser *)self _isProfileIdentifierManaged:v6])
  {
LABEL_8:
    [v7 setProfileIdentifier:v6];
    [v7 setType:a4 == 1];
    long long v12 = [MEMORY[0x263F39D18] systemConnection];
    id v21 = 0;
    id v13 = (id)[v12 performRequest:v7 error:&v21];
    id v11 = v21;
  }
  else
  {
    id v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F38B10];
    uint64_t v20 = DMCErrorArray();
    objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 12013, v20, *MEMORY[0x263F38A40], v6, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  if (v11)
  {
    char v14 = [v11 userInfo];
    uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    if (v15)
    {
      id v16 = v15;

      id v11 = v16;
    }
    uint64_t v10 = +[MDMAbstractTunnelParser responseWithError:v11];
  }
  else
  {
    uint64_t v10 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  }
LABEL_14:

  return v10;
}

void __59__MDMParser__removeProfileWithIdentifier_installationType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "Could not remove MDM profile: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)_validateSetting:(id)a3 accessRights:(unint64_t)a4 outError:(id *)a5
{
  __int16 v6 = a4;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = [v8 objectForKey:@"Item"];
  if (!v9) {
    goto LABEL_138;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_138;
  }
  uint64_t v10 = [(MDMParser *)self _allSettingsItems];
  int v11 = [v10 containsObject:v9];

  if (!v11) {
    goto LABEL_138;
  }
  if ([v9 isEqualToString:@"DeviceName"])
  {
    long long v12 = [v8 objectForKey:@"DeviceName"];
    if (v12) {
      goto LABEL_6;
    }
    goto LABEL_137;
  }
  if ([v9 isEqualToString:@"Wallpaper"])
  {
    long long v12 = [v8 objectForKey:@"Image"];
    if (!v12) {
      goto LABEL_137;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_137;
    }
    char v14 = [v8 objectForKey:@"Where"];
    if (!v14) {
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (int)[v14 intValue] < 1
      || (int)[v14 intValue] > 3)
    {
      goto LABEL_16;
    }
LABEL_112:

    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"SoftwareUpdateSettings"])
  {
    long long v12 = [v8 objectForKey:@"RecommendationCadence"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (int)[v12 intValue] <= 2
        && ([v12 intValue] & 0x80000000) == 0)
      {
        goto LABEL_7;
      }
    }
    goto LABEL_137;
  }
  if ([v9 isEqualToString:@"DataRoaming"]
    || DMCCTSupportsVoiceRoaming()
    && [v9 isEqualToString:@"VoiceRoaming"]
    || [v9 isEqualToString:@"Bluetooth"]
    || [MEMORY[0x263F38B98] hasInternetTetheringCapability]
    && [v9 isEqualToString:@"PersonalHotspot"])
  {
    if ((v6 & 0x20) == 0)
    {
      if (a5)
      {
        [(MDMParser *)self _notAuthorizedError];
        BOOL v13 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_139;
      }
      goto LABEL_138;
    }
LABEL_85:
    uint64_t v19 = @"Enabled";
    goto LABEL_86;
  }
  if ([v9 isEqualToString:@"ApplicationConfiguration"])
  {
    long long v12 = [v8 objectForKey:@"Identifier"];
    if (!v12) {
      goto LABEL_137;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_137;
    }
    uint64_t v15 = @"Configuration";
LABEL_40:
    char v14 = [v8 objectForKey:v15];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
    }
    id v16 = [MEMORY[0x263F52810] sharedConfiguration];
    char v17 = [v16 isUserEnrollment];

    if (v6 & 0x1000) != 0 || (v17) {
      goto LABEL_112;
    }
    if (!a5)
    {
LABEL_16:

      goto LABEL_137;
    }
    id v18 = [(MDMParser *)self _notAuthorizedError];
LABEL_46:
    *a5 = v18;
    goto LABEL_16;
  }
  if ([v9 isEqualToString:@"ApplicationAttributes"])
  {
    long long v12 = [v8 objectForKey:@"Identifier"];
    if (!v12) {
      goto LABEL_137;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_137;
    }
    uint64_t v15 = @"Attributes";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"MaximumResidentUsers"])
  {
    uint64_t v19 = @"MaximumResidentUsers";
    goto LABEL_86;
  }
  if ([v9 isEqualToString:@"SharedDeviceConfiguration"])
  {
    uint64_t v20 = [v8 objectForKey:@"QuotaSize"];
    id v21 = [v8 objectForKey:@"ResidentUsers"];
    id v22 = [v8 objectForKey:@"UserSessionTimeout"];
    uint64_t v23 = [v8 objectForKey:@"TemporarySessionTimeout"];
    uint64_t v24 = [v8 objectForKey:@"TemporarySessionOnly"];
    id obj = [v8 objectForKey:@"ManagedAppleIDDefaultDomains"];
    uint64_t v59 = [v8 objectForKey:@"OnlineAuthenticationGracePeriod"];
    id v25 = [v8 objectForKeyedSubscript:@"AwaitUserConfiguration"];
    uint64_t v26 = [v8 objectForKeyedSubscript:@"PasscodePolicy"];
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_81;
      }
    }
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_81;
      }
    }
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || obj && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v59 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_81:
      BOOL v28 = 1;
    }
    else
    {
      uint64_t v27 = [v25 objectForKey:@"Enabled"];
      uint64_t v58 = [v26 objectForKey:@"PasscodeLockGracePeriod"];
      [v26 objectForKey:@"AutoLockTime"];
      v57 = uint64_t v56 = (void *)v27;
      BOOL v28 = 1;
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (!v57 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            BOOL v28 = 0;
          }
        }
      }
    }
    if (!v28) {
      goto LABEL_8;
    }
LABEL_138:
    BOOL v13 = 0;
    goto LABEL_139;
  }
  if ([v9 isEqualToString:@"DiagnosticSubmission"])
  {
    long long v12 = [v8 objectForKey:@"Enabled"];
    if (!v12) {
      goto LABEL_137;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_137;
    }
    if (!+[MDMMCInterface isDiagnosticsSubmissionRestricted])goto LABEL_7; {
    goto LABEL_79;
    }
  }
  if ([v9 isEqualToString:@"AppAnalytics"]) {
    goto LABEL_85;
  }
  if ([v9 isEqualToString:@"PasscodeLockGracePeriod"])
  {
    uint64_t v19 = @"PasscodeLockGracePeriod";
LABEL_86:
    long long v12 = [v8 objectForKey:v19];
    if (!v12) {
      goto LABEL_137;
    }
LABEL_6:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_7:

LABEL_8:
      BOOL v13 = 1;
      goto LABEL_139;
    }
    goto LABEL_137;
  }
  if ([v9 isEqualToString:@"OrganizationInfo"])
  {
    long long v12 = [v8 objectForKeyedSubscript:@"OrganizationInfo"];
    if (!v12) {
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_137;
    }
    uint64_t v31 = [v12 objectForKeyedSubscript:*MEMORY[0x263F38990]];
    if (v31)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v31 length])
        {
          uint64_t v32 = [v12 objectForKeyedSubscript:*MEMORY[0x263F38978]];
          if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            int v33 = [v12 objectForKeyedSubscript:*MEMORY[0x263F38998]];
            if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              BOOL v36 = 1;
            }
            else
            {
              uint64_t v34 = [v12 objectForKeyedSubscript:*MEMORY[0x263F38980]];
              if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                BOOL v36 = 1;
              }
              else
              {
                uint64_t v35 = [v12 objectForKeyedSubscript:*MEMORY[0x263F38988]];
                BOOL v36 = 0;
                if (v35)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    BOOL v36 = 1;
                  }
                }
              }
            }

            if (!v36) {
              goto LABEL_7;
            }
            goto LABEL_137;
          }
        }
      }
    }

LABEL_137:
    goto LABEL_138;
  }
  if ([v9 isEqualToString:@"DefaultApplications"])
  {
    long long v12 = [v8 objectForKeyedSubscript:@"WebBrowser"];
    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"MDMOptions"])
  {
    long long v12 = [v8 objectForKeyedSubscript:@"MDMOptions"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_137;
    }
    char v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F52B00]];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
    }
    goto LABEL_112;
  }
  if ([v9 isEqualToString:@"TimeZone"])
  {
    long long v12 = [v8 objectForKey:@"TimeZone"];
    if (!v12) {
      goto LABEL_137;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_137;
    }
    if (!+[MDMMCInterface isAutomaticDateAndTimeForced]) {
      goto LABEL_7;
    }
LABEL_79:
    if (!a5) {
      goto LABEL_137;
    }
    id v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F38AF0];
    char v14 = DMCErrorArray();
    id v18 = objc_msgSend(v29, "DMCErrorWithDomain:code:descriptionArray:errorType:", v30, 28003, v14, *MEMORY[0x263F38A40], 0);
    goto LABEL_46;
  }
  if (![v9 isEqualToString:@"AccessibilitySettings"]) {
    goto LABEL_138;
  }
  [(id)objc_opt_class() _numericAccessibilitySettingsKeys];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [obja countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v63;
    while (2)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v63 != v39) {
          objc_enumerationMutation(obja);
        }
        long long v41 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v42 = [v8 objectForKeyedSubscript:v41];
        if (v42)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a5)
            {
              long long v45 = (void *)MEMORY[0x263F087E8];
              uint64_t v46 = *MEMORY[0x263F38AF0];
              uint64_t v55 = v41;
              double v47 = DMCErrorArray();
              uint64_t v48 = *MEMORY[0x263F38A40];
              long long v49 = v45;
              uint64_t v50 = v46;
              uint64_t v51 = 28006;
              goto LABEL_143;
            }
LABEL_144:

            BOOL v13 = 0;
            goto LABEL_145;
          }
          if ([v41 isEqualToString:@"TextSize"])
          {
            long long v43 = +[MDMAccessibilityManager sharedInstance];
            char v44 = objc_msgSend(v43, "isValidTextSize:", objc_msgSend(v42, "integerValue"));

            if ((v44 & 1) == 0)
            {
              if (a5)
              {
                id v53 = (void *)MEMORY[0x263F087E8];
                uint64_t v54 = *MEMORY[0x263F38AF0];
                uint64_t v55 = v41;
                double v47 = DMCErrorArray();
                uint64_t v48 = *MEMORY[0x263F38A40];
                long long v49 = v53;
                uint64_t v50 = v54;
                uint64_t v51 = 28007;
LABEL_143:
                objc_msgSend(v49, "DMCErrorWithDomain:code:descriptionArray:errorType:", v50, v51, v47, v48, v55, 0);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_144;
            }
          }
        }
      }
      uint64_t v38 = [obja countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_145:

LABEL_139:
  return v13;
}

- (id)_performSetDeviceName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting device name.", buf, 2u);
  }
  int v5 = [v3 objectForKey:@"DeviceName"];

  if (DMCLockdownSetDeviceName())
  {
    __int16 v6 = 0;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F38B00];
    BOOL v9 = DMCErrorArray();
    __int16 v6 = objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 14003, v9, *MEMORY[0x263F38A40], 0);
  }
  return v6;
}

- (id)_performSetWallpaper:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting wallpaper.", buf, 2u);
  }
  int v5 = [v3 objectForKeyedSubscript:@"Image"];
  __int16 v6 = [MEMORY[0x263F1C6B0] imageWithData:v5];
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"Where"];
    int v8 = [v7 intValue];

    if (v8 == 3)
    {
      uint64_t v10 = 1;
    }
    else
    {
      if (v8 == 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = 1;
LABEL_13:
        *(void *)buf = 0;
        uint64_t v27 = buf;
        uint64_t v28 = 0x3032000000;
        id v29 = __Block_byref_object_copy__5;
        uint64_t v30 = __Block_byref_object_dispose__5;
        id v31 = 0;
        dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
        id v16 = objc_opt_new();
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __34__MDMParser__performSetWallpaper___block_invoke;
        v23[3] = &unk_264B9DB18;
        char v17 = v15;
        uint64_t v24 = v17;
        id v25 = buf;
        [v16 setWallpaper:v6 forLockScreen:v10 homeScreen:v9 completionHandler:v23];
        dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
        if (*((void *)v27 + 5))
        {
          id v18 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = *((void *)v27 + 5);
            *(_DWORD *)uint64_t v32 = 138543362;
            uint64_t v33 = v19;
            _os_log_impl(&dword_230A49000, v18, OS_LOG_TYPE_ERROR, "Failed to set wallpaper with error: %{public}@", v32, 0xCu);
          }
          uint64_t v20 = (void *)MEMORY[0x263F087E8];
          id v21 = DMCErrorArray();
          char v14 = objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38AF0], 28002, v21, *MEMORY[0x263F38A40], 0);
        }
        else
        {
          char v14 = 0;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_19;
      }
      uint64_t v10 = 0;
    }
    uint64_t v9 = 1;
    goto LABEL_13;
  }
  int v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_ERROR, "Could not get image from data", buf, 2u);
  }
  long long v12 = (void *)MEMORY[0x263F087E8];
  BOOL v13 = DMCErrorArray();
  char v14 = objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38AF0], 28001, v13, *MEMORY[0x263F38A40], 0);

LABEL_19:
  return v14;
}

void __34__MDMParser__performSetWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_performSetDataRoaming:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKey:@"Enabled"];
  uint64_t v4 = [v3 BOOLValue];

  int v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = v5;
    uint64_t v7 = DMCStringForBool();
    *(_DWORD *)buf = 138543362;
    dispatch_semaphore_t v15 = v7;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Setting data roaming enabled: %{public}@", buf, 0xCu);
  }
  int v8 = objc_opt_new();
  [v8 setEnabled:v4];
  uint64_t v9 = [MEMORY[0x263F39D18] systemConnection];
  id v13 = 0;
  id v10 = (id)[v9 performRequest:v8 error:&v13];
  id v11 = v13;

  return v11;
}

- (id)_performSetVoiceRoaming:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKey:@"Enabled"];
  uint64_t v4 = [v3 BOOLValue];

  int v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = v5;
    uint64_t v7 = DMCStringForBool();
    *(_DWORD *)buf = 138543362;
    dispatch_semaphore_t v15 = v7;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Setting voice roaming enabled: %{public}@", buf, 0xCu);
  }
  int v8 = objc_opt_new();
  [v8 setEnabled:v4];
  uint64_t v9 = [MEMORY[0x263F39D18] systemConnection];
  id v13 = 0;
  id v10 = (id)[v9 performRequest:v8 error:&v13];
  id v11 = v13;

  return v11;
}

- (id)_performSetBluetooth:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKeyedSubscript:@"Enabled"];
  uint64_t v4 = [v3 BOOLValue];

  int v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = v5;
    uint64_t v7 = DMCStringForBool();
    *(_DWORD *)buf = 138543362;
    dispatch_semaphore_t v15 = v7;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Setting Bluetooth enabled: %{public}@", buf, 0xCu);
  }
  int v8 = objc_opt_new();
  [v8 setEnabled:v4];
  uint64_t v9 = [MEMORY[0x263F39D18] systemConnection];
  id v13 = 0;
  id v10 = (id)[v9 performRequest:v8 error:&v13];
  id v11 = v13;

  return v11;
}

- (id)_performSetPersonalHotspot:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKey:@"Enabled"];
  uint64_t v4 = [v3 BOOLValue];

  int v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = v5;
    uint64_t v7 = DMCStringForBool();
    *(_DWORD *)buf = 138543362;
    dispatch_semaphore_t v15 = v7;
    _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Setting Personal Hotspot enabled: %{public}@", buf, 0xCu);
  }
  int v8 = objc_opt_new();
  [v8 setEnabled:v4];
  uint64_t v9 = [MEMORY[0x263F39D18] systemConnection];
  id v13 = 0;
  id v10 = (id)[v9 performRequest:v8 error:&v13];
  id v11 = v13;

  return v11;
}

- (id)_performSetUpdatePath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Writing Software Update setting to disk.", buf, 2u);
  }
  int v5 = (void *)MEMORY[0x263EFF9A0];
  __int16 v6 = MDMFilePath();
  uint64_t v7 = [v5 dictionaryWithContentsOfFile:v6];

  if (v7)
  {
    [v7 setObject:v3 forKey:@"SoftwareUpdateSettings"];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v3 forKey:@"SoftwareUpdateSettings"];
  }
  int v8 = MDMFilePath();
  char v9 = [v7 DMCWriteToBinaryFile:v8];

  if (v9)
  {
    DMCSendSettingsChangedNotification();
    id v10 = 0;
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F38B10];
    id v13 = DMCErrorArray();
    id v10 = objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12098, v13, *MEMORY[0x263F38A48], 0);
  }
  return v10;
}

- (void)_performSetDefaultBrowser:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  __int16 v6 = (void (**)(id, id))a4;
  uint64_t v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v5;
    _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "Setting default browser: %{public}@", buf, 0xCu);
  }
  id v15 = 0;
  int v8 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 fetchingPlaceholder:0 error:&v15];
  id v9 = v15;
  if (v9)
  {
    v6[2](v6, v9);
  }
  else if ([v8 isEligibleWebBrowser])
  {
    id v10 = [MEMORY[0x263F01880] defaultWorkspace];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__MDMParser__performSetDefaultBrowser_completion___block_invoke;
    v13[3] = &unk_264B9D2A8;
    char v14 = v6;
    [v10 setDefaultWebBrowserToApplicationRecord:v8 completionHandler:v13];
  }
  else
  {
    if ([v8 isWebBrowser]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"CustomSetDefaultBrowserErrorDomain" code:v11 userInfo:0];
    v6[2](v6, v12);
  }
}

uint64_t __50__MDMParser__performSetDefaultBrowser_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_malformedRequestError
{
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (BOOL)_isManagedApp:(id)a3
{
  uint64_t v4 = [a3 managementInformation];
  LOBYTE(self) = [(MDMParser *)self _isManagedAppFromManagementInformation:v4];

  return (char)self;
}

- (BOOL)_isManagedAppFromManagementInformation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 state];
    if (v5 <= 0x10) {
      unsigned int v6 = (0x1F9F5u >> v5) & 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_handleSetAppManagementInfoRequest:(id)a3 outAdditionalResponseKeys:(id *)a4 block:(id)a5
{
  v45[1] = *MEMORY[0x263EF8340];
  int v8 = (void (**)(id, void *))a5;
  uint64_t v9 = [a3 objectForKeyedSubscript:@"Identifier"];
  id v10 = (void *)v9;
  if (a4)
  {
    char v44 = @"Identifier";
    v45[0] = v9;
    *a4 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
  }
  uint64_t v11 = objc_opt_new();
  [v11 setType:2];
  [v11 setManagedAppsOnly:1];
  long long v43 = v10;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  [v11 setBundleIdentifiers:v12];

  v42[0] = @"managementInformation";
  v42[1] = @"sourceIdentifier";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  [v11 setPropertyKeys:v13];

  char v14 = [MEMORY[0x263F39D18] currentUserConnection];
  id v40 = 0;
  id v15 = [v14 performRequest:v11 error:&v40];
  id v16 = v40;
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
    goto LABEL_11;
  }
  uint64_t v19 = [v15 appsByBundleIdentifier];
  uint64_t v20 = [v19 allValues];
  id v21 = [v20 firstObject];

  if ([(MDMParser *)self _isManagedApp:v21])
  {
    id v22 = [v21 sourceIdentifier];

    if (!v22)
    {
      v8[2](v8, v10);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v33 = v21;
        uint64_t v34 = v8;
        uint64_t v28 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            id v35 = 0;
            id v31 = (id)[v14 performRequest:v30 error:&v35];
            id v32 = v35;
            if (v32)
            {
              id v18 = v32;
              goto LABEL_24;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (v27) {
            continue;
          }
          break;
        }
        id v18 = 0;
LABEL_24:
        id v21 = v33;
        int v8 = v34;
      }
      else
      {
        id v18 = 0;
      }

      goto LABEL_10;
    }
    uint64_t v23 = [(MDMParser *)self _installApplicationCouldNotModifyDDMAppsError];
  }
  else
  {
    uint64_t v23 = [(MDMParser *)self _notManagedErrorAppID:v10];
  }
  id v18 = (id)v23;
LABEL_10:

LABEL_11:
  return v18;
}

- (id)_performSetAppConfig:(id)a3 outAdditionalResponseKeys:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__MDMParser__performSetAppConfig_outAdditionalResponseKeys___block_invoke;
  v10[3] = &unk_264B9DB40;
  id v11 = v6;
  id v7 = v6;
  int v8 = [(MDMParser *)self _handleSetAppManagementInfoRequest:v7 outAdditionalResponseKeys:a4 block:v10];

  return v8;
}

id __60__MDMParser__performSetAppConfig_outAdditionalResponseKeys___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  [v4 setBundleIdentifier:v3];

  unint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Configuration"];
  [v4 setConfiguration:v5];

  v8[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)_performSetAppAttributes:(id)a3 outAdditionalResponseKeys:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"Attributes"];
  int v8 = [(MDMParser *)self _appAttributesWithRequestedAttributes:v7];

  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A80]];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = [(MDMParser *)self _malformedRequestError];
      goto LABEL_55;
    }
  }
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A50]];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A58]];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = [(MDMParser *)self _malformedRequestError];
LABEL_53:

        goto LABEL_54;
      }
    }
    uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A60]];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = [(MDMParser *)self _malformedRequestError];
LABEL_52:

        goto LABEL_53;
      }
    }
    id v13 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A68]];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = [(MDMParser *)self _malformedRequestError];
LABEL_51:

        goto LABEL_52;
      }
    }
    id v35 = v13;
    char v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A40]];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = [(MDMParser *)self _malformedRequestError];
        id v25 = v14;
LABEL_50:

        id v13 = v35;
        goto LABEL_51;
      }
      uint64_t v30 = v10;
      id v32 = a4;
      uint64_t v27 = v12;
      uint64_t v28 = v11;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v49 = 0u;
      long long v48 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v49;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v49 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v24 = [(MDMParser *)self _malformedRequestError];

              id v11 = v28;
              id v10 = v30;
              uint64_t v12 = v27;
              id v25 = v14;
              goto LABEL_50;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v11 = v28;
      id v10 = v30;
      uint64_t v12 = v27;
      a4 = v32;
    }
    uint64_t v34 = v14;
    uint64_t v20 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A48]];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v24 = [(MDMParser *)self _malformedRequestError];
      id v25 = v14;
    }
    else
    {
      id v21 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A78]];
      if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v24 = [(MDMParser *)self _malformedRequestError];
      }
      else
      {
        uint64_t v33 = a4;
        id v22 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A30]];
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          uint64_t v24 = [(MDMParser *)self _malformedRequestError];
        }
        else
        {
          id v29 = v22;
          id v31 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A38]];
          if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            uint64_t v24 = [(MDMParser *)self _malformedRequestError];
          }
          else
          {
            uint64_t v23 = [v8 objectForKeyedSubscript:*MEMORY[0x263F52A70]];
            if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              uint64_t v24 = [(MDMParser *)self _malformedRequestError];
            }
            else
            {
              v36[0] = MEMORY[0x263EF8330];
              v36[1] = 3221225472;
              v36[2] = __64__MDMParser__performSetAppAttributes_outAdditionalResponseKeys___block_invoke;
              v36[3] = &unk_264B9DB68;
              id v37 = v9;
              id v38 = v10;
              id v39 = v11;
              id v40 = v12;
              id v41 = v35;
              id v42 = v34;
              id v43 = v20;
              id v44 = v21;
              id v45 = v29;
              id v46 = v31;
              id v47 = v23;
              uint64_t v24 = [(MDMParser *)self _handleSetAppManagementInfoRequest:v6 outAdditionalResponseKeys:v33 block:v36];
            }
          }
          id v22 = v29;
        }
      }
      id v25 = v34;
    }
    goto LABEL_50;
  }
  uint64_t v24 = [(MDMParser *)self _malformedRequestError];
LABEL_54:

LABEL_55:
  return v24;
}

id __64__MDMParser__performSetAppAttributes_outAdditionalResponseKeys___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  [v4 setBundleIdentifier:v3];
  [v4 setVPNUUIDString:a1[4]];
  [v4 setCellularSliceUUIDString:a1[5]];
  [v4 setContentFilterUUIDString:a1[6]];
  [v4 setDNSProxyUUIDString:a1[7]];
  [v4 setRelayUUIDString:a1[8]];
  unint64_t v5 = objc_opt_new();
  [v5 setBundleIdentifier:v3];
  [v5 setAssociatedDomains:a1[9]];
  id v6 = objc_opt_new();
  [v6 setBundleIdentifier:v3];
  [v6 setAssociatedDomainsEnableDirectDownloads:a1[10]];
  id v7 = objc_opt_new();
  [v7 setBundleIdentifier:v3];
  [v7 setTapToPayScreenLock:a1[11]];
  int v8 = objc_opt_new();
  [v8 setBundleIdentifier:v3];
  [v8 setAllowUserToHide:a1[12]];
  uint64_t v9 = objc_opt_new();
  [v9 setBundleIdentifier:v3];
  [v9 setAllowUserToLock:a1[13]];
  id v10 = objc_opt_new();
  [v10 setBundleIdentifier:v3];

  [v10 setRemovable:a1[14]];
  id v11 = [MEMORY[0x263EFF980] arrayWithCapacity:7];
  uint64_t v12 = v11;
  if (v4) {
    [v11 addObject:v4];
  }
  if (v5) {
    [v12 addObject:v5];
  }
  if (v6) {
    [v12 addObject:v6];
  }
  if (v7) {
    [v12 addObject:v7];
  }
  if (v8) {
    [v12 addObject:v8];
  }
  if (v9) {
    [v12 addObject:v9];
  }
  if (v10) {
    [v12 addObject:v10];
  }

  return v12;
}

- (id)_performSetSharedDeviceConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Setting shared device configuration.", buf, 2u);
  }
  id v6 = [v4 objectForKey:@"QuotaSize"];
  id v7 = [v4 objectForKey:@"ResidentUsers"];
  int v8 = [v4 objectForKey:@"TemporarySessionOnly"];
  uint64_t v9 = [v4 objectForKey:@"PasscodePolicy"];
  id v10 = [v9 objectForKey:@"PasscodeLockGracePeriod"];
  id v11 = [v9 objectForKey:@"AutoLockTime"];
  if (([v8 BOOLValue] & 1) == 0)
  {
    if (v6)
    {
      uint64_t v13 = [(MDMParser *)self _performSetResidentUserQuotaSize:v4];
    }
    else
    {
      if (!v7) {
        goto LABEL_12;
      }
      uint64_t v13 = [(MDMParser *)self _performSetResidentUsers:v4];
    }
    char v14 = (void *)v13;
    if (v13) {
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  if (!v6
    || ([(MDMParser *)self _performSetResidentUserQuotaSize:v4],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    uint64_t v12 = [(MDMParser *)self _performSetTemporarySessionOnly:v4];
    if (!v12)
    {
      uint64_t v12 = [(MDMParser *)self _performSetSessionTimeout:v4];
      if (!v12)
      {
        uint64_t v12 = [(MDMParser *)self _performSetMAIDDefaultDomains:v4];
        if (!v12)
        {
          uint64_t v12 = [(MDMParser *)self _performSetOnlineAuthenticationGracePeriod:v4];
          if (!v12)
          {
            uint64_t v12 = [(MDMParser *)self _performSetSkipLanguageAndLocaleSetupForNewUsers:v4];
            if (!v12)
            {
              uint64_t v12 = [(MDMParser *)self _performSetAwaitUserConfiguration:v4];
              if (!v12)
              {
                uint64_t v16 = [MEMORY[0x263F53C00] sharedHacks];
                uint64_t v26 = [v16 quantizedGracePeriodInSeconds:v10];

                uint64_t v17 = [MEMORY[0x263F53C50] sharedConnection];
                [v17 setValue:v26 forSetting:*MEMORY[0x263F539E0]];

                uint64_t v18 = NSNumber;
                uint64_t v19 = [MEMORY[0x263F53C00] sharedHacks];
                uint64_t v20 = [v19 quantizedAutoLockInSeconds:v11];
                uint64_t v21 = [v20 integerValue];

                uint64_t v22 = [v11 integerValue];
                if (v21 <= v22) {
                  uint64_t v23 = v22;
                }
                else {
                  uint64_t v23 = v21;
                }
                uint64_t v24 = [v18 numberWithInteger:v23];

                id v25 = [MEMORY[0x263F53C50] sharedConnection];
                [v25 setValue:v24 forSetting:*MEMORY[0x263F53798]];

                char v14 = 0;
                id v11 = (void *)v24;
                id v10 = (void *)v26;
                goto LABEL_19;
              }
            }
          }
        }
      }
    }
  }
  char v14 = (void *)v12;
LABEL_19:

  return v14;
}

- (id)_performSetResidentUsers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Setting resident users for shared device.", v9, 2u);
  }
  id v6 = [v4 objectForKey:@"ResidentUsers"];

  id v7 = [(MDMParser *)self _setResidentUsersNumber:v6];

  return v7;
}

- (id)_performSetMaximumResidentUsers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Setting maximum resident users.", v9, 2u);
  }
  id v6 = [v4 objectForKey:@"MaximumResidentUsers"];

  id v7 = [(MDMParser *)self _setResidentUsersNumber:v6];

  return v7;
}

- (id)_setResidentUsersNumber:(id)a3
{
  id v3 = a3;
  if ([v3 integerValue] <= 0)
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F38B10];
    uint64_t v9 = DMCErrorArray();
    uint64_t v10 = *MEMORY[0x263F38A40];
    id v11 = v15;
    uint64_t v12 = v16;
    uint64_t v13 = 12092;
  }
  else
  {
    if (![MEMORY[0x263F38BA0] isFirstSetupBuddyDone]
      || ([(id)DMCUMUserManagerClass() sharedManager],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 allUsers],
          unint64_t v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 count],
          v5,
          v4,
          !v6))
    {
      char v14 = [MEMORY[0x263F38BA0] configureResidentUsersNumberForSharedDevice:v3 preferenceDomain:*MEMORY[0x263F52AF0]];
      goto LABEL_8;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F38B10];
    uint64_t v9 = DMCErrorArray();
    uint64_t v10 = *MEMORY[0x263F38A40];
    id v11 = v7;
    uint64_t v12 = v8;
    uint64_t v13 = 12090;
  }
  char v14 = objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, v13, v9, v10, 0);

LABEL_8:
  return v14;
}

- (id)_performSetResidentUserQuotaSize:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad resident user quota size.", buf, 2u);
  }
  if ([MEMORY[0x263F38BA0] isFirstSetupBuddyDone]
    && ([(id)DMCUMUserManagerClass() sharedManager],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 allUsers],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F38B10];
    uint64_t v10 = DMCErrorArray();
    id v11 = objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:errorType:", v9, 12090, v10, *MEMORY[0x263F38A40], 0);
  }
  else
  {
    uint64_t v10 = [v3 objectForKey:@"QuotaSize"];
    if ([v10 integerValue] > 2047)
    {
      uint64_t v15 = [v10 unsignedLongLongValue];
      uint64_t v16 = (void *)MEMORY[0x263F38BA0];
      char v14 = [NSNumber numberWithUnsignedLongLong:1000000 * v15];
      [v16 configureQuotaSizeForSharedDevice:v14 preferenceDomain:*MEMORY[0x263F52AF0]];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F38B10];
      char v14 = DMCErrorArray();
      objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12091, v14, *MEMORY[0x263F38A40], 0);
    id v11 = };
  }
  return v11;
}

- (id)_performSetSessionTimeout:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad session timeout.", buf, 2u);
  }
  unint64_t v5 = [v3 objectForKey:@"UserSessionTimeout"];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_11;
  }
  [v5 floatValue];
  double v8 = v7;
  BOOL v9 = v7 >= 30.0 || v7 <= 0.0;
  double v10 = 30.0;
  if (v9) {
    double v10 = v8;
  }
  if ((objc_msgSend(MEMORY[0x263F38BA0], "configureUserSessionTimeout:", v10, v8) & 1) == 0)
  {
    uint64_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F38B10];
    uint64_t v12 = DMCErrorArray();
    uint64_t v17 = objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 12093, v12, *MEMORY[0x263F38A50], 0);
  }
  else
  {
LABEL_11:
    id v11 = [v3 objectForKey:@"TemporarySessionTimeout"];
    uint64_t v12 = v11;
    if (!v11) {
      goto LABEL_19;
    }
    [v11 floatValue];
    double v14 = v13;
    BOOL v15 = v13 >= 30.0 || v13 <= 0.0;
    double v16 = 30.0;
    if (v15) {
      double v16 = v14;
    }
    if ((objc_msgSend(MEMORY[0x263F38BA0], "configureTemporarySessionTimeout:", v16, v14) & 1) == 0)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F38B10];
      uint64_t v22 = DMCErrorArray();
      uint64_t v17 = objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:errorType:", v21, 12093, v22, *MEMORY[0x263F38A50], 0);
    }
    else
    {
LABEL_19:
      uint64_t v17 = 0;
    }
  }

  return v17;
}

- (id)_performSetTemporarySessionOnly:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad temporary session only mode.", buf, 2u);
  }
  unint64_t v5 = [v3 objectForKey:@"TemporarySessionOnly"];
  uint64_t v6 = [v3 objectForKey:@"QuotaSize"];
  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    double v8 = [v3 objectForKeyedSubscript:@"ResidentUsers"];
    BOOL v7 = v8 == 0;
  }
  BOOL v9 = (void *)MEMORY[0x263F38BA0];
  uint64_t v10 = [v5 BOOLValue];
  if ([v9 configureTemporarySessionOnly:v10 useDynamicQuotaSize:v6 == 0 restoreQuotaSizeWhenDisabled:v7 preferenceDomain:*MEMORY[0x263F52AF0]])
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F38B10];
    double v14 = DMCErrorArray();
    id v11 = objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12094, v14, *MEMORY[0x263F38A50], 0);
  }
  return v11;
}

- (id)_performSetMAIDDefaultDomains:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad Managed Apple ID default domain.", buf, 2u);
  }
  unint64_t v5 = [v3 objectForKeyedSubscript:@"ManagedAppleIDDefaultDomains"];

  if ([MEMORY[0x263F38BA0] configureMAIDDefaultDomains:v5])
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v7 = DMCErrorArray();
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12104, v7, *MEMORY[0x263F38A50], 0);
  }
  return v6;
}

- (id)_performSetOnlineAuthenticationGracePeriod:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad online authentication grace period", buf, 2u);
  }
  unint64_t v5 = [v3 objectForKeyedSubscript:@"OnlineAuthenticationGracePeriod"];

  if ([MEMORY[0x263F38BA0] configureOnlineAuthenticationGracePeriod:v5])
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F38B10];
    BOOL v9 = DMCErrorArray();
    uint64_t v6 = objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12105, v9, *MEMORY[0x263F38A50], 0);
  }
  return v6;
}

- (id)_performSetSkipLanguageAndLocaleSetupForNewUsers:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad skip language and locale setup for new users", buf, 2u);
  }
  unint64_t v5 = [v3 objectForKeyedSubscript:@"SkipLanguageAndLocaleSetupForNewUsers"];

  if (objc_msgSend(MEMORY[0x263F38BA0], "configureShouldSkipLanguageAndLocaleSetupForNewUsers:", objc_msgSend(v5, "BOOLValue")))
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F38B10];
    BOOL v9 = DMCErrorArray();
    uint64_t v6 = objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12115, v9, *MEMORY[0x263F38A50], 0);
  }
  return v6;
}

- (id)_performSetAwaitUserConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad await user configuration", buf, 2u);
  }
  unint64_t v5 = [v3 objectForKeyedSubscript:@"AwaitUserConfiguration"];

  if ([MEMORY[0x263F38BA0] configureAwaitUserConfiguration:v5])
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F38B10];
    BOOL v9 = DMCErrorArray();
    uint64_t v6 = objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12123, v9, *MEMORY[0x263F38A50], 0);
  }
  return v6;
}

- (id)_performSetDiagnosticSubmission:(id)a3
{
  id v4 = [a3 objectForKey:@"Enabled"];
  uint64_t v5 = [v4 BOOLValue];

  uint64_t v6 = [(MDMParser *)self _setDiagnosticSubmissionEnabled:v5];
  if (!v6)
  {
    if ([(MDMParser *)self _isChlorineEligible])
    {
      uint64_t v6 = [(MDMParser *)self _setAppAnalyticsEnabled:v5];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)_setDiagnosticSubmissionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    uint64_t v6 = DMCStringForBool();
    *(_DWORD *)buf = 138543362;
    double v14 = v6;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Setting diagnostic submission allowed: %{public}@", buf, 0xCu);
  }
  BOOL v7 = objc_opt_new();
  [v7 setEnabled:v3];
  uint64_t v8 = [MEMORY[0x263F39D18] systemConnection];
  id v12 = 0;
  id v9 = (id)[v8 performRequest:v7 error:&v12];
  id v10 = v12;

  return v10;
}

- (id)_performSetAppAnalytics:(id)a3
{
  id v4 = [a3 objectForKey:@"Enabled"];
  uint64_t v5 = [v4 BOOLValue];

  if (![(MDMParser *)self _isChlorineEligible]) {
    goto LABEL_4;
  }
  uint64_t v6 = [(MDMParser *)self _setDiagnosticSubmissionEnabled:v5];
  if (v6) {
    goto LABEL_5;
  }
  if (![(MDMParser *)self _isChlorineEligible])
  {
    uint64_t v6 = 0;
  }
  else
  {
LABEL_4:
    uint64_t v6 = [(MDMParser *)self _setAppAnalyticsEnabled:v5];
  }
LABEL_5:
  return v6;
}

- (id)_setAppAnalyticsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    uint64_t v6 = DMCStringForBool();
    *(_DWORD *)buf = 138543362;
    double v14 = v6;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Setting app analytics allowed: %{public}@", buf, 0xCu);
  }
  BOOL v7 = objc_opt_new();
  [v7 setEnabled:v3];
  uint64_t v8 = [MEMORY[0x263F39D18] systemConnection];
  id v12 = 0;
  id v9 = (id)[v8 performRequest:v7 error:&v12];
  id v10 = v12;

  return v10;
}

- (id)_performSetGracePeriod:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [a3 objectForKey:@"PasscodeLockGracePeriod"];
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    *(_DWORD *)buf = 67109120;
    int v13 = [v3 intValue];
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Setting grace period: %d seconds", buf, 8u);
  }
  uint64_t v6 = objc_opt_new();
  objc_msgSend(v6, "setSeconds:", (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue"));
  BOOL v7 = [MEMORY[0x263F39D18] systemConnection];
  id v11 = 0;
  id v8 = (id)[v7 performRequest:v6 error:&v11];
  id v9 = v11;

  return v9;
}

- (id)_performSetOrganizationInfo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"OrganizationInfo"];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    if (_performSetOrganizationInfo__onceToken != -1) {
      dispatch_once(&_performSetOrganizationInfo__onceToken, &__block_literal_global_1164);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = (id)_performSetOrganizationInfo__validKeys;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          int v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v21);
          uint64_t v14 = v13;
          if (v13 && [v13 length]) {
            [v6 setObject:v14 forKeyedSubscript:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [v6 count];
    double v16 = [(MDMParser *)self server];
    uint64_t v17 = v16;
    if (v15) {
      uint64_t v18 = v6;
    }
    else {
      uint64_t v18 = 0;
    }
    objc_msgSend(v16, "setOrganizationInfo:", v18, (void)v21);
  }
  else
  {
    uint64_t v19 = [(MDMParser *)self server];
    [v19 setOrganizationInfo:0];
  }
  return 0;
}

void __41__MDMParser__performSetOrganizationInfo___block_invoke()
{
  v5[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F389A0];
  v5[0] = *MEMORY[0x263F38990];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263F38998];
  v5[2] = *MEMORY[0x263F38978];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x263F38988];
  v5[4] = *MEMORY[0x263F38980];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:6];
  id v4 = (void *)_performSetOrganizationInfo__validKeys;
  _performSetOrganizationInfo__validKeys = v3;
}

- (id)_performSetDefaultApplications:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count") - 1);
  if (_performSetDefaultApplications__onceToken != -1) {
    dispatch_once(&_performSetDefaultApplications__onceToken, &__block_literal_global_1166);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = (id)_performSetDefaultApplications__validKeys;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v11 = [v4 objectForKeyedSubscript:v10];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v11 length]) {
              [v5 setObject:v11 forKeyedSubscript:v10];
            }
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [v5 objectForKeyedSubscript:@"WebBrowser"];

  if (!v12) {
    goto LABEL_21;
  }
  int v13 = [v5 objectForKeyedSubscript:@"WebBrowser"];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__5;
  id v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  uint64_t v14 = objc_opt_new();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __44__MDMParser__performSetDefaultApplications___block_invoke_2;
  v23[3] = &unk_264B9DB90;
  id v15 = v13;
  id v24 = v15;
  uint64_t v26 = &v27;
  id v16 = v14;
  id v25 = v16;
  [(MDMParser *)self _performSetDefaultBrowser:v15 completion:v23];
  [v16 waitForCompletion];
  uint64_t v17 = (void *)v28[5];
  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    uint64_t v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v22 = 0;
      _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_INFO, "Successfully set the default browser. Disallowing preference prompting.", v22, 2u);
    }
    uint64_t v20 = [MEMORY[0x263F53C50] sharedConnection];
    [v20 setBoolValue:0 forSetting:@"allowDefaultBrowserPrompting"];
  }
  _Block_object_dispose(&v27, 8);

  if (!v17) {
LABEL_21:
  }
    uint64_t v17 = 0;

  return v17;
}

void __44__MDMParser__performSetDefaultApplications___block_invoke()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"WebBrowser";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)_performSetDefaultApplications__validKeys;
  _performSetDefaultApplications__validKeys = v0;
}

void __44__MDMParser__performSetDefaultApplications___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_ERROR, "Failed to set default browser to %{public}@ with error code %{public}@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  [*(id *)(a1 + 40) complete];
}

- (id)_performSetMDMOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"MDMOptions"];
  uint64_t v5 = [MEMORY[0x263F52850] validatedMDMOptionsFromOptionsDictionary:v4];
  uint64_t v6 = [(MDMParser *)self server];
  [v6 setMDMOptions:v5];

  return 0;
}

- (id)_performSetTimezone:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKeyedSubscript:@"TimeZone"];
  [v3 UTF8String];
  unsigned int v4 = tzlink();
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v3;
      __int16 v19 = 1024;
      unsigned int v20 = v5;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "Failed to set timezone to %{public}@ with error code %d", buf, 0x12u);
    }
    BOOL v7 = v5 > 0x2D || ((1 << v5) & 0x200000000022) == 0;
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F38AF0];
    if (v7)
    {
      id v10 = DMCErrorArray();
      uint64_t v11 = *MEMORY[0x263F38A40];
      uint64_t v12 = v8;
      uint64_t v13 = v9;
      uint64_t v14 = 28004;
    }
    else
    {
      id v10 = DMCErrorArray();
      uint64_t v11 = *MEMORY[0x263F38A40];
      uint64_t v12 = v8;
      uint64_t v13 = v9;
      uint64_t v14 = 28005;
    }
    id v15 = objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, v14, v10, v11, 0);
  }
  else
  {
    TMSetAutomaticTimeZoneEnabled();
    id v15 = 0;
  }

  return v15;
}

- (id)_performSetAccessibilitySettings:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v4 = [(id)objc_opt_class() _allAccessibilitySettingsKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 138543362;
    long long v14 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, v14);
        if (v11)
        {
          uint64_t v12 = +[MDMAccessibilityManager sharedInstance];
          if ([v10 isEqualToString:@"ZoomEnabled"])
          {
            objc_msgSend(v12, "setZoomEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"BoldTextEnabled"])
          {
            objc_msgSend(v12, "setBoldTextEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"VoiceOverEnabled"])
          {
            objc_msgSend(v12, "setVoiceOverEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"ReduceMotionEnabled"])
          {
            objc_msgSend(v12, "setReduceMotionEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"IncreaseContrastEnabled"])
          {
            objc_msgSend(v12, "setIncreaseContrastEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"TouchAccommodationsEnabled"])
          {
            objc_msgSend(v12, "setTouchAccommodationsEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"ReduceTransparencyEnabled"])
          {
            objc_msgSend(v12, "setReduceTransparencyEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"GrayscaleEnabled"])
          {
            objc_msgSend(v12, "setGrayscaleEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if ([v10 isEqualToString:@"TextSize"])
          {
            objc_msgSend(v12, "setTextSize:", objc_msgSend(v11, "integerValue"));
          }
          else
          {
            log = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v14;
              uint64_t v21 = v10;
              _os_log_impl(&dword_230A49000, log, OS_LOG_TYPE_ERROR, "Ignoring unsupported accessibility key: %{public}@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  return 0;
}

+ (id)_numericAccessibilitySettingsKeys
{
  if (_numericAccessibilitySettingsKeys_onceToken != -1) {
    dispatch_once(&_numericAccessibilitySettingsKeys_onceToken, &__block_literal_global_1176);
  }
  uint64_t v2 = (void *)_numericAccessibilitySettingsKeys_numericKeys;
  return v2;
}

void __46__MDMParser__numericAccessibilitySettingsKeys__block_invoke()
{
  v2[9] = *MEMORY[0x263EF8340];
  v2[0] = @"ZoomEnabled";
  v2[1] = @"BoldTextEnabled";
  void v2[2] = @"VoiceOverEnabled";
  v2[3] = @"ReduceMotionEnabled";
  v2[4] = @"IncreaseContrastEnabled";
  v2[5] = @"TouchAccommodationsEnabled";
  v2[6] = @"ReduceTransparencyEnabled";
  v2[7] = @"GrayscaleEnabled";
  v2[8] = @"TextSize";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:9];
  uint64_t v1 = (void *)_numericAccessibilitySettingsKeys_numericKeys;
  _numericAccessibilitySettingsKeys_numericKeys = v0;
}

- (id)_performSetting:(id)a3 outAdditionalResponseKeys:(id *)a4 outRestartAppleTVApp:(BOOL *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 objectForKey:@"Item"];
  if ([v8 isEqualToString:@"DeviceName"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetDeviceName:v7];
LABEL_39:
    id v10 = (void *)v9;
    goto LABEL_40;
  }
  if ([v8 isEqualToString:@"Wallpaper"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetWallpaper:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"DataRoaming"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetDataRoaming:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"VoiceRoaming"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetVoiceRoaming:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"Bluetooth"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetBluetooth:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"PersonalHotspot"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetPersonalHotspot:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"ApplicationConfiguration"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetAppConfig:v7 outAdditionalResponseKeys:a4];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"ApplicationAttributes"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetAppAttributes:v7 outAdditionalResponseKeys:a4];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"MaximumResidentUsers"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetMaximumResidentUsers:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"SoftwareUpdateSettings"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetUpdatePath:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"SharedDeviceConfiguration"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetSharedDeviceConfiguration:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"DiagnosticSubmission"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetDiagnosticSubmission:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"AppAnalytics"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetAppAnalytics:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"PasscodeLockGracePeriod"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetGracePeriod:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"OrganizationInfo"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetOrganizationInfo:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"DefaultApplications"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetDefaultApplications:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"MDMOptions"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetMDMOptions:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"TimeZone"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetTimezone:v7];
    goto LABEL_39;
  }
  if ([v8 isEqualToString:@"AccessibilitySettings"])
  {
    uint64_t v9 = [(MDMParser *)self _performSetAccessibilitySettings:v7];
    goto LABEL_39;
  }
  uint64_t v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = *MEMORY[0x263F38AF0];
  long long v14 = DMCErrorArray();
  id v10 = objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 28000, v14, *MEMORY[0x263F38A40], v8, 0);

LABEL_40:
  return v10;
}

- (id)_settings:(id)a3 accessRights:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 objectForKey:@"Settings"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v5;
    id v7 = v5;
    uint64_t v8 = (void *)v6;
    id obj = v7;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      uint64_t v27 = self;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v23 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];

            goto LABEL_29;
          }
          long long v14 = [v13 objectForKey:@"Item"];
          if (v14)
          {
            id v15 = v8;
            id v31 = 0;
            BOOL v16 = [(MDMParser *)self _validateSetting:v13 accessRights:a4 outError:&v31];
            id v17 = v31;
            if (v16)
            {
              buf[0] = 0;
              id v30 = 0;
              long long v18 = [(MDMParser *)self _performSetting:v13 outAdditionalResponseKeys:&v30 outRestartAppleTVApp:buf];
              id v19 = v30;

              if (v18) {
                +[MDMAbstractTunnelParser responseWithError:v18];
              }
              else {
              uint64_t v21 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
              }
            }
            else
            {
              if (v17)
              {
                uint64_t v21 = +[MDMAbstractTunnelParser responseWithError:v17];
              }
              else
              {
                uint64_t v21 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
              }
              id v19 = 0;
            }
            uint64_t v8 = v15;
            objc_msgSend(v21, "setObject:forKey:", v14, @"Item", v25);
            if (v19) {
              [v21 addEntriesFromDictionary:v19];
            }
            [v15 addObject:v21];

            self = v27;
          }
          else
          {
            unsigned int v20 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_230A49000, v20, OS_LOG_TYPE_ERROR, "Ignoring setting command missing the Item key", buf, 2u);
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    long long v22 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    uint64_t v23 = (void *)[v22 mutableCopy];

    [v23 setObject:v8 forKey:@"Settings"];
LABEL_29:

    uint64_t v5 = v25;
  }
  else
  {
    uint64_t v23 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
  }

  return v23;
}

- (id)_appStoreDisabledError
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  unsigned int v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12031, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_stringForBookState:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return @"Unknown";
  }
  else {
    return off_264B9DE78[a3 - 1];
  }
}

+ (id)_stringForAppState:(unint64_t)a3
{
  if (a3 > 0x12) {
    return @"Unknown";
  }
  else {
    return off_264B9DEC0[a3];
  }
}

- (id)_appAlreadyInstalledErrorWithBundleID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12025, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (id)_appAlreadyInstalledErrorWithiTunesStoreID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = [a3 stringValue];
  uint64_t v6 = DMCErrorArray();
  id v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12025, v6, *MEMORY[0x263F38A40], v5, 0);

  return v7;
}

- (id)_appAlreadyQueuedErrorWithBundleID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12026, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (id)_appAlreadyQueuedErrorWithiTunesStoreID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = [a3 stringValue];
  uint64_t v6 = DMCErrorArray();
  id v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12026, v6, *MEMORY[0x263F38A40], v5, 0);

  return v7;
}

- (id)_licenseNotFoundErrorWithBundleID:(id)a3 underlyingError:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F38B10];
  id v7 = a4;
  id v11 = a3;
  uint64_t v8 = DMCErrorArray();
  uint64_t v9 = objc_msgSend(v5, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v6, 12064, v8, v7, *MEMORY[0x263F38A40], v11, 0);

  return v9;
}

- (id)_licenseNotFoundErrorWithiTunesStoreID:(id)a3 underlyingError:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F38B10];
  id v7 = a4;
  uint64_t v8 = [a3 stringValue];
  uint64_t v9 = DMCErrorArray();
  uint64_t v10 = objc_msgSend(v5, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v6, 12064, v9, v7, *MEMORY[0x263F38A40], v8, 0);

  return v10;
}

- (id)_cannotValidateAppIDErrorUnderlyingError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  id v5 = a3;
  uint64_t v6 = DMCErrorArray();
  id v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12023, v6, v5, *MEMORY[0x263F38A40], 0);

  return v7;
}

- (id)_invalidManifestErrorWithURL:(id)a3 underlyingError:(id)a4
{
  id v5 = (void *)MEMORY[0x263F08BA0];
  id v6 = a4;
  id v7 = [v5 componentsWithURL:a3 resolvingAgainstBaseURL:0];
  [v7 setQuery:0];
  uint64_t v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F38B10];
  uint64_t v10 = [v7 URL];
  id v11 = DMCErrorArray();
  uint64_t v12 = objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v9, 12024, v11, v6, *MEMORY[0x263F38A40], v10, 0);

  return v12;
}

- (void)_installApplication:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  id v11 = [(MDMParser *)self server];
  int v12 = [v11 isAppInstallBlocked];

  if (v12)
  {
    uint64_t v13 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v13, OS_LOG_TYPE_DEFAULT, "Application installs are blocked, returning NotNow for InstallApplication.", buf, 2u);
    }
    long long v14 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
    [(MDMParser *)self _sendAnalyticsMDMCommandEventWithRequest:v8 response:v14];
    if (v10) {
      v10[2](v10, v14);
    }
    goto LABEL_41;
  }
  uint64_t v15 = [v8 objectForKeyedSubscript:@"ManifestURL"];
  long long v14 = (void *)v15;
  if (!v15
    || ([NSURL URLWithString:v15], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v60 = v9;
    uint64_t v61 = (void *)v15;
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke;
    v84[3] = &unk_264B9DBB8;
    v84[4] = self;
    id v16 = v8;
    id v85 = v16;
    id v17 = v10;
    v86 = v17;
    uint64_t v59 = MEMORY[0x230FC63F0](v84);
    uint64_t v18 = [v16 objectForKeyedSubscript:@"Identifier"];
    id v19 = [v16 objectForKeyedSubscript:@"iTunesStoreID"];
    long long v65 = [v16 objectForKeyedSubscript:@"Options"];
    unsigned int v20 = [v16 objectForKeyedSubscript:@"Attributes"];
    long long v63 = [v16 objectForKeyedSubscript:@"Configuration"];
    id v66 = [v16 objectForKeyedSubscript:@"ManagementFlags"];
    long long v64 = [v16 objectForKeyedSubscript:@"ChangeManagementState"];
    uint64_t v21 = [MEMORY[0x263F52810] sharedConfiguration];
    long long v62 = [v21 personaID];

    int v22 = v19 != 0;
    if (v19) {
      int v23 = 2;
    }
    else {
      int v23 = 1;
    }
    if (v14) {
      int v22 = v23;
    }
    uint64_t v67 = (void *)v18;
    if (v18) {
      ++v22;
    }
    if (v22 != 1
      || v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v66 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v65 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v64 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v31 = (void *)v59;
      (*(void (**)(uint64_t, void))(v59 + 16))(v59, 0);
LABEL_36:
      long long v32 = v61;
      id v25 = v65;
LABEL_37:

      id v9 = v60;
      goto LABEL_41;
    }
    uint64_t v24 = [(MDMParser *)self _appManagementFlagsWithRequestedFlags:v66];

    id v57 = [(MDMParser *)self _appAttributesWithRequestedAttributes:v20];

    id v25 = v65;
    if (v65)
    {
      uint64_t v26 = [v65 objectForKeyedSubscript:@"NotManaged"];
      uint64_t v27 = [v65 objectForKeyedSubscript:@"PurchaseMethod"];
      if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v29 = v26;
        id v30 = (void *)v24;
        id v31 = (void *)v59;
        (*(void (**)(uint64_t, void))(v59 + 16))(v59, 0);
        goto LABEL_44;
      }
      unsigned int v28 = [v27 intValue];
      if (v28 >= 2)
      {
        uint64_t v29 = v26;
        id v30 = (void *)v24;
        id v31 = (void *)v59;
        (*(void (**)(uint64_t, __CFString *))(v59 + 16))(v59, @"PurchaseMethodNotSupported");
LABEL_44:

        id v66 = v30;
        unsigned int v20 = v57;
        goto LABEL_36;
      }
      id v66 = (id)v24;
      unsigned int v39 = v28;

      unsigned int v38 = v39;
      id v25 = v65;
    }
    else
    {
      id v66 = (id)v24;
      unsigned int v38 = 0;
    }
    if (!v14 && !v38 && [MEMORY[0x263F38BA0] isSharediPad])
    {
      id v31 = (void *)v59;
      (*(void (**)(uint64_t, __CFString *))(v59 + 16))(v59, @"PurchaseMethodNotSupportedInMultiUser");
LABEL_54:
      unsigned int v20 = v57;
      long long v32 = v61;
      goto LABEL_37;
    }
    unsigned int v55 = v38;
    if (v64)
    {
      if (([v64 isEqualToString:@"Managed"] & 1) == 0
        || ([MEMORY[0x263F52810] sharedConfiguration],
            id v40 = objc_claimAutoreleasedReturnValue(),
            int v41 = [v40 isUserEnrollment],
            v40,
            id v25 = v65,
            v41))
      {
        id v31 = (void *)v59;
        (*(void (**)(uint64_t, __CFString *))(v59 + 16))(v59, @"ManagementChangeNotSupported");
        goto LABEL_54;
      }
    }
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_2;
    v72[3] = &unk_264B9DBE0;
    v72[4] = self;
    id v54 = v16;
    id v73 = v54;
    id v42 = v17;
    int v82 = v42;
    long long v32 = v61;
    id v43 = v61;
    id v74 = v43;
    id v75 = v19;
    id v76 = v67;
    id v66 = v66;
    id v77 = v66;
    id v58 = v57;
    id v78 = v58;
    id v79 = v63;
    id v80 = v64;
    unsigned int v83 = v55;
    id v81 = v62;
    uint64_t v44 = MEMORY[0x230FC63F0](v72);
    id v45 = (void (**)(void))v44;
    if (v43)
    {
      (*(void (**)(uint64_t))(v44 + 16))(v44);
    }
    else
    {
      id v46 = [MEMORY[0x263F52810] sharedConfiguration];
      BOOL v47 = -[MDMParser _isPurchaseMethodAllowed:onUserEnrollment:](self, "_isPurchaseMethodAllowed:onUserEnrollment:", v55, [v46 isUserEnrollment]);

      if (!v47)
      {
        if ([MEMORY[0x263F38B98] isAppleTV]) {
          long long v48 = @"NotSupportedOnAppleTV";
        }
        else {
          long long v48 = @"PurchaseMethodNotSupported";
        }
        id v31 = (void *)v59;
        (*(void (**)(uint64_t, __CFString *))(v59 + 16))(v59, v48);
        long long v32 = v61;
        goto LABEL_58;
      }
      if (v55 == 1)
      {
        v45[2](v45);
        long long v32 = v61;
      }
      else
      {
        uint64_t v56 = DMCLocalizedString();
        long long v49 = [(MDMParser *)self server];
        long long v50 = [v49 organizationName];

        if (v50)
        {
          long long v52 = v50;
          uint64_t v53 = DMCLocalizedFormat();
        }
        else
        {
          long long v51 = [(MDMParser *)self server];
          long long v52 = [v51 serverName];
          uint64_t v53 = DMCLocalizedFormat();
        }
        long long v32 = v61;
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_4;
        v68[3] = &unk_264B9DC08;
        uint64_t v70 = v45;
        v68[4] = self;
        id v69 = v54;
        uint64_t v71 = v42;
        +[MDMManagedAssetManager promptUserToLoginToiTunesIfNeededTitle:message:assertion:completionBlock:](MDMManagedAssetManager, "promptUserToLoginToiTunesIfNeededTitle:message:assertion:completionBlock:", v56, v53, v60, v68, v52);
      }
    }
    id v31 = (void *)v59;
LABEL_58:
    id v25 = v65;

    unsigned int v20 = v58;
    goto LABEL_37;
  }
  long long v33 = (void *)MEMORY[0x263F087E8];
  uint64_t v34 = *MEMORY[0x263F38B10];
  long long v35 = DMCErrorArray();
  long long v36 = objc_msgSend(v33, "DMCErrorWithDomain:code:descriptionArray:errorType:", v34, 12030, v35, *MEMORY[0x263F38A40], 0);

  uint64_t v37 = +[MDMAbstractTunnelParser responseWithError:v36];
  [(MDMParser *)self _sendAnalyticsMDMCommandEventWithRequest:v8 response:v37];
  if (v10) {
    v10[2](v10, v37);
  }

LABEL_41:
}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MDMParser malformedRequestErrorResult];
  id v6 = (id)[v4 mutableCopy];

  [v6 setObject:v3 forKeyedSubscript:@"RejectionReason"];
  [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v6];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_3;
  v5[3] = &unk_264B9DA80;
  uint64_t v2 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = *(id *)(a1 + 112);
  id v3 = (void *)MEMORY[0x230FC63F0](v5);
  LODWORD(v4) = *(_DWORD *)(a1 + 120);
  [*(id *)(a1 + 32) _performInstallApplicationRequestWithManifestURL:*(void *)(a1 + 48) iTunesStoreIDObj:*(void *)(a1 + 56) bundleId:*(void *)(a1 + 64) flagsObj:*(void *)(a1 + 72) attributes:*(void *)(a1 + 80) configuration:*(void *)(a1 + 88) manageChangeStr:*(void *)(a1 + 96) purchaseMethodValue:v4 personaID:*(void *)(a1 + 104) completionBlock:v3];
}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F38B10];
    id v6 = DMCErrorArray();
    objc_msgSend(v4, "DMCErrorWithDomain:code:descriptionArray:errorType:", v5, 12040, v6, *MEMORY[0x263F38A40], 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v7 = +[MDMAbstractTunnelParser responseWithError:v9];
    [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v7];
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
    }
  }
}

- (void)_performInstallApplicationRequestWithManifestURL:(id)a3 iTunesStoreIDObj:(id)a4 bundleId:(id)a5 flagsObj:(id)a6 attributes:(id)a7 configuration:(id)a8 manageChangeStr:(id)a9 purchaseMethodValue:(int)a10 personaID:(id)a11 completionBlock:(id)a12
{
  v55[1] = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v17 = a4;
  id v33 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  uint64_t v24 = [MEMORY[0x263F39D18] currentUserConnection];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  void v42[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke;
  v42[3] = &unk_264B9DCD0;
  id v43 = v34;
  id v44 = v17;
  id v52 = v21;
  id v53 = v23;
  id v45 = v33;
  id v46 = v24;
  BOOL v47 = self;
  id v48 = v18;
  id v49 = v19;
  id v50 = v22;
  int v54 = a10;
  id v51 = v20;
  id v41 = v21;
  id v40 = v20;
  id v39 = v22;
  id v38 = v19;
  id v37 = v18;
  id v25 = v24;
  id v36 = v23;
  id v26 = v33;
  id v27 = v17;
  id v28 = v34;
  uint64_t v29 = +[MDMBlockOperation blockOperationWithBlock:v42];
  v55[0] = v29;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:1];
  id v31 = [v25 batchOperationToPerformOperations:v30];

  [v31 setName:@"InstallApplication"];
  long long v32 = [(MDMParser *)self operationQueue];
  [v32 addOperation:v31];
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  v30[6] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 setType:3];
  [v4 setManifestURL:*(void *)(a1 + 32)];
  [v4 setStoreItemIdentifier:*(void *)(a1 + 40)];
  v30[0] = @"bundleIdentifier";
  v30[1] = @"type";
  v30[2] = @"installationState";
  v30[3] = @"isAppClip";
  v30[4] = @"managementInformation";
  void v30[5] = @"sourceIdentifier";
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:6];
  [v4 setPropertyKeys:v5];

  if (*(void *)(a1 + 48))
  {
    uint64_t v29 = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    [v4 setBundleIdentifiers:v6];
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_2;
  v26[3] = &unk_264B9DA58;
  id v7 = *(id *)(a1 + 112);
  id v27 = v3;
  id v28 = v7;
  id v8 = v3;
  id v9 = (void *)MEMORY[0x230FC63F0](v26);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_3;
  v14[3] = &unk_264B9DCA8;
  id v11 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  int v12 = *(void **)(a1 + 72);
  id v24 = v9;
  v14[4] = v10;
  id v15 = v12;
  id v16 = *(id *)(a1 + 80);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 88);
  id v21 = *(id *)(a1 + 96);
  int v25 = *(_DWORD *)(a1 + 120);
  id v22 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 104);
  id v13 = v9;
  [v11 performRequest:v4 completion:v14];
}

uint64_t __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 endBlockOperation];
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!a3)
  {
    v138[0] = MEMORY[0x263EF8330];
    v138[1] = 3221225472;
    v138[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_4;
    v138[3] = &unk_264B9DC30;
    id v139 = *(id *)(a1 + 112);
    id v8 = (void *)MEMORY[0x230FC63F0](v138);
    id v9 = [v5 appsByBundleIdentifier];
    uint64_t v10 = [v9 allValues];
    id v11 = [v10 firstObject];
    int v12 = [v11 sourceIdentifier];

    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 112);
      long long v14 = [*(id *)(a1 + 32) _installApplicationCouldNotModifyDDMAppsError];
      id v15 = +[MDMAbstractTunnelParser responseWithError:v14];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v15);
LABEL_68:

      goto LABEL_69;
    }
    id v16 = [MEMORY[0x263F52810] sharedConfiguration];
    uint64_t v17 = [v16 personaID];

    char v18 = [*(id *)(a1 + 40) intValue];
    BOOL v19 = (v18 & 1 | (unint64_t)v17) != 0;
    long long v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A80]];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v42 = *(void *)(a1 + 112);
        id v15 = [*(id *)(a1 + 32) _malformedRequestError];
        id v20 = +[MDMAbstractTunnelParser responseWithError:v15];
        (*(void (**)(uint64_t, void *))(v42 + 16))(v42, v20);
LABEL_67:

        goto LABEL_68;
      }
    }
    id v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A50]];
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v43 = *(void *)(a1 + 112);
        id v20 = [*(id *)(a1 + 32) _malformedRequestError];
        id v21 = +[MDMAbstractTunnelParser responseWithError:v20];
        (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v21);
LABEL_66:

        goto LABEL_67;
      }
    }
    id v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A58]];
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v44 = *(void *)(a1 + 112);
        id v21 = [*(id *)(a1 + 32) _malformedRequestError];
        id v22 = +[MDMAbstractTunnelParser responseWithError:v21];
        (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v22);
LABEL_65:

        goto LABEL_66;
      }
    }
    id v21 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A60]];
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v45 = *(void *)(a1 + 112);
      id v22 = [*(id *)(a1 + 32) _malformedRequestError];
      uint64_t v46 = +[MDMAbstractTunnelParser responseWithError:v22];
      BOOL v47 = *(void (**)(uint64_t, uint64_t))(v45 + 16);
      uint64_t v48 = v45;
      id v23 = (void *)v46;
      v47(v48, v46);
    }
    else
    {
      BOOL v110 = v19;
      id v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A68]];
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v120 = v21;
        uint64_t v49 = *(void *)(a1 + 112);
        id v23 = [*(id *)(a1 + 32) _malformedRequestError];
        id v50 = +[MDMAbstractTunnelParser responseWithError:v23];
        id v51 = *(void (**)(uint64_t, void *))(v49 + 16);
        uint64_t v52 = v49;
        id v21 = v120;
        v51(v52, v50);
      }
      else
      {
        char v104 = v18;
        id v23 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A40]];
        if (!v23) {
          goto LABEL_26;
        }
        uint64_t v108 = v20;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v113 = v22;
          uint64_t v118 = v21;
          v102 = v8;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          v99 = v23;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v134 objects:v140 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v135;
            while (2)
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v135 != v27) {
                  objc_enumerationMutation(v24);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v59 = *(void *)(a1 + 112);
                  id v60 = [*(id *)(a1 + 32) _malformedRequestError];
                  uint64_t v61 = +[MDMAbstractTunnelParser responseWithError:v60];
                  (*(void (**)(uint64_t, void *))(v59 + 16))(v59, v61);

                  id v23 = v24;
                  id v8 = v102;
                  id v20 = v108;
                  id v22 = v113;
                  id v21 = v118;
                  goto LABEL_64;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v134 objects:v140 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }

          id v8 = v102;
          id v20 = v108;
          id v21 = v118;
          id v23 = v99;
LABEL_26:
          uint64_t v29 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A48]];
          if (v29)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v115 = v22;
              uint64_t v62 = *(void *)(a1 + 112);
              uint64_t v103 = [*(id *)(a1 + 32) _malformedRequestError];
              long long v63 = +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
              long long v64 = *(void (**)(uint64_t, void *))(v62 + 16);
              uint64_t v65 = v62;
              id v22 = v115;
              v64(v65, v63);
LABEL_63:

              goto LABEL_64;
            }
          }
          uint64_t v101 = v29;
          uint64_t v103 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A78]];
          if (v103 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v116 = v22;
            uint64_t v66 = *(void *)(a1 + 112);
            long long v63 = [*(id *)(a1 + 32) _malformedRequestError];
            id v31 = +[MDMAbstractTunnelParser responseWithError:v63];
            uint64_t v67 = *(void (**)(uint64_t, void *))(v66 + 16);
            uint64_t v68 = v66;
            id v22 = v116;
            v67(v68, v31);
          }
          else
          {
            uint64_t v30 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A30]];
            v119 = v21;
            if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v96 = (void *)v30;
              id v31 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A38]];
              if (v31)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v106 = v31;
                  id v73 = v22;
                  uint64_t v74 = *(void *)(a1 + 112);
                  v97 = [*(id *)(a1 + 32) _malformedRequestError];
                  uint64_t v75 = +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
                  id v76 = *(void (**)(uint64_t))(v74 + 16);
                  uint64_t v77 = v74;
                  id v22 = v73;
                  id v31 = v106;
                  uint64_t v112 = (void *)v75;
                  v76(v77);
                  long long v63 = v96;

LABEL_61:
                  goto LABEL_62;
                }
              }
              uint64_t v100 = v23;
              v114 = v22;
              v97 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F52A70]];
              if (v97)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v78 = *(void *)(a1 + 112);
                  uint64_t v111 = [*(id *)(a1 + 32) _malformedRequestError];
                  uint64_t v95 = +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
                  (*(void (**)(uint64_t))(v78 + 16))(v78);
                  id v22 = v114;
                  goto LABEL_59;
                }
              }
              uint64_t v111 = objc_msgSend(*(id *)(a1 + 32), "_originator", v104 & 0xE | (unint64_t)v110);
              long long v32 = [v5 appsByBundleIdentifier];
              id v33 = [v32 allValues];
              id v34 = [v33 firstObject];

              long long v35 = v34;
              uint64_t v36 = [v34 type];
              v109 = v20;
              uint64_t v95 = v35;
              if ((unint64_t)[v35 installationState] < 4
                || [v35 isAppClip])
              {
                id v37 = objc_opt_new();
                [v37 setBundleIdentifier:*(void *)(a1 + 56)];
                [v37 setStoreItemIdentifier:*(void *)(a1 + 64)];
                [v37 setManifestURL:*(void *)(a1 + 72)];
                [v37 setOriginator:v111];
                [v37 setPersonaIdentifier:*(void *)(a1 + 80)];
                id v38 = [MEMORY[0x263F38B70] mdmAppInstallationSourceIdentifierWithDefaultValue:0];
                [v37 setSourceIdentifier:v38];

                BOOL v39 = v36 == 1;
                id v21 = v119;
                id v23 = v100;
                if (!v39)
                {
                  [v37 setManage:1];
                  [v37 setManagementOptions:v94];
                  [v37 setVPNUUIDString:v14];
                  [v37 setCellularSliceUUIDString:v15];
                  [v37 setContentFilterUUIDString:v109];
                  [v37 setDNSProxyUUIDString:v119];
                  [v37 setRelayUUIDString:v114];
                  [v37 setAssociatedDomains:v100];
                  [v37 setAssociatedDomainsEnableDirectDownloads:v101];
                  [v37 setTapToPayScreenLock:v103];
                  [v37 setAllowUserToHide:v96];
                  [v37 setAllowUserToLock:v31];
                  [v37 setRemovable:v97];
                  [v37 setConfiguration:*(void *)(a1 + 88)];
                }
                if ([MEMORY[0x263F38BA0] isSharediPad])
                {
                  id v40 = v37;
                  uint64_t v41 = 1;
                }
                else
                {
                  if (!*(_DWORD *)(a1 + 120))
                  {
                    [v37 setLicenseType:2];
                    [v37 setAllowFreePurchases:1];
                    goto LABEL_57;
                  }
                  id v40 = v37;
                  uint64_t v41 = 3;
                }
                [v40 setLicenseType:v41];
LABEL_57:
                id v79 = *(void **)(a1 + 96);
                v127[0] = MEMORY[0x263EF8330];
                v127[1] = 3221225472;
                v127[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_5;
                v127[3] = &unk_264B9DC58;
                id v132 = v8;
                id v128 = *(id *)(a1 + 56);
                id v80 = *(id *)(a1 + 64);
                uint64_t v81 = *(void *)(a1 + 32);
                id v129 = v80;
                uint64_t v130 = v81;
                id v131 = *(id *)(a1 + 72);
                id v133 = *(id *)(a1 + 112);
                [v79 performRequest:v37 completion:v127];

                id v22 = v114;
LABEL_58:

                id v20 = v109;
LABEL_59:
                long long v63 = v96;

                goto LABEL_61;
              }
              if ([*(id *)(a1 + 32) _isManagedApp:v35])
              {
                CFArrayRef v107 = v31;
                int v82 = v20;
                id v37 = objc_opt_new();
                [v37 setBundleIdentifier:*(void *)(a1 + 56)];
                [v37 setStoreItemIdentifier:*(void *)(a1 + 64)];
                [v37 setManifestURL:*(void *)(a1 + 72)];
                [v37 setOriginator:v111];
                [v37 setPersonaIdentifier:*(void *)(a1 + 80)];
                [v37 setManagementOptions:v94];
                [v37 setVPNUUIDString:v14];
                [v37 setCellularSliceUUIDString:v15];
                id v21 = v119;
                [v37 setContentFilterUUIDString:v82];
                [v37 setDNSProxyUUIDString:v119];
                [v37 setRelayUUIDString:v114];
                id v23 = v100;
                [v37 setAssociatedDomains:v100];
                [v37 setAssociatedDomainsEnableDirectDownloads:v101];
                [v37 setTapToPayScreenLock:v103];
                [v37 setAllowUserToHide:v96];
                [v37 setAllowUserToLock:v107];
                [v37 setRemovable:v97];
                [v37 setConfiguration:*(void *)(a1 + 88)];
                unsigned int v83 = *(void **)(a1 + 96);
                v124[0] = MEMORY[0x263EF8330];
                v124[1] = 3221225472;
                v124[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_6;
                v124[3] = &unk_264B9DC80;
                id v125 = v8;
                id v126 = *(id *)(a1 + 112);
                char v84 = v83;
                id v22 = v114;
                id v31 = v107;
                [v84 performRequest:v37 completion:v124];

                id v85 = v125;
LABEL_72:

                goto LABEL_58;
              }
              if (v36 == 1 || !*(void *)(a1 + 104))
              {
                id v37 = +[MDMAbstractTunnelParser responseWithStatus:@"Error"];
                [v37 setObject:@"AppAlreadyInstalled" forKeyedSubscript:@"RejectionReason"];
                if (*(void *)(a1 + 64))
                {
                  char v88 = objc_msgSend(*(id *)(a1 + 32), "_appAlreadyInstalledErrorWithiTunesStoreID:");
                  [v37 setObject:v88 forKeyedSubscript:@"ErrorObject"];
                }
                else
                {
                  uint64_t v89 = *(void **)(a1 + 56);
                  if (v89)
                  {
                    id v90 = v89;
                  }
                  else
                  {
                    id v90 = [v35 bundleIdentifier];
                  }
                  char v88 = v90;
                  uint64_t v93 = [*(id *)(a1 + 32) _appAlreadyInstalledErrorWithBundleID:v90];
                  [v37 setObject:v93 forKeyedSubscript:@"ErrorObject"];
                }
              }
              else
              {
                v86 = [MEMORY[0x263F52810] sharedConfiguration];
                uint64_t v87 = [v86 personaID];

                if (!v87)
                {
                  id v37 = objc_opt_new();
                  [v37 setBundleIdentifier:*(void *)(a1 + 56)];
                  [v37 setStoreItemIdentifier:*(void *)(a1 + 64)];
                  [v37 setManifestURL:*(void *)(a1 + 72)];
                  [v37 setOriginator:v111];
                  [v37 setPersonaIdentifier:*(void *)(a1 + 80)];
                  [v37 setManagementOptions:v94];
                  [v37 setVPNUUIDString:v14];
                  [v37 setCellularSliceUUIDString:v15];
                  [v37 setContentFilterUUIDString:v109];
                  id v21 = v119;
                  [v37 setDNSProxyUUIDString:v119];
                  [v37 setRelayUUIDString:v114];
                  id v23 = v100;
                  [v37 setAssociatedDomains:v100];
                  [v37 setAssociatedDomainsEnableDirectDownloads:v101];
                  [v37 setTapToPayScreenLock:v103];
                  [v37 setAllowUserToHide:v96];
                  [v37 setAllowUserToLock:v31];
                  [v37 setRemovable:v97];
                  [v37 setConfiguration:*(void *)(a1 + 88)];
                  uint64_t v91 = *(void **)(a1 + 96);
                  v121[0] = MEMORY[0x263EF8330];
                  v121[1] = 3221225472;
                  v121[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_7;
                  v121[3] = &unk_264B9DC80;
                  id v122 = v8;
                  id v123 = *(id *)(a1 + 112);
                  id v92 = v91;
                  id v22 = v114;
                  [v92 performRequest:v37 completion:v121];

                  id v85 = v122;
                  goto LABEL_72;
                }
                id v37 = +[MDMAbstractTunnelParser responseWithStatus:@"Error"];
                [v37 setObject:@"ManagementChangeNotSupported" forKeyedSubscript:@"RejectionReason"];
              }
              (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
              id v22 = v114;
              id v21 = v119;
              id v23 = v100;
              goto LABEL_58;
            }
            v117 = v22;
            uint64_t v69 = *(void *)(a1 + 112);
            uint64_t v105 = [*(id *)(a1 + 32) _malformedRequestError];
            uint64_t v70 = +[MDMAbstractTunnelParser responseWithError:v105];
            uint64_t v71 = *(void (**)(uint64_t))(v69 + 16);
            uint64_t v72 = v69;
            id v22 = v117;
            uint64_t v98 = (void *)v70;
            v71(v72);
            long long v63 = (void *)v30;
            id v31 = (void *)v105;
          }
LABEL_62:

          uint64_t v29 = v101;
          goto LABEL_63;
        }
        id v53 = v23;
        uint64_t v54 = *(void *)(a1 + 112);
        unsigned int v55 = [*(id *)(a1 + 32) _malformedRequestError];
        uint64_t v56 = +[MDMAbstractTunnelParser responseWithError:v55];
        id v57 = *(void (**)(uint64_t, void *))(v54 + 16);
        uint64_t v58 = v54;
        id v23 = v53;
        v57(v58, v56);

        id v20 = v108;
      }
    }
LABEL_64:

    goto LABEL_65;
  }
  uint64_t v6 = *(void *)(a1 + 112);
  id v7 = +[MDMAbstractTunnelParser responseWithError:a3];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

LABEL_69:
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  id v4 = [v3 bundleIdentifier];
  [v7 setObject:v4 forKeyedSubscript:@"Identifier"];

  uint64_t v5 = [v3 state];
  uint64_t v6 = +[MDMParser _stringForAppState:v5];
  [v7 setObject:v6 forKeyedSubscript:@"State"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v20 = v4;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [v5 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x263F39C60]];

    if (v7)
    {
      id v8 = *(void **)(a1 + 32);
      if (v8)
      {
        id v9 = v8;
      }
      else
      {
        id v11 = [v5 userInfo];
        id v9 = [v11 objectForKeyedSubscript:*MEMORY[0x263F399F8]];
      }
      uint64_t v12 = [v5 code];
      uint64_t v10 = @"NotSupported";
      switch(v12)
      {
        case 2600:
          uint64_t v13 = *(void **)(a1 + 48);
          if (*(void *)(a1 + 40)) {
            objc_msgSend(v13, "_appAlreadyInstalledErrorWithiTunesStoreID:");
          }
          else {
          uint64_t v14 = [v13 _appAlreadyInstalledErrorWithBundleID:v9];
          }
          goto LABEL_24;
        case 2601:
        case 2602:
          goto LABEL_30;
        case 2603:
          id v16 = *(void **)(a1 + 48);
          if (*(void *)(a1 + 40)) {
            objc_msgSend(v16, "_appAlreadyQueuedErrorWithiTunesStoreID:");
          }
          else {
          uint64_t v19 = [v16 _appAlreadyQueuedErrorWithBundleID:v9];
          }
          uint64_t v10 = @"AppAlreadyQueued";
          goto LABEL_29;
        case 2604:
          uint64_t v14 = [*(id *)(a1 + 48) _invalidManifestErrorWithURL:*(void *)(a1 + 56) underlyingError:v5];
LABEL_24:
          uint64_t v19 = v14;
          uint64_t v10 = @"AppAlreadyInstalled";
          goto LABEL_29;
        case 2605:
          uint64_t v18 = *(void *)(a1 + 40);
          uint64_t v17 = *(void **)(a1 + 48);
          if (v18) {
            [v17 _licenseNotFoundErrorWithiTunesStoreID:v18 underlyingError:v5];
          }
          else {
          uint64_t v19 = [v17 _licenseNotFoundErrorWithBundleID:v9 underlyingError:v5];
          }
          uint64_t v10 = @"LicenseNotFound";
          goto LABEL_29;
        case 2606:
          uint64_t v19 = [*(id *)(a1 + 48) _cannotValidateAppIDErrorUnderlyingError:v5];
          uint64_t v10 = @"CouldNotVerifyAppID";
LABEL_29:

          id v5 = (id)v19;
          goto LABEL_30;
        default:
          if (v12 == 1001)
          {
            id v15 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
            [v15 setObject:v9 forKeyedSubscript:@"Identifier"];
            [v15 setObject:@"NeedsRedemption" forKeyedSubscript:@"State"];
            goto LABEL_22;
          }
          if (v12 == 2616)
          {
            id v15 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
LABEL_22:
            (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

            goto LABEL_32;
          }
LABEL_30:

          break;
      }
    }
    else
    {
      uint64_t v10 = @"NotSupported";
    }
    id v9 = +[MDMAbstractTunnelParser responseWithError:v5];
    [v9 setObject:v10 forKeyedSubscript:@"RejectionReason"];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_32:
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (id)_validateApplications:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"Identifiers"];
  if ([(MDMParser *)self _identifiersIsStringArray:v4])
  {
    id v5 = objc_opt_new();
    [v5 setBundleIdentifiers:v4];
    uint64_t v6 = [MEMORY[0x263F39D18] systemConnection];
    id v16 = 0;
    id v7 = (id)[v6 performRequest:v5 error:&v16];
    id v8 = v16;

    if (v8)
    {
      id v9 = [v8 userInfo];
      uint64_t v10 = [v9 objectForKey:*MEMORY[0x263F08608]];
      id v11 = (void *)v10;
      if (v10) {
        uint64_t v12 = (void *)v10;
      }
      else {
        uint64_t v12 = v8;
      }
      id v13 = v12;

      uint64_t v14 = +[MDMAbstractTunnelParser responseWithError:v13];
    }
    else
    {
      uint64_t v14 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    }
  }
  else
  {
    uint64_t v14 = +[MDMParser malformedRequestErrorResult];
  }

  return v14;
}

- (id)_applyRedemptionCode:(id)a3 assertion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Identifier"];
  id v7 = [v5 objectForKeyedSubscript:@"RedemptionCode"];

  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [MEMORY[0x263F52810] sharedConfiguration];
    id v9 = [v8 personaID];

    uint64_t v10 = objc_opt_new();
    [v10 setBundleIdentifier:v6];
    [v10 setRedemptionCode:v7];
    id v11 = [(MDMParser *)self _originator];
    [v10 setOriginator:v11];

    [v10 setPersonaIdentifier:v9];
    uint64_t v12 = [MEMORY[0x263F39D18] currentUserConnection];
    id v25 = 0;
    id v13 = (id)[v12 performRequest:v10 error:&v25];
    id v14 = v25;

    if (v14)
    {
      id v15 = [v14 domain];
      id v16 = (void *)*MEMORY[0x263F39C60];

      if (v15 == v16)
      {
        uint64_t v17 = [v14 code];
        if (v17 == 1006)
        {
          id v23 = 0;
          uint64_t v18 = DMCErrorArray();
          uint64_t v19 = 12037;
        }
        else if (v17 == 2611)
        {
          id v23 = v6;
          uint64_t v24 = 0;
          uint64_t v18 = DMCErrorArray();
          uint64_t v19 = 12028;
        }
        else
        {
          uint64_t v19 = 0;
          uint64_t v18 = 0;
        }
        uint64_t v22 = objc_msgSend(MEMORY[0x263F087E8], "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], v19, v18, *MEMORY[0x263F38A40], v23, v24);

        id v14 = (id)v22;
      }
      id v20 = +[MDMAbstractTunnelParser responseWithError:v14];
    }
    else
    {
      id v20 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    }
  }
  else
  {
    id v20 = +[MDMParser malformedRequestErrorResult];
  }

  return v20;
}

- (id)_handleFetchAppsRequest:(id)a3 managedOnly:(BOOL)a4 deleteFeedback:(BOOL)a5 advanceTransientStates:(BOOL)a6 propertyKeys:(id)a7 block:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  v56[1] = *MEMORY[0x263EF8340];
  id v14 = a7;
  id v15 = (void (**)(void, void *))a8;
  id v16 = [a3 objectForKeyedSubscript:@"Identifiers"];
  if (![(MDMParser *)self _identifiersIsStringArray:v16])
  {
    id v23 = +[MDMParser malformedRequestErrorResult];
    goto LABEL_27;
  }
  uint64_t v17 = objc_opt_new();
  [v17 setType:2];
  [v17 setBundleIdentifiers:v16];
  [v17 setManagedAppsOnly:v11];
  v56[0] = @"sourceIdentifier";
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:1];
  uint64_t v19 = [v18 arrayByAddingObjectsFromArray:v14];
  [v17 setPropertyKeys:v19];

  id v20 = [MEMORY[0x263F39D18] currentUserConnection];
  id v54 = 0;
  id v21 = [v20 performRequest:v17 error:&v54];
  id v22 = v54;

  if (!v22)
  {
    BOOL v47 = v10;
    BOOL v44 = v9;
    uint64_t v42 = v17;
    uint64_t v43 = v16;
    uint64_t v48 = v15;
    uint64_t v45 = v21;
    id v46 = v14;
    uint64_t v24 = [v21 appsByBundleIdentifier];
    id v25 = (void *)[v24 mutableCopy];

    uint64_t v26 = [v25 allKeys];
    uint64_t v27 = [MEMORY[0x263EFF980] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          id v34 = [v25 objectForKeyedSubscript:v33];
          long long v35 = [v34 sourceIdentifier];

          if (v35)
          {
            if (v11) {
              [v25 setObject:0 forKeyedSubscript:v33];
            }
          }
          else
          {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v30);
    }

    if (v47 || v44)
    {
      uint64_t v17 = v42;
      if ([v27 count])
      {
        uint64_t v36 = objc_opt_new();

        [v36 setType:2];
        [v36 setBundleIdentifiers:v27];
        [v36 setManagedAppsOnly:v11];
        [v36 setDeleteFeedback:v47];
        [v36 setAdvanceTransientStates:v44];
        id v37 = [MEMORY[0x263F39D18] currentUserConnection];
        id v49 = 0;
        id v38 = (id)[v37 performRequest:v36 error:&v49];
        id v22 = v49;

        if (v22)
        {
          id v23 = +[MDMAbstractTunnelParser responseWithError:v22];
          uint64_t v17 = v36;
          id v16 = v43;
LABEL_25:

          id v21 = v45;
          id v14 = v46;
          id v15 = v48;
          goto LABEL_26;
        }
        uint64_t v17 = v36;
      }
      id v16 = v43;
    }
    else
    {
      uint64_t v17 = v42;
      id v16 = v43;
    }
    id v23 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    BOOL v39 = (void *)[v25 copy];
    id v40 = v48[2](v48, v39);

    [v23 addEntriesFromDictionary:v40];
    id v22 = 0;
    goto LABEL_25;
  }
  id v23 = +[MDMAbstractTunnelParser responseWithError:v22];
LABEL_26:

LABEL_27:
  return v23;
}

- (id)_managedApplicationList:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v9 = @"managementInformation";
  BOOL v10 = @"configuration";
  BOOL v11 = @"feedback";
  uint64_t v12 = @"isValidated";
  id v13 = @"externalVersionIdentifier";
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:5];
  id v7 = -[MDMParser _handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:](self, "_handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:", v5, 1, 0, 1, v6, &__block_literal_global_1339, v9, v10, v11, v12, v13, v14);

  return v7;
}

id __37__MDMParser__managedApplicationList___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v26 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = v2;
  uint64_t v27 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v29;
    uint64_t v4 = MEMORY[0x263EFFA80];
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v3);
        }
        uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v7 = [v3 objectForKeyedSubscript:v6];
        id v8 = [v7 managementInformation];
        BOOL v9 = objc_opt_new();
        BOOL v10 = +[MDMParser _stringForAppState:](MDMParser, "_stringForAppState:", [v8 state]);
        [v9 setObject:v10 forKeyedSubscript:@"Status"];

        BOOL v11 = [v7 configuration];
        uint64_t v12 = MEMORY[0x263EFFA88];
        if (v11) {
          uint64_t v13 = MEMORY[0x263EFFA88];
        }
        else {
          uint64_t v13 = v4;
        }
        [v9 setObject:v13 forKeyedSubscript:@"HasConfiguration"];

        uint64_t v14 = [v7 feedback];
        if (v14) {
          uint64_t v15 = v12;
        }
        else {
          uint64_t v15 = v4;
        }
        [v9 setObject:v15 forKeyedSubscript:@"HasFeedback"];

        id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isValidated"));
        [v9 setObject:v16 forKeyedSubscript:@"IsValidated"];

        uint64_t v17 = NSNumber;
        uint64_t v18 = [v7 externalVersionIdentifier];
        uint64_t v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue"));
        [v9 setObject:v19 forKeyedSubscript:@"ExternalVersionIdentifier"];

        id v20 = [v8 unusedRedemptionCode];
        [v9 setObject:v20 forKeyedSubscript:@"UnusedRedemptionCode"];

        char v21 = [v8 options];
        id v22 = [NSNumber numberWithUnsignedInteger:v21 & 0xF];
        [v9 setObject:v22 forKeyedSubscript:@"ManagementFlags"];

        [v26 setObject:v9 forKeyedSubscript:v6];
      }
      uint64_t v27 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }

  long long v32 = @"ManagedApplicationList";
  uint64_t v33 = v26;
  id v23 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  return v23;
}

- (id)_managedApplicationConfiguration:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v9 = @"configuration";
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];
  id v7 = -[MDMParser _handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:](self, "_handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:", v5, 1, 0, 0, v6, &__block_literal_global_1341, v9, v10);

  return v7;
}

id __46__MDMParser__managedApplicationConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x230FC61D0](v5);
        BOOL v11 = objc_opt_new();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, @"Identifier", (void)v16);
        uint64_t v12 = [v4 objectForKeyedSubscript:v9];
        uint64_t v13 = [v12 configuration];
        [v11 setObject:v13 forKeyedSubscript:@"Configuration"];

        [v3 addObject:v11];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  id v20 = @"ApplicationConfigurations";
  char v21 = v3;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  return v14;
}

- (id)_managedApplicationAttributes:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v9 = @"VPNUUIDString";
  uint64_t v10 = @"cellularSliceUUIDString";
  BOOL v11 = @"contentFilterUUIDString";
  uint64_t v12 = @"DNSProxyUUIDString";
  uint64_t v13 = @"relayUUIDString";
  uint64_t v14 = @"associatedDomains";
  uint64_t v15 = @"associatedDomainsEnableDirectDownloads";
  long long v16 = @"removable";
  long long v17 = @"allowUserToHide";
  long long v18 = @"allowUserToLock";
  long long v19 = @"tapToPayScreenLock";
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:11];
  -[MDMParser _handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:](self, "_handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:", v5, 1, 0, 0, v6, &__block_literal_global_1379, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
  uint64_t v7 = v20);

  return v7;
}

id __43__MDMParser__managedApplicationAttributes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v37 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v36 = *(void *)v39;
    uint64_t v35 = *MEMORY[0x263F52A80];
    uint64_t v34 = *MEMORY[0x263F52A50];
    uint64_t v33 = *MEMORY[0x263F52A58];
    uint64_t v32 = *MEMORY[0x263F52A60];
    uint64_t v31 = *MEMORY[0x263F52A68];
    uint64_t v30 = *MEMORY[0x263F52A40];
    uint64_t v29 = *MEMORY[0x263F52A48];
    uint64_t v28 = *MEMORY[0x263F52A78];
    uint64_t v27 = *MEMORY[0x263F52A30];
    uint64_t v6 = *MEMORY[0x263F52A38];
    uint64_t v7 = *MEMORY[0x263F52A70];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v36) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x230FC61D0]();
        BOOL v11 = objc_opt_new();
        [v11 setObject:v9 forKeyedSubscript:@"Identifier"];
        uint64_t v12 = objc_opt_new();
        uint64_t v13 = [v3 objectForKeyedSubscript:v9];
        uint64_t v14 = [v13 VPNUUIDString];
        [v12 setObject:v14 forKeyedSubscript:v35];

        uint64_t v15 = [v13 cellularSliceUUIDString];
        [v12 setObject:v15 forKeyedSubscript:v34];

        long long v16 = [v13 contentFilterUUIDString];
        [v12 setObject:v16 forKeyedSubscript:v33];

        long long v17 = [v13 DNSProxyUUIDString];
        [v12 setObject:v17 forKeyedSubscript:v32];

        long long v18 = [v13 relayUUIDString];
        [v12 setObject:v18 forKeyedSubscript:v31];

        long long v19 = [v13 associatedDomains];
        [v12 setObject:v19 forKeyedSubscript:v30];

        uint64_t v20 = [v13 associatedDomainsEnableDirectDownloads];
        [v12 setObject:v20 forKeyedSubscript:v29];

        char v21 = [v13 tapToPayScreenLock];
        [v12 setObject:v21 forKeyedSubscript:v28];

        id v22 = [v13 allowUserToHide];
        [v12 setObject:v22 forKeyedSubscript:v27];

        uint64_t v23 = [v13 allowUserToLock];
        [v12 setObject:v23 forKeyedSubscript:v6];

        uint64_t v24 = [v13 removable];
        [v12 setObject:v24 forKeyedSubscript:v7];

        [v11 setObject:v12 forKeyedSubscript:@"Attributes"];
        [v37 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v5);
  }

  uint64_t v42 = @"ApplicationAttributes";
  uint64_t v43 = v37;
  uint64_t v25 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

  return v25;
}

- (id)_managedApplicationFeedback:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"DeleteFeedback"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = +[MDMParser malformedRequestErrorResult];
  }
  else
  {
    uint64_t v6 = [v5 BOOLValue];
    v10[0] = @"feedback";
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    uint64_t v8 = [(MDMParser *)self _handleFetchAppsRequest:v4 managedOnly:1 deleteFeedback:v6 advanceTransientStates:0 propertyKeys:v7 block:&__block_literal_global_1384];
  }
  return v8;
}

id __41__MDMParser__managedApplicationFeedback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x230FC61D0](v5);
        BOOL v11 = objc_opt_new();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, @"Identifier", (void)v16);
        uint64_t v12 = [v4 objectForKeyedSubscript:v9];
        uint64_t v13 = [v12 feedback];
        [v11 setObject:v13 forKeyedSubscript:@"Feedback"];

        [v3 addObject:v11];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  uint64_t v20 = @"ManagedApplicationFeedback";
  char v21 = v3;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  return v14;
}

- (id)_removeApplication:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"Identifier"];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    long long v16 = +[MDMParser malformedRequestErrorResult];
    goto LABEL_13;
  }
  uint64_t v5 = objc_opt_new();
  [v5 setType:2];
  [v5 setManagedAppsOnly:1];
  v35[0] = v4;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [v5 setBundleIdentifiers:v6];

  v34[0] = @"managementInformation";
  v34[1] = @"sourceIdentifier";
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  [v5 setPropertyKeys:v7];

  uint64_t v8 = [MEMORY[0x263F39D18] currentUserConnection];
  id v31 = 0;
  uint64_t v9 = [v8 performRequest:v5 error:&v31];
  id v10 = v31;
  if (!v10)
  {
    long long v17 = [v9 appsByBundleIdentifier];
    long long v18 = [v17 allValues];
    uint64_t v14 = [v18 firstObject];

    uint64_t v15 = [v14 managementInformation];
    if ([(MDMParser *)self _isManagedAppFromManagementInformation:v15])
    {
      long long v19 = [v14 sourceIdentifier];

      if (!v19)
      {
        char v21 = objc_opt_new();
        [v21 setBundleIdentifier:v4];
        uint64_t v23 = [MEMORY[0x263F39D18] currentUserConnection];
        id v30 = 0;
        id v24 = (id)[v23 performRequest:v21 error:&v30];
        id v11 = v30;

        if (v11)
        {
          uint64_t v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v26 = *MEMORY[0x263F38B10];
          uint64_t v29 = DMCErrorArray();
          uint64_t v27 = objc_msgSend(v25, "DMCErrorWithDomain:code:descriptionArray:errorType:", v26, 12087, v29, *MEMORY[0x263F38A40], v4, 0);
          long long v16 = +[MDMAbstractTunnelParser responseWithError:v27];
        }
        else
        {
          uint64_t v28 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v33 = v4;
            _os_log_impl(&dword_230A49000, v28, OS_LOG_TYPE_DEFAULT, "Removed app “%{public}@”.", buf, 0xCu);
          }
          long long v16 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
        }
        goto LABEL_11;
      }
      uint64_t v20 = [(MDMParser *)self _installApplicationCouldNotModifyDDMAppsError];
    }
    else
    {
      uint64_t v20 = [(MDMParser *)self _notManagedErrorAppID:v4];
    }
    char v21 = (void *)v20;
    long long v16 = +[MDMAbstractTunnelParser responseWithError:v20];
    id v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  id v11 = v10;
  uint64_t v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = *MEMORY[0x263F38B10];
  uint64_t v14 = DMCErrorArray();
  uint64_t v15 = objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12087, v14, *MEMORY[0x263F38A40], v4, 0);
  long long v16 = +[MDMAbstractTunnelParser responseWithError:v15];
LABEL_12:

LABEL_13:
  return v16;
}

- (BOOL)_isTriggerDiagnosticsAllowed
{
  return 0;
}

- (id)_triggerDiagnostics:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F38BE8]) initWithReason:@"MDM-TriggerDiagnostics"];
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Triggering diagnostics...", buf, 2u);
  }
  uint64_t v5 = [MEMORY[0x263F39D18] systemConnection];
  uint64_t v6 = objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __33__MDMParser__triggerDiagnostics___block_invoke;
  v10[3] = &unk_264B9DD18;
  id v11 = v3;
  id v7 = v3;
  [v5 performRequest:v6 completion:v10];

  uint64_t v8 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];

  return v8;
}

void __33__MDMParser__triggerDiagnostics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = v4;
      id v7 = [v3 description];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Error triggerring diagnostics:\n%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "Diagnostics collected successfully.", (uint8_t *)&v8, 2u);
  }
}

- (void)_requestMirroringRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  int v8 = (void (**)(id, void *))a5;
  uint64_t v9 = [v7 objectForKey:@"DestinationName"];
  uint64_t v10 = [v7 objectForKey:@"DestinationDeviceID"];
  if (v9 | v10)
  {
    id v11 = (void *)v10;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      long long v16 = +[MDMParser malformedRequestErrorResult];
    }
    else
    {
      uint64_t v12 = [v7 objectForKey:@"Password"];
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        long long v16 = +[MDMParser malformedRequestErrorResult];
      }
      else
      {
        uint64_t v13 = [v7 objectForKey:@"ScanTime"];
        if (!v13)
        {
          double v15 = 30.0;
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          [v13 doubleValue];
          double v15 = v14;
LABEL_16:
          id v24 = v13;
          if (v11)
          {
            uint64_t v17 = objc_msgSend(v11, "uppercaseString", v13);

            id v11 = (void *)v17;
          }
          long long v18 = objc_opt_new();
          [v18 setDestinationName:v9];
          [v18 setDestinationDeviceID:v11];
          [v18 setPassword:v12];
          [v18 setScanWaitInterval:v15];
          long long v19 = [MEMORY[0x263F39D18] systemConnection];
          id v26 = 0;
          uint64_t v20 = [v19 performRequest:v18 error:&v26];
          id v21 = v26;

          if (v21)
          {
            long long v16 = +[MDMAbstractTunnelParser responseWithError:v21];
          }
          else
          {
            long long v16 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
            unint64_t v22 = [v20 status] - 1;
            if (v22 > 2) {
              uint64_t v23 = @"Unknown";
            }
            else {
              uint64_t v23 = off_264B9DF58[v22];
            }
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, @"MirroringResult", v24);
          }
          -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v7, v16, v24);
          if (v8) {
            v8[2](v8, v16);
          }

          goto LABEL_31;
        }
        long long v16 = +[MDMParser malformedRequestErrorResult];
      }
    }
  }
  else
  {
    long long v16 = +[MDMParser malformedRequestErrorResult];
    id v11 = 0;
  }
  [(MDMParser *)self _sendAnalyticsMDMCommandEventWithRequest:v7 response:v16];
  if (v8) {
    v8[2](v8, v16);
  }
LABEL_31:
}

- (void)_stopMirroringRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F39D18] systemConnection];
  uint64_t v10 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__MDMParser__stopMirroringRequest_assertion_completionBlock___block_invoke;
  v13[3] = &unk_264B9DD40;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v9 performRequest:v10 completion:v13];
}

void __61__MDMParser__stopMirroringRequest_assertion_completionBlock___block_invoke(uint64_t a1)
{
  id v3 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)_inviteToProgramRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke;
  v23[3] = &unk_264B9DA80;
  void v23[4] = self;
  id v11 = v8;
  id v24 = v11;
  id v12 = v10;
  id v25 = v12;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x230FC63F0](v23);
  id v14 = [v11 objectForKeyedSubscript:@"InvitationURL"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [NSURL URLWithString:v14];
      if (!v15)
      {
        long long v16 = +[MDMParser malformedRequestErrorResult];
        ((void (**)(void, void *))v13)[2](v13, v16);
        goto LABEL_13;
      }
      long long v16 = [v11 objectForKeyedSubscript:@"ProgramID"];
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if ([&unk_26E553C50 containsObject:v16])
        {
          uint64_t v17 = objc_opt_new();
          long long v18 = [(MDMParser *)self _originator];
          [v17 setOriginator:v18];

          [v17 setURL:v15];
          long long v19 = [MEMORY[0x263F39D18] currentUserConnection];
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke_2;
          v20[3] = &unk_264B9DD68;
          unint64_t v22 = v13;
          id v21 = v9;
          [v19 performRequest:v17 completion:v20];

LABEL_11:
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v17 = +[MDMParser malformedRequestErrorResult];
        [v17 setObject:@"InvalidProgramID" forKeyedSubscript:@"InvitationResult"];
      }
      else
      {
        uint64_t v17 = +[MDMParser malformedRequestErrorResult];
      }
      ((void (**)(void, void *))v13)[2](v13, v17);
      goto LABEL_11;
    }
  }
  id v15 = +[MDMParser malformedRequestErrorResult];
  ((void (**)(void, void *))v13)[2](v13, v15);
LABEL_14:
}

void __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[MDMParser malformedRequestErrorResult];
    id v7 = [v5 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F39C60]];

    if (!v8) {
      goto LABEL_10;
    }
    uint64_t v9 = [v5 code];
    if (v9 == 1402)
    {
      id v10 = @"InvalidInvitationURL";
    }
    else
    {
      if (v9 != 1400) {
        goto LABEL_10;
      }
      id v10 = @"AppStoreNotAllowed";
    }
    id v11 = v6;
  }
  else
  {
    id v11 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    uint64_t v6 = v11;
    id v10 = @"Acknowledged";
  }
  [v11 setObject:v10 forKeyedSubscript:@"InvitationResult"];
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_activationLockBypassCodeRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_opt_new();
  uint64_t v9 = [MEMORY[0x263F39D18] systemConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__MDMParser__activationLockBypassCodeRequest_completionBlock___block_invoke;
  v12[3] = &unk_264B9DD90;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performRequest:v8 completion:v12];
}

void __62__MDMParser__activationLockBypassCodeRequest_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v21 = @"Status";
    v22[0] = @"Acknowledged";
    id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    long long v16 = (void *)[v15 mutableCopy];

    id v7 = [v5 bypassCode];
    [v16 setObject:v7 forKeyedSubscript:@"ActivationLockBypassCode"];
    goto LABEL_9;
  }
  id v7 = v6;
  if ([v6 code] == 3600)
  {
    int v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F38B10];
    id v10 = DMCErrorArray();
    uint64_t v11 = *MEMORY[0x263F38A40];
    id v12 = v8;
    uint64_t v13 = v9;
    uint64_t v14 = 12085;
LABEL_7:
    uint64_t v19 = objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, v14, v10, v11, 0);

    id v7 = (void *)v19;
    goto LABEL_8;
  }
  if ([v7 code] == 3601)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F38B10];
    id v10 = DMCErrorArray();
    uint64_t v11 = *MEMORY[0x263F38A50];
    id v12 = v17;
    uint64_t v13 = v18;
    uint64_t v14 = 12086;
    goto LABEL_7;
  }
LABEL_8:
  long long v16 = +[MDMAbstractTunnelParser responseWithError:v7];
LABEL_9:

  [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v16];
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v16);
  }
}

- (void)_clearActivationLockBypassCodeRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263F39D18] systemConnection];
  uint64_t v9 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__MDMParser__clearActivationLockBypassCodeRequest_completionBlock___block_invoke;
  v12[3] = &unk_264B9DD40;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 performRequest:v9 completion:v12];
}

void __67__MDMParser__clearActivationLockBypassCodeRequest_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5) {
    +[MDMAbstractTunnelParser responseWithError:v5];
  }
  else {
  id v6 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  }
  [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v6];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (void)_installMedia:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __53__MDMParser__installMedia_assertion_completionBlock___block_invoke;
  void v45[3] = &unk_264B9DA80;
  v45[4] = self;
  id v11 = v8;
  id v46 = v11;
  id v12 = v10;
  id v47 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x230FC63F0](v45);
  id v14 = [v11 objectForKeyedSubscript:@"MediaType"];
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v14 isEqualToString:@"Book"])
    {
      id v15 = [v11 objectForKeyedSubscript:@"PersistentID"];
      long long v16 = [v11 objectForKeyedSubscript:@"MediaURL"];
      uint64_t v17 = [NSURL URLWithString:v16];
      long long v38 = [v11 objectForKeyedSubscript:@"Kind"];
      uint64_t v18 = [v11 objectForKeyedSubscript:@"iTunesStoreID"];
      if (_installMedia_assertion_completionBlock__onceToken != -1) {
        dispatch_once(&_installMedia_assertion_completionBlock__onceToken, &__block_literal_global_1456);
      }
      id v37 = (void *)v18;
      if (v15)
      {
        if (v17 && [v16 length])
        {
          uint64_t v34 = v16;
          uint64_t v19 = (uint64_t)v38;
          if (!v38)
          {
            long long v39 = [MEMORY[0x263F08BA0] componentsWithURL:v17 resolvingAgainstBaseURL:0];
            uint64_t v20 = [v39 path];
            uint64_t v19 = [v20 pathExtension];
          }
          uint64_t v36 = v17;
          id v21 = objc_msgSend((id)_installMedia_assertion_completionBlock__typeMap, "allKeys", v34);
          long long v38 = (void *)v19;
          char v22 = [v21 containsObject:v19];

          if ((v22 & 1) == 0)
          {
            id v31 = *(NSObject **)(DMCLogObjects() + 8);
            long long v16 = v35;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v49 = v38;
              _os_log_impl(&dword_230A49000, v31, OS_LOG_TYPE_ERROR, "Invalid book kind: %{public}@", buf, 0xCu);
            }
            id v25 = +[MDMParser malformedRequestErrorResult];
            ((void (**)(void, void *))v13)[2](v13, v25);
            uint64_t v17 = v36;
            goto LABEL_29;
          }
          long long v16 = v35;
          goto LABEL_21;
        }
        id v24 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v49 = v16;
          _os_log_impl(&dword_230A49000, v24, OS_LOG_TYPE_ERROR, "Invalid URL: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v36 = v17;
LABEL_21:
          id v25 = objc_opt_new();
          [v25 setPersistentID:v15];
          id v26 = [v11 objectForKeyedSubscript:@"Author"];
          [v25 setAuthor:v26];

          uint64_t v27 = [v11 objectForKeyedSubscript:@"Title"];
          [v25 setTitle:v27];

          uint64_t v28 = [v11 objectForKeyedSubscript:@"Version"];
          [v25 setVersion:v28];

          [v25 setURL:v36];
          uint64_t v29 = [(id)_installMedia_assertion_completionBlock__typeMap objectForKeyedSubscript:v38];
          objc_msgSend(v25, "setType:", objc_msgSend(v29, "unsignedIntegerValue"));

          if (v37)
          {
            id v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v37, "longLongValue"));
            [v25 setITunesStoreID:v30];
          }
          else
          {
            [v25 setITunesStoreID:0];
          }
          uint64_t v32 = [(MDMParser *)self _originator];
          [v25 setOriginator:v32];

          uint64_t v33 = [MEMORY[0x263F39D18] systemConnection];
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_1465;
          v40[3] = &unk_264B9DDB8;
          v40[4] = self;
          id v41 = v36;
          id v42 = v15;
          BOOL v44 = v13;
          id v43 = v9;
          [v33 performRequest:v25 completion:v40];

          uint64_t v17 = v36;
          goto LABEL_29;
        }
      }
      id v25 = +[MDMParser malformedRequestErrorResult];
      ((void (**)(void, void *))v13)[2](v13, v25);
LABEL_29:

      goto LABEL_15;
    }
    uint64_t v23 = +[MDMParser malformedRequestErrorResult];
    id v15 = (void *)[v23 mutableCopy];

    [v15 setObject:@"WrongMediaType" forKeyedSubscript:@"RejectionReason"];
  }
  else
  {
    id v15 = +[MDMParser malformedRequestErrorResult];
  }
  ((void (**)(void, void *))v13)[2](v13, v15);
LABEL_15:
}

void __53__MDMParser__installMedia_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v3];
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_2;
    v6[3] = &unk_264B9D0E8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_3()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = @"ibooks";
  v2[1] = @"pdf";
  v3[0] = &unk_26E553D10;
  v3[1] = &unk_26E553D28;
  void v2[2] = @"epub";
  v3[2] = &unk_26E553D40;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  uint64_t v1 = (void *)_installMedia_assertion_completionBlock__typeMap;
  _installMedia_assertion_completionBlock__typeMap = v0;
}

void __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_1465(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  id v6 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  if (!v5)
  {
    id v5 = [v20 book];
    id v10 = [v5 iTunesStoreID];
    [v6 setObject:v10 forKeyedSubscript:@"iTunesStoreID"];

    id v11 = objc_msgSend(*(id *)(a1 + 32), "_stringForBookState:", objc_msgSend(v5, "state"));
    [v6 setObject:v11 forKeyedSubscript:@"State"];

    [v6 setObject:@"Book" forKeyedSubscript:@"MediaType"];
    id v12 = [*(id *)(a1 + 40) absoluteString];
    [v6 setObject:v12 forKeyedSubscript:@"MediaURL"];

    [v6 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"PersistentID"];
    goto LABEL_18;
  }
  id v7 = [v5 domain];
  if (([v7 isEqualToString:*MEMORY[0x263F39C60]] & 1) == 0)
  {

LABEL_7:
    uint64_t v13 = [v5 code];
    switch(v13)
    {
      case 2608:
        uint64_t v14 = 12040;
        goto LABEL_15;
      case 2609:
      case 2610:
      case 2611:
        goto LABEL_16;
      case 2612:
        uint64_t v14 = 12045;
        goto LABEL_15;
      case 2613:
        uint64_t v14 = 12043;
        goto LABEL_15;
      case 2614:
        uint64_t v14 = 12046;
        goto LABEL_15;
      case 2615:
        uint64_t v14 = 12047;
        goto LABEL_15;
      default:
        if (v13 != 1504) {
          goto LABEL_16;
        }
        uint64_t v14 = 12008;
LABEL_15:
        id v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = *MEMORY[0x263F38B10];
        uint64_t v17 = DMCUnformattedErrorArray();
        uint64_t v18 = objc_msgSend(v15, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v16, v14, v17, v5, *MEMORY[0x263F38A40], 0);

        id v5 = (id)v18;
LABEL_16:
        uint64_t v9 = +[MDMAbstractTunnelParser responseWithError:v5];
        break;
    }
    goto LABEL_17;
  }
  uint64_t v8 = [v5 code];

  if (v8 != 1650) {
    goto LABEL_7;
  }
  uint64_t v9 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
LABEL_17:
  uint64_t v19 = (void *)v9;

  id v6 = v19;
LABEL_18:

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_managedMediaList:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F39D18] systemConnection];
  id v10 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__MDMParser__managedMediaList_assertion_completionBlock___block_invoke;
  v13[3] = &unk_264B9DDE0;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v9 performRequest:v10 completion:v13];
}

void __57__MDMParser__managedMediaList_assertion_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      id v7 = [v4 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      long long v40 = v7;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve managed books with error: %{public}@", buf, 0xCu);
    }
    id v8 = [v4 domain];
    if ([v8 isEqualToString:*MEMORY[0x263F39C60]])
    {
      uint64_t v9 = [v4 code];

      if (v9 == 1650)
      {
        uint64_t v10 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
        goto LABEL_21;
      }
    }
    else
    {
    }
    uint64_t v10 = +[MDMAbstractTunnelParser responseWithError:v4];
LABEL_21:
    id v13 = (id)v10;
    [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v10];
    uint64_t v30 = *(void *)(a1 + 48);
    if (v30) {
      (*(void (**)(uint64_t, id))(v30 + 16))(v30, v13);
    }
    goto LABEL_23;
  }
  id v11 = [a2 books];
  id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      uint64_t v17 = v13;
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v17);
        }
        uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v20 = objc_opt_new();
        id v21 = [v19 iTunesStoreID];
        [v20 setObject:v21 forKeyedSubscript:@"iTunesStoreID"];

        char v22 = [v19 persistentID];
        [v20 setObject:v22 forKeyedSubscript:@"PersistentID"];

        uint64_t v23 = [v19 version];
        [v20 setObject:v23 forKeyedSubscript:@"Version"];

        id v24 = [v19 title];
        [v20 setObject:v24 forKeyedSubscript:@"Title"];

        id v25 = [v19 author];
        [v20 setObject:v25 forKeyedSubscript:@"Author"];

        unint64_t v26 = [v19 type];
        if (v26 <= 2) {
          [v20 setObject:off_264B9DF70[v26] forKeyedSubscript:@"Kind"];
        }
        uint64_t v27 = objc_msgSend(*(id *)(a1 + 32), "_stringForBookState:", objc_msgSend(v19, "state"));
        [v20 setObject:v27 forKeyedSubscript:@"State"];

        [v12 addObject:v20];
      }
      id v13 = v17;
      uint64_t v15 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v15);
  }

  v36[0] = @"Status";
  v36[1] = @"Books";
  v37[0] = @"Acknowledged";
  v37[1] = v12;
  uint64_t v28 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v28];
  uint64_t v29 = *(void *)(a1 + 48);
  if (v29) {
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v28);
  }

  id v4 = 0;
LABEL_23:
}

- (void)_removeMedia:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke;
  v20[3] = &unk_264B9DA80;
  void v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  id v10 = v8;
  id v22 = v10;
  id v11 = (void (**)(void, void))MEMORY[0x230FC63F0](v20);
  id v12 = [v9 objectForKeyedSubscript:@"MediaType"];
  id v13 = [v9 objectForKeyedSubscript:@"PersistentID"];
  uint64_t v14 = [v9 objectForKeyedSubscript:@"iTunesStoreID"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v12 isEqualToString:@"Book"])
    {
      uint64_t v15 = objc_opt_new();
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [v15 setPersistentID:v13];
      }
      else
      {
        if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          uint64_t v17 = +[MDMParser malformedRequestErrorResult];
          ((void (**)(void, void *))v11)[2](v11, v17);
          goto LABEL_14;
        }
        [v15 setITunesStoreID:v14];
      }
      uint64_t v16 = [MEMORY[0x263F39D18] systemConnection];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_3;
      v18[3] = &unk_264B9DE08;
      uint64_t v19 = v11;
      [v16 performRequest:v15 completion:v18];

      uint64_t v17 = v19;
LABEL_14:

      goto LABEL_8;
    }
  }
  uint64_t v15 = +[MDMParser malformedRequestErrorResult];
  ((void (**)(void, void *))v11)[2](v11, v15);
LABEL_8:
}

void __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 40) response:v3];
    id v4 = *(void **)(a1 + 48);
    if (v4)
    {
      id v5 = dispatch_get_global_queue(0, 0);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_2;
      v6[3] = &unk_264B9D0E8;
      id v8 = v4;
      id v7 = v3;
      dispatch_async(v5, v6);
    }
  }
}

uint64_t __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v10 = v4;
  if (!v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    goto LABEL_9;
  }
  id v5 = [v4 domain];
  if (![v5 isEqualToString:*MEMORY[0x263F39C60]])
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v10 code];

  if (v6 != 1650)
  {
LABEL_7:
    uint64_t v7 = +[MDMAbstractTunnelParser responseWithError:v10];
    goto LABEL_8;
  }
  uint64_t v7 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
LABEL_8:
  id v9 = (void *)v7;
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7);
LABEL_9:
}

- (void)_deviceConfigured:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__5;
  uint64_t v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  id v11 = [MEMORY[0x263F52808] sharedConfiguration];
  id v12 = [v11 details];
  id v13 = (void *)[v12 mutableCopy];

  if (v13)
  {
    [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F38960]];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke;
    v19[3] = &unk_264B9DE58;
    uint64_t v23 = &v24;
    v19[4] = self;
    id v20 = v8;
    id v22 = v10;
    id v21 = v9;
    +[MDMMCInterface storeCloudConfigurationDetails:v13 completion:v19];
  }
  else
  {
    uint64_t v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_ERROR, "Device asked to end device configuration, but no cloud configuration yet in place.", v18, 2u);
    }
    uint64_t v15 = +[MDMAbstractTunnelParser responseWithStatus:@"NotNow"];
    uint64_t v16 = [v15 mutableCopy];
    uint64_t v17 = (void *)v25[5];
    v25[5] = v16;

    [(MDMParser *)self _sendAnalyticsMDMCommandEventWithRequest:v8 response:v25[5]];
    if (v10) {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v25[5]);
    }
  }

  _Block_object_dispose(&v24, 8);
}

void __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke_2;
  v7[3] = &unk_264B9DE30;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v3;
      _os_log_impl(&dword_230A49000, v2, OS_LOG_TYPE_ERROR, "Could not update await device configure - %{public}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v4 = +[MDMAbstractTunnelParser responseWithError:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  }
  id v5 = v4;
  uint64_t v6 = [v4 mutableCopy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [*(id *)(a1 + 40) _sendAnalyticsMDMCommandEventWithRequest:*(void *)(a1 + 48) response:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
  return result;
}

- (id)_accessibilitySettings
{
  uint64_t v2 = +[MDMAccessibilityManager sharedInstance];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "zoomEnabled"));
  [v3 setObject:v4 forKeyedSubscript:@"ZoomEnabled"];

  id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "boldTextEnabled"));
  [v3 setObject:v5 forKeyedSubscript:@"BoldTextEnabled"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "voiceOverEnabled"));
  [v3 setObject:v6 forKeyedSubscript:@"VoiceOverEnabled"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "reduceMotionEnabled"));
  [v3 setObject:v7 forKeyedSubscript:@"ReduceMotionEnabled"];

  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "increaseContrastEnabled"));
  [v3 setObject:v8 forKeyedSubscript:@"IncreaseContrastEnabled"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "textSize"));
  [v3 setObject:v9 forKeyedSubscript:@"TextSize"];

  int v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "reduceTransparencyEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"ReduceTransparencyEnabled"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "touchAccommodationsEnabled"));
  [v3 setObject:v11 forKeyedSubscript:@"TouchAccommodationsEnabled"];

  return v3;
}

- (void)_scheduleOSUpdateScan:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  uint64_t v7 = (void (**)(id, void *))a5;
  id v8 = a3;
  uint64_t v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "Schedule OS update scan start.", buf, 2u);
  }
  int v10 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  [(MDMParser *)self _sendAnalyticsMDMCommandEventWithRequest:v8 response:v10];

  if (v7) {
    v7[2](v7, v10);
  }
  uint64_t v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEFAULT, "Schedule OS update scan end.", v12, 2u);
  }
}

- (void)_scheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEFAULT, "Schedule OS update start", buf, 2u);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__MDMParser__scheduleOSUpdate_assertion_completionBlock___block_invoke;
  v20[3] = &unk_264B9DA80;
  void v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  uint64_t v14 = (void *)MEMORY[0x230FC63F0](v20);
  if ([(MDMParser *)self _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:v14])
  {
    uint64_t v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "Rejected software update due to user logged in.";
      uint64_t v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_230A49000, v17, v18, v16, buf, 2u);
    }
  }
  else
  {
    [(MDMParser *)self _dmfScheduleOSUpdate:v12 assertion:v9 completionBlock:v14];
    uint64_t v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "Schedule OS update end.";
      uint64_t v17 = v19;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
  }
}

void __57__MDMParser__scheduleOSUpdate_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)_dmfScheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  v78[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "DMF Schedule OS update start.", buf, 2u);
  }
  id v10 = [v7 objectForKeyedSubscript:@"Updates"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
    uint64_t v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v20 = "Rejected software update due to malformed update array.";
      goto LABEL_19;
    }
  }
  else
  {
    if (![v10 count])
    {
      id v76 = @"InstallAction";
      uint64_t v77 = @"Default";
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      v78[0] = v11;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:1];

      id v10 = (void *)v12;
    }
    if ([v10 count] == 1)
    {
      id v13 = [v10 objectAtIndexedSubscript:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
        id v21 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230A49000, v21, OS_LOG_TYPE_ERROR, "Rejected software update due to missing or malformed OS update object.", buf, 2u);
        }
        goto LABEL_80;
      }
      uint64_t v14 = [v13 objectForKeyedSubscript:@"ProductKey"];
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
          id v22 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230A49000, v22, OS_LOG_TYPE_ERROR, "Rejected software update due to malformed product key.", buf, 2u);
          }
          goto LABEL_79;
        }
      }
      uint64_t v15 = [v13 objectForKeyedSubscript:@"InstallAction"];
      if (v15)
      {
        uint64_t v16 = (__CFString *)v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
          uint64_t v17 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            os_log_type_t v18 = "Rejected software update due to malformed install action.";
LABEL_32:
            _os_log_impl(&dword_230A49000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
            goto LABEL_78;
          }
          goto LABEL_78;
        }
      }
      else
      {
        uint64_t v16 = @"Default";
      }
      uint64_t v72 = 0;
      if (([(id)objc_opt_class() _dmfAction:&v72 fromMDMActionString:v16] & 1) == 0)
      {
        [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
        uint64_t v17 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          os_log_type_t v18 = "Rejected software update due to malformed OS update action.";
          goto LABEL_32;
        }
LABEL_78:

LABEL_79:
LABEL_80:

        goto LABEL_81;
      }
      uint64_t v23 = [v13 objectForKeyedSubscript:@"ProductVersion"];
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
          uint64_t v30 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            id v31 = "Rejected software update due to malformed product version.";
            goto LABEL_52;
          }
LABEL_77:

          goto LABEL_78;
        }
        uint64_t v24 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
LABEL_36:
          uint64_t v29 = [(id)objc_opt_class() _shouldUseDelayWithRequest:v7];
          if (v29 == 2)
          {
            [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
            uint64_t v30 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              id v31 = "Rejected software update due to \"use delay\" bad request.";
LABEL_52:
              _os_log_impl(&dword_230A49000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
              goto LABEL_77;
            }
            goto LABEL_77;
          }
          uint64_t v32 = v29;
          uint64_t v67 = v16;
          uint64_t v70 = v23;
          long long v33 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            long long v34 = @"NO";
            if (v32 == 1) {
              long long v34 = @"YES";
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v75 = v34;
            _os_log_impl(&dword_230A49000, v33, OS_LOG_TYPE_DEFAULT, "scheduleOSUpdate useDelay = %{public}@", buf, 0xCu);
          }
          long long v35 = objc_opt_new();
          [v35 setProductKey:v14];
          [v35 setProductVersion:v70];
          [v35 setAction:v72];
          [v35 setUseDelay:v32 == 1];
          uint64_t v36 = [MEMORY[0x263F39D18] systemConnection];
          id v71 = 0;
          id v37 = [v36 performRequest:v35 error:&v71];
          id v38 = v71;

          long long v39 = v37;
          if (!v37)
          {
            uint64_t v48 = v38;
            uint64_t v45 = [(id)objc_opt_class() _errorFromDMFSoftwareUpdateError:v38];
            id v49 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v75 = v45;
              _os_log_impl(&dword_230A49000, v49, OS_LOG_TYPE_ERROR, "Could not schedule an update - %{public}@", buf, 0xCu);
            }
            id v47 = +[MDMAbstractTunnelParser responseWithError:v45];
            if (v8) {
              v8[2](v8, v47);
            }
            goto LABEL_75;
          }
          id v63 = v38;
          uint64_t v69 = v37;
          long long v40 = [v37 error];
          uint64_t v41 = [(__CFString *)v40 domain];
          uint64_t v42 = *MEMORY[0x263F39C60];
          uint64_t v66 = v35;
          uint64_t v68 = v40;
          if ([v41 isEqualToString:*MEMORY[0x263F39C60]])
          {
            uint64_t v43 = [(__CFString *)v40 code];

            if (v43 == 2213)
            {
              BOOL v44 = *(NSObject **)(DMCLogObjects() + 8);
              uint64_t v45 = v68;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_230A49000, v44, OS_LOG_TYPE_DEFAULT, "No update available.", buf, 2u);
              }
              long long v39 = v69;
              if (!v8)
              {
                uint64_t v48 = v63;
                goto LABEL_76;
              }
              id v46 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
              id v47 = (void *)[v46 mutableCopy];

              [v47 setObject:MEMORY[0x263EFFA68] forKeyedSubscript:@"UpdateResults"];
              v8[2](v8, v47);
              uint64_t v48 = v63;
LABEL_75:

LABEL_76:
              uint64_t v23 = v70;
              uint64_t v16 = v67;
              goto LABEL_77;
            }
          }
          else
          {
          }
          uint64_t v50 = [(__CFString *)v68 domain];
          if ([v50 isEqualToString:v42]) {
            BOOL v51 = [(__CFString *)v68 code] == 2200 || [(__CFString *)v68 code] == 2207;
          }
          else {
            BOOL v51 = 0;
          }

          objc_msgSend((id)objc_opt_class(), "_resolvedInstallActionStringForAction:", objc_msgSend(v69, "action"));
          long long v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v68 || v51)
          {
            long long v64 = 0;
            long long v53 = @"Error";
            if (v52) {
              long long v53 = v52;
            }
          }
          else
          {

            long long v64 = [(id)objc_opt_class() _errorFromDMFSoftwareUpdateError:v68];
            long long v53 = @"Error";
          }
          uint64_t v65 = v53;
          uint64_t v54 = objc_msgSend((id)objc_opt_class(), "_statusFromError:action:", v68, objc_msgSend(v69, "action"));
          unsigned int v55 = objc_opt_new();
          [v55 setObject:v65 forKeyedSubscript:@"InstallAction"];
          uint64_t v56 = [v69 productKey];
          [v55 setObject:v56 forKeyedSubscript:@"ProductKey"];

          uint64_t v62 = (void *)v54;
          [v55 setObject:v54 forKeyedSubscript:@"Status"];
          if (v64)
          {
            id v57 = [(id)objc_opt_class() errorChainFromError:v64];
            [v55 setObject:v57 forKeyedSubscript:@"ErrorChain"];
          }
          uint64_t v58 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
          uint64_t v59 = (void *)[v58 mutableCopy];

          id v73 = v55;
          id v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
          [v59 setObject:v60 forKeyedSubscript:@"UpdateResults"];

          if (v8) {
            v8[2](v8, v59);
          }
          uint64_t v61 = *(NSObject **)(DMCLogObjects() + 8);
          long long v35 = v66;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230A49000, v61, OS_LOG_TYPE_DEFAULT, "DMF Schedule OS update end.", buf, 2u);
          }

          uint64_t v45 = v68;
          long long v39 = v69;
          uint64_t v48 = v63;
          id v47 = v65;
          goto LABEL_75;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v75 = v23;
        id v25 = "Requesting an update with a specific PMV - %{public}@";
        uint64_t v26 = v24;
        uint32_t v27 = 12;
      }
      else
      {
        uint64_t v28 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        id v25 = "Requesting an update with any PMV";
        uint64_t v26 = v28;
        uint32_t v27 = 2;
      }
      _os_log_impl(&dword_230A49000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_36;
    }
    [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v8];
    uint64_t v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v20 = "Rejected software update due to multiple OS update objects.";
LABEL_19:
      _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    }
  }
LABEL_81:
}

- (void)_mdmScheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "MDM Schedule OS update start.", buf, 2u);
  }
  if ([(MDMParser *)self _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:v8])
  {
    id v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Rejected software update due to user logged in.";
      uint64_t v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl(&dword_230A49000, v12, v13, v11, buf, 2u);
      goto LABEL_38;
    }
    goto LABEL_38;
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"Updates"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        id v31 = v7;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint32_t v27 = *(NSObject **)(DMCLogObjects() + 8);
              id v7 = v31;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_230A49000, v27, OS_LOG_TYPE_ERROR, "Rejected software update due to malformed update object.", buf, 2u);
              }
              goto LABEL_35;
            }
            id v21 = [v20 objectForKeyedSubscript:@"ProductKey"];
            if (v21)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v28 = *(NSObject **)(DMCLogObjects() + 8);
                id v7 = v31;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_230A49000, v28, OS_LOG_TYPE_ERROR, "Rejected software update due to malformed product key.", buf, 2u);
                }

                goto LABEL_35;
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
          id v7 = v31;
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v24 = *(NSObject **)(DMCLogObjects() + 8);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_36:

      if (v8)
      {
        uint64_t v29 = +[MDMParser malformedRequestErrorResult];
        uint64_t v30 = (void *)[v29 mutableCopy];

        v8[2](v8, v30);
      }
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    id v25 = "Rejected software update due to missing or malformed update array.";
LABEL_26:
    _os_log_impl(&dword_230A49000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_36;
  }
  if (([@"Default" isEqualToString:@"Default"] & 1) == 0)
  {
    char v22 = [@"Default" isEqualToString:@"DownloadOnly"];
    char v23 = [@"Default" isEqualToString:@"InstallASAP"];
    if ((v22 & 1) == 0 && (v23 & 1) == 0)
    {
      uint64_t v24 = *(NSObject **)(DMCLogObjects() + 8);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      id v25 = "Rejected software update due to install action being non-default, non-download only nor immediate install actions.";
      goto LABEL_26;
    }
  }
  uint64_t v26 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v11 = "MDM Schedule OS update end.";
    uint64_t v12 = v26;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_29;
  }
LABEL_38:
}

- (void)_availableOSUpdates:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEFAULT, "Available OS update start.", buf, 2u);
  }
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __59__MDMParser__availableOSUpdates_assertion_completionBlock___block_invoke;
  v41[3] = &unk_264B9DA80;
  v41[4] = self;
  id v12 = v8;
  id v42 = v12;
  id v13 = v10;
  id v43 = v13;
  uint64_t v14 = (void (**)(void, void))MEMORY[0x230FC63F0](v41);
  if ([(MDMParser *)self _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:v14])
  {
    id v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "Can't fetch available updates due to user logged in.";
LABEL_9:
      _os_log_impl(&dword_230A49000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      goto LABEL_36;
    }
    goto LABEL_36;
  }
  uint64_t v17 = [(id)objc_opt_class() _shouldUseDelayWithRequest:v12];
  if (v17 != 2)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = @"NO";
      if (v18 == 1) {
        id v20 = @"YES";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = (uint64_t)v20;
      _os_log_impl(&dword_230A49000, v19, OS_LOG_TYPE_DEFAULT, "availableOSUpdates useDelay = %{public}@", buf, 0xCu);
    }
    BOOL v21 = v18 == 1;
    char v22 = objc_opt_new();
    [v22 setUseDelay:v21];
    char v23 = [MEMORY[0x263F39D18] systemConnection];
    id v40 = 0;
    uint64_t v24 = [v23 performRequest:v22 error:&v40];
    id v25 = v40;

    if (v24 || !v25)
    {
      if (v24)
      {
        uint64_t v30 = [v24 update];
        if (v30)
        {
          id v31 = [(id)objc_opt_class() _updateDictionaryFromUpdate:v30];
          BOOL v44 = v31;
          uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
        }
        else
        {
          uint64_t v38 = MEMORY[0x263EFFA68];
        }
        long long v34 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v46 = v38;
          _os_log_impl(&dword_230A49000, v34, OS_LOG_TYPE_DEFAULT, "Returning updates array: %{public}@", buf, 0xCu);
        }
        long long v35 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged", v38];
        uint64_t v36 = (void *)[v35 mutableCopy];

        [v36 setObject:v39 forKeyedSubscript:@"AvailableOSUpdates"];
        ((void (**)(void, void *))v14)[2](v14, v36);
        id v37 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230A49000, v37, OS_LOG_TYPE_DEFAULT, "Available OS update end.", buf, 2u);
        }

        goto LABEL_35;
      }
      if (!v25) {
        -[MDMParser _availableOSUpdates:assertion:completionBlock:]();
      }
    }
    else
    {
      uint64_t v26 = [v25 domain];
      if ([v26 isEqualToString:*MEMORY[0x263F39C60]])
      {
        uint64_t v27 = [v25 code];

        if (v27 == 2213)
        {
          uint64_t v28 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230A49000, v28, OS_LOG_TYPE_DEFAULT, "No updates available.", buf, 2u);
          }
          uint64_t v29 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
          uint64_t v30 = (void *)[v29 mutableCopy];

          [v30 setObject:MEMORY[0x263EFFA68] forKeyedSubscript:@"AvailableOSUpdates"];
          ((void (**)(void, void *))v14)[2](v14, v30);
LABEL_35:

          goto LABEL_36;
        }
      }
      else
      {
      }
    }
    uint64_t v30 = [(id)objc_opt_class() _errorFromDMFSoftwareUpdateError:v25];
    long long v32 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = (uint64_t)v30;
      _os_log_impl(&dword_230A49000, v32, OS_LOG_TYPE_ERROR, "Could not check for available iOS updates - %{public}@", buf, 0xCu);
    }
    long long v33 = +[MDMAbstractTunnelParser responseWithError:v30];
    ((void (**)(void, void *))v14)[2](v14, v33);

    goto LABEL_35;
  }
  [(MDMParser *)self _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:v14];
  id v15 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v16 = "Rejected software update due to \"use delay\" bad request.";
    goto LABEL_9;
  }
LABEL_36:
}

void __59__MDMParser__availableOSUpdates_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)_statusOfOSUpdates:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  void v36[2] = __58__MDMParser__statusOfOSUpdates_assertion_completionBlock___block_invoke;
  v36[3] = &unk_264B9DA80;
  void v36[4] = self;
  id v11 = v8;
  id v37 = v11;
  id v12 = v10;
  id v38 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x230FC63F0](v36);
  uint64_t v14 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_DEFAULT, "Status of OS update start.", buf, 2u);
  }
  if ([(MDMParser *)self _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:v13])
  {
    id v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v15, OS_LOG_TYPE_ERROR, "Can't fetch OS update status due to user logged in.", buf, 2u);
    }
  }
  else
  {
    uint64_t v16 = objc_opt_new();
    uint64_t v17 = [MEMORY[0x263F39D18] systemConnection];
    id v35 = 0;
    uint64_t v18 = [v17 performRequest:v16 error:&v35];
    id v19 = v35;

    if (v18)
    {
      id v20 = objc_opt_new();
      unint64_t v21 = [v18 status];
      if (v21 <= 2) {
        [v20 setObject:off_264B9DF88[v21] forKeyedSubscript:@"Status"];
      }
      char v22 = [v18 productKey];
      [v20 setObject:v22 forKeyedSubscript:@"ProductKey"];

      [v18 downloadPercentComplete];
      if (v23 < 1.0) {
        uint64_t v24 = MEMORY[0x263EFFA80];
      }
      else {
        uint64_t v24 = MEMORY[0x263EFFA88];
      }
      [v20 setObject:v24 forKeyedSubscript:@"IsDownloaded"];
      id v25 = NSNumber;
      [v18 downloadPercentComplete];
      uint64_t v26 = objc_msgSend(v25, "numberWithDouble:");
      [v20 setObject:v26 forKeyedSubscript:@"DownloadPercentComplete"];

      uint64_t v27 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
      uint64_t v28 = (void *)[v27 mutableCopy];

      long long v39 = v20;
      uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
      [v28 setObject:v29 forKeyedSubscript:@"OSUpdateStatus"];

      uint64_t v30 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = v18;
        _os_log_impl(&dword_230A49000, v30, OS_LOG_TYPE_DEFAULT, "OSUpdateStatus DMF raw data: %{public}@", buf, 0xCu);
      }
      id v31 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = v28;
        _os_log_impl(&dword_230A49000, v31, OS_LOG_TYPE_DEFAULT, "OSUpdateStatus response: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (!v19) {
        -[MDMParser _statusOfOSUpdates:assertion:completionBlock:]();
      }
      id v20 = [(id)objc_opt_class() _errorFromDMFSoftwareUpdateError:v19];
      long long v32 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = v20;
        _os_log_impl(&dword_230A49000, v32, OS_LOG_TYPE_ERROR, "Could not check for iOS update status - %{public}@", buf, 0xCu);
      }
      long long v33 = +[MDMAbstractTunnelParser responseWithError:v20];
      uint64_t v28 = (void *)[v33 mutableCopy];
    }
    ((void (**)(void, void *))v13)[2](v13, v28);
    long long v34 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v34, OS_LOG_TYPE_DEFAULT, "Status of OS update end.", buf, 2u);
    }
  }
}

void __58__MDMParser__statusOfOSUpdates_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

+ (id)_errorWithDomain:(id)a3 code:(int64_t)a4 descriptionKey:(id)a5 underlyingError:(id)a6 type:(id)a7
{
  id v10 = (void *)MEMORY[0x263F087E8];
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = DMCUnformattedErrorArray();
  id v15 = objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v13, a4, v14, v12, v11, 0);

  return v15;
}

+ (id)_errorFromDMFSoftwareUpdateError:(id)a3
{
  void v16[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  switch([v3 code])
  {
    case 2200:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DOWNLOAD_IN_PROGRESS";
      uint64_t v8 = 12051;
      goto LABEL_18;
    case 2201:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DOWNLOAD_COMPLETE";
      uint64_t v8 = 12052;
      goto LABEL_18;
    case 2202:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DOWNLOAD_FAILED";
      uint64_t v8 = 12057;
      goto LABEL_18;
    case 2203:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DOWNLOAD_INSUFFICIENT_NETWORK";
      uint64_t v8 = 12056;
      goto LABEL_18;
    case 2204:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DOWNLOAD_INSUFFICIENT_SPACE";
      uint64_t v8 = 12054;
      goto LABEL_18;
    case 2205:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DOWNLOAD_INSUFFICIENT_POWER";
      uint64_t v8 = 12055;
      goto LABEL_18;
    case 2206:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DOWNLOAD_REQUIRES_COMPUTER";
      uint64_t v8 = 12053;
      goto LABEL_18;
    case 2207:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_INSTALL_IN_PROGRESS";
      uint64_t v8 = 12058;
      goto LABEL_18;
    case 2208:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_INSTALL_FAILED";
      uint64_t v8 = 12062;
      goto LABEL_18;
    case 2209:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_INSTALL_INSUFFICIENT_SPACE";
      uint64_t v8 = 12060;
      goto LABEL_18;
    case 2210:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_INSTALL_INSUFFICIENT_POWER";
      uint64_t v8 = 12061;
      goto LABEL_18;
    case 2211:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_INSTALL_REQUIRES_DOWNLOAD";
      uint64_t v8 = 12059;
      goto LABEL_18;
    case 2212:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_DEVICE_PASSCODE_MUST_BE_CLEARED";
      uint64_t v8 = 12049;
      goto LABEL_18;
    case 2213:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_NO_UPDATE_AVAILABLE";
      uint64_t v8 = 12048;
      goto LABEL_18;
    case 2214:
      id v4 = objc_opt_class();
      uint64_t v5 = *MEMORY[0x263F38B10];
      uint64_t v6 = *MEMORY[0x263F38A40];
      id v7 = @"MDM_ERROR_SU_SCAN_FAILED";
      uint64_t v8 = 12050;
LABEL_18:
      id v13 = [v4 _errorWithDomain:v5 code:v8 descriptionKey:v7 underlyingError:v3 type:v6];
      break;
    default:
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F38AC0];
      uint64_t v11 = *MEMORY[0x263F08608];
      v15[0] = *MEMORY[0x263F08320];
      v15[1] = v11;
      v16[0] = @"Unknown software update error";
      v16[1] = v3;
      id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      id v13 = [v9 errorWithDomain:v10 code:3 userInfo:v12];

      break;
  }

  return v13;
}

+ (BOOL)_dmfAction:(unint64_t *)a3 fromMDMActionString:(id)a4
{
  uint64_t v5 = [a4 lowercaseString];
  uint64_t v6 = [@"DownloadOnly" lowercaseString];
  char v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    id v9 = [@"InstallASAP" lowercaseString];
    char v10 = [v5 isEqualToString:v9];

    if (v10)
    {
      unint64_t v8 = 1;
    }
    else
    {
      uint64_t v11 = [@"Default" lowercaseString];
      int v12 = [v5 isEqualToString:v11];

      if (!v12)
      {
        BOOL v13 = 0;
        goto LABEL_8;
      }
      unint64_t v8 = 2;
    }
  }
  *a3 = v8;
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

+ (id)_resolvedInstallActionStringForAction:(unint64_t)a3
{
  id v3 = @"InstallASAP";
  if (a3 != 1) {
    id v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"DownloadOnly";
  }
}

+ (unint64_t)_shouldUseDelayWithRequest:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() _useDelayFlagAllowed])
  {
    id v4 = [v3 objectForKeyedSubscript:@"UseDelay"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = [v4 BOOLValue];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (id)_statusFromError:(id)a3 action:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F39C60]];

    if (v8 && (uint64_t v9 = [v6 code], (unint64_t)(v9 - 2200) <= 0xC)) {
      char v10 = off_264B9DFA0[v9 - 2200];
    }
    else {
      char v10 = @"Idle";
    }
  }
  else
  {
    uint64_t v11 = @"Idle";
    if (a4 == 1) {
      uint64_t v11 = @"Installing";
    }
    if (a4) {
      char v10 = v11;
    }
    else {
      char v10 = @"Downloading";
    }
  }

  return v10;
}

+ (id)_updateDictionaryFromUpdate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_opt_new();
    id v5 = [v3 productKey];

    if (v5)
    {
      uint64_t v6 = [v3 productKey];
      [v4 setObject:v6 forKeyedSubscript:@"ProductKey"];
    }
    char v7 = [v3 humanReadableName];

    if (v7)
    {
      int v8 = [v3 humanReadableName];
      [v4 setObject:v8 forKeyedSubscript:@"HumanReadableName"];
    }
    uint64_t v9 = [v3 productName];

    if (v9)
    {
      char v10 = [v3 productName];
      [v4 setObject:v10 forKeyedSubscript:@"ProductName"];
    }
    uint64_t v11 = [v3 version];

    if (v11)
    {
      int v12 = [v3 version];
      [v4 setObject:v12 forKeyedSubscript:@"Version"];
    }
    BOOL v13 = [v3 build];

    if (v13)
    {
      uint64_t v14 = [v3 build];
      [v4 setObject:v14 forKeyedSubscript:@"Build"];
    }
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "downloadSize"));
    [v4 setObject:v15 forKeyedSubscript:@"DownloadSize"];

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "installSize"));
    [v4 setObject:v16 forKeyedSubscript:@"InstallSize"];

    int v17 = [v3 isCritical];
    uint64_t v18 = MEMORY[0x263EFFA80];
    uint64_t v19 = MEMORY[0x263EFFA88];
    if (v17) {
      uint64_t v20 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v20 = MEMORY[0x263EFFA80];
    }
    [v4 setObject:v20 forKeyedSubscript:@"IsCritical"];
    if ([v3 restartRequired]) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = v18;
    }
    [v4 setObject:v21 forKeyedSubscript:@"RestartRequired"];
    if ([v3 allowsInstallLater]) {
      uint64_t v22 = v19;
    }
    else {
      uint64_t v22 = v18;
    }
    [v4 setObject:v22 forKeyedSubscript:@"AllowsInstallLater"];
    if ([v3 isSplat]) {
      uint64_t v23 = v19;
    }
    else {
      uint64_t v23 = v18;
    }
    [v4 setObject:v23 forKeyedSubscript:@"IsSecurityResponse"];
    uint64_t v24 = [v3 supplementalBuild];

    if (v24)
    {
      id v25 = [v3 supplementalBuild];
      [v4 setObject:v25 forKeyedSubscript:@"SupplementalBuildVersion"];
    }
    uint64_t v26 = [v3 supplementalVersionExtra];

    if (v26)
    {
      uint64_t v27 = [v3 supplementalVersionExtra];
      [v4 setObject:v27 forKeyedSubscript:@"SupplementalOSVersionExtra"];
    }
    uint64_t v28 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

+ (BOOL)_useDelayFlagAllowed
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"MCUseSoftwareUpdateDelayFlagAllowed"];

  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = @"NO";
    if (v3) {
      id v5 = @"YES";
    }
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_INFO, "useDelayFlagAllowed = %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v3;
}

- (id)_responseForMalformedUpdateRequest
{
  void v10[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x263F38A40], 0);

  v9[0] = @"ProductKey";
  v9[1] = @"InstallAction";
  v10[0] = &stru_26E549450;
  v10[1] = @"Error";
  void v10[2] = @"Idle";
  v9[2] = @"Status";
  void v9[3] = @"ErrorChain";
  uint64_t v6 = [(id)objc_opt_class() errorChainFromError:v5];
  v10[3] = v6;
  int v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (BOOL)_rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([MEMORY[0x263F38BA0] isSharediPad])
  {
    id v5 = [(id)DMCUMUserManagerClass() sharedManager];
    uint64_t v6 = [v5 currentUser];
    char v7 = [v6 isLoginUser];
    char v8 = v7 ^ 1;

    if (v4 && (v7 & 1) == 0)
    {
      uint64_t v9 = [(MDMParser *)self _softwareUpdatesNotPermittedWithLoggedInUserError];
      char v10 = +[MDMAbstractTunnelParser responseWithError:v9];

      v4[2](v4, v10);
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void (**)(id, id))a3;
    id v4 = +[MDMParser malformedRequestErrorResult];
    id v5 = (id)[v4 mutableCopy];

    v3[2](v3, v5);
  }
}

- (id)_softwareUpdatesNotPermittedWithLoggedInUserError
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  id v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12077, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (void)_sendAnalyticsMDMCommandEventWithRequest:(id)a3 response:(id)a4
{
  if (a3 && a4)
  {
    uint64_t v6 = (void *)MEMORY[0x263F52808];
    id v7 = a4;
    id v8 = a3;
    id v12 = [v6 sharedConfiguration];
    uint64_t v9 = [MEMORY[0x263F52810] sharedConfiguration];
    char v10 = [(MDMParser *)self _analyticsCommandNameFromRequest:v8];
    uint64_t v11 = [(MDMParser *)self _analyticsErrorFromResponse:v7];

    [(MDMParser *)self _analyticsRequiresNetworkTetheringFromRequest:v8];
    [v12 isTeslaEnrolled];
    [v12 isSupervised];
    [v9 isUserEnrollment];
    [MEMORY[0x263F38BA0] isSharediPad];
    MDMAnalyticsSendCommandEvent(v10, v11);
  }
}

- (id)_analyticsCommandNameFromRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"RequestType"];
  if ([v4 isEqualToString:@"InstallApplication"])
  {
    id v5 = [v3 objectForKeyedSubscript:@"Options"];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"PurchaseMethod"];
    if ([v6 intValue] == 1) {
      id v7 = @"%@.vpp";
    }
    else {
      id v7 = @"%@.legacy";
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", v7, v4);

    id v4 = (void *)v8;
  }

  return v4;
}

- (BOOL)_analyticsRequiresNetworkTetheringFromRequest:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"RequestRequiresNetworkTether"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_analyticsErrorFromResponse:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"ErrorObject"];
}

+ (id)errorChainFromError:(id)a3
{
  id v3 = a3;
  char v4 = objc_opt_new();
  id v15 = v3;
  if (v15)
  {
    uint64_t v5 = *MEMORY[0x263F08608];
    uint64_t v6 = v15;
    do
    {
      id v7 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v8 = [v6 userInfo];
      uint64_t v9 = [v6 localizedDescription];
      [v7 DMCSetObjectIfNotNil:v9 forKey:@"LocalizedDescription"];

      char v10 = [v6 domain];
      [v7 DMCSetObjectIfNotNil:v10 forKey:@"ErrorDomain"];

      uint64_t v11 = [v6 DMCUSEnglishDescription];
      [v7 DMCSetObjectIfNotNil:v11 forKey:@"USEnglishDescription"];

      id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
      [v7 setObject:v12 forKey:@"ErrorCode"];

      [v4 addObject:v7];
      uint64_t v13 = [v8 objectForKey:v5];

      uint64_t v6 = (void *)v13;
    }
    while (v13);
  }

  return v4;
}

+ (id)malformedRequestErrorResult
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  char v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x263F38A40], 0);
  uint64_t v6 = +[MDMAbstractTunnelParser responseWithError:v5];

  return v6;
}

- (id)_invalidRequestTypeError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12021, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (id)_notAuthorizedError
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12007, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_notManagedErrorAppID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12038, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (id)_invalidRequestTypeInMDMLostModeError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12078, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (id)_invalidRequestTypeInSingleAppModeError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12084, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (id)_notNetworkTetheredError
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12081, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_installApplicationCouldNotModifyDDMAppsError
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (id)_managedByDDMError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B10];
  uint64_t v5 = DMCErrorArray();
  uint64_t v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12126, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (id)_appAttributesWithRequestedAttributes:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F38B70] forceAppInstallUnremovability])
  {
    if (v3)
    {
      uint64_t v4 = (void *)[v3 mutableCopy];
    }
    else
    {
      uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    }
    uint64_t v5 = v4;
    [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F52A70]];

    id v3 = v5;
  }
  return v3;
}

- (id)_appManagementFlagsWithRequestedFlags:(id)a3
{
  uint64_t v3 = [a3 unsignedIntegerValue];
  uint64_t v4 = v3 | [MEMORY[0x263F38B70] forceAppRemovalOnUnenroll];
  uint64_t v5 = NSNumber;
  return (id)[v5 numberWithUnsignedInteger:v4];
}

- (BOOL)_isPurchaseMethodAllowed:(int)a3 onUserEnrollment:(BOOL)a4
{
  BOOL result = a3 == 1;
  if (a3 != 1 && !a4)
  {
    if ([MEMORY[0x263F38B98] isAppleTV]) {
      return 0;
    }
    else {
      return [MEMORY[0x263F38B98] isVisionDevice] ^ 1;
    }
  }
  return result;
}

- (BOOL)_isChlorineEligible
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int domain_answer = os_eligibility_get_domain_answer();
  uint64_t v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (domain_answer)
  {
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v7) = domain_answer;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_ERROR, "Eligibility check failed with error code: %d", buf, 8u);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = 0;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEBUG, "isChlorineEligible: %llu", buf, 0xCu);
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (MDMServerCore)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (MDMServerCore *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (BOOL)isChaperoned
{
  return self->_isChaperoned;
}

- (BOOL)isMDM
{
  return self->_isMDM;
}

- (void)setIsMDM:(BOOL)a3
{
  self->_isMDM = a3;
}

- (NSString)managingProfileIdentifier
{
  return self->_managingProfileIdentifier;
}

- (void)setManagingProfileIdentifier:(id)a3
{
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (MDMBackupManager)backupManagerForMainPersona
{
  return self->_backupManagerForMainPersona;
}

- (void)setBackupManagerForMainPersona:(id)a3
{
}

- (MDMBackupManager)backupManagerForEnterprisePersona
{
  return self->_backupManagerForEnterprisePersona;
}

- (void)setBackupManagerForEnterprisePersona:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManagerForEnterprisePersona, 0);
  objc_storeStrong((id *)&self->_backupManagerForMainPersona, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_managingProfileIdentifier, 0);
  objc_destroyWeak((id *)&self->_server);
}

- (void)_availableOSUpdates:assertion:completionBlock:.cold.1()
{
  __assert_rtn("-[MDMParser _availableOSUpdates:assertion:completionBlock:]", "MDMParser.m", 6197, "dmfError != nil");
}

- (void)_statusOfOSUpdates:assertion:completionBlock:.cold.1()
{
  __assert_rtn("-[MDMParser _statusOfOSUpdates:assertion:completionBlock:]", "MDMParser.m", 6251, "dmfError != nil");
}

@end