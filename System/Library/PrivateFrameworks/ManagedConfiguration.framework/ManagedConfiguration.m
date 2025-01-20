void sub_1A13F235C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A13F39F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MCHasMigrated()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v0 = migrationCheckQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MCHasMigrated_block_invoke;
  block[3] = &unk_1E5A67EE8;
  block[4] = &v4;
  dispatch_sync(v0, block);

  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

id migrationCheckQueue()
{
  if (migrationCheckQueue_onceToken != -1) {
    dispatch_once(&migrationCheckQueue_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)migrationCheckQueue_queue;
  return v0;
}

id MCEffectiveUserSettingsFilePath()
{
  if (MCEffectiveUserSettingsFilePath_once != -1) {
    dispatch_once(&MCEffectiveUserSettingsFilePath_once, &__block_literal_global_243);
  }
  v0 = (void *)MCEffectiveUserSettingsFilePath_str;
  return v0;
}

id MCPublicEffectiveUserSettingsFilePath()
{
  if (MCPublicEffectiveUserSettingsFilePath_once != -1) {
    dispatch_once(&MCPublicEffectiveUserSettingsFilePath_once, &__block_literal_global_248);
  }
  v0 = (void *)MCPublicEffectiveUserSettingsFilePath_str;
  return v0;
}

void __MCProfileConnectionXPCProtocolInterface_block_invoke()
{
  v19[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF4D3948];
  uint64_t v1 = (void *)MCProfileConnectionXPCProtocolInterface_interface;
  MCProfileConnectionXPCProtocolInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  v19[3] = objc_opt_class();
  v19[4] = objc_opt_class();
  v19[5] = objc_opt_class();
  v19[6] = objc_opt_class();
  v19[7] = objc_opt_class();
  v19[8] = objc_opt_class();
  v19[9] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:10];
  uint64_t v4 = [v2 setWithArray:v3];

  uint64_t v18 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  uint64_t v6 = [v4 setByAddingObjectsFromArray:v5];

  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidUpdateStatus_completion_ argumentIndex:0 ofReply:1];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidBeginInstallingNextProfileData_completion_ argumentIndex:0 ofReply:1];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidFinishInstallationWithIdentifier_error_completion_ argumentIndex:1 ofReply:0];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidFinishInstallationWithIdentifier_error_completion_ argumentIndex:0 ofReply:1];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v4 forSelector:sel_doMCICDidRequestUserInput_completion_ argumentIndex:0 ofReply:1];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidRequestUserInput_completion_ argumentIndex:3 ofReply:1];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidRequestMAIDSignIn_personaID_completion_ argumentIndex:1 ofReply:1];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidRequestManagedRestoreWithManagedAppleID_personaID_completion_ argumentIndex:1 ofReply:1];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidFinishPreflightWithError_completion_ argumentIndex:0 ofReply:0];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidFinishPreflightWithError_completion_ argumentIndex:3 ofReply:1];
  char v7 = (void *)MCProfileConnectionXPCProtocolInterface_interface;
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v10 = [v8 setWithArray:v9];
  [v7 setClasses:v10 forSelector:sel_doMCICDidRequestShowUserWarnings_completion_ argumentIndex:1 ofReply:0];

  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidRequestShowUserWarnings_completion_ argumentIndex:1 ofReply:1];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:3];
  v13 = objc_msgSend(v11, "setWithArray:", v12, v14, v15);

  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v13 forSelector:sel_doMCICDidRequestShowUserWarnings_completion_ argumentIndex:0 ofReply:0];
  [(id)MCProfileConnectionXPCProtocolInterface_interface setClasses:v6 forSelector:sel_doMCICDidRequestCurrentPasscodeWithCompletion_ argumentIndex:2 ofReply:1];
}

uint64_t MCGestaltHasSMSCapability()
{
  return MEMORY[0x1F417CE00](@"sms");
}

void __MCXPCProtocolInterface_block_invoke()
{
  v8[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF4F1BF0];
  uint64_t v1 = (void *)MCXPCProtocolInterface_interface;
  MCXPCProtocolInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  v8[6] = objc_opt_class();
  v8[7] = objc_opt_class();
  v8[8] = objc_opt_class();
  v8[9] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:10];
  uint64_t v4 = [v2 setWithArray:v3];

  uint64_t v7 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  uint64_t v6 = [v4 setByAddingObjectsFromArray:v5];

  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_checkInWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_checkCarrierProfileAndForceReinstallation_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_allowedOpenInAppBundleIDs_originatingAppBundleID_originatingIsManaged_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_allowedImportFromAppBundleIDs_importingAppBundleID_importingIsManaged_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_hasMailAccountsWithFilteringEnabled_sourceAccountManagement_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setAutoCorrectionAllowed_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setSmartPunctuationAllowed_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setPredictiveKeyboardAllowed_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setContinuousPathKeyboardAllowed_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setKeyboardShortcutsAllowed_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setSpellCheckAllowed_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setAllowedURLStrings_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_waitForMigrationIncludingPostRestoreMigration_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_notifyDeviceUnlockedAndPasscodeRequiredWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_notifyDeviceUnlockedWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_verifiedMDMProfileIdentifierWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_installProfileData_interactive_options_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_appleConnect_installMDMAssociatedProfileData_interactive_options_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_queueProfileDataForInstallation_originalFileName_originatingBundleID_transitionToUI_completion_ argumentIndex:2 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_popProfileDataFromHeadOfInstallationQueueWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_peekProfileDataFromPurgatoryForDeviceType_withCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_updateProfileIdentifier_interactive_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeProfileWithIdentifier_installationType_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeProtectedProfileWithIdentifier_installationType_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_completion_ argumentIndex:2 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_clearRecoveryPasscodeWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_changePasscode_oldPasscode_isRecovery_skipRecovery_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_clearPasscodeWithEscrowKeybagData_secret_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_isPasscodeCompliantWithNamedPolicy_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeOrphanedClientRestrictionsWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_managedSystemConfigurationServiceIDsWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_managedWiFiNetworkNamesWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_migrateWithContext_passcodeWasSetInBackup_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_migrateCleanupMigratorWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeBoolSetting_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeValueSetting_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_openSensitiveURL_unlock_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_storeCertificateData_forIPCUIdentifier_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_installProvisioningProfileData_managingProfileIdentifier_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeProvisioningProfileWithUUID_managingProfileIdentifier_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_provisiongProfileUUIDsForSignerIdentity_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_isBundleBlocked_completion_ argumentIndex:3 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_areBundlesBlocked_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_notifyStartComplianceTimer_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_notifyHaveSeenComplianceMessageWithLastLockDate_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_recomputeUserComplianceWarningWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_recomputeUserComplianceWarningWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_recomputePerClientUserComplianceWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_resetAllSettingsToDefaultsIsUserInitiated_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setUserInfo_forClientUUID_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeExpiredProfilesWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_storeProfileData_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_storedProfileDataWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_markStoredProfileAsInstalledWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_rereadManagedAppAttributesWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_reducedMachineInfoDataWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_cloudConfigurationMachineInfoDataWithAdditionalInfo_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_cloudConfigurationStoreDetails_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_createActivationLockBypassCodeWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_storeActivationRecord_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_setUserBookmarks_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_validateAppBundleIDs_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_managingOrganizationInformationWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_debugRescheduleBackgroundActivity_startDate_gracePeriod_repeatingInterval_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_unstageMDMEnrollmentInfoForPairingWatchWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_applyPairingWatchMDMEnrollmentData_completion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_updateMDMEnrollmentInfoForPairingWatch_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removePostSetupAutoInstallSetAsideProfileWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_removeSetAsideCloudConfigurationProfileWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_effectiveBoolValueForWatchSetting_pairingID_pairingDataStore_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_effectiveValueForWatchSetting_pairingID_pairingDataStore_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_effectiveValuesForWatchIntersectionSetting_pairingID_pairingDataStore_completion_ argumentIndex:1 ofReply:1];
  [(id)MCXPCProtocolInterface_interface setClasses:v6 forSelector:sel_effectiveValuesForWatchUnionSetting_pairingID_pairingDataStore_completion_ argumentIndex:1 ofReply:1];
}

void MCFeatureSetBoolSetting(void *a1, void *a2, uint64_t a3)
{
  id v8 = a1;
  id v5 = a2;
  uint64_t v6 = [v8 objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [v8 setObject:v6 forKeyedSubscript:v5];
  }
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [v6 setObject:v7 forKeyedSubscript:@"value"];
}

uint64_t MCSendSettingsChangedNotification()
{
  uint64_t v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.settingschanged" cStringUsingEncoding:4]);
}

id notificationQueue()
{
  if (notificationQueue_onceToken != -1) {
    dispatch_once(&notificationQueue_onceToken, &__block_literal_global_131);
  }
  uint64_t v0 = (void *)notificationQueue_queue;
  return v0;
}

void MCLoggingInitialize()
{
  if (MCLoggingInitialize_onceToken != -1) {
    dispatch_once(&MCLoggingInitialize_onceToken, &__block_literal_global_0);
  }
}

id MCUserNotificationSettingsFilePath()
{
  if (MCUserNotificationSettingsFilePath_once != -1) {
    dispatch_once(&MCUserNotificationSettingsFilePath_once, &__block_literal_global_241);
  }
  uint64_t v0 = (void *)MCUserNotificationSettingsFilePath_str;
  return v0;
}

id MCSystemNotificationSettingsFilePath()
{
  if (MCSystemNotificationSettingsFilePath_once != -1) {
    dispatch_once(&MCSystemNotificationSettingsFilePath_once, &__block_literal_global_194);
  }
  uint64_t v0 = (void *)MCSystemNotificationSettingsFilePath_str;
  return v0;
}

uint64_t MCEqualStrings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] || objc_msgSend(v4, "length")) {
    uint64_t v5 = [v3 isEqualToString:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void __MCConfigurationProfilesSystemGroupContainer_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = MCSystemGroupContainerPathWithGroupIdentifier(@"systemgroup.com.apple.configurationprofiles");
  uint64_t v1 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v0;

  if (MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath)
  {
    if ([(id)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath isEqualToString:@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles"])return; {
    uint64_t v2 = _MCLogObjects;
    }
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v9 = 138543618;
      *(void *)&v9[4] = @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
      id v3 = "Received a profile system group container path we weren't expecting\n"
           "Expected: %{public}@\n"
           "Actual: %{public}@\n"
           "Overriding MCM with expected path";
      id v4 = v2;
      uint32_t v5 = 22;
LABEL_7:
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_FAULT, v3, v9, v5);
    }
  }
  else
  {
    uint64_t v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v9 = 138543362;
      *(void *)&v9[4] = @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
      id v3 = "Failed to get profile system group container path. Overriding with expected path: %{public}@";
      id v4 = v6;
      uint32_t v5 = 12;
      goto LABEL_7;
    }
  }
  uint64_t v7 = objc_msgSend(@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles", "copy", *(_OWORD *)v9, *(void *)&v9[16], v10);
  id v8 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath = v7;
}

id MCSystemGroupContainerPathWithGroupIdentifier(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  [v1 UTF8String];
  uint64_t v2 = container_system_group_path_for_identifier();
  id v3 = _MCLogObjects;
  if (v2)
  {
    id v4 = (void *)v2;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v8 = v1;
      __int16 v9 = 2082;
      uint64_t v10 = (uint64_t)v4;
      _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEFAULT, "Got system group container path from MCM for %{public}@: %{public}s", buf, 0x16u);
    }
    uint32_t v5 = [NSString stringWithCString:v4 encoding:4];
    free(v4);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v8 = v1;
      __int16 v9 = 2048;
      uint64_t v10 = 1;
      _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_ERROR, "Error getting system group container for %{public}@: %llu", buf, 0x16u);
    }
    uint32_t v5 = 0;
  }

  return v5;
}

id MCRestrictionsFilePath()
{
  if (MCRestrictionsFilePath_once != -1) {
    dispatch_once(&MCRestrictionsFilePath_once, &__block_literal_global_56_0);
  }
  uint64_t v0 = (void *)MCRestrictionsFilePath_str;
  return v0;
}

id MCSystemUserSettingsFilePath()
{
  if (MCSystemUserSettingsFilePath_once != -1) {
    dispatch_once(&MCSystemUserSettingsFilePath_once, &__block_literal_global_76);
  }
  uint64_t v0 = (void *)MCSystemUserSettingsFilePath_str;
  return v0;
}

void sub_1A13F8E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A13F9290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MCHasMigrated_block_invoke(uint64_t a1)
{
  if (!kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated)
  {
    id v3 = MCProductBuildVersion();
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint32_t v5 = MCLegacyMetadataFilePath();
    int v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated = 0;
LABEL_19:

      char v2 = kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated;
      goto LABEL_20;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9B8];
    id v8 = MCSystemMetadataFilePath();
    __int16 v9 = [v7 dataWithContentsOfFile:v8];

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v9 options:0 format:0 error:0];
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
LABEL_10:
        uint64_t v11 = [v10 objectForKey:@"LastMigratedBuild"];

        if (![v11 isEqualToString:v3])
        {
          kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated = 0;
          goto LABEL_18;
        }
        v12 = (void *)MEMORY[0x1E4F1C9B8];
        v13 = MCUserMetadataFilePath();
        uint64_t v14 = [v12 dataWithContentsOfFile:v13];

        if (v14)
        {
          uint64_t v15 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v14 options:0 format:0 error:0];
          if (!v15) {
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_16;
          }
        }
        uint64_t v15 = 0;
LABEL_16:
        uint64_t v16 = [v15 objectForKey:@"LastMigratedBuild"];

        kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_migrationCheckQueueHasMigrated = [v16 isEqualToString:v3];
LABEL_18:

        goto LABEL_19;
      }
    }
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  char v2 = 1;
LABEL_20:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
}

id MCUserMetadataFilePath()
{
  if (MCUserMetadataFilePath_once != -1) {
    dispatch_once(&MCUserMetadataFilePath_once, &__block_literal_global_98);
  }
  uint64_t v0 = (void *)MCUserMetadataFilePath_str;
  return v0;
}

id MCSystemMetadataFilePath()
{
  if (MCSystemMetadataFilePath_once != -1) {
    dispatch_once(&MCSystemMetadataFilePath_once, &__block_literal_global_96);
  }
  uint64_t v0 = (void *)MCSystemMetadataFilePath_str;
  return v0;
}

id MCProductBuildVersion()
{
  uint64_t v0 = (void *)_productBuildVersion;
  if (!_productBuildVersion)
  {
    _fillInProductVersions();
    uint64_t v0 = (void *)_productBuildVersion;
  }
  return v0;
}

void _fillInProductVersions()
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  uint64_t v0 = [v4 objectForKey:@"ProductVersion"];
  id v1 = (void *)_productVersion;
  _productVersion = v0;

  uint64_t v2 = [v4 objectForKey:@"ProductBuildVersion"];
  id v3 = (void *)_productBuildVersion;
  _productBuildVersion = v2;
}

id MCLegacyMetadataFilePath()
{
  if (MCLegacyMetadataFilePath_once != -1) {
    dispatch_once(&MCLegacyMetadataFilePath_once, &__block_literal_global_91);
  }
  uint64_t v0 = (void *)MCLegacyMetadataFilePath_str;
  return v0;
}

uint64_t __notificationQueue_block_invoke()
{
  notificationQueue_queue = (uint64_t)dispatch_queue_create("MC notification queue", 0);
  return MEMORY[0x1F41817F8]();
}

void __UserManagementBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/UserManagement.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_329];
}

id URLForCanonicalFilePath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MCSystemRootDirectory();
  id v3 = [v2 stringByAppendingPathComponent:v1];

  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];

  return v4;
}

__CFString *MCSystemRootDirectory()
{
  return @"/";
}

uint64_t MCSetSkipBackupAttributeToItemAtPath(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  if (v4
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        uint32_t v5 = objc_claimAutoreleasedReturnValue(),
        [v4 path],
        int v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 fileExistsAtPath:v6],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v22 = 0;
    uint64_t v8 = *MEMORY[0x1E4F1C630];
    uint64_t v9 = [v4 getResourceValue:&v22 forKey:*MEMORY[0x1E4F1C630] error:0];
    id v10 = v22;
    uint64_t v11 = v10;
    if (v9 && [v10 BOOLValue] == a2)
    {
      uint64_t v15 = 0;
    }
    else
    {
      v12 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
      id v21 = 0;
      int v13 = [v4 setResourceValue:v12 forKey:v8 error:&v21];
      id v14 = v21;

      if (!v13 || (uint64_t v15 = 0, v14))
      {
        uint64_t v16 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v17 = v16;
          uint64_t v18 = [v4 path];
          *(_DWORD *)buf = 138543618;
          id v24 = v18;
          __int16 v25 = 2114;
          id v26 = v14;
          _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup %{public}@", buf, 0x16u);
        }
        uint64_t v15 = v14;
      }
    }
  }
  else
  {
    v19 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v3;
      _os_log_impl(&dword_1A13F0000, v19, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup. Path does not exist.", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

void __UserManagementBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __MCRestrictionsFilePath_block_invoke()
{
  MCUserPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 stringByAppendingPathComponent:@"Truth.plist"];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)MCRestrictionsFilePath_str;
  MCRestrictionsFilePath_str = v1;
}

void __MCSystemPublicInfoDirectory_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v3 stringByAppendingPathComponent:@"PublicInfo"];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)MCSystemPublicInfoDirectory_str;
  MCSystemPublicInfoDirectory_str = v1;
}

id MCSystemProfileStorageDirectory()
{
  if (MCSystemProfileStorageDirectory_once != -1) {
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_27);
  }
  id v0 = (void *)MCSystemProfileStorageDirectory_str;
  return v0;
}

void __MCLegacyPublicInfoDirectory_block_invoke()
{
  id v2 = [@"/var/mobile/" stringByAppendingPathComponent:@"Library/ConfigurationProfiles/PublicInfo"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)MCLegacyPublicInfoDirectory_str;
  MCLegacyPublicInfoDirectory_str = v0;
}

void __MCSystemProfileStorageDirectory_block_invoke()
{
  MCSystemProfileLibraryDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"ConfigurationProfiles"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemProfileStorageDirectory_str;
  MCSystemProfileStorageDirectory_str = v1;
}

id MCSystemProfileLibraryDirectory()
{
  if (MCSystemProfileLibraryDirectory_once != -1) {
    dispatch_once(&MCSystemProfileLibraryDirectory_once, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)MCSystemProfileLibraryDirectory_str;
  return v0;
}

void __MCLegacyMetadataFilePath_block_invoke()
{
  MCLegacyPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MCMeta.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCLegacyMetadataFilePath_str;
  MCLegacyMetadataFilePath_str = v1;
}

id MCLegacyPublicInfoDirectory()
{
  if (MCLegacyPublicInfoDirectory_once != -1) {
    dispatch_once(&MCLegacyPublicInfoDirectory_once, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)MCLegacyPublicInfoDirectory_str;
  return v0;
}

void __MCUserProfileStorageDirectory_block_invoke()
{
  MCUserProfileLibraryDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"UserConfigurationProfiles"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserProfileStorageDirectory_str;
  MCUserProfileStorageDirectory_str = v1;
}

id MCUserProfileLibraryDirectory()
{
  if (MCUserProfileLibraryDirectory_once != -1) {
    dispatch_once(&MCUserProfileLibraryDirectory_once, &__block_literal_global_37);
  }
  uint64_t v0 = (void *)MCUserProfileLibraryDirectory_str;
  return v0;
}

void __MCSystemProfileLibraryDirectory_block_invoke()
{
  MCConfigurationProfilesSystemGroupContainer();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"Library"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemProfileLibraryDirectory_str;
  MCSystemProfileLibraryDirectory_str = v1;
}

id MCConfigurationProfilesSystemGroupContainer()
{
  if (MCConfigurationProfilesSystemGroupContainer_onceToken != -1) {
    dispatch_once(&MCConfigurationProfilesSystemGroupContainer_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
  return v0;
}

void __MCUserPublicInfoDirectory_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PublicInfo"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserPublicInfoDirectory_str;
  MCUserPublicInfoDirectory_str = v1;
}

void __MCEffectiveUserSettingsFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"EffectiveUserSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCEffectiveUserSettingsFilePath_str;
  MCEffectiveUserSettingsFilePath_str = v1;
}

id MCUserProfileStorageDirectory()
{
  if (MCUserProfileStorageDirectory_once != -1) {
    dispatch_once(&MCUserProfileStorageDirectory_once, &__block_literal_global_39);
  }
  uint64_t v0 = (void *)MCUserProfileStorageDirectory_str;
  return v0;
}

void __MCPublicEffectiveUserSettingsFilePath_block_invoke()
{
  MCUserPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PublicEffectiveUserSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCPublicEffectiveUserSettingsFilePath_str;
  MCPublicEffectiveUserSettingsFilePath_str = v1;
}

void __MCUserMetadataFilePath_block_invoke()
{
  MCUserPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MCMeta.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserMetadataFilePath_str;
  MCUserMetadataFilePath_str = v1;
}

id MCUserPublicInfoDirectory()
{
  if (MCUserPublicInfoDirectory_once != -1) {
    dispatch_once(&MCUserPublicInfoDirectory_once, &__block_literal_global_44);
  }
  uint64_t v0 = (void *)MCUserPublicInfoDirectory_str;
  return v0;
}

void __MCSystemMetadataFilePath_block_invoke()
{
  MCSystemPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MCMeta.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemMetadataFilePath_str;
  MCSystemMetadataFilePath_str = v1;
}

void __MCUserProfileLibraryDirectory_block_invoke()
{
  id v2 = [@"/var/mobile/" stringByAppendingPathComponent:@"Library"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)MCUserProfileLibraryDirectory_str;
  MCUserProfileLibraryDirectory_str = v0;
}

id MCSystemPublicInfoDirectory()
{
  if (MCSystemPublicInfoDirectory_once != -1) {
    dispatch_once(&MCSystemPublicInfoDirectory_once, &__block_literal_global_32);
  }
  uint64_t v0 = (void *)MCSystemPublicInfoDirectory_str;
  return v0;
}

void __migrationCheckQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("MC migration check queue", v2);
  uint64_t v1 = (void *)migrationCheckQueue_queue;
  migrationCheckQueue_queue = (uint64_t)v0;
}

id MCContainingBundleIDForBundleID(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v1];
  id v3 = v2;
  id v4 = v1;
  if (v2)
  {
    uint32_t v5 = [v2 containingBundle];
    int v6 = [v5 bundleIdentifier];

    id v4 = v1;
    if (v6)
    {
      id v4 = v6;
    }
  }

  return v4;
}

BOOL MCIsAppAccountBasedForDragDrop(void *a1)
{
  id v1 = a1;
  if (MCAccountBasedAppsForDragDrop_onceToken != -1) {
    dispatch_once(&MCAccountBasedAppsForDragDrop_onceToken, &__block_literal_global_1350);
  }
  BOOL v2 = ([(id)MCAccountBasedAppsForDragDrop_accountBasedApps containsObject:v1] & 1) != 0
    || MCIsAppBasicallySafari(v1);

  return v2;
}

void sub_1A13FCAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

uint64_t MCGestaltHasSEP()
{
  return MEMORY[0x1F417CE00](@"HasSEP");
}

uint64_t __MCLoggingInitialize_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ManagedConfiguration", "MC");
  id v1 = (void *)_MCLogObjects;
  _MCLogObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.ManagedConfiguration", "MDM");
  id v3 = (void *)qword_1EB222378;
  qword_1EB222378 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.ManagedConfiguration", "profiled");
  uint32_t v5 = (void *)qword_1EB222380;
  qword_1EB222380 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.ManagedConfiguration", "PIH");
  char v7 = (void *)qword_1EB222388;
  qword_1EB222388 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.ManagedConfiguration", "OpenIn");
  uint64_t v9 = (void *)qword_1EB222390;
  qword_1EB222390 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.ManagedConfiguration", "passcodenagd");
  uint64_t v11 = (void *)qword_1EB2223A0;
  qword_1EB2223A0 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.ManagedConfiguration", "ProfileEvents");
  int v13 = (void *)qword_1EB222398;
  qword_1EB222398 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.ManagedConfiguration", "Assertions");
  uint64_t v15 = (void *)qword_1EB2223A8;
  qword_1EB2223A8 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.ManagedConfiguration", "ProfileConnection");
  v17 = (void *)qword_1EB2223B0;
  qword_1EB2223B0 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.ManagedConfiguration", "MCInstaller");
  v19 = (void *)qword_1EB2223B8;
  qword_1EB2223B8 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.ManagedConfiguration", "File");
  id v21 = (void *)qword_1EB2223C0;
  qword_1EB2223C0 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.ManagedConfiguration", "UPPTrust");
  v23 = (void *)qword_1EB2223C8;
  qword_1EB2223C8 = (uint64_t)v22;

  qword_1EB2223D0 = (uint64_t)os_log_create("com.apple.ManagedConfiguration", "Migration");
  return MEMORY[0x1F41817F8]();
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A13FE354(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A13FE508(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id MCXPCProtocolInterface()
{
  if (MCXPCProtocolInterface_onceToken != -1) {
    dispatch_once(&MCXPCProtocolInterface_onceToken, &__block_literal_global_45);
  }
  os_log_t v0 = (void *)MCXPCProtocolInterface_interface;
  return v0;
}

id MCProfileConnectionXPCProtocolInterface()
{
  if (MCProfileConnectionXPCProtocolInterface_onceToken != -1) {
    dispatch_once(&MCProfileConnectionXPCProtocolInterface_onceToken, &__block_literal_global_32);
  }
  os_log_t v0 = (void *)MCProfileConnectionXPCProtocolInterface_interface;
  return v0;
}

id MCUserUserSettingsFilePath()
{
  if (MCUserUserSettingsFilePath_once != -1) {
    dispatch_once(&MCUserUserSettingsFilePath_once, &__block_literal_global_233);
  }
  os_log_t v0 = (void *)MCUserUserSettingsFilePath_str;
  return v0;
}

id MCUserNamespacedUserSettingsFilePath()
{
  if (MCUserNamespacedUserSettingsFilePath_once != -1) {
    dispatch_once(&MCUserNamespacedUserSettingsFilePath_once, &__block_literal_global_235);
  }
  os_log_t v0 = (void *)MCUserNamespacedUserSettingsFilePath_str;
  return v0;
}

id MCSystemNamespacedUserSettingsFilePath()
{
  if (MCSystemNamespacedUserSettingsFilePath_once != -1) {
    dispatch_once(&MCSystemNamespacedUserSettingsFilePath_once, &__block_literal_global_81);
  }
  os_log_t v0 = (void *)MCSystemNamespacedUserSettingsFilePath_str;
  return v0;
}

uint64_t MCKeybagCurrentPasscodeGracePeriod()
{
  GracePeriod = (void *)MKBDeviceGetGracePeriod();
  id v1 = [GracePeriod objectForKeyedSubscript:@"GracePeriod"];
  uint64_t v2 = [v1 unsignedLongValue];

  return v2;
}

uint64_t MCKeybagCurrentMaximumFailedPasscodeAttempts()
{
  os_log_t v0 = _MCKeybagDeviceConfigurations();
  id v1 = [v0 objectForKeyedSubscript:*MEMORY[0x1E4F780F8]];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

id _MCKeybagDeviceConfigurations()
{
  os_log_t v0 = (void *)MKBGetDeviceConfigurations();
  return v0;
}

id MCUMUserManagerClass()
{
  if (MCUMUserManagerClass_onceToken != -1) {
    dispatch_once(&MCUMUserManagerClass_onceToken, &__block_literal_global_241_0);
  }
  os_log_t v0 = (void *)MCUMUserManagerClass_theClass;
  return v0;
}

id MCLocalizedErrorFormatByDevice(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  os_log_t v12 = MCLocalizedErrorStringByDevice(v10);

  int v13 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  os_log_t v14 = (void *)[v11 initWithFormat:v12 locale:v13 arguments:&a9];

  return v14;
}

id MCLocalizedErrorStringByDevice(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MCGestaltGetDeviceClass();
  uint64_t v3 = MCLocalizedStringForDevice(v1, (void *)1, v2);

  return v3;
}

id MCLocalizedStringForDevice(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  os_log_t v6 = v5;
  if (a3)
  {
    char v7 = NSString;
    os_log_t v8 = [a3 uppercaseString];
    uint64_t v9 = [v7 stringWithFormat:@"%@_%@", v6, v8];

    id v10 = _MCLocalizedStringForDomain(v9, a2);
    if ([v10 isEqualToString:v9])
    {
      _MCLocalizedStringForDomain(v6, a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = v10;
    }
    os_log_t v12 = v11;
  }
  else
  {
    os_log_t v12 = _MCLocalizedStringForDomain(v5, a2);
  }

  return v12;
}

id _MCLocalizedStringForDomain(void *a1, void *a2)
{
  id v3 = a1;
  os_log_t v4 = v3;
  switch((unint64_t)a2)
  {
    case 0uLL:
      id v5 = @"Payloads";
      goto LABEL_4;
    case 1uLL:
      id v5 = @"Errors";
LABEL_4:
      uint64_t v6 = MCLocalizedStringInTable(v3, v5);
      goto LABEL_7;
    case 2uLL:
      uint64_t v6 = MCLocalizedAppleInternalString(v3);
      goto LABEL_7;
    case 3uLL:
      uint64_t v6 = MCUSEnglishErrorString(v3);
LABEL_7:
      a2 = (void *)v6;
      break;
    default:
      break;
  }

  return a2;
}

id MCLocalizedErrorString(void *a1)
{
  return MCLocalizedStringInTable(a1, @"Errors");
}

id _bundle()
{
  if (_bundle_once != -1) {
    dispatch_once(&_bundle_once, &__block_literal_global);
  }
  os_log_t v0 = (void *)_bundle_bundle;
  return v0;
}

__CFString *MCGestaltGetDeviceClass()
{
  os_log_t v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    os_log_t v0 = @"iPhone";
  }
  return v0;
}

void sub_1A13FF33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id MCSettingsEventsFilePath()
{
  if (MCSettingsEventsFilePath_once != -1) {
    dispatch_once(&MCSettingsEventsFilePath_once, &__block_literal_global_122);
  }
  os_log_t v0 = (void *)MCSettingsEventsFilePath_str;
  return v0;
}

id MCPasscodeNagKeepAliveFilePath()
{
  if (MCPasscodeNagKeepAliveFilePath_once != -1) {
    dispatch_once(&MCPasscodeNagKeepAliveFilePath_once, &__block_literal_global_152);
  }
  os_log_t v0 = (void *)MCPasscodeNagKeepAliveFilePath_str;
  return v0;
}

id MCOutstandingNagComputationFilePath()
{
  if (MCOutstandingNagComputationFilePath_once != -1) {
    dispatch_once(&MCOutstandingNagComputationFilePath_once, &__block_literal_global_157);
  }
  os_log_t v0 = (void *)MCOutstandingNagComputationFilePath_str;
  return v0;
}

id MCNagUIMetaFilePath()
{
  if (MCNagUIMetaFilePath_once != -1) {
    dispatch_once(&MCNagUIMetaFilePath_once, &__block_literal_global_147);
  }
  os_log_t v0 = (void *)MCNagUIMetaFilePath_str;
  return v0;
}

id MCBiometricKitClass()
{
  if (MCBiometricKitClass_onceToken != -1) {
    dispatch_once(&MCBiometricKitClass_onceToken, &__block_literal_global_301);
  }
  os_log_t v0 = (void *)MCBiometricKitClass_theClass;
  return v0;
}

void __MCUMUserManagerClass_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = UserManagementBundle();
  MCUMUserManagerClass_theClass = [v0 classNamed:@"UMUserManager"];

  if (!MCUMUserManagerClass_theClass)
  {
    id v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138543362;
      id v3 = @"UMUserManager";
      _os_log_impl(&dword_1A13F0000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v2, 0xCu);
    }
  }
}

id UserManagementBundle()
{
  if (UserManagementBundle_onceToken != -1) {
    dispatch_once(&UserManagementBundle_onceToken, &__block_literal_global_327);
  }
  os_log_t v0 = (void *)UserManagementBundle_retval;
  return v0;
}

id MCBundleIDFromAuditToken(_OWORD *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  long long v2 = a1[1];
  *(_OWORD *)buf.val = *a1;
  *(_OWORD *)&buf.val[4] = v2;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v9 = a1[1];
    *(_OWORD *)buf.val = *a1;
    *(_OWORD *)&buf.val[4] = v9;
    id v10 = SecTaskCreateWithAuditToken(v8, &buf);
    if (!v10)
    {
      uint64_t v16 = _MCLogObjects;
      if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      LOWORD(buf.val[0]) = 0;
      uint64_t v4 = "Failed to create SecTask from audit token";
      id v5 = v16;
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
      uint32_t v7 = 2;
      goto LABEL_4;
    }
    id v11 = v10;
    CFTypeRef cf = 0;
    id v21 = (id)SecTaskCopySigningIdentifier(v10, (CFErrorRef *)&cf);
    uint64_t v12 = _MCLogObjects;
    if (v21)
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        buf.val[0] = 138543362;
        *(void *)&buf.val[1] = v21;
        int v13 = "Looked up bundle ID %{public}@ using SecTask";
        os_log_t v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
LABEL_13:
        _os_log_impl(&dword_1A13F0000, v14, v15, v13, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      buf.val[0] = 138543362;
      *(void *)&buf.val[1] = cf;
      int v13 = "Failed to look up bundle ID using SecTask with error: %{public}@";
      os_log_t v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
    if (cf) {
      CFRelease(cf);
    }
    CFRelease(v11);
    goto LABEL_17;
  }
  uint64_t v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    buf.val[0] = 138543362;
    *(void *)&buf.val[1] = v21;
    uint64_t v4 = "Looked up bundle ID %{public}@ from audit token using entitlement";
    id v5 = v3;
    os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
    uint32_t v7 = 12;
LABEL_4:
    _os_log_impl(&dword_1A13F0000, v5, v6, v4, (uint8_t *)&buf, v7);
  }
LABEL_17:
  id v17 = v21;
  if (!v21)
  {
    os_log_t v18 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.val[0]) = 0;
      _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_ERROR, "Could not look up bundle identifier using audit token", (uint8_t *)&buf, 2u);
    }
  }
  return v17;
}

id MCKeybagSetMaximumFailedPasscodeAttempts(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 dataUsingEncoding:4];
  id v5 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v6 = @"Yes";
    if (!v3) {
      os_log_type_t v6 = @"No";
    }
    *(_DWORD *)audit_token_t buf = 134218242;
    uint64_t v27 = a1;
    __int16 v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_INFO, "Attempting to set maximum failed passcode attempts to %lu. Passcode present: %{public}@", buf, 0x16u);
  }
  uint64_t v24 = *MEMORY[0x1E4F780F8];
  uint32_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
  __int16 v25 = v7;
  CFAllocatorRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  uint64_t v9 = MKBSetDeviceConfigurations();
  id v10 = _MCLogObjects;
  if (v9)
  {
    uint64_t v11 = v9;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 67109120;
      LODWORD(v27) = v11;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Failed to set maximum failed passcode attempts. Error code: %d", buf, 8u);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    int v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
    id v21 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_SET_PASSCODE_ATTEMPTS_P_CODE", v14, v15, v16, v17, v18, v19, v20, v13);
    os_log_t v22 = [v12 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5018 descriptionArray:v21 errorType:@"MCFatalError"];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_INFO, "Successfully set maximum failed passcode attempts.", buf, 2u);
    }
    os_log_t v22 = 0;
  }

  return v22;
}

void __MCAccountBasedAppsForDragDrop_block_invoke()
{
  v4[18] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.mobilemail";
  v4[1] = @"com.apple.mobilecal";
  v4[2] = @"com.apple.mobilenotes";
  v4[3] = @"com.apple.MobileAddressBook";
  v4[4] = @"com.apple.MailCompositionService";
  v4[5] = @"com.apple.NanoCalendar";
  v4[6] = @"com.apple.calaccessd";
  v4[7] = @"com.apple.UpNextWidget.extension";
  v4[8] = @"com.apple.CalendarNotification.CalendarContentExtension";
  v4[9] = @"com.apple.SafariViewService";
  v4[10] = @"com.apple.reminders";
  v4[11] = @"com.apple.DocumentsApp";
  v4[12] = @"com.apple.DocumentManagerUICore.RecentsAvocado";
  v4[13] = @"com.apple.DocumentManagerUICore.Service";
  v4[14] = @"com.apple.quicklook.extension.previewUI";
  v4[15] = @"com.apple.quicklook.UIExtension";
  v4[16] = @"com.apple.DocumentManagerUICore.RecentsAppPopover";
  v4[17] = @"com.apple.springboard";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:18];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)MCAccountBasedAppsForDragDrop_accountBasedApps;
  MCAccountBasedAppsForDragDrop_accountBasedApps = v2;
}

uint64_t MCEqualDictionaries(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 count] || objc_msgSend(v4, "count")) {
    uint64_t v5 = [v3 isEqualToDictionary:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void sub_1A14060D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A1406728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A1406D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A1407104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1407A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A1407EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A1408304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *MCKeychainCopyIdentityFromPKCS12(const __CFData *a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef items = 0;
  if (!a2)
  {
    uint64_t v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Can't decode identity certificate because the password is missing.", buf, 2u);
    }
    goto LABEL_14;
  }
  uint64_t v19 = *MEMORY[0x1E4F3B9E8];
  v20[0] = a2;
  CFDictionaryRef v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  OSStatus v4 = SecPKCS12Import(a1, v3, &items);
  if (v4)
  {
    OSStatus v5 = v4;
    uint64_t v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 67109120;
      OSStatus v18 = v5;
      uint32_t v7 = "Can't decode identity certificate. Error: %d";
      CFAllocatorRef v8 = v6;
      uint32_t v9 = 8;
LABEL_12:
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (CFArrayGetCount(items) != 1)
  {
    uint64_t v14 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)audit_token_t buf = 0;
      uint32_t v7 = "Too many identity certificates in PKCS#12 container.";
      CFAllocatorRef v8 = v14;
      uint32_t v9 = 2;
      goto LABEL_12;
    }
LABEL_13:

LABEL_14:
    uint64_t v13 = 0;
    goto LABEL_15;
  }

  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
  Value = CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F3B9F0]);
  uint64_t v13 = Value;
  if (Value) {
    CFRetain(Value);
  }
LABEL_15:
  if (items) {
    CFRelease(items);
  }
  return v13;
}

id MCUSEnglishErrorString(void *a1)
{
  id v1 = a1;
  _USEnglishLocalizedStringForKey(v1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    id v2 = v1;
  }

  return v2;
}

id MCUSEnglishErrorFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint32_t v9 = _USEnglishLocalizedStringForKey(a1);
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:v9 arguments:&a9];

  return v10;
}

id _USEnglishLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  id v2 = _bundle();
  CFDictionaryRef v3 = [v2 localizedStringForKey:v1 value:0 table:@"Errors" localization:@"en"];

  return v3;
}

id MCLocalizedString(void *a1)
{
  return MCLocalizedStringInTable(a1, @"Payloads");
}

id MCLocalizedStringInTable(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  OSStatus v5 = _bundle();
  uint64_t v6 = [v5 localizedStringForKey:v4 value:0 table:v3];

  return v6;
}

id MCLocalizedAppleInternalString(void *a1)
{
  uint64_t v1 = _internalBundle_once;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_internalBundle_once, &__block_literal_global_84);
  }
  id v3 = [(id)_internalBundle_bundle localizedStringForKey:v2 value:0 table:@"Payloads-AppleInternal"];

  return v3;
}

id MCLocalizedStringByDevice(void *a1)
{
  id v1 = a1;
  id v2 = MCGestaltGetDeviceClass();
  id v3 = MCLocalizedStringForDevice(v1, 0, v2);

  return v3;
}

id MCLocalizedAppleInternalStringByDevice(void *a1)
{
  id v1 = a1;
  id v2 = MCGestaltGetDeviceClass();
  id v3 = MCLocalizedStringForDevice(v1, (void *)2, v2);

  return v3;
}

id MCUSEnglishErrorStringByDevice(void *a1)
{
  id v1 = a1;
  id v2 = MCGestaltGetDeviceClass();
  id v3 = MCLocalizedStringForDevice(v1, (void *)3, v2);

  return v3;
}

id MCLocalizedFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint32_t v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  uint64_t v12 = MCLocalizedStringInTable(v10, @"Payloads");

  uint64_t v13 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  uint64_t v14 = (void *)[v11 initWithFormat:v12 locale:v13 arguments:&a9];

  return v14;
}

id MCLocalizedErrorFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint32_t v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  uint64_t v12 = MCLocalizedStringInTable(v10, @"Errors");

  uint64_t v13 = (void *)[v11 initWithFormat:v12 arguments:&a9];
  return v13;
}

id MCLocalizedFormatByDevice(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint32_t v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  uint64_t v12 = MCLocalizedStringByDevice(v10);

  uint64_t v13 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  uint64_t v14 = (void *)[v11 initWithFormat:v12 locale:v13 arguments:&a9];

  return v14;
}

id MCErrorVaArray(void *a1, id *a2)
{
  id v3 = a1;
  id v4 = MCLocalizedStringInTable(v3, @"Errors");
  OSStatus v5 = MCUSEnglishErrorString(v3);

  uint64_t v6 = MCErrorVaList(v4, v5, a2);

  return v6;
}

id MCErrorVaList(void *a1, void *a2, id *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v21 = a3;
  uint32_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [NSString alloc];
  uint32_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = (void *)[v8 initWithFormat:v5 locale:v9 arguments:v21];

  [v7 addObject:v10];
  id v11 = [NSString alloc];
  uint64_t v12 = MCUSEnglishLocale();
  uint64_t v13 = (void *)[v11 initWithFormat:v6 locale:v12 arguments:v21];

  [v7 addObject:v13];
  uint64_t v19 = v21 + 1;
  id v14 = *v21;
  if (v14)
  {
    uint64_t v15 = v14;
    do
    {
      objc_msgSend(v7, "addObject:", v15, v19);
      uint64_t v16 = v20;
      uint64_t v19 = v20 + 1;
      id v17 = *v16;

      uint64_t v15 = v17;
    }
    while (v17);
  }

  return v7;
}

id MCErrorArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  uint32_t v9 = MCErrorVaArray(a1, &a9);
  return v9;
}

id MCErrorArrayByDevice(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  id v9 = a1;
  id v10 = MCLocalizedErrorStringByDevice(v9);
  id v11 = MCUSEnglishErrorStringByDevice(v9);

  uint64_t v12 = MCErrorVaList(v10, v11, &a9);

  return v12;
}

id MCErrorArrayFromLocalizedDescription(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a1;
  id v1 = (void *)MEMORY[0x1E4F1CA98];
  id v2 = a1;
  id v3 = [v1 null];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

uint64_t ___bundle_block_invoke()
{
  _bundle_bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

void ___internalBundle_block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x1E4F28B50];
  MCAppleInternalBundlePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleWithPath:v3];
  id v2 = (void *)_internalBundle_bundle;
  _internalBundle_bundle = v1;
}

id _intersectionFeaturesToAlias()
{
  if (_intersectionFeaturesToAlias_onceToken != -1) {
    dispatch_once(&_intersectionFeaturesToAlias_onceToken, &__block_literal_global_1);
  }
  os_log_t v0 = (void *)_intersectionFeaturesToAlias_dict;
  return v0;
}

void ___intersectionFeaturesToAlias_block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"allowListedAppBundleIDs";
  v3[1] = @"whitelistedAppBundleIDs";
  id v4 = @"appLockBundleIDs";
  os_log_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v5[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v2 = (void *)_intersectionFeaturesToAlias_dict;
  _intersectionFeaturesToAlias_dict = v1;
}

void ___intersectionAliasToFeatures_block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"allowListedAppBundleIDs";
  v2[1] = @"whitelistedAppBundleIDs";
  v3[0] = @"appLockBundleIDs";
  v3[1] = @"appLockBundleIDs";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  uint64_t v1 = (void *)_intersectionAliasToFeatures_dict;
  _intersectionAliasToFeatures_dict = v0;
}

id MCProductVersion()
{
  uint64_t v0 = (void *)_productVersion;
  if (!_productVersion)
  {
    _fillInProductVersions();
    uint64_t v0 = (void *)_productVersion;
  }
  return v0;
}

void sub_1A140C82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MCFeatureInsertRestrictedBool(void *a1, void *a2, void *a3, uint64_t a4)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13[0] = @"value";
    v13[1] = @"preference";
    v14[0] = a3;
    uint32_t v7 = (void *)MEMORY[0x1E4F28ED0];
    id v8 = a3;
    id v9 = a2;
    id v10 = a1;
    id v11 = [v7 numberWithBool:a4];
    v14[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

    [v10 setObject:v12 forKeyedSubscript:v9];
  }
}

void MCFeatureInsertRestrictedValue(void *a1, void *a2, void *a3, uint64_t a4)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13[0] = @"value";
    v13[1] = @"preferSmallerValues";
    v14[0] = a3;
    uint32_t v7 = (void *)MEMORY[0x1E4F28ED0];
    id v8 = a3;
    id v9 = a2;
    id v10 = a1;
    id v11 = [v7 numberWithBool:a4];
    v14[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

    [v10 setObject:v12 forKeyedSubscript:v9];
  }
}

uint64_t MCIsAppExemptFromOpenInSourceRestrictions(void *a1)
{
  uint64_t v1 = MCAppsExemptFromOpenInSourceRestrictions_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&MCAppsExemptFromOpenInSourceRestrictions_onceToken, &__block_literal_global_1342);
  }
  uint64_t v3 = [(id)MCAppsExemptFromOpenInSourceRestrictions_retval containsObject:v2];

  return v3;
}

uint64_t MCIsAppExemptFromImportFromTargetRestrictions(void *a1)
{
  id v1 = a1;
  id v2 = MCAppsExemptFromOpenInTargetRestrictions();
  uint64_t v3 = [v2 containsObject:v1];

  return v3;
}

id MCAppsExemptFromOpenInTargetRestrictions()
{
  if (MCAppsExemptFromOpenInTargetRestrictions_onceToken != -1) {
    dispatch_once(&MCAppsExemptFromOpenInTargetRestrictions_onceToken, &__block_literal_global_1344);
  }
  uint64_t v0 = (void *)MCAppsExemptFromOpenInTargetRestrictions_retval;
  return v0;
}

uint64_t MCIsAppExemptFromImportFromTargetRestrictionsForContacts(void *a1)
{
  uint64_t v1 = MCAppsExemptFromOpenInTargetRestrictionsForContacts_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&MCAppsExemptFromOpenInTargetRestrictionsForContacts_onceToken, &__block_literal_global_1346);
  }
  uint64_t v3 = [(id)MCAppsExemptFromOpenInTargetRestrictionsForContacts_retval containsObject:v2];

  return v3;
}

uint64_t MCIsAppAccountBasedSourceForOpenIn(void *a1)
{
  id v1 = a1;
  id v2 = MCAccountBasedAppsForOpenIn();
  if (([v2 containsObject:v1] & 1) != 0 || MCIsAppBasicallySafari(v1)) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v1 isEqualToString:@"com.apple.iBooks"];
  }

  return v3;
}

id MCAccountBasedAppsForOpenIn()
{
  if (MCAccountBasedAppsForOpenIn_onceToken != -1) {
    dispatch_once(&MCAccountBasedAppsForOpenIn_onceToken, &__block_literal_global_1348);
  }
  uint64_t v0 = (void *)MCAccountBasedAppsForOpenIn_accountBasedApps;
  return v0;
}

BOOL MCIsAppBasicallySafari(void *a1)
{
  id v1 = a1;
  BOOL v2 = ([v1 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0
    || [v1 rangeOfString:@"com.apple.webapp-" options:8] == 0;

  return v2;
}

uint64_t MCIsAppAccountBasedTargetForOpenIn(void *a1)
{
  id v1 = a1;
  BOOL v2 = MCAccountBasedAppsForOpenIn();
  uint64_t v3 = [v2 containsObject:v1];

  return v3;
}

uint64_t MCIsAppExemptFromDragDropManagement(void *a1)
{
  uint64_t v1 = MCAppsExemptFromDragDropManagement_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&MCAppsExemptFromDragDropManagement_onceToken, &__block_literal_global_1352);
  }
  uint64_t v3 = [(id)MCAppsExemptFromDragDropManagement_retval containsObject:v2];

  return v3;
}

id MCUnrestrictableApps()
{
  if (MCUnrestrictableApps_onceToken != -1) {
    dispatch_once(&MCUnrestrictableApps_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)MCUnrestrictableApps_unrestrictableApps;
  return v0;
}

void __MCUnrestrictableApps_block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA80];
  v5[0] = @"com.apple.appleseed.FeedbackAssistant";
  v5[1] = @"com.apple.Preferences";
  void v5[2] = @"com.apple.TVSettings";
  v5[3] = @"com.apple.TapToRadar";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  id v2 = [v0 setWithArray:v1];

  if (MCCTHasTelephony()) {
    [v2 addObject:@"com.apple.mobilephone"];
  }
  uint64_t v3 = [v2 copy];
  id v4 = (void *)MCUnrestrictableApps_unrestrictableApps;
  MCUnrestrictableApps_unrestrictableApps = v3;
}

id MCAlwaysRestrictedAppsInEDUMode()
{
  if (MCAlwaysRestrictedAppsInEDUMode_onceToken != -1) {
    dispatch_once(&MCAlwaysRestrictedAppsInEDUMode_onceToken, &__block_literal_global_1339);
  }
  uint64_t v0 = (void *)MCAlwaysRestrictedAppsInEDUMode_restrictedApps;
  return v0;
}

void __MCAlwaysRestrictedAppsInEDUMode_block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.tips";
  v4[1] = @"com.apple.Home";
  v4[2] = @"com.apple.ScreenTimeWidgetApplication";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)MCAlwaysRestrictedAppsInEDUMode_restrictedApps;
  MCAlwaysRestrictedAppsInEDUMode_restrictedApps = v2;
}

void __MCAppsExemptFromOpenInSourceRestrictions_block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.phone.addressbooksyncd";
  v4[1] = @"com.apple.AssistantServices";
  v4[2] = @"com.apple.watch.addressbooksyncd";
  v4[3] = @"com.apple.Carousel";
  void v4[4] = @"com.apple.Maps";
  v4[5] = @"com.apple.MobileSMS";
  v4[6] = @"com.apple.Preferences";
  v4[7] = @"com.apple.sharingd";
  v4[8] = @"com.apple.siri";
  v4[9] = @"com.apple.springboard";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)MCAppsExemptFromOpenInSourceRestrictions_retval;
  MCAppsExemptFromOpenInSourceRestrictions_retval = v2;
}

void __MCAppsExemptFromOpenInTargetRestrictions_block_invoke()
{
  v4[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.phone.addressbooksyncd";
  v4[1] = @"com.apple.AssistantServices";
  v4[2] = @"com.apple.mobilecal.CalendarFocusConfigurationExtension";
  v4[3] = @"com.apple.mobilecal.widget";
  void v4[4] = @"com.apple.watch.addressbooksyncd";
  v4[5] = @"com.apple.TelephonyUtilities.PhoneIntentHandler";
  v4[6] = @"com.apple.Preferences";
  v4[7] = @"com.apple.siri";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)MCAppsExemptFromOpenInTargetRestrictions_retval;
  MCAppsExemptFromOpenInTargetRestrictions_retval = v2;
}

void __MCAppsExemptFromOpenInTargetRestrictionsForContacts_block_invoke()
{
  v5[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = MCAppsExemptFromOpenInTargetRestrictions();
  uint64_t v1 = (void *)[v0 mutableCopy];

  v5[0] = @"com.apple.asd";
  v5[1] = @"com.apple.telephonyutilities.callservicesd";
  void v5[2] = @"com.apple.ContactsUI.LimitedAccessPromptView";
  v5[3] = @"com.apple.ContactsUI.LimitedLibraryPickerViewService";
  v5[4] = @"com.apple.ContactsUI.ContactsButtonXPCService";
  void v5[5] = @"com.apple.routined";
  v5[6] = @"com.apple.sharingd";
  v5[7] = @"com.apple.siriknowledged";
  v5[8] = @"com.apple.suggestd";
  v5[9] = @"com.apple.transparencyd";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:10];
  [v1 addObjectsFromArray:v2];

  uint64_t v3 = [v1 copy];
  id v4 = (void *)MCAppsExemptFromOpenInTargetRestrictionsForContacts_retval;
  MCAppsExemptFromOpenInTargetRestrictionsForContacts_retval = v3;
}

void __MCAccountBasedAppsForOpenIn_block_invoke()
{
  v4[31] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.bird";
  v4[1] = @"com.apple.calaccessd";
  v4[2] = @"com.apple.mobilecal";
  v4[3] = @"com.apple.CalendarNotification.CalendarContentExtension";
  void v4[4] = @"com.apple.mobilecal.CalendarWidgetExtension";
  v4[5] = @"com.apple.CalendarWidget.IntentsExtension";
  v4[6] = @"com.apple.CallHistorySyncHelper";
  v4[7] = @"com.apple.telephonyutilities.callservicesd";
  v4[8] = @"com.apple.DocumentManagerUICore.RecentsAppPopover";
  void v4[9] = @"com.apple.DocumentsApp";
  v4[10] = @"com.apple.DocumentManagerUICore.RecentsAvocado";
  void v4[11] = @"com.apple.NanoCalendar";
  v4[12] = @"com.apple.callhistory.sync-helper";
  v4[13] = @"com.apple.mobilemail";
  v4[14] = @"com.apple.MailCompositionService";
  v4[15] = @"com.apple.email.maild";
  v4[16] = @"com.apple.EmailDaemon";
  v4[17] = @"com.apple.mobilemail.MailIntentsExtension";
  v4[18] = @"com.apple.mobilenotes";
  void v4[19] = @"com.apple.MobileAddressBook";
  v4[20] = @"com.apple.profilectl";
  v4[21] = @"com.apple.reminders";
  v4[22] = @"com.apple.SafariViewService";
  v4[23] = @"com.apple.WorkflowKit.BackgroundShortcutRunner";
  v4[24] = @"com.apple.shortcuts";
  v4[25] = @"com.apple.WorkflowKit.ShortcutsIntents";
  v4[26] = @"com.apple.shortcuts.runtime";
  v4[27] = @"com.apple.shortcuts.Today-Extension";
  v4[28] = @"com.apple.shortcuts.Run-Workflow";
  v4[29] = @"com.apple.TelephonyUtilities";
  v4[30] = @"com.apple.UpNextWidget.extension";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:31];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)MCAccountBasedAppsForOpenIn_accountBasedApps;
  MCAccountBasedAppsForOpenIn_accountBasedApps = v2;
}

void __MCAppsExemptFromDragDropManagement_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.springboard";
  v4[1] = @"com.apple.Maps";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)MCAppsExemptFromDragDropManagement_retval;
  MCAppsExemptFromDragDropManagement_retval = v2;
}

__CFString *MCUserDirectory()
{
  return @"/var/mobile/";
}

id MCLegacyProfileStorageDirectory()
{
  if (MCLegacyProfileStorageDirectory_once != -1) {
    dispatch_once(&MCLegacyProfileStorageDirectory_once, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)MCLegacyProfileStorageDirectory_str;
  return v0;
}

void __MCLegacyProfileStorageDirectory_block_invoke()
{
  id v2 = [@"/var/mobile/" stringByAppendingPathComponent:@"Library/ConfigurationProfiles"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)MCLegacyProfileStorageDirectory_str;
  MCLegacyProfileStorageDirectory_str = v0;
}

id MCHoldingTankManifestName()
{
  if (MCHoldingTankManifestName_once != -1) {
    dispatch_once(&MCHoldingTankManifestName_once, &__block_literal_global_46);
  }
  uint64_t v0 = (void *)MCHoldingTankManifestName_str;
  return v0;
}

uint64_t __MCHoldingTankManifestName_block_invoke()
{
  MCHoldingTankManifestName_str = [@"HoldingTankManifest.plist" copy];
  return MEMORY[0x1F41817F8]();
}

id MCSystemManifestPath()
{
  if (MCSystemManifestPath_once != -1) {
    dispatch_once(&MCSystemManifestPath_once, &__block_literal_global_51);
  }
  uint64_t v0 = (void *)MCSystemManifestPath_str;
  return v0;
}

void __MCSystemManifestPath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PayloadManifest.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemManifestPath_str;
  MCSystemManifestPath_str = v1;
}

id MCSystemAppAccessibilityParametersFilePath()
{
  if (MCSystemAppAccessibilityParametersFilePath_once != -1) {
    dispatch_once(&MCSystemAppAccessibilityParametersFilePath_once, &__block_literal_global_61);
  }
  uint64_t v0 = (void *)MCSystemAppAccessibilityParametersFilePath_str;
  return v0;
}

void __MCSystemAppAccessibilityParametersFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"AppAccessibilityParameters.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemAppAccessibilityParametersFilePath_str;
  MCSystemAppAccessibilityParametersFilePath_str = v1;
}

id MCSystemProfileRestrictionsFilePath()
{
  if (MCSystemProfileRestrictionsFilePath_once != -1) {
    dispatch_once(&MCSystemProfileRestrictionsFilePath_once, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)MCSystemProfileRestrictionsFilePath_str;
  return v0;
}

void __MCSystemProfileRestrictionsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"ProfileTruth.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemProfileRestrictionsFilePath_str;
  MCSystemProfileRestrictionsFilePath_str = v1;
}

id MCSystemClientRestrictionsFilePath()
{
  if (MCSystemClientRestrictionsFilePath_once != -1) {
    dispatch_once(&MCSystemClientRestrictionsFilePath_once, &__block_literal_global_71);
  }
  uint64_t v0 = (void *)MCSystemClientRestrictionsFilePath_str;
  return v0;
}

void __MCSystemClientRestrictionsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"ClientTruth.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemClientRestrictionsFilePath_str;
  MCSystemClientRestrictionsFilePath_str = v1;
}

void __MCSystemUserSettingsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"UserSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemUserSettingsFilePath_str;
  MCSystemUserSettingsFilePath_str = v1;
}

void __MCSystemNamespacedUserSettingsFilePath_block_invoke()
{
  MCSystemPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"NamespacedUserSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemNamespacedUserSettingsFilePath_str;
  MCSystemNamespacedUserSettingsFilePath_str = v1;
}

id MCSystemPreferencesDirectory()
{
  if (MCSystemPreferencesDirectory_once != -1) {
    dispatch_once(&MCSystemPreferencesDirectory_once, &__block_literal_global_86);
  }
  uint64_t v0 = (void *)MCSystemPreferencesDirectory_str;
  return v0;
}

uint64_t __MCSystemPreferencesDirectory_block_invoke()
{
  MCSystemPreferencesDirectory_str = [@"/Library/Managed Preferences/mobile" copy];
  return MEMORY[0x1F41817F8]();
}

id MCiPCUKeychainMapPath()
{
  if (MCiPCUKeychainMapPath_once != -1) {
    dispatch_once(&MCiPCUKeychainMapPath_once, &__block_literal_global_100);
  }
  uint64_t v0 = (void *)MCiPCUKeychainMapPath_str;
  return v0;
}

void __MCiPCUKeychainMapPath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"KeyMapTable"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCiPCUKeychainMapPath_str;
  MCiPCUKeychainMapPath_str = v1;
}

id MCSystemDependencyFilePath()
{
  if (MCSystemDependencyFilePath_once != -1) {
    dispatch_once(&MCSystemDependencyFilePath_once, &__block_literal_global_105);
  }
  uint64_t v0 = (void *)MCSystemDependencyFilePath_str;
  return v0;
}

void __MCSystemDependencyFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PayloadDependency.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemDependencyFilePath_str;
  MCSystemDependencyFilePath_str = v1;
}

id MCPostSetupAutoInstallProfilePath()
{
  if (MCPostSetupAutoInstallProfilePath_once != -1) {
    dispatch_once(&MCPostSetupAutoInstallProfilePath_once, &__block_literal_global_110);
  }
  uint64_t v0 = (void *)MCPostSetupAutoInstallProfilePath_str;
  return v0;
}

void __MCPostSetupAutoInstallProfilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PostSetupProfile.mobileconfig"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCPostSetupAutoInstallProfilePath_str;
  MCPostSetupAutoInstallProfilePath_str = v1;
}

id MCPostSetupAutoInstallSetAsideProfilePath()
{
  if (MCPostSetupAutoInstallSetAsideProfilePath_once != -1) {
    dispatch_once(&MCPostSetupAutoInstallSetAsideProfilePath_once, &__block_literal_global_115);
  }
  uint64_t v0 = (void *)MCPostSetupAutoInstallSetAsideProfilePath_str;
  return v0;
}

void __MCPostSetupAutoInstallSetAsideProfilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PostSetupSetAsideProfile.mobileconfig"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCPostSetupAutoInstallSetAsideProfilePath_str;
  MCPostSetupAutoInstallSetAsideProfilePath_str = v1;
}

id MCLegacyPostSetupAutoInstallProfilePath()
{
  if (MCLegacyPostSetupAutoInstallProfilePath_once != -1) {
    dispatch_once(&MCLegacyPostSetupAutoInstallProfilePath_once, &__block_literal_global_120);
  }
  uint64_t v0 = (void *)MCLegacyPostSetupAutoInstallProfilePath_str;
  return v0;
}

void __MCLegacyPostSetupAutoInstallProfilePath_block_invoke()
{
  MCLegacyProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PostSetupProfile.mobileconfig"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCLegacyPostSetupAutoInstallProfilePath_str;
  MCLegacyPostSetupAutoInstallProfilePath_str = v1;
}

void __MCSettingsEventsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MCSettingsEvents.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSettingsEventsFilePath_str;
  MCSettingsEventsFilePath_str = v1;
}

id MCProfileEventsFilePath()
{
  if (MCProfileEventsFilePath_once != -1) {
    dispatch_once(&MCProfileEventsFilePath_once, &__block_literal_global_127);
  }
  uint64_t v0 = (void *)MCProfileEventsFilePath_str;
  return v0;
}

void __MCProfileEventsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MCProfileEvents.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCProfileEventsFilePath_str;
  MCProfileEventsFilePath_str = v1;
}

id MCBackupContainsPasscodeFilePath()
{
  if (MCBackupContainsPasscodeFilePath_once != -1) {
    dispatch_once(&MCBackupContainsPasscodeFilePath_once, &__block_literal_global_132);
  }
  uint64_t v0 = (void *)MCBackupContainsPasscodeFilePath_str;
  return v0;
}

void __MCBackupContainsPasscodeFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"backupContainedPasscode.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCBackupContainsPasscodeFilePath_str;
  MCBackupContainsPasscodeFilePath_str = v1;
}

id MCCrashDetectionFilePath()
{
  if (MCCrashDetectionFilePath_once != -1) {
    dispatch_once(&MCCrashDetectionFilePath_once, &__block_literal_global_137);
  }
  uint64_t v0 = (void *)MCCrashDetectionFilePath_str;
  return v0;
}

void __MCCrashDetectionFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"profiledRunning"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCCrashDetectionFilePath_str;
  MCCrashDetectionFilePath_str = v1;
}

id MCSystemLostModeRequestPath()
{
  if (MCSystemLostModeRequestPath_once != -1) {
    dispatch_once(&MCSystemLostModeRequestPath_once, &__block_literal_global_142);
  }
  uint64_t v0 = (void *)MCSystemLostModeRequestPath_str;
  return v0;
}

void __MCSystemLostModeRequestPath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"LostModeRequest.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemLostModeRequestPath_str;
  MCSystemLostModeRequestPath_str = v1;
}

void __MCNagUIMetaFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MCNagMeta.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCNagUIMetaFilePath_str;
  MCNagUIMetaFilePath_str = v1;
}

void __MCPasscodeNagKeepAliveFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PasscodeDoesNotComply"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCPasscodeNagKeepAliveFilePath_str;
  MCPasscodeNagKeepAliveFilePath_str = v1;
}

void __MCOutstandingNagComputationFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MCOutstandingNagComputation"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCOutstandingNagComputationFilePath_str;
  MCOutstandingNagComputationFilePath_str = v1;
}

id MCSystemAppWhitelistByProfileFilePath()
{
  if (MCSystemAppWhitelistByProfileFilePath_once != -1) {
    dispatch_once(&MCSystemAppWhitelistByProfileFilePath_once, &__block_literal_global_162);
  }
  uint64_t v0 = (void *)MCSystemAppWhitelistByProfileFilePath_str;
  return v0;
}

void __MCSystemAppWhitelistByProfileFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"AppWhitelist.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemAppWhitelistByProfileFilePath_str;
  MCSystemAppWhitelistByProfileFilePath_str = v1;
}

id MCSystemAppOptionsByBundleIDFilePath()
{
  if (MCSystemAppOptionsByBundleIDFilePath_once != -1) {
    dispatch_once(&MCSystemAppOptionsByBundleIDFilePath_once, &__block_literal_global_167);
  }
  uint64_t v0 = (void *)MCSystemAppOptionsByBundleIDFilePath_str;
  return v0;
}

void __MCSystemAppOptionsByBundleIDFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"AppOptionsByBundleID.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemAppOptionsByBundleIDFilePath_str;
  MCSystemAppOptionsByBundleIDFilePath_str = v1;
}

id MCSystemEffectiveAppWhitelistFilePath()
{
  if (MCSystemEffectiveAppWhitelistFilePath_once != -1) {
    dispatch_once(&MCSystemEffectiveAppWhitelistFilePath_once, &__block_literal_global_172);
  }
  uint64_t v0 = (void *)MCSystemEffectiveAppWhitelistFilePath_str;
  return v0;
}

void __MCSystemEffectiveAppWhitelistFilePath_block_invoke()
{
  MCSystemPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"EffectiveAppWhitelist.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemEffectiveAppWhitelistFilePath_str;
  MCSystemEffectiveAppWhitelistFilePath_str = v1;
}

id MCLegacyCloudConfigurationDetailsFilePath()
{
  if (MCLegacyCloudConfigurationDetailsFilePath_once != -1) {
    dispatch_once(&MCLegacyCloudConfigurationDetailsFilePath_once, &__block_literal_global_177);
  }
  uint64_t v0 = (void *)MCLegacyCloudConfigurationDetailsFilePath_str;
  return v0;
}

void __MCLegacyCloudConfigurationDetailsFilePath_block_invoke()
{
  MCLegacyProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"CloudConfigurationDetails.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCLegacyCloudConfigurationDetailsFilePath_str;
  MCLegacyCloudConfigurationDetailsFilePath_str = v1;
}

id MCCloudConfigurationDetailsFilePath()
{
  if (MCCloudConfigurationDetailsFilePath_once != -1) {
    dispatch_once(&MCCloudConfigurationDetailsFilePath_once, &__block_literal_global_182);
  }
  uint64_t v0 = (void *)MCCloudConfigurationDetailsFilePath_str;
  return v0;
}

void __MCCloudConfigurationDetailsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"CloudConfigurationDetails.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCCloudConfigurationDetailsFilePath_str;
  MCCloudConfigurationDetailsFilePath_str = v1;
}

id MCCloudConfigurationSetAsideDetailsFilePath()
{
  if (MCCloudConfigurationSetAsideDetailsFilePath_once != -1) {
    dispatch_once(&MCCloudConfigurationSetAsideDetailsFilePath_once, &__block_literal_global_184);
  }
  uint64_t v0 = (void *)MCCloudConfigurationSetAsideDetailsFilePath_str;
  return v0;
}

void __MCCloudConfigurationSetAsideDetailsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"CloudConfigurationSetAsideDetails.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCCloudConfigurationSetAsideDetailsFilePath_str;
  MCCloudConfigurationSetAsideDetailsFilePath_str = v1;
}

id MCSystemHomeScreenLayoutFilePath()
{
  if (MCSystemHomeScreenLayoutFilePath_once != -1) {
    dispatch_once(&MCSystemHomeScreenLayoutFilePath_once, &__block_literal_global_189);
  }
  uint64_t v0 = (void *)MCSystemHomeScreenLayoutFilePath_str;
  return v0;
}

void __MCSystemHomeScreenLayoutFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"HomeScreenLayout.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemHomeScreenLayoutFilePath_str;
  MCSystemHomeScreenLayoutFilePath_str = v1;
}

void __MCSystemNotificationSettingsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"NotificationSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemNotificationSettingsFilePath_str;
  MCSystemNotificationSettingsFilePath_str = v1;
}

id MCSharedDeviceConfigurationFilePath()
{
  if (MCSharedDeviceConfigurationFilePath_once != -1) {
    dispatch_once(&MCSharedDeviceConfigurationFilePath_once, &__block_literal_global_199);
  }
  uint64_t v0 = (void *)MCSharedDeviceConfigurationFilePath_str;
  return v0;
}

void __MCSharedDeviceConfigurationFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"SharedDeviceConfiguration.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSharedDeviceConfigurationFilePath_str;
  MCSharedDeviceConfigurationFilePath_str = v1;
}

__CFString *MCWebContentFilterOutputPath()
{
  return @"/Library/Managed Preferences/mobile/com.apple.webcontentfilter.plist";
}

id MCSystemWebContentFilterCurrentUserBookmarksPath()
{
  if (MCSystemWebContentFilterCurrentUserBookmarksPath_once != -1) {
    dispatch_once(&MCSystemWebContentFilterCurrentUserBookmarksPath_once, &__block_literal_global_207);
  }
  uint64_t v0 = (void *)MCSystemWebContentFilterCurrentUserBookmarksPath_str;
  return v0;
}

void __MCSystemWebContentFilterCurrentUserBookmarksPath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"CurrentUserBookmarks.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemWebContentFilterCurrentUserBookmarksPath_str;
  MCSystemWebContentFilterCurrentUserBookmarksPath_str = v1;
}

id MCSystemWebContentFilterStashedUserBookmarksPath()
{
  if (MCSystemWebContentFilterStashedUserBookmarksPath_once != -1) {
    dispatch_once(&MCSystemWebContentFilterStashedUserBookmarksPath_once, &__block_literal_global_212);
  }
  uint64_t v0 = (void *)MCSystemWebContentFilterStashedUserBookmarksPath_str;
  return v0;
}

void __MCSystemWebContentFilterStashedUserBookmarksPath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"StashedUserBookmarks.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemWebContentFilterStashedUserBookmarksPath_str;
  MCSystemWebContentFilterStashedUserBookmarksPath_str = v1;
}

id MCSetupAssistantSettingsFilePath()
{
  if (MCSetupAssistantSettingsFilePath_once != -1) {
    dispatch_once(&MCSetupAssistantSettingsFilePath_once, &__block_literal_global_217);
  }
  uint64_t v0 = (void *)MCSetupAssistantSettingsFilePath_str;
  return v0;
}

void __MCSetupAssistantSettingsFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"SetupAssistantSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSetupAssistantSettingsFilePath_str;
  MCSetupAssistantSettingsFilePath_str = v1;
}

id MCSystemWatchEnrollmentDataFilePath()
{
  if (MCSystemWatchEnrollmentDataFilePath_once != -1) {
    dispatch_once(&MCSystemWatchEnrollmentDataFilePath_once, &__block_literal_global_222);
  }
  uint64_t v0 = (void *)MCSystemWatchEnrollmentDataFilePath_str;
  return v0;
}

void __MCSystemWatchEnrollmentDataFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"WatchMDMEnrollmentInfo.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemWatchEnrollmentDataFilePath_str;
  MCSystemWatchEnrollmentDataFilePath_str = v1;
}

id MCUserManifestPath()
{
  if (MCUserManifestPath_once != -1) {
    dispatch_once(&MCUserManifestPath_once, &__block_literal_global_227);
  }
  uint64_t v0 = (void *)MCUserManifestPath_str;
  return v0;
}

void __MCUserManifestPath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PayloadManifest.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserManifestPath_str;
  MCUserManifestPath_str = v1;
}

id MCUserProfileRestrictionsFilePath()
{
  if (MCUserProfileRestrictionsFilePath_once != -1) {
    dispatch_once(&MCUserProfileRestrictionsFilePath_once, &__block_literal_global_229);
  }
  uint64_t v0 = (void *)MCUserProfileRestrictionsFilePath_str;
  return v0;
}

void __MCUserProfileRestrictionsFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"ProfileTruth.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserProfileRestrictionsFilePath_str;
  MCUserProfileRestrictionsFilePath_str = v1;
}

id MCUserClientRestrictionsFilePath()
{
  if (MCUserClientRestrictionsFilePath_once != -1) {
    dispatch_once(&MCUserClientRestrictionsFilePath_once, &__block_literal_global_231);
  }
  uint64_t v0 = (void *)MCUserClientRestrictionsFilePath_str;
  return v0;
}

void __MCUserClientRestrictionsFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"ClientTruth.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserClientRestrictionsFilePath_str;
  MCUserClientRestrictionsFilePath_str = v1;
}

void __MCUserUserSettingsFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"UserSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserUserSettingsFilePath_str;
  MCUserUserSettingsFilePath_str = v1;
}

void __MCUserNamespacedUserSettingsFilePath_block_invoke()
{
  MCUserPublicInfoDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"NamespacedUserSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserNamespacedUserSettingsFilePath_str;
  MCUserNamespacedUserSettingsFilePath_str = v1;
}

id MCUserDependencyFilePath()
{
  if (MCUserDependencyFilePath_once != -1) {
    dispatch_once(&MCUserDependencyFilePath_once, &__block_literal_global_237);
  }
  uint64_t v0 = (void *)MCUserDependencyFilePath_str;
  return v0;
}

void __MCUserDependencyFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"PayloadDependency.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserDependencyFilePath_str;
  MCUserDependencyFilePath_str = v1;
}

id MCUserHomeScreenLayoutFilePath()
{
  if (MCUserHomeScreenLayoutFilePath_once != -1) {
    dispatch_once(&MCUserHomeScreenLayoutFilePath_once, &__block_literal_global_239);
  }
  uint64_t v0 = (void *)MCUserHomeScreenLayoutFilePath_str;
  return v0;
}

void __MCUserHomeScreenLayoutFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"HomeScreenLayout.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserHomeScreenLayoutFilePath_str;
  MCUserHomeScreenLayoutFilePath_str = v1;
}

void __MCUserNotificationSettingsFilePath_block_invoke()
{
  MCUserProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"NotificationSettings.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCUserNotificationSettingsFilePath_str;
  MCUserNotificationSettingsFilePath_str = v1;
}

id MCSystemRestartLogPath()
{
  if (MCSystemRestartLogPath_once != -1) {
    dispatch_once(&MCSystemRestartLogPath_once, &__block_literal_global_253);
  }
  uint64_t v0 = (void *)MCSystemRestartLogPath_str;
  return v0;
}

void __MCSystemRestartLogPath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MDMRequestedRestart"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemRestartLogPath_str;
  MCSystemRestartLogPath_str = v1;
}

id MCSystemShutDownLogPath()
{
  if (MCSystemShutDownLogPath_once != -1) {
    dispatch_once(&MCSystemShutDownLogPath_once, &__block_literal_global_258);
  }
  uint64_t v0 = (void *)MCSystemShutDownLogPath_str;
  return v0;
}

void __MCSystemShutDownLogPath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"MDMRequestedShutDown"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCSystemShutDownLogPath_str;
  MCSystemShutDownLogPath_str = v1;
}

id MCTagsMappingFilePath()
{
  if (MCTagsMappingFilePath_once != -1) {
    dispatch_once(&MCTagsMappingFilePath_once, &__block_literal_global_263);
  }
  uint64_t v0 = (void *)MCTagsMappingFilePath_str;
  return v0;
}

void __MCTagsMappingFilePath_block_invoke()
{
  MCSystemProfileStorageDirectory();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 stringByAppendingPathComponent:@"TagsMapping.plist"];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)MCTagsMappingFilePath_str;
  MCTagsMappingFilePath_str = v1;
}

__CFString *MCNewsServicesFrameworkPath()
{
  return @"/System/Library/PrivateFrameworks/NewsServices.framework/";
}

__CFString *MCGetBaseResourcePath()
{
  return @"/System/Library/PrivateFrameworks/ManagedConfiguration.framework";
}

__CFString *MCAppleInternalBundlePath()
{
  return @"/AppleInternal/Library/Bundles/MCAppleInternalContent.bundle";
}

void sub_1A1413C44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A1413DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *MCStringForBool(int a1)
{
  if (a1) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

id MCLocalizedStringForBool(int a1)
{
  if (a1) {
    uint64_t v1 = @"YES";
  }
  else {
    uint64_t v1 = @"NO";
  }
  uint64_t v2 = MCLocalizedString(v1);
  return v2;
}

id MCStringFromArrayOfStrings(void *a1)
{
  id v1 = a1;
  if (![v1 count]) {
    goto LABEL_13;
  }
  uint64_t v2 = [v1 count];
  id v3 = [v1 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v2 == 1)
  {
    if (isKindOfClass)
    {
      id v5 = [v1 objectAtIndex:0];
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ((isKindOfClass & 1) == 0)
  {
LABEL_13:
    id v5 = 0;
    goto LABEL_14;
  }
  id v6 = [MEMORY[0x1E4F28E78] string];
  if ([v1 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [v1 objectAtIndex:v7];
      if (v7) {
        [v6 appendString:@"\n"];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [v6 appendString:v8];

      if (++v7 >= (unint64_t)[v1 count]) {
        goto LABEL_12;
      }
    }

    id v5 = 0;
  }
  else
  {
LABEL_12:
    id v5 = v6;
  }

LABEL_14:
  return v5;
}

id MCFormattedStringForNumber(void *a1)
{
  uint64_t v1 = MCNoStyleNumberFormatter_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&MCNoStyleNumberFormatter_onceToken, &__block_literal_global_56_1);
  }
  id v3 = [(id)MCNoStyleNumberFormatter_formatter stringFromNumber:v2];

  return v3;
}

uint64_t MCFormattedStringForTimeInterval(double a1)
{
  if (MCFormattedStringForTimeInterval_onceToken != -1) {
    dispatch_once(&MCFormattedStringForTimeInterval_onceToken, &__block_literal_global_44_0);
  }
  id v2 = (void *)MCFormattedStringForTimeInterval_numericFormatter;
  return [v2 stringFromTimeInterval:a1];
}

uint64_t __MCFormattedStringForTimeInterval_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)MCFormattedStringForTimeInterval_numericFormatter;
  MCFormattedStringForTimeInterval_numericFormatter = v0;

  [(id)MCFormattedStringForTimeInterval_numericFormatter setAllowedUnits:112];
  [(id)MCFormattedStringForTimeInterval_numericFormatter setUnitsStyle:3];
  id v2 = (void *)MCFormattedStringForTimeInterval_numericFormatter;
  return [v2 setFormattingContext:1];
}

id MCUSEnglishLocale()
{
  if (MCUSEnglishLocale_once != -1) {
    dispatch_once(&MCUSEnglishLocale_once, &__block_literal_global_47);
  }
  uint64_t v0 = (void *)MCUSEnglishLocale_locale;
  return v0;
}

uint64_t __MCUSEnglishLocale_block_invoke()
{
  MCUSEnglishLocale_locale = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  return MEMORY[0x1F41817F8]();
}

id MCUSEnglishNumberFormatter()
{
  if (MCUSEnglishNumberFormatter_once != -1) {
    dispatch_once(&MCUSEnglishNumberFormatter_once, &__block_literal_global_53);
  }
  uint64_t v0 = (void *)MCUSEnglishNumberFormatter_formatter;
  return v0;
}

uint64_t __MCUSEnglishNumberFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = (void *)MCUSEnglishNumberFormatter_formatter;
  MCUSEnglishNumberFormatter_formatter = (uint64_t)v0;

  id v2 = (void *)MCUSEnglishNumberFormatter_formatter;
  id v3 = MCUSEnglishLocale();
  [v2 setLocale:v3];

  id v4 = (void *)MCUSEnglishNumberFormatter_formatter;
  return [v4 setNumberStyle:0];
}

void __MCNoStyleNumberFormatter_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)MCNoStyleNumberFormatter_formatter;
  MCNoStyleNumberFormatter_formatter = v0;

  [(id)MCNoStyleNumberFormatter_formatter setNumberStyle:0];
  id v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)MCNoStyleNumberFormatter_formatter setLocale:v2];
}

void _populateMissingManifestDictionaries(void *a1)
{
  id v5 = a1;
  uint64_t v1 = [v5 objectForKey:@"OrderedProfiles"];

  if (!v1)
  {
    id v2 = [MEMORY[0x1E4F1CA48] array];
    [v5 setObject:v2 forKey:@"OrderedProfiles"];
  }
  id v3 = [v5 objectForKey:@"HiddenProfiles"];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    [v5 setObject:v4 forKey:@"HiddenProfiles"];
  }
}

void sub_1A1417B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A141862C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14187AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1418E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1418FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1419170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1419304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14194C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A141967C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A141D334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A14215C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A1421768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MCPowerlogControlSwitchMode(void *a1)
{
  id v1 = a1;
  +[MCLazyInitializationUtilities initPowerlogControl];
  if (_PowerlogControlSwitchMode) {
    uint64_t v2 = _PowerlogControlSwitchMode(v1);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

id MCPowerlogControlReadMode()
{
  uint64_t v0 = +[MCLazyInitializationUtilities initPowerlogControl];
  if (_PowerlogControlReadMode)
  {
    id v1 = _PowerlogControlReadMode(v0);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

uint64_t MCCGDataProviderCreateWithURL(uint64_t a1)
{
  +[MCLazyInitializationUtilities initCoreGraphics];
  uint64_t v2 = (uint64_t (*)(uint64_t))_CGDataProviderCreateWithURL;
  return v2(a1);
}

uint64_t MCCGFontCopyFullName(uint64_t a1)
{
  +[MCLazyInitializationUtilities initCoreGraphics];
  uint64_t v2 = (uint64_t (*)(uint64_t))_CGFontCopyFullName;
  return v2(a1);
}

uint64_t MCCGFontCopyPostScriptName(uint64_t a1)
{
  +[MCLazyInitializationUtilities initCoreGraphics];
  uint64_t v2 = (uint64_t (*)(uint64_t))_CGFontCopyPostScriptName;
  return v2(a1);
}

uint64_t MCCGFontCreateWithDataProvider(uint64_t a1)
{
  +[MCLazyInitializationUtilities initCoreGraphics];
  uint64_t v2 = (uint64_t (*)(uint64_t))_CGFontCreateWithDataProvider;
  return v2(a1);
}

id MCUMUserSwitchBlockingTaskClass()
{
  if (MCUMUserSwitchBlockingTaskClass_onceToken != -1) {
    dispatch_once(&MCUMUserSwitchBlockingTaskClass_onceToken, &__block_literal_global_246);
  }
  uint64_t v0 = (void *)MCUMUserSwitchBlockingTaskClass_theClass;
  return v0;
}

void __MCUMUserSwitchBlockingTaskClass_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = UserManagementBundle();
  MCUMUserSwitchBlockingTaskClass_theClass = [v0 classNamed:@"UMUserSwitchBlockingTask"];

  if (!MCUMUserSwitchBlockingTaskClass_theClass)
  {
    id v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138543362;
      id v3 = @"UMUserSwitchBlockingTask";
      _os_log_impl(&dword_1A13F0000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v2, 0xCu);
    }
  }
}

id MCUMUserManagerErrorDomain()
{
  +[MCLazyInitializationUtilities initUserManagement];
  uint64_t v0 = (void *)_UMUserManagerErrorDomain;
  return v0;
}

id MCUMUserSessionProvisionTypeKey()
{
  +[MCLazyInitializationUtilities initUserManagement];
  uint64_t v0 = (void *)_kUMUserSessionProvisionTypeKey;
  return v0;
}

id MCUMUserSessionProvisionTypeEducation()
{
  +[MCLazyInitializationUtilities initUserManagement];
  uint64_t v0 = (void *)_kUMUserSessionProvisionTypeEducation;
  return v0;
}

id MCUMEducationUserSizeKey()
{
  +[MCLazyInitializationUtilities initUserManagement];
  uint64_t v0 = (void *)_kUMEducationUserSizeKey;
  return v0;
}

id MCAXBackBoardServerSessionClass()
{
  if (MCAXBackBoardServerSessionClass_onceToken != -1) {
    dispatch_once(&MCAXBackBoardServerSessionClass_onceToken, &__block_literal_global_251);
  }
  uint64_t v0 = (void *)MCAXBackBoardServerSessionClass_theClass;
  return v0;
}

void __MCAXBackBoardServerSessionClass_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AccessibilityUtilities.framework");
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  void v2[2] = __MCAXBackBoardServerSessionClass_block_invoke_2;
  v2[3] = &unk_1E5A67C60;
  id v3 = @"AXBackBoardServer";
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:v2];

  if (!MCAXBackBoardServerSessionClass_theClass)
  {
    id v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v5 = @"AXBackBoardServer";
      _os_log_impl(&dword_1A13F0000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __MCAXBackBoardServerSessionClass_block_invoke_2(uint64_t result, int a2, void *a3)
{
  if (a2)
  {
    result = [a3 classNamed:*(void *)(result + 32)];
    MCAXBackBoardServerSessionClass_theClass = result;
  }
  return result;
}

id MCPLPhotoLibraryClass()
{
  if (MCPLPhotoLibraryClass_onceToken != -1) {
    dispatch_once(&MCPLPhotoLibraryClass_onceToken, &__block_literal_global_257);
  }
  uint64_t v0 = (void *)MCPLPhotoLibraryClass_theClass;
  return v0;
}

void __MCPLPhotoLibraryClass_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/PhotoLibraryServices.framework");
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  void v2[2] = __MCPLPhotoLibraryClass_block_invoke_2;
  v2[3] = &unk_1E5A67C60;
  id v3 = @"PLPhotoLibrary";
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:v2];

  if (!MCPLPhotoLibraryClass_theClass)
  {
    id v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v5 = @"PLPhotoLibrary";
      _os_log_impl(&dword_1A13F0000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __MCPLPhotoLibraryClass_block_invoke_2(uint64_t result, int a2, void *a3)
{
  if (a2)
  {
    result = [a3 classNamed:*(void *)(result + 32)];
    MCPLPhotoLibraryClass_theClass = result;
  }
  return result;
}

id MCPLManagedAssetClass()
{
  if (MCPLManagedAssetClass_onceToken != -1) {
    dispatch_once(&MCPLManagedAssetClass_onceToken, &__block_literal_global_262);
  }
  uint64_t v0 = (void *)MCPLManagedAssetClass_theClass;
  return v0;
}

void __MCPLManagedAssetClass_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/PhotoLibraryServices.framework");
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  void v2[2] = __MCPLManagedAssetClass_block_invoke_2;
  v2[3] = &unk_1E5A67C60;
  id v3 = @"PLManagedAsset";
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:v2];

  if (!MCPLManagedAssetClass_theClass)
  {
    id v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v5 = @"PLManagedAsset";
      _os_log_impl(&dword_1A13F0000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __MCPLManagedAssetClass_block_invoke_2(uint64_t result, int a2, void *a3)
{
  if (a2)
  {
    result = [a3 classNamed:*(void *)(result + 32)];
    MCPLManagedAssetClass_theClass = result;
  }
  return result;
}

uint64_t MCCGImageSourceCreateImageAtIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[MCLazyInitializationUtilities initImageIO];
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_CGImageSourceCreateImageAtIndex;
  return v6(a1, a2, a3);
}

uint64_t MCCGImageSourceCreateWithData(uint64_t a1, uint64_t a2)
{
  +[MCLazyInitializationUtilities initImageIO];
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))_CGImageSourceCreateWithData;
  return v4(a1, a2);
}

uint64_t MCCGImageSourceGetCount(uint64_t a1)
{
  +[MCLazyInitializationUtilities initImageIO];
  int v2 = (uint64_t (*)(uint64_t))_CGImageSourceGetCount;
  return v2(a1);
}

id MCMailAccountClass()
{
  if (MCMailAccountClass_onceToken != -1) {
    dispatch_once(&MCMailAccountClass_onceToken, &__block_literal_global_267);
  }
  uint64_t v0 = (void *)MCMailAccountClass_theClass;
  return v0;
}

void __MCMailAccountClass_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/Message.framework");
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  void v2[2] = __MCMailAccountClass_block_invoke_2;
  v2[3] = &unk_1E5A67C60;
  id v3 = @"MailAccount";
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:v2];

  if (!MCMailAccountClass_theClass)
  {
    id v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v5 = @"MailAccount";
      _os_log_impl(&dword_1A13F0000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __MCMailAccountClass_block_invoke_2(uint64_t result, int a2, void *a3)
{
  if (a2)
  {
    result = [a3 classNamed:*(void *)(result + 32)];
    MCMailAccountClass_theClass = result;
  }
  return result;
}

id MCMailAccountManagedTag()
{
  +[MCLazyInitializationUtilities initMessage];
  uint64_t v0 = (void *)_MailAccountManagedTag;
  return v0;
}

uint64_t MCCTFontManagerCreateFontDescriptorsFromURL(uint64_t a1)
{
  +[MCLazyInitializationUtilities initCoreText];
  int v2 = (uint64_t (*)(uint64_t))_CTFontManagerCreateFontDescriptorsFromURL;
  return v2(a1);
}

id MCASPolicyPreflighterClass()
{
  if (MCASPolicyPreflighterClass_onceToken != -1) {
    dispatch_once(&MCASPolicyPreflighterClass_onceToken, &__block_literal_global_272);
  }
  uint64_t v0 = (void *)MCASPolicyPreflighterClass_theClass;
  return v0;
}

void __MCASPolicyPreflighterClass_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (DAEASBundle_onceToken != -1) {
    dispatch_once(&DAEASBundle_onceToken, &__block_literal_global_331);
  }
  MCASPolicyPreflighterClass_theClass = [(id)DAEASBundle_retval classNamed:@"ASPolicyPreflighter"];
  if (!MCASPolicyPreflighterClass_theClass)
  {
    uint64_t v0 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      int v1 = 138543362;
      int v2 = @"ASPolicyPreflighter";
      _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v1, 0xCu);
    }
  }
}

id MCkASSyncDefaultFoldersOnly()
{
  +[MCLazyInitializationUtilities initDAEAS];
  uint64_t v0 = (void *)_kASSyncDefaultFoldersOnly;
  return v0;
}

uint64_t MCEASOverSimplifiedStatusForError(void *a1)
{
  id v1 = a1;
  +[MCLazyInitializationUtilities initDAEAS];
  uint64_t v2 = _overSimplifiedStatusForError(v1);

  return v2;
}

id MCkMAActivationStateActivated()
{
  +[MCLazyInitializationUtilities initMobileActivation];
  uint64_t v0 = (void *)_kMAActivationStateActivated;
  return v0;
}

id MCkNotificationActivationStateChanged()
{
  +[MCLazyInitializationUtilities initMobileActivation];
  uint64_t v0 = (void *)_kNotificationActivationStateChanged;
  return v0;
}

uint64_t MCMAEGetActivationStateWithError(uint64_t a1)
{
  +[MCLazyInitializationUtilities initMobileActivation];
  uint64_t v2 = (uint64_t (*)(uint64_t))_MAEGetActivationStateWithError;
  return v2(a1);
}

uint64_t MCMAECopyActivationRecordWithError(uint64_t a1)
{
  +[MCLazyInitializationUtilities initMobileActivation];
  uint64_t v2 = (uint64_t (*)(uint64_t))_MAECopyActivationRecordWithError;
  return v2(a1);
}

__CFString *MCkESExchangeAccountWipeOnly()
{
  +[MCLazyInitializationUtilities initExchangeSyncExpress];
  if (_kESExchangeAccountWipeOnly) {
    uint64_t v0 = (__CFString *)_kESExchangeAccountWipeOnly;
  }
  else {
    uint64_t v0 = @"ESExchangeAccountWipeOnly";
  }
  return v0;
}

__CFString *MCkESExchangeDeviceID()
{
  +[MCLazyInitializationUtilities initExchangeSyncExpress];
  if (_kESExchangeDeviceID) {
    uint64_t v0 = (__CFString *)_kESExchangeDeviceID;
  }
  else {
    uint64_t v0 = @"ESExchangeDeviceID";
  }
  return v0;
}

__CFString *MCkESExchangeUserEnrollmentMode()
{
  +[MCLazyInitializationUtilities initExchangeSyncExpress];
  if (_kESExchangeUserEnrollmentMode) {
    uint64_t v0 = (__CFString *)_kESExchangeUserEnrollmentMode;
  }
  else {
    uint64_t v0 = @"ESExchangeUserEnrollmentMode";
  }
  return v0;
}

id MCLDAPSearchSettingsClass()
{
  if (MCLDAPSearchSettingsClass_onceToken != -1) {
    dispatch_once(&MCLDAPSearchSettingsClass_onceToken, &__block_literal_global_286);
  }
  uint64_t v0 = (void *)MCLDAPSearchSettingsClass_theClass;
  return v0;
}

void __MCLDAPSearchSettingsClass_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (DALDAPBundle_onceToken != -1) {
    dispatch_once(&DALDAPBundle_onceToken, &__block_literal_global_335);
  }
  MCLDAPSearchSettingsClass_theClass = [(id)DALDAPBundle_retval classNamed:@"LDAPSearchSettings"];
  if (!MCLDAPSearchSettingsClass_theClass)
  {
    uint64_t v0 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      int v1 = 138543362;
      uint64_t v2 = @"LDAPSearchSettings";
      _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_ERROR, "Could not load %{public}@", (uint8_t *)&v1, 0xCu);
    }
  }
}

uint64_t MCBYSetupAssistantNeedsToRun()
{
  +[MCLazyInitializationUtilities initSetupAssistant];
  uint64_t v0 = (uint64_t (*)(void))_BYSetupAssistantNeedsToRun;
  return v0();
}

id MCNEProfileIngestionClass()
{
  if (MCNEProfileIngestionClass_onceToken != -1) {
    dispatch_once(&MCNEProfileIngestionClass_onceToken, &__block_literal_global_291);
  }
  uint64_t v0 = (void *)MCNEProfileIngestionClass_theClass;
  return v0;
}

void __MCNEProfileIngestionClass_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/Frameworks/NetworkExtension.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_293];
}

void __MCNEProfileIngestionClass_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a2)
  {
    MCNEProfileIngestionClass_theClass = [v4 classNamed:@"NEProfileIngestion"];
  }
  else
  {
    uint64_t v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Could not load NetworkExtension framework.", v7, 2u);
    }
  }
}

id MCNEProfileIngestionHandlerClassForPayload(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)[objc_alloc((Class)MCNEProfileIngestionClass()) initWithNameAndType:@"ManagedConfiguration client" payloadType:v1];
  if (!v2)
  {
    uint64_t v3 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v1;
      _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_ERROR, "Could not instantiate NetworkExtension handler for %{public}@.", (uint8_t *)&v5, 0xCu);
    }
  }

  return v2;
}

void __MCBiometricKitClass_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v0 = URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/BiometricKit.framework");
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  void v2[2] = __MCBiometricKitClass_block_invoke_2;
  v2[3] = &unk_1E5A67C60;
  uint64_t v3 = @"BiometricKit";
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:v2];

  if (!MCBiometricKitClass_theClass)
  {
    id v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      int v5 = @"BiometricKit";
      _os_log_impl(&dword_1A13F0000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __MCBiometricKitClass_block_invoke_2(uint64_t result, int a2, void *a3)
{
  if (a2)
  {
    result = [a3 classNamed:*(void *)(result + 32)];
    MCBiometricKitClass_theClass = result;
  }
  return result;
}

uint64_t MCSBUserNotificationDontDismissOnUnlock()
{
  return _SBUserNotificationDontDismissOnUnlock;
}

uint64_t MCSBUserNotificationDismissOnLock()
{
  return _SBUserNotificationDismissOnLock;
}

uint64_t MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey()
{
  return _SBSApplicationLaunchFromURLOptionUnlockDeviceKey;
}

uint64_t MCSBSCopyFrontmostApplicationDisplayIdentifier()
{
  +[MCLazyInitializationUtilities initSpringBoardServices];
  id v0 = (uint64_t (*)(void))_SBSCopyFrontmostApplicationDisplayIdentifier;
  return v0();
}

uint64_t MCSBSSuspendFrontmostApplication()
{
  +[MCLazyInitializationUtilities initSpringBoardServices];
  id v0 = (uint64_t (*)(void))_SBSSuspendFrontmostApplication;
  return v0();
}

uint64_t MCSBSSpringBoardServerPort()
{
  +[MCLazyInitializationUtilities initSpringBoardServices];
  id v0 = (uint64_t (*)(void))_SBSSpringBoardServerPort;
  return v0();
}

uint64_t MCSBAddWebClipToHomeScreen(uint64_t a1, uint64_t a2)
{
  +[MCLazyInitializationUtilities initSpringBoardServices];
  id v4 = (uint64_t (*)(uint64_t, uint64_t))_SBAddWebClipToHomeScreen;
  return v4(a1, a2);
}

uint64_t MCSBGetScreenLockStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[MCLazyInitializationUtilities initSpringBoardServices];
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_SBGetScreenLockStatus;
  return v6(a1, a2, a3);
}

uint64_t MCSBRemoveWebClipFromHomeScreen(uint64_t a1, uint64_t a2)
{
  +[MCLazyInitializationUtilities initSpringBoardServices];
  id v4 = (uint64_t (*)(uint64_t, uint64_t))_SBRemoveWebClipFromHomeScreen;
  return v4(a1, a2);
}

uint64_t MCOSLogValidateProfilePayload(void *a1, uint64_t a2)
{
  id v3 = a1;
  +[MCLazyInitializationUtilities initLoggingSupport];
  uint64_t v4 = _OSLogValidateProfilePayload(v3, a2);

  return v4;
}

uint64_t MCOSLogInstallProfilePayload(void *a1, uint64_t a2)
{
  id v3 = a1;
  +[MCLazyInitializationUtilities initLoggingSupport];
  uint64_t v4 = _OSLogInstallProfilePayload(v3, a2);

  return v4;
}

uint64_t MCOSLogRemoveProfilePayload(void *a1, uint64_t a2)
{
  id v3 = a1;
  +[MCLazyInitializationUtilities initLoggingSupport];
  uint64_t v4 = _OSLogRemoveProfilePayload(v3, a2);

  return v4;
}

id MCAIDAMutableServiceContextClass()
{
  id v0 = AppleIDSSOAuthenticationBundle();
  id v1 = [v0 classNamed:@"AIDAMutableServiceContext"];

  return v1;
}

id AppleIDSSOAuthenticationBundle()
{
  if (AppleIDSSOAuthenticationBundle_onceToken != -1) {
    dispatch_once(&AppleIDSSOAuthenticationBundle_onceToken, &__block_literal_global_339);
  }
  id v0 = (void *)AppleIDSSOAuthenticationBundle_retval;
  return v0;
}

id MCAIDAServiceOwnersManagerClass()
{
  id v0 = AppleIDSSOAuthenticationBundle();
  id v1 = [v0 classNamed:@"AIDAServiceOwnersManager"];

  return v1;
}

id MCAIDAServiceTypeCloud()
{
  +[MCLazyInitializationUtilities initAppleIDSSOAuthentication];
  id v0 = (void *)_AIDAServiceTypeCloud;
  return v0;
}

uint64_t MCAMSAuthenticateOptionsClass()
{
  if (AppleMediaServicesBundle_onceToken != -1) {
    dispatch_once(&AppleMediaServicesBundle_onceToken, &__block_literal_global_343);
  }
  id v0 = (void *)AppleMediaServicesBundle_retval;
  return [v0 classNamed:@"AMSAuthenticateOptions"];
}

uint64_t MCAMSUIAuthenticateTaskClass()
{
  if (AppleMediaServicesUIBundle_onceToken != -1) {
    dispatch_once(&AppleMediaServicesUIBundle_onceToken, &__block_literal_global_347);
  }
  id v0 = (void *)AppleMediaServicesUIBundle_retval;
  return [v0 classNamed:@"AMSUIAuthenticateTask"];
}

id MCAKAuthenticationUsernameKey()
{
  +[MCLazyInitializationUtilities initAuthKit];
  id v0 = (void *)_AKAuthenticationUsernameKey;
  return v0;
}

id MCAKAuthenticationPasswordKey()
{
  +[MCLazyInitializationUtilities initAuthKit];
  id v0 = (void *)_AKAuthenticationPasswordKey;
  return v0;
}

id MCAKAuthenticationAlternateDSIDKey()
{
  +[MCLazyInitializationUtilities initAuthKit];
  id v0 = (void *)_AKAuthenticationAlternateDSIDKey;
  return v0;
}

uint64_t MCAKAnisetteProvisioningControllerClass()
{
  if (AuthKitBundle_onceToken != -1) {
    dispatch_once(&AuthKitBundle_onceToken, &__block_literal_global_351);
  }
  id v0 = (void *)AuthKitBundle_retval;
  return [v0 classNamed:@"AKAnisetteProvisioningController"];
}

id MCLKLogoutSupportClass()
{
  if (MCLKLogoutSupportClass_onceToken != -1) {
    dispatch_once(&MCLKLogoutSupportClass_onceToken, &__block_literal_global_321);
  }
  id v0 = (void *)MCLKLogoutSupportClass_LKLogoutSupportClass;
  return v0;
}

uint64_t __MCLKLogoutSupportClass_block_invoke()
{
  if (LoginKitBundle_onceToken != -1) {
    dispatch_once(&LoginKitBundle_onceToken, &__block_literal_global_355);
  }
  uint64_t result = [(id)LoginKitBundle_retval classNamed:@"LKLogoutSupport"];
  MCLKLogoutSupportClass_LKLogoutSupportClass = result;
  return result;
}

void __DAEASBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/ExchangeSync.framework/Frameworks/DAEAS.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_333];
}

void __DAEASBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __DALDAPBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DALDAP.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_337];
}

void __DALDAPBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AppleIDSSOAuthenticationBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_341];
}

void __AppleIDSSOAuthenticationBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AppleMediaServicesBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleMediaServices.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_345];
}

void __AppleMediaServicesBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AppleMediaServicesUIBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_349];
}

void __AppleMediaServicesUIBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __AuthKitBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AuthKit.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_353];
}

void __AuthKitBundle_block_invoke_2(int a1, int a2, id obj)
{
}

void __LoginKitBundle_block_invoke()
{
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/LoginKit.framework");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:v0 completionBlock:&__block_literal_global_357];
}

void __LoginKitBundle_block_invoke_2(int a1, int a2, id obj)
{
}

uint64_t MCHCUCreateCSR(void *a1)
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)*MEMORY[0x1E4F3B708];
  keys[0] = *(void **)MEMORY[0x1E4F3B718];
  keys[1] = v2;
  values[0] = *(void **)MEMORY[0x1E4F3B760];
  values[1] = @"1024";
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int valuePtr = 5;
  CFTypeRef cf = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  CFDictionaryRef v5 = CFDictionaryCreate(v3, MEMORY[0x1E4F3B970], &cf, 1, 0, 0);
  if (cf) {
    CFRelease(cf);
  }
  SecKeyRef v11 = 0;
  SecKeyRef publicKey = 0;
  OSStatus v6 = SecKeyGeneratePair(v4, &publicKey, &v11);
  if (v4) {
    CFRelease(v4);
  }
  if (v6)
  {
    uint64_t v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Could not generate public/private key pair for CSR.", buf, 2u);
    }
    if (v5) {
      CFRelease(v5);
    }
    uint64_t CertificateRequestWithParameters = 0;
  }
  else
  {
    memset(cStr, 0, 37);
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    uuid_unparse(out, cStr);
    CFStringRef v9 = CFStringCreateWithCString(v3, cStr, 0x600u);
    *(void *)audit_token_t buf = *MEMORY[0x1E4F3BB98];
    char v18 = *MEMORY[0x1E4F3B470];
    CFStringRef v19 = v9;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v15 = buf;
    uint64_t v16 = 0;
    [v1 setObject:publicKey forKey:@"PublicKey"];
    [v1 setObject:v11 forKey:@"PrivateKey"];
    uint64_t CertificateRequestWithParameters = SecGenerateCertificateRequestWithParameters();
    if (v5) {
      CFRelease(v5);
    }
    if (v9) {
      CFRelease(v9);
    }
  }

  return CertificateRequestWithParameters;
}

SecCertificateRef MCHCUCopyCertificateFromKeychainForMappedLabel(void *a1)
{
  SecCertificateRef certificateRef = 0;
  id v1 = _copyObjectFromKeychainForLabel(a1);
  uint64_t v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 != SecCertificateGetTypeID())
    {
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == SecIdentityGetTypeID())
      {
        SecIdentityCopyCertificate((SecIdentityRef)v2, &certificateRef);
        CFRelease(v2);
        return certificateRef;
      }
      else
      {
        CFRelease(v2);
        return 0;
      }
    }
  }
  return (SecCertificateRef)v2;
}

void *_copyObjectFromKeychainForLabel(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  uint64_t v2 = _persistentKeyMapTable();
  CFTypeID v3 = [v2 objectForKey:v1];

  if (v3) {
    CFTypeID v4 = +[MCKeychain copyItemWithPersistentID:v3 useSystemKeychain:1];
  }
  else {
    CFTypeID v4 = 0;
  }

  return v4;
}

id MCHCUSetHostCertificateDataForMappedLabel(const __CFData *a1, void *a2)
{
  id v3 = a2;
  SecCertificateRef v4 = SecCertificateCreateWithData(0, a1);
  if (v4)
  {
    SecCertificateRef v5 = v4;
    id v6 = [v3 stringByAppendingString:@"-HostCert"];
    if (v6)
    {
      uint64_t v7 = +[MCKeychain saveItem:v5 withLabel:v6 group:@"apple" useSystemKeychain:1];
      if (v7)
      {
        id v8 = _persistentKeyMapTable();
        [v8 setObject:v7 forKey:v6];
        id v9 = v8;
        id v10 = MCiPCUKeychainMapPath();
        [v9 MCWriteToBinaryFile:v10];
      }
    }
    else
    {
      uint64_t v7 = 0;
    }

    CFRelease(v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void *MCHCUCopyHostCertificateForMappedLabel(void *a1)
{
  id v1 = [a1 stringByAppendingString:@"-HostCert"];
  uint64_t v2 = _copyObjectFromKeychainForLabel(v1);

  return v2;
}

id _persistentKeyMapTable()
{
  id v0 = (void *)MEMORY[0x1E4F1CA60];
  id v1 = MCiPCUKeychainMapPath();
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];

  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  return v2;
}

__CFString *MCGestaltGetDeviceName()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iDevice";
  }
  return v0;
}

uint64_t MCGestaltIsiPad()
{
  if (MCGestaltIsiPad_onceToken != -1) {
    dispatch_once(&MCGestaltIsiPad_onceToken, &__block_literal_global_15);
  }
  return MCGestaltIsiPad_isiPad;
}

void __MCGestaltIsiPad_block_invoke()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  id v1 = v0;
  MCGestaltIsiPad_isiPad = [(__CFString *)v0 isEqualToString:@"iPad"];
}

uint64_t MCGestaltIsAppleTV()
{
  if (MCGestaltIsAppleTV_onceToken != -1) {
    dispatch_once(&MCGestaltIsAppleTV_onceToken, &__block_literal_global_15);
  }
  return MCGestaltIsAppleTV_isAppleTV;
}

void __MCGestaltIsAppleTV_block_invoke()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  id v1 = v0;
  MCGestaltIsAppleTV_isAppleTV = [(__CFString *)v0 isEqualToString:@"AppleTV"];
}

uint64_t MCGestaltIsWatch()
{
  if (MCGestaltIsWatch_onceToken != -1) {
    dispatch_once(&MCGestaltIsWatch_onceToken, &__block_literal_global_20);
  }
  return MCGestaltIsWatch_isWatch;
}

void __MCGestaltIsWatch_block_invoke()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  id v1 = v0;
  MCGestaltIsWatch_isWatch = [(__CFString *)v0 isEqualToString:@"Watch"];
}

uint64_t MCGestaltIsHomePod()
{
  if (MCGestaltIsHomePod_onceToken != -1) {
    dispatch_once(&MCGestaltIsHomePod_onceToken, &__block_literal_global_25);
  }
  return MCGestaltIsHomePod_isHomePod;
}

void __MCGestaltIsHomePod_block_invoke()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  id v1 = v0;
  MCGestaltIsHomePod_isHomePod = [(__CFString *)v0 isEqualToString:@"AudioAccessory"];
}

uint64_t MCGestaltIsPhone()
{
  if (MCGestaltIsPhone_onceToken != -1) {
    dispatch_once(&MCGestaltIsPhone_onceToken, &__block_literal_global_30);
  }
  return MCGestaltIsPhone_isPhone;
}

void __MCGestaltIsPhone_block_invoke()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  id v1 = v0;
  MCGestaltIsPhone_isPhone = -[__CFString isEqualToString:](v0, "isEqualToString:");
}

uint64_t MCGestaltIsVisionDevice()
{
  if (MCGestaltIsVisionDevice_onceToken != -1) {
    dispatch_once(&MCGestaltIsVisionDevice_onceToken, &__block_literal_global_32_0);
  }
  return MCGestaltIsVisionDevice_isVisionDevice;
}

void __MCGestaltIsVisionDevice_block_invoke()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  id v1 = v0;
  MCGestaltIsVisionDevice_isVisionDevice = [(__CFString *)v0 isEqualToString:@"RealityDevice"];
}

id MCGestaltGetDeviceUUID()
{
  id v0 = (void *)MGCopyAnswer();
  return v0;
}

id MCGestaltGetDeviceSerialNumber()
{
  id v0 = (void *)MGCopyAnswer();
  return v0;
}

id MCGestaltGetDeviceID()
{
  if (MCGestaltIsAppleTV_onceToken != -1) {
    dispatch_once(&MCGestaltIsAppleTV_onceToken, &__block_literal_global_15);
  }
  if (MCGestaltIsAppleTV_isAppleTV)
  {
    id v0 = (void *)MGCopyAnswer();
    if (!v0)
    {
      id v0 = (void *)MGCopyAnswer();
      if (!v0) {
        id v0 = (void *)MGCopyAnswer();
      }
    }
  }
  else
  {
    id v0 = 0;
  }
  return v0;
}

id MCGestaltGetProductName()
{
  id v0 = (void *)MGCopyAnswer();
  return v0;
}

id MCGestaltGetWiFiMAC()
{
  id v0 = (void *)MGCopyAnswer();
  return v0;
}

id MCGestaltGetModelNumber()
{
  id v0 = (void *)MGCopyAnswer();
  return v0;
}

uint64_t MCGestaltHasInternetTetheringCapability()
{
  return MEMORY[0x1F417CE00](@"personal-hotspot");
}

uint64_t MCGestaltIsInternalBuild()
{
  return MEMORY[0x1F417CE00](@"apple-internal-install");
}

uint64_t MCGestaltHasPearlIDCapability()
{
  return MEMORY[0x1F417CE00](@"8olRm6C1xqr7AJGpLRnpSw");
}

uint64_t MCGestaltHasOysterCapability()
{
  return MEMORY[0x1F417CE00](@"OysterCapability");
}

uint64_t MCGestaltHasBiometricCapability()
{
  if (MCGestaltHasBiometricCapability_onceToken != -1) {
    dispatch_once(&MCGestaltHasBiometricCapability_onceToken, &__block_literal_global_70);
  }
  return MCGestaltHasBiometricCapability_hasBiometrics;
}

void __MCGestaltHasBiometricCapability_block_invoke()
{
  id v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    id v1 = v0;
    MCGestaltHasBiometricCapability_hasBiometrics = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    CFRelease(v1);
  }
  if (!MCGestaltHasBiometricCapability_hasBiometrics)
  {
    uint64_t v2 = (const void *)MGCopyAnswer();
    if (v2)
    {
      id v3 = v2;
      MCGestaltHasBiometricCapability_hasBiometrics = CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
      CFRelease(v3);
    }
  }
}

uint64_t MCGestaltSupportsMultiUser()
{
  if (MCGestaltIsiPad_onceToken != -1) {
    dispatch_once(&MCGestaltIsiPad_onceToken, &__block_literal_global_15);
  }
  if (!MCGestaltIsiPad_isiPad) {
    return 0;
  }
  return MEMORY[0x1F417CE00](@"4fT83+9coO3VAUnlxuOOcw");
}

__CFString *MCLockdownGetDeviceName()
{
  id v0 = (__CFString *)MGCopyAnswer();
  if (!v0) {
    id v0 = @"iPhone";
  }
  return v0;
}

uint64_t MCLockdownSetDeviceName(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 length])
  {
LABEL_6:
    uint64_t v2 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = lockdown_connect();
  if (v2)
  {
    int v3 = lockdown_set_value();
    lockdown_disconnect();
    if (!v3)
    {
      uint64_t v2 = 1;
      goto LABEL_7;
    }
    SecCertificateRef v4 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Unable to set device name with error %d", (uint8_t *)v6, 8u);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v2;
}

id MCLockdownGetDeviceColor()
{
  id v0 = (void *)MGCopyAnswer();
  return v0;
}

id MCLockdownGetDeviceCapacity()
{
  id v0 = (void *)MGCopyAnswer();
  id v1 = [v0 objectForKey:*MEMORY[0x1E4FBA0F0]];

  return v1;
}

id MCLockdownGetDiskCapacity()
{
  id v0 = (void *)MGCopyAnswer();
  id v1 = [v0 objectForKey:*MEMORY[0x1E4FBA0F8]];

  return v1;
}

id MCLockdownGetDeviceAvailableCapacity()
{
  id v0 = (void *)MGCopyAnswer();
  id v1 = [v0 objectForKey:*MEMORY[0x1E4FBA0D8]];

  return v1;
}

uint64_t MCLockdownCopyBuiltInIdentity()
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    uint64_t v1 = lockdown_copy_identity();
    lockdown_disconnect();
    return v1;
  }
  return result;
}

id MCLockdownGetDeviceIntermediateCertificates()
{
  void v2[2] = *MEMORY[0x1E4F143B8];
  if (MCLockdownGetDeviceIntermediateCertificates_once != -1) {
    dispatch_once(&MCLockdownGetDeviceIntermediateCertificates_once, &__block_literal_global_93_0);
  }
  v2[0] = MCLockdownGetDeviceIntermediateCertificates_iPhoneDeviceCA;
  v2[1] = MCLockdownGetDeviceIntermediateCertificates_iPhoneCA;
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  return v0;
}

void __MCLockdownGetDeviceIntermediateCertificates_block_invoke()
{
  id v1 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:@"/System/Library/Lockdown/iPhoneDeviceCA.pem"];
  MCLockdownGetDeviceIntermediateCertificates_iPhoneDeviceCA = +[MCCrypto copyCertificateRefFromPEMData:v1];
  id v0 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:@"/System/Library/Lockdown/iPhoneCA.pem"];
  MCLockdownGetDeviceIntermediateCertificates_iPhoneCA = +[MCCrypto copyCertificateRefFromPEMData:v0];
}

id MCLockdownLastCloudBackupDate()
{
  id v0 = (void *)lockdown_connect();
  if (v0)
  {
    id v1 = (void *)lockdown_copy_value();
    lockdown_disconnect();
    if (v1)
    {
      id v0 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v1, "unsignedLongLongValue") + 978307200.0);
    }
    else
    {
      id v0 = 0;
    }
  }
  return v0;
}

BOOL MCIsDeviceActivated()
{
  CFBooleanRef v0 = (const __CFBoolean *)lockdown_copy_brickState();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  BOOL v2 = CFBooleanGetValue(v0) == 0;
  CFRelease(v1);
  return v2;
}

BOOL MCLockdownDeletePairingRecords()
{
  return lockdown_delete_pair_records() == 0;
}

id MCLockdownOperationQueue()
{
  if (MCLockdownOperationQueue_onceToken != -1) {
    dispatch_once(&MCLockdownOperationQueue_onceToken, &__block_literal_global_110_0);
  }
  CFBooleanRef v0 = (void *)MCLockdownOperationQueue_queue;
  return v0;
}

uint64_t __MCLockdownOperationQueue_block_invoke()
{
  MCLockdownOperationQueue_queue = (uint64_t)dispatch_queue_create("MC Lockdown Operation Queue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t MCSendRestrictionChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending restriction changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.restrictionchanged" cStringUsingEncoding:4]);
}

uint64_t MCSendPasscodeChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending passcode changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.passcodechanged" cStringUsingEncoding:4]);
}

void MCSendPasscodePolicyChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending passcode policy changed notification.", v2, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PINPolicyChangedNotification", 0, 0, 1u);
}

uint64_t MCSendKeyboardSettingsChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending keyboard settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.keyboardsettingschanged" cStringUsingEncoding:4]);
}

uint64_t MCSendUserNotificationsSettingsChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Notifications settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.usernotificationssettingschanged" cStringUsingEncoding:4]);
}

uint64_t MCSendHomeScreenLayoutChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Home Screen Layout changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.homescreenlayoutchanged" cStringUsingEncoding:4]);
}

uint64_t MCSendNewsSettingsChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending News settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.newssettingschanged" cStringUsingEncoding:4]);
}

uint64_t MCSendProfileListChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending profile list changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.profileListChanged" cStringUsingEncoding:4]);
}

uint64_t MCSendEffectiveSettingsChangedNotification(int a1)
{
  if (MCSendEffectiveSettingsChangedNotification_once != -1) {
    dispatch_once(&MCSendEffectiveSettingsChangedNotification_once, &__block_literal_global_16);
  }
  +[MCSignpostManager willPostEffectiveSettingsChangedNotification];
  BOOL v2 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SecCertificateRef v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEFAULT, "Sending effective settings changed notification.", v4, 2u);
  }
  notify_set_state(MCSendEffectiveSettingsChangedNotification_token, a1);
  return notify_post((const char *)[@"com.apple.managedconfiguration.effectivesettingschanged" UTF8String]);
}

uint64_t __MCSendEffectiveSettingsChangedNotification_block_invoke()
{
  CFBooleanRef v0 = (const char *)[@"com.apple.managedconfiguration.effectivesettingschanged" UTF8String];
  return notify_register_check(v0, &MCSendEffectiveSettingsChangedNotification_token);
}

uint64_t MCSendClientTruthChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Client Restrictions Changed notification", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.clientrestrictionschanged" cStringUsingEncoding:4]);
}

uint64_t MCSendAppWhitelistChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending App Whitelist Changed notification", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.appwhitelistdidchange" UTF8String]);
}

uint64_t MCSendCloudConfigurationDetailsChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Cloud Configuration Changed notification", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.cloudConfigurationChanged" UTF8String]);
}

uint64_t MCSendWebContentFilterChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Web Content Filter Changed notification", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.webContentFilterChanged" UTF8String]);
}

uint64_t MCSendWebContentFilterUIActiveChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Web Content Filter UI Active Changed notification", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.webFilterUIActiveDidChange" UTF8String]);
}

uint64_t MCSendWebContentFilterTypeChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Web Content Filter Type Changed notification", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.webContentFilterTypeChanged" UTF8String]);
}

uint64_t MCSendAirPlayPreferencesChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending AirPlay preferences changed notification.", v2, 2u);
  }
  return notify_post("com.apple.airplay.prefsChanged");
}

uint64_t MCSendUnlockScreenTypeDidChangeNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending unlock screen type changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.unlockScreenTypeDidChange" UTF8String]);
}

void MCSendActivationLockBypassCodeWasStoredNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending activation lock bypass code was generated notification.", v2, 2u);
  }
  CFBooleanRef v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ActivationLockBypassCodeWasStored" object:0];
}

uint64_t MCSendManagedBooksChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Managed Books changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"MCManagedBooksChanged" UTF8String]);
}

uint64_t MCSendManagedAppsChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Managed Apps changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.managedAppsChanged" UTF8String]);
}

uint64_t MCSendSafariCookiePolicyChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Safari cookie policy changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.mobilesafari.SetCookiePolicy" UTF8String]);
}

uint64_t MCSendAllowPasscodeModificationChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending allowPasscodeModification changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.allowpasscodemodificationchanged" UTF8String]);
}

uint64_t MCSendRemovedSystemAppsChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Removed System Apps changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.removedSystemAppsChanged" UTF8String]);
}

uint64_t MCSendDiagnosticsCollectedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Diagnostics collected notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.ManagedConfiguration.diagnosticsCollected" UTF8String]);
}

uint64_t MCSendAllowHealthDataSubmissionChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending allowHealthDataSubmission changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.allowhealthdatasubmissionchanged" UTF8String]);
}

uint64_t MCSendDependencyChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending Dependency Changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.dependencydidchange" UTF8String]);
}

uint64_t MCSendTriggerRollKeybagsNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending rolld notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.rolld" UTF8String]);
}

uint64_t MCSendActivationRecordStoredNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending activation record stored notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.activationrecordstored" UTF8String]);
}

uint64_t MCSendCleanupMigrationFinishedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending cleanup migration finished notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.cleanupmigrationfinished" UTF8String]);
}

uint64_t MCSendPasscodeComplianceChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending passcode compliance changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.passcodecompliancechanged" UTF8String]);
}

uint64_t MCSendClearPasscodeGenerationCachesNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending clear passcode generation caches notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.clearpasscodegenerationcaches" cStringUsingEncoding:4]);
}

uint64_t MCSendExternalIntelligenceWorkspaceListChangedNotification()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEFAULT, "Sending external intelligence workspace changed notification.", v2, 2u);
  }
  return notify_post((const char *)[@"com.apple.managedconfiguration.externalintelligenceworkspacelistchanged" cStringUsingEncoding:4]);
}

void sub_1A143076C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1434EF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void MCActivationUtilitiesDeactivated()
{
  CFBooleanRef v0 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_INFO, "Device deactivated. Clearing activation record cache.", v2, 2u);
  }
  CFBooleanRef v1 = +[MCActivationUtilities sharedInstance];
  [v1 _clearCache];
}

void sub_1A14353B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1435534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void ___nonPrivacySensitiveEAPKeys_block_invoke()
{
  v4[17] = *MEMORY[0x1E4F143B8];
  CFBooleanRef v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"AcceptEAPTypes";
  v4[1] = @"PayloadCertificateAnchorUUID";
  v4[2] = @"TLSTrustedCertificates";
  void v4[3] = @"TLSTrustedServerCommonNames";
  void v4[4] = @"TLSTrustedServerNames";
  v4[5] = @"TLSAllowTrustExceptions";
  v4[6] = @"TLSCertificateIsRequired";
  v4[7] = @"TTLSInnerAuthentication";
  v4[8] = @"TLSMinimumVersion";
  void v4[9] = @"TLSMaximumVersion";
  v4[10] = @"EAPFASTUsePAC";
  void v4[11] = @"EAPFASTProvisionPAC";
  v4[12] = @"EAPFASTProvisionPACAnonymously";
  v4[13] = @"EAPSIMNumberOfRANDs";
  v4[14] = @"EAPSIMAKAConservativePeer";
  v4[15] = @"EAPSIMAKAPseudonymIdentityLifetimeHours";
  uint8_t v4[16] = @"EAPSIMAKAEncryptedIdentityEnabled";
  CFBooleanRef v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:17];
  uint64_t v2 = [v0 setWithArray:v1];
  int v3 = (void *)_nonPrivacySensitiveEAPKeys_keys;
  _nonPrivacySensitiveEAPKeys_keys = v2;
}

void HMAC_SHA256Prf(void *key, size_t keyLength, const void *a3, size_t a4, void *a5)
{
  memset(&v8, 0, sizeof(v8));
  CCHmacInit(&v8, 2u, key, keyLength);
  CCHmacUpdate(&v8, a3, a4);
  CCHmacFinal(&v8, a5);
}

double _MCMachTimeToSeconds(unint64_t a1)
{
  if (_MCMachTimeToSeconds_onceToken != -1) {
    dispatch_once(&_MCMachTimeToSeconds_onceToken, &__block_literal_global_21);
  }
  return *(double *)&_MCMachTimeToSeconds_sFactor * (double)a1;
}

uint64_t MCHasMDMMigrated()
{
  uint64_t v4 = 0;
  SecCertificateRef v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  CFBooleanRef v0 = migrationCheckQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MCHasMDMMigrated_block_invoke;
  block[3] = &unk_1E5A67EE8;
  block[4] = &v4;
  dispatch_sync(v0, block);

  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __MCHasMDMMigrated_block_invoke(uint64_t a1)
{
  if (kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_2_migrationCheckQueueHasMDMMigrated)
  {
    char v2 = 1;
    goto LABEL_12;
  }
  int v3 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v4 = MCSystemMetadataFilePath();
  SecCertificateRef v5 = [v3 dataWithContentsOfFile:v4];

  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v5 options:0 format:0 error:0];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_7:
      uint64_t v6 = 0;
    }
  }
  char v7 = [v6 objectForKey:@"LastMDMMigratedBuild"];
  CCHmacContext v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = MCLegacyMetadataFilePath();
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_2_migrationCheckQueueHasMDMMigrated = 0;
  }
  else
  {
    SecKeyRef v11 = MCProductBuildVersion();
    kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_2_migrationCheckQueueHasMDMMigrated = [v7 isEqualToString:v11];
  }
  char v2 = kMCMetaStopFilteringGrandfatheredRestrictions_block_invoke_2_migrationCheckQueueHasMDMMigrated;
LABEL_12:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
}

uint64_t MCIsBundleIDRunning(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:a1];
  char v2 = [MEMORY[0x1E4F963E8] handleForPredicate:v1 error:0];
  int v3 = [v2 currentState];
  uint64_t v4 = [v3 isRunning];

  return v4;
}

id MCFrontmostApplicationBundleIdentifier()
{
  CFBooleanRef v0 = (void *)MCSBSCopyFrontmostApplicationDisplayIdentifier();
  return v0;
}

uint64_t MCIsEffectivelyInAppWhitelistMode()
{
  CFBooleanRef v0 = +[MCRestrictionManager sharedManager];
  int v1 = [v0 appWhitelistState];

  if (v1 != 6 && v1 != 0) {
    return 1;
  }
  int v3 = [MCAXBackBoardServerSessionClass() server];
  BOOL v4 = [v3 currentGuidedAccessModeAndSessionApp:0] != 0;

  return v4;
}

id MCEffectiveSingleAppModeBundleID()
{
  CFBooleanRef v0 = [MCAXBackBoardServerSessionClass() server];
  id v10 = 0;
  uint64_t v1 = [v0 currentGuidedAccessModeAndSessionApp:&v10];
  id v2 = v10;

  if (v1)
  {
    id v3 = v2;
  }
  else
  {
    BOOL v4 = +[MCRestrictionManager sharedManager];
    int v5 = [v4 appWhitelistState];
    if (v5) {
      BOOL v6 = v5 == 6;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      id v3 = 0;
    }
    else
    {
      char v7 = [v4 effectiveWhitelistedAppsAndOptions];
      CCHmacContext v8 = [v7 firstObject];

      id v3 = [v8 objectForKeyedSubscript:@"Identifier"];
    }
  }

  return v3;
}

uint64_t MCCTHasTelephony()
{
  if (MCCTHasTelephony_once != -1) {
    dispatch_once(&MCCTHasTelephony_once, &__block_literal_global_23);
  }
  return MCCTHasTelephony_hasTelephony;
}

void __MCCTHasTelephony_block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID()) {
      MCCTHasTelephony_hasTelephony = CFBooleanGetValue(v1) != 0;
    }
    CFRelease(v1);
  }
}

uint64_t MCCTHasCellular()
{
  if (MCCTHasCellular_once != -1) {
    dispatch_once(&MCCTHasCellular_once, &__block_literal_global_3_0);
  }
  return MCCTHasCellular_hasCellular;
}

void __MCCTHasCellular_block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID()) {
      MCCTHasCellular_hasCellular = CFBooleanGetValue(v1) != 0;
    }
    CFRelease(v1);
  }
}

id MCCTIMEI()
{
  if (MCCTIMEI_once != -1) {
    dispatch_once(&MCCTIMEI_once, &__block_literal_global_8_0);
  }
  CFBooleanRef v0 = (void *)MCCTIMEI_imei;
  return v0;
}

uint64_t __MCCTIMEI_block_invoke()
{
  CFBooleanRef v0 = _EquipmentInfo();
  BOOL v4 = [v0 IMEI];

  if ([v4 length])
  {
    CFBooleanRef v1 = [MEMORY[0x1E4F28E78] stringWithString:v4];
    if ((unint64_t)[v1 length] >= 3) {
      [v1 insertString:@" " atIndex:2];
    }
    if ((unint64_t)[v1 length] >= 0xA) {
      [v1 insertString:@" " atIndex:9];
    }
    if ((unint64_t)[v1 length] >= 0x11) {
      [v1 insertString:@" " atIndex:16];
    }
    CFTypeID v2 = (void *)MCCTIMEI_imei;
    MCCTIMEI_imei = (uint64_t)v1;
  }
  return MEMORY[0x1F4181820]();
}

id _EquipmentInfo()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_CoreTelephonyClient_onceToken != -1) {
    dispatch_once(&_CoreTelephonyClient_onceToken, &__block_literal_global_12_0);
  }
  id v0 = (id)_CoreTelephonyClient_coreTelephonyClient;
  CFBooleanRef v1 = v0;
  if (!v0)
  {
    SecKeyRef v11 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_ERROR, "nil client passed to _DataServiceSubscriptionContextFromClient", buf, 2u);
    }
    goto LABEL_23;
  }
  id v22 = 0;
  CFTypeID v2 = [v0 getPreferredDataSubscriptionContextSync:&v22];
  id v3 = v22;
  BOOL v4 = v3;
  if (v2)
  {
    id v21 = v3;
    int v5 = [v1 getSIMStatus:v2 error:&v21];
    id v6 = v21;

    if (v5)
    {
      if (![v5 isEqualToString:*MEMORY[0x1E4F241F0]])
      {
        id v13 = v2;
        goto LABEL_19;
      }
      uint64_t v7 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)audit_token_t buf = 0;
        CCHmacContext v8 = "rejecting data SIM that isn't inserted";
        id v9 = v7;
        uint32_t v10 = 2;
LABEL_16:
        _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
    else
    {
      uint64_t v14 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)audit_token_t buf = 138543362;
        id v24 = v6;
        CCHmacContext v8 = "getSIMStatus failed: %{public}@";
        id v9 = v14;
        uint32_t v10 = 12;
        goto LABEL_16;
      }
    }
    id v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v12 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    id v24 = v4;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEFAULT, "getPreferredDataSubscriptionContextSync failed: %{public}@", buf, 0xCu);
  }
  id v13 = 0;
  id v6 = v4;
LABEL_20:

  if (!v13)
  {
LABEL_23:
    uint64_t v15 = 0;
    goto LABEL_27;
  }
  id v20 = 0;
  uint64_t v15 = [v1 getMobileEquipmentInfoFor:v13 error:&v20];
  id v16 = v20;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    char v18 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v24 = v16;
      _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_DEFAULT, "getMobileEquipmentInfoFor:error: failed: %{public}@", buf, 0xCu);
    }
  }

LABEL_27:
  return v15;
}

id MCCTMEID()
{
  if (MCCTMEID_once != -1) {
    dispatch_once(&MCCTMEID_once, &__block_literal_global_10);
  }
  id v0 = (void *)MCCTMEID_meid;
  return v0;
}

void __MCCTMEID_block_invoke()
{
  id v0 = _EquipmentInfo();
  id obj = [v0 MEID];

  if ([obj length]) {
    objc_storeStrong((id *)&MCCTMEID_meid, obj);
  }
}

BOOL MCCTHasGSM()
{
  id v0 = MCCTIMEI();
  BOOL v1 = v0 != 0;

  return v1;
}

BOOL MCCTHasCDMA()
{
  id v0 = MCCTMEID();
  BOOL v1 = v0 != 0;

  return v1;
}

BOOL MCCTSetManagedCellularProfile(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = _CTServerConnectionCreate();
  if (v4)
  {
    uint64_t v12 = (const void *)v4;
    uint64_t ManagedCellularProfile = _CTServerConnectionLoadManagedCellularProfile();
    BOOL v14 = ManagedCellularProfile == 0;
    if (a2 && ManagedCellularProfile)
    {
      errorFromCTError(ManagedCellularProfile);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v12);
  }
  else if (a2)
  {
    cannotConnectError(0, v5, v6, v7, v8, v9, v10, v11);
    BOOL v14 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id errorFromCTError(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a1 == 2)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F285A8];
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:HIDWORD(a1)];
    id v17 = MCErrorArray(@"MACH_ERROR_P_CODE", v10, v11, v12, v13, v14, v15, v16, v9);
    uint64_t v6 = [v7 MCErrorWithDomain:v8 code:a1 >> 32 descriptionArray:v17 errorType:@"MCFatalError"];
  }
  else if (a1 == 1)
  {
    CFTypeID v2 = [NSString stringWithUTF8String:strerror(SHIDWORD(a1))];
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F28798];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = v2;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v6 = [v3 errorWithDomain:v4 code:a1 >> 32 userInfo:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

id cannotConnectError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"CELLULAR_CANNOT_CONNECT", a2, a3, a4, a5, a6, a7, a8, 0);
  uint64_t v10 = [v8 MCErrorWithDomain:@"MCCellularErrorDomain" code:36001 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

BOOL MCCTClearManagedCellularProfile(void *a1)
{
  uint64_t v2 = _CTServerConnectionCreate();
  if (v2)
  {
    uint64_t v10 = (const void *)v2;
    uint64_t v11 = _CTServerConnectionUnloadManagedCellularProfile();
    BOOL v12 = v11 == 0;
    if (a1 && v11)
    {
      errorFromCTError(v11);
      *a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v10);
  }
  else if (a1)
  {
    cannotConnectError(0, v3, v4, v5, v6, v7, v8, v9);
    BOOL v12 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

BOOL MCCTGetManagedCellularProfile(void *a1, void *a2)
{
  uint64_t v4 = _CTServerConnectionCreate();
  if (v4)
  {
    BOOL v12 = (const void *)v4;
    uint64_t ManagedCellularProfile = _CTServerConnectionGetManagedCellularProfile();
    if (a1) {
      *a1 = 0;
    }
    BOOL v14 = ManagedCellularProfile == 0;
    if (a2 && ManagedCellularProfile)
    {
      errorFromCTError(ManagedCellularProfile);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v12);
  }
  else if (a2)
  {
    cannotConnectError(0, v5, v6, v7, v8, v9, v10, v11);
    BOOL v14 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v14;
}

id MCIOModelString()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"model-number", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v3);
    if (CFProperty)
    {
      uint64_t v5 = NSString;
      id v6 = CFProperty;
      uint64_t v7 = objc_msgSend(v5, "stringWithCString:encoding:", objc_msgSend(v6, "bytes"), 4);
      CFProperty = [NSString stringWithFormat:@"%@%@", v7, CPGetDeviceRegionCode()];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
    CFProperty = 0;
  }

  return CFProperty;
}

id MCIOSerialString()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"IOPlatformSerialNumber", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v3);
  }
  else
  {
    CFProperty = 0;
  }
  return CFProperty;
}

id MCIOBluetoothMAC()
{
  mach_port_t mainPort = 0;
  if (!IOMasterPort(0, &mainPort)
    && (CFDictionaryRef v2 = IOServiceNameMatching("bluetooth")) != 0
    && (io_service_t MatchingService = IOServiceGetMatchingService(mainPort, v2)) != 0)
  {
    io_object_t v4 = MatchingService;
    CFDataRef v5 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", @"local-mac-address", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
    if (v5)
    {
      CFDataRef v6 = v5;
      v10.location = 0;
      v10.length = 6;
      CFDataGetBytes(v5, v10, buffer);
      mach_port_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5]);
      CFRelease(v6);
    }
    else
    {
      mach_port_t v0 = 0;
    }
    IOObjectRelease(v4);
  }
  else
  {
    mach_port_t v0 = 0;
  }
  return v0;
}

void ___ephemeralMultiUserAllowedKeysFilter_block_invoke()
{
  mach_port_t v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v1 = [v4 stringByAppendingPathComponent:@"ephemeralMultiUserRestrictionPayloadKeysFilter.plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];
  io_object_t v3 = (void *)_ephemeralMultiUserAllowedKeysFilter_dict;
  _ephemeralMultiUserAllowedKeysFilter_dict = v2;
}

void ___singleUserAllowedKeysFilter_block_invoke()
{
  mach_port_t v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v1 = [v4 stringByAppendingPathComponent:@"singleUserRestrictionPayloadKeysFilter.plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];
  io_object_t v3 = (void *)_singleUserAllowedKeysFilter_dict;
  _singleUserAllowedKeysFilter_dict = v2;
}

void sub_1A145E438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A145F434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A145FCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A146001C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14608D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A1460E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A14613AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A1462370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A14626D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1462C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1462F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A1463240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A1463644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A1463A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1463F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A146440C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A1464A38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1A1464E98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_1A1467940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1468CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A14690B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A1469498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A1469878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A1469E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A146C314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A146C8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A146CD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A146D158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A146D550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A146EDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A146F3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,char a26)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1A146FB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14737CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MCBundleIDToContainingBundleIDMap(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1A6232D90](v4);
        CFRange v10 = MCContainingBundleIDForBundleID(v8);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8, (void)v12);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }

  return v2;
}

void sub_1A1476CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

id syncQueue()
{
  if (syncQueue_onceToken != -1) {
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_241_1);
  }
  mach_port_t v0 = (void *)syncQueue_queue;
  return v0;
}

id syncQueueiTunesLoginCompletionBlocks()
{
  if (syncQueueiTunesLoginCompletionBlocks_onceToken != -1) {
    dispatch_once(&syncQueueiTunesLoginCompletionBlocks_onceToken, &__block_literal_global_244);
  }
  mach_port_t v0 = (void *)syncQueueiTunesLoginCompletionBlocks_blocks;
  return v0;
}

id syncQueueNotificationQueue()
{
  if (syncQueueNotificationQueue_onceToken != -1) {
    dispatch_once(&syncQueueNotificationQueue_onceToken, &__block_literal_global_246_0);
  }
  mach_port_t v0 = (void *)syncQueueNotificationQueue_queue;
  return v0;
}

void syncQueueCheckToShowNextNotification()
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (syncQueueCurrentlyVisibleNotificationEntry) {
    return;
  }
  mach_port_t v0 = syncQueueNotificationQueue();
  uint64_t v1 = [v0 count];

  if (!v1) {
    return;
  }
  uint64_t v55 = *MEMORY[0x1E4F1D990];
  uint64_t v54 = *MEMORY[0x1E4F1D9A8];
  uint64_t v53 = *MEMORY[0x1E4F1D9E0];
  uint64_t v2 = *MEMORY[0x1E4F1D9D0];
  uint64_t v3 = *MEMORY[0x1E4F1DA10];
  uint64_t v52 = *MEMORY[0x1E4F1D9B8];
  uint64_t v4 = *MEMORY[0x1E4F1DA20];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v50 = v57;
  CFStringRef mode = (const __CFString *)*MEMORY[0x1E4F1D410];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  while (1)
  {
    uint64_t v7 = syncQueueNotificationQueue();
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", 0, v50);

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    CFRange v10 = [v8 title];

    if (v10)
    {
      uint64_t v11 = [v8 title];
      [v9 setObject:v11 forKey:v55];
    }
    long long v12 = [v8 message];

    if (v12)
    {
      long long v13 = [v8 message];
      [v9 setObject:v13 forKey:v54];
    }
    long long v14 = [v8 defaultButtonText];

    if (v14)
    {
      long long v15 = [v8 defaultButtonText];
      [v9 setObject:v15 forKey:v53];
    }
    uint64_t v16 = [v8 alternateButtonText];

    if (v16)
    {
      uint64_t v17 = [v8 alternateButtonText];
      [v9 setObject:v17 forKey:v2];
    }
    uint64_t v18 = [v8 otherButtonText];

    if (v18)
    {
      uint64_t v19 = [v8 otherButtonText];
      [v9 setObject:v19 forKey:v3];
    }
    if ([v8 displayOnLockScreen]) {
      [v9 setObject:v6 forKey:v52];
    }
    if ([v8 dismissOnLock]) {
      [v9 setObject:v6 forKey:MCSBUserNotificationDismissOnLock()];
    }
    [v9 setObject:v6 forKey:MCSBUserNotificationDontDismissOnUnlock()];
    CFOptionFlags v20 = [v8 defaultButtonText];
    if (v20)
    {
      uint64_t v21 = [v8 alternateButtonText];
      if (v21)
      {
        id v22 = (void *)v21;
        uint64_t v23 = [v8 otherButtonText];
        BOOL v24 = v23 != 0;

        CFOptionFlags v20 = 32 * v24;
      }
      else
      {

        CFOptionFlags v20 = 0;
      }
    }
    uint64_t v25 = [v8 textfieldPlaceholder];

    if (v25)
    {
      id v26 = [v8 textfieldPlaceholder];
      [v9 setObject:v26 forKey:v4];

      v20 |= 0x10000uLL;
    }
    SInt32 error = 0;
    uint64_t v27 = CFUserNotificationCreate(v5, 0.0, v20, &error, (CFDictionaryRef)v9);
    if (!v27)
    {
      v31 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 67109120;
        LODWORD(v60) = error;
        _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_ERROR, "Cannot create alert. Error: %d", buf, 8u);
      }
      goto LABEL_32;
    }
    __int16 v28 = v27;
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v27, (CFUserNotificationCallBack)mainQueueNotificationCallback, 0);
    if (RunLoopSource) {
      break;
    }
    uint64_t v30 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v30, OS_LOG_TYPE_ERROR, "Cannot display alert: can't create run loop source.", buf, 2u);
    }
    CFRelease(v28);
LABEL_32:

    v32 = syncQueueNotificationQueue();
    uint64_t v33 = [v32 count];

    if (!v33) {
      return;
    }
  }
  v34 = RunLoopSource;
  v35 = syncQueueNotificationQueue();
  [v35 removeObjectAtIndex:0];

  objc_storeStrong((id *)&syncQueueCurrentlyVisibleNotificationEntry, v8);
  [v8 setNotification:v28];
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v34, mode);
  CFRelease(v34);
  v37 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    v38 = v37;
    v39 = [v8 title];
    v40 = [v8 message];
    v41 = [v8 defaultButtonText];
    v42 = [v8 alternateButtonText];
    v43 = [v8 otherButtonText];
    *(_DWORD *)audit_token_t buf = 138544386;
    v60 = v39;
    __int16 v61 = 2114;
    v62 = v40;
    __int16 v63 = 2114;
    v64 = v41;
    __int16 v65 = 2114;
    v66 = v42;
    __int16 v67 = 2114;
    v68 = v43;
    _os_log_impl(&dword_1A13F0000, v38, OS_LOG_TYPE_DEFAULT, "Displaying alert: %{public}@ - %{public}@ [%{public}@] [%{public}@] [%{public}@]", buf, 0x34u);
  }
  [v8 dismissAfterTimeInterval];
  if (v44 <= 0.0)
  {
    CFRelease(v28);
  }
  else
  {
    v45 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v46 = v45;
      [v8 dismissAfterTimeInterval];
      *(_DWORD *)audit_token_t buf = 134217984;
      v60 = v47;
      _os_log_impl(&dword_1A13F0000, v46, OS_LOG_TYPE_INFO, "Scheduling automatic alert dismissal after %0.0f seconds.", buf, 0xCu);
    }
    CFRetain(v28);
    [v8 dismissAfterTimeInterval];
    dispatch_time_t v49 = dispatch_time(0, (uint64_t)(v48 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v57[0] = __syncQueueCheckToShowNextNotification_block_invoke;
    v57[1] = &__block_descriptor_40_e5_v8__0l;
    v57[2] = v28;
    dispatch_after(v49, MEMORY[0x1E4F14428], block);
  }
}

id syncQueueVPPInvitationCompletionBlocks()
{
  if (syncQueueVPPInvitationCompletionBlocks_onceToken != -1) {
    dispatch_once(&syncQueueVPPInvitationCompletionBlocks_onceToken, &__block_literal_global_266);
  }
  mach_port_t v0 = (void *)syncQueueVPPInvitationCompletionBlocks_blocks;
  return v0;
}

uint64_t __syncQueue_block_invoke()
{
  syncQueue_queue = (uint64_t)dispatch_queue_create("MCUserNotificationManager syncQueue", MEMORY[0x1E4F14430]);
  return MEMORY[0x1F41817F8]();
}

uint64_t __syncQueueiTunesLoginCompletionBlocks_block_invoke()
{
  syncQueueiTunesLoginCompletionBlocks_blocks = [MEMORY[0x1E4F1CA48] array];
  return MEMORY[0x1F41817F8]();
}

uint64_t __syncQueueNotificationQueue_block_invoke()
{
  syncQueueNotificationQueue_queue = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

void mainQueueNotificationCallback(uint64_t a1, unint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2 > 3)
  {
    uint64_t v4 = @"Unknown";
    int v3 = 4;
  }
  else
  {
    int v3 = a2;
    uint64_t v4 = off_1E5A689A0[a2];
  }
  CFAllocatorRef v5 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    CFRange v10 = v4;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Alert dismissed with response: %{public}@", buf, 0xCu);
  }
  uint64_t v6 = syncQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __mainQueueNotificationCallback_block_invoke;
  v7[3] = &__block_descriptor_44_e5_v8__0l;
  v7[4] = a1;
  int v8 = v3;
  dispatch_barrier_sync(v6, v7);
}

void __syncQueueCheckToShowNextNotification_block_invoke(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEFAULT, "Automatically dismissing alert.", v3, 2u);
  }
  CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __mainQueueNotificationCallback_block_invoke(uint64_t a1)
{
  id v2 = (id)syncQueueCurrentlyVisibleNotificationEntry;
  int v3 = [v2 textfieldPlaceholder];

  if (v3) {
    int v3 = (void *)[(__CFString *)(id)CFUserNotificationGetResponseValue(*(CFUserNotificationRef *)(a1 + 32), (CFStringRef)*MEMORY[0x1E4F1DA28], 0) copy];
  }
  uint64_t v4 = (void *)syncQueueCurrentlyVisibleNotificationEntry;
  syncQueueCurrentlyVisibleNotificationEntry = 0;

  CFAllocatorRef v5 = [v2 completionBlock];

  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __mainQueueNotificationCallback_block_invoke_2;
    block[3] = &unk_1E5A687D0;
    id v8 = v2;
    int v10 = *(_DWORD *)(a1 + 40);
    id v9 = v3;
    dispatch_async(v6, block);
  }
  syncQueueCheckToShowNextNotification();
}

void __mainQueueNotificationCallback_block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __syncQueueVPPInvitationCompletionBlocks_block_invoke()
{
  syncQueueVPPInvitationCompletionBlocks_blocks = [MEMORY[0x1E4F1CA48] array];
  return MEMORY[0x1F41817F8]();
}

void sub_1A14830B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MCSetMigrationParameters(void *a1)
{
  id v1 = a1;
  id v2 = MCSystemProfileStorageDirectory();
  int v3 = [v2 stringByAppendingPathComponent:@"LockdownParameters.plist"];

  [v1 MCWriteToBinaryFile:v3];
  id v4 = v3;
  chown((const char *)[v4 fileSystemRepresentation], 0x1F5u, 0x1F5u);
}

void sub_1A14908B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1490A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1490F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1495548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14956B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1495840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1495A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1495C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1495DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1496824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A149748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void ___removedPayloadClasses_block_invoke()
{
  void v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  id v1 = (void *)_removedPayloadClasses_array;
  _removedPayloadClasses_array = v0;
}

id MCKeybagSetPasscodeGracePeriod(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 dataUsingEncoding:4];
  CFAllocatorRef v5 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = @"Yes";
    if (!v3) {
      uint64_t v6 = @"No";
    }
    *(_DWORD *)audit_token_t buf = 134218242;
    uint64_t v27 = a1;
    __int16 v28 = 2114;
    uint64_t v29 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_INFO, "Attempting to set grace period to %lu seconds. Passcode present: %{public}@", buf, 0x16u);
  }
  BOOL v24 = @"GracePeriod";
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:a1];
  uint64_t v25 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  uint64_t v9 = MKBDeviceSetGracePeriod();
  int v10 = _MCLogObjects;
  if (v9)
  {
    uint64_t v11 = v9;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 67109120;
      LODWORD(v27) = v11;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Failed to set grace period. Error code: %d", buf, 8u);
    }
    long long v12 = (void *)MEMORY[0x1E4F28C58];
    long long v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
    uint64_t v21 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_SET_GRACE_PERIOD_P_CODE", v14, v15, v16, v17, v18, v19, v20, v13);
    id v22 = [v12 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5015 descriptionArray:v21 errorType:@"MCFatalError"];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_INFO, "Successfully set grace period.", buf, 2u);
    }
    id v22 = 0;
  }

  return v22;
}

id MCKeybagCurrentPasscodeGeneration()
{
  id v0 = (id)currentPasscodeGenerationCache;
  if (!v0)
  {
    id v1 = _MCKeybagDeviceConfigurations();
    id v0 = [v1 objectForKeyedSubscript:@"PasscodeGeneration"];
    objc_storeStrong((id *)&currentPasscodeGenerationCache, v0);
  }
  return v0;
}

id MCKeybagMementoPasscodeGeneration()
{
  id v0 = (id)mementoPasscodeGenerationCache;
  if (!v0)
  {
    id v1 = _MCKeybagDeviceConfigurations();
    id v0 = [v1 objectForKeyedSubscript:@"MementoPasscodeGeneration"];
    objc_storeStrong((id *)&mementoPasscodeGenerationCache, v0);
  }
  return v0;
}

void MCKeybagClearPasscodeGenerationCaches()
{
  id v0 = (void *)currentPasscodeGenerationCache;
  currentPasscodeGenerationCache = 0;

  id v1 = (void *)mementoPasscodeGenerationCache;
  mementoPasscodeGenerationCache = 0;
}

uint64_t MCKeybagMementoSupported()
{
  if (!MCKeybagMementoSupported_supported && _os_feature_enabled_impl())
  {
    id v0 = _MCKeybagDeviceConfigurations();
    id v1 = [v0 objectForKeyedSubscript:@"MementoSupported"];
    MCKeybagMementoSupported_supported = [v1 BOOLValue];
  }
  return MCKeybagMementoSupported_supported;
}

id MCKeybagClearMementoBlob()
{
  if (MCKeybagMementoSupported())
  {
    uint64_t v0 = MKBKeyBagEffaceMementoBlob();
    if (v0)
    {
      id v1 = (void *)MEMORY[0x1E4F28C58];
      id v2 = [MEMORY[0x1E4F28ED0] numberWithInt:v0];
      int v10 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_CLEAR_MEMENTO_P_CODE", v3, v4, v5, v6, v7, v8, v9, v2);
      uint64_t v11 = [v1 MCErrorWithDomain:@"MCPasscodeErrorDomain" code:5022 descriptionArray:v10 errorType:@"MCFatalError"];

      goto LABEL_7;
    }
    long long v12 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_INFO, "Successfully cleared recovery passcode.", buf, 2u);
    }
  }
  uint64_t v11 = 0;
LABEL_7:
  return v11;
}

uint64_t MCKeybagMementoBlobExists()
{
  uint64_t result = MCKeybagMementoSupported();
  if (result)
  {
    id v1 = _MCKeybagDeviceConfigurations();
    id v2 = [v1 objectForKeyedSubscript:@"MementoBlobExists"];
    uint64_t v3 = [v2 BOOLValue];

    return v3;
  }
  return result;
}

id MCKeybagCopyEscrowWithAuth(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = +[MCPasscodeManager sharedManager];
  if (![v7 isPasscodeSet])
  {

    goto LABEL_5;
  }
  uint64_t v8 = [v6 length];

  if (v8)
  {
LABEL_5:
    uint64_t v19 = [v6 dataUsingEncoding:4];
    if (v5) {
      [v5 dataUsingEncoding:4];
    }
    else {
    uint64_t v20 = [MEMORY[0x1E4F1C9B8] data];
    }
    uint64_t EscrowWithAuth = MKBKeyBagCreateEscrowWithAuth();
    if (EscrowWithAuth)
    {
      id v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:EscrowWithAuth];
      v31 = MCErrorArray(@"KEYBAG_ERROR_CANNOT_CREATE_ESCROW_KEYBAG_P_CODE", v24, v25, v26, v27, v28, v29, v30, v23);
      uint64_t v18 = [v22 MCErrorWithDomain:@"MCKeybagErrorDomain" code:37003 descriptionArray:v31 errorType:@"MCFatalError"];
    }
    else
    {
      uint64_t v32 = MKBKeyBagCopyData();
      if (v32)
      {
        uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
        v34 = [MEMORY[0x1E4F28ED0] numberWithInt:v32];
        v42 = MCErrorArray(@"KEYBAG_ERROR_CANNOT_COPY_ESCROW_KEYBAG_DATA_P_CODE", v35, v36, v37, v38, v39, v40, v41, v34);
        uint64_t v18 = [v33 MCErrorWithDomain:@"MCKeybagErrorDomain" code:37004 descriptionArray:v42 errorType:@"MCFatalError"];
      }
      else
      {
        uint64_t v18 = 0;
      }
    }

    goto LABEL_14;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = MCErrorArray(@"KEYBAG_ERROR_CANNOT_CREATE_ESCROW_KEYBAG_WITHOUT_PASSCODE", v9, v10, v11, v12, v13, v14, v15, 0);
  uint64_t v18 = [v16 MCErrorWithDomain:@"MCKeybagErrorDomain" code:37002 descriptionArray:v17 errorType:@"MCFatalError"];

LABEL_14:
  if (v18)
  {
    id v43 = 0;
    if (a3) {
      *a3 = v18;
    }
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

id MCKeybagCreateSupervisionEscrowWithPasscode(void *a1, void *a2)
{
  id v8 = 0;
  id v3 = MCKeybagCopyEscrowWithAuth(@"com.apple.Chaperone", a1, &v8);
  id v4 = v8;
  id v5 = v4;
  if (v4)
  {
    id v6 = 0;
    if (a2) {
      *a2 = v4;
    }
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

uint64_t MCKeybagRetrieveSupervisionEscrowSecret()
{
  return [@"com.apple.Chaperone" dataUsingEncoding:4];
}

uint64_t MCKeybagHasMDMEscrowDataAndSecret()
{
  uint64_t v0 = MCKeybagRetrieveMDMEscrowDataIfPresent(0);
  id v1 = MCKeybagRetrieveMDMEscrowSecret(0);
  if (v0) {
    BOOL v2 = v1 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = !v2;

  return v3;
}

id MCKeybagRetrieveMDMEscrowDataIfPresent(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F73328];
  uint64_t v3 = *MEMORY[0x1E4F732A8];
  id v13 = 0;
  id v4 = +[MCKeychain dataFromService:v2 account:v3 label:0 description:0 useSystemKeychain:0 outError:&v13];
  id v5 = v13;
  id v6 = v5;
  if (!v4)
  {
    if (a1) {
      *a1 = v5;
    }
    uint64_t v7 = _MCLogObjects;
    if (v6)
    {
      if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      *(_DWORD *)audit_token_t buf = 138412290;
      uint64_t v15 = v6;
      id v8 = "Unable to retrieve escrow keybag from the keychain. Error: %@";
      uint64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      uint32_t v11 = 12;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      *(_WORD *)audit_token_t buf = 0;
      id v8 = "No escrow keybag found in the keychain.";
      uint64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      uint32_t v11 = 2;
    }
    _os_log_impl(&dword_1A13F0000, v9, v10, v8, buf, v11);
  }
LABEL_10:

  return v4;
}

id MCKeybagRetrieveMDMEscrowSecret(uint64_t a1)
{
  id v1 = +[MCKeychain stringFromService:*MEMORY[0x1E4F73328] account:*MEMORY[0x1E4F732B0] label:0 description:0 useSystemKeychain:0 outError:a1];
  uint64_t v2 = [v1 dataUsingEncoding:4];

  return v2;
}

BOOL MCKeybagCreateMDMEscrowWithPasscode(void *a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = a1;
  id v5 = [v3 MCMakeUUID];
  id v9 = 0;
  id v6 = MCKeybagCopyEscrowWithAuth(v5, v4, &v9);

  id v7 = v9;
  if (v6) {
    _MCKeybagStoreMDMEscrowAndSecret((uint64_t)v5, v6);
  }
  if (a2 && v7) {
    *a2 = v7;
  }

  return v7 == 0;
}

uint64_t _MCKeybagStoreMDMEscrowAndSecret(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F73328];
  uint64_t v5 = *MEMORY[0x1E4F732B0];
  uint64_t v6 = *MEMORY[0x1E4F3B598];
  id v19 = 0;
  LOWORD(v16) = 256;
  +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a1, v4, v5, 0, 0, v6, 0, v16, &v19);
  id v7 = v19;
  if (v7)
  {
    id v8 = v7;
    id v9 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138412290;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_ERROR, "Failed to store MDM escrow secret into keychain. Error: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F732A8];
    uint64_t v11 = *MEMORY[0x1E4F3B578];
    id v18 = 0;
    LOWORD(v17) = 256;
    +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v3, v4, v10, 0, 0, v11, 0, v17, &v18);
    id v12 = v18;
    if (!v12)
    {
      uint64_t v14 = 1;
      goto LABEL_9;
    }
    id v8 = v12;
    id v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138412290;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "Failed to store MDM escrow data into keychain. Error: %@", buf, 0xCu);
    }
    +[MCKeychain removeItemForService:v4 account:v5 label:0 description:0 useSystemKeychain:0 group:0];
  }

  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

uint64_t MCKeybagDeleteMDMEscrowData()
{
  return +[MCKeychain removeItemForService:*MEMORY[0x1E4F73328] account:*MEMORY[0x1E4F732A8] label:0 description:0 useSystemKeychain:0 group:0];
}

uint64_t MCKeybagDeleteMDMEscrowSecret()
{
  return +[MCKeychain removeItemForService:*MEMORY[0x1E4F73328] account:*MEMORY[0x1E4F732B0] label:0 description:0 useSystemKeychain:0 group:0];
}

void sub_1A14A60D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14A63DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14A93B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14A99F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14AA85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

id getkCRKEDUDeviceGroupNameKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getkCRKEDUDeviceGroupNameKeySymbolLoc_ptr;
  uint64_t v7 = getkCRKEDUDeviceGroupNameKeySymbolLoc_ptr;
  if (!getkCRKEDUDeviceGroupNameKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kCRKEDUDeviceGroupNameKey");
    getkCRKEDUDeviceGroupNameKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkCRKEDUDeviceGroupNameKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AA970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCRKEDUUserIdentifierKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getkCRKEDUUserIdentifierKeySymbolLoc_ptr;
  uint64_t v7 = getkCRKEDUUserIdentifierKeySymbolLoc_ptr;
  if (!getkCRKEDUUserIdentifierKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kCRKEDUUserIdentifierKey");
    getkCRKEDUUserIdentifierKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkCRKEDUUserIdentifierKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AAA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14AB39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCRKEDUProfileErrorDomain()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getCRKEDUProfileErrorDomainSymbolLoc_ptr;
  uint64_t v7 = getCRKEDUProfileErrorDomainSymbolLoc_ptr;
  if (!getCRKEDUProfileErrorDomainSymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "CRKEDUProfileErrorDomain");
    getCRKEDUProfileErrorDomainSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getCRKEDUProfileErrorDomain_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AB4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCRKEDUProfileErrorFieldKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getCRKEDUProfileErrorFieldKeySymbolLoc_ptr;
  uint64_t v7 = getCRKEDUProfileErrorFieldKeySymbolLoc_ptr;
  if (!getCRKEDUProfileErrorFieldKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "CRKEDUProfileErrorFieldKey");
    getCRKEDUProfileErrorFieldKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getCRKEDUProfileErrorFieldKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AB5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCRKEDUProfileErrorValueKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getCRKEDUProfileErrorValueKeySymbolLoc_ptr;
  uint64_t v7 = getCRKEDUProfileErrorValueKeySymbolLoc_ptr;
  if (!getCRKEDUProfileErrorValueKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "CRKEDUProfileErrorValueKey");
    getCRKEDUProfileErrorValueKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getCRKEDUProfileErrorValueKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AB6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCRKEDUGroupBeaconIDKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getkCRKEDUGroupBeaconIDKeySymbolLoc_ptr;
  uint64_t v7 = getkCRKEDUGroupBeaconIDKeySymbolLoc_ptr;
  if (!getkCRKEDUGroupBeaconIDKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kCRKEDUGroupBeaconIDKey");
    getkCRKEDUGroupBeaconIDKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkCRKEDUGroupBeaconIDKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AB7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCRKEDUPayloadLeaderCertificateAnchorUUIDKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getkCRKEDUPayloadLeaderCertificateAnchorUUIDKeySymbolLoc_ptr;
  uint64_t v7 = getkCRKEDUPayloadLeaderCertificateAnchorUUIDKeySymbolLoc_ptr;
  if (!getkCRKEDUPayloadLeaderCertificateAnchorUUIDKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kCRKEDUPayloadLeaderCertificateAnchorUUIDKey");
    getkCRKEDUPayloadLeaderCertificateAnchorUUIDKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkCRKEDUPayloadLeaderCertificateAnchorUUIDKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AB8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCRKEDUPayloadMemberCertificateAnchorUUIDKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getkCRKEDUPayloadMemberCertificateAnchorUUIDKeySymbolLoc_ptr;
  uint64_t v7 = getkCRKEDUPayloadMemberCertificateAnchorUUIDKeySymbolLoc_ptr;
  if (!getkCRKEDUPayloadMemberCertificateAnchorUUIDKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kCRKEDUPayloadMemberCertificateAnchorUUIDKey");
    getkCRKEDUPayloadMemberCertificateAnchorUUIDKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkCRKEDUPayloadMemberCertificateAnchorUUIDKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14AB9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCRKEDUSingleUserIdentifierKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getkCRKEDUSingleUserIdentifierKeySymbolLoc_ptr;
  uint64_t v7 = getkCRKEDUSingleUserIdentifierKeySymbolLoc_ptr;
  if (!getkCRKEDUSingleUserIdentifierKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kCRKEDUSingleUserIdentifierKey");
    getkCRKEDUSingleUserIdentifierKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkCRKEDUSingleUserIdentifierKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14ABB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCRKEDUProfileErrorTopLevelUserIdentifierKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getCRKEDUProfileErrorTopLevelUserIdentifierKeySymbolLoc_ptr;
  uint64_t v7 = getCRKEDUProfileErrorTopLevelUserIdentifierKeySymbolLoc_ptr;
  if (!getCRKEDUProfileErrorTopLevelUserIdentifierKeySymbolLoc_ptr)
  {
    id v1 = (void *)ClassroomKitLibrary();
    v5[3] = (uint64_t)dlsym(v1, "CRKEDUProfileErrorTopLevelUserIdentifierKey");
    getCRKEDUProfileErrorTopLevelUserIdentifierKeySymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getCRKEDUProfileErrorTopLevelUserIdentifierKey_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1A14ABC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRKEDUPayloadClass_block_invoke(uint64_t a1)
{
  ClassroomKitLibrary();
  Class result = objc_getClass("CRKEDUPayload");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCRKEDUPayloadClass_block_invoke_cold_1();
  }
  getCRKEDUPayloadClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ClassroomKitLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!ClassroomKitLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    void v2[2] = (void *)3221225472;
    void v2[3] = __ClassroomKitLibraryCore_block_invoke;
    void v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5A68F60;
    uint64_t v4 = 0;
    ClassroomKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ClassroomKitLibraryCore_frameworkLibrary;
  if (!ClassroomKitLibraryCore_frameworkLibrary) {
    ClassroomKitLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __ClassroomKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClassroomKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkCRKEDUDepartmentNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUDepartmentNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUDepartmentNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCRKEDUDeviceGroupNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUDeviceGroupNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUDeviceGroupNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCRKEDUUserIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUUserIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUUserIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCRKEDUUserNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUUserNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUUserNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCRKEDUProfileErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "CRKEDUProfileErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRKEDUProfileErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCRKEDUProfileErrorFieldKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "CRKEDUProfileErrorFieldKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRKEDUProfileErrorFieldKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCRKEDUProfileErrorValueKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "CRKEDUProfileErrorValueKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRKEDUProfileErrorValueKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCRKEDUGroupBeaconIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUGroupBeaconIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUGroupBeaconIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCRKEDUPayloadLeaderCertificateAnchorUUIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUPayloadLeaderCertificateAnchorUUIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUPayloadLeaderCertificateAnchorUUIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getkCRKEDUPayloadMemberCertificateAnchorUUIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUPayloadMemberCertificateAnchorUUIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUPayloadMemberCertificateAnchorUUIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getkCRKEDUSingleUserIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "kCRKEDUSingleUserIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCRKEDUSingleUserIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCRKEDUProfileErrorTopLevelUserIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "CRKEDUProfileErrorTopLevelUserIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRKEDUProfileErrorTopLevelUserIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "CRKEDUProfileErrorProvidedKeysKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ClassroomKitLibrary();
  uint64_t result = dlsym(v2, "CRKEDUProfileErrorAllOrNoneKeysKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A14B130C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14B1840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14B1C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14B2090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A14B3704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1A14B3984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_1A14B4DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MCCheckSystemGroupContainerFileReadability(int a1, unsigned char *a2)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MCConfigurationProfilesSystemGroupContainer();
  BOOL v3 = MCLogSystemGroupContainerDirectoryACLs(v2);

  if (!v3)
  {
    uint64_t v4 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_FAULT, "System container directory is missing ACLs!", buf, 2u);
    }
  }
  uint64_t v5 = MCSystemProfileLibraryDirectory();
  BOOL v6 = MCLogSystemGroupContainerDirectoryACLs(v5);

  if (!v6)
  {
    uint64_t v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_FAULT, "Profile library directory is missing ACLs!", buf, 2u);
    }
  }
  id v8 = MCSystemProfileStorageDirectory();
  BOOL v9 = MCLogSystemGroupContainerDirectoryACLs(v8);

  if (!v9)
  {
    uint64_t v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_FAULT, "Profile storage directory is missing ACLs!", buf, 2u);
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = MCSystemProfileStorageDirectory();
  uint64_t v14 = [v12 URLWithString:v13];
  uint64_t v15 = *MEMORY[0x1E4F1C670];
  v46[0] = *MEMORY[0x1E4F1C670];
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  uint64_t v32 = v11;
  uint64_t v17 = [v11 enumeratorAtURL:v14 includingPropertiesForKeys:v16 options:0 errorHandler:&__block_literal_global_52];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    BYTE4(v34) = 1;
    LODWORD(v34) = a1;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8 * v22);
        id v36 = 0;
        [v23 getResourceValue:&v36 forKey:v15 error:0];
        id v24 = v36;
        int v25 = [v24 BOOLValue];
        uint64_t v26 = _MCLogObjects;
        BOOL v27 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
        if (v25)
        {
          if (v27)
          {
            *(_DWORD *)audit_token_t buf = 138543362;
            double v44 = v23;
            _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_DEFAULT, "Checking file: %{public}@", buf, 0xCu);
          }
          if ([v23 getFileSystemRepresentation:buf maxLength:1024])
          {
            *__error() = 0;
            if (access((const char *)buf, 4) < 0 && *__error() == 13)
            {
              uint64_t v28 = [v23 path];
              MCLogUnexpectedFileAccessError(v28, 0);

              if (a1)
              {
                uint64_t v29 = _MCLogObjects;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t v41 = 138543362;
                  v42 = v23;
                  _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_DEFAULT, "Attempting to recover: %{public}@", v41, 0xCu);
                }
                uint64_t v34 = MCRecoverUnreadableSystemGroupContainerFile(v23, (const char *)buf) & v34;
              }
              else
              {
                BYTE4(v34) = 0;
              }
            }
          }
        }
        else if (v27)
        {
          *(_DWORD *)audit_token_t buf = 138543362;
          double v44 = v23;
          _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_DEFAULT, "Skipping non-file path: %{public}@", buf, 0xCu);
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v30 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
      uint64_t v20 = v30;
    }
    while (v30);
  }
  else
  {
    BYTE4(v34) = 1;
    LOBYTE(v34) = a1;
  }

  if (a2) {
    *a2 = v34 & 1;
  }

  return BYTE4(v34) & 1;
}

BOOL MCLogSystemGroupContainerDirectoryACLs(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v2 fileExistsAtPath:v1])
  {
    id v22 = 0;
    BOOL v3 = [v2 attributesOfItemAtPath:v1 error:&v22];
    id v4 = v22;
    uint64_t v5 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)audit_token_t buf = 138543618;
      id v24 = v1;
      __int16 v25 = 2114;
      uint64_t v26 = v3;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Path %{public}@ attributes: %{public}@", buf, 0x16u);
    }
    file = acl_get_file((const char *)[v1 UTF8String], ACL_TYPE_EXTENDED);
    BOOL v7 = file != 0;
    if (file)
    {
      id v8 = file;
      BOOL v9 = acl_to_text(file, 0);
      uint64_t v10 = (void *)_MCLogObjects;
      BOOL v11 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          id v12 = NSString;
          id v13 = v10;
          uint64_t v14 = [v12 stringWithUTF8String:v9];
          *(_DWORD *)audit_token_t buf = 138543362;
          id v24 = v14;
          _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_DEFAULT, "Path has ACL(s): %{public}@", buf, 0xCu);
        }
        acl_free(v9);
      }
      else if (v11)
      {
        uint64_t v19 = v10;
        int v20 = *__error();
        *(_DWORD *)audit_token_t buf = 67109120;
        LODWORD(v24) = v20;
        _os_log_impl(&dword_1A13F0000, v19, OS_LOG_TYPE_DEFAULT, "acl_to_text returned NULL, errno = %d", buf, 8u);
      }
      acl_free(v8);
    }
    else
    {
      uint64_t v16 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v16;
        int v18 = *__error();
        *(_DWORD *)audit_token_t buf = 67109120;
        LODWORD(v24) = v18;
        _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_ERROR, "acl_get_file returned NULL, errno = %d", buf, 8u);
      }
    }
  }
  else
  {
    uint64_t v15 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v24 = v1;
      _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEFAULT, "Path %{public}@ does not exist yet", buf, 0xCu);
    }
    BOOL v7 = 1;
  }

  return v7;
}

uint64_t __MCCheckSystemGroupContainerFileReadability_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Directory enumerator error for %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void MCLogUnexpectedFileAccessError(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v33 = 0;
  BOOL v6 = [v5 attributesOfItemAtPath:v3 error:&v33];
  id v7 = v33;
  int v8 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_FAULT, "Unexpected error (EACCES) reading file: %{public}@", buf, 0xCu);
  }
  id v9 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_ERROR, "Error details: %{public}@", buf, 0xCu);
  }
  __int16 v10 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Attributes: %{public}@", buf, 0xCu);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)audit_token_t buf = 0u;
  long long v37 = 0u;
  unsigned int v11 = getgroups(16, (gid_t *)buf);
  if ((v11 & 0x80000000) != 0)
  {
    perror("getgroups");
  }
  else
  {
    unsigned int v12 = v11;
    uint64_t v13 = v11;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    if (v12)
    {
      uint64_t v15 = buf;
      do
      {
        unsigned int v16 = *(_DWORD *)v15;
        v15 += 4;
        uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v16];
        [v14 addObject:v17];

        --v13;
      }
      while (v13);
    }
    int v18 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v34 = 138543362;
      uint64_t v35 = v14;
      _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_ERROR, "process belongs to groups: %{public}@", v34, 0xCu);
    }
  }
  id v19 = v3;
  file = acl_get_file((const char *)[v19 UTF8String], ACL_TYPE_EXTENDED);
  if (file)
  {
    uint64_t v21 = file;
    id v22 = acl_to_text(file, 0);
    uint64_t v23 = (void *)_MCLogObjects;
    BOOL v24 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        __int16 v25 = NSString;
        uint64_t v26 = v23;
        uint64_t v27 = [v25 stringWithUTF8String:v22];
        *(_DWORD *)uint64_t v34 = 138543362;
        uint64_t v35 = v27;
        _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_ERROR, "Path has ACL(s): %{public}@", v34, 0xCu);
      }
      acl_free(v22);
    }
    else if (v24)
    {
      v31 = v23;
      int v32 = *__error();
      *(_DWORD *)uint64_t v34 = 67109120;
      LODWORD(v35) = v32;
      _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_ERROR, "acl_to_text returned NULL, errno = %d", v34, 8u);
    }
    acl_free(v21);
  }
  else
  {
    uint64_t v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = v28;
      int v30 = *__error();
      *(_DWORD *)uint64_t v34 = 67109120;
      LODWORD(v35) = v30;
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "acl_get_file returned NULL, errno = %d", v34, 8u);
    }
  }
}

uint64_t MCRecoverUnreadableSystemGroupContainerFile(void *a1, const char *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  *__error() = 0;
  if (chmod(a2, 0x1A4u))
  {
    id v4 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = *__error();
      int v16 = 138543618;
      id v17 = v3;
      __int16 v18 = 1024;
      int v19 = v6;
      id v7 = "Unable to recover %{public}@: cannot chmod(), errno %d";
LABEL_7:
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, 0x12u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (!access(a2, 4))
  {
    unsigned int v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
    uint64_t v13 = v12;
    if (v12)
    {
      if ([v12 writeToURL:v3 atomically:1])
      {
        uint64_t v14 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138543362;
          id v17 = v3;
          _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_DEFAULT, "Successfully recovered %{public}@!", (uint8_t *)&v16, 0xCu);
        }
        uint64_t v10 = 1;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v15 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138543362;
        id v17 = v3;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Unable to recover %{public}@: failed to read contents of file", (uint8_t *)&v16, 0xCu);
      }
    }
    uint64_t v10 = 0;
LABEL_18:

    goto LABEL_9;
  }
  int v8 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    id v5 = v8;
    int v9 = *__error();
    int v16 = 138543618;
    id v17 = v3;
    __int16 v18 = 1024;
    int v19 = v9;
    id v7 = "Unable to recover %{public}@: file still not readable per access(), errno %d";
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

BOOL MCChangeOwnershipOfFileToMobile(void *a1, void *a2)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v27 = 0;
  id v5 = [v4 attributesOfItemAtPath:v3 error:&v27];
  id v6 = v27;
  uint64_t v14 = v6;
  if (!v5)
  {
    int v16 = 0;
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v15 = *MEMORY[0x1E4F28320];
  int v16 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28320]];
  if (([v16 isEqual:@"mobile"] & 1) == 0)
  {
    uint64_t v17 = *MEMORY[0x1E4F282E0];
    v34[0] = v15;
    v34[1] = v17;
    v35[0] = @"mobile";
    v35[1] = @"mobile";
    __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    id v26 = v14;
    [v4 setAttributes:v18 ofItemAtPath:v3 error:&v26];
    id v19 = v26;

    uint64_t v14 = v19;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    v32[0] = *MEMORY[0x1E4F28568];
    uint64_t v21 = MCLocalizedErrorFormat(@"ERROR_FAILED_TO_CHANGE_OWNERSHIP", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v3);
    v32[1] = *MEMORY[0x1E4F28A50];
    v33[0] = v21;
    v33[1] = v14;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    uint64_t v23 = [v20 errorWithDomain:@"MCInternalErrorDomain" code:0 userInfo:v22];

    BOOL v24 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543618;
      id v29 = v3;
      __int16 v30 = 2114;
      v31 = v23;
      _os_log_impl(&dword_1A13F0000, v24, OS_LOG_TYPE_ERROR, "Failed to change ownership of file at path %{public}@. Error: %{public}@", buf, 0x16u);
    }
    if (a2) {
      *a2 = v23;
    }
  }
LABEL_12:

  return v14 == 0;
}

BOOL MCChangeOwnershipOfDirectoryContentsToMobile(void *a1, void *a2)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v29 = 0;
  if ([v5 fileExistsAtPath:v3 isDirectory:&v29]) {
    BOOL v6 = v29 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v31 = v3;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Path %{public}@ does not refer to a directory.", buf, 0xCu);
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    int v16 = MCLocalizedErrorFormat(@"ERROR_NOT_A_DIRECTORY_P_PATH", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v3);
    v35[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    __int16 v18 = [v15 errorWithDomain:@"MCInternalErrorDomain" code:1 userInfo:v17];

    [v4 addObject:v18];
  }
  else
  {
    __int16 v18 = [v5 enumeratorAtPath:v3];
    id v19 = (void *)MEMORY[0x1A6232D90]();
    uint64_t v20 = [v18 nextObject];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      do
      {
        id v22 = [v3 stringByAppendingPathComponent:v21];
        id v28 = 0;
        BOOL v23 = MCChangeOwnershipOfFileToMobile(v22, &v28);
        id v24 = v28;
        if (!v23) {
          [v4 addObject:v24];
        }

        id v19 = (void *)MEMORY[0x1A6232D90]();
        uint64_t v21 = [v18 nextObject];
      }
      while (v21);
    }
  }

  uint64_t v25 = [v4 count];
  if (v25)
  {
    id v26 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543618;
      id v31 = v3;
      __int16 v32 = 2114;
      id v33 = v4;
      _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_ERROR, "Failed to change ownership of directory contents at %{public}@. Errors: %{public}@", buf, 0x16u);
    }
    if (a2) {
      *a2 = v4;
    }
  }

  return v25 == 0;
}

BOOL MCFixPermissionOfSystemGroupContainerFile(void *a1, int a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a1;
  uint64_t v7 = [v5 defaultManager];
  BOOL v8 = MCFixPermissionOfSystemGroupContainerFileFM(v7, v6, a2, a3);

  return v8;
}

BOOL MCFixPermissionOfSystemGroupContainerFileFM(void *a1, void *a2, int a3, void *a4)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v32 = 0;
  uint64_t v9 = [v7 attributesOfItemAtPath:v8 error:&v32];
  id v10 = v32;
  uint64_t v11 = *MEMORY[0x1E4F28330];
  uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28330]];
  if (a3) {
    uint64_t v13 = 511;
  }
  else {
    uint64_t v13 = 438;
  }
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v13];
  if (([v12 isEqualToNumber:v14] & 1) == 0)
  {
    uint64_t v39 = v11;
    v40[0] = v14;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    id v31 = v10;
    [v7 setAttributes:v22 ofItemAtPath:v8 error:&v31];
    id v23 = v31;

    id v10 = v23;
  }
  if (v10)
  {
    __int16 v30 = a4;
    id v24 = (void *)MEMORY[0x1E4F28C58];
    v37[0] = *MEMORY[0x1E4F28568];
    uint64_t v25 = MCLocalizedErrorFormat(@"ERROR_FAILED_TO_FIX_PERMISSIONS", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v8);
    v37[1] = *MEMORY[0x1E4F28A50];
    v38[0] = v25;
    v38[1] = v10;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    id v27 = [v24 errorWithDomain:@"MCInternalErrorDomain" code:2 userInfo:v26];

    id v28 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543618;
      id v34 = v8;
      __int16 v35 = 2114;
      id v36 = v27;
      _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_ERROR, "Failed to fix permissions of file at path %{public}@. Error: %{public}@", buf, 0x16u);
    }
    if (v30) {
      *__int16 v30 = v27;
    }
  }
  return v10 == 0;
}

BOOL MCFixPermissionsOfSystemGroupContainerDirectoryAndContents(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a1;
  id v5 = [v3 defaultManager];
  BOOL v6 = MCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(v5, v4, a2);

  return v6;
}

BOOL MCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(void *a1, void *a2, void *a3)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  char v33 = 0;
  if ([v5 fileExistsAtPath:v6 isDirectory:&v33] && v33)
  {
    id v32 = 0;
    BOOL v8 = MCFixPermissionOfSystemGroupContainerFileFM(v5, v6, 1, &v32);
    id v9 = v32;
    if (!v8) {
      [v7 addObject:v9];
    }

    id v10 = [v5 enumeratorAtPath:v6];
    uint64_t v11 = (void *)MEMORY[0x1A6232D90]();
    uint64_t v12 = [v10 nextObject];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      do
      {
        uint64_t v14 = [v6 stringByAppendingPathComponent:v13];
        buf[0] = 0;
        [v5 fileExistsAtPath:v14 isDirectory:buf];
        id v31 = 0;
        BOOL v15 = MCFixPermissionOfSystemGroupContainerFileFM(v5, v14, buf[0], &v31);
        id v16 = v31;
        if (!v15) {
          [v7 addObject:v16];
        }

        uint64_t v11 = (void *)MEMORY[0x1A6232D90]();
        uint64_t v13 = [v10 nextObject];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v17 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      id v35 = v6;
      _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_ERROR, "Path %{public}@ does not refer to a directory.", buf, 0xCu);
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    id v26 = MCLocalizedErrorFormat(@"ERROR_NOT_A_DIRECTORY_P_PATH", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v6);
    v39[0] = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v10 = [v25 errorWithDomain:@"MCInternalErrorDomain" code:1 userInfo:v27];

    [v7 addObject:v10];
  }

  uint64_t v28 = [v7 count];
  if (v28)
  {
    char v29 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543618;
      id v35 = v6;
      __int16 v36 = 2114;
      long long v37 = v7;
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "Failed to change ownership of directory and contents at %{public}@. Errors: %{public}@", buf, 0x16u);
    }
    if (a3) {
      *a3 = v7;
    }
  }

  return v28 == 0;
}

uint64_t MCSafelyCopyItemAtPathToDestinationPath(void *a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a2;
  id v7 = a1;
  BOOL v8 = [v5 defaultManager];
  uint64_t v9 = MCSafelyCopyItemAtPathToDestinationPathFM(v8, v7, v6, a3);

  return v9;
}

uint64_t MCSafelyCopyItemAtPathToDestinationPathFM(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if ([v7 fileExistsAtPath:v8])
  {
    if ((MCDestinationPathIsSafeFromSymlinkAttacks(v9) & 1) == 0)
    {
      id v10 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)audit_token_t buf = 138543362;
        id v43 = v9;
        _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_FAULT, "Destination path contains suspicious symlink: %{public}@", buf, 0xCu);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    uint64_t v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)audit_token_t buf = 138543618;
      id v43 = v11;
      __int16 v44 = 2114;
      v45 = v12;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_DEFAULT, "Moving %{public}@ to %{public}@...", buf, 0x16u);
    }
    id v41 = 0;
    uint64_t v14 = [v7 URLForDirectory:99 inDomain:1 appropriateForURL:v12 create:1 error:&v41];
    id v15 = v41;
    if (!v14)
    {
      __int16 v30 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 138543362;
        id v43 = v11;
        _os_log_impl(&dword_1A13F0000, v30, OS_LOG_TYPE_ERROR, "Failed to get temporary directory path for item %{public}@", buf, 0xCu);
      }
      uint64_t v22 = 0;
      goto LABEL_38;
    }
    __int16 v36 = a4;
    id v16 = [v11 lastPathComponent];
    uint64_t v17 = [v14 URLByAppendingPathComponent:v16];

    if (!v17)
    {
      id v31 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 138543362;
        id v43 = v11;
        _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_ERROR, "Failed to create temporary URL for moving item %{public}@", buf, 0xCu);
      }
      uint64_t v22 = 0;
      goto LABEL_37;
    }
    id v40 = v15;
    int v18 = [v7 copyItemAtURL:v11 toURL:v17 error:&v40];
    id v19 = v40;

    if (!v18 || v19)
    {
      id v32 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 138543874;
        id v43 = v11;
        __int16 v44 = 2114;
        v45 = v17;
        __int16 v46 = 2114;
        id v47 = v19;
        _os_log_impl(&dword_1A13F0000, v32, OS_LOG_TYPE_ERROR, "Copying of item %{public}@ to temporary %{public}@ failed with error %{public}@", buf, 0x20u);
      }
      uint64_t v22 = 0;
      id v15 = v19;
      goto LABEL_37;
    }
    id v38 = 0;
    id v39 = 0;
    unsigned int v20 = [v7 replaceItemAtURL:v12 withItemAtURL:v17 backupItemName:0 options:1 resultingItemURL:&v39 error:&v38];
    id v35 = v39;
    id v21 = v38;
    if (v21) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v20;
    }
    if ((v22 & 1) == 0)
    {
      id v15 = v21;
      char v33 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 138543874;
        id v43 = v12;
        __int16 v44 = 2114;
        v45 = v17;
        __int16 v46 = 2114;
        id v47 = v15;
        _os_log_impl(&dword_1A13F0000, v33, OS_LOG_TYPE_ERROR, "Replacement of item %{public}@ with %{public}@ failed with error %{public}@", buf, 0x20u);
      }
      goto LABEL_36;
    }
    uint64_t v23 = [v17 absoluteString];
    int v24 = [v7 fileExistsAtPath:v23];

    if (v24)
    {
      id v37 = 0;
      int v25 = [v7 removeItemAtURL:v17 error:&v37];
      id v26 = v37;
      id v27 = v26;
      if (v25)
      {
        id v15 = 0;
        if (!v26) {
          goto LABEL_36;
        }
      }
      uint64_t v28 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 138543618;
        id v43 = v17;
        __int16 v44 = 2114;
        v45 = v27;
        _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_ERROR, "Removal of temporary item %{public}@ failed with error %{public}@", buf, 0x16u);
      }
    }
    id v15 = 0;
LABEL_36:

LABEL_37:
    a4 = v36;
LABEL_38:

    if (a4 && v15)
    {
      id v15 = v15;
      *a4 = v15;
    }
    goto LABEL_41;
  }
  char v29 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    id v43 = v8;
    _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "Item does not exist at %{public}@", buf, 0xCu);
  }
  uint64_t v22 = 0;
  id v15 = 0;
LABEL_41:

  return v22;
}

uint64_t MCDestinationPathIsSafeFromSymlinkAttacks(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = MCPathWithoutPrivatePathComponent(a1);
  uint64_t v2 = [v1 stringByResolvingSymlinksInPath];
  id v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = v1;
    __int16 v8 = 2114;
    id v9 = v2;
    _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEFAULT, "MCDestinationPathIsSafeFromSymlinkAttacks path:\n\t%{public}@\nresolved:\n\t%{public}@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v4 = [v1 isEqualToString:v2];

  return v4;
}

void MCFixHostileSymlinks()
{
  v20[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = MCConfigurationProfilesSystemGroupContainer();
  v20[0] = v0;
  id v1 = MCSystemProfileLibraryDirectory();
  v20[1] = v1;
  uint64_t v2 = MCSystemProfileStorageDirectory();
  void v20[2] = v2;
  id v3 = MCSystemPublicInfoDirectory();
  v20[3] = v3;
  uint64_t v4 = MCUserProfileLibraryDirectory();
  v20[4] = v4;
  id v5 = MCUserProfileStorageDirectory();
  v20[5] = v5;
  int v6 = MCUserPublicInfoDirectory();
  v20[6] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        MCReplaceSymlinkWithDirectory(*(void **)(*((void *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  uint64_t v13 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_DEFAULT, "Finished check for symbolic links in user and system group folder", v14, 2u);
  }
}

void MCReplaceSymlinkWithDirectory(void *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v29 = 0;
  id v3 = [v2 attributesOfItemAtPath:v1 error:&v29];
  id v4 = v29;
  id v5 = v4;
  if (v3)
  {
    int v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F283B8]];
    id v7 = (void *)*MEMORY[0x1E4F283D0];

    if (v6 == v7)
    {
      id v28 = v5;
      BOOL v8 = MCMakePathDeletableBySettingACL(v1, &v28);
      id v9 = v28;

      if (!v8)
      {
        uint64_t v10 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)audit_token_t buf = 138543618;
          id v31 = v1;
          __int16 v32 = 2114;
          id v33 = v9;
          _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Error setting ACL on symbolic link before removal for %{public}@: %{public}@", buf, 0x16u);
        }
      }
      id v27 = v9;
      char v11 = [v2 removeItemAtPath:v1 error:&v27];
      id v5 = v27;

      if (v11)
      {
        id v26 = v5;
        char v12 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:0 attributes:0 error:&v26];
        id v13 = v26;

        uint64_t v14 = _MCLogObjects;
        BOOL v15 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR);
        if (v12)
        {
          if (v15)
          {
            *(_DWORD *)audit_token_t buf = 138543362;
            id v31 = v1;
            long long v16 = "Symbolic link removed from %{public}@";
            long long v17 = v14;
            uint32_t v18 = 12;
LABEL_21:
            _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
          }
        }
        else if (v15)
        {
          *(_DWORD *)audit_token_t buf = 138543618;
          id v31 = v1;
          __int16 v32 = 2114;
          id v33 = v13;
          long long v16 = "Error creating directory %{public}@: %{public}@";
          long long v17 = v14;
          uint32_t v18 = 22;
          goto LABEL_21;
        }
        id v5 = v13;
        goto LABEL_23;
      }
      uint64_t v25 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)audit_token_t buf = 138543618;
        id v31 = v1;
        __int16 v32 = 2114;
        id v33 = v5;
        uint64_t v22 = "Error removing symbolic link for %{public}@: %{public}@";
        uint64_t v23 = v25;
        os_log_type_t v24 = OS_LOG_TYPE_FAULT;
        goto LABEL_18;
      }
    }
  }
  else
  {
    id v19 = [v4 domain];
    if ([v19 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v20 = [v5 code];

      if (v20 == 4) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v21 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 138543618;
      id v31 = v1;
      __int16 v32 = 2114;
      id v33 = v5;
      uint64_t v22 = "Error reading attributes for %{public}@: %{public}@";
      uint64_t v23 = v21;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
LABEL_18:
      _os_log_impl(&dword_1A13F0000, v23, v24, v22, buf, 0x16u);
    }
  }
LABEL_23:
}

BOOL MCMakePathDeletableBySettingACL(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  acl_permset_t permset_d = 0;
  acl_entry_t entry_p = 0;
  memset(uu, 0, sizeof(uu));
  acl_t acl_p = acl_init(1);
  if (!acl_p
    || acl_create_entry(&acl_p, &entry_p)
    || acl_get_permset(entry_p, &permset_d)
    || acl_clear_perms(permset_d)
    || acl_add_perm(permset_d, ACL_DELETE)
    || acl_set_permset(entry_p, permset_d)
    || acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW)
    || (size_t v4 = strlen((const char *)kSystemUsersGroupName),
        mbr_identifier_to_uuid(5, (const void *)kSystemUsersGroupName, v4, uu))
    || acl_set_qualifier(entry_p, uu)
    || (int v9 = open((const char *)[v3 fileSystemRepresentation], 2097153), v9 == -1))
  {
    BOOL v5 = 0;
    int v6 = *__error();
  }
  else
  {
    int v10 = v9;
    BOOL v5 = acl_set_fd_np(v9, acl_p, ACL_TYPE_EXTENDED) == 0;
    int v6 = *__error();
    close(v10);
  }
  if (acl_p) {
    acl_free(acl_p);
  }
  if (a2) {
    char v7 = v5;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    *a2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v6 userInfo:0];
  }

  return v5;
}

id MCPathWithoutPrivatePathComponent(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 pathComponents];
  if ((unint64_t)[v2 count] > 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    if ([v3 isEqualToString:@"/"])
    {
      size_t v4 = [v2 objectAtIndexedSubscript:1];
      int v5 = [v4 isEqualToString:@"private"];

      if (v5)
      {
        int v6 = (void *)[v2 mutableCopy];
        [v6 removeObjectAtIndex:1];
        id v7 = [NSString pathWithComponents:v6];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v7 = v1;
LABEL_7:

  return v7;
}

uint64_t lib_platform_rng()
{
  uint64_t v0 = ccrng();
  REQUIRE_func(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  REQUIRE_func(0, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t lib_platform_read_random(uint64_t a1, unsigned int a2)
{
  size_t v4 = *(unsigned int (**)(uint64_t, void, uint64_t))platform_rng();
  uint64_t v5 = platform_rng();
  BOOL v6 = v4(v5, a2, a1) == 0;
  return REQUIRE_func(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

uint64_t rfc3394_wrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, void *a7, unint64_t *a8)
{
  uint64_t v41 = a1;
  uint64_t v42 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  uint64_t v14 = ccaes_cbc_encrypt_mode();
  MEMORY[0x1F4188790]();
  uint64_t v43 = (uint64_t)&v36 - v15;
  bzero((char *)&v36 - v15, v15);
  MEMORY[0x1F4188790]();
  long long v17 = (char *)&v36 - v16;
  bzero((char *)&v36 - v16, v16);
  uint64_t v18 = 0xFFFFFFFFLL;
  if (HIDWORD(a6) || (a6 - 40) < 0xFFFFFFE0) {
    goto LABEL_30;
  }
  id v39 = &v36;
  id v40 = a8;
  id v38 = a7;
  if (!a4)
  {
    BOOL v20 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v20 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }
    unint64_t v37 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }
  if (a8)
  {
    unint64_t v19 = *v40;
    unint64_t v37 = a6 + 8;
    if (v19 >= a6 + 8)
    {
LABEL_15:
      uint64_t v21 = 0;
      unsigned int v22 = a6 >> 3;
      if (a6 >> 3 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v22;
      }
      do
      {
        uint64_t v24 = *a5++;
        *((void *)&__s[v21++] + 1) = v24;
      }
      while (v23 != v21);
      uint64_t v25 = 0;
      *(void *)&__s[0] = v42;
      uint64_t v26 = 1;
      uint64_t v41 = v22;
      do
      {
        uint64_t v42 = v25;
        uint64_t v27 = 0;
        id v28 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1, &firebloom_null_iv, v28, v28, 16) & 1) == 0) {
              goto LABEL_6;
            }
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f(v14, v43, (uint64_t)v17, 0x10uLL);
          }
          uint64_t v29 = *v28;
          v28 += 2;
          unint64_t v30 = v29 ^ bswap64(v26 + v27++);
          *(void *)&__s[v27 % v22] = v30;
        }
        while (v23 != v27);
        uint64_t v25 = v42 + 1;
        v26 += v41;
      }
      while (v42 != 5);
      id v31 = v38;
      void *v38 = *(void *)&__s[0];
      __int16 v32 = v31 + 1;
      id v33 = (uint64_t *)__s + 1;
      do
      {
        uint64_t v34 = *v33;
        v33 += 2;
        *v32++ = v34;
        --v23;
      }
      while (v23);
      uint64_t v18 = 0;
      unint64_t *v40 = v37 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4) {
        return v18;
      }
LABEL_31:
      cc_clear();
      return v18;
    }
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_wrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  unint64_t v11 = *a8;
  uint64_t v9 = rfc3394_wrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_unwrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unint64_t a6, void *a7, void *a8)
{
  uint64_t v45 = a5;
  uint64_t v43 = a1;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  uint64_t v14 = ccaes_cbc_decrypt_mode();
  MEMORY[0x1F4188790]();
  uint64_t v46 = (uint64_t)&v37 - v15;
  bzero((char *)&v37 - v15, v15);
  MEMORY[0x1F4188790]();
  long long v17 = (char *)&v37 - v16;
  bzero((char *)&v37 - v16, v16);
  uint64_t v18 = 0xFFFFFFFFLL;
  if (HIDWORD(a6)) {
    goto LABEL_33;
  }
  uint64_t v39 = a3;
  unsigned int v19 = a6 >> 3;
  if ((a6 >> 3) - 6 < 0xFFFFFFFC) {
    goto LABEL_33;
  }
  id v40 = &v37;
  uint64_t v41 = a8;
  id v38 = a7;
  unint64_t v44 = a6;
  if (!a4)
  {
    BOOL v20 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v20 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }
    cccbc_init();
    goto LABEL_15;
  }
  if (a8 && *v41 >= v44 - 8)
  {
LABEL_15:
    *(void *)&__s[0] = *v45;
    uint64_t v21 = v19 - 1;
    if (v19 != 1)
    {
      unsigned int v22 = (void *)__s + 1;
      uint64_t v23 = v45 + 1;
      uint64_t v24 = v19 - 1;
      do
      {
        uint64_t v25 = *v23++;
        *unsigned int v22 = v25;
        v22 += 2;
        --v24;
      }
      while (v24);
    }
    int v26 = 6 * v19 - 6;
    LODWORD(v43) = 1 - v19;
    int v27 = 5;
    uint64_t v42 = (unint64_t *)&__s[v19 - 2];
    do
    {
      LODWORD(v45) = v27;
      if (v44 >= 0x10)
      {
        id v28 = v42;
        int v29 = v21;
        unsigned int v30 = v26;
        do
        {
          *id v28 = *(void *)&__s[v29 % v21] ^ bswap64(v30);
          if (a4)
          {
            if ((a4(0, &firebloom_null_iv, v28, v28, 16) & 1) == 0) {
              goto LABEL_6;
            }
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f(v14, v46, (uint64_t)v17, 0x10uLL);
          }
          --v30;
          v28 -= 2;
          BOOL v31 = __OFSUB__(v29--, 1);
        }
        while (!((v29 < 0) ^ v31 | (v29 == 0)));
      }
      int v27 = v45 - 1;
      v26 += v43;
    }
    while (v45);
    if (*(void *)&__s[0] == v39)
    {
      __int16 v32 = v38;
      if (v21)
      {
        id v33 = (uint64_t *)__s + 1;
        uint64_t v34 = v21;
        do
        {
          uint64_t v35 = *v33;
          v33 += 2;
          *v32++ = v35;
          --v34;
        }
        while (v34);
      }
      uint64_t v18 = 0;
      void *v41 = (8 * v21);
    }
    else
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }
LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4) {
      return v18;
    }
LABEL_34:
    cc_clear();
    return v18;
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_unwrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  uint64_t v11 = *a8;
  uint64_t v9 = rfc3394_unwrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_wrapped_size_legacy(unsigned int a1, _DWORD *a2)
{
  uint64_t v2 = a1 + 15;
  uint64_t v3 = v2 << 31 >> 31;
  BOOL v4 = v3 != v2 || v3 < 0;
  int v5 = v4;
  if (!v4) {
    *a2 = v3 & 0xFFFFFFF8;
  }
  return v5 ^ 1u;
}

uint64_t rfc3394_wrapped_size(unint64_t a1, unint64_t *a2)
{
  uint64_t v2 = a1 >= 0xFFFFFFFFFFFFFFF1;
  BOOL v3 = v2 << 63 >> 63 != v2 || v2 << 63 >> 63 == -1;
  int v4 = v3;
  if (!v3) {
    *a2 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  }
  return v4 ^ 1u;
}

BOOL rfc3394_unwrapped_size_legacy(unsigned int a1, unsigned int *a2)
{
  unsigned int v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL rfc3394_unwrapped_size(unint64_t a1, unint64_t *a2)
{
  unint64_t v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

uint64_t aks_fv_new_vek()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  int v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  v22[0] = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v18 = __s;
  *((void *)&v18 + 1) = v22;
  size_t v19 = 4096;
  uint64_t v12 = 3758097090;
  if (v6 && v4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_vek", ":", 179, "", 0, "", "");
      uint64_t v12 = 3758097084;
      goto LABEL_16;
    }
    mach_port_t v14 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v18, v8)
      || !der_utils_encode_fv_data(&v18, v10)
      || !der_utils_encode_fv_params(&v18, v11)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_14;
    }
    input[0] = *((void *)&v18 + 1);
    input[1] = (uint64_t)v22 - *((void *)&v18 + 1);
    uint64_t v15 = IOConnectCallMethod(v14, 0x4Au, input, 2u, 0, 0, 0, 0, __s, &v19);
    if (v15)
    {
      uint64_t v12 = v15;
      goto LABEL_16;
    }
    *(void *)&long long v17 = __s;
    *((void *)&v17 + 1) = &__s[v19];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v17, 0, v4)) {
      goto LABEL_14;
    }
    if (!v2)
    {
      uint64_t v12 = 0;
      goto LABEL_16;
    }
    uint64_t v12 = 0;
    if ((der_utils_decode_fv_key(&v17, 0, v2) & 1) == 0) {
LABEL_14:
    }
      uint64_t v12 = 3758097098;
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

uint64_t get_aks_client_connection()
{
  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_173);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_152_0);
  uint64_t result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

unint64_t _aks_save_file(char *a1, const void *a2, size_t a3)
{
  unint64_t v3 = (unint64_t)a1;
  if (a1)
  {
    int v6 = open_dprotected_np(a1, 1793, 4, 0, 384);
    if (v6 == -1)
    {
      uint64_t v10 = __error();
      uint64_t v11 = strerror(*v10);
      syslog(3, "could not create file: %s (%s)\n", (const char *)v3, v11);
      return 0;
    }
    else
    {
      int v7 = v6;
      ssize_t v8 = write(v6, a2, a3);
      unint64_t v3 = v8 != -1;
      if (v8 == -1)
      {
        uint64_t v12 = __error();
        id v13 = strerror(*v12);
        syslog(3, "failed to write restore bag to disk %s\n", v13);
      }
      close(v7);
    }
  }
  return v3;
}

const char *_aks_load_file(char *a1, void *a2, size_t *a3)
{
  unint64_t v3 = a1;
  memset(&v14, 0, sizeof(v14));
  if (a1)
  {
    if (!stat(a1, &v14))
    {
      size_t st_size = v14.st_size;
      int v7 = open(v3, 0);
      if (v7 == -1)
      {
        uint64_t v12 = __error();
        id v13 = strerror(*v12);
        syslog(3, "could not open file: %s (%s)\n", v3, v13);
      }
      else
      {
        int v8 = v7;
        uint64_t v9 = calloc(st_size, 1uLL);
        unint64_t v3 = (const char *)(v9 != 0);
        if (!v9)
        {
LABEL_7:
          close(v8);
          return v3;
        }
        uint64_t v10 = v9;
        if (read(v8, v9, st_size) == st_size)
        {
          *a2 = v10;
          *a3 = st_size;
          goto LABEL_7;
        }
        close(v8);
        free(v10);
      }
    }
    return 0;
  }
  return v3;
}

uint64_t aks_delete_xart_leak(unsigned int a1, const void *a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x6Cu, input, 1u, a2, 0x10uLL, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_delete_xart_leak", ":", 268, "", 0, "", "");
  return 3758097084;
}

char *_iterate_path(char *result, uint64_t a2, uint64_t a3)
{
  v9[2] = *(char **)MEMORY[0x1E4F143B8];
  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    uint64_t result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      uint64_t v5 = (FTS *)result;
      int v6 = fts_read((FTS *)result);
      if (v6)
      {
        int v7 = v6;
        do
        {
          int fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0) {
                  fts_set(v5, v7, 4);
                }
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          int v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

char *aks_dump_path(char *result, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v3 = result;
    bzero(v8, 0x400uLL);
    uint64_t result = realpath_DARWIN_EXTSN(v3, v8);
    if (result)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 0x40000000;
      _DWORD v6[2] = __aks_dump_path_block_invoke;
      void v6[3] = &__block_descriptor_tmp;
      int v7 = a2;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 0x40000000;
      v4[2] = __aks_dump_path_block_invoke_2;
      void v4[3] = &__block_descriptor_tmp_127;
      int v5 = a2;
      return _iterate_path(v8, (uint64_t)v6, (uint64_t)v4);
    }
  }
  return result;
}

uint64_t __aks_dump_path_block_invoke(uint64_t a1, uint64_t a2)
{
  int path_class = _get_path_class(*(const char **)(a2 + 48));
  int v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || path_class == v5) {
    printf(" dir: %s %i\n", *(const char **)(a2 + 48), path_class);
  }
  return 1;
}

uint64_t _get_path_class(const char *a1)
{
  int v1 = open_dprotected_np(a1, 0, 0, 1);
  if (v1 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  uint64_t v3 = fcntl(v1, 63);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  return v3;
}

uint64_t __aks_dump_path_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = _get_path_class(*(const char **)(a2 + 48));
  int v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || result == v5) {
    return printf("file: %s %i\n", *(const char **)(a2 + 48), result);
  }
  return result;
}

uint64_t aks_fs_supports_enhanced_apfs()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EF00], "IODeviceTree:/filesystems");
  if (v0)
  {
    io_object_t v1 = v0;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    BOOL v3 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v1);
  }
  else
  {
    BOOL v3 = 0;
  }
  size_t __len = 1023;
  bzero(__big, 0x400uLL);
  if ((_aks_check_apfs_shared_datavolume_bootarg_init & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
      _aks_check_apfs_shared_datavolume_bootarg_value = 1;
    }
    _aks_check_apfs_shared_datavolume_bootarg_init = 1;
  }
  unsigned int v4 = _aks_check_apfs_shared_datavolume_bootarg_value;
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n", "aks", "", "", "", "aks_fs_supports_enhanced_apfs", ":", 437, "", 0, "", v3, _aks_check_apfs_shared_datavolume_bootarg_value, "");
  return v3 | v4;
}

uint64_t aks_fs_status(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(v4, 0x400uLL);
  bzero(__str, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v4))
  {
    snprintf(__str, 0x400uLL, "%s/mobile", v4);
    aks_fs_status_with_map(v4, (uint64_t)&sharedPathMap, 35);
    if ((aks_fs_supports_enhanced_apfs() & 1) == 0) {
      aks_fs_status_with_map(__str, (uint64_t)&userPathMap, 72);
    }
  }
  return 0;
}

void aks_fs_status_with_map(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  bzero(__str, 0x400uLL);
  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    uint64_t v6 = a2 + 16;
    do
    {
      snprintf(__str, 0x400uLL, "%s%s", a1, *(const char **)(v6 - 16));
      if (stat(__str, &v7))
      {
        printf("stat failed: %s\n");
      }
      else
      {
        _get_path_class(__str);
        printf("%s: mode=%o, u/g=%i:%i class=%i%s\n");
      }
      v6 += 48;
      --a3;
    }
    while (a3);
  }
}

uint64_t aks_user_fs_status(const char *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  bzero(v3, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v3)) {
    aks_fs_status_with_map(v3, (uint64_t)&userPathMap, 72);
  }
  return 0;
}

const char *aks_show_allowlist()
{
  puts("shared allow list:");
  aks_show_allowlist_with_map("<var>", (uint64_t)&sharedPathMap, 35);
  puts("user allow list:");
  return aks_show_allowlist_with_map("<user>", (uint64_t)&userPathMap, 72);
}

const char *aks_show_allowlist_with_map(const char *result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v4 = result;
    uint64_t v5 = (const char **)(a2 + 16);
    uint64_t v6 = (const char **)(a2 + 16);
    do
    {
      char v7 = *(unsigned char *)v6;
      v6 += 6;
      if (v7) {
        uint64_t result = (const char *)printf("%s%s\n", v4, *(v5 - 2));
      }
      uint64_t v5 = v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t aks_fv_new_kek()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  int v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  unsigned int v8 = v7;
  uint64_t v9 = v0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v16 = __s;
  *((void *)&v16 + 1) = &v20;
  size_t v17 = 4096;
  uint64_t v10 = 3758097090;
  if (v4 && v2)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v12 = aks_client_connection;
      if (!ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v16, v6)
        || !der_utils_encode_fv_params(&v16, v9)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_10;
      }
      input[0] = v8;
      input[1] = *((void *)&v16 + 1);
      uint64_t input[2] = (uint64_t)&v20 - *((void *)&v16 + 1);
      uint64_t v13 = IOConnectCallMethod(v12, 0x4Cu, input, 3u, 0, 0, 0, 0, __s, &v17);
      if (v13)
      {
        uint64_t v10 = v13;
        goto LABEL_12;
      }
      *(void *)&long long v15 = __s;
      *((void *)&v15 + 1) = &__s[v17];
      if (!ccder_blob_decode_range() || (uint64_t v10 = 0, (der_utils_decode_fv_data(&v15, 0, v2) & 1) == 0)) {
LABEL_10:
      }
        uint64_t v10 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_kek", ":", 508, "", 0, "", "");
      uint64_t v10 = 3758097084;
    }
  }
LABEL_12:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t aks_fv_new_sibling_vek()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v16 = __s;
  *((void *)&v16 + 1) = &v20;
  size_t v17 = 4096;
  uint64_t v10 = 3758097090;
  if (v6 && v4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_sibling_vek", ":", 543, "", 0, "", "");
      uint64_t v10 = 3758097084;
      goto LABEL_15;
    }
    mach_port_t v12 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v16, v8)
      || !der_utils_encode_fv_params(&v16, v9)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_13;
    }
    input[0] = *((void *)&v16 + 1);
    input[1] = (uint64_t)&v20 - *((void *)&v16 + 1);
    uint64_t v13 = IOConnectCallMethod(v12, 0x63u, input, 2u, 0, 0, 0, 0, __s, &v17);
    if (v13)
    {
      uint64_t v10 = v13;
      goto LABEL_15;
    }
    *(void *)&long long v15 = __s;
    *((void *)&v15 + 1) = &__s[v17];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v15, 0, v4)) {
      goto LABEL_13;
    }
    if (!v2)
    {
      uint64_t v10 = 0;
      goto LABEL_15;
    }
    uint64_t v10 = 0;
    if ((der_utils_decode_fv_key(&v15, 0, v2) & 1) == 0) {
LABEL_13:
    }
      uint64_t v10 = 3758097098;
  }
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t aks_fv_rewrap_kek()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  v22[0] = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v18 = __s;
  *((void *)&v18 + 1) = v22;
  size_t v19 = 4096;
  uint64_t v12 = 3758097090;
  if (v8 && v6 && v4 && v2)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v14 = aks_client_connection;
      if (!der_utils_encode_fv_data(&v18, v4)
        || !ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v18, v8)
        || !der_utils_encode_fv_data(&v18, v10)
        || !der_utils_encode_fv_params(&v18, v11)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_14;
      }
      input[0] = *((void *)&v18 + 1);
      input[1] = (uint64_t)v22 - *((void *)&v18 + 1);
      uint64_t v15 = IOConnectCallMethod(v14, 0x4Du, input, 2u, 0, 0, 0, 0, __s, &v19);
      if (v15)
      {
        uint64_t v12 = v15;
        goto LABEL_16;
      }
      *(void *)&long long v17 = __s;
      *((void *)&v17 + 1) = &__s[v19];
      if (!ccder_blob_decode_range() || (uint64_t v12 = 0, (der_utils_decode_fv_data(&v17, 0, v2) & 1) == 0)) {
LABEL_14:
      }
        uint64_t v12 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_rewrap_kek", ":", 582, "", 0, "", "");
      uint64_t v12 = 3758097084;
    }
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

uint64_t aks_fv_set_protection()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  long long v18 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unsigned int v11 = v10;
  uint64_t v12 = v0;
  v24[0] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 3758097098;
  bzero(__s, 0x1000uLL);
  *(void *)&long long v20 = __s;
  *((void *)&v20 + 1) = v24;
  size_t v21 = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_set_protection", ":", 616, "", 0, "", "");
    uint64_t v13 = 3758097084;
    goto LABEL_14;
  }
  mach_port_t v15 = aks_client_connection;
  if (der_utils_encode_fv_data(&v20, v3)
    && der_utils_encode_fv_data(&v20, v5)
    && der_utils_encode_fv_data(&v20, v7)
    && der_utils_encode_fv_params(&v20, v12)
    && ccder_blob_encode_tl())
  {
    input[0] = v11;
    input[1] = v9;
    uint64_t input[2] = *((void *)&v20 + 1);
    uint64_t input[3] = (uint64_t)v24 - *((void *)&v20 + 1);
    uint64_t v16 = IOConnectCallMethod(v15, 0x54u, input, 4u, 0, 0, 0, 0, __s, &v21);
    if (v16)
    {
      uint64_t v13 = v16;
      goto LABEL_14;
    }
    *(void *)&long long v19 = __s;
    *((void *)&v19 + 1) = &__s[v21];
    if (!v21) {
      goto LABEL_13;
    }
    if (!ccder_blob_decode_range()) {
      goto LABEL_14;
    }
    if (!v18)
    {
LABEL_13:
      uint64_t v13 = 0;
      goto LABEL_14;
    }
    uint64_t v13 = 0;
    if ((der_utils_decode_fv_data(&v19, 0, v18) & 1) == 0) {
      uint64_t v13 = 3758097098;
    }
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

uint64_t aks_fv_unwrap_vek_with_acm()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unsigned int v12 = v11;
  uint64_t v13 = v0;
  v24[0] = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v20 = __s;
  *((void *)&v20 + 1) = v24;
  size_t v21 = 4096;
  if (!v6)
  {
    uint64_t v17 = 3758097090;
    goto LABEL_15;
  }
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_unwrap_vek_with_acm", ":", 653, "", 0, "", "");
    uint64_t v17 = 3758097084;
    goto LABEL_15;
  }
  mach_port_t v15 = aks_client_connection;
  if (!der_utils_encode_fv_data(&v20, v4)
    || !der_utils_encode_fv_data(&v20, v6)
    || !der_utils_encode_fv_data(&v20, v8)
    || !der_utils_encode_fv_data(&v20, v10)
    || !der_utils_encode_fv_params(&v20, v13)
    || !ccder_blob_encode_tl())
  {
    goto LABEL_13;
  }
  input[0] = *((void *)&v20 + 1);
  input[1] = (uint64_t)v24 - *((void *)&v20 + 1);
  uint64_t input[2] = v12;
  uint64_t v16 = IOConnectCallMethod(v15, 0x4Bu, input, 3u, 0, 0, 0, 0, __s, &v21);
  if (v16)
  {
    uint64_t v17 = v16;
    goto LABEL_15;
  }
  *(void *)&long long v19 = __s;
  *((void *)&v19 + 1) = &__s[v21];
  if (!ccder_blob_decode_range()) {
    goto LABEL_13;
  }
  if (!v2)
  {
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  uint64_t v17 = 0;
  if ((der_utils_decode_fv_key(&v19, 0, v2) & 1) == 0) {
LABEL_13:
  }
    uint64_t v17 = 3758097098;
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v17;
}

uint64_t aks_fv_unwrap_vek_with_opts()
{
  return aks_fv_unwrap_vek_with_acm();
}

void aks_gather_stats(const char *a1, char a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    bzero(&v13, 0x878uLL);
    bzero(v12, 0x400uLL);
    if (realpath_DARWIN_EXTSN(a1, v12))
    {
      uint64_t v4 = (char *)malloc(0x818uLL);
      memset_s(v4, 0x818uLL, 0, 0x818uLL);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 0x40000000;
      v11[2] = __aks_gather_stats_block_invoke_2;
      v11[3] = &__block_descriptor_tmp_140;
      v11[4] = v4;
      _iterate_path(v12, (uint64_t)&__block_literal_global_53, (uint64_t)v11);
      if (!statfs(v12, &v13))
      {
        if (a2) {
          printf("Free Blocks:%lld blocks of size:%d\n");
        }
        else {
          printf("%lld,%d\n");
        }
      }
      uint64_t v5 = v4 + 340;
      for (uint64_t i = 1; i != 5; ++i)
      {
        if (a2)
        {
          uint64_t v9 = &v4[296 * i];
          printf("%s:\n\tNum files:\t%u,\n\tNum hardlinks:\t%u,\n\tNum compressed:\t%u,\n\tTotal Size:\t%lld,\n\tMin File Size:\t%lld,\n\tMax File Size:\t%lld,\n", class_names[i], *(_DWORD *)v9, *((_DWORD *)v9 + 2), *((_DWORD *)v9 + 1), *((void *)v9 + 2), *((void *)v9 + 3), *((void *)v9 + 4));
          printf("\tSize Distribution:");
          printf("%i", *((_DWORD *)v9 + 10));
          for (uint64_t j = 0; j != 252; j += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[j]);
          }
        }
        else
        {
          uint64_t v7 = &v4[296 * i];
          printf("%i,%u,%u,%u,%lld,%lld,%lld,", i, *(_DWORD *)v7, *((_DWORD *)v7 + 2), *((_DWORD *)v7 + 1), *((void *)v7 + 2), *((void *)v7 + 3), *((void *)v7 + 4));
          printf("%i", *((_DWORD *)v7 + 10));
          for (uint64_t k = 0; k != 252; k += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[k]);
          }
        }
        putchar(10);
        v5 += 296;
      }
      free(v4);
    }
  }
}

uint64_t __aks_gather_stats_block_invoke()
{
  return 1;
}

uint64_t __aks_gather_stats_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = _get_path_class(*(const char **)(a2 + 48));
  if ((result - 7) >= 0xFFFFFFFA)
  {
    uint64_t v5 = *(void *)(a2 + 96);
    int64_t v6 = *(void *)(v5 + 96);
    uint64_t v7 = *(void *)(a1 + 32);
    ++*(_DWORD *)(v7 + 296 * result);
    if (*(unsigned __int16 *)(v5 + 6) >= 2u) {
      ++*(_DWORD *)(v7 + 296 * result + 8);
    }
    if ((*(unsigned char *)(v5 + 116) & 0x20) != 0) {
      ++*(_DWORD *)(v7 + 296 * result + 4);
    }
    uint64_t v8 = v7 + 296 * result;
    int64_t v10 = *(void *)(v8 + 32);
    uint64_t v9 = (int64_t *)(v8 + 32);
    *(v9 - 2) += v6;
    if (v6 > v10) {
      int64_t *v9 = v6;
    }
    uint64_t v11 = v7 + 296 * result;
    int64_t v14 = *(void *)(v11 + 24);
    unsigned int v12 = (int64_t *)(v11 + 24);
    int64_t v13 = v14;
    if (v14) {
      BOOL v15 = v6 < v13;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      int64_t *v12 = v6;
    }
    if (v6) {
      unint64_t v16 = v7 + 296 * result + 4 * (63 - __clz(v6));
    }
    else {
      unint64_t v16 = v7 + 296 * result;
    }
    ++*(_DWORD *)(v16 + 40);
  }
  return result;
}

uint64_t aks_kext_set_options(unsigned int a1, uint64_t a2)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = 1;
  input[1] = a1;
  uint64_t input[2] = a2;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_set_options", ":", 820, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_kext_get_options(unsigned int a1, uint64_t *a2)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 3758097084;
  if (!a2) {
    return 3758097090;
  }
  input[0] = 0;
  input[1] = a1;
  uint64_t input[2] = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v2 = IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
    if (!v2) {
      *a2 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_get_options", ":", 841, "", 0, "", "");
  }
  return v2;
}

uint64_t aks_internal_state()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x10u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_internal_state", ":", 857, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_run_internal_test(unsigned int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x86u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_run_internal_test", ":", 871, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_escrow()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  uint64_t v8 = v7;
  int v10 = v9;
  uint64_t v12 = v11;
  unsigned int v14 = v13;
  int v15 = v0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = v15;
    input[1] = v14;
    uint64_t input[2] = v12;
    uint64_t input[3] = v10;
    if (!v14 || (uint64_t v17 = 3758097090, v4) && v2)
    {
      uint64_t v17 = IOConnectCallMethod(aks_client_connection, 0x36u, input, 4u, v8, v6, 0, 0, __src, &__count);
      if (!v17 && v14)
      {
        long long v18 = calloc(__count, 1uLL);
        *uint64_t v4 = v18;
        if (v18)
        {
          memcpy(v18, __src, __count);
          uint64_t v17 = 0;
          _DWORD *v2 = __count;
        }
        else
        {
          uint64_t v17 = 3758097085;
        }
      }
    }
  }
  else
  {
    uint64_t v17 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_escrow", ":", 890, "", 0, "", "");
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v17;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection) {
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

uint64_t get_akstest_client_connection()
{
  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_173);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_157_0);
  uint64_t result = get_akstest_client_connection_connection;
  if (!get_akstest_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStoreTest");
    return get_akstest_client_connection_connection;
  }
  return result;
}

void __get_akstest_client_connection_block_invoke()
{
  if (!get_akstest_client_connection_connection) {
    get_akstest_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStoreTest", "AppleKeyStoreTest");
  }
}

uint64_t akstest_new_key(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a4;
  input[1] = a3;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  bzero(outputStruct, 0x400uLL);
  size_t v19 = 1024;
  uint64_t v11 = IOConnectCallMethod(a1, 0xFu, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v19);
  if (v11) {
    return v11;
  }
  uint64_t v17 = 3758097084;
  if (outputCnt == 1)
  {
    *a7 = output;
    if (aks_unpack_data(outputStruct, v19, 3u, v12, v13, v14, v15, v16, a5)) {
      return 3758097084;
    }
    else {
      return 0;
    }
  }
  return v17;
}

uint64_t akstest_new_ekwk(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a4;
  input[1] = a3;
  uint64_t output = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint32_t outputCnt = 3;
  bzero(outputStruct, 0x400uLL);
  size_t v26 = 1024;
  uint64_t v17 = IOConnectCallMethod(a1, 0x13u, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v26);
  if (v17) {
    return v17;
  }
  uint64_t v23 = 3758097084;
  if (outputCnt == 3)
  {
    int v24 = v30;
    *a7 = output;
    *a10 = v24;
    *a13 = v31;
    if (aks_unpack_data(outputStruct, v26, 5u, v18, v19, v20, v21, v22, a5)) {
      return 3758097084;
    }
    else {
      return 0;
    }
  }
  return v23;
}

uint64_t akstest_new_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t *a8)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, a2);
  uint64_t v11 = IOConnectCallMethod(a1, 0x14u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, a8);
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t akstest_rewrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, unsigned int a12, void *outputStruct, size_t *a14, _DWORD *a15)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  input[1] = a6;
  uint64_t input[2] = a9;
  uint64_t input[3] = a12;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 4, a4, a5, a6, a7, a8, a2);
  uint64_t v16 = IOConnectCallMethod(a1, 0x15u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, outputStruct, a14);
  if (v16)
  {
    uint64_t v17 = v16;
  }
  else if (outputCnt == 1)
  {
    uint64_t v17 = 0;
    *a15 = output;
  }
  else
  {
    uint64_t v17 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t akstest_unwrap_key(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  input[1] = a6;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  size_t outputStructCnt = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  uint64_t v15 = IOConnectCallMethod(a1, 0x10u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &outputStructCnt);
  if (v15)
  {
    uint64_t v21 = v15;
  }
  else if (aks_unpack_data(outputStruct, outputStructCnt, 2u, v16, v17, v18, v19, v20, a7))
  {
    uint64_t v21 = 3758097084;
  }
  else
  {
    uint64_t v21 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v21;
}

uint64_t akstest_unwrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  input[1] = a6;
  uint64_t input[2] = a9;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  size_t v25 = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a2);
  uint64_t v17 = IOConnectCallMethod(a1, 0x17u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
  if (v17)
  {
    uint64_t v23 = v17;
  }
  else if (aks_unpack_data(outputStruct, v25, 2u, v18, v19, v20, v21, v22, a10))
  {
    uint64_t v23 = 3758097084;
  }
  else
  {
    uint64_t v23 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v23;
}

uint64_t akstest_check_class(mach_port_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  return IOConnectCallMethod(a1, 0x11u, input, 1u, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t akstest_last_user(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, a4, a5, a6, a7, a8, a3);
  uint64_t v9 = IOConnectCallMethod(a1, 0x12u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_get_internal_info_for_key()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v6) {
      size_t v8 = 18;
    }
    else {
      size_t v8 = 0;
    }
    uint64_t v9 = IOConnectCallMethod(aks_client_connection, 0x5Du, input, 1u, v6, v8, 0, 0, __src, &__count);
    size_t v10 = __count;
    if (v9)
    {
      uint64_t v12 = v9;
    }
    else if (__count - 32769 < 0xFFFFFFFFFFFF8000)
    {
      uint64_t v12 = 3758097090;
    }
    else
    {
      uint64_t v11 = calloc(__count, 1uLL);
      *uint64_t v4 = v11;
      size_t v10 = __count;
      if (v11)
      {
        size_t *v2 = __count;
        memcpy(v11, __src, v10);
        uint64_t v12 = 0;
        size_t v10 = __count;
      }
      else
      {
        uint64_t v12 = 3758097085;
      }
    }
  }
  else
  {
    uint64_t v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_info_for_key", ":", 1246, "", 0, "", "");
    size_t v10 = 0x8000;
  }
  memset_s(__src, v10, 0, v10);
  return v12;
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  mach_port_t v3 = *MEMORY[0x1E4F2EF00];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EF00], path);
  int v5 = (task_port_t *)MEMORY[0x1E4F14960];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x1E4F14960], 0, &connect), IOObjectRelease(v6), v7))
  {
    size_t v8 = IOServiceMatching(a2);
    io_service_t MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      size_t v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  dispatch_queue_t result = connect;
  if (connect)
  {
    uint64_t v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sizeof_backup_bag()
{
  ccder_sizeof_implicit_uint64();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_implicit_uint64();
  return ccder_sizeof();
}

uint64_t encode_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a2 + a3;
  if (!ccder_blob_encode_implicit_uint64()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_implicit_uint64())
  {
    return 4294967273;
  }
  int v3 = ccder_blob_encode_tl();
  uint64_t result = 4294967273;
  if (v3)
  {
    if (a2 == v6) {
      return 0;
    }
    else {
      return 4294967273;
    }
  }
  return result;
}

uint64_t decode_backup_bag(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&long long v6 = a1;
  *((void *)&v6 + 1) = a1 + a2;
  if (!ccder_blob_decode_range()
    || !der_utils_decode_implicit_uint64(&v6, 0x8000000000000000, a3)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000001, (uint64_t)(a3 + 1), 16)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000002, (uint64_t)(a3 + 3), 40)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000003, (uint64_t)(a3 + 8), 16))
  {
    return 4294967277;
  }
  int v4 = der_utils_decode_implicit_uint64(&v6, 0x8000000000000004, a3 + 10);
  uint64_t result = 4294967277;
  if (v4)
  {
    if ((void)v6 == *((void *)&v6 + 1)) {
      return 0;
    }
    else {
      return 4294967277;
    }
  }
  return result;
}

uint64_t wrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  int v12 = 40;
  *(void *)a4 = 0;
  uuid_copy((unsigned __int8 *)(a4 + 8), (const unsigned __int8 *)(a1 + 32));
  *(void *)(a4 + 80) = 1;
  platform_read_random(a4 + 64, 0x10u);
  uint64_t v8 = ccsha256_di();
  if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a4 + 64, *(void *)(a4 + 80), 32, __s))
  {
    uint64_t v10 = 4294967286;
  }
  else
  {
    uint64_t v9 = rfc3394_wrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a1, 0x20u, (void *)(a4 + 24), &v12);
    if (v9)
    {
      uint64_t v10 = v9;
    }
    else if (v12 == 40)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 4294967286;
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t unwrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  int v12 = 32;
  if (*(void *)a1)
  {
    uint64_t v10 = 4294967284;
  }
  else
  {
    uint64_t v8 = ccsha256_di();
    if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a1 + 64, *(void *)(a1 + 80), 32, __s)) {
      goto LABEL_9;
    }
    uint64_t v9 = rfc3394_unwrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (void *)(a1 + 24), 0x28u, (void *)a4, &v12);
    if (v9)
    {
      uint64_t v10 = v9;
      goto LABEL_8;
    }
    if (v12 != 32)
    {
LABEL_9:
      uint64_t v10 = 4294967286;
    }
    else
    {
      cccurve25519_make_pub();
      if (uuid_compare((const unsigned __int8 *)(a1 + 8), (const unsigned __int8 *)(a4 + 32))) {
        uint64_t v10 = 4294967272;
      }
      else {
        uint64_t v10 = 0;
      }
    }
  }
LABEL_8:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t aks_stash_create_for_bag_and_kek()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  int v4 = v3;
  uint64_t v6 = v5;
  unsigned int v8 = v7;
  unsigned int v10 = v9;
  int v11 = v0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 3758097098;
  bzero(v18, 0x1000uLL);
  *(void *)&long long v16 = v18;
  *((void *)&v16 + 1) = &v19;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v14 = aks_client_connection;
    if (der_utils_encode_fv_data(&v16, v2) && ccder_blob_encode_tl())
    {
      input[0] = v11;
      input[1] = v10;
      uint64_t input[2] = v6;
      uint64_t input[3] = v4;
      uint64_t input[4] = v8;
      uint64_t input[5] = *((void *)&v16 + 1);
      input[6] = (uint64_t)&v19 - *((void *)&v16 + 1);
      return IOConnectCallMethod(v14, 0x21u, input, 7u, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_create_for_bag_and_kek", ":", 50, "", 0, "", "");
    return 3758097084;
  }
  return v12;
}

uint64_t aks_stash_create()
{
  return aks_stash_create_for_bag_and_kek();
}

uint64_t aks_stash_load(int a1)
{
  return _aks_stash_load(a1, 0, 0);
}

uint64_t _aks_stash_load(int a1, unsigned int a2, BOOL *a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0x22u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (!result)
    {
      uint64_t result = 0;
      if (a3) {
        *a3 = output != 0;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_stash_load", ":", 77, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_stash_verify(int a1, unsigned char *a2)
{
  BOOL v4 = 0;
  if (!a2) {
    return _aks_stash_load(a1, 1u, &v4);
  }
  *a2 = 0;
  uint64_t result = _aks_stash_load(a1, 1u, &v4);
  if (!result) {
    *a2 = v4;
  }
  return result;
}

uint64_t aks_stash_destroy()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x25u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_destroy", ":", 125, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_stash_commit(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x24u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_commit", ":", 138, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_enable(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x33u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_enable", ":", 154, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_stash_persist(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x35u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_persist", ":", 170, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_prederived_free(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1634431856) {
    return 0xFFFFFFFFLL;
  }
  free(a1[1]);
  free(a1);
  return 0;
}

uint64_t aks_prederived_create(int a1, uint64_t a2, unint64_t a3, int a4, void ***a5)
{
  mach_port_t v14 = 0;
  if (!a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  if (_aks_prederived_create_ctx(a4, &v14) || (unsigned int v9 = calloc(0x20uLL, 1uLL)) == 0)
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  else
  {
    unsigned int v10 = v9;
    int v11 = _aks_prederive_passcode(v14, a2, a3, (uint64_t)v9);
    uint64_t v12 = 0xFFFFFFFFLL;
    if (a3 <= 0x7FFFFFFE
      && !v11
      && !_set_prederived_configuration(a1, a2, a3, (uint64_t)v10, (uint64_t)v14))
    {
      uint64_t v12 = 0;
      if (a5)
      {
        *a5 = v14;
        mach_port_t v14 = 0;
      }
    }
    memset_s(v10, 0x20uLL, 0, 0x20uLL);
    free(v10);
  }
  if (v14) {
    aks_prederived_free(v14);
  }
  return v12;
}

uint64_t _aks_prederived_create_ctx(int a1, void *a2)
{
  if ((a1 - 1) > 2 || a2 == 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = calloc(0x20uLL, 1uLL);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v7 = v6;
  *((void *)v6 + 2) = 20;
  unsigned int v8 = calloc(0x14uLL, 1uLL);
  *((void *)v7 + 1) = v8;
  if (!v8)
  {
LABEL_19:
    free(v7);
    return 0xFFFFFFFFLL;
  }
  *unsigned int v7 = 1634431856;
  v7[6] = a1;
  uint64_t result = CCRandomCopyBytes();
  if (result)
  {
    unsigned int v10 = (void *)*((void *)v7 + 1);
    if (v10) {
      free(v10);
    }
    goto LABEL_19;
  }
  if (a1 == 3) {
    int v9 = 2000;
  }
  else {
    int v9 = 10000000;
  }
  if (a1 == 2) {
    int v9 = 1000;
  }
  v7[1] = v9;
  *a2 = v7;
  return result;
}

uint64_t _aks_prederive_passcode(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*a1 != 1634431856 || !a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a4 && (a1[6] - 4) >= 0xFFFFFFFD)
  {
    ccsha256_di();
    if (ccpbkdf2_hmac()) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _set_prederived_configuration(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  rsize_t __n = 0;
  __s = 0;
  uint64_t v10 = 3758097090;
  mach_port_t v14 = 0;
  if ((a2 || !a3) && a4 && a5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v12 = aks_client_connection;
      if (!encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_salt, *(void *)(a5 + 8))
        && !encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_passcode, a4)
        && !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_iterations, *(unsigned int *)(a5 + 4))&& !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_type, *(unsigned int *)(a5 + 24))&& (a3 < 1 || !encode_list_add_data(&v14, (uint64_t)der_key_passcode, a2))&& !encode_list_is_empty(&v14)&& !encode_list_dict(&v14, &__s, &__n))
      {
        input[0] = a1;
        input[1] = (uint64_t)__s;
        uint64_t input[2] = __n;
        uint64_t v10 = IOConnectCallMethod(v12, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_set_prederived_configuration", ":", 218, "", 0, "", "");
      uint64_t v10 = 3758097084;
    }
  }
  encode_list_free(&v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v10;
}

uint64_t aks_prederived_is_enabled()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  int v3 = v0;
  uint64_t result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  *(_DWORD *)uint64_t result = 1634431856;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_prederived_configuration", ":", 384, "", 0, "", "");
LABEL_16:
    aks_prederived_free((void **)v5);
    return 0;
  }
  mach_port_t v7 = aks_client_connection;
  bzero(outputStruct, 0x8000uLL);
  v13[0] = 0x8000;
  uint64_t input = v3;
  if (IOConnectCallMethod(v7, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v13) || v13[0] > 0x8000) {
    goto LABEL_16;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  long long v15 = 0u;
  long long v17 = 0u;
  uint64_t v18 = 0;
  long long v14 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13[1] = (size_t)der_key_config_prederived_salt;
  long long v16 = (unint64_t)der_key_config_prederived_iterations;
  uint64_t v19 = der_key_config_prederived_type;
  der_dict_iterate();
  uint64_t v9 = ccder_decode_tl();
  if (v9)
  {
    uint64_t v10 = (const void *)v9;
    int v11 = calloc(*(void *)(v5 + 16), 1uLL);
    *(void *)(v5 + 8) = v11;
    if (!v11)
    {
      int v12 = 0;
      if (!Mutable) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    memcpy(v11, v10, *(void *)(v5 + 16));
    *(_DWORD *)(v5 + 4) = der_get_number();
    *(_DWORD *)(v5 + 24) = der_get_number();
  }
  int v12 = 1;
  if (Mutable) {
LABEL_10:
  }
    CFRelease(Mutable);
LABEL_11:
  if (!v12 || !*(void *)(v5 + 16)) {
    goto LABEL_16;
  }
  uint64_t *v2 = v5;
  return 1;
}

uint64_t aks_prederived_unlock_keybag(int a1, uint64_t a2, int a3, _DWORD *a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, sizeof(v9));
  if (a3) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = v4 || a4 == 0;
  if (v5 || *a4 != 1634431856 || _aks_prederive_passcode(a4, a2, a3, (uint64_t)v9)) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = aks_unlock_bag(a1, (uint64_t)v9, 32);
  }
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t aks_unlock_bag(int a1, uint64_t a2, int a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    return IOConnectCallMethod(aks_client_connection, 0xCu, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_bag", ":", 807, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_prederived_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, void ***a6)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  memset(v17, 0, sizeof(v17));
  long long v16 = 0;
  if (!a6) {
    goto LABEL_17;
  }
  uint64_t v7 = *a6;
  if (!*a6 || *(_DWORD *)v7 != 1634431856 || !a2 && a3) {
    goto LABEL_17;
  }
  if (!a4 && a5 || _aks_prederive_passcode(*a6, a2, a3, (uint64_t)__s)) {
    goto LABEL_17;
  }
  int v11 = _aks_prederived_create_ctx(*((_DWORD *)v7 + 6), &v16);
  int v12 = v16;
  if (v11 || (int v13 = _aks_prederive_passcode(v16, a4, a5, (uint64_t)v17), v12 = v16, v13))
  {
LABEL_15:
    if (v12) {
      aks_prederived_free(v12);
    }
LABEL_17:
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (_set_prederived_configuration(a1, (uint64_t)__s, 32, (uint64_t)v17, (uint64_t)v16))
  {
    int v12 = v16;
    goto LABEL_15;
  }
  aks_prederived_free(v7);
  uint64_t v14 = 0;
  *a6 = v16;
LABEL_13:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v17, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t aks_create_bag(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, a3, -1, a4);
}

uint64_t _create_bag(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  input[6] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      uint64_t input[2] = a1;
      uint64_t input[3] = a2;
      uint64_t input[4] = a3;
      uint64_t input[5] = a4;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(aks_client_connection, 2u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v14) {
        *a7 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_create_bag", ":", 187, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_create_escrow_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 2u, a3, a4);
}

uint64_t aks_create_escrow_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 2u, a5, a6);
}

uint64_t aks_create_sync_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 0x8000002u, a3, a4);
}

uint64_t aks_create_sync_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 0x8000002u, a5, a6);
}

uint64_t aks_invalidate_sync_bags()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x42u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_sync_bags", ":", 544, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_unlock_with_sync_bag(const void *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1)
    {
      input[0] = a5;
      input[1] = a3;
      uint64_t input[2] = a4;
      return IOConnectCallMethod(aks_client_connection, 0x43u, input, 3u, a1, a2, 0, 0, 0, 0);
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_with_sync_bag", ":", 557, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_load_bag(const void *a1, int a2, _DWORD *a3)
{
  output[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v6 = 3758097090;
    if (a1)
    {
      if (a3)
      {
        output[0] = 0;
        uint32_t outputCnt = 1;
        uint64_t v6 = IOConnectCallMethod(aks_client_connection, 6u, 0, 0, a1, a2, output, &outputCnt, 0, 0);
        if (!v6) {
          *a3 = output[0];
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_load_bag", ":", 574, "", 0, "", "");
  }
  return v6;
}

uint64_t aks_invalidate_bag(const void *a1, int a2)
{
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1) {
      return IOConnectCallMethod(aks_client_connection, 0x57u, 0, 0, a1, a2, 0, 0, 0, 0);
    }
    return 3758097090;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_bag", ":", 596, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_unload_bag(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_bag", ":", 612, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_unload_session_bags(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x37u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_session_bags", ":", 629, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_save_bag()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v7 = aks_client_connection;
    uint64_t result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        uint64_t input = v5;
        uint64_t result = IOConnectCallMethod(v7, 3u, &input, 1u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          uint64_t v9 = calloc(__count, 1uLL);
          *uint64_t v4 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            uint64_t result = 0;
            _DWORD *v2 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_save_bag", ":", 646, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_opts(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, unsigned int a12, _DWORD *a13)
{
  input[12] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a11;
    uint64_t input[2] = a10;
    uint64_t input[3] = a2;
    uint64_t input[4] = a3;
    uint64_t input[5] = a4;
    input[6] = a5;
    uint64_t input[7] = a6;
    input[8] = a7;
    input[9] = a8;
    input[10] = a9;
    input[11] = a12;
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0xFu, input, 0xCu, 0, 0, &output, &outputCnt, 0, 0);
    if (a13)
    {
      if (!result) {
        *a13 = output;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_opts", ":", 678, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_se(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, _DWORD *a12)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t aks_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _DWORD *a7)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, 0, 0, 0, 0, 0xFFu, a6, 0, a7);
}

uint64_t aks_get_bag_uuid(int a1, _OWORD *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  size_t v7 = 16;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      long long outputStruct = 0uLL;
      uint64_t input = a1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0x17u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v7);
      if (!v4) {
        *a2 = outputStruct;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_bag_uuid", ":", 729, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_copy_volume_cookie(int a1, void *a2, size_t *a3)
{
  return aks_copy_volume_cookie_persona(a1, (uint64_t)&UUID_NULL, a2, a3);
}

uint64_t aks_copy_volume_cookie_persona(int a1, uint64_t a2, void *a3, size_t *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  __int16 v23 = 0;
  memset(__src, 0, sizeof(__src));
  size_t __count = 34;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v14 = 3758097090;
    if (a3 && a4)
    {
      mach_port_t v15 = aks_client_connection;
      uint64_t input = a1;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v9, v10, v11, v12, v13, a2);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v16 = IOConnectCallMethod(v15, 0x44u, &input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if (v16)
        {
          uint64_t v14 = v16;
        }
        else
        {
          long long v17 = calloc(__count, 1uLL);
          *a3 = v17;
          uint64_t v14 = 3758097085;
          if (v17)
          {
            memcpy(v17, __src, __count);
            uint64_t v14 = 0;
            *a4 = __count;
          }
        }
      }
      else
      {
        uint64_t v14 = 3758097085;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_copy_volume_cookie_persona", ":", 760, "", 0, "", "");
    uint64_t v14 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v14;
}

uint64_t aks_lock_bag(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0xDu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_bag", ":", 790, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_get_lock_state(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 7u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_lock_state", ":", 824, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_wrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v14 = 3758097090;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      size_t v18 = *a6;
      uint64_t v16 = IOConnectCallMethod(aks_client_connection, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if (v16)
      {
        return v16;
      }
      else
      {
        *a6 = v18;
        uint64_t v14 = 0;
        if (a7) {
          *a7 = output;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_wrap_key", ":", 848, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_unwrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v12 = 3758097090;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          size_t v15 = *a6;
          uint64_t v12 = IOConnectCallMethod(aks_client_connection, 0xBu, input, 2u, a1, a2, 0, 0, a5, &v15);
          if (!v12) {
            *a6 = v15;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unwrap_key", ":", 877, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_rewrap_key_for_backup(const void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v14 = 3758097090;
    if (a1 && a7)
    {
      input[0] = a3;
      input[1] = a4;
      uint64_t input[2] = a5;
      uint64_t input[3] = a6;
      size_t v17 = 108;
      return IOConnectCallMethod(aks_client_connection, 0x18u, input, 4u, a1, a2, 0, 0, a7, &v17);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_rewrap_key_for_backup", ":", 901, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_get_system(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0xEu, input, a1 != 0, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_system", ":", 922, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_set_system_with_passcode(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 5u, input, 4u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_system_with_passcode", ":", 950, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_set_system(int a1, int a2)
{
  return aks_set_system_with_passcode(a1, a2, 0, 0);
}

uint64_t aks_set_keybag_for_volume(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v13 = aks_client_connection;
    input[0] = a1;
    input[1] = a3;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v8, v9, v10, v11, v12, a2);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v6 = IOConnectCallMethod(v13, 0x41u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      uint64_t v14 = *(void **)&inputStructCnt[1];
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v6 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_keybag_for_volume_with_cookie_persona", ":", 987, "", 0, "", "");
    uint64_t v14 = 0;
  }
  free(v14);
  return v6;
}

uint64_t aks_backup_enable_volume()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 3758097085;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v17 = aks_client_connection;
    input[0] = v8;
    input[1] = v6;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, v9);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v18 = IOConnectCallMethod(v17, 0x6Eu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if (v18)
      {
        uint64_t v10 = v18;
      }
      else
      {
        uint64_t v19 = calloc(__count, 1uLL);
        *uint64_t v4 = v19;
        if (v19)
        {
          memcpy(v19, __src, __count);
          uint64_t v10 = 0;
          size_t *v2 = __count;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_enable_volume", ":", 1014, "", 0, "", "");
    uint64_t v10 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t aks_backup_disable_volume(uint64_t a1)
{
  uint64_t v2 = 3758097084;
  uint64_t v13 = 0;
  int v12 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v9 = aks_client_connection;
    aks_pack_data(&v13, (unsigned int *)&v12, 1, v4, v5, v6, v7, v8, a1);
    if (v13)
    {
      uint64_t v2 = IOConnectCallMethod(v9, 0x6Fu, 0, 0, v13, v12, 0, 0, 0, 0);
      uint64_t v10 = v13;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v2 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_disable_volume", ":", 1044, "", 0, "", "");
    uint64_t v10 = 0;
  }
  free(v10);
  return v2;
}

uint64_t aks_backup_copy_current_bag_uuid(uint64_t a1, void *a2)
{
  uint64_t v4 = 3758097084;
  uint64_t v16 = 0;
  int v15 = 0;
  size_t v14 = 16;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v11 = aks_client_connection;
    aks_pack_data(&v16, (unsigned int *)&v15, 1, v6, v7, v8, v9, v10, a1);
    if (v16)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x70u, 0, 0, v16, v15, 0, 0, a2, &v14);
      int v12 = v16;
    }
    else
    {
      int v12 = 0;
      uint64_t v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_copy_current_bag_uuid", ":", 1066, "", 0, "", "");
    int v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_backup_rewrap_key(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v20 = aks_client_connection;
    long long v21 = 0;
    uint64_t v13 = 3758097090;
    if (a2 && a7)
    {
      input[0] = a4;
      input[1] = a5;
      uint64_t input[2] = a6;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v15, v16, v17, v18, v19, a1);
      size_t v23 = 108;
      uint64_t v13 = IOConnectCallMethod(v20, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, &v23);
      long long v21 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_key", ":", 1087, "", 0, "", "");
    long long v21 = 0;
  }
  free(v21);
  return v13;
}

uint64_t aks_backup_rewrap_ek(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *outputStruct)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v22 = aks_client_connection;
    size_t v23 = 0;
    uint64_t v15 = 3758097090;
    if (a2 && a4 && outputStruct)
    {
      input[0] = a6;
      input[1] = a7;
      uint64_t input[2] = a8;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v17, v18, v19, v20, v21, a1);
      size_t v25 = 108;
      uint64_t v15 = IOConnectCallMethod(v22, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
      size_t v23 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_ek", ":", 1113, "", 0, "", "");
    size_t v23 = 0;
  }
  free(v23);
  return v15;
}

uint64_t aks_backup_unwrap_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long __s = 0u;
  long long v16 = 0u;
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v8 = decode_backup_bag(a1, a2, v13);
  if (v8)
  {
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = unwrap_backup_bag((uint64_t)v13, a3, a4, (uint64_t)&__s);
    if (!v9)
    {
      long long v10 = v16;
      *a5 = __s;
      a5[1] = v10;
      long long v11 = v18;
      a5[2] = v17;
      a5[3] = v11;
    }
  }
  memset_s(v13, 0x58uLL, 0, 0x58uLL);
  memset_s(&__s, 0x40uLL, 0, 0x40uLL);
  return err_sks_to_aks(v9);
}

uint64_t aks_backup_copy_bag_uuid(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = decode_backup_bag(a1, a2, v6);
  if (!v4) {
    uuid_copy(a3, (const unsigned __int8 *)v6 + 8);
  }
  memset_s(v6, 0x58uLL, 0, 0x58uLL);
  return err_sks_to_aks(v4);
}

uint64_t aks_backup_unwrap_key(long long *a1, void *a2, unsigned int a3, void *a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v6 = a1[1];
  long long v12 = *a1;
  long long v13 = v6;
  long long v7 = a1[3];
  long long v14 = a1[2];
  long long v15 = v7;
  unsigned int v10 = *a5;
  int __s = 1;
  uint64_t v8 = unwrap_data((uint64_t)&__s, 0, 0, a2, a3, a4, &v10);
  *a5 = v10;
  memset_s(&__s, 0x44uLL, 0, 0x44uLL);
  return err_sks_to_aks(v8);
}

uint64_t aks_kc_backup_unwrap_key(uint64_t a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      input[1] = 64;
      return IOConnectCallMethod(aks_client_connection, 0x82u, input, 2u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_unwrap_key", ":", 1193, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_kc_backup_wrap_key(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      return IOConnectCallMethod(aks_client_connection, 0x81u, input, 1u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_wrap_key", ":", 1212, "", 0, "", "");
  }
  return v10;
}

uint64_t aks_kc_backup_get_handle(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0x83u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_handle", ":", 1231, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_kc_backup_get_uuid(int a1, unsigned __int8 *a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t v10 = 0;
      input[0] = a1;
      size_t v8 = 16;
      *(void *)src = 0;
      uint64_t v6 = IOConnectCallMethod(aks_client_connection, 0x84u, input, 1u, 0, 0, 0, 0, src, &v8);
      if (v6)
      {
        return v6;
      }
      else if (v8 == 16)
      {
        uuid_copy(a2, src);
        return 0;
      }
      else
      {
        return 3758604298;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_uuid", ":", 1253, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_kc_backup_open_keybag(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _OWORD *a6)
{
  if (a5)
  {
    int v7 = a4;
    int v9 = a2;
    *a5 = -1;
    int v11 = aks_backup_unwrap_bag((uint64_t)a1, a2, a3, a4, a6);
    long long v12 = (FILE **)MEMORY[0x1E4F143D8];
    long long v13 = (FILE *)*MEMORY[0x1E4F143D8];
    if (!v11)
    {
      fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Unwrapped DER backup bag%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1302, "", 0, "", "");
      uint64_t v17 = 0;
      goto LABEL_9;
    }
    fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unwrap backup bag as DER: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1290, "", 0, "", v11, "");
    uint64_t bag = aks_load_bag(a1, v9, a5);
    if (bag)
    {
      uint64_t v17 = bag;
      fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to load in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1292, "", 0, "", bag, "");
    }
    else
    {
      int is_enabled = aks_prederived_is_enabled();
      int v16 = *a5;
      if (is_enabled)
      {
        uint64_t v17 = aks_prederived_unlock_keybag(v16, a3, v7, 0);
        if (!v17) {
          goto LABEL_9;
        }
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag with prederived secret: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
      else
      {
        uint64_t v17 = aks_unlock_bag(v16, a3, v7);
        if (!v17) {
          goto LABEL_9;
        }
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
    }
  }
  else
  {
    uint64_t v17 = 3758097090;
  }
  if (*a5 != -1)
  {
    aks_unload_bag(*a5);
    *a5 = -1;
  }
LABEL_9:
  aks_prederived_free(0);
  return v17;
}

uint64_t aks_keybag_persona_create(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 3758097084;
  uint64_t v19 = 0;
  int v18 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v15 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    aks_pack_data(&v19, (unsigned int *)&v18, 1, v10, v11, v12, v13, v14, a4);
    if (v19)
    {
      uint64_t v8 = IOConnectCallMethod(v15, 0x60u, input, 3u, v19, v18, 0, 0, 0, 0);
      int v16 = v19;
    }
    else
    {
      int v16 = 0;
      uint64_t v8 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create", ":", 1324, "", 0, "", "");
    int v16 = 0;
  }
  free(v16);
  return v8;
}

uint64_t aks_keybag_persona_create_with_flags(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v17 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a5;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a4);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v10 = IOConnectCallMethod(v17, 0x75u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      int v18 = *(void **)&inputStructCnt[1];
    }
    else
    {
      int v18 = 0;
      uint64_t v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create_with_flags", ":", 1346, "", 0, "", "");
    int v18 = 0;
  }
  free(v18);
  return v10;
}

uint64_t aks_keybag_persona_list()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  bzero(__src, 0x2000uLL);
  size_t __count = 0x2000;
  uint64_t input = v5;
  uint64_t v6 = 3758097090;
  if (v4 && v2)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      uint64_t v8 = IOConnectCallMethod(aks_client_connection, 0x61u, &input, 1u, 0, 0, 0, 0, __src, &__count);
      if (v8)
      {
        uint64_t v6 = v8;
      }
      else
      {
        if (__count)
        {
          int v9 = calloc(__count, 1uLL);
          *uint64_t v4 = v9;
          if (!v9)
          {
            uint64_t v6 = 3758097085;
            goto LABEL_10;
          }
          memcpy(v9, __src, __count);
          size_t v10 = __count;
        }
        else
        {
          size_t v10 = 0;
          *uint64_t v4 = 0;
        }
        uint64_t v6 = 0;
        size_t *v2 = v10;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_list", ":", 1372, "", 0, "", "");
      uint64_t v6 = 3758097084;
    }
  }
LABEL_10:
  memset_s(__src, 0x2000uLL, 0, 0x2000uLL);
  return v6;
}

uint64_t aks_keybag_persona_delete(int a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  uint64_t v15 = 0;
  int v14 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v11 = aks_client_connection;
    input[0] = a1;
    aks_pack_data(&v15, (unsigned int *)&v14, 1, v6, v7, v8, v9, v10, a2);
    if (v15)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x62u, input, 1u, v15, v14, 0, 0, 0, 0);
      uint64_t v12 = v15;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_delete", ":", 1394, "", 0, "", "");
    uint64_t v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_auth_token_create(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v12 = 3758097090;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      uint64_t input[2] = a2;
      uint64_t input[3] = a3;
      return IOConnectCallMethod(aks_client_connection, 0x26u, input, 4u, 0, 0, 0, 0, a5, a6);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_auth_token_create", ":", 1415, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_set_configuration(int a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  rsize_t __n = 0;
  int __s = 0;
  uint64_t v7 = 3758097090;
  uint64_t v20 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v9 = aks_client_connection;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (!_copy_cf_key(a4, @"GracePeriod", TypeID, (uint64_t)der_key_config_graceperiod, &v20))
    {
      CFTypeID v11 = CFNumberGetTypeID();
      if (!_copy_cf_key(a4, @"BackOffDelay", v11, (uint64_t)der_key_config_backoff_delay, &v20))
      {
        CFTypeID v12 = CFNumberGetTypeID();
        if (!_copy_cf_key(a4, @"MaxUnlockAttempts", v12, (uint64_t)der_key_config_max_unlock_attempts, &v20))
        {
          CFTypeID v13 = CFNumberGetTypeID();
          if (!_copy_cf_key(a4, @"EscrowPasscodePeriod", v13, (uint64_t)der_key_config_escrow_passcode_period, &v20))
          {
            CFTypeID v14 = CFNumberGetTypeID();
            if (!_copy_cf_key(a4, @"EscrowTokenPeriod", v14, (uint64_t)der_key_config_escrow_token_period, &v20))
            {
              CFTypeID v15 = CFDataGetTypeID();
              if (!_copy_cf_key(a4, @"UserUUID", v15, (uint64_t)der_key_config_user_uuid, &v20))
              {
                CFTypeID v16 = CFDataGetTypeID();
                if (!_copy_cf_key(a4, @"BindKEKToKB", v16, (uint64_t)der_key_config_bind_kek, &v20))
                {
                  CFTypeID v17 = CFBooleanGetTypeID();
                  if (!_copy_cf_key(a4, @"InactivityRebootEnabled", v17, (uint64_t)der_key_inactivity_reboot_enabled, &v20))
                  {
                    CFTypeID v18 = CFBooleanGetTypeID();
                    if (!_copy_cf_key(a4, @"OnenessAutomaticMode", v18, (uint64_t)der_key_oneness_automatic_mode, &v20)&& !encode_list_is_empty(&v20)&& (!a2 || !encode_list_add_data(&v20, (uint64_t)der_key_passcode, a2))&& !encode_list_dict(&v20, &__s, &__n))
                    {
                      input[0] = a1;
                      input[1] = (uint64_t)__s;
                      uint64_t input[2] = __n;
                      uint64_t v7 = IOConnectCallMethod(v9, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
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
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_configuration", ":", 1488, "", 0, "", "");
    uint64_t v7 = 3758097084;
  }
  encode_list_free(&v20);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t _copy_cf_key(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  value = 0;
  uint64_t result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if (result)
  {
    if (CFGetTypeID(value) == a3)
    {
      if (CFNumberGetTypeID() == a3)
      {
        uint64_t v10 = 0;
        if (!CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v10)
          || encode_list_add_number(a5, a4, v10))
        {
          return 0xFFFFFFFFLL;
        }
        return 0;
      }
      if (CFBooleanGetTypeID() == a3)
      {
        CFBooleanGetValue((CFBooleanRef)value);
        if (encode_list_add_BOOL(a5, a4)) {
          return 0xFFFFFFFFLL;
        }
      }
      else
      {
        if (CFDataGetTypeID() != a3) {
          return 0xFFFFFFFFLL;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)value);
        CFDataGetLength((CFDataRef)value);
        if (encode_list_add_data(a5, a4, (uint64_t)BytePtr)) {
          return 0xFFFFFFFFLL;
        }
      }
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t aks_get_configuration()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  int v3 = v0;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v2)
    {
      mach_port_t v6 = aks_client_connection;
      bzero(outputStruct, 0x8000uLL);
      v46[0] = 0x8000;
      uint64_t input = v3;
      uint64_t v7 = IOConnectCallMethod(v6, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v46);
      if (v7)
      {
        return v7;
      }
      else if (v46[0] > 0x8000)
      {
        return 3758604298;
      }
      else
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        bzero(v47, 0x250uLL);
        v46[1] = (size_t)der_key_config_graceperiod;
        v47[4] = der_key_config_backoff_delay;
        v47[9] = der_key_config_max_unlock_attempts;
        v47[14] = der_key_config_escrow_passcode_period;
        v47[19] = der_key_config_escrow_token_period;
        v47[24] = der_key_config_flags;
        v47[29] = der_key_config_user_uuid;
        v47[34] = der_key_config_group_uuid;
        v47[39] = der_key_config_recovery_iterations;
        v47[44] = der_key_config_recovery_flags;
        v47[49] = der_key_config_recovery_target_iterations;
        v47[54] = der_key_memento_supported;
        v47[59] = der_key_memento_blob_exists;
        v47[64] = der_key_config_memento_passcode_generation;
        v47[69] = der_key_config_passcode_generation;
        der_dict_iterate();
        uint64_t v9 = v47[0];
        uint64_t v10 = v47[5];
        uint64_t v11 = v47[10];
        uint64_t v12 = v47[15];
        uint64_t v13 = v47[20];
        uint64_t v14 = v47[25];
        uint64_t v15 = v47[30];
        uint64_t v45 = v2;
        uint64_t v16 = v47[35];
        uint64_t v38 = v47[40];
        uint64_t v39 = v47[45];
        uint64_t v40 = v47[50];
        uint64_t v41 = v47[55];
        uint64_t v42 = v47[60];
        uint64_t v43 = v47[65];
        uint64_t v44 = v47[70];
        CFTypeID TypeID = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"GracePeriod", TypeID, v9);
        CFTypeID v18 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"BackOffDelay", v18, v10);
        CFTypeID v19 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"MaxUnlockAttempts", v19, v11);
        CFTypeID v20 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"EscrowPasscodePeriod", v20, v12);
        CFTypeID v21 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"EscrowTokenPeriod", v21, v13);
        CFTypeID v22 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"ConfigFlags", v22, v14);
        CFTypeID v23 = CFDataGetTypeID();
        _set_cf_key(Mutable, @"UserUUID", v23, v15);
        CFTypeID v24 = CFDataGetTypeID();
        _set_cf_key(Mutable, @"GroupUUID", v24, v16);
        CFTypeID v25 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"RecoveryIterations", v25, v38);
        CFTypeID v26 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"RecoveryFlags", v26, v39);
        CFTypeID v27 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"RecoveryTargetIterations", v27, v40);
        CFTypeID v28 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, @"MementoSupported", v28, v41);
        CFTypeID v29 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, @"MementoBlobExists", v29, v42);
        CFTypeID v30 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"MementoPasscodeGeneration", v30, v43);
        CFTypeID v31 = CFNumberGetTypeID();
        _set_cf_key(Mutable, @"PasscodeGeneration", v31, v44);
        char number = der_get_number();
        id v33 = (const void *)*MEMORY[0x1E4F1CFC8];
        uint64_t v34 = (const void *)*MEMORY[0x1E4F1CFD0];
        if ((number & 2) != 0) {
          uint64_t v35 = (const void *)*MEMORY[0x1E4F1CFD0];
        }
        else {
          uint64_t v35 = (const void *)*MEMORY[0x1E4F1CFC8];
        }
        CFDictionarySetValue(Mutable, @"InactivityRebootEnabled", v35);
        if ((number & 8) != 0) {
          uint64_t v36 = v34;
        }
        else {
          uint64_t v36 = v33;
        }
        CFDictionarySetValue(Mutable, @"OnenessAutomaticMode", v36);
        uint64_t v4 = 0;
        void *v45 = Mutable;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_configuration", ":", 1556, "", 0, "", "");
  }
  return v4;
}

void _set_cf_key(__CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    if (CFNumberGetTypeID() == a3)
    {
      CFIndex valuePtr = der_get_number();
      CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
      if (!v7) {
        return;
      }
LABEL_14:
      CFNumberRef v12 = v7;
      CFDictionaryAddValue(a1, a2, v7);
      CFRelease(v12);
      return;
    }
    if (CFBooleanGetTypeID() == a3)
    {
      int v8 = der_get_BOOL();
      uint64_t v9 = (const void **)MEMORY[0x1E4F1CFD0];
      if (!v8) {
        uint64_t v9 = (const void **)MEMORY[0x1E4F1CFC8];
      }
      uint64_t v10 = *v9;
      CFDictionaryAddValue(a1, a2, v10);
    }
    else if (CFDataGetTypeID() == a3)
    {
      CFIndex valuePtr = 0;
      uint64_t v11 = (const UInt8 *)ccder_decode_tl();
      if (v11)
      {
        CFNumberRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, valuePtr);
        goto LABEL_14;
      }
    }
  }
}

uint64_t aks_assert_hold(int a1, unsigned int a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Au, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_hold", ":", 1654, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_drop(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = a2;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Bu, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_drop", ":", 1672, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_promote(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a2;
    input[1] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x64u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_promote", ":", 1687, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_oneness_heartbeat(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x91u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_oneness_heartbeat", ":", 1707, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_consume(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x65u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_consume", ":", 1722, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_recover_with_escrow_bag(int a1, uint64_t a2)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  int v14 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v10 = aks_client_connection;
    aks_pack_data((char **)&v15, (unsigned int *)&v14, 3, v5, v6, v7, v8, v9, a2);
    input[0] = a1;
    input[1] = (uint64_t)v15;
    uint64_t input[2] = v14;
    uint64_t v11 = IOConnectCallMethod(v10, 0x12u, input, 3u, 0, 0, 0, 0, 0, 0);
    CFNumberRef v12 = v15;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_recover_with_escrow_bag", ":", 1739, "", 0, "", "");
    CFNumberRef v12 = 0;
    uint64_t v11 = 3758097084;
  }
  free(v12);
  return v11;
}

uint64_t aks_fdr_hmac_data()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  uint64_t v7 = (const void *)v0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 3758097090;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v7 && v4 && v2)
    {
      uint64_t v10 = IOConnectCallMethod(aks_client_connection, 0x29u, 0, 0, v7, v6, 0, 0, __src, &__count);
      if (v10)
      {
        uint64_t v8 = v10;
      }
      else
      {
        uint64_t v11 = calloc(__count, 1uLL);
        *uint64_t v4 = v11;
        if (v11)
        {
          memcpy(v11, __src, __count);
          uint64_t v8 = 0;
          _DWORD *v2 = __count;
        }
        else
        {
          uint64_t v8 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fdr_hmac_data", ":", 1758, "", 0, "", "");
    uint64_t v8 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v8;
}

uint64_t aks_generation(int a1, unsigned int a2, _DWORD *a3)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0x28u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (a3)
    {
      if (!result) {
        *a3 = output;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_generation", ":", 1781, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t _aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 3758097084;
  CFTypeID v21 = 0;
  int v20 = 0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v16 = aks_client_connection;
    if (a2) {
      CFTypeID v17 = a2;
    }
    else {
      CFTypeID v17 = "";
    }
    aks_pack_data((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      uint64_t input[2] = (uint64_t)v21;
      uint64_t input[3] = v20;
      uint64_t v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      CFTypeID v18 = v21;
    }
    else
    {
      CFTypeID v18 = 0;
      uint64_t v9 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    CFTypeID v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 0);
}

uint64_t aks_verify_password_memento(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 1u);
}

uint64_t aks_register_for_notifications()
{
  if (get_aks_client_connection())
  {
    JUMPOUT(0x1A6232090);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_register_for_notifications", ":", 1840, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_create_signing_key(int a1, int a2, void *a3, size_t *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  size_t __count = 256;
  input[0] = a1;
  input[1] = a2;
  uint64_t result = 3758097090;
  if (a3 && a4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      memset(__src, 0, sizeof(__src));
      uint64_t result = IOConnectCallMethod(aks_client_connection, 0x31u, input, 2u, 0, 0, 0, 0, __src, &__count);
      if (!result)
      {
        if (__count > 0x100)
        {
          return 3758604298;
        }
        else
        {
          uint64_t v8 = calloc(__count, 1uLL);
          *a3 = v8;
          if (v8)
          {
            memcpy(v8, __src, __count);
            uint64_t result = 0;
            *a4 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key", ":", 1859, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_create_signing_key_with_params()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  size_t __count = 0x8000;
  input[0] = v0;
  input[1] = v5;
  uint64_t result = 3758097090;
  if (v3)
  {
    uint64_t v7 = v4;
    if (v4)
    {
      uint64_t v8 = v3;
      size_t v9 = v2;
      uint64_t v10 = v1;
      mach_port_t aks_client_connection = get_aks_client_connection();
      if (aks_client_connection)
      {
        mach_port_t v12 = aks_client_connection;
        bzero(__src, 0x8000uLL);
        uint64_t result = IOConnectCallMethod(v12, 0x31u, input, 2u, v10, v9, 0, 0, __src, &__count);
        if (!result)
        {
          if (__count > 0x8000)
          {
            return 3758604298;
          }
          else
          {
            uint64_t v13 = calloc(__count, 1uLL);
            void *v8 = v13;
            if (v13)
            {
              memcpy(v13, __src, __count);
              uint64_t result = 0;
              *uint64_t v7 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key_with_params", ":", 1881, "", 0, "", "");
        return 3758097084;
      }
    }
  }
  return result;
}

uint64_t aks_obliterate_signing_keys()
{
  return remote_session_operate();
}

uint64_t remote_session_operate()
{
  int v0 = MEMORY[0x1F4188790]();
  size_t v2 = v1;
  uint64_t v4 = v3;
  uint32_t v6 = v5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  size_t __count = 15360;
  input[0] = v0;
  input[1] = v7;
  uint64_t input[2] = v8;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v10 = aks_client_connection;
    bzero(__src, 0x3C00uLL);
    uint64_t v11 = IOConnectCallMethod(v10, v6, input, 3u, 0, 0, 0, 0, __src, &__count);
    if (v11)
    {
      return v11;
    }
    else if (__count > 0x3C00)
    {
      return 3758604298;
    }
    else
    {
      uint64_t v12 = 0;
      if (v4 && v2)
      {
        if (__count)
        {
          uint64_t v13 = calloc(__count, 1uLL);
          *uint64_t v4 = v13;
          if (!v13) {
            return 3758097085;
          }
          memcpy(v13, __src, __count);
          size_t v14 = __count;
        }
        else
        {
          size_t v14 = 0;
        }
        uint64_t v12 = 0;
        size_t *v2 = v14;
      }
    }
  }
  else
  {
    uint64_t v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "remote_session_operate", ":", 2017, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_sign_signing_key(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, void *a8, size_t *a9)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(__src, 0, sizeof(__src));
  size_t __count = 256;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  input[0] = a1;
  input[1] = a2;
  uint64_t v9 = 3758097090;
  uint64_t input[2] = a5;
  if (a8 && a9)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v18 = aks_client_connection;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v13, v14, v15, v16, v17, a3);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v19 = IOConnectCallMethod(v18, 0x32u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if (v19)
        {
          uint64_t v9 = v19;
        }
        else if (__count > 0x100)
        {
          uint64_t v9 = 3758604298;
        }
        else
        {
          int v20 = calloc(__count, 1uLL);
          *a8 = v20;
          uint64_t v9 = 3758097085;
          if (v20)
          {
            memcpy(v20, __src, __count);
            uint64_t v9 = 0;
            *a9 = __count;
          }
        }
      }
      else
      {
        uint64_t v9 = 3758097085;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sign_signing_key", ":", 1911, "", 0, "", "");
      uint64_t v9 = 3758097084;
    }
  }
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_remote_session(int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 3758097084;
  input[0] = a2;
  input[1] = a1;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v17 = aks_client_connection;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a3);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v18 = IOConnectCallMethod(v17, 0x2Cu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, 0, 0);
      uint64_t v10 = v18;
      if (a9 && !v18) {
        *a9 = output;
      }
    }
    else
    {
      uint64_t v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_session", ":", 1938, "", 0, "", "");
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t aks_validate_local_key(int a1, int a2, uint64_t a3, uint64_t a4)
{
  mach_port_t v17 = 0;
  int __s = 0;
  uint64_t v4 = 3758097084;
  rsize_t __n = 0;
  uint64_t v16 = 0;
  uint64_t v5 = 3758097090;
  rsize_t __smax = 0;
  if (!a3 || !a4) {
    goto LABEL_12;
  }
  int v8 = -536870212;
  *(void *)&long long v19 = a3;
  *((void *)&v19 + 1) = a3 + a4;
  if (!(a3 + a4)) {
    goto LABEL_19;
  }
  uint64_t v16 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    int v8 = -536870198;
LABEL_19:
    syslog(3, "error parsing signing key: %d", v8);
    uint64_t v5 = 3758097084;
LABEL_12:
    uint64_t v12 = __s;
    uint64_t v4 = v5;
    goto LABEL_13;
  }
  der_utils_decode_implicit_uint64(&v19, 0x8000000000000001, &v16);
  if (v16)
  {
    uint64_t v5 = remote_session_operate();
    if (v5) {
      syslog(3, "error: validating v1 local signing key failed: %d");
    }
    goto LABEL_12;
  }
  uint64_t v11 = aks_create_signing_key(a1, 11, &__s, &__n);
  if (v11)
  {
    uint64_t v5 = v11;
    syslog(3, "error: validating (create) v0 local signing key failed: %d", v11);
    goto LABEL_12;
  }
  uint64_t v12 = __s;
  if (__s && __n)
  {
    uint64_t v5 = aks_sign_signing_key(a1, a2, a3, a4, 11, (uint64_t)__s, __n, &v17, &__smax);
    if (v5) {
      syslog(3, "error: validating (sign) v0 local signing key failed: %d");
    }
    goto LABEL_12;
  }
LABEL_13:
  if (v12)
  {
    memset_s(v12, __n, 0, __n);
    free(__s);
  }
  if (v17)
  {
    memset_s(v17, __smax, 0, __smax);
    free(v17);
  }
  return v4;
}

uint64_t aks_remote_session_step()
{
  return remote_session_operate();
}

uint64_t aks_remote_peer_setup()
{
  return remote_session_operate();
}

uint64_t aks_remote_peer_setup_with_acm()
{
  return remote_session_operate();
}

uint64_t aks_remote_peer_confirm()
{
  return remote_session_operate();
}

uint64_t aks_remote_session_token()
{
  return remote_session_operate();
}

uint64_t aks_drain_backup_keys()
{
  int v0 = MEMORY[0x1F4188790]();
  size_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v7 = aks_client_connection;
    uint64_t result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        input[0] = v5;
        input[1] = 0;
        uint64_t result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          if (__count)
          {
            uint64_t v9 = calloc(__count, 1uLL);
            *uint64_t v4 = v9;
            if (v9)
            {
              memcpy(v9, __src, __count);
              uint64_t result = 0;
              _DWORD *v2 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys", ":", 2072, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_drain_backup_keys_info()
{
  int v0 = MEMORY[0x1F4188790]();
  size_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v7 = aks_client_connection;
    uint64_t result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        input[0] = v5;
        input[1] = 1;
        uint64_t result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          if (__count)
          {
            if (__ROR8__(0xEF7BDEF7BDEF7BDFLL * __count, 2) > 0x210842108421084uLL)
            {
              return 3758604298;
            }
            else
            {
              uint64_t v9 = calloc(__count, 1uLL);
              *uint64_t v4 = v9;
              if (v9)
              {
                memcpy(v9, __src, __count);
                uint64_t result = 0;
                size_t *v2 = __count / 0x7C;
              }
              else
              {
                return 3758097085;
              }
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys_info", ":", 2100, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_clear_backup_bag(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x16u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_clear_backup_bag", ":", 2129, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_set_backup_bag()
{
  int v0 = MEMORY[0x1F4188790]();
  size_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  uint64_t v8 = v7;
  int v10 = v9;
  int v11 = v0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_backup_bag", ":", 2146, "", 0, "", "");
    return 3758097084;
  }
  mach_port_t v13 = aks_client_connection;
  if (v4)
  {
    if (!v2) {
      return 3758097090;
    }
    long long outputStruct = __src;
    p_count = &__count;
    uint64_t v16 = 1;
  }
  else
  {
    p_count = 0;
    long long outputStruct = 0;
    uint64_t v16 = 0;
  }
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  input[0] = v11;
  input[1] = v10;
  uint64_t input[2] = v16;
  uint64_t input[3] = v8;
  uint64_t input[4] = v6;
  uint64_t result = IOConnectCallMethod(v13, 0x15u, input, 5u, 0, 0, 0, 0, outputStruct, p_count);
  if (v4 && !result)
  {
    uint64_t v18 = calloc(__count, 1uLL);
    *uint64_t v4 = v18;
    if (v18)
    {
      memcpy(v18, __src, __count);
      uint64_t result = 0;
      _DWORD *v2 = __count;
    }
    else
    {
      return 3758097085;
    }
  }
  return result;
}

uint64_t aks_make_public_backup_bag(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      uint64_t output = 0;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0x52u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_make_public_backup_bag", ":", 2178, "", 0, "", "");
  }
  return v4;
}

uint64_t aks_remote_session_reset()
{
  return remote_session_operate();
}

uint64_t aks_remote_session_reset_all()
{
  return remote_session_operate();
}

uint64_t aks_get_device_state()
{
  return _get_device_state();
}

uint64_t _get_device_state()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint32_t v4 = v3;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = v0;
  *(void *)uint64_t v12 = 4096;
  uint64_t v5 = 3758097084;
  int v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long __s = 0u;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v2)
    {
      mach_port_t v7 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      uint64_t v8 = IOConnectCallMethod(v7, v4, input, 1u, 0, 0, 0, 0, outputStruct, (size_t *)v12);
      if (v8)
      {
        return v8;
      }
      else
      {
        uint64_t v5 = 0;
        if (!decode_extended_state((uint64_t)outputStruct, v12[0], (char *)&__s))
        {
          long long v9 = v16;
          *(_OWORD *)(v2 + 32) = v15;
          *(_OWORD *)(v2 + 48) = v9;
          *(_WORD *)(v2 + 64) = v17;
          long long v10 = v14;
          *(_OWORD *)uint64_t v2 = __s;
          *(_OWORD *)(v2 + 16) = v10;
        }
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_device_state", ":", 2224, "", 0, "", "");
  }
  return v5;
}

uint64_t aks_get_extended_device_state()
{
  return _get_device_state();
}

uint64_t aks_remote_peer_get_state()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  size_t v4 = v3;
  int v6 = v5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 3758097084;
  v12[0] = 4096;
  uint64_t input = v0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v2)
    {
      mach_port_t v9 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      memset_s(v2, 0x10uLL, 0, 0x10uLL);
      uint64_t v10 = IOConnectCallMethod(v9, 0x39u, &input, 1u, v6, v4, 0, 0, outputStruct, v12);
      if (v10)
      {
        return v10;
      }
      else
      {
        uint64_t v17 = 0;
        long long v21 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v16 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v22 = 0u;
        uint64_t v23 = 0;
        v12[1] = (size_t)der_key_peer_unlock_token_status;
        long long v15 = (unint64_t)der_key_peer_unwrapped_escrow_record_status;
        int v18 = der_key_peer_wrapped_escrow_record_status;
        *(void *)&long long v21 = der_key_peer_flags;
        der_dict_iterate();
        _DWORD *v2 = der_get_number();
        v2[1] = der_get_number();
        void v2[2] = der_get_number();
        uint64_t v7 = 0;
        void v2[3] = der_get_number();
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_get_state", ":", 2255, "", 0, "", "");
  }
  return v7;
}

uint64_t aks_remote_peer_drop(int a1, const void *a2, size_t a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x3Au, input, 1u, a2, a3, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_drop", ":", 2292, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lock_device(int a1, int a2)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2) {
      uint32_t v4 = 32;
    }
    else {
      uint32_t v4 = 8;
    }
    return IOConnectCallMethod(aks_client_connection, v4, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_device", ":", 2307, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_lock_cx(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x8Du, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_cx", ":", 2327, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_unlock_device(int a1, uint64_t a2, int a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 9u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_device", ":", 2342, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_obliterate_class_d()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x13u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_obliterate_class_d", ":", 2355, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_migrate_s_key(int a1, unsigned int a2, uint64_t a3, unsigned int a4, const void *a5, int a6)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 0x3Fu, input, 4u, a5, a6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_migrate_s_key", ":", 2367, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_smartcard_register(int a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, size_t a6, void *a7, size_t *a8)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  input[1] = a4;
  uint64_t input[2] = a2;
  uint64_t input[3] = a3;
  size_t __count = 2048;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v13 = aks_client_connection;
    bzero(__src, 0x800uLL);
    uint64_t v14 = IOConnectCallMethod(v13, 0x3Bu, input, 4u, a5, a6, 0, 0, __src, &__count);
    if (v14)
    {
      return v14;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      uint64_t v15 = 0;
      if (a7 && a8)
      {
        if (__count)
        {
          long long v16 = calloc(__count, 1uLL);
          *a7 = v16;
          if (!v16) {
            return 3758097085;
          }
          memcpy(v16, __src, __count);
          size_t v17 = __count;
        }
        else
        {
          size_t v17 = 0;
        }
        uint64_t v15 = 0;
        *a8 = v17;
      }
    }
  }
  else
  {
    uint64_t v15 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_register", ":", 2388, "", 0, "", "");
  }
  return v15;
}

uint64_t aks_smartcard_unregister(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x3Cu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unregister", ":", 2412, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_smartcard_request_unlock(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  size_t __count = 2048;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v10 = aks_client_connection;
    bzero(__src, 0x800uLL);
    uint64_t v11 = IOConnectCallMethod(v10, 0x3Du, input, 1u, a2, a3, 0, 0, __src, &__count);
    if (v11)
    {
      return v11;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      uint64_t v12 = 0;
      if (a4 && a5)
      {
        if (__count)
        {
          mach_port_t v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (!v13) {
            return 3758097085;
          }
          memcpy(v13, __src, __count);
          size_t v14 = __count;
        }
        else
        {
          size_t v14 = 0;
        }
        uint64_t v12 = 0;
        *a5 = v14;
      }
    }
  }
  else
  {
    uint64_t v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_request_unlock", ":", 2429, "", 0, "", "");
  }
  return v12;
}

uint64_t aks_smartcard_unlock(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x800uLL);
  size_t __count = 2048;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  if (!*(void *)&inputStructCnt[1])
  {
    uint64_t v17 = 3758097085;
    goto LABEL_12;
  }
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unlock", ":", 2460, "", 0, "", "");
    uint64_t v17 = 3758097084;
    goto LABEL_12;
  }
  uint64_t v16 = IOConnectCallMethod(aks_client_connection, 0x3Eu, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
  if (v16)
  {
    uint64_t v17 = v16;
    goto LABEL_12;
  }
  if (__count > 0x800)
  {
    uint64_t v17 = 3758604298;
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  if (a6 && a7)
  {
    if (!__count)
    {
      size_t v19 = 0;
      goto LABEL_11;
    }
    int v18 = calloc(__count, 1uLL);
    *a6 = v18;
    uint64_t v17 = 3758097085;
    if (v18)
    {
      memcpy(v18, __src, __count);
      size_t v19 = __count;
LABEL_11:
      uint64_t v17 = 0;
      *a7 = v19;
    }
  }
LABEL_12:
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t aks_smartcard_get_sc_usk(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_enc_sc_usk, 0, a1, a2, a3, a4)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t aks_smartcard_get_foo(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a6 && a3 && a4 && a5 && a3 + a4 > a3)
  {
    der_dict_iterate();
    if (a2)
    {
      if (*a6 == 8)
      {
        uint64_t number = der_get_number();
        uint64_t result = 0;
        *a5 = number;
        return result;
      }
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = ccder_decode_tl();
    if (!v11) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v12 = v11;
    uint64_t result = 0;
    *a5 = v12;
    *a6 = 0;
  }
  return result;
}

uint64_t aks_smartcard_get_ec_pub(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_auth_eph_pub, 0, a1, a2, a3, a4)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t aks_smartcard_get_mode(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  uint64_t result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_mode, 1, a1, a2, &v6, &v5);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t aks_smartcard_get_version(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  uint64_t result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_version, 1, a1, a2, &v6, &v5);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t aks_se_fail(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x47u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_fail", ":", 2589, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_healthy(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x49u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_healthy", ":", 2605, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_secret(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x45u);
}

uint64_t __aks_se_set_secret(int a1, uint64_t a2, uint64_t a3, uint32_t a4)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, a4, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "__aks_se_set_secret", ":", 2621, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_set_secret_memento(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x8Cu);
}

uint64_t aks_se_recover(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x46u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_recover", ":", 2649, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_change_secret_epilogue(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x69u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_epilogue", ":", 2665, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_get_reset_token_for_memento_secret()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = v0;
  input[1] = v3;
  uint64_t input[2] = v4;
  bzero(__s, 0x1000uLL);
  __n[0] = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    uint64_t v8 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_token_for_memento_secret", ":", 2683, "", 0, "", "");
    goto LABEL_10;
  }
  uint64_t v6 = IOConnectCallMethod(aks_client_connection, 0x48u, input, 3u, 0, 0, 0, 0, __s, __n);
  if (v6)
  {
    uint64_t v8 = v6;
    goto LABEL_10;
  }
  if (__n[0] - 4097 < 0xFFFFFFFFFFFFF000)
  {
    uint64_t v8 = 3758604298;
    goto LABEL_10;
  }
  uint64_t v15 = 0;
  long long v14 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  __n[1] = (rsize_t)der_key_config_se_reset_token;
  long long v13 = (unint64_t)der_key_config_se_slot;
  der_dict_iterate();
  if ((void)v11)
  {
    ccder_decode_tl();
LABEL_9:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  if (!*((void *)&v13 + 1)) {
    goto LABEL_9;
  }
  unint64_t number = der_get_number();
  if (number > 0xFF) {
    goto LABEL_9;
  }
  uint64_t v8 = 0;
  unsigned char *v2 = number;
LABEL_10:
  memset_s(__s, __n[0], 0, __n[0]);
  return v8;
}

uint64_t aks_se_get_reset_token()
{
  return aks_se_get_reset_token_for_memento_secret();
}

uint64_t aks_se_set_nonce(int a1, const void *a2, size_t a3)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2) {
      size_t v6 = a3;
    }
    else {
      size_t v6 = 0;
    }
    return IOConnectCallMethod(aks_client_connection, 0x58u, input, 1u, a2, v6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_nonce", ":", 2737, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_se_get_reset_sig()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  size_t v6 = v5;
  uint64_t v8 = v7;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = v0;
  bzero(&__s, 0x1000uLL);
  size_t __n = 4096;
  uint64_t v9 = 3758097090;
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = 3758097090;
      if (v4)
      {
        if (v2)
        {
          mach_port_t aks_client_connection = get_aks_client_connection();
          if (aks_client_connection)
          {
            uint64_t v11 = IOConnectCallMethod(aks_client_connection, 0x5Au, input, 1u, 0, 0, 0, 0, &__s, &__n);
            if (v11)
            {
              uint64_t v9 = v11;
            }
            else if (__n - 4097 < 0xFFFFFFFFFFFFF005)
            {
              uint64_t v9 = 3758604298;
            }
            else
            {
              long long v12 = calloc(5uLL, 1uLL);
              *uint64_t v4 = v12;
              if (v12)
              {
                void *v2 = 5;
                int v13 = __s;
                v12[4] = v19;
                *(_DWORD *)long long v12 = v13;
                long long v14 = calloc(__n - 5, 1uLL);
                void *v8 = v14;
                uint64_t v9 = 3758097085;
                if (v14)
                {
                  size_t v15 = __n;
                  *size_t v6 = __n - 5;
                  memcpy(v14, v20, v15);
                  uint64_t v9 = 0;
                }
              }
              else
              {
                uint64_t v9 = 3758097085;
              }
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_sig", ":", 2759, "", 0, "", "");
            uint64_t v9 = 3758097084;
          }
        }
      }
    }
  }
  memset_s(&__s, __n, 0, __n);
  return v9;
}

uint64_t aks_se_get_reset_pubkey()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = v0;
  size_t v5 = 4096;
  bzero(__src, 0x1000uLL);
  size_t __count = 4096;
  uint64_t v6 = 3758097090;
  if (v4 && v2)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      uint64_t v8 = IOConnectCallMethod(aks_client_connection, 0x59u, input, 1u, 0, 0, 0, 0, __src, &__count);
      size_t v5 = __count;
      if (v8)
      {
        uint64_t v6 = v8;
      }
      else if (__count - 4097 < 0xFFFFFFFFFFFFF000)
      {
        uint64_t v6 = 3758604298;
      }
      else
      {
        uint64_t v9 = calloc(__count, 1uLL);
        *uint64_t v4 = v9;
        size_t v5 = __count;
        if (v9)
        {
          size_t *v2 = __count;
          memcpy(v9, __src, v5);
          uint64_t v6 = 0;
          size_t v5 = __count;
        }
        else
        {
          uint64_t v6 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_pubkey", ":", 2791, "", 0, "", "");
      size_t v5 = 4096;
      uint64_t v6 = 3758097084;
    }
  }
  memset_s(__src, v5, 0, v5);
  return v6;
}

uint64_t aks_se_delete_reset_token(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Bu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_delete_reset_token", ":", 2815, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_support_in_rm(unsigned int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Eu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm", ":", 2832, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_support_in_rm_is_set(BOOL *a1)
{
  output[1] = *MEMORY[0x1E4F143B8];
  output[0] = 0;
  uint32_t outputCnt = 1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t result = IOConnectCallMethod(aks_client_connection, 0x6Bu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
    if (a1)
    {
      if (!result) {
        *a1 = output[0] != 0;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm_is_set", ":", 2848, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_se_stage_stash()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Fu, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_stage_stash", ":", 2865, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_fv_lock_volume_bag()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_unwrap_vek()
{
  return aks_fv_unwrap_vek_with_acm();
}

uint64_t aks_fv_get_blob_state()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x1000uLL);
  *(void *)&long long v11 = __s;
  *((void *)&v11 + 1) = &v14;
  *(void *)long long v12 = 4096;
  uint64_t v6 = 3758097090;
  if (v4 && v2)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v8 = aks_client_connection;
      if (der_utils_encode_fv_data(&v11, v4) && der_utils_encode_fv_params(&v11, v5))
      {
        uint64_t v6 = 3758097098;
        if (ccder_blob_encode_tl())
        {
          uint64_t v9 = IOConnectCallMethod(v8, 0x55u, 0, 0, *((const void **)&v11 + 1), (size_t)&v14 - *((void *)&v11 + 1), 0, 0, __s, (size_t *)v12);
          if (!v9) {
            uint64_t v9 = decode_fv_blob_state((uint64_t)__s, *(uint64_t *)v12, v2);
          }
          uint64_t v6 = v9;
        }
      }
      else
      {
        uint64_t v6 = 3758097098;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_blob_state", ":", 2900, "", 0, "", "");
      uint64_t v6 = 3758097084;
    }
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v6;
}

uint64_t aks_fv_get_last_known_gp_state()
{
  return aks_fv_get_blob_state();
}

uint64_t aks_fv_get_size()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097098;
  uint64_t output = 0;
  input[0] = v5;
  uint32_t outputCnt = 1;
  bzero(__s, 0x1000uLL);
  *(void *)&long long v9 = __s;
  *((void *)&v9 + 1) = &output;
  if (v2)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v7 = aks_client_connection;
      if (der_utils_encode_fv_params(&v9, v3))
      {
        if (ccder_blob_encode_tl())
        {
          uint64_t v4 = IOConnectCallMethod(v7, 0x4Eu, input, 1u, *((const void **)&v9 + 1), (size_t)&input[-1] - *((void *)&v9 + 1), &output, &outputCnt, 0, 0);
          if (!v4) {
            uint64_t *v2 = output;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_size", ":", 2943, "", 0, "", "");
      uint64_t v4 = 3758097084;
    }
  }
  else
  {
    uint64_t v4 = 3758097090;
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v4;
}

uint64_t aks_fv_import()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = v8;
  bzero(__s, 0x1000uLL);
  *(void *)&long long v15 = __s;
  *((void *)&v15 + 1) = input;
  size_t v16 = 4096;
  uint64_t v9 = 3758097090;
  if (v6 && v4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_import", ":", 2971, "", 0, "", "");
      uint64_t v9 = 3758097084;
      goto LABEL_14;
    }
    mach_port_t v11 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v15, v6)
      || !der_utils_encode_fv_params(&v15, v7)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_12;
    }
    uint64_t v12 = IOConnectCallMethod(v11, 0x4Fu, input, 1u, *((const void **)&v15 + 1), (size_t)input - *((void *)&v15 + 1), 0, 0, __s, &v16);
    if (v12)
    {
      uint64_t v9 = v12;
      goto LABEL_14;
    }
    *(void *)&long long v14 = __s;
    *((void *)&v14 + 1) = &__s[v16];
    if (!ccder_blob_decode_range()) {
      goto LABEL_12;
    }
    if (!v2)
    {
      uint64_t v9 = 0;
      goto LABEL_14;
    }
    uint64_t v9 = 0;
    if ((der_utils_decode_fv_data(&v14, 0, v2) & 1) == 0) {
LABEL_12:
    }
      uint64_t v9 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v9;
}

uint64_t aks_fv_get_verifier_size()
{
  return aks_fv_get_size();
}

uint64_t aks_fv_get_access_token_size()
{
  return aks_fv_get_size();
}

uint64_t aks_fv_new_verifier()
{
  return aks_fv_new_kek();
}

uint64_t aks_fv_rewrap_verifier()
{
  return aks_fv_rewrap_kek();
}

uint64_t aks_fv_new_access_token()
{
  return aks_fv_new_vek();
}

uint64_t aks_fv_new_unbound_access_token()
{
  return aks_fv_new_vek();
}

uint64_t aks_fv_bind_access_token()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_is_access_token_unbound(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 3758097090;
  }
  uint64_t result = aks_fv_get_blob_state();
  if (!result) {
    return 3758604312;
  }
  return result;
}

uint64_t aks_fv_load_access_token_as_system_keychain()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_verify_user_opts()
{
  return aks_fv_unwrap_vek_with_acm();
}

uint64_t aks_fv_grant_ownership()
{
  MEMORY[0x1F4188790]();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 3758097098;
  bzero(v13, 0x1000uLL);
  bzero(v12, 0x1000uLL);
  *(void *)&long long v11 = v13;
  *((void *)&v11 + 1) = &v14;
  *(void *)&long long v10 = v12;
  *((void *)&v10 + 1) = v13;
  if (der_utils_encode_fv_data(&v11, v7)
    && der_utils_encode_fv_data(&v11, v5)
    && ccder_blob_encode_tl()
    && der_utils_encode_fv_data(&v10, v3)
    && der_utils_encode_fv_data(&v10, v1)
    && ccder_blob_encode_tl())
  {
    return aks_fv_set_protection();
  }
  return v8;
}

uint64_t aks_fv_owners_exist()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_remove_external_kek_group()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_sidp_status()
{
  MEMORY[0x1F4188790]();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(v5, 0x4000uLL);
  uint64_t result = aks_fv_set_protection();
  if (!result)
  {
    if (ccder_decode_sequence_tl() && ccder_decode_tl())
    {
      __memcpy_chk();
      if (v3) {
        unsigned char *v3 = 0;
      }
      if (v1) {
        *uint64_t v1 = 0;
      }
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fv_stash_kek()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_stash_kek_with_secret(int a1)
{
  uint64_t v1 = 8;
  if (a1) {
    uint64_t v1 = 12;
  }
  uint64_t v4 = v1;
  uint64_t v2 = aks_fv_set_protection();
  syslog(6, "aks_fv_prot_cmd_stash_kek(%llu) = %d", v4, v2);
  return v2;
}

uint64_t aks_fv_commit_stashed_kek()
{
  uint64_t v0 = aks_fv_set_protection();
  syslog(6, "aks_fv_prot_cmd_stash_commit = %d", v0);
  return v0;
}

uint64_t aks_fv_destroy_stashed_kek()
{
  uint64_t v0 = aks_fv_set_protection();
  syslog(6, "aks_fv_prot_cmd_stash_destroy = %d", v0);
  return v0;
}

uint64_t aks_fv_verify_user()
{
  return aks_fv_unwrap_vek_with_acm();
}

uint64_t aks_fv_delete_verifier()
{
  return aks_fv_set_protection();
}

uint64_t aks_absinthe_collection()
{
  unsigned int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 3758097084;
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  if (v4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v14 = aks_client_connection;
      if (v6) {
        long long v15 = v6;
      }
      else {
        long long v15 = "";
      }
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v9, v10, v11, v12, v13, (uint64_t)v15);
      uint64_t v16 = IOConnectCallMethod(v14, 0x50u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if (v16)
      {
        uint64_t v7 = v16;
      }
      else
      {
        uint64_t v17 = calloc(__count, 1uLL);
        *uint64_t v4 = v17;
        if (v17)
        {
          memcpy(v17, __src, __count);
          uint64_t v7 = 0;
          void *v2 = (int)__count;
        }
        else
        {
          uint64_t v7 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_collection", ":", 3220, "", 0, "", "");
    }
  }
  else
  {
    uint64_t v7 = 3758097090;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  free(*(void **)&inputStructCnt[1]);
  return v7;
}

uint64_t aks_absinthe_generate(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  input[1] = *MEMORY[0x1E4F143B8];
  long long v21 = 0;
  input[0] = a1;
  int v20 = 0;
  uint64_t v7 = 3758097090;
  if (a2 && a6 && a7)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v17 = aks_client_connection;
      aks_pack_data(&v21, (unsigned int *)&v20, 2, v12, v13, v14, v15, v16, a2);
      size_t v19 = *a7;
      uint64_t v7 = IOConnectCallMethod(v17, 0x51u, input, 1u, v21, v20, 0, 0, a6, &v19);
      if (!v7) {
        *a7 = (int)v19;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_generate", ":", 3253, "", 0, "", "");
      uint64_t v7 = 3758097084;
    }
  }
  free(v21);
  return v7;
}

uint64_t aks_drop_auxiliary_auth_by_uid(unsigned int a1)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = 0;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_uid", ":", 3280, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_drop_auxiliary_auth_by_handle(int a1)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = 1;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_handle", ":", 3296, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lower_iteration_count()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x5Cu, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lower_iteration_count", ":", 3310, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_se_secret_drop(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x6Au, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_secret_drop", ":", 3326, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_get_current_sep_measurement(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && !aks_get_internal_info_for_key()) {
    der_dict_get_data((uint64_t)der_key_sep_measurement);
  }
  free(0);
  return 3758097084;
}

uint64_t aks_get_internal_info()
{
  return aks_get_internal_info_for_key();
}

uint64_t aks_get_seconds_since_passcode_change(uint64_t a1, void *a2)
{
  uint64_t v3 = 3758097084;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  if (!aks_get_internal_info_for_key()
    && der_dict_get_number((uint64_t)der_key_passcode_change_time, (uint64_t)v9, (uint64_t)v9 + v8, (uint64_t)&v7))
  {
    if (a2)
    {
      time_t v4 = time(0);
      uint64_t v3 = 0;
      time_t v5 = v4 - v7;
      if (v4 <= v7) {
        time_t v5 = 0;
      }
      *a2 = v5;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  free(v9);
  return v3;
}

uint64_t aks_get_internal_state()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 3758097090;
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_state", ":", 3405, "", 0, "", "");
    uint64_t v3 = 3758097084;
    goto LABEL_11;
  }
  if (!v2)
  {
LABEL_11:
    rsize_t v6 = 4096;
    goto LABEL_9;
  }
  uint64_t v5 = IOConnectCallMethod(aks_client_connection, 0x8Eu, input, 1u, 0, 0, 0, 0, __s, &__n);
  rsize_t v6 = __n;
  if (v5)
  {
    uint64_t v3 = v5;
  }
  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
  {
    if (decode_extended_state((uint64_t)__s, __n, v2)) {
      uint64_t v3 = 3758097090;
    }
    else {
      uint64_t v3 = 0;
    }
    rsize_t v6 = __n;
  }
LABEL_9:
  memset_s(__s, v6, 0, v6);
  return v3;
}

uint64_t aks_fairplay_wrap(const void *a1, size_t a2, void *a3, size_t *a4)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = 266;
  uint64_t result = 3758097090;
  if (a3 && a4)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      size_t v10 = *a4;
      uint64_t result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a1, a2, 0, 0, a3, &v10);
      if (!result) {
        *a4 = (int)v10;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fairplay_wrap", ":", 3431, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t _fairplay_generate_csk_internal(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = ((unint64_t)a1 << 8) | 1;
  uint64_t result = 3758097090;
  if (a4 && a5)
  {
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      size_t v11 = *a5;
      uint64_t result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a2, a3, 0, 0, a4, &v11);
      if (!result) {
        *a5 = (int)v11;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_fairplay_generate_csk_internal", ":", 3455, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fairplay_generate_csk(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(0, a1, a2, a3, a4);
}

uint64_t aks_fairplay_generate_csk_v1(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(1u, a1, a2, a3, a4);
}

uint64_t aks_bak_get_beacon_internal()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  time_t v4 = v3;
  size_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  memset(v19, 0, sizeof(v19));
  bzero(__s, 0x4000uLL);
  size_t v15 = 0x4000;
  input[0] = 1;
  input[1] = v9;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v11 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, v8, v6, 0, 0, __s, &v15);
    if (v11)
    {
      uint64_t v13 = v11;
    }
    else
    {
      __memcpy_chk();
      void *v2 = 44;
      uint64_t v12 = calloc(0x2CuLL, 1uLL);
      *time_t v4 = v12;
      if (v12)
      {
        __memcpy_chk();
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = 3758097085;
      }
    }
  }
  else
  {
    uint64_t v13 = 3758097084;
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_beacon_internal", ":", 3491, "", 0, "", "");
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v13;
}

uint64_t aks_bak_get_beacon()
{
  uint64_t beacon_internal = aks_bak_get_beacon_internal();
  if (beacon_internal) {
    return beacon_internal;
  }
  else {
    return 3758604312;
  }
}

uint64_t aks_bak_get_swizzler_internal()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  time_t v4 = v3;
  size_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = 2;
  input[1] = v0;
  int v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  memset(v26, 0, sizeof(v26));
  bzero(__s, 0x4000uLL);
  size_t v24 = 0x4000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v10 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, 0, 0, 0, 0, __s, &v24);
    if (v10)
    {
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 3758097085;
      __memcpy_chk();
      uint64_t v12 = calloc(0x28uLL, 1uLL);
      void *v8 = v12;
      if (v12)
      {
        *size_t v6 = 40;
        long long v13 = *(_OWORD *)&v26[1];
        long long v14 = *(_OWORD *)&v26[3];
        v12[4] = v26[5];
        *(_OWORD *)uint64_t v12 = v13;
        *((_OWORD *)v12 + 1) = v14;
        size_t v15 = calloc(0x91uLL, 1uLL);
        *time_t v4 = v15;
        if (v15)
        {
          uint64_t v11 = 0;
          void *v2 = 145;
          long long v16 = v28;
          *size_t v15 = v27;
          v15[1] = v16;
          long long v17 = v29;
          long long v18 = v30;
          long long v19 = v32;
          v15[4] = v31;
          v15[5] = v19;
          v15[2] = v17;
          v15[3] = v18;
          long long v20 = v33;
          long long v21 = v34;
          long long v22 = v35;
          *((unsigned char *)v15 + 144) = v36;
          v15[7] = v21;
          v15[8] = v22;
          v15[6] = v20;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_swizzler_internal", ":", 3551, "", 0, "", "");
    uint64_t v11 = 3758097084;
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v26, 0xC4uLL, 0, 0xC4uLL);
  return v11;
}

uint64_t aks_bak_get_swizzler()
{
  return aks_bak_get_swizzler_internal();
}

uint64_t aks_test_stashed_kek(uint64_t a1)
{
  mach_port_t akstest_client_connection = get_akstest_client_connection();
  if (akstest_client_connection) {
    return IOConnectCallMethod(akstest_client_connection, 0xCu, 0, 0, *(const void **)a1, *(void *)(a1 + 8), 0, 0, 0, 0);
  }
  else {
    return 3758097084;
  }
}

uint64_t aks_get_dsme_key()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v3 = (void *)v0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  bzero(__src, 0x4000uLL);
  size_t __count = 0x4000;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v5 = 3758097090;
    if (v3 && v2)
    {
      uint64_t v6 = IOConnectCallMethod(aks_client_connection, 0x96u, 0, 0, 0, 0, 0, 0, __src, &__count);
      if (v6)
      {
        uint64_t v5 = v6;
      }
      else
      {
        uint64_t v7 = calloc(__count, 1uLL);
        void *v3 = v7;
        if (v7)
        {
          size_t v8 = __count;
          size_t *v2 = __count;
          memcpy(v7, __src, v8);
          uint64_t v5 = 0;
        }
        else
        {
          uint64_t v5 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_dsme_key", ":", 3600, "", 0, "", "");
    uint64_t v5 = 3758097084;
  }
  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v5;
}

BOOL aks_bag_in_xart(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t aks_prewarm_sps()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x73u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_prewarm_sps", ":", 3627, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_sealed_hashes_set(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 4294967285;
  if (a3 && a4 <= 0x30)
  {
    uint64_t v4 = 3758097084;
    mach_port_t aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      mach_port_t v6 = aks_client_connection;
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_uint64();
      ccder_sizeof_raw_octet_string();
      size_t v7 = ccder_sizeof();
      MEMORY[0x1F4188790]();
      uint64_t v9 = (char *)v11 - v8;
      bzero((char *)v11 - v8, v7);
      ccder_encode_raw_octet_string();
      ccder_encode_uint64();
      ccder_encode_raw_octet_string();
      if ((char *)ccder_encode_constructed_tl() == v9) {
        return IOConnectCallMethod(v6, 0x72u, 0, 0, v9, v7, 0, 0, 0, 0);
      }
      else {
        return 3758097090;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sealed_hashes_set", ":", 3644, "", 0, "", "");
    }
  }
  return v4;
}

uint64_t aks_measure_and_seal_cryptex_manifest(const void *a1, size_t a2)
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x90u, 0, 0, a1, a2, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_measure_and_seal_cryptex_manifest", ":", 3674, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_seal_cryptex_manifest_lock()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x95u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_seal_cryptex_manifest_lock", ":", 3688, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_lkgp_recover(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x85u, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lkgp_recover", ":", 3704, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_memento_efface_blob(int a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x8Au, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_efface_blob", ":", 3720, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_memento_get_state()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    uint64_t v4 = IOConnectCallMethod(aks_client_connection, 0x8Bu, input, 1u, 0, 0, 0, 0, __s, &__n);
    rsize_t v5 = __n;
    if (v4)
    {
      uint64_t v6 = v4;
    }
    else
    {
      uint64_t v6 = 3758097090;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
      {
        if (decode_memento_state((uint64_t)__s, __n, v2)) {
          uint64_t v6 = 3758097090;
        }
        else {
          uint64_t v6 = 0;
        }
        rsize_t v5 = __n;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_get_state", ":", 3738, "", 0, "", "");
    uint64_t v6 = 3758097084;
    rsize_t v5 = 4096;
  }
  memset_s(__s, v5, 0, v5);
  return v6;
}

uint64_t aks_set_jcop_supports_updated_kud_policy()
{
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x89u, &input, 0, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_jcop_supports_updated_kud_policy", ":", 3758, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_set_cx_window(uint64_t a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x97u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_cx_window", ":", 3774, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_get_cx_window()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  outputStruct[512] = *MEMORY[0x1E4F143B8];
  size_t v5 = 4096;
  if (!v0) {
    return 4294967285;
  }
  uint64_t v1 = (void *)v0;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v3 = aks_client_connection;
    bzero(outputStruct, 0x1000uLL);
    uint64_t result = IOConnectCallMethod(v3, 0x98u, 0, 0, 0, 0, 0, 0, outputStruct, &v5);
    if (!result)
    {
      if (v5 == 8)
      {
        uint64_t result = 0;
        *uint64_t v1 = outputStruct[0];
      }
      else
      {
        return 3758604298;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_cx_window", ":", 3791, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t get_aks_log_pid()
{
  return 0;
}

uint64_t compress_uuid()
{
  return 0;
}

unint64_t time_seconds_to_abs_interval(unsigned int a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t time_absolute_to_nanoseconds(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t get_usec_time()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t get_clock_time()
{
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec;
}

uint64_t ipc_seconds_to_microsecond_interval(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t ipc_microseconds_to_seconds(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

void *circular_queue_init(unsigned int a1, unsigned int a2)
{
  uint64_t v2 = a1 + 1;
  uint64_t v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n", "aks", "", "", "", "circular_queue_init", ":", 341, "", 0, "", "");
    return 0;
  }
  else
  {
    size_t v5 = calloc(0x20uLL, 1uLL);
    uint64_t v6 = v5;
    if (v5)
    {
      v5[1] = 0;
      size_t v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)size_t v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      uint64_t v8 = calloc(v7, 1uLL);
      _DWORD v6[2] = v7;
      void v6[3] = v8;
    }
  }
  return v6;
}

uint64_t circular_queue_size(_DWORD *a1)
{
  unsigned int v3 = a1[2];
  unsigned int v2 = a1[3];
  uint64_t result = v2 - v3;
  if (v2 < v3) {
    return (result + a1[1]);
  }
  return result;
}

uint64_t circular_queue_enqueue(unsigned int *a1, const void *a2)
{
  unsigned int v3 = a1[3];
  unsigned int v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((void *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2]) {
    a1[2] = (v4 + 1) % a1[1];
  }
  return 0;
}

uint64_t circular_queue_dequeue(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
    unsigned int v2 = a1[2];
  }
  memset_s((void *)(*((void *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  uint64_t result = 0;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t circular_queue_peek(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
  return 0;
}

uint64_t circular_queue_dequeue_all(int *a1, void *a2, unsigned int *a3)
{
  unsigned int v7 = a1[2];
  unsigned int v6 = a1[3];
  unsigned int v8 = v6 - v7;
  if (v6 < v7) {
    v8 += a1[1];
  }
  if (!v8) {
    return 0;
  }
  unsigned int v9 = *a1 * v8;
  uint64_t v10 = (char *)calloc(v9, 1uLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  unsigned int v12 = a1[2];
  unsigned int v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13) {
      goto LABEL_13;
    }
    unsigned int v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((void *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17) {
      goto LABEL_13;
    }
    uint64_t v10 = &v11[*a1 * v17];
    long long v14 = (const void *)*((void *)a1 + 3);
    size_t v15 = *a1 * (v8 - v17);
  }
  else
  {
    long long v14 = (const void *)(*((void *)a1 + 3) + *a1 * v12);
    size_t v15 = *a1 * v8;
  }
  memcpy(v10, v14, v15);
LABEL_13:
  unsigned int v18 = a1[1];
  int v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  uint64_t result = 0;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t circular_queue_clear(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  rsize_t v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void circular_queue_free(void *a1)
{
  *((void *)a1 + 1) = 0;
  rsize_t v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((void *)a1 + 2), 0, *((void *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t class_gen_get(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL persona_uuid_is_valid(uint8x16_t *a1)
{
  int8x16_t v1 = (int8x16_t)vmovl_high_u8(*a1);
  int8x16_t v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  int8x16_t v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8(vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8), vorr_s8((int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0;
}

BOOL is_non_zero(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  int v2 = 0;
  do
  {
    int v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

_DWORD *pfk_params_is_valid(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result != 0);
  }
  return result;
}

uint64_t class_gen_set(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t class_persona_get(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t class_persona_unset(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t class_persona_set(int a1)
{
  return a1 | 0x40u;
}

uint64_t keychain_key(char a1)
{
  char v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14) {
    char v1 = -1;
  }
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t class_id_get(char a1)
{
  if ((a1 & 0x1Fu) > 0x13) {
    return 0xFFFFFFFFLL;
  }
  else {
    return a1 & 0x1F;
  }
}

uint64_t fs_class_key(char a1)
{
  unsigned int v1 = a1 & 0x1F;
  if (v1 > 0x13) {
    unsigned int v1 = -1;
  }
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t keystore_type(char a1)
{
  return a1 & 0xF;
}

BOOL store_type_equal(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t memcmp_c(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F40CA6A8](a3, a1, a2);
}

uint64_t dump_bytes_internal(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  unsigned int v4 = a1;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)__str = 0u;
  long long v17 = 0u;
  size_t v5 = (FILE **)MEMORY[0x1E4F143D8];
  if (a3 >= 0x41)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 786, "", 0, "", "", a1, a3, "", "");
    unsigned int v4 = "";
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  unint64_t v6 = 0;
  unint64_t v15 = v3;
  do
  {
    unsigned int v7 = v5;
    if (v3 - v6 >= 0x40) {
      uint64_t v8 = 64;
    }
    else {
      uint64_t v8 = v3 - v6;
    }
    if (v8)
    {
      unsigned int v9 = (unsigned __int8 *)(a2 + v6);
      uint64_t v10 = __str;
      uint64_t v11 = v8;
      do
      {
        int v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    size_t v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 796, "", 0, "", "", v4, "", v6, v8 + v6, "", __str,
      "",
      "");
    v6 += v8;
    unint64_t v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

unsigned char *bytes_to_str_hint(unsigned __int8 *a1, unint64_t a2)
{
  if (a2 >= 0x10) {
    uint64_t v2 = 16;
  }
  else {
    uint64_t v2 = a2;
  }
  if (v2)
  {
    unsigned int v4 = bytes_to_str_hint_buf;
    uint64_t v5 = v2;
    do
    {
      int v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  bytes_to_str_hint_buf[2 * v2] = 0;
  return bytes_to_str_hint_buf;
}

uint64_t get_kcv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(__s, 0, sizeof(__s));
  if (a4 == 3)
  {
    ccsha256_di();
    cchmac();
    uint64_t v5 = 0;
    *(_WORD *)a3 = __s[0];
    *(unsigned char *)(a3 + 2) = BYTE2(__s[0]);
  }
  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v5;
}

uint64_t print_kcv(const char *a1, uint64_t a2, uint64_t a3)
{
  char v6 = 0;
  __int16 v5 = 0;
  get_kcv(a2, a3, (uint64_t)&v5, 3);
  return dump_bytes_internal(a1, (uint64_t)&v5, 3uLL);
}

char *byte_swap_val(char *result, unint64_t a2)
{
  if (a2 >= 2)
  {
    unint64_t v2 = a2 >> 1;
    unint64_t v3 = &result[a2 - 1];
    do
    {
      char v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t ascii_hex_to_bytes(unsigned __int8 *a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    char v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        unint64_t v9 = a2 >> 1;
        uint64_t v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1) {
              uint64_t v11 = 1;
            }
            else {
              uint64_t v11 = a2 >> 1;
            }
            int v12 = v10;
            do
            {
              int v13 = *v6;
              unsigned int v14 = v13 - 48;
              unsigned int v15 = v13 - 97;
              if ((v13 - 65) >= 6) {
                char v16 = -1;
              }
              else {
                char v16 = v13 - 55;
              }
              char v17 = v13 - 87;
              if (v15 > 5) {
                char v17 = v16;
              }
              if (v14 < 0xA) {
                char v17 = v14;
              }
              char v18 = 16 * v17;
              int v19 = v6[1];
              unsigned int v20 = v19 - 48;
              unsigned int v21 = v19 - 97;
              if ((v19 - 65) >= 6) {
                char v22 = -1;
              }
              else {
                char v22 = v19 - 55;
              }
              char v23 = v19 - 87;
              if (v21 > 5) {
                char v23 = v22;
              }
              if (v20 < 0xA) {
                char v23 = v20;
              }
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }
            while (v11);
          }
          uint64_t v5 = 0;
          *a3 = v10;
          *a4 = v9;
        }
        else
        {
          return 4294967279;
        }
      }
    }
  }
  return v5;
}

uint64_t err_sks_to_aks(uint64_t result)
{
  if (result == 0 || result >= 0xFFFFFFDA) {
    return dword_1A14DDAF0[(int)result + 38];
  }
  return result;
}

uint64_t fv_init_cred_from_secret(void *a1, uint64_t a2, char a3)
{
  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if (a3) {
    return 4294967285;
  }
  if (a2 && *(void *)a2 && (size_t v7 = *(void *)(a2 + 8)) != 0)
  {
    uint64_t v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      unint64_t v9 = *(const void **)a2;
      a1[1] = *(void *)(a2 + 8);
      memcpy(v8, v9, *(void *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    uint64_t result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t REQUIRE_func(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", "", "", "", "REQUIRE_func", ":", 1047, "", 0, "", a3, a2, "");
    abort();
  }
  return result;
}

uint64_t generate_wrapping_key_curve25519(long long *a1, long long *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, sizeof(v14));
  platform_read_random((uint64_t)v14, 0x20u);
  cccurve25519_make_pub();
  long long v8 = 0u;
  long long v9 = 0u;
  int __s = 0x1000000;
  long long v4 = a2[1];
  long long v10 = *a2;
  long long v11 = v4;
  long long v5 = a1[1];
  long long v12 = *a1;
  long long v13 = v5;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v14, 0x20uLL, 0, 0x20uLL);
  return 0;
}

uint64_t wrap_data(int *a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unsigned int v32 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  memset(__s, 0, sizeof(__s));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7) {
    goto LABEL_40;
  }
  if (!a1)
  {
LABEL_14:
    if (a2)
    {
      if (rfc3394_wrapped_size_legacy(a5, &v32))
      {
        if (*a7 < v32) {
          goto LABEL_40;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        unsigned int v20 = a2;
        unsigned int v21 = a4;
        goto LABEL_38;
      }
    }
    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5) {
          goto LABEL_40;
        }
        unsigned int v32 = a5;
        uint64_t v29 = ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f(v29, 32, (uint64_t)(a1 + 2), (uint64_t)&firebloom_null_iv, a5 & 0xFFFFFFF0);
LABEL_39:
        uint64_t v8 = 0;
        *a7 = v32;
        goto LABEL_40;
      }
      if (rfc3394_wrapped_size_legacy(a5, &v32))
      {
        if (*a7 < v32) {
          goto LABEL_40;
        }
        if ((a3 & 8) != 0)
        {
          ccsha256_di();
          cchkdf();
          char v18 = __s;
        }
        else
        {
          char v18 = a1 + 2;
        }
        unsigned int v19 = 32;
        unsigned int v20 = 0;
        unsigned int v21 = a4;
LABEL_38:
        if (rfc3394_wrap_legacy((uint64_t)v18, v19, 0xA6A6A6A6A6A6A6A6, v20, v21, a5, (void *)a6, &v32))goto LABEL_40; {
        goto LABEL_39;
        }
      }
    }
    uint64_t v8 = 4294967285;
    if ((a3 & 8) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  int v14 = *a1;
  if ((*a1 - 1) >= 2)
  {
    if (v14) {
      goto LABEL_40;
    }
    goto LABEL_14;
  }
  if ((a3 & 4) != 0) {
    unsigned int v15 = 64;
  }
  else {
    unsigned int v15 = 72;
  }
  unsigned int v32 = v15;
  if (!a2 && a5 == 32 && *a7 >= v15)
  {
    if (v14 == 1)
    {
      generate_wrapping_key_curve25519((long long *)(a1 + 9), &v34);
    }
    else
    {
      long long v23 = *(_OWORD *)(a1 + 5);
      long long v34 = *(_OWORD *)(a1 + 1);
      long long v35 = v23;
      long long v24 = *(_OWORD *)(a1 + 13);
      long long v36 = *(_OWORD *)(a1 + 9);
      long long v37 = v24;
    }
    if ((a3 & 0x80) == 0)
    {
      long long v25 = v35;
      *(_OWORD *)a6 = v34;
      *(_OWORD *)(a6 + 16) = v25;
      if ((a3 & 4) != 0)
      {
        uint64_t v28 = ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f(v28, 32, (uint64_t)&v36, (uint64_t)&firebloom_null_iv, 0x20uLL);
        goto LABEL_34;
      }
      int v31 = 40;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        long long v27 = (void *)(a6 + 32);
        uint64_t v26 = __s;
      }
      else
      {
        uint64_t v26 = &v36;
        long long v27 = (void *)(a6 + 32);
      }
      if (!rfc3394_wrap_legacy((uint64_t)v26, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, a4, 0x20u, v27, &v31))
      {
LABEL_34:
        uint64_t v8 = 0;
        *a7 = v15;
        if ((a3 & 8) == 0) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }
  }
LABEL_40:
  if ((a3 & 8) != 0) {
LABEL_41:
  }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_42:
  memset_s(&v34, 0x40uLL, 0, 0x40uLL);
  return v8;
}

uint64_t generate_unwrap_shared_key_curve25519(long long *a1, uint64_t a2, long long *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v7 = 0u;
  long long v3 = a1[1];
  long long v9 = *a1;
  long long v10 = v3;
  long long v4 = a3[1];
  long long v11 = *a3;
  int __s = 0x1000000;
  long long v12 = v4;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0;
}

uint64_t unwrap_data(uint64_t a1, uint64_t (*a2)(void, void *, unint64_t *, unint64_t *, uint64_t), char a3, void *a4, unsigned int a5, void *a6, unsigned int *a7)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int v24 = 0;
  memset(v26, 0, sizeof(v26));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if (!a1) {
      goto LABEL_6;
    }
    if (*(_DWORD *)a1 != 1)
    {
      if (!*(_DWORD *)a1)
      {
LABEL_6:
        if (a5 <= 0x28)
        {
          if (a2)
          {
            if (rfc3394_unwrapped_size_legacy(a5, &v24) && *a7 >= v24)
            {
              unsigned int v15 = 0;
              unsigned int v16 = 0;
              char v17 = a2;
              goto LABEL_30;
            }
          }
          else if ((a3 & 4) != 0)
          {
            if ((a5 & 0xF) == 0 && *a7 >= a5)
            {
              unsigned int v24 = a5;
              uint64_t v20 = ccaes_cbc_decrypt_mode();
              firebloom_cbc_one_shot_f(v20, 32, a1 + 8, (uint64_t)&firebloom_null_iv, a5 & 0xFFFFFFF0);
LABEL_31:
              uint64_t v8 = 0;
              *a7 = v24;
              goto LABEL_35;
            }
          }
          else if (rfc3394_unwrapped_size_legacy(a5, &v24) && *a7 >= v24)
          {
            if ((a3 & 8) != 0)
            {
              ccsha256_di();
              cchkdf();
              unsigned int v15 = v26;
            }
            else
            {
              unsigned int v15 = (_OWORD *)(a1 + 8);
            }
            unsigned int v16 = 32;
            char v17 = 0;
LABEL_30:
            if (!rfc3394_unwrap_legacy((uint64_t)v15, v16, 0xA6A6A6A6A6A6A6A6, v17, a4, a5, a6, &v24)) {
              goto LABEL_31;
            }
            goto LABEL_40;
          }
        }
LABEL_38:
        uint64_t v8 = 4294967285;
        goto LABEL_35;
      }
LABEL_22:
      uint64_t v8 = 0xFFFFFFFFLL;
      goto LABEL_35;
    }
    unsigned int v24 = 32;
    if (*a7 < 0x20) {
      goto LABEL_38;
    }
    memset(__s, 0, sizeof(__s));
    if ((a3 & 4) != 0)
    {
      if (a5 != 64) {
        goto LABEL_38;
      }
      generate_unwrap_shared_key_curve25519((long long *)a4, a1 + 4, (long long *)(a1 + 36));
      uint64_t v21 = ccaes_cbc_decrypt_mode();
      firebloom_cbc_one_shot_f(v21, 32, (uint64_t)__s, (uint64_t)&firebloom_null_iv, 0x20uLL);
    }
    else
    {
      if (a5 != 72) {
        goto LABEL_38;
      }
      generate_unwrap_shared_key_curve25519((long long *)a4, a1 + 4, (long long *)(a1 + 36));
      if (a3 < 0) {
        goto LABEL_22;
      }
      int v23 = 32;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        char v18 = a4 + 4;
        unsigned int v19 = v26;
      }
      else
      {
        char v18 = a4 + 4;
        unsigned int v19 = __s;
      }
      if (rfc3394_unwrap_legacy((uint64_t)v19, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, v18, 0x28u, a6, &v23))
      {
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_40:
        uint64_t v8 = 4294967277;
        goto LABEL_35;
      }
    }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    uint64_t v8 = 0;
    *a7 = 32;
  }
LABEL_35:
  if ((a3 & 8) != 0) {
    memset_s(v26, 0x20uLL, 0, 0x20uLL);
  }
  return v8;
}

uint64_t firebloom_export_pub_key(uint64_t a1, void *a2, size_t *a3)
{
  size_t v5 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  char v6 = calloc(v5, 1uLL);
  if (!v6) {
    return 4294967279;
  }
  long long v7 = v6;
  ccec_export_pub();
  uint64_t result = 0;
  *a2 = v7;
  *a3 = v5;
  return result;
}

unint64_t firebloom_cp_prime_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

unint64_t firebloom_sign_max_size()
{
  return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t firebloom_ec_export_pub_size()
{
  return ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
}

unint64_t firebloom_ec_compact_export_pub_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

uint64_t firebloom_cbc_one_shot_f(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return MEMORY[0x1F40CA748](a1, a2, a3, a4, a5 >> 4);
}

uint64_t firebloom_ecb_one_shot_f(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return MEMORY[0x1F40CABC8](a1, a2, a3, a4 >> 4);
}

uint64_t firebloom_cbc_update_f(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return MEMORY[0x1F40CA758](a1, a2, a3, a4 >> 4);
}

BOOL firebloom_ec_import()
{
  return !MEMORY[0x1A6232950]() && ccn_read_uint() == 0;
}

uint64_t firebloom_ec_export()
{
  return 1;
}

uint64_t dict_find_params_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a5 + 8) >= *(void *)a5)
  {
    char v13 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      BOOL v11 = der_equal(*(const void **)(*(void *)(a5 + 24) + v9), *(void *)(*(void *)(a5 + 24) + v9)+ *(unsigned __int8 *)(*(void *)(*(void *)(a5 + 24) + v9) + 1)+ 2, a1);
      if (v11) {
        break;
      }
      ++v10;
      v9 += 40;
      if (v10 >= *(void *)a5) {
        goto LABEL_10;
      }
    }
    int v14 = (void *)(*(void *)(a5 + 24) + v9);
    if (v14[1])
    {
      char v12 = 0;
      *(unsigned char *)(a5 + 16) = 1;
    }
    else
    {
      ++*(void *)(a5 + 8);
      v14[1] = a3;
      _OWORD v14[2] = a3 + a4;
      void v14[3] = a3;
      v14[4] = a3 + a4;
      char v12 = 1;
    }
LABEL_10:
    char v13 = v12 | !v11;
  }
  return v13 & 1;
}

BOOL der_key_equal(unsigned __int8 *a1, const void *a2)
{
  return der_equal(a1, (uint64_t)&a1[a1[1] + 2], a2);
}

BOOL der_equal(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5 = der_get_sizeof((uint64_t)a1);
  return v5 == der_get_sizeof((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t der_get_sizeof(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len()) {
    return a1 - a1;
  }
  else {
    return 0;
  }
}

uint64_t der_dict_iterate()
{
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result) {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t der_dict_find_value(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    der_dict_iterate();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL _dict_find_value_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v8 = der_equal(*(const void **)a5, *(void *)a5 + *(unsigned __int8 *)(*(void *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(unsigned char *)(a5 + 24) = 1;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t der_dict_get_number(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0;
  }
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

uint64_t der_get_number()
{
  return 0;
}

uint64_t der_dict_get_data(uint64_t result)
{
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

double der_utils_decode_implicit_raw_octet_string(long long *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  long long v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    double result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t der_array_iterate(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, void, uint64_t), uint64_t a4)
{
  *(void *)&long long v12 = a1;
  *((void *)&v12 + 1) = a2;
  uint64_t v6 = ccder_blob_decode_range();
  if (v6)
  {
    uint64_t v11 = 0;
    uint64_t v7 = v12;
    if (der_utils_decode_tl(&v12, &v10, &v11))
    {
      do
      {
        uint64_t v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4)) {
          break;
        }
        *(void *)&long long v12 = v8;
        uint64_t v7 = v8;
      }
      while ((der_utils_decode_tl(&v12, &v10, &v11) & 1) != 0);
    }
  }
  return v6;
}

uint64_t der_utils_decode_tl(long long *a1, void *a2, void *a3)
{
  long long v7 = *a1;
  uint64_t result = ccder_blob_decode_tag();
  if (result)
  {
    uint64_t result = ccder_blob_decode_len();
    if (result)
    {
      *a1 = v7;
      *a2 = 0;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t der_get_BOOL()
{
  return 0;
}

uint64_t encode_list_free(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    unint64_t v2 = *a1;
    if (!*a1) {
      break;
    }
    long long v3 = (void *)*((void *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((void *)v2 + 2), 0, *((void *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t encode_list_remove_key(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v2 = (void **)a1;
  uint64_t result = (uint64_t)_encode_list_find_key(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (uint64_t i = *v2; i != (void *)result; uint64_t i = (void *)*i)
      unint64_t v2 = (void **)i;
    void *v2 = *(void **)result;
    uint64_t v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(void *)(v4 + 16), 0, *(void *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

void *_encode_list_find_key(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0;
  }
  unint64_t v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      size_t v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && der_equal(a2, (uint64_t)&a2[a2[1] + 2], v5)) {
        break;
      }
      unint64_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t encode_list_get_data(void *a1, unsigned __int8 *a2, int a3, void *a4, void *a5)
{
  key = _encode_list_find_key(a1, a2);
  if (!key) {
    return 0;
  }
  uint64_t v9 = 1;
  if (a4)
  {
    if (a5)
    {
      uint64_t v10 = key[1] + key[2];
      *(void *)&long long v15 = key[1];
      *((void *)&v15 + 1) = v10;
      uint64_t v9 = ccder_blob_decode_sequence_tl();
      if (v9)
      {
        if (der_utils_decode_implicit_raw_octet_string_copy(&v15, 12, 0, 0))
        {
          uint64_t v11 = v15;
          if (ccder_blob_decode_tag())
          {
            if (ccder_blob_decode_len())
            {
              uint64_t v13 = 0;
              uint64_t v12 = v15;
              if (a3)
              {
                uint64_t v13 = (v15 - v11);
                uint64_t v12 = v11;
              }
              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy(long long *a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4) {
    return 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t encode_list_cstr_get_data(void *a1, char *__s, void *a3, size_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, sizeof(v18));
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  v11[0] = 12;
  v11[1] = strlen(__s);
  long long v7 = (unsigned __int8 *)der_key_validate((uint64_t)v11);
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v7)
  {
    __memcpy_chk();
    __src = 0;
    uint64_t v10 = 0;
    if (encode_list_get_data(a1, v7, 0, &__src, &v10))
    {
      if (v10 == a4)
      {
        memcpy(a3, __src, a4);
        return 0;
      }
      else
      {
        return 4294967277;
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t der_key_validate(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t encode_list_get_number(void *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  uint64_t v5 = data;
  if (a3 && data) {
    *a3 = der_get_number();
  }
  return v5;
}

uint64_t encode_list_get_BOOL(void *a1, unsigned __int8 *a2, unsigned char *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  uint64_t v5 = data;
  if (a3 && data) {
    *a3 = der_get_BOOL();
  }
  return v5;
}

uint64_t encode_list_merge_dict(uint64_t a1)
{
  if (a1) {
    return der_dict_iterate() - 1;
  }
  else {
    return 4294967285;
  }
}

uint64_t _merge_dict_cb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (unsigned __int8 *)der_key_validate(a1);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (!encode_list_remove_key(a5, v8) && !encode_list_add_der(a5, v9, a3, a3 + a4)) {
      return 1;
    }
  }
  fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t encode_list_dict(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          do
          {
            v10 += v7[2];
            uint64_t v7 = (void *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (rsize_t v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            long long v13 = v12;
            long long v14 = (void *)*a1;
            if (*a1)
            {
              long long v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                long long v14 = (void *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))_qsort_compare);
            size_t v16 = ccder_sizeof();
            long long v17 = (char *)calloc(v16, 1uLL);
            char v18 = v17;
            if (v17)
            {
              long long v25 = v17;
              uint64_t v26 = &v17[v16];
              unint64_t v19 = v8 - 1;
              uint64_t v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                uint64_t v22 = v20 - 16;
                char v23 = ccder_blob_encode_body();
                uint64_t v20 = v22;
                if ((v23 & 1) == 0) {
                  goto LABEL_16;
                }
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                uint64_t v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              uint64_t v3 = 0;
              *a2 = v18;
              *a3 = v16;
              char v18 = 0;
            }
            else
            {
              uint64_t v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t encode_list_add_der(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (der_get_sizeof(a3) <= (unint64_t)(a4 - a3))
    {
      size_t v6 = ccder_sizeof();
      uint64_t v7 = (char *)calloc(v6, 1uLL);
      if (!v7) {
        return 4294967279;
      }
      unint64_t v8 = v7;
      size_t v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        int v9 = ccder_blob_encode_body();
        uint64_t v10 = v16;
        if (!v9) {
          uint64_t v10 = 0;
        }
        long long v17 = v10;
        int v11 = ccder_blob_encode_tl();
        long long v12 = v17;
        if (!v11) {
          long long v12 = 0;
        }
        if (v12 && v12 == v8)
        {
          long long v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            long long v15 = v14;
            uint64_t result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *long long v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t encode_list_add_key(void *a1, uint64_t a2, uint64_t a3)
{
  return encode_list_add_der(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t encode_list_add_data(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    size_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      long long v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      int v9 = v15;
      if (!v8) {
        int v9 = 0;
      }
      size_t v16 = v9;
      int v10 = ccder_blob_encode_tl();
      int v11 = v16;
      if (!v10) {
        int v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        _OWORD v14[2] = v5;
        *long long v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_cstr_add_data(void *a1, char *__s, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, sizeof(v14));
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  v7[0] = 12;
  v7[1] = strlen(__s);
  uint64_t v5 = der_key_validate((uint64_t)v7);
  uint64_t result = 4294967285;
  if (a3)
  {
    if (v5)
    {
      __memcpy_chk();
      return encode_list_add_data(a1, v5, a3);
    }
  }
  return result;
}

uint64_t encode_list_add_BOOL(void *a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v4 = ccder_sizeof();
    uint64_t v5 = (char *)calloc(v4, 1uLL);
    if (v5)
    {
      size_t v6 = v5;
      long long v14 = &v5[v4];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_18;
      }
      int v7 = ccder_blob_encode_body();
      long long v8 = v14;
      if (!v7) {
        long long v8 = 0;
      }
      uint64_t v15 = v8;
      int v9 = ccder_blob_encode_tl();
      long long v10 = v15;
      if (!v9) {
        long long v10 = 0;
      }
      BOOL v11 = v10 && v10 == v6;
      if (v11 && (long long v12 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v13 = v12;
        uint64_t result = 0;
        v13[1] = v6;
        size_t v13[2] = v4;
        void *v13 = *a1;
        *a1 = v13;
      }
      else
      {
LABEL_18:
        memset_s(v6, v4, 0, v4);
        free(v6);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_number(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  v25[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    uint64_t v10 = 8;
  }
  else
  {
    uint64_t v6 = 9;
    uint64_t v7 = 48;
    uint64_t v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      uint64_t v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if (v5 != v9)
      {
        uint64_t v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    uint64_t v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v8;
    }
  }
  v25[0] = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v12 = ccder_sizeof();
    long long v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      long long v14 = v13;
      uint64_t v15 = v10;
      do
      {
        *((unsigned char *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      char v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl()) {
        goto LABEL_30;
      }
      int v16 = ccder_blob_encode_body();
      long long v17 = v23;
      if (!v16) {
        long long v17 = 0;
      }
      unsigned int v24 = v17;
      int v18 = ccder_blob_encode_tl();
      unint64_t v19 = v24;
      if (!v18) {
        unint64_t v19 = 0;
      }
      BOOL v20 = v19 && v19 == v14;
      if (v20 && (uint64_t v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        uint64_t v22 = v21;
        uint64_t result = 0;
        v22[1] = v14;
        void v22[2] = v12;
        *uint64_t v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_string(void *a1, uint64_t a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    strlen(__s);
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    uint64_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      uint64_t v9 = v15;
      if (!v8) {
        uint64_t v9 = 0;
      }
      int v16 = v9;
      int v10 = ccder_blob_encode_tl();
      BOOL v11 = v16;
      if (!v10) {
        BOOL v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        _OWORD v14[2] = v5;
        *long long v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_list(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0;
  int __s = 0;
  rsize_t __n = 0;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    size_t v5 = 0;
    if (a3)
    {
      if (encode_list_dict(a3, &__s, &__n))
      {
        uint64_t v3 = 0;
        size_t v5 = 0;
      }
      else
      {
        size_t v5 = ccder_sizeof();
        uint64_t v7 = (char *)calloc(v5, 1uLL);
        uint64_t v3 = v7;
        if (v7)
        {
          uint64_t v15 = &v7[v5];
          if (!ccder_blob_encode_body()) {
            goto LABEL_23;
          }
          int v18 = v3;
          unint64_t v19 = v15;
          int v8 = ccder_blob_encode_body();
          uint64_t v9 = v19;
          if (!v8) {
            uint64_t v9 = 0;
          }
          int v18 = v3;
          unint64_t v19 = v9;
          int v10 = ccder_blob_encode_tl();
          BOOL v11 = v19;
          if (!v10) {
            BOOL v11 = 0;
          }
          BOOL v12 = v11 && v11 == v3;
          if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
          {
            uint64_t v4 = 0;
            v13[1] = v3;
            size_t v13[2] = v5;
            void *v13 = *a1;
            *a1 = v13;
            uint64_t v3 = 0;
          }
          else
          {
LABEL_23:
            uint64_t v4 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          uint64_t v4 = 4294967279;
        }
      }
    }
  }
  else
  {
    size_t v5 = 0;
  }
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  if (v3)
  {
    memset_s(v3, v5, 0, v5);
    free(v3);
  }
  return v4;
}

BOOL encode_list_is_empty(void *a1)
{
  return *a1 == 0;
}

uint64_t ccder_sizeof_fv_data()
{
  return ccder_sizeof();
}

uint64_t ccder_sizeof_fv_key()
{
  uint64_t v0 = ccder_sizeof();
  return ccder_sizeof() + v0;
}

uint64_t der_utils_encode_fv_key(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    uint64_t result = ccder_blob_encode_body_tl();
    if (!result) {
      return result;
    }
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else if (!ccder_blob_encode_body_tl() || (ccder_blob_encode_tl() & 1) == 0)
  {
    return 0;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_key(long long *a1, int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a3;
  uint64_t v5 = *(void *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 20);
  long long v11 = *a1;
  if (a2)
  {
    long long v14 = *a1;
    BOOL v12 = 0;
    uint64_t v13 = 0;
    if ((ccder_blob_decode_range() & 1) == 0) {
      return 0;
    }
    uint64_t v6 = (uint64_t)v12;
    unsigned int v8 = v13 - v12;
    long long v11 = v14;
  }
  else
  {
    LODWORD(v14) = v5;
    uint64_t result = der_utils_decode_implicit_raw_octet_string_copy_len(&v11, 4, v6, &v14);
    if (!result) {
      return result;
    }
    unsigned int v8 = v14;
  }
  long long v14 = v11;
  BOOL v12 = 0;
  uint64_t v13 = 0;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  long long v11 = v14;
  if ((v13 - v12) > 4) {
    return 0;
  }
  int v10 = *v12;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_len(long long *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  if (a3)
  {
    if (a4) {
      *a4 = 0;
    }
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_encode_fv_data(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!result) {
      return result;
    }
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_data(long long *a1, int a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  long long v9 = *a1;
  if (a2)
  {
    long long v12 = *a1;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t result = ccder_blob_decode_range();
    if (!result) {
      return result;
    }
    uint64_t v6 = v10;
    unsigned int v8 = v11 - v10;
    long long v9 = v12;
  }
  else
  {
    LODWORD(v12) = v5;
    uint64_t result = der_utils_decode_implicit_raw_octet_string_copy_len(&v9, 4, v6, &v12);
    if (!result) {
      return result;
    }
    unsigned int v8 = v12;
  }
  *a3 = v6;
  a3[1] = v8;
  *a1 = v9;
  return 1;
}

uint64_t der_utils_encode_fv_params(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!result) {
      return result;
    }
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_params(long long *a1)
{
  long long v3 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  *a1 = v3;
  return 1;
}

uint64_t encode_extended_state(unsigned int *a1, int a2, void *a3, _DWORD *a4)
{
  long long v12 = 0;
  if (encode_list_add_number(&v12, (uint64_t)der_key_state_state, *a1)
    || encode_list_add_number(&v12, (uint64_t)der_key_state_lock_state, a1[1])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_backoff, *((void *)a1 + 1))
    || encode_list_add_number(&v12, (uint64_t)der_key_state_failed_attempts, a1[4])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_generation_state, a1[5])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_recovery_countdown, *(void *)((char *)a1 + 26))|| encode_list_add_number(&v12, (uint64_t)der_key_state_more_state, *(void *)((char *)a1 + 34))|| encode_list_add_number(&v12, (uint64_t)der_key_keybag_handle, *(int *)((char *)a1 + 42))|| encode_list_add_number(&v12, (uint64_t)der_key_config_max_unlock_attempts, *(unsigned int *)((char *)a1 + 46))|| encode_list_add_data(&v12, (uint64_t)der_key_config_user_uuid, (uint64_t)a1 + 50)|| a2&& (encode_list_add_number(&v12, (uint64_t)der_key_state_assertion_set, *((char *)a1 + 66))|| encode_list_add_number(&v12, (uint64_t)der_key_state_grace_period_enabled, *((char *)a1 + 67))|| encode_list_add_number(&v12, (uint64_t)der_key_lock_time, *(void *)(a1 + 17))|| encode_list_add_number(&v12, (uint64_t)der_key_cx_window, *(void *)(a1 + 19)))|| (uint64_t v10 = 0, v11 = 0, encode_list_dict(&v12, &v10, &v11)))
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = 0;
    *a3 = v10;
    *a4 = v11;
  }
  encode_list_free(&v12);
  return v8;
}

uint64_t decode_extended_state(uint64_t a1, int a2, char *__s)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v7, 0x228uLL);
      v7[4] = der_key_state_lock_state;
      v7[9] = der_key_state_backoff;
      v7[14] = der_key_state_failed_attempts;
      v7[19] = der_key_state_generation_state;
      v7[24] = der_key_state_assertion_set;
      v7[29] = der_key_state_grace_period_enabled;
      v7[34] = der_key_state_recovery_countdown;
      v7[39] = der_key_state_more_state;
      v7[44] = der_key_keybag_handle;
      v7[49] = der_key_config_max_unlock_attempts;
      v7[54] = der_key_config_user_uuid;
      long long v9 = der_key_lock_time;
      uint64_t v10 = der_key_cx_window;
      der_dict_iterate();
      *(_DWORD *)int __s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((void *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 4) = der_get_number();
      *((_DWORD *)__s + 5) = der_get_number();
      *(void *)(__s + 26) = der_get_number();
      *(void *)(__s + 34) = der_get_number();
      *(_DWORD *)(__s + 42) = der_get_number();
      *(_DWORD *)(__s + 46) = der_get_number();
      der_utils_decode_implicit_raw_octet_string_copy(&v8, 4, (uint64_t)(__s + 50), 16);
      __s[66] = der_get_number();
      __s[67] = der_get_number();
      *(void *)(__s + 68) = der_get_number();
      uint64_t number = der_get_number();
      uint64_t result = 0;
      *(void *)(__s + 76) = number;
    }
  }
  return result;
}

uint64_t decode_memento_state(uint64_t a1, int a2, unsigned char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      void *__s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 2) = der_get_number();
      int number = der_get_number();
      uint64_t result = 0;
      *((_DWORD *)__s + 3) = number;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_primary_identity_state(uint64_t a1, int a2, void *__s, void *a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    uint64_t v12 = 0;
    v10[0] = 0u;
    long long v11 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v10[1] = (unint64_t)der_key_group_uuid;
    uint64_t v13 = der_key_uuid;
    der_dict_iterate();
    if (der_utils_decode_implicit_raw_octet_string_copy(v10, 4, (uint64_t)__s, 16)
      && der_utils_decode_implicit_raw_octet_string_copy((long long *)((char *)&v11 + 8), 4, (uint64_t)a4, 16))
    {
      return der_utils_decode_implicit_raw_octet_string_copy(&v15, 4, a5, 16) - 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_fv_blob_state(uint64_t a1, uint64_t a2, _DWORD *__s)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    long long v24 = 0u;
    uint64_t v26 = 0;
    long long v27 = 0u;
    uint64_t v28 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v33 = 0;
    long long v34 = 0u;
    uint64_t v35 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v40 = 0;
    long long v41 = 0u;
    uint64_t v42 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v8 = 0u;
    uint64_t v9 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v15 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
    long long v23 = 0u;
    uint64_t v10 = der_key_id;
    *(void *)&long long v13 = der_key_flags;
    uint64_t v16 = der_key_version;
    *(void *)&long long v19 = der_key_state_reserved;
    uint64_t v22 = der_key_state_failed_attempts;
    long long v25 = der_key_state_failed_attempts_other;
    uint64_t v29 = der_key_config_max_unlock_attempts;
    unsigned int v32 = der_key_state_backoff;
    long long v36 = der_key_state_backoff_other;
    uint64_t v39 = der_key_config_capabilities;
    uint64_t v43 = der_key_state_refcount;
    der_dict_iterate();
    void *__s = der_get_number();
    if (der_utils_decode_implicit_raw_octet_string_copy((long long *)((char *)&v8 + 8), 4, (uint64_t)(__s + 1), 16)&& der_utils_decode_implicit_raw_octet_string_copy(&v12, 4, (uint64_t)(__s + 5), 16)&& (__s[9] = der_get_number(), __s[10] = der_get_number(), __s[11] = der_get_number(), __s[12] = der_get_number(), __s[15] = der_get_number(), __s[13] = der_get_number(), __s[14] = der_get_number(), der_utils_decode_implicit_raw_octet_string_copy_partial((long long *)((char *)&v20 + 8))))
    {
      int v6 = __s[9];
      if ((v6 & 0x400) != 0)
      {
        *((void *)__s + 9) = der_get_number();
        int v6 = __s[9];
      }
      if ((v6 & 0x800) != 0)
      {
        int number = der_get_number();
        uint64_t result = 0;
        __s[20] = number;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_partial(long long *a1)
{
  long long v4 = *a1;
  uint64_t v2 = ccder_blob_decode_range();
  if (v2) {
    *a1 = v4;
  }
  return v2;
}

uint64_t encode_pfk_params_public(int *a1, void *a2, _DWORD *a3)
{
  long long v11 = 0;
  uint64_t v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1 && (int v7 = *a1) != 0)
    {
      if (v7)
      {
        encode_list_cstr_add_data(&v11, "persona_uuid", (uint64_t)(a1 + 1));
        int v7 = *a1;
      }
      if ((v7 & 2) != 0) {
        encode_list_cstr_add_data(&v11, "volume_uuid", (uint64_t)(a1 + 5));
      }
      uint64_t v9 = 0;
      size_t v10 = 0;
      if (!encode_list_dict(&v11, &v9, &v10))
      {
        uint64_t v3 = 0;
        *a2 = v9;
        *a3 = v10;
      }
    }
    else
    {
      uint64_t v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v11);
  return v3;
}

uint64_t decode_pfk_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (der_dict_iterate())
    {
      if (!encode_list_cstr_get_data(&v6, "volume_uuid", __s + 20, 0x10uLL)) {
        *(_DWORD *)__s |= 2u;
      }
      uint64_t v3 = 0;
      if (!encode_list_cstr_get_data(&v6, "persona_uuid", __s + 4, 0x10uLL)) {
        *(_DWORD *)__s |= 1u;
      }
    }
    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

uint64_t encode_fv_params_internal(uint64_t a1, void *a2, _DWORD *a3)
{
  size_t v10 = 0;
  uint64_t v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!encode_list_cstr_add_data(&v10, "options", a1)
        && !encode_list_cstr_add_data(&v10, "kc", a1 + 8))
      {
        uint64_t v8 = 0;
        size_t v9 = 0;
        if (!encode_list_dict(&v10, &v8, &v9))
        {
          uint64_t v3 = 0;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v10);
  return v3;
}

uint64_t decode_fv_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      encode_list_cstr_get_data(&v6, "options", __s, 8uLL);
      encode_list_cstr_get_data(&v6, "kc", __s + 8, 4uLL);
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

void *ref_key_op_der_to_enum(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = der_key_op;
      if (der_key_op)
      {
        der_dict_iterate();
        return 0;
      }
    }
  }
  return v2;
}

uint64_t der_utils_decode_implicit_raw_octet_string_alloc(long long *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  if (a3 && a4)
  {
    uint64_t result = (uint64_t)calloc(0, 1uLL);
    if (!result) {
      return result;
    }
    *a3 = result;
    *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_decode_implicit_uint64(long long *a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0;
  }
  long long v6 = *a1;
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3) {
        *a3 = 0;
      }
      return 1;
    }
  }
  return result;
}

uint64_t _qsort_compare(const void **a1, void **a2)
{
  uint64_t v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  int v2 = memcmp(v5, __s2, 0);
  if (v2 > 0) {
    return 1;
  }
  else {
    return ((v2 < 0) << 31 >> 31);
  }
}

uint64_t platform_get_measurement(uint64_t a1, int a2, void *a3, size_t *a4)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 36, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  if (!lib_platform_callbacks) {
    return 4294967284;
  }
  if (a1 >= 7) {
    abort();
  }
  unsigned int v8 = a1;
  size_t v9 = (char *)&pm_id_table + 72 * a1;
  int v11 = v9[4];
  size_t v10 = v9 + 4;
  if (!v11)
  {
    uint64_t result = ((uint64_t (*)(uint64_t, char *, char *))lib_platform_callbacks)(a1, (char *)&pm_id_table + 72 * a1 + 5, (char *)&pm_id_table + 72 * a1 + 64);
    if (result) {
      return result;
    }
    unsigned char *v10 = 1;
  }
  long long v13 = (char *)&pm_id_table + 72 * a1;
  size_t v15 = *((void *)v13 + 8);
  long long v14 = (unint64_t *)(v13 + 64);
  if (*a4 < v15) {
    return 4294967285;
  }
  memcpy(a3, (char *)&pm_id_table + 72 * v8 + 5, *a4);
  unint64_t v16 = *v14;
  *a4 = *v14;
  if (a2) {
    byte_swap_val((char *)a3, v16);
  }
  return 0;
}

uint64_t platform_rng()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(off_1EF4A94D0[0] != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v0 = off_1EF4A94D0[0];
  return v0();
}

uint64_t platform_read_random(uint64_t a1, unsigned int a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(off_1EF4A94D8 != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v4 = (uint64_t (*)(uint64_t, unsigned int))off_1EF4A94D8;
  return v4(a1, a2);
}

uint64_t platform_pka_get_pub_key(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 78, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A94E0 != 0, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_1EF4A94E0;
  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t platform_pka_ecdh(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 86, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A94E8 != 0, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_1EF4A94E8;
  return v18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 94, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A94F0 != 0, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_1EF4A94F0;
  return v18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sika_attest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 106, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A94F8 != 0, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_1EF4A94F8;
  return v17(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t platform_pka_shared_encrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 115, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9500 != 0, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  long long v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_1EF4A9500;
  return v18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t platform_ref_key_hw_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 123, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9508 != 0, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  size_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))unk_1EF4A9508;
  return v10(a1, a2, a3, a4, a5);
}

uint64_t platform_ref_key_hw_crypt_clear_cache()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 131, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9510 != 0, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v0 = (uint64_t (*)(void))unk_1EF4A9510;
  return v0();
}

uint64_t platform_get_device_id(uint64_t a1, uint64_t a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 139, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9518 != 0, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))unk_1EF4A9518;
  return v4(a1, a2);
}

uint64_t platform_get_aon_security(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 147, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9520 != 0, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_1EF4A9520;
  return v2(a1);
}

uint64_t platform_get_att_sep_chip_rev(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 155, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9528 != 0, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_1EF4A9528;
  return v2(a1);
}

uint64_t platform_get_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 163, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9530 != 0, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_1EF4A9530;
  return v2(a1);
}

uint64_t platform_get_ecid(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9538 != 0, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_1EF4A9538;
  return v2(a1);
}

uint64_t platform_get_board_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 179, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9540 != 0, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_1EF4A9540;
  return v2(a1);
}

uint64_t platform_get_fuse_bits(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 187, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9548 != 0, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_1EF4A9548;
  return v2(a1);
}

uint64_t platform_get_att_board_and_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 195, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_1EF4A9550 != 0, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  int v2 = (uint64_t (*)(uint64_t))unk_1EF4A9550;
  return v2(a1);
}

uint64_t aks_get_pad_size(int a1)
{
  return -a1 & 3;
}

char *aks_copy_packed_data(_DWORD *a1, const void *a2, int a3)
{
  uint64_t v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    int v5 = -a3;
    size_t v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      int __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *aks_pack_data(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = &a9;
  unsigned int v12 = 4;
  if (a3)
  {
    int v13 = a3;
    do
    {
      long long v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  uint64_t result = (char *)calloc(1uLL, v12);
  unint64_t v16 = result;
  uint64_t v22 = (const void **)&a9;
  int v17 = 0;
  if (a3)
  {
    uint64_t v18 = 4;
    do
    {
      long long v19 = v22;
      long long v20 = *v22;
      v22 += 2;
      uint64_t result = aks_copy_packed_data(&v16[v18], v20, *((_DWORD *)v19 + 2));
      uint64_t v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)unint64_t v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t aks_unpack_data(unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 < 4) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = a3;
  if (*a1 >= a3)
  {
    long long v19 = (void **)&a9;
    if (!a3) {
      return 0;
    }
    int v11 = (char *)(a1 + 1);
    while (1)
    {
      unsigned int v12 = v19;
      int v13 = *v19;
      v19 += 2;
      unsigned int v16 = *(_DWORD *)v11;
      long long v14 = v11 + 4;
      size_t v15 = v16;
      if (v16 > a2) {
        break;
      }
      if (v13)
      {
        int v17 = (size_t *)v12[1];
        if (*v17 < v15) {
          return 0xFFFFFFFFLL;
        }
        memcpy(v13, v14, v15);
        size_t *v17 = v15;
      }
      int v11 = &v14[v15];
      if (!--v9) {
        return 0;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

void getkCRKEDUDeviceGroupNameKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getkCRKEDUDeviceGroupNameKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 21, @"%s", dlerror());

  __break(1u);
}

void getkCRKEDUUserIdentifierKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getkCRKEDUUserIdentifierKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 23, @"%s", dlerror());

  __break(1u);
}

void getCRKEDUProfileErrorDomain_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getCRKEDUProfileErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 29, @"%s", dlerror());

  __break(1u);
}

void getCRKEDUProfileErrorFieldKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getCRKEDUProfileErrorFieldKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 30, @"%s", dlerror());

  __break(1u);
}

void getCRKEDUProfileErrorValueKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getCRKEDUProfileErrorValueKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 31, @"%s", dlerror());

  __break(1u);
}

void getkCRKEDUGroupBeaconIDKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getkCRKEDUGroupBeaconIDKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 25, @"%s", dlerror());

  __break(1u);
}

void getkCRKEDUPayloadLeaderCertificateAnchorUUIDKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getkCRKEDUPayloadLeaderCertificateAnchorUUIDKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 27, @"%s", dlerror());

  __break(1u);
}

void getkCRKEDUPayloadMemberCertificateAnchorUUIDKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getkCRKEDUPayloadMemberCertificateAnchorUUIDKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 28, @"%s", dlerror());

  __break(1u);
}

void getkCRKEDUSingleUserIdentifierKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getkCRKEDUSingleUserIdentifierKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 26, @"%s", dlerror());

  __break(1u);
}

void getCRKEDUProfileErrorTopLevelUserIdentifierKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"NSString *getCRKEDUProfileErrorTopLevelUserIdentifierKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 32, @"%s", dlerror());

  __break(1u);
}

void __getCRKEDUPayloadClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v1 = [NSString stringWithUTF8String:"Class getCRKEDUPayloadClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 19, @"Unable to find class %s", "CRKEDUPayload");

  __break(1u);
}

void ClassroomKitLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ClassroomKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MCEDUClassroomPayload.m", 18, @"%s", *a1);

  __break(1u);
  CCHmacFinal(v4, v5);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x1F40C96C0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return (void *)MEMORY[0x1F40D7548](bundle, symbolName);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1F40D7558](bundle, functionName);
}

Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef *error)
{
  return MEMORY[0x1F40D75F8](bundle, error);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x1F40D8A60](userNotification, key, idx);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1F41092C0]();
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1F4109310]();
}

uint64_t DMCHangTracerDirectory()
{
  return MEMORY[0x1F4117018]();
}

uint64_t DMPerformMigrationIfNeeded()
{
  return MEMORY[0x1F41173E8]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x1F40E8700](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8F00](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MDMFilePath()
{
  return MEMORY[0x1F41170A0]();
}

uint64_t MDMSendDevicePostureChangedNotification()
{
  return MEMORY[0x1F412AB78]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MISEnumerateInstalledProvisioningProfiles()
{
  return MEMORY[0x1F4180DB0]();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return MEMORY[0x1F4180DF8]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F930]();
}

uint64_t MKBDeviceGetGracePeriod()
{
  return MEMORY[0x1F412F938]();
}

uint64_t MKBDeviceSetGracePeriod()
{
  return MEMORY[0x1F412F948]();
}

uint64_t MKBGetDeviceConfigurations()
{
  return MEMORY[0x1F412F978]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MKBKeyBagCopyData()
{
  return MEMORY[0x1F412F998]();
}

uint64_t MKBKeyBagCreateEscrowWithAuth()
{
  return MEMORY[0x1F412F9A8]();
}

uint64_t MKBKeyBagEffaceMementoBlob()
{
  return MEMORY[0x1F412F9B8]();
}

uint64_t MKBLockDevice()
{
  return MEMORY[0x1F412F9E0]();
}

uint64_t MKBLockDeviceNow()
{
  return MEMORY[0x1F412F9E8]();
}

uint64_t MKBSetDeviceConfigurations()
{
  return MEMORY[0x1F412F9F8]();
}

uint64_t MKBUnlockDevice()
{
  return MEMORY[0x1F412FA00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t SecCMSDecryptEnvelopedData()
{
  return MEMORY[0x1F40F6A88]();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return MEMORY[0x1F40F6A98]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

uint64_t SecCertificateCopyExtendedKeyUsage()
{
  return MEMORY[0x1F40F6AE8]();
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x1F40F6B00]();
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1F40F6B38]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1F40F6B68](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x1F40F6B90]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x1F40F6BA0]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1F40F6BB8]();
}

uint64_t SecCertificateIsSelfSignedCA()
{
  return MEMORY[0x1F40F6BC0]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1F40F6BD0]();
}

uint64_t SecGenerateCertificateRequestWithParameters()
{
  return MEMORY[0x1F40F6DA8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1F40F6DD0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

uint64_t SecKeyFromPassphraseDataHMACSHA1()
{
  return MEMORY[0x1F40F6F20]();
}

uint64_t SecKeyFromPassphraseDataHMACSHA256()
{
  return MEMORY[0x1F40F6F28]();
}

OSStatus SecKeyGeneratePair(CFDictionaryRef parameters, SecKeyRef *publicKey, SecKeyRef *privateKey)
{
  return MEMORY[0x1F40F6F30](parameters, publicKey, privateKey);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return MEMORY[0x1F40F6F90](pkcs12_data, options, items);
}

uint64_t SecPolicyCreateAppleATVVPNProfileSigning()
{
  return MEMORY[0x1F40F6FD8]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x1F40F7048]();
}

uint64_t SecPolicyCreateConfigurationProfileSigner()
{
  return MEMORY[0x1F40F7050]();
}

uint64_t SecPolicyCreateQAConfigurationProfileSigner()
{
  return MEMORY[0x1F40F7070]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1F40F7220](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1F40F7228](trust);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1F40F7258](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x1F40F7260](trust, anchorCertificatesOnly);
}

uint64_t SecTrustStoreContains()
{
  return MEMORY[0x1F40F72B0]();
}

uint64_t SecTrustStoreCopyUsageConstraints()
{
  return MEMORY[0x1F40F72B8]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x1F40F72C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFHostIsDomainTopLevelForCertificatePolicy()
{
  return MEMORY[0x1F40D56A8]();
}

uint64_t _CFPreferencesCopyPathForManagedDomain()
{
  return MEMORY[0x1F40D8F50]();
}

uint64_t _CFPreferencesManagementStatusChangedForDomains()
{
  return MEMORY[0x1F40D8F88]();
}

uint64_t _CFPreferencesPostValuesChangedInDomains()
{
  return MEMORY[0x1F40D8F90]();
}

uint64_t _CFPreferencesWriteManagedDomain()
{
  return MEMORY[0x1F40D8FE0]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1F40DF0B0]();
}

uint64_t _CTServerConnectionGetManagedCellularProfile()
{
  return MEMORY[0x1F40DF148]();
}

uint64_t _CTServerConnectionLoadManagedCellularProfile()
{
  return MEMORY[0x1F40DF1B8]();
}

uint64_t _CTServerConnectionUnloadManagedCellularProfile()
{
  return MEMORY[0x1F40DF228]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1F40CA228](permset_d, *(void *)&perm);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x1F40CA230](permset_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1F40CA250](acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1F40CA270](obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1F40CA298](path_p, *(void *)&type);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1F40CA2B8](entry_d, permset_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1F40CA2D0](*(void *)&count);
}

int acl_set_fd_np(int fd, acl_t acl, acl_type_t acl_type)
{
  return MEMORY[0x1F40CA2E0](*(void *)&fd, acl, *(void *)&acl_type);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1F40CA300](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1F40CA310](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1F40CA318](entry_d, *(void *)&tag_type);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x1F40CA328](acl, len_p);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1F40CA660](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x1F40CA6B0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1F40CA6B8]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x1F40CA738]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x1F40CA740]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x1F40CA7D0]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x1F40CA7E8]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x1F40CA828]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x1F40CA830]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x1F40CA838]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1F40CA840]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1F40CA848]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x1F40CA858]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x1F40CA860]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x1F40CA868]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x1F40CA870]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1F40CA878]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x1F40CA8B8]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x1F40CA8C8]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x1F40CA8E8]();
}

uint64_t ccder_encode_raw_octet_string()
{
  return MEMORY[0x1F40CA910]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x1F40CA930]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1F40CA938]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x1F40CA948]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x1F40CA960]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x1F40CA970]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1F40CA9B0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1F40CAAB8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1F40CAB00]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1F40CAE28]();
}

uint64_t cchmac()
{
  return MEMORY[0x1F40CAE40]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1F40CAFB0]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1F40CAFE0]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x1F40CB010]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1F40CB330]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1F40CC310](a1, a2, *(void *)&a3);
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x1F40CC3F0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uint64_t lockdown_connect()
{
  return MEMORY[0x1F4180930]();
}

uint64_t lockdown_copy_brickState()
{
  return MEMORY[0x1F4180940]();
}

uint64_t lockdown_copy_identity()
{
  return MEMORY[0x1F4180950]();
}

uint64_t lockdown_copy_value()
{
  return MEMORY[0x1F4180958]();
}

uint64_t lockdown_delete_pair_records()
{
  return MEMORY[0x1F4180960]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x1F4180968]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x1F4180990]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  return MEMORY[0x1F40CCC78](*(void *)&id_type, identifier, identifier_size, uu);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

uint64_t pbkdf2()
{
  return MEMORY[0x1F40F7338]();
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}