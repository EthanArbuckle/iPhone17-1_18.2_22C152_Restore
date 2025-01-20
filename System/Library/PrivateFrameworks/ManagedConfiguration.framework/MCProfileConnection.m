@interface MCProfileConnection
+ (NSArray)features;
+ (id)profileDaemonConnectionErrorWithUnderlyingError:(id)a3;
+ (id)profileInstallationErrorWithUnderlyingError:(id)a3;
+ (id)sharedConnection;
- (BOOL)_areProfilesRestrictingSettings:(id)a3 outMDMName:(id *)a4 outExchangeName:(id *)a5 outExchangeCount:(int64_t *)a6 outProfileName:(id *)a7 outProfileCount:(int64_t *)a8;
- (BOOL)_checkRemoteProcessHasMDMEntitlement;
- (BOOL)_managedMayWriteUnmanagedContacts;
- (BOOL)_openSensitiveURLString:(id)a3 unlock:(BOOL)a4;
- (BOOL)_shouldApplyContactsFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6;
- (BOOL)_shouldApplyContactsFilterForTargetBundleID:(id)a3 targetAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6;
- (BOOL)_unmanagedMayReadManagedContacts;
- (BOOL)activationRecordIndicatesCloudConfigurationIsAvailable;
- (BOOL)activationRecordIndicatesCloudConfigurationIsAvailableAndKeyExists:(BOOL *)a3;
- (BOOL)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 outError:(id *)a4;
- (BOOL)allMarketplacesAllowed;
- (BOOL)anyMarketplaceAllowed;
- (BOOL)applyRestrictionDictionary:(id)a3 appsAndOptions:(id)a4 clientType:(id)a5 clientUUID:(id)a6 localizedClientDescription:(id)a7 localizedWarningMessage:(id)a8 outRestrictionChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outError:(id *)a11;
- (BOOL)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 outRestrictionChanged:(BOOL *)a8 outEffectiveSettingsChanged:(BOOL *)a9 outError:(id *)a10;
- (BOOL)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 outRestrictionChanged:(BOOL *)a10 outEffectiveSettingsChanged:(BOOL *)a11 outError:(id *)a12;
- (BOOL)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 clientType:(id)a5 clientUUID:(id)a6 localizedClientDescription:(id)a7 localizedWarningMessage:(id)a8 outRestrictionChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outError:(id *)a11;
- (BOOL)applySingleAppModeConfiguration:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 outError:(id *)a7;
- (BOOL)areSettingsLockedDownByRestrictions:(id)a3;
- (BOOL)canSendMail:(id)a3 sourceAccountManagement:(int)a4;
- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 outError:(id *)a5;
- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 outError:(id *)a6;
- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 outError:(id *)a5;
- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 outError:(id *)a6;
- (BOOL)checkApplicationIdentifierEntitlement;
- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 outError:(id *)a5;
- (BOOL)clearUserInfoForClientUUIDs:(id)a3;
- (BOOL)cloudConfigIndicatesMDMProfileNeedsToBeInstalled;
- (BOOL)communicationServiceRulesExistForBundleID:(id)a3 forCommunicationServiceType:(id)a4;
- (BOOL)currentPasscodeIsCompliantWithGlobalRestrictionsOutError:(id *)a3;
- (BOOL)currentPasscodeIsCompliantWithProfileRestrictionsOutError:(id *)a3;
- (BOOL)getAreBundlesBlocked:(id *)a3 bundlePaths:(id)a4 outError:(id *)a5;
- (BOOL)getIsBundleBlocked:(BOOL *)a3 bundlePath:(id)a4 outHash:(id *)a5 outHashType:(id *)a6 outError:(id *)a7;
- (BOOL)hasAnyMailAccountIgnoringFiltering;
- (BOOL)hasAppAnalyticsAllowedBeenSet;
- (BOOL)hasAppAndAccessoryAnalyticsAllowedBeenSet;
- (BOOL)hasDiagnosticSubmissionAllowedBeenSet;
- (BOOL)hasHandWashingDataSubmissionAllowedBeenSet;
- (BOOL)hasHealthDataSubmission2BeenSet;
- (BOOL)hasHealthDataSubmissionAllowedBeenSet;
- (BOOL)hasSafetyDataSubmissionAllowedBeenSet;
- (BOOL)hasWheelchairDataSubmissionAllowedBeenSet;
- (BOOL)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5;
- (BOOL)isAccessibilitySpeechAllowed;
- (BOOL)isActivationLockAllowed;
- (BOOL)isActivityContinuationAllowed;
- (BOOL)isAdTrackingLimited;
- (BOOL)isAirDropAllowed;
- (BOOL)isAirDropUnmanagedForced;
- (BOOL)isAirPlayIncomingRequestsAllowed;
- (BOOL)isAirPlayIncomingRequestsPairingPasswordRequired;
- (BOOL)isAirPlayOutgoingRequestsPairingPasswordRequired;
- (BOOL)isAirPlaySecuritySettingsUIAllowed;
- (BOOL)isAirPlaySettingsUIAllowedOutAsk:(BOOL *)a3;
- (BOOL)isAirPrintAllowed;
- (BOOL)isAirPrintCredentialsStorageAllowed;
- (BOOL)isAirPrintTrustedTLSRequirementEnforced;
- (BOOL)isAirPrintiBeaconDiscoveryAllowed;
- (BOOL)isAppAnalyticsAllowed;
- (BOOL)isAppAndAccessoryAnalyticsAllowed;
- (BOOL)isAppCellularDataModificationAllowed;
- (BOOL)isAppClipsAllowed;
- (BOOL)isAppInstallationAllowed;
- (BOOL)isAppManaged:(id)a3;
- (BOOL)isAppRatingLimitInEffect;
- (BOOL)isAppRemovalAllowed;
- (BOOL)isApplePersonalizedAdvertisingAllowed;
- (BOOL)isAssistantUserGeneratedContentAllowed;
- (BOOL)isAttentionAwareAutoLockAllowed;
- (BOOL)isAudioToTextTranscriptionAllowed;
- (BOOL)isAuthenticationBeforeAutoFillRequired;
- (BOOL)isAutoCorrectionAllowed;
- (BOOL)isAutoDimAllowed;
- (BOOL)isAutoUnlockAllowed;
- (BOOL)isAutomaticAppDownloadsAllowed;
- (BOOL)isAutomaticAppUpdatesAllowed;
- (BOOL)isAutomaticAppUpdatesModificationAllowed;
- (BOOL)isAutomaticDateAndTimeEnforced;
- (BOOL)isAutomaticScreenSaverAllowed;
- (BOOL)isAwaitingDeviceConfigured;
- (BOOL)isAwaitingUserConfigured;
- (BOOL)isBidirectionalDataTransferAllowedWithBundleID:(id)a3;
- (BOOL)isBiometricAuthForSignInWithAppleAllowed;
- (BOOL)isBluetoothModificationAllowed;
- (BOOL)isBookstoreAllowed;
- (BOOL)isBookstoreEroticaAllowed;
- (BOOL)isBoolSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isBundleIDAccountBasedForDragDrop:(id)a3;
- (BOOL)isCalculatorInputModeRPNAllowed;
- (BOOL)isCalculatorInputModeUnitConversionAllowed;
- (BOOL)isCalculatorModeBasicAllowed;
- (BOOL)isCalculatorModeMathPaperAllowed;
- (BOOL)isCalculatorModeProgrammerAllowed;
- (BOOL)isCalculatorModeScientificAllowed;
- (BOOL)isCallRecordingAllowed;
- (BOOL)isCameraAllowed;
- (BOOL)isCellularPlanModificationAllowed;
- (BOOL)isChaperoned;
- (BOOL)isClassroomAutomaticClassJoiningForced;
- (BOOL)isClassroomEnabled;
- (BOOL)isClassroomInstructorRoleEnabled;
- (BOOL)isClassroomRequestPermissionToLeaveClassesForced;
- (BOOL)isClassroomStudentRoleEnabled;
- (BOOL)isClassroomUnpromptedAppAndDeviceLockForced;
- (BOOL)isClassroomUnpromptedScreenObservationForced;
- (BOOL)isCloudKeychainSyncAllowed;
- (BOOL)isCloudPrivateRelayAllowed;
- (BOOL)isCloudSyncAllowed:(id)a3;
- (BOOL)isCommandTabAllowed;
- (BOOL)isConferenceRoomDisplayModeEnabledOutAsk:(BOOL *)a3;
- (BOOL)isConferenceRoomDisplaySettingsUIAllowedOutAsk:(BOOL *)a3;
- (BOOL)isContactlessPaymentAllowed;
- (BOOL)isContactsReadAffectedByOpenInRestrictionsForTargetBundleID:(id)a3;
- (BOOL)isContentProtectionInEffect;
- (BOOL)isContinuityPasteboardWithManagedDataAllowed;
- (BOOL)isContinuousPathKeyboardAllowed;
- (BOOL)isControlCenterAllowed;
- (BOOL)isControlCenterAllowedInApps;
- (BOOL)isCoverSheetAllowed;
- (BOOL)isDefaultBrowserModificationAllowed;
- (BOOL)isDefaultBrowserPromptingAllowed;
- (BOOL)isDefinitionLookupAllowed;
- (BOOL)isDeprecatedWebKitSynchronousXHRLoadsAllowed;
- (BOOL)isDeprecatedWebKitTLSAllowed;
- (BOOL)isDeviceNameModificationAllowed;
- (BOOL)isDeviceSleepAllowed;
- (BOOL)isDiagnosticSubmissionAllowed;
- (BOOL)isDiagnosticSubmissionModificationAllowed;
- (BOOL)isDictationAllowed;
- (BOOL)isDriverDoNotDisturbModificationsAllowed;
- (BOOL)isESIMModificationAllowed;
- (BOOL)isESIMOutgoingTransferAllowed;
- (BOOL)isEffectivelyInAppAllowListMode;
- (BOOL)isEnterpriseBookBackupAllowed;
- (BOOL)isEnterpriseBookMetadataSyncAllowed;
- (BOOL)isEphemeralMultiUser;
- (BOOL)isExplicitContentAllowedOutAsk:(BOOL *)a3;
- (BOOL)isExternalDisplayStageManagerAllowed;
- (BOOL)isExternalIntelligenceAllowed;
- (BOOL)isExternalIntelligenceSignInAllowed;
- (BOOL)isFindMyCarAllowed;
- (BOOL)isFindMyDeviceAllowed;
- (BOOL)isFindMyFriendsAllowed;
- (BOOL)isFingerprintForContactlessPaymentAllowed;
- (BOOL)isFingerprintModificationAllowed;
- (BOOL)isFingerprintUnlockAllowed;
- (BOOL)isGameCenterAllowed;
- (BOOL)isGameCenterFriendsSharingModificationAllowed;
- (BOOL)isGameCenterPrivateMessagingAllowed;
- (BOOL)isGameCenterProfileModificationAllowed;
- (BOOL)isGameCenterProfilePrivacyModificationAllowed;
- (BOOL)isGenmojiAllowed;
- (BOOL)isGeotagSharingAllowed;
- (BOOL)isGroupActivityAllowed;
- (BOOL)isHandWashingDataSubmissionAllowed;
- (BOOL)isHashtagImagesAllowed;
- (BOOL)isHealthDataSubmission2Allowed;
- (BOOL)isHealthDataSubmissionAllowed;
- (BOOL)isHidingAppsAllowed;
- (BOOL)isHomeAllowed;
- (BOOL)isHomeScreenEditingAllowed;
- (BOOL)isHomeScreenLayoutApplied;
- (BOOL)isIdentifierForAdvertisingAllowed;
- (BOOL)isImagePlaygroundAllowed;
- (BOOL)isImageWandAllowed;
- (BOOL)isInAppPaymentAllowed;
- (BOOL)isInSingleAppMode;
- (BOOL)isInstalledAppNearMeSuggestionsAllowed;
- (BOOL)isIntersectionSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isKeyboardMathSolvingAllowed;
- (BOOL)isKeyboardShortcutsAllowed;
- (BOOL)isLiveVoicemailAllowed;
- (BOOL)isLocalStorageAllowed;
- (BOOL)isLockScreenControlCenterAllowed;
- (BOOL)isLockScreenNotificationsViewAllowed;
- (BOOL)isLockScreenTodayViewAllowed;
- (BOOL)isLockScreenWiFiModificationAllowed;
- (BOOL)isLockdownModeEnabled;
- (BOOL)isLockingAppsAllowed;
- (BOOL)isMailPrivacyProtectionAllowed;
- (BOOL)isMailSmartRepliesAllowed;
- (BOOL)isMailSummaryAllowed;
- (BOOL)isManagedPasteboardRequired;
- (BOOL)isMarketplaceAllowed:(id)a3;
- (BOOL)isMarketplaceAppInstallationAllowed;
- (BOOL)isMathPaperSolvingAllowed;
- (BOOL)isMediaPurchaseAllowedOutAsk:(BOOL *)a3;
- (BOOL)isMultiUserNewUserCreationAllowed;
- (BOOL)isMultitaskingAllowed;
- (BOOL)isMusicArtistActivityAllowed;
- (BOOL)isMusicServiceAllowed;
- (BOOL)isMusicVideoViewingAllowed;
- (BOOL)isNFCAllowed;
- (BOOL)isNearbyMultiplayerGamingAllowed;
- (BOOL)isNetworkDriveAccessInFilesAllowed;
- (BOOL)isNewsAllowed;
- (BOOL)isNewsTodayAllowed;
- (BOOL)isNotesTranscriptionAllowed;
- (BOOL)isNotesTranscriptionSummaryAllowed;
- (BOOL)isNotificationsModificationAllowedForBundleID:(id)a3;
- (BOOL)isOTAPKIUpdatesAllowed;
- (BOOL)isOnDeviceAppInstallationAllowed;
- (BOOL)isOnDeviceOnlyDictationForced;
- (BOOL)isOnDeviceOnlyTranslationForced;
- (BOOL)isOnenessAllowed;
- (BOOL)isOpenInRestrictionInEffect;
- (BOOL)isParentalControlsAllowPasscodeAccessToNonWhitelistedAppsUIForcedByRestrictions;
- (BOOL)isPasscodeCompliantWithNamedPolicy:(id)a3 outError:(id *)a4;
- (BOOL)isPasscodeModificationAllowed;
- (BOOL)isPasscodeNagDaemonEnabled;
- (BOOL)isPasscodeRecoveryAllowed;
- (BOOL)isPasscodeRecoveryRestricted;
- (BOOL)isPasscodeRequired;
- (BOOL)isPasscodeRequiredByProfiles;
- (BOOL)isPasscodeRequiredToAccessWhitelistedApps;
- (BOOL)isPasscodeSet;
- (BOOL)isPasswordAutoFillAllowed;
- (BOOL)isPasswordProximityAutoFillRequestingAllowed;
- (BOOL)isPasswordSharingAllowed;
- (BOOL)isPersonalHotspotModificationAllowed;
- (BOOL)isPersonalizedHandwritingResultsAllowed;
- (BOOL)isPodcastsAllowed;
- (BOOL)isPredictiveKeyboardAllowed;
- (BOOL)isPreserveESIMOnEraseEnforced;
- (BOOL)isProfileInstalledWithIdentifier:(id)a3 outError:(id *)a4;
- (BOOL)isProfileUIInstallationAllowed;
- (BOOL)isProfileUIInstallationEffectivelyAllowed;
- (BOOL)isProfileWithIdentifier:(id)a3 managedByProfileWithIdentifier:(id)a4;
- (BOOL)isProvisionallyEnrolled;
- (BOOL)isProvisioningProfilesWithUUID:(id)a3 managedByProfileWithIdentifier:(id)a4;
- (BOOL)isProximitySetupToNewDeviceAllowed;
- (BOOL)isQuickNoteAllowed;
- (BOOL)isRCSMessagingAllowed;
- (BOOL)isRadioServiceAllowed;
- (BOOL)isRapidSecurityResponseInstallationAllowed;
- (BOOL)isRapidSecurityResponseRemovalAllowed;
- (BOOL)isRemoteAppPairingAllowed;
- (BOOL)isRemovalRestrictedByPolicyForApp:(id)a3;
- (BOOL)isSafariPasswordAutoFillAllowedForURL:(id)a3;
- (BOOL)isSafariSummaryAllowed;
- (BOOL)isSafetyDataSubmissionAllowed;
- (BOOL)isSatelliteConnectionAllowed;
- (BOOL)isScreenRecordingAllowed;
- (BOOL)isScreenShotAllowed;
- (BOOL)isScreenTimeModificationAllowed;
- (BOOL)isSelectedTextSharingAllowed;
- (BOOL)isSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isSharedDeviceTemporarySessionAllowed;
- (BOOL)isSingleAppModeLogoutAllowed;
- (BOOL)isSiriServerLoggingAllowed;
- (BOOL)isSmartPunctuationAllowed;
- (BOOL)isSoftwareUpdateResisted;
- (BOOL)isSpeakerVolumeLimitModificationAllowed;
- (BOOL)isSpellCheckAllowed;
- (BOOL)isSpotlightAllowed;
- (BOOL)isSpotlightInternetResultsAllowed;
- (BOOL)isSpotlightNewsAllowed;
- (BOOL)isSquareRootOnBasicCalculatorForced;
- (BOOL)isSupervised;
- (BOOL)isSystemAppRemovalAllowed;
- (BOOL)isTVAllowed;
- (BOOL)isTVProviderModificationAllowed;
- (BOOL)isTVShowingUndownloadedMoviesAllowed;
- (BOOL)isTVShowingUndownloadedTVShowsAllowed;
- (BOOL)isTemporarySessionOnlyModeEnabled;
- (BOOL)isTodayViewAllowed;
- (BOOL)isTodayViewModificationAllowed;
- (BOOL)isTranslationLookupAllowed;
- (BOOL)isUIAppInstallationAllowed;
- (BOOL)isURLManaged:(id)a3;
- (BOOL)isUSBDriveAccessAllowed;
- (BOOL)isUSBDriveAccessInFilesAllowed;
- (BOOL)isUSBRestrictedModeAllowed;
- (BOOL)isUninstalledAppNearMeSuggestionsAllowed;
- (BOOL)isUnionSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isUnpairedExternalBootToRecoveryAllowed;
- (BOOL)isVPNCreationAllowed;
- (BOOL)isValueSettingLockedDownByRestrictions:(id)a3;
- (BOOL)isVehicleUIAllowed;
- (BOOL)isVideoConferencingAllowed;
- (BOOL)isVideoConferencingRemoteControlAllowed;
- (BOOL)isVisualIntelligenceSummaryAllowed;
- (BOOL)isWallpaperAllowed;
- (BOOL)isWallpaperModificationAllowed;
- (BOOL)isWebContentFilteringInEffect;
- (BOOL)isWebDistributionAppInstallationAllowed;
- (BOOL)isWebTextDefineAllowed;
- (BOOL)isWheelchairDataSubmissionAllowed;
- (BOOL)isWiFiPasswordSharingAllowed;
- (BOOL)isWiFiPowerModificationAllowed;
- (BOOL)isWiFiWhitelistingEnforced;
- (BOOL)isWiFiWithAllowedNetworksOnlyEnforced;
- (BOOL)isWritingToolsAllowed;
- (BOOL)isiCloudDriveAllowed;
- (BOOL)isiPhoneWidgetsOnMacAllowed;
- (BOOL)isiTunesAllowed;
- (BOOL)mayEnterPasscodeToAccessNonWhitelistedApps;
- (BOOL)mayOpenFromManagedToUnmanaged;
- (BOOL)mayOpenFromUnmanagedToManaged;
- (BOOL)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4;
- (BOOL)mayShareToAirDropOriginatingAccountIsManaged:(BOOL)a3;
- (BOOL)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4;
- (BOOL)mayShareToMessagesOriginatingAccountIsManaged:(BOOL)a3;
- (BOOL)mayShowLocalAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4;
- (BOOL)mayShowLocalAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4;
- (BOOL)mayShowLocalContactsAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4;
- (BOOL)mayShowLocalContactsAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4;
- (BOOL)mustInstallProfileNonInteractively:(id)a3;
- (BOOL)needsCheckIn;
- (BOOL)parentalControlsAllowPasscodeAccessToNonWhitelistedApps;
- (BOOL)passcode:(id)a3 meetsCurrentConstraintsOutError:(id *)a4;
- (BOOL)recoveryPasscodeAvailable;
- (BOOL)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5;
- (BOOL)removeProvisioningProfileWithUUID:(id)a3 outError:(id *)a4;
- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6;
- (BOOL)shouldApplyFilterForTargetBundleID:(id)a3 targetAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6;
- (BOOL)shouldDestroyOldKeybag;
- (BOOL)shouldInstallStoredProfile;
- (BOOL)shouldShowCloudConfigurationUI;
- (BOOL)shouldShowSetupAssistant;
- (BOOL)shouldSkipSetupPanes;
- (BOOL)showProfileErrorUIWithProfileIdentifier:(id)a3 outError:(id *)a4;
- (BOOL)unlockDeviceWithPasscode:(id)a3 outError:(id *)a4;
- (BOOL)wasCloudConfigurationApplied;
- (BOOL)wasTeslaCloudConfigurationApplied;
- (MCProfileConnection)init;
- (NSXPCConnection)publicXPCConnection;
- (NSXPCConnection)xpcConnection;
- (double)temporarySessionTimeout;
- (double)userSessionTimeout;
- (id)_cloudConfigurationRetrievalBlockWithCompletion:(id)a3;
- (id)_disallowedRestrictionErrorForRestrictionKey:(id)a3;
- (id)_handleQueueProfileError:(id)a3 targetDevice:(unint64_t)a4;
- (id)_lacksEntitlementError;
- (id)_localizedCertificateSourceDescriptionFromMDMName:(id)a3 exchangeName:(id)a4 exchangeCount:(int64_t)a5 profileName:(id)a6 profileCount:(int64_t)a7;
- (id)_localizedRestrictionSourceDescriptionFromMDMName:(id)a3 exchangeName:(id)a4 exchangeCount:(int64_t)a5 profileName:(id)a6 profileCount:(int64_t)a7;
- (id)_localizedSourceDescriptionForType:(int64_t)a3 MDMName:(id)a4 exchangeName:(id)a5 exchangeCount:(int64_t)a6 profileName:(id)a7 profileCount:(int64_t)a8;
- (id)_notificationRestrictedApps;
- (id)_queueDataForAcceptance:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 outError:(id *)a7;
- (id)_restrictionEnforcedNotificationSettingsForBundleID:(id)a3 settingsArray:(id)a4;
- (id)_settingsLockedDownByRestrictions:(id)a3;
- (id)_sharedDeviceConfiguration;
- (id)_transmogrifyRestrictionDictionaryForUserEnrollment:(id)a3 outError:(id *)a4;
- (id)acceptedFileExtensions;
- (id)acceptedMIMETypes;
- (id)activationLockBypassHash;
- (id)activationLockBypassKey;
- (id)activeClassroomRoles;
- (id)allClientUUIDsForClientType:(id)a3;
- (id)allowedAppBundleIDsForBidirectionalDataMovementAfterApplyingFilterToBundleIDs:(id)a3 localAppBundleID:(id)a4 localAccountIsManaged:(BOOL)a5;
- (id)allowedExternalIntelligenceAccountDomains;
- (id)allowedExternalIntelligenceWorkspaceIDs;
- (id)allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingAccountIsManaged:(BOOL)a5;
- (id)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5;
- (id)allowedMarketplaces;
- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5;
- (id)appleConnect_installMDMAssociatedProfileData:(id)a3 outError:(id *)a4;
- (id)associatedDomainsForManagedApps;
- (id)autonomousSingleAppModePermittedBundleIDs;
- (id)chaperoneOrganization;
- (id)clearRecoveryPasscode;
- (id)clientRestrictionsForClientUUID:(id)a3;
- (id)cloudConfigurationDetails;
- (id)companionBundleIDToWatchBundleIDsMap;
- (id)crossSiteTrackingPreventionRelaxedApps;
- (id)crossSiteTrackingPreventionRelaxedDomains;
- (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4;
- (id)defaultParametersForBoolSetting:(id)a3;
- (id)defaultParametersForIntersectionSetting:(id)a3;
- (id)defaultParametersForUnionSetting:(id)a3;
- (id)defaultParametersForValueSetting:(id)a3;
- (id)defaultUserBookmarks;
- (id)defaultValueForSetting:(id)a3;
- (id)defaultValuesForIntersectionSetting:(id)a3;
- (id)defaultValuesForUnionSetting:(id)a3;
- (id)deniedMarketplaces;
- (id)deviceAssetTag;
- (id)deviceDepartmentName;
- (id)deviceLockScreenFootnote;
- (id)deviceOrganizationAddress;
- (id)deviceOrganizationAddressLine1;
- (id)deviceOrganizationAddressLine2;
- (id)deviceOrganizationAddressLine3;
- (id)deviceOrganizationCity;
- (id)deviceOrganizationCountry;
- (id)deviceOrganizationName;
- (id)deviceOrganizationRegion;
- (id)deviceOrganizationVendorID;
- (id)deviceOrganizationZipCode;
- (id)deviceProvisionalEnrollmentFootnote;
- (id)diagnosticsUploadURL;
- (id)doNotBackupAppIDs;
- (id)effectiveBlockedAppBundleIDsExcludingRemovedSystemApps;
- (id)effectiveParametersForBoolSetting:(id)a3;
- (id)effectiveParametersForBoolSetting:(id)a3 configurationUUID:(id)a4;
- (id)effectiveParametersForIntersectionSetting:(id)a3;
- (id)effectiveParametersForUnionSetting:(id)a3;
- (id)effectiveParametersForValueSetting:(id)a3;
- (id)effectiveRestrictions;
- (id)effectiveRestrictionsForPairedDevice;
- (id)effectiveUserSettings;
- (id)effectiveValueForSetting:(id)a3;
- (id)effectiveValueForWatchSetting:(id)a3 pairedDevice:(id)a4;
- (id)effectiveValueForWatchSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5;
- (id)effectiveValuesForIntersectionSetting:(id)a3;
- (id)effectiveValuesForUnionSetting:(id)a3;
- (id)effectiveValuesForWatchIntersectionSetting:(id)a3 pairedDevice:(id)a4;
- (id)effectiveValuesForWatchIntersectionSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5;
- (id)effectiveValuesForWatchUnionSetting:(id)a3 pairedDevice:(id)a4;
- (id)effectiveValuesForWatchUnionSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5;
- (id)effectiveWhitelistedAppBundleIDs;
- (id)effectiveWhitelistedAppsAndOptions;
- (id)errorCheckedSetBoolValue:(BOOL)a3 forSetting:(id)a4;
- (id)fetchActivationLockBypassKeyWithError:(id *)a3;
- (id)filteredMailSheetAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4;
- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5;
- (id)filteredOpenInContactsAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5;
- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5;
- (id)filteredOpenInOriginatingContactsAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5;
- (id)getMachineInfo;
- (id)getMachineInfoWithAdditionalInfo:(id)a3;
- (id)getReducedMachineInfo;
- (id)installProfileData:(id)a3 options:(id)a4 outError:(id *)a5;
- (id)installProfileData:(id)a3 outError:(id *)a4;
- (id)installedConfigurationProfileInfoWithOutMDMProfileInfo:(id *)a3;
- (id)installedMDMProfileIdentifier;
- (id)installedProfileDataWithIdentifier:(id)a3;
- (id)installedProfileIdentifiers;
- (id)installedProfileIdentifiersInstalledBy:(id)a3;
- (id)installedProfileIdentifiersWithFilterFlags:(int)a3;
- (id)installedProfileWithIdentifier:(id)a3;
- (id)installedProfilesInstalledBy:(id)a3;
- (id)installedProfilesWithFilterFlags:(int)a3;
- (id)installedSystemProfileDataWithIdentifier:(id)a3;
- (id)installedSystemProfileWithIdentifier:(id)a3;
- (id)installedUserProfileDataWithIdentifier:(id)a3;
- (id)installedUserProfileWithIdentifier:(id)a3;
- (id)knownAirPrintIPPURLStrings;
- (id)listInstalledProvisioningProfileUUIDsWithManagedOnly:(BOOL)a3;
- (id)localizedDescriptionOfCurrentPasscodeConstraints;
- (id)localizedDescriptionOfDefaultNewPasscodeConstraints;
- (id)localizedRestrictionSourceDescriptionForFeatures:(id)a3;
- (id)lockedDownRootCertificatesWithOutLocalizedSourceDescription:(id *)a3;
- (id)managedAppBundleIDs;
- (id)managedAppIDs;
- (id)managedEmailDomains;
- (id)managedSystemConfigurationServiceIDs;
- (id)managedWiFiNetworkNames;
- (id)managingOrganizationForFontAtURL:(id)a3;
- (id)managingOrganizationInformation;
- (id)objectRestrictionForFeature:(id)a3;
- (id)parametersForBoolSetting:(id)a3;
- (id)parametersForIntersectionSetting:(id)a3;
- (id)parametersForUnionSetting:(id)a3;
- (id)parametersForValueSetting:(id)a3;
- (id)parentalControlsBlockedAppBundleIDs;
- (id)parentalControlsWhitelistedAppBundleIDs;
- (id)passcodeCreationDate;
- (id)passcodeExpiryDate;
- (id)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3;
- (id)permittedAutoLockSeconds;
- (id)popProfileDataFromHeadOfInstallationQueue;
- (id)provisionalEnrollmentExpirationDate;
- (id)provisiongProfileUUIDsForSignerIdentity:(id)a3;
- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 outError:(id *)a6;
- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 outError:(id *)a5;
- (id)recoveryPasscodeExpiryDate;
- (id)removedSystemAppBundleIDs;
- (id)requestEffectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 completion:(id)a6;
- (id)restrictedAppBundleIDsExcludingRemovedSystemApps;
- (id)restrictionEnforcedBlockedAppBundleIDs;
- (id)restrictionEnforcedHomeScreenLayout;
- (id)restrictionEnforcedNotificationSettings;
- (id)restrictionEnforcedNotificationSettingsForBundleID:(id)a3;
- (id)restrictionEnforcedWhitelistedAppBundleIDs;
- (id)setPasscodeRecoveryAllowed:(BOOL)a3;
- (id)skipSetupKeys;
- (id)trustedCodeSigningIdentities;
- (id)tvProviderUserToken;
- (id)uninstalledProfileDataWithIdentifier:(id)a3 targetDevice:(unint64_t)a4;
- (id)uninstalledProfileIdentifiersForDevice:(unint64_t)a3;
- (id)unverifiedInstalledMDMProfileIdentifier;
- (id)updateProfileWithIdentifier:(id)a3 outError:(id *)a4;
- (id)userBookmarks;
- (id)userInfoForClientUUID:(id)a3;
- (id)userSettingsForCurrentUser;
- (id)userSettingsForPairedDevice;
- (id)userSettingsForSystem;
- (id)userValueForIntersectionSetting:(id)a3;
- (id)userValueForSetting:(id)a3;
- (id)userValueForUnionSetting:(id)a3;
- (id)valueForFeature:(id)a3;
- (id)valueRestrictionForFeature:(id)a3;
- (int)BOOLRestrictionForFeature:(id)a3;
- (int)_getPasscodeComplianceWarningExpiryDate:(id)a3 lastLockDate:(id)a4 outLocalizedTitle:(id *)a5 outLocalizedMessage:(id *)a6;
- (int)appWhitelistState;
- (int)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 complianceBlocking:(int)a8 displayImmediateAlert:(BOOL)a9 limitForUserEnrollment:(BOOL)a10 outRestrictionChanged:(BOOL *)a11 outEffectiveSettingsChanged:(BOOL *)a12 outError:(id *)a13;
- (int)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 complianceBlocking:(int)a8 displayImmediateAlert:(BOOL)a9 outRestrictionChanged:(BOOL *)a10 outEffectiveSettingsChanged:(BOOL *)a11 outError:(id *)a12;
- (int)defaultBoolValueForSetting:(id)a3;
- (int)defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)effectiveBoolValueForSetting:(id)a3;
- (int)effectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 outAsk:(BOOL *)a5;
- (int)effectiveBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4;
- (int)effectiveBoolValueForWatchSetting:(id)a3 pairedDevice:(id)a4;
- (int)effectiveBoolValueForWatchSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5;
- (int)effectiveRestrictedBoolValueForSetting:(id)a3;
- (int)getPasscodeComplianceWarningLastLockDate:(id)a3 outLocalizedTitle:(id *)a4 outLocalizedMessage:(id *)a5;
- (int)hostMayPairWithOptions:(id)a3 challenge:(id)a4;
- (int)minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)newPasscodeEntryScreenType;
- (int)newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)recoveryPasscodeUnlockScreenType;
- (int)recoveryPasscodeUnlockScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)requestEffectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 outError:(id *)a6;
- (int)restrictedBoolValueForFeature:(id)a3;
- (int)unlockScreenType;
- (int)unlockScreenTypeForPasscode:(id)a3 outSimplePasscodeType:(int *)a4;
- (int)unlockScreenTypeForUser:(id)a3 outSimplePasscodeType:(int *)a4;
- (int)unlockScreenTypeWithOutSimplePasscodeType:(int *)a3;
- (int)userBoolValueForSetting:(id)a3;
- (int)userMode;
- (int64_t)allowedGameCenterPlayerTypes;
- (int64_t)dragDropBidirectionalManagementStateForBaseBundleID:(id)a3;
- (int64_t)dragDropSourceManagementStateForBundleID:(id)a3;
- (int64_t)dragDropTargetManagementStateForBundleID:(id)a3;
- (int64_t)softwareUpdatePath;
- (unint64_t)enforcedSoftwareUpdateDelayInDays;
- (unint64_t)gracePeriod;
- (void)__checkForProfiledCrash;
- (void)_appWhitelistDidChange:(id)a3;
- (void)_applyToObservers:(id)a3;
- (void)_createAndResumePublicXPCConnection;
- (void)_createAndResumeXPCConnection;
- (void)_defaultsDidChange;
- (void)_destroyPublicXPCConnectionAndInvalidate:(BOOL)a3;
- (void)_destroyXPCConnectionAndInvalidate:(BOOL)a3;
- (void)_detectProfiledCrashes;
- (void)_effectiveSettingsDidChange:(id)a3;
- (void)_internalDefaultsDidChange;
- (void)_passcodeDidChange;
- (void)_passcodePolicyDidChange;
- (void)_profileListDidChange;
- (void)_queueCreateAndResumePublicXPCConnection;
- (void)_queueCreateAndResumeXPCConnection;
- (void)_queueDataForAcceptance:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7;
- (void)_restrictionDidChange;
- (void)_setAllowedGrandfatheredRestrictionFeature:(id)a3 forRestrictionKey:(id)a4;
- (void)addActiveClassroomRole:(id)a3;
- (void)allProfilesOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 forDeviceType:(unint64_t)a6;
- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6;
- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4;
- (void)cancelRequestEffectiveBoolValue:(id)a3 completion:(id)a4;
- (void)cancelUserInputResponses;
- (void)checkCarrierProfile;
- (void)checkCarrierProfileForceInstallation:(BOOL)a3;
- (void)checkIn;
- (void)checkInAsynchronously;
- (void)checkInIfNeeded;
- (void)checkInWithCompletion:(id)a3;
- (void)clearRecoveryPasscodeWithCompletion:(id)a3;
- (void)cloudConfigurationUIDidCompleteWasApplied:(BOOL)a3;
- (void)cloudConfigurationUIDidCompleteWasApplied:(BOOL)a3 completionHandler:(id)a4;
- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6;
- (void)deleteActivationLockBypassKey;
- (void)doMCICDidBeginInstallingNextProfileData:(id)a3 completion:(id)a4;
- (void)doMCICDidFinishInstallationWithIdentifier:(id)a3 error:(id)a4 completion:(id)a5;
- (void)doMCICDidFinishPreflightWithError:(id)a3 completion:(id)a4;
- (void)doMCICDidRequestCurrentPasscodeWithCompletion:(id)a3;
- (void)doMCICDidRequestMAIDSignIn:(id)a3 personaID:(id)a4 completion:(id)a5;
- (void)doMCICDidRequestManagedRestoreWithManagedAppleID:(id)a3 personaID:(id)a4 completion:(id)a5;
- (void)doMCICDidRequestShowUserWarnings:(id)a3 completion:(id)a4;
- (void)doMCICDidRequestUserInput:(id)a3 completion:(id)a4;
- (void)doMCICDidUpdateStatus:(id)a3 completion:(id)a4;
- (void)doMCICWaitForEnrollmentToFinishWithCompletion:(id)a3;
- (void)enrollProvisionallyWithNonce:(id)a3 completionBlock:(id)a4;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4;
- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3;
- (void)flush;
- (void)forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock:(id)a3;
- (void)getPasscodeComplianceWarningLastLockDate:(id)a3 completionBlock:(id)a4;
- (void)installProfileData:(id)a3 interactionDelegate:(id)a4;
- (void)installProfileData:(id)a3 options:(id)a4 interactionDelegate:(id)a5;
- (void)installProfileDataStoredForPurpose:(int)a3 completionBlock:(id)a4;
- (void)installProfileDataStoredForPurpose:(int)a3 extraOptions:(id)a4 completionBlock:(id)a5;
- (void)installStoredProfileDataWithCompletion:(id)a3;
- (void)installStoredProfileDataWithExtraOptions:(id)a3 completion:(id)a4;
- (void)invalidateRestrictionCache;
- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4;
- (void)lockDevice;
- (void)lockDeviceImmediately:(BOOL)a3;
- (void)lockdownDidReceiveActivationRecord:(id)a3;
- (void)markStoredProfileAsInstalled;
- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4;
- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5;
- (void)notifyClientsToRecomputeCompliance;
- (void)notifyDeviceUnlocked;
- (void)notifyDeviceUnlockedAndPasscodeRequired;
- (void)notifyUserHasSeenComplianceMessageWithLastLockDate:(id)a3;
- (void)parentalControlsSetAllowPasscodeAccessToNonWhitelistedApps:(BOOL)a3;
- (void)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4;
- (void)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 completion:(id)a6;
- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3;
- (void)recomputeUserComplianceWarning;
- (void)recomputeUserComplianceWarningSynchronously;
- (void)registerObserver:(id)a3;
- (void)removeActiveClassroomRole:(id)a3;
- (void)removeBoolSetting:(id)a3;
- (void)removeExpiredProfiles;
- (void)removeOrphanedClientRestrictions;
- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3;
- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3;
- (void)removeProfileAsyncWithIdentifier:(id)a3;
- (void)removeProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4;
- (void)removeProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)removeProfileWithIdentifier:(id)a3;
- (void)removeProfileWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)removeProtectedProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4;
- (void)removeProtectedProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3;
- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6;
- (void)removeValueSetting:(id)a3;
- (void)rereadManagedAppAttributes;
- (void)resetAllSettingsToDefaults;
- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4;
- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5;
- (void)resetPasscodeMetadataWithCompletion:(id)a3;
- (void)respondToCurrentPasscodeRequestContinue:(BOOL)a3 passcode:(id)a4;
- (void)respondToMAIDAuthenticationRequest:(BOOL)a3 error:(id)a4 isCancelled:(BOOL)a5;
- (void)respondToManagedRestoreRequest:(BOOL)a3 error:(id)a4 isCancelled:(BOOL)a5;
- (void)respondToWarningsContinueInstallation:(BOOL)a3;
- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3;
- (void)retrieveAndStoreCloudConfigurationDetailsCompletionBlock:(id)a3;
- (void)retrieveCloudConfigurationDetailsCompletionBlock:(id)a3;
- (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 additionalMachineInfo:(id)a7 completionBlock:(id)a8;
- (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 completionBlock:(id)a7;
- (void)retrieveCloudConfigurationWithoutValidationCompletionBlock:(id)a3;
- (void)setActiveClassroomRoles:(id)a3;
- (void)setActivityContinuationAllowed:(BOOL)a3;
- (void)setAirPlaySecuritySettingsUIAllowed:(BOOL)a3;
- (void)setAirPlaySettingsUIAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5;
- (void)setAllowedGrandfatheredRestrictionBoolFeature:(id)a3;
- (void)setAllowedGrandfatheredRestrictionIntersectionFeature:(id)a3;
- (void)setAllowedGrandfatheredRestrictionUnionFeature:(id)a3;
- (void)setAllowedGrandfatheredRestrictionValueFeature:(id)a3;
- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8;
- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 completion:(id)a9;
- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 waitUntilCompleted:(BOOL)a9 completion:(id)a10;
- (void)setAutoCorrectionAllowed:(BOOL)a3;
- (void)setAutomaticAppUpdatesAllowed:(BOOL)a3;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9 completion:(id)a10;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9 credentialSet:(id)a10 waitUntilCompleted:(BOOL)a11 completion:(id)a12;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 passcode:(id)a6;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 passcode:(id)a6 completion:(id)a7;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 completion:(id)a9;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 errorCompletionBlock:(id)a5;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 passcode:(id)a5;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 passcode:(id)a5 completion:(id)a6;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 completion:(id)a8;
- (void)setClassroomInstructorRoleEnabled:(BOOL)a3;
- (void)setClassroomStudentRoleEnabled:(BOOL)a3;
- (void)setConferenceRoomDisplayModeEnabled:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5;
- (void)setConferenceRoomDisplaySettingsUIAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5;
- (void)setContinuousPathKeyboardAllowed:(BOOL)a3;
- (void)setDriverDoNotDisturbModificationsAllowed:(BOOL)a3;
- (void)setExplicitContentAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5;
- (void)setExternalIntelligenceAllowed:(BOOL)a3;
- (void)setFindMyCarAllowed:(BOOL)a3;
- (void)setFingerprintUnlockAllowed:(BOOL)a3 credentialSet:(id)a4 completionBlock:(id)a5;
- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4;
- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4 completion:(id)a5;
- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4 completionBlock:(id)a5;
- (void)setGracePeriod:(unint64_t)a3 passcode:(id)a4 completionBlock:(id)a5;
- (void)setHandWashingDataSubmissionAllowed:(BOOL)a3;
- (void)setHealthDataSubmission2Allowed:(BOOL)a3;
- (void)setHealthDataSubmissionAllowed:(BOOL)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setKeyboardShortcutsAllowed:(BOOL)a3;
- (void)setManagedEmailDomains:(id)a3;
- (void)setMediaPurchaseAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5;
- (void)setMultitaskingAllowed:(BOOL)a3;
- (void)setParameters:(id)a3 forBoolSetting:(id)a4;
- (void)setParameters:(id)a3 forValueSetting:(id)a4;
- (void)setParametersForSettingsByType:(id)a3;
- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 waitUntilCompleted:(BOOL)a9 completion:(id)a10;
- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 waitUntilCompleted:(BOOL)a9 errorCompletionBlock:(id)a10;
- (void)setParametersForSettingsByType:(id)a3 passcode:(id)a4;
- (void)setParametersForSettingsByType:(id)a3 passcode:(id)a4 completion:(id)a5;
- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5;
- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6;
- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6 completion:(id)a7;
- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6 waitUntilCompleted:(BOOL)a7 completion:(id)a8;
- (void)setParentalControlsBlockedAppBundleIDs:(id)a3;
- (void)setParentalControlsWhitelistedAppBundleIDs:(id)a3;
- (void)setPasscodeRecoveryAllowed:(BOOL)a3 completionBlock:(id)a4;
- (void)setPasscodeRecoveryAllowed:(BOOL)a3 passcode:(id)a4;
- (void)setPasscodeRecoveryAllowed:(BOOL)a3 passcode:(id)a4 completionBlock:(id)a5;
- (void)setPredictiveKeyboardAllowed:(BOOL)a3;
- (void)setRemoteAppPairingAllowed:(BOOL)a3;
- (void)setSafetyDataSubmissionAllowed:(BOOL)a3;
- (void)setSmartPunctuationAllowed:(BOOL)a3;
- (void)setSpellCheckAllowed:(BOOL)a3;
- (void)setTVAllowed:(BOOL)a3;
- (void)setTVProviderModificationAllowed:(BOOL)a3;
- (void)setTVShowingUndownloadedMoviesAllowed:(BOOL)a3;
- (void)setTVShowingUndownloadedTVShowsAllowed:(BOOL)a3;
- (void)setTrustedCodeSigningIdentities:(id)a3;
- (void)setUserBookmarks:(id)a3;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4;
- (void)setValue:(id)a3 forSetting:(id)a4;
- (void)setValue:(id)a3 forSetting:(id)a4 passcode:(id)a5;
- (void)setValue:(id)a3 forSetting:(id)a4 passcode:(id)a5 completion:(id)a6;
- (void)setValue:(id)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6;
- (void)setValue:(id)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7;
- (void)setValues:(id)a3 forIntersectionSetting:(id)a4;
- (void)setValues:(id)a3 forIntersectionSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6;
- (void)setValues:(id)a3 forUnionSetting:(id)a4;
- (void)setValues:(id)a3 forUnionSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6;
- (void)setWebContentFilterAutoPermittedURLStrings:(id)a3;
- (void)setWebContentFilterUserBlacklistedURLStrings:(id)a3;
- (void)setWheelchairDataSubmissionAllowed:(BOOL)a3;
- (void)setupAssistantDidFinish;
- (void)setupAssistantDidFinishWithCompletion:(id)a3;
- (void)shutDown;
- (void)shutDownWithCompletion:(id)a3;
- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9;
- (void)startMonitoringEnrollmentStateWithPersonaID:(id)a3;
- (void)stopMonitoringEnrollmentState;
- (void)storeCertificateData:(id)a3 forHostIdentifier:(id)a4;
- (void)storeCloudConfigurationDetails:(id)a3;
- (void)storeCloudConfigurationDetails:(id)a3 completion:(id)a4;
- (void)storeCloudConfigurationDetails:(id)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5;
- (void)storeProfileData:(id)a3;
- (void)storeProfileData:(id)a3 completion:(id)a4;
- (void)storeProfileData:(id)a3 configurationSource:(int)a4 purpose:(int)a5 completionBlock:(id)a6;
- (void)storedProfileDataWithCompletion:(id)a3;
- (void)submitUserInputResponses:(id)a3;
- (void)unenrollWithCompletionBlock:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3;
- (void)updateCloudConfigWithSupervision:(BOOL)a3 replaceExistingConfig:(BOOL)a4 completion:(id)a5;
- (void)updateCloudConfigurationWithLastPushTokenHash:(id)a3;
- (void)updateCloudConfigurationWithRMAccountIdentifier:(id)a3;
- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4;
- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4;
- (void)validateAppBundleIDs:(id)a3;
- (void)validateAppBundleIDs:(id)a3 completion:(id)a4;
- (void)validateAppBundleIDs:(id)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5;
- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4;
- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5;
@end

@implementation MCProfileConnection

- (BOOL)isExplicitContentAllowedOutAsk:(BOOL *)a3
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowExplicitContent" outAsk:a3] != 2;
}

- (BOOL)isImageWandAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowImageWand"] != 2;
}

- (BOOL)isOnDeviceAppInstallationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppInstallation"] != 2&& [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowUIAppInstallation"] != 2;
}

- (BOOL)isCloudSyncAllowed:(id)a3
{
  id v4 = a3;
  if ([(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCloudDocumentSync"] == 2)
  {
    char v5 = 0;
  }
  else if ([(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowManagedAppsCloudSync"] == 2)
  {
    v6 = [MEMORY[0x1E4F73178] attributesByAppID];
    v7 = [v6 allKeys];
    char v8 = [v7 containsObject:v4];

    char v5 = v8 ^ 1;
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)isActivityContinuationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowActivityContinuation"] != 2;
}

- (BOOL)isNewsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowNews"] != 2;
}

- (BOOL)isDiagnosticSubmissionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDiagnosticSubmission"] == 1;
}

- (BOOL)isHealthDataSubmissionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowHealthDataSubmission"] == 1;
}

- (int)effectiveBoolValueForSetting:(id)a3
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:a3 outAsk:0];
}

+ (id)sharedConnection
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedConnection_connection)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)sharedConnection_connection;
    sharedConnection_connection = v3;
  }
  objc_sync_exit(v2);

  char v5 = (void *)sharedConnection_connection;
  return v5;
}

- (int)effectiveBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4
{
  id v6 = a3;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    int v7 = 0;
  }
  else
  {
    char v8 = [(MCProfileConnection *)self effectiveParametersForBoolSetting:v6];
    v9 = [v8 objectForKeyedSubscript:@"value"];
    v10 = v9;
    if (v9)
    {
      if ([v9 BOOLValue])
      {
        if (a4)
        {
          v11 = [v8 objectForKeyedSubscript:@"ask"];
          *a4 = [v11 BOOLValue];
        }
        int v7 = 1;
      }
      else
      {
        int v7 = 2;
      }
    }
    else
    {
      int v7 = 0;
    }
  }
  return v7;
}

- (void)checkInIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    uint64_t v3 = mach_absolute_time();
    [(MCProfileConnection *)self checkIn];
    uint64_t v4 = mach_absolute_time();
    double v5 = _MCMachTimeToSeconds(v4 - v3);
    if (v5 > 0.01)
    {
      id v6 = qword_1EB2223B0;
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134217984;
        double v8 = v5;
        _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "A call was blocked for a significant time waiting for ManagedConfiguration migration to complete. checkInIfNeeded time elapsed: %f", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (BOOL)needsCheckIn
{
  if (MCHasMigrated()) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.datamigrator"];

  if (v4)
  {
    double v5 = qword_1EB2223B0;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v6) {
      return result;
    }
    __int16 v12 = 0;
    double v8 = "Not blocking for migration because we're running inside the data migrator.";
    uint64_t v9 = (uint8_t *)&v12;
    goto LABEL_8;
  }
  if (!MCIsDaemonProcess) {
    return 1;
  }
  double v5 = qword_1EB2223B0;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v10)
  {
    __int16 v11 = 0;
    double v8 = "Not blocking for migration because we're running inside profiled.";
    uint64_t v9 = (uint8_t *)&v11;
LABEL_8:
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    return 0;
  }
  return result;
}

- (id)effectiveParametersForBoolSetting:(id)a3 configurationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  double v8 = +[MCRestrictionManager sharedManager];
  uint64_t v9 = [v8 effectiveParametersForBoolSetting:v7 configurationUUID:v6];

  return v9;
}

- (id)effectiveParametersForBoolSetting:(id)a3
{
  return [(MCProfileConnection *)self effectiveParametersForBoolSetting:a3 configurationUUID:0];
}

- (BOOL)isSupervised
{
  [(MCProfileConnection *)self checkInIfNeeded];
  v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 isSupervised];

  return v3;
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9 credentialSet:(id)a10 waitUntilCompleted:(BOOL)a11 completion:(id)a12
{
  BOOL v30 = a7;
  BOOL v31 = a8;
  BOOL v28 = a4;
  BOOL v13 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a12;
  id v17 = a10;
  id v18 = a9;
  id v19 = a6;
  v29 = self;
  [(MCProfileConnection *)self checkInIfNeeded];
  v20 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    v21 = @"NO";
    if (v13) {
      v21 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    v37 = v21;
    __int16 v38 = 2114;
    id v39 = v15;
    _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_DEFAULT, "Set Bool value %{public}@ for settings: %{public}@", buf, 0x16u);
  }
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  v23 = [MEMORY[0x1E4F28ED0] numberWithBool:v13];
  [v22 setObject:v23 forKeyedSubscript:@"value"];

  if (v13)
  {
    v24 = [MEMORY[0x1E4F28ED0] numberWithBool:v28];
    [v22 setObject:v24 forKeyedSubscript:@"ask"];
  }
  else
  {
    [v22 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ask"];
  }
  v33 = v22;
  v34 = @"restrictedBool";
  id v32 = v15;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v35 = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  LOBYTE(v27) = a11;
  [(MCProfileConnection *)v29 setParametersForSettingsByType:v26 configurationUUID:v19 toSystem:v30 user:v31 passcode:v18 credentialSet:v17 waitUntilCompleted:v27 completion:v16];
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 waitUntilCompleted:(BOOL)a9 completion:(id)a10
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  id v17 = a10;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __149__MCProfileConnection_Settings__setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_waitUntilCompleted_completion___block_invoke;
  v25[3] = &unk_1E5A68118;
  id v26 = v17;
  id v18 = v17;
  id v19 = a8;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  v23 = (void *)MEMORY[0x1A6232FE0](v25);
  LOBYTE(v24) = a9;
  [(MCProfileConnection *)self setParametersForSettingsByType:v22 configurationUUID:v21 toSystem:v13 user:v12 passcode:v20 credentialSet:v19 waitUntilCompleted:v24 errorCompletionBlock:v23];
}

uint64_t __40__MCProfileConnection_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void __149__MCProfileConnection_Settings__setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = (void *)qword_1EB2223B0;
    if (!os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    double v5 = v4;
    id v6 = [v3 MCVerboseDescription];
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Set parameters for settings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  else
  {
    double v5 = +[MCRestrictionManager sharedManager];
    [v5 invalidateSettings];
  }

LABEL_6:
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void __27__MCProfileConnection_init__block_invoke_18(uint64_t a1)
{
  v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received settings changed notification", buf, 2u);
  }
  int v3 = MCIsDaemonProcess;
  int v4 = qword_1EB2223B0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating cache because we're running inside profiled.", v9, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Invalidating cache", v8, 2u);
    }
    id v6 = +[MCRestrictionManager sharedManager];
    [v6 invalidateSettings];
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"com.apple.managedconfiguration.settingschanged" object:*(void *)(a1 + 32)];
}

- (MCProfileConnection)init
{
  MCLoggingInitialize();
  v156.receiver = self;
  v156.super_class = (Class)MCProfileConnection;
  int v3 = [(MCProfileConnection *)&v156 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MCProfileConnection._xpcConnectionSyncQueue", 0);
    xpcConnectionSyncQueue = v3->_xpcConnectionSyncQueue;
    v3->_xpcConnectionSyncQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MCProfileConnection._publicXPCConnectionSyncQueue", 0);
    publicXPCConnectionSyncQueue = v3->_publicXPCConnectionSyncQueue;
    v3->_publicXPCConnectionSyncQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MCProfileConnection._shutDownSerialQueue", 0);
    shutDownSerialQueue = v3->_shutDownSerialQueue;
    v3->_shutDownSerialQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MCProfileConnection._notificationSyncQueue", 0);
    notificationSyncQueue = v3->_notificationSyncQueue;
    v3->_notificationSyncQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    notificationTokens = v3->_notificationTokens;
    v3->_notificationTokens = v14;

    int out_token = 0;
    id v16 = (const char *)[@"com.apple.managedconfiguration.restrictionchanged" cStringUsingEncoding:4];
    id v17 = notificationQueue();
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __27__MCProfileConnection_init__block_invoke;
    handler[3] = &unk_1E5A65D28;
    id v18 = v3;
    v154 = v18;
    notify_register_dispatch(v16, &out_token, v17, handler);

    id v19 = v3->_notificationTokens;
    id v20 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v19 addObject:v20];

    id v21 = (const char *)[@"com.apple.managedconfiguration.passcodechanged" cStringUsingEncoding:4];
    id v22 = notificationQueue();
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __27__MCProfileConnection_init__block_invoke_13;
    v151[3] = &unk_1E5A65D28;
    v23 = v18;
    v152 = v23;
    notify_register_dispatch(v21, &out_token, v22, v151);

    uint64_t v24 = v3->_notificationTokens;
    v25 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v24 addObject:v25];

    id v26 = (const char *)[@"PINPolicyChangedNotification" cStringUsingEncoding:4];
    uint64_t v27 = notificationQueue();
    v149[0] = MEMORY[0x1E4F143A8];
    v149[1] = 3221225472;
    v149[2] = __27__MCProfileConnection_init__block_invoke_14;
    v149[3] = &unk_1E5A65D28;
    BOOL v28 = v23;
    v150 = v28;
    notify_register_dispatch(v26, &out_token, v27, v149);

    v29 = v3->_notificationTokens;
    BOOL v30 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v29 addObject:v30];

    BOOL v31 = (const char *)[@"com.apple.ManagedConfiguration.profileListChanged" cStringUsingEncoding:4];
    id v32 = notificationQueue();
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __27__MCProfileConnection_init__block_invoke_15;
    v147[3] = &unk_1E5A65D28;
    v33 = v28;
    v148 = v33;
    notify_register_dispatch(v31, &out_token, v32, v147);

    v34 = v3->_notificationTokens;
    v35 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v34 addObject:v35];

    v36 = (const char *)[@"com.apple.managedconfiguration.settingschanged" cStringUsingEncoding:4];
    v37 = notificationQueue();
    v145[0] = MEMORY[0x1E4F143A8];
    v145[1] = 3221225472;
    v145[2] = __27__MCProfileConnection_init__block_invoke_18;
    v145[3] = &unk_1E5A65D28;
    __int16 v38 = v33;
    v146 = v38;
    notify_register_dispatch(v36, &out_token, v37, v145);

    id v39 = v3->_notificationTokens;
    uint64_t v40 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v39 addObject:v40];

    v41 = (const char *)[@"com.apple.managedconfiguration.effectivesettingschanged" cStringUsingEncoding:4];
    v42 = notificationQueue();
    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = __27__MCProfileConnection_init__block_invoke_19;
    v143[3] = &unk_1E5A65D28;
    v43 = v38;
    v144 = v43;
    notify_register_dispatch(v41, &out_token, v42, v143);

    v44 = v3->_notificationTokens;
    v45 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v44 addObject:v45];

    v46 = (const char *)[@"com.apple.managedconfiguration.appwhitelistdidchange" UTF8String];
    v47 = notificationQueue();
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = __27__MCProfileConnection_init__block_invoke_21;
    v141[3] = &unk_1E5A65D28;
    v48 = v43;
    v142 = v48;
    notify_register_dispatch(v46, &out_token, v47, v141);

    v49 = v3->_notificationTokens;
    v50 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v49 addObject:v50];

    v51 = (const char *)[@"com.apple.managedconfiguration.defaultsdidchange" UTF8String];
    v52 = notificationQueue();
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __27__MCProfileConnection_init__block_invoke_22;
    v139[3] = &unk_1E5A65D28;
    v53 = v48;
    v140 = v53;
    notify_register_dispatch(v51, &out_token, v52, v139);

    v54 = v3->_notificationTokens;
    v55 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v54 addObject:v55];

    v56 = (const char *)[@"com.apple.managedconfiguration.keyboardsettingschanged" UTF8String];
    v57 = notificationQueue();
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __27__MCProfileConnection_init__block_invoke_23;
    v137[3] = &unk_1E5A65D28;
    v58 = v53;
    id v138 = v58;
    notify_register_dispatch(v56, &out_token, v57, v137);

    v59 = v3->_notificationTokens;
    v60 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v59 addObject:v60];

    v61 = (const char *)[@"com.apple.managedconfiguration.newssettingschanged" UTF8String];
    v62 = notificationQueue();
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __27__MCProfileConnection_init__block_invoke_24;
    v135[3] = &unk_1E5A65D28;
    id v63 = v58;
    id v136 = v63;
    notify_register_dispatch(v61, &out_token, v62, v135);

    v64 = v3->_notificationTokens;
    v65 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v64 addObject:v65];

    v66 = (const char *)[@"com.apple.managedconfiguration.clientrestrictionschanged" cStringUsingEncoding:4];
    v67 = notificationQueue();
    v133[0] = MEMORY[0x1E4F143A8];
    v133[1] = 3221225472;
    v133[2] = __27__MCProfileConnection_init__block_invoke_25;
    v133[3] = &unk_1E5A65D28;
    id v68 = v63;
    id v134 = v68;
    notify_register_dispatch(v66, &out_token, v67, v133);

    v69 = v3->_notificationTokens;
    v70 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v69 addObject:v70];

    v71 = (const char *)[@"com.apple.managedconfiguration.webFilterUIActiveDidChange" UTF8String];
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __27__MCProfileConnection_init__block_invoke_26;
    v131[3] = &unk_1E5A65D28;
    id v72 = v68;
    id v132 = v72;
    v73 = MEMORY[0x1E4F14428];
    notify_register_dispatch(v71, &out_token, MEMORY[0x1E4F14428], v131);
    v74 = v3->_notificationTokens;
    v75 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v74 addObject:v75];

    v76 = (const char *)[@"com.apple.ManagedConfiguration.managedAppsChanged" UTF8String];
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __27__MCProfileConnection_init__block_invoke_27;
    v129[3] = &unk_1E5A65D28;
    id v77 = v72;
    id v130 = v77;
    notify_register_dispatch(v76, &out_token, v73, v129);

    v78 = v3->_notificationTokens;
    v79 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v78 addObject:v79];

    v80 = (const char *)[@"MCManagedBooksChanged" UTF8String];
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __27__MCProfileConnection_init__block_invoke_28;
    v127[3] = &unk_1E5A65D28;
    id v81 = v77;
    id v128 = v81;
    notify_register_dispatch(v80, &out_token, v73, v127);

    v82 = v3->_notificationTokens;
    v83 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v82 addObject:v83];

    v84 = (const char *)[@"com.apple.managedconfiguration.allowpasscodemodificationchanged" UTF8String];
    v85 = notificationQueue();
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __27__MCProfileConnection_init__block_invoke_29;
    v125[3] = &unk_1E5A65D28;
    id v86 = v81;
    id v126 = v86;
    notify_register_dispatch(v84, &out_token, v85, v125);

    v87 = v3->_notificationTokens;
    v88 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v87 addObject:v88];

    v89 = (const char *)[@"com.apple.ManagedConfiguration.removedSystemAppsChanged" UTF8String];
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __27__MCProfileConnection_init__block_invoke_30;
    v123[3] = &unk_1E5A65D28;
    id v90 = v86;
    id v124 = v90;
    notify_register_dispatch(v89, &out_token, v73, v123);

    v91 = v3->_notificationTokens;
    v92 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v91 addObject:v92];

    v93 = (const char *)[@"com.apple.ManagedConfiguration.diagnosticsCollected" UTF8String];
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __27__MCProfileConnection_init__block_invoke_31;
    v121[3] = &unk_1E5A65D28;
    id v94 = v90;
    id v122 = v94;
    notify_register_dispatch(v93, &out_token, v73, v121);

    v95 = v3->_notificationTokens;
    v96 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v95 addObject:v96];

    v97 = (const char *)[@"com.apple.managedconfiguration.allowhealthdatasubmissionchanged" UTF8String];
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __27__MCProfileConnection_init__block_invoke_32;
    v119[3] = &unk_1E5A65D28;
    id v98 = v94;
    id v120 = v98;
    notify_register_dispatch(v97, &out_token, v73, v119);

    v99 = v3->_notificationTokens;
    v100 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v99 addObject:v100];

    v101 = (const char *)[@"com.apple.managedconfiguration.homescreenlayoutchanged" UTF8String];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __27__MCProfileConnection_init__block_invoke_33;
    v117[3] = &unk_1E5A65D28;
    id v102 = v98;
    id v118 = v102;
    notify_register_dispatch(v101, &out_token, v73, v117);

    v103 = v3->_notificationTokens;
    v104 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v103 addObject:v104];

    v105 = (const char *)[@"com.apple.managedconfiguration.clearpasscodegenerationcaches" cStringUsingEncoding:4];
    v106 = notificationQueue();
    notify_register_dispatch(v105, &out_token, v106, &__block_literal_global_2);

    v107 = v3->_notificationTokens;
    v108 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
    [(NSMutableArray *)v107 addObject:v108];

    v109 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v109 addObserver:v102 selector:sel__restrictionDidChange name:@"com.apple.managedconfiguration.restrictionchanged" object:v102];

    v110 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v110 addObserver:v102 selector:sel__passcodePolicyDidChange name:@"PINPolicyChangedNotification" object:v102];

    v111 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v111 addObserver:v102 selector:sel__passcodeDidChange name:@"com.apple.managedconfiguration.passcodechanged" object:v102];

    v112 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v112 addObserver:v102 selector:sel__profileListDidChange name:@"com.apple.ManagedConfiguration.profileListChanged" object:v102];

    v113 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v113 addObserver:v102 selector:sel__effectiveSettingsDidChange_ name:@"com.apple.managedconfiguration.effectivesettingschanged" object:v102];

    v114 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v114 addObserver:v102 selector:sel__defaultsDidChange name:@"com.apple.managedconfiguration.defaultsdidchange" object:v102];

    v115 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v115 addObserver:v102 selector:sel__appWhitelistDidChange_ name:@"com.apple.managedconfiguration.appwhitelistdidchange" object:v102];
  }
  return v3;
}

- (id)effectiveUserSettings
{
  [(MCProfileConnection *)self checkInIfNeeded];
  v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveUserSettings];

  return v3;
}

- (BOOL)isNotificationsModificationAllowedForBundleID:(id)a3
{
  dispatch_queue_t v4 = [(MCProfileConnection *)self restrictionEnforcedNotificationSettingsForBundleID:a3];

  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowNotificationsModification"] != 2&& v4 == 0;
}

- (id)restrictionEnforcedNotificationSettingsForBundleID:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = [(MCProfileConnection *)self restrictionEnforcedNotificationSettings];
  dispatch_queue_t v6 = [(MCProfileConnection *)self _restrictionEnforcedNotificationSettingsForBundleID:v4 settingsArray:v5];

  return v6;
}

- (id)restrictionEnforcedNotificationSettings
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  int v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = MCUserNotificationSettingsFilePath();
  BOOL v5 = [v3 arrayWithContentsOfFile:v4];

  if (!v5)
  {
    dispatch_queue_t v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = MCSystemNotificationSettingsFilePath();
    BOOL v5 = [v6 arrayWithContentsOfFile:v7];
  }
  dispatch_queue_t v8 = [(MCProfileConnection *)self _notificationRestrictedApps];
  if ([v8 count])
  {
    uint64_t v9 = (void *)[v5 mutableCopy];
    uint64_t v10 = v9;
    v25 = v5;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_opt_new();
    }
    dispatch_queue_t v12 = v11;

    BOOL v13 = (void *)MEMORY[0x1E4F28F60];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __68__MCProfileConnection_Misc__restrictionEnforcedNotificationSettings__block_invoke;
    v31[3] = &unk_1E5A68600;
    uint64_t v24 = v8;
    id v14 = v8;
    id v32 = v14;
    id v15 = [v13 predicateWithBlock:v31];
    [v12 filterUsingPredicate:v15];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      uint64_t v19 = MEMORY[0x1E4F1CC28];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v33[0] = @"BundleIdentifier";
          v33[1] = @"NotificationsEnabled";
          v34[0] = v21;
          v34[1] = v19;
          v33[2] = @"CriticalAlertEnabled";
          v34[2] = v19;
          id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
          [v12 addObject:v22];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v17);
    }

    BOOL v5 = (void *)[v12 copy];
    dispatch_queue_t v8 = v24;
  }

  return v5;
}

- (id)effectiveValuesForUnionSetting:(id)a3
{
  id v4 = a3;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    BOOL v5 = 0;
  }
  else
  {
    dispatch_queue_t v6 = [(MCProfileConnection *)self effectiveParametersForUnionSetting:v4];
    BOOL v5 = [v6 objectForKeyedSubscript:@"values"];
  }
  return v5;
}

- (id)effectiveParametersForUnionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  dispatch_queue_t v6 = [v5 effectiveParametersForUnionSetting:v4];

  return v6;
}

- (id)_restrictionEnforcedNotificationSettingsForBundleID:(id)a3 settingsArray:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        dispatch_queue_t v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"BundleIdentifier", (void)v16);
        char v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)_notificationRestrictedApps
{
  return [(MCProfileConnection *)self effectiveValuesForUnionSetting:@"notificationRestrictedApps"];
}

- (id)effectiveValuesForIntersectionSetting:(id)a3
{
  id v4 = a3;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(MCProfileConnection *)self effectiveParametersForIntersectionSetting:v4];
    id v5 = [v6 objectForKeyedSubscript:@"values"];
  }
  return v5;
}

- (id)effectiveParametersForIntersectionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 effectiveParametersForIntersectedSetting:v4];

  return v6;
}

- (int)BOOLRestrictionForFeature:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  int v6 = [v5 restrictedBoolForFeature:v4];

  return v6;
}

- (id)restrictedAppBundleIDsExcludingRemovedSystemApps
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    v2 = 0;
  }
  else
  {
    int v3 = +[MCRestrictionManager sharedManager];
    id v4 = [v3 restrictedAppBundleIDsExcludingRemovedSystemApps:1];
    v2 = (void *)[v4 copy];
  }
  return v2;
}

- (BOOL)isOpenInRestrictionInEffect
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  if ([(MCProfileConnection *)self mayOpenFromManagedToUnmanaged]) {
    BOOL v3 = ![(MCProfileConnection *)self mayOpenFromUnmanagedToManaged];
  }
  else {
    BOOL v3 = 1;
  }
  id v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v5 = @"NO";
    if (v3) {
      id v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "isOpenInRestrictionInEffect: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3;
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveRestrictedBoolForSetting:@"allowOpenFromUnmanagedToManaged"];

  id v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v5 = @"NO";
    if (v3 != 2) {
      id v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "mayOpenFromUnmanagedToManaged: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveRestrictedBoolForSetting:@"allowOpenFromManagedToUnmanaged"];

  id v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v5 = @"NO";
    if (v3 != 2) {
      id v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "mayOpenFromManagedToUnmanaged: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (int)appWhitelistState
{
  if ([(MCProfileConnection *)self needsCheckIn]) {
    return 0;
  }
  int v3 = +[MCRestrictionManager sharedManager];
  id v4 = [v3 effectiveUserSettings];
  id v5 = +[MCRestrictionManager sharedManager];
  int v6 = [v5 currentRestrictions];
  int v7 = +[MCRestrictionManager appWhitelistStateWithSettingsDictionary:v4 restrictionsDictionary:v6];

  return v7;
}

- (BOOL)isBoolSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  char v6 = [v5 isBoolSettingLockedDownByRestrictions:v4];

  return v6;
}

- (id)effectiveValueForSetting:(id)a3
{
  id v4 = a3;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v5 = 0;
  }
  else
  {
    char v6 = [(MCProfileConnection *)self effectiveParametersForValueSetting:v4];
    id v5 = [v6 objectForKey:@"value"];
  }
  return v5;
}

- (id)effectiveParametersForValueSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  char v6 = [v5 effectiveParametersForValueSetting:v4];

  return v6;
}

- (BOOL)isPasscodeSet
{
  [(MCProfileConnection *)self checkInIfNeeded];
  v2 = +[MCPasscodeManager sharedManager];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  notificationSyncQueue = self->_notificationSyncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MCProfileConnection_registerObserver___block_invoke;
  v7[3] = &unk_1E5A65E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationSyncQueue, v7);
}

- (id)effectiveWhitelistedAppBundleIDs
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    v2 = 0;
  }
  else
  {
    char v3 = +[MCRestrictionManager sharedManager];
    id v4 = [v3 effectiveWhitelistedAppBundleIDs];
    v2 = (void *)[v4 copy];
  }
  return v2;
}

- (id)effectiveBlockedAppBundleIDsExcludingRemovedSystemApps
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    v2 = 0;
  }
  else
  {
    char v3 = +[MCRestrictionManager sharedManager];
    id v4 = [v3 effectiveBlockedAppBundleIDsExcludingRemovedSystemApps:1];
    v2 = (void *)[v4 copy];
  }
  return v2;
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
}

- (BOOL)isAppManaged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = MCContainingBundleIDForBundleID(v4);
  id v6 = [MEMORY[0x1E4F73178] attributesByAppID];
  int v7 = [v6 allKeys];
  int v8 = [v7 containsObject:v5];

  uint64_t v9 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = @"NO";
    if (v8) {
      uint64_t v10 = @"YES";
    }
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEBUG, "isAppManaged:%@ => %@", (uint8_t *)&v12, 0x16u);
  }

  return v8;
}

- (BOOL)isBundleIDAccountBasedForDragDrop:(id)a3
{
  char v3 = MCContainingBundleIDForBundleID(a3);
  BOOL v4 = MCIsAppAccountBasedForDragDrop(v3);

  return v4;
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4
{
}

- (BOOL)isEphemeralMultiUser
{
  return [MEMORY[0x1E4F5E7A8] isSharediPad];
}

- (BOOL)isWritingToolsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowWritingTools"] != 2;
}

- (BOOL)isDictationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDictation"] != 2;
}

- (BOOL)isAppClipsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppClips"] != 2;
}

- (id)crossSiteTrackingPreventionRelaxedDomains
{
  return [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"crossSiteTrackingPreventionRelaxedDomains"];
}

- (id)crossSiteTrackingPreventionRelaxedApps
{
  return [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"crossSiteTrackingPreventionRelaxedApps"];
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7
{
  LOBYTE(v7) = 1;
  [(MCProfileConnection *)self setBoolValue:a3 ask:0 forSetting:a4 configurationUUID:0 toSystem:a5 user:a6 passcode:a7 credentialSet:0 waitUntilCompleted:v7 completion:0];
}

void __42__MCProfileConnection_publicXPCConnection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[17];
  if (!v3)
  {
    [v2 _queueCreateAndResumePublicXPCConnection];
    char v3 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  BOOL v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

void __36__MCProfileConnection_xpcConnection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[18];
  if (!v3)
  {
    [v2 _queueCreateAndResumeXPCConnection];
    char v3 = *(void **)(*(void *)(a1 + 32) + 144);
  }
  BOOL v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

- (void)_queueCreateAndResumeXPCConnection
{
  char v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.managedconfiguration.profiled" options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  id v5 = MCXPCProtocolInterface();
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];

  id v6 = MCProfileConnectionXPCProtocolInterface();
  [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v6];

  [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke;
  v9[3] = &unk_1E5A65D00;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke_1;
  v7[3] = &unk_1E5A65D00;
  objc_copyWeak(&v8, &location);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v7];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_queueCreateAndResumePublicXPCConnection
{
  char v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.managedconfiguration.profiled.public" options:4096];
  publicXPCConnection = self->_publicXPCConnection;
  self->_publicXPCConnection = v3;

  id v5 = MCXPCProtocolInterface();
  [(NSXPCConnection *)self->_publicXPCConnection setRemoteObjectInterface:v5];

  id v6 = MCProfileConnectionXPCProtocolInterface();
  [(NSXPCConnection *)self->_publicXPCConnection setExportedInterface:v6];

  [(NSXPCConnection *)self->_publicXPCConnection setExportedObject:self];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke;
  v9[3] = &unk_1E5A65D00;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)self->_publicXPCConnection setInvalidationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke_2;
  v7[3] = &unk_1E5A65D00;
  objc_copyWeak(&v8, &location);
  [(NSXPCConnection *)self->_publicXPCConnection setInterruptionHandler:v7];
  [(NSXPCConnection *)self->_publicXPCConnection resume];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)isiTunesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowiTunes"] != 2;
}

- (BOOL)isSquareRootOnBasicCalculatorForced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceSquareRootOnBasicCalculator"] == 1;
}

- (BOOL)isNetworkDriveAccessInFilesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFilesNetworkDriveAccess"] != 2;
}

- (BOOL)isMathPaperSolvingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMathPaperSolving"] != 2;
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowKeyboardMathSolving"] != 2;
}

- (BOOL)isFindMyCarAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFindMyCar"] != 2;
}

- (BOOL)isCalculatorModeScientificAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCalculatorModeScientific"] != 2;
}

- (BOOL)isCalculatorModeMathPaperAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCalculatorModeMathPaper"] != 2;
}

- (BOOL)isCalculatorInputModeUnitConversionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCalculatorInputModeUnitConversion"] != 2;
}

- (BOOL)isAutomaticAppUpdatesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAutomaticAppUpdates"] != 2;
}

- (BOOL)isAutomaticAppDownloadsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAutomaticAppDownloads"] != 2;
}

- (BOOL)isAppRemovalAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppRemoval"] != 2;
}

- (BOOL)isAppInstallationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppInstallation"] != 2;
}

- (BOOL)isLocalStorageAllowed
{
  v2 = [MCUMUserManagerClass() sharedManager];
  if ([v2 isSharedIPad])
  {
    char v3 = [v2 currentUser];
    char v4 = [v3 isTransientUser];
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isBluetoothModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowBluetoothModification"] != 2;
}

- (int)effectiveRestrictedBoolValueForSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  LODWORD(self) = [(MCProfileConnection *)self effectiveBoolValueForSetting:v4];

  return (int)self;
}

- (void)checkInWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x1A6232FE0](a3, a2);
  if (!v4) {
    id v4 = &__block_literal_global_56;
  }
  id v7 = v4;
  id v5 = [(MCProfileConnection *)self publicXPCConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
  [v6 checkInWithCompletion:v7];
}

- (NSXPCConnection)publicXPCConnection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  publicXPCConnectionSyncQueue = self->_publicXPCConnectionSyncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MCProfileConnection_publicXPCConnection__block_invoke;
  v5[3] = &unk_1E5A65C88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(publicXPCConnectionSyncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSXPCConnection *)v3;
}

- (BOOL)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 outRestrictionChanged:(BOOL *)a8 outEffectiveSettingsChanged:(BOOL *)a9 outError:(id *)a10
{
  return [(MCProfileConnection *)self applyRestrictionDictionary:a3 overrideRestrictions:0 appsAndOptions:0 clientType:a4 clientUUID:a5 localizedClientDescription:a6 localizedWarningMessage:a7 outRestrictionChanged:a8 outEffectiveSettingsChanged:a9 outError:a10];
}

- (BOOL)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 outRestrictionChanged:(BOOL *)a10 outEffectiveSettingsChanged:(BOOL *)a11 outError:(id *)a12
{
  BOOL v16 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__8;
  uint64_t v36 = __Block_byref_object_dispose__8;
  id v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke;
  v31[3] = &unk_1E5A680A0;
  void v31[4] = &v32;
  uint64_t v24 = (void *)MEMORY[0x1A6232FE0](v31);
  v25 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v43 = v21;
    __int16 v44 = 2114;
    id v45 = v20;
    __int16 v46 = 2114;
    id v47 = v18;
    _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_DEFAULT, "Setting client truth of UUID %{public}@ type %{public}@ to %{public}@", buf, 0x20u);
  }
  id v26 = [(MCProfileConnection *)self xpcConnection];
  long long v27 = [v26 synchronousRemoteObjectProxyWithErrorHandler:v24];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_2;
  v30[3] = &unk_1E5A683E8;
  v30[6] = a10;
  v30[7] = a11;
  v30[4] = &v38;
  v30[5] = &v32;
  [v27 applyRestrictionDictionary:v18 overrideRestrictions:v16 appsAndOptions:v19 clientType:v20 clientUUID:v21 localizedClientDescription:v22 localizedWarningMessage:v23 completion:v30];

  if (a12) {
    *a12 = (id) v33[5];
  }
  BOOL v28 = *((unsigned char *)v39 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v28;
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 waitUntilCompleted:(BOOL)a9 errorCompletionBlock:(id)a10
{
  BOOL v32 = a5;
  BOOL v33 = a6;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v34 = a4;
  id v31 = a7;
  id v30 = a8;
  id v15 = a10;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v16 = [(MCProfileConnection *)self xpcConnection];
  long long v17 = v16;
  if (a9) {
    [v16 synchronousRemoteObjectProxyWithErrorHandler:v15];
  }
  else {
  long long v29 = [v16 remoteObjectProxyWithErrorHandler:v15];
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v41;
    id v35 = v18;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v37;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v37 != v27) {
                  objc_enumerationMutation(v24);
                }
                +[MCSignpostManager willSetFeature:*(void *)(*((void *)&v36 + 1) + 8 * j)];
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v26);
          }

          id v18 = v35;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v20);
  }

  [v29 setParametersForSettingsByType:v18 configurationUUID:v34 toSystem:v32 user:v33 passcode:v31 credentialSet:v30 completion:v15];
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  xpcConnectionSyncQueue = self->_xpcConnectionSyncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MCProfileConnection_xpcConnection__block_invoke;
  v5[3] = &unk_1E5A65C88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(xpcConnectionSyncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSXPCConnection *)v3;
}

void __45__MCProfileConnection_checkInWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Check-in error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_2(void *a1, char a2, char a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = (unsigned char *)a1[6];
  if (v9) {
    unsigned char *v9 = a2;
  }
  id v10 = (unsigned char *)a1[7];
  if (v10) {
    unsigned char *v10 = a3;
  }
  if (v7)
  {
    id v11 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v12 = v11;
      id v13 = [v8 MCVerboseDescription];
      int v16 = 138543362;
      long long v17 = v13;
      _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_ERROR, "Apply restriction dict error. Error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  uint64_t v14 = *(void *)(a1[5] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v8;
}

- (BOOL)isPersonalHotspotModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPersonalHotspotModification"] != 2;
}

- (BOOL)isLiveVoicemailAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowLiveVoicemail"] != 2;
}

- (void)_createAndResumeXPCConnection
{
  xpcConnectionSyncQueue = self->_xpcConnectionSyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MCProfileConnection__createAndResumeXPCConnection__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_sync(xpcConnectionSyncQueue, block);
}

uint64_t __52__MCProfileConnection__createAndResumeXPCConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueCreateAndResumeXPCConnection];
}

- (void)_destroyXPCConnectionAndInvalidate:(BOOL)a3
{
  xpcConnectionSyncQueue = self->_xpcConnectionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__MCProfileConnection__destroyXPCConnectionAndInvalidate___block_invoke;
  v4[3] = &unk_1E5A65CD8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(xpcConnectionSyncQueue, v4);
}

void __58__MCProfileConnection__destroyXPCConnectionAndInvalidate___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 144) invalidate];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;
}

void __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_ERROR, "XPC connection invalidated", v7, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[16];
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
      int v6 = (void *)v4[16];
      v4[16] = 0;
    }
    [v4 _destroyXPCConnectionAndInvalidate:0];
  }
}

void __57__MCProfileConnection__queueCreateAndResumeXPCConnection__block_invoke_1(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _destroyXPCConnectionAndInvalidate:1];
}

- (void)_createAndResumePublicXPCConnection
{
  publicXPCConnectionSyncQueue = self->_publicXPCConnectionSyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MCProfileConnection__createAndResumePublicXPCConnection__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_sync(publicXPCConnectionSyncQueue, block);
}

uint64_t __58__MCProfileConnection__createAndResumePublicXPCConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueCreateAndResumePublicXPCConnection];
}

- (void)_destroyPublicXPCConnectionAndInvalidate:(BOOL)a3
{
  publicXPCConnectionSyncQueue = self->_publicXPCConnectionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__MCProfileConnection__destroyPublicXPCConnectionAndInvalidate___block_invoke;
  v4[3] = &unk_1E5A65CD8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(publicXPCConnectionSyncQueue, v4);
}

void __64__MCProfileConnection__destroyPublicXPCConnectionAndInvalidate___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 136) invalidate];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;
}

void __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_ERROR, "Public XPC connection invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _destroyPublicXPCConnectionAndInvalidate:0];
}

void __63__MCProfileConnection__queueCreateAndResumePublicXPCConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEFAULT, "Public XPC connection interrupted", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _destroyPublicXPCConnectionAndInvalidate:1];
}

void __27__MCProfileConnection_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received restriction changed notification", buf, 2u);
  }
  int v3 = MCIsDaemonProcess;
  id v4 = qword_1EB2223B0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating cache because we're running inside profiled.", v9, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Invalidating cache", v8, 2u);
    }
    int v6 = +[MCRestrictionManager sharedManager];
    [v6 invalidateRestrictions];
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"com.apple.managedconfiguration.restrictionchanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_13(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received passcode changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.passcodechanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_14(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received passcode policy changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PINPolicyChangedNotification" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_15(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received profile list changed notification", buf, 2u);
  }
  int v3 = MCIsDaemonProcess;
  id v4 = qword_1EB2223B0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating caches because we're running inside profiled.", v16, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Invalidating caches", v15, 2u);
    }
    int v6 = +[MCDependencyReader sharedReader];
    [v6 invalidateCache];

    id v7 = +[MCManifest sharedManifest];
    [v7 invalidateCache];

    uint64_t v8 = +[MCRestrictionManager sharedManager];
    [v8 invalidateRestrictions];

    uint64_t v9 = +[MCRestrictionManager sharedManager];
    [v9 invalidateSettings];
  }
  id v10 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "Sending out a localized restriction source notification!", v14, 2u);
  }
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"com.apple.ManagedConfiguration.profileListChanged" object:*(void *)(a1 + 32)];

  int v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"com.apple.ManagedConfiguration.localizedRestrictionSourceDescriptionDidChange" object:*(void *)(a1 + 32)];

  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"com.apple.ManagedConfiguration.localizedCertificateSourceDescriptionDidChange" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_19(uint64_t a1, int a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Received effective settings changed notification", (uint8_t *)&v13, 2u);
  }
  int v5 = MCIsDaemonProcess;
  int v6 = qword_1EB2223B0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_DEBUG, "Not invalidating cache because we're running inside profiled.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_DEBUG, "Invalidating cache", (uint8_t *)&v13, 2u);
    }
    uint64_t v8 = +[MCRestrictionManager sharedManager];
    [v8 invalidateSettings];
  }
  uint64_t v13 = 0;
  notify_get_state(a2, &v13);
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v14 = @"senderPID";
  id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v13];
  v15[0] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v9 postNotificationName:@"com.apple.managedconfiguration.effectivesettingschanged" object:v10 userInfo:v12];
}

void __27__MCProfileConnection_init__block_invoke_21(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received app allow list did changed notification", v5, 2u);
  }
  int v3 = +[MCRestrictionManager sharedManager];
  [v3 clearEffectiveWhitelistedAppsAndOptionsCache];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"com.apple.managedconfiguration.appwhitelistdidchange" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_22(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received defaults did changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.defaultsdidchange" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_23(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received keyboard settings changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.keyboardsettingschanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_24(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received news settings changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.newssettingschanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_25(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received client restrictions changed notification", buf, 2u);
  }
  int v3 = MCIsDaemonProcess;
  id v4 = qword_1EB2223B0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Not invalidating caches because we're running inside profiled.", v12, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Invalidating caches", v11, 2u);
    }
    int v6 = +[MCRestrictionManager sharedManager];
    [v6 invalidateRestrictions];

    BOOL v7 = +[MCRestrictionManager sharedManager];
    [v7 invalidateSettings];
  }
  uint64_t v8 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_DEBUG, "Sending out a localized restriction source notification!", v10, 2u);
  }
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"com.apple.ManagedConfiguration.localizedRestrictionSourceDescriptionDidChange" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_26(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received web filter UI active did changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.webFilterUIActiveDidChange" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_27(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received managed apps changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.ManagedConfiguration.managedAppsChanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_28(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received managed books changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MCManagedBooksChanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_29(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received allow passcode modification changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.allowpasscodemodificationchanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_30(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received removed system apps changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.ManagedConfiguration.removedSystemAppsChanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_31(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received diagnostics collected notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.ManagedConfiguration.diagnosticsCollected" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_32(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received allow health data submission changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.allowhealthdatasubmissionchanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_33(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEBUG, "Received home screen layout changed notification", v4, 2u);
  }
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.managedconfiguration.homescreenlayoutchanged" object:*(void *)(a1 + 32)];
}

void __27__MCProfileConnection_init__block_invoke_34()
{
  v0 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A13F0000, v0, OS_LOG_TYPE_DEBUG, "Received clear passcode generation caches notification", v1, 2u);
  }
  MCKeybagClearPasscodeGenerationCaches();
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  [(NSXPCConnection *)self->_publicXPCConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_publicXPCConnection invalidate];
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_notificationTokens;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        notify_cancel([*(id *)(*((void *)&v10 + 1) + 8 * v8++) intValue]);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)MCProfileConnection;
  [(MCProfileConnection *)&v9 dealloc];
}

- (void)checkIn
{
  id v3 = [(MCProfileConnection *)self publicXPCConnection];
  uint64_t v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_54];
  [v2 checkInWithCompletion:&__block_literal_global_54];
}

void __30__MCProfileConnection_checkIn__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Check-in error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)checkInAsynchronously
{
  id v3 = [(MCProfileConnection *)self publicXPCConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_58];
  [v2 checkInWithCompletion:&__block_literal_global_58];
}

void __44__MCProfileConnection_checkInAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Check-in async error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_applyToObservers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  notificationSyncQueue = self->_notificationSyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MCProfileConnection__applyToObservers___block_invoke;
  block[3] = &unk_1E5A65D90;
  block[4] = self;
  void block[5] = &v18;
  dispatch_sync(notificationSyncQueue, block);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)v19[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        long long v12 = (void *)MEMORY[0x1A6232D90](v7);
        v4[2](v4, v11);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __41__MCProfileConnection__applyToObservers___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  return MEMORY[0x1F41817F8]();
}

- (void)_restrictionDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCProfileConnection__restrictionDidChange__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__MCProfileConnection__restrictionDidChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MCProfileConnection__restrictionDidChange__block_invoke_2;
  v3[3] = &unk_1E5A65DB8;
  v3[4] = v1;
  return [v1 _applyToObservers:v3];
}

void __44__MCProfileConnection__restrictionDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 profileConnectionDidReceiveRestrictionChangedNotification:*(void *)(a1 + 32) userInfo:0];
  }
}

- (void)_passcodeDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MCProfileConnection__passcodeDidChange__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__MCProfileConnection__passcodeDidChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__MCProfileConnection__passcodeDidChange__block_invoke_2;
  v3[3] = &unk_1E5A65DB8;
  v3[4] = v1;
  return [v1 _applyToObservers:v3];
}

void __41__MCProfileConnection__passcodeDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 profileConnectionDidReceivePasscodeChangedNotification:*(void *)(a1 + 32) userInfo:0];
  }
}

- (void)_passcodePolicyDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MCProfileConnection__passcodePolicyDidChange__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__MCProfileConnection__passcodePolicyDidChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__MCProfileConnection__passcodePolicyDidChange__block_invoke_2;
  v3[3] = &unk_1E5A65DB8;
  v3[4] = v1;
  return [v1 _applyToObservers:v3];
}

void __47__MCProfileConnection__passcodePolicyDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 profileConnectionDidReceivePasscodePolicyChangedNotification:*(void *)(a1 + 32) userInfo:0];
  }
}

- (void)_profileListDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCProfileConnection__profileListDidChange__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__MCProfileConnection__profileListDidChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MCProfileConnection__profileListDidChange__block_invoke_2;
  v3[3] = &unk_1E5A65DB8;
  v3[4] = v1;
  return [v1 _applyToObservers:v3];
}

void __44__MCProfileConnection__profileListDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 profileConnectionDidReceiveProfileListChangedNotification:*(void *)(a1 + 32) userInfo:0];
  }
}

- (void)_appWhitelistDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MCProfileConnection__appWhitelistDidChange___block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__MCProfileConnection__appWhitelistDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__MCProfileConnection__appWhitelistDidChange___block_invoke_2;
  v3[3] = &unk_1E5A65DB8;
  v3[4] = v1;
  return [v1 _applyToObservers:v3];
}

void __46__MCProfileConnection__appWhitelistDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 profileConnectionDidReceiveAppWhitelistChangedNotification:*(void *)(a1 + 32) userInfo:0];
  }
}

- (void)_defaultsDidChange
{
}

- (void)_internalDefaultsDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__MCProfileConnection__internalDefaultsDidChange__block_invoke;
  v2[3] = &unk_1E5A65DB8;
  v2[4] = self;
  [(MCProfileConnection *)self _applyToObservers:v2];
}

void __49__MCProfileConnection__internalDefaultsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 profileConnectionDidReceiveDefaultsChangedNotification:*(void *)(a1 + 32) userInfo:0];
  }
}

- (void)_effectiveSettingsDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke;
  v6[3] = &unk_1E5A65E08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke_2;
  v2[3] = &unk_1E5A65DE0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _applyToObservers:v2];
}

void __51__MCProfileConnection__effectiveSettingsDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) userInfo];
    [v5 profileConnectionDidReceiveEffectiveSettingsChangedNotification:v3 userInfo:v4];
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  notificationSyncQueue = self->_notificationSyncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MCProfileConnection_unregisterObserver___block_invoke;
  v7[3] = &unk_1E5A65E08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationSyncQueue, v7);
}

uint64_t __42__MCProfileConnection_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_publicXPCConnection, 0);
  objc_storeStrong(&self->xpcConnectionInvalidatedActionBlock, 0);
  objc_storeStrong(&self->waitForEnrollmentCompletionBlock, 0);
  objc_storeStrong(&self->showWarningsReplyBlock, 0);
  objc_storeStrong(&self->passcodeReplyBlock, 0);
  objc_storeStrong(&self->restoreReplyBlock, 0);
  objc_storeStrong(&self->MAIDSignInReplyBlock, 0);
  objc_storeStrong(&self->userInputReplyBlock, 0);
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_shutDownSerialQueue, 0);
  objc_storeStrong((id *)&self->_publicXPCConnectionSyncQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionSyncQueue, 0);
  objc_storeStrong((id *)&self->_notificationSyncQueue, 0);
  objc_storeStrong((id *)&self->_originalProfileData, 0);
  objc_storeStrong((id *)&self->_preflightResponse, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)activeClassroomRoles
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"classroomRoles"];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)setActiveClassroomRoles:(id)a3
{
  id v4 = [a3 allObjects];
  [(MCProfileConnection *)self setValues:v4 forIntersectionSetting:@"classroomRoles" toSystem:0 user:1];
}

- (void)addActiveClassroomRole:(id)a3
{
  id v4 = a3;
  id v5 = [(MCProfileConnection *)self activeClassroomRoles];
  id v6 = (id)[v5 mutableCopy];

  [v6 addObject:v4];
  [(MCProfileConnection *)self setActiveClassroomRoles:v6];
}

- (void)removeActiveClassroomRole:(id)a3
{
  id v4 = a3;
  id v5 = [(MCProfileConnection *)self activeClassroomRoles];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObject:v4];
  [(MCProfileConnection *)self setActiveClassroomRoles:v6];
}

- (BOOL)isClassroomStudentRoleEnabled
{
  id v2 = [(MCProfileConnection *)self activeClassroomRoles];
  char v3 = [v2 containsObject:@"student"];

  return v3;
}

- (void)setClassroomStudentRoleEnabled:(BOOL)a3
{
  if (a3) {
    [(MCProfileConnection *)self addActiveClassroomRole:@"student"];
  }
  else {
    [(MCProfileConnection *)self removeActiveClassroomRole:@"student"];
  }
}

- (BOOL)isClassroomInstructorRoleEnabled
{
  id v2 = [(MCProfileConnection *)self activeClassroomRoles];
  char v3 = [v2 containsObject:@"instructor"];

  return v3;
}

- (void)setClassroomInstructorRoleEnabled:(BOOL)a3
{
  if (a3) {
    [(MCProfileConnection *)self addActiveClassroomRole:@"instructor"];
  }
  else {
    [(MCProfileConnection *)self removeActiveClassroomRole:@"instructor"];
  }
}

- (BOOL)isClassroomEnabled
{
  id v2 = [(MCProfileConnection *)self activeClassroomRoles];
  if ([v2 containsObject:@"instructor"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 containsObject:@"student"];
  }

  return v3;
}

- (BOOL)isClassroomUnpromptedScreenObservationForced
{
  int v3 = [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceClassroomUnpromptedScreenObservation"];
  if (v3 != 1) {
    LOBYTE(v3) = [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceUnpromptedManagedClassroomScreenObservation"] == 1;
  }
  return v3;
}

- (BOOL)isClassroomAutomaticClassJoiningForced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceClassroomAutomaticallyJoinClasses"] == 1;
}

- (BOOL)isClassroomUnpromptedAppAndDeviceLockForced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceClassroomUnpromptedAppAndDeviceLock"] == 1;
}

- (BOOL)isClassroomRequestPermissionToLeaveClassesForced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceClassroomRequestPermissionToLeaveClasses"] == 1;
}

- (int)restrictedBoolValueForFeature:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  LODWORD(self) = [(MCProfileConnection *)self BOOLRestrictionForFeature:v4];

  return (int)self;
}

- (id)valueForFeature:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = [(MCProfileConnection *)self valueRestrictionForFeature:v4];

  return v5;
}

- (id)installedMDMProfileIdentifier
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  int v3 = [(MCProfileConnection *)self unverifiedInstalledMDMProfileIdentifier];
  if (v3)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__7;
    id v23 = __Block_byref_object_dispose__7;
    id v24 = 0;
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__7;
    long long v17 = __Block_byref_object_dispose__7;
    id v18 = 0;
    id v4 = [(MCProfileConnection *)self xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke;
    v12[3] = &unk_1E5A680A0;
    v12[4] = &v13;
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke_2;
    v11[3] = &unk_1E5A680C8;
    v11[4] = &v13;
    v11[5] = &v19;
    [v5 verifiedMDMProfileIdentifierWithCompletion:v11];

    if (v14[5])
    {
      id v6 = (id)qword_1EB2223B0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [(id)v14[5] MCVerboseDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v7;
        _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "MDM profile installation check failed with error: %{public}@", buf, 0xCu);
      }
      id v8 = (void *)v20[5];
      if (!v8) {
        id v8 = v3;
      }
    }
    else
    {
      id v8 = (void *)v20[5];
    }
    id v9 = v8;
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke(uint64_t a1, void *a2)
{
}

void __62__MCProfileConnection_Profiles__installedMDMProfileIdentifier__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)unverifiedInstalledMDMProfileIdentifier
{
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  int v3 = MDMFilePath();
  id v4 = [v2 dictionaryWithContentsOfFile:v3];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F732D0]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)installedProfileIdentifiers
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCManifest sharedManifest];
  int v3 = [v2 allInstalledProfileIdentifiers];

  return v3;
}

- (id)uninstalledProfileIdentifiersForDevice:(unint64_t)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCHoldingTankManifest sharedManifest];
  id v5 = [v4 uninstalledProfileIdentifiersForDevice:a3];

  return v5;
}

- (id)installedProfileIdentifiersInstalledBy:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  long long v16 = objc_opt_new();
  [(MCProfileConnection *)self installedProfileIdentifiers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1A6232D90]();
        uint64_t v10 = +[MCManifest sharedManifest];
        id v11 = [v10 installedProfileWithIdentifier:v8];

        if (v11)
        {
          long long v12 = [v11 installOptions];
          uint64_t v13 = [v12 objectForKey:@"installedBy"];

          if (v13 && [v13 isEqualToString:v17]) {
            [v16 addObject:v8];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  long long v14 = (void *)[v16 copy];
  return v14;
}

- (id)installedProfilesInstalledBy:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v17 = objc_opt_new();
  [(MCProfileConnection *)self installedProfileIdentifiers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1A6232D90]();
        id v11 = +[MCManifest sharedManifest];
        long long v12 = [v11 installedProfileWithIdentifier:v9];

        if (v12)
        {
          uint64_t v13 = [v12 installOptions];
          long long v14 = [v13 objectForKey:@"installedBy"];

          if (v14 && [v14 isEqualToString:v18]) {
            [v17 addObject:v12];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v15 = (void *)[v17 copy];
  return v15;
}

- (id)installedProfileIdentifiersWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCManifest sharedManifest];
  uint64_t v5 = [v4 identifiersOfProfilesWithFilterFlags:v3];

  if ((v3 & 0x24) != 0)
  {
    long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          long long v12 = (void *)MEMORY[0x1A6232D90]();
          uint64_t v13 = +[MCManifest sharedManifest];
          long long v14 = [v13 installedProfileWithIdentifier:v11];

          if (v14)
          {
            if (objc_opt_class(), (objc_opt_isKindOfClass())
              && (char v15 = [v14 isMDMProfile], (v3 & 0x40) != 0)
              && (v15 & 1) != 0
              || ((int v16 = [v14 isManagedByMDM], (v3 & 0x20) == 0) ? (v17 = 1) : (v17 = v16),
                  (v16 & (v3 >> 2) & 1) == 0 && v17))
            {
              [v19 addObject:v11];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    uint64_t v5 = (void *)[v19 copy];
  }
  return v5;
}

- (id)installedProfilesWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  if ((v3 & 4) != 0)
  {
    uint64_t v24 = [(MCProfileConnection *)self unverifiedInstalledMDMProfileIdentifier];
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v5 = [(MCProfileConnection *)self installedProfileIdentifiersWithFilterFlags:v3];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    long long v23 = @"managingProfileIdentifier";
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1A6232D90]();
        long long v12 = +[MCManifest sharedManifest];
        uint64_t v13 = [v12 installedProfileWithIdentifier:v10 filterFlags:v3];

        if (v13)
        {
          if ((v3 & 4) == 0) {
            goto LABEL_11;
          }
          long long v14 = [v13 managingProfileIdentifier];
          char v15 = v14;
          if (v14)
          {
            id v16 = v14;
          }
          else
          {
            int v17 = [v13 installOptions];
            id v16 = [v17 objectForKey:v23];
          }
          objc_opt_class();
          int v18 = (objc_opt_isKindOfClass() & 1) != 0 ? [v13 isMDMProfile] : 0;
          int v19 = objc_msgSend(v24, "isEqualToString:", v16, v23);
          BOOL v20 = (v3 & 0x40) == 0 || v18 == 0;
          BOOL v21 = v20;

          if (!v19 || !v21) {
LABEL_11:
          }
            objc_msgSend(v25, "addObject:", v13, v23);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  return v25;
}

- (id)installedConfigurationProfileInfoWithOutMDMProfileInfo:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self unverifiedInstalledMDMProfileIdentifier];
  uint64_t v5 = [(MCProfileConnection *)self installedProfileIdentifiersWithFilterFlags:1];
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v5;
  uint64_t v28 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  uint64_t v7 = 0;
  if (v28)
  {
    uint64_t v8 = *(void *)v31;
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1A6232D90]();
        long long v12 = +[MCManifest sharedManifest];
        uint64_t v13 = [v12 installedProfileWithIdentifier:v10];

        if (v13)
        {
          long long v29 = v11;
          long long v14 = [[MCProfileInfo alloc] initWithProfile:v13];
          char v15 = [v13 managingProfileIdentifier];
          id v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            [v13 installOptions];
            int v18 = v7;
            id v19 = v6;
            v21 = BOOL v20 = v4;
            id v17 = [v21 objectForKey:@"managingProfileIdentifier"];

            id v4 = v20;
            id v6 = v19;
            uint64_t v7 = v18;
            uint64_t v8 = v27;
          }

          if ([v10 isEqualToString:v4])
          {
            long long v22 = v14;

            uint64_t v7 = v22;
            uint64_t v11 = v29;
          }
          else
          {
            uint64_t v11 = v29;
            if (([v4 isEqualToString:v17] & 1) == 0) {
              [v26 addObject:v14];
            }
          }
        }
      }
      uint64_t v28 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v28);
  }

  if (a3) {
    *a3 = v7;
  }
  long long v23 = (void *)[v26 copy];

  return v23;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = +[MCManifest installedProfileWithIdentifier:v4];

  return v5;
}

- (id)installedSystemProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = +[MCManifest installedSystemProfileWithIdentifier:v4];

  return v5;
}

- (id)installedUserProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = +[MCManifest installedUserProfileWithIdentifier:v4];

  return v5;
}

- (BOOL)isProfileInstalledWithIdentifier:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__7;
  id v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke;
  v12[3] = &unk_1E5A680A0;
  v12[4] = &v13;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke_7;
  v11[3] = &unk_1E5A680F0;
  v11[4] = &v13;
  v11[5] = &v19;
  [v8 isProfileInstalledWithIdentifier:v6 completion:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  char v9 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Cannot query if a profile is installed. Error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __75__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_outError___block_invoke_7(uint64_t a1, void *a2, char a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MCProfileConnection *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5A68118;
  id v9 = v6;
  id v15 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke_9;
  v12[3] = &unk_1E5A68140;
  id v13 = v9;
  id v11 = v9;
  [v10 isProfileInstalledWithIdentifier:v7 completion:v12];
}

void __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Cannot query if a profile is installed. Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v3, 0);
  }
}

uint64_t __77__MCProfileConnection_Profiles__isProfileInstalledWithIdentifier_completion___block_invoke_9(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)installedProfileDataWithIdentifier:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = +[MCManifest installedProfileDataWithIdentifier:v4];

  return v5;
}

- (id)installedSystemProfileDataWithIdentifier:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = +[MCManifest installedSystemProfileDataWithIdentifier:v4];

  return v5;
}

- (id)installedUserProfileDataWithIdentifier:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = +[MCManifest installedUserProfileDataWithIdentifier:v4];

  return v5;
}

- (id)uninstalledProfileDataWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v7 = +[MCHoldingTankManifest sharedManifest];
  uint64_t v8 = [v7 uninstalledProfileDataWithIdentifier:v6 targetDevice:a4];

  return v8;
}

- (BOOL)isProfileWithIdentifier:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MCDependencyReader sharedReader];
  uint64_t v8 = [v7 dependentsOfParent:v5 inDomain:@"ManagingProfileToManagedProfile"];

  LOBYTE(v7) = [v8 containsObject:v6];
  return (char)v7;
}

- (void)allProfilesOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 forDeviceType:(unint64_t)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v11 = [(MCProfileConnection *)self installedConfigurationProfileInfoWithOutMDMProfileInfo:a3];
  long long v12 = v11;
  if (a4) {
    *a4 = v11;
  }
  if (a5)
  {
    uint64_t v26 = v12;
    uint64_t v27 = a5;
    id v13 = +[MCHoldingTankManifest sharedManifest];
    long long v14 = [(MCProfileConnection *)self uninstalledProfileIdentifiersForDevice:a6];
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * v20);
          char v22 = (void *)MEMORY[0x1A6232D90]();
          long long v23 = [v13 uninstalledProfileWithIdentifier:v21 targetDevice:a6];
          if (v23)
          {
            uint64_t v24 = [[MCProfileInfo alloc] initWithProfile:v23];
            [v15 addObject:v24];
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    id v25 = v15;
    *uint64_t v27 = v25;

    long long v12 = v26;
  }
}

- (id)popProfileDataFromHeadOfInstallationQueue
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__7;
  long long v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  id v3 = [(MCProfileConnection *)self xpcConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_29];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__MCProfileConnection_Profiles__popProfileDataFromHeadOfInstallationQueue__block_invoke_11;
  v7[3] = &unk_1E5A68168;
  void v7[4] = &v8;
  [v4 popProfileDataFromHeadOfInstallationQueueWithCompletion:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __74__MCProfileConnection_Profiles__popProfileDataFromHeadOfInstallationQueue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Pop profile data error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __74__MCProfileConnection_Profiles__popProfileDataFromHeadOfInstallationQueue__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Pop profile data error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__7;
  uint64_t v14 = __Block_byref_object_dispose__7;
  id v15 = 0;
  id v5 = [(MCProfileConnection *)self xpcConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_14];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__MCProfileConnection_Profiles__peekProfileDataFromPurgatoryForDeviceType___block_invoke_15;
  v9[3] = &unk_1E5A68168;
  void v9[4] = &v10;
  [v6 peekProfileDataFromPurgatoryForDeviceType:a3 withCompletion:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __75__MCProfileConnection_Profiles__peekProfileDataFromPurgatoryForDeviceType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Peek profile data from Purgatory error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __75__MCProfileConnection_Profiles__peekProfileDataFromPurgatoryForDeviceType___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Peek profile data from Purgatory error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)_handleQueueProfileError:(id)a3 targetDevice:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[MCUserNotificationManager sharedManager];
  id v7 = [v6 displayQueueProfileError:v5 targetDevice:a4];

  if ([v5 code] == 4036)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v9;
      id v11 = [v5 MCVerboseDescription];
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Profile data failed to queue with error: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v8 = v7;
  }

  return v8;
}

- (void)_queueDataForAcceptance:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  if (!v12)
  {
    id v16 = [MEMORY[0x1E4F28B50] mainBundle];
    id v12 = [v16 bundleIdentifier];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke;
  v24[3] = &unk_1E5A68190;
  id v17 = v13;
  v24[4] = self;
  id v25 = v17;
  uint64_t v18 = (void *)MEMORY[0x1A6232FE0](v24);
  uint64_t v19 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v20 = [v19 remoteObjectProxyWithErrorHandler:v18];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke_2;
  v22[3] = &unk_1E5A681B8;
  v22[4] = self;
  id v23 = v17;
  id v21 = v17;
  [v20 queueProfileDataForInstallation:v15 originalFileName:v14 originatingBundleID:v12 transitionToUI:v8 completion:v22];
}

void __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _handleQueueProfileError:a2 targetDevice:99];
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

void __120__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a4)
  {
    id v7 = [*(id *)(a1 + 32) _handleQueueProfileError:a4 targetDevice:a3];
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_queueDataForAcceptance:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 outError:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__7;
  long long v40 = __Block_byref_object_dispose__7;
  id v41 = 0;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__7;
  id v34 = __Block_byref_object_dispose__7;
  id v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  if (!v14)
  {
    id v15 = [MEMORY[0x1E4F28B50] mainBundle];
    id v14 = [v15 bundleIdentifier];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke;
  v25[3] = &unk_1E5A680A0;
  void v25[4] = &v30;
  id v16 = (void *)MEMORY[0x1A6232FE0](v25);
  id v17 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v16];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke_2;
  v24[3] = &unk_1E5A681E0;
  v24[4] = &v36;
  void v24[5] = &v30;
  v24[6] = &v26;
  [v18 queueProfileDataForInstallation:v12 originalFileName:v13 originatingBundleID:v14 transitionToUI:v8 completion:v24];

  uint64_t v19 = v31[5];
  if (v19)
  {
    uint64_t v20 = [(MCProfileConnection *)self _handleQueueProfileError:v19 targetDevice:v27[3]];
    id v21 = (void *)v31[5];
    void v31[5] = v20;

    if (a7) {
      *a7 = (id) v31[5];
    }
  }
  id v22 = (id)v37[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v22;
}

void __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __118__MCProfileConnection_Profiles___queueDataForAcceptance_originalFileName_originatingBundleID_transitionToUI_outError___block_invoke_2(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1[4] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(a1[5] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
}

- (void)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self _queueDataForAcceptance:v13 originalFileName:v12 originatingBundleID:v11 transitionToUI:1 completion:v10];
}

- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v10 = [(MCProfileConnection *)self _queueDataForAcceptance:v9 originalFileName:v8 originatingBundleID:0 transitionToUI:1 outError:a5];

  return v10;
}

- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 outError:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v13 = [(MCProfileConnection *)self _queueDataForAcceptance:v12 originalFileName:v11 originatingBundleID:v10 transitionToUI:1 outError:a6];

  return v13;
}

- (id)installProfileData:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v7 = [(MCProfileConnection *)self installProfileData:v6 options:0 outError:a4];

  return v7;
}

- (id)installProfileData:(id)a3 options:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__7;
  uint64_t v27 = __Block_byref_object_dispose__7;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__7;
  id v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke;
  v16[3] = &unk_1E5A680A0;
  v16[4] = &v17;
  id v10 = (void *)MEMORY[0x1A6232FE0](v16);
  id v11 = [(MCProfileConnection *)self xpcConnection];
  id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke_19;
  v15[3] = &unk_1E5A68208;
  v15[4] = &v17;
  v15[5] = &v23;
  [v12 installProfileData:v8 interactive:0 options:v9 completion:v15];

  if (a5) {
    *a5 = (id) v18[5];
  }
  id v13 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Install profile data connection error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __69__MCProfileConnection_Profiles__installProfileData_options_outError___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      int v9 = [v6 MCVerboseDescription];
      int v15 = 138543362;
      id v16 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Install profile data error. Error: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

- (id)appleConnect_installMDMAssociatedProfileData:(id)a3 outError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  id v14 = [(MCProfileConnection *)self installedMDMProfileIdentifier];
  if (v14)
  {
    int v15 = objc_opt_new();
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isInstalledByMDM"];
    [v15 setObject:v14 forKeyedSubscript:@"managingProfileIdentifier"];
    id v16 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_INFO, "AppleConnect installing MDM-associated profile data with options: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__7;
    id v34 = __Block_byref_object_dispose__7;
    id v35 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__7;
    uint64_t v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke;
    v24[3] = &unk_1E5A680A0;
    v24[4] = &v25;
    uint64_t v17 = (void *)MEMORY[0x1A6232FE0](v24);
    uint64_t v18 = [(MCProfileConnection *)self xpcConnection];
    uint64_t v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v17];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke_24;
    v23[3] = &unk_1E5A68208;
    v23[4] = &v25;
    v23[5] = &buf;
    objc_msgSend(v19, "appleConnect_installMDMAssociatedProfileData:interactive:options:completion:", v6, 0, v15, v23);

    if (a4) {
      *a4 = (id) v26[5];
    }
    a4 = (id *)*(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&buf, 8);
  }
  else if (a4)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    id v21 = MCErrorArray(@"ERROR_NO_ASSOCIATED_MDM_PROFILE", v7, v8, v9, v10, v11, v12, v13, 0);
    *a4 = [v20 MCErrorWithDomain:@"MCInstallationErrorDomain" code:4046 descriptionArray:v21 errorType:@"MCFatalError"];

    a4 = 0;
  }

  return a4;
}

void __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "AppleConnect install profile data connection error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __87__MCProfileConnection_Profiles__appleConnect_installMDMAssociatedProfileData_outError___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      int v9 = [v6 MCVerboseDescription];
      int v15 = 138543362;
      id v16 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "AppleConnect install profile data error. Error: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

- (void)removeProfileWithIdentifier:(id)a3
{
}

- (void)removeProfileAsyncWithIdentifier:(id)a3
{
}

- (void)removeProfileWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_26];

  [v8 removeProfileWithIdentifier:v6 installationType:a4 completion:&__block_literal_global_26];
}

void __78__MCProfileConnection_Profiles__removeProfileWithIdentifier_installationType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Remove profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)removeProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4
{
}

- (void)removeProtectedProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4
{
}

- (void)removeProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__MCProfileConnection_Profiles__removeProfileAsyncWithIdentifier_installationType_completion___block_invoke;
  v14[3] = &unk_1E5A68118;
  id v15 = v8;
  id v10 = v8;
  uint64_t v11 = (void *)MEMORY[0x1A6232FE0](v14);
  id v12 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v13 = [v12 remoteObjectProxyWithErrorHandler:v11];

  [v13 removeProfileWithIdentifier:v9 installationType:a4 completion:v11];
}

void __94__MCProfileConnection_Profiles__removeProfileAsyncWithIdentifier_installationType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Remove profile async error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)removeProtectedProfileAsyncWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__MCProfileConnection_Profiles__removeProtectedProfileAsyncWithIdentifier_installationType_completion___block_invoke;
  v14[3] = &unk_1E5A68118;
  id v15 = v8;
  id v10 = v8;
  uint64_t v11 = (void *)MEMORY[0x1A6232FE0](v14);
  id v12 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v13 = [v12 remoteObjectProxyWithErrorHandler:v11];

  [v13 removeProtectedProfileWithIdentifier:v9 installationType:a4 completion:v11];
}

void __103__MCProfileConnection_Profiles__removeProtectedProfileAsyncWithIdentifier_installationType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Remove protected profile async error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__MCProfileConnection_Profiles__removeProfileWithIdentifier_installationType_completion___block_invoke;
  v14[3] = &unk_1E5A68118;
  id v15 = v8;
  id v10 = v8;
  uint64_t v11 = (void *)MEMORY[0x1A6232FE0](v14);
  id v12 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v13 = [v12 remoteObjectProxyWithErrorHandler:v11];

  [v13 removeProfileWithIdentifier:v9 installationType:a4 completion:v11];
}

void __89__MCProfileConnection_Profiles__removeProfileWithIdentifier_installationType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Remove profile error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__MCProfileConnection_Profiles__removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion___block_invoke;
  v16[3] = &unk_1E5A68118;
  id v17 = v10;
  id v12 = v10;
  uint64_t v13 = (void *)MEMORY[0x1A6232FE0](v16);
  id v14 = [(MCProfileConnection *)self xpcConnection];
  id v15 = [v14 remoteObjectProxyWithErrorHandler:v13];

  [v15 removeUninstalledProfileWithIdentifier:v11 installationType:a4 targetDeviceType:a5 completion:v13];
}

void __117__MCProfileConnection_Profiles__removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Remove uninstalled profile error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__MCProfileConnection_Profiles__removePostSetupAutoInstallSetAsideProfileWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1A6232FE0](v9);
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  int v8 = [v7 remoteObjectProxyWithErrorHandler:v6];

  [v8 removePostSetupAutoInstallSetAsideProfileWithCompletion:v5];
}

void __89__MCProfileConnection_Profiles__removePostSetupAutoInstallSetAsideProfileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC connection failed when removing set aside MDM profile. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (id)updateProfileWithIdentifier:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self checkApplicationIdentifierEntitlement];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke;
  v13[3] = &unk_1E5A680A0;
  v13[4] = &v14;
  uint64_t v7 = (void *)MEMORY[0x1A6232FE0](v13);
  int v8 = [(MCProfileConnection *)self xpcConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke_27;
  v12[3] = &unk_1E5A68208;
  void v12[4] = &v14;
  void v12[5] = &v20;
  [v9 updateProfileIdentifier:v6 interactive:0 completion:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      uint64_t v7 = [v4 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __70__MCProfileConnection_Profiles__updateProfileWithIdentifier_outError___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)acceptedMIMETypes
{
  return &unk_1EF4D0BF8;
}

- (id)acceptedFileExtensions
{
  return &unk_1EF4D0C10;
}

- (BOOL)_openSensitiveURLString:(id)a3 unlock:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__MCProfileConnection_Profiles___openSensitiveURLString_unlock___block_invoke;
  v11[3] = &unk_1E5A680A0;
  v11[4] = &v12;
  uint64_t v7 = (void *)MEMORY[0x1A6232FE0](v11);
  int v8 = [(MCProfileConnection *)self xpcConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v9 openSensitiveURL:v6 unlock:v4 completion:v7];

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v4;
}

void __64__MCProfileConnection_Profiles___openSensitiveURLString_unlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Open sensitive URL error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (BOOL)showProfileErrorUIWithProfileIdentifier:(id)a3 outError:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (![v6 length])
  {
    long long v40 = (void *)MEMORY[0x1E4F28C58];
    id v41 = MCErrorArray(@"ERROR_UIOP_NULL_IDENTIFIER", v7, v8, v9, v10, v11, v12, v13, 0);
    id v30 = [v40 MCErrorWithDomain:@"MCUIOperationErrorDomain" code:27000 descriptionArray:v41 errorType:@"MCFatalError"];

    if (!v30) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  [(MCProfileConnection *)self installedProfilesWithFilterFlags:1];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v48 + 1) + 8 * i) identifier];
        char v20 = [v19 isEqualToString:v6];

        if (v20)
        {

          long long v31 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
          uint64_t v29 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v31];

          uint64_t v32 = [NSString stringWithFormat:@"%@&profileID=%@", @"prefs:root=General&path=ManagedConfigurationList/ProfileError", v29, (void)v48];
          if ([(MCProfileConnection *)self _openSensitiveURLString:v32 unlock:0])
          {
            id v30 = 0;
          }
          else
          {
            long long v42 = (void *)MEMORY[0x1E4F28C58];
            long long v43 = MCErrorArray(@"ERROR_UIOP_CANNOT_DISPLAY_P_IDENTIFIER", v33, v34, v35, v36, v37, v38, v39, v6);
            id v30 = [v42 MCErrorWithDomain:@"MCUIOperationErrorDomain" code:27001 descriptionArray:v43 errorType:@"MCFatalError"];
          }
          goto LABEL_17;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v21 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = MCErrorArray(@"ERROR_UIOP_IDENTIFIER_NOT_FOUND_P_IDENTIFIER", v22, v23, v24, v25, v26, v27, v28, v6);
  id v30 = [v21 MCErrorWithDomain:@"MCUIOperationErrorDomain" code:27000 descriptionArray:v29 errorType:@"MCFatalError"];
LABEL_17:

  if (v30)
  {
LABEL_18:
    __int16 v44 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v45 = v44;
      uint64_t v46 = [v30 MCVerboseDescription];
      *(_DWORD *)long long buf = 138543618;
      id v53 = v6;
      __int16 v54 = 2114;
      v55 = v46;
      _os_log_impl(&dword_1A13F0000, v45, OS_LOG_TYPE_ERROR, "Cannot display profile with identifier “%{public}@”. Error: %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v30;
    }
  }
LABEL_22:

  return v30 == 0;
}

- (id)listInstalledProvisioningProfileUUIDsWithManagedOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = 0;
  id v14 = v4;
  if (v3)
  {
    id v5 = +[MCDependencyReader sharedReader];
  }
  id v8 = v5;
  MISEnumerateInstalledProvisioningProfiles();
  id v6 = (void *)[(id)v10[5] copy];

  _Block_object_dispose(&v9, 8);
  return v6;
}

BOOL __86__MCProfileConnection_Profiles__listInstalledProvisioningProfileUUIDsWithManagedOnly___block_invoke(uint64_t a1)
{
  id v2 = MISProvisioningProfileGetUUID();
  if (v2)
  {
    if (!*(unsigned char *)(a1 + 48)
      || ([*(id *)(a1 + 32) dependentsOfParent:v2 inDomain:@"ProvisioningProfileToManagingProfile"], v3 = objc_claimAutoreleasedReturnValue(), uint64_t v4 = objc_msgSend(v3, "count"), v3, v4))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v2];
    }
  }
  else
  {
    id v5 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Cannot get UUID of installed provisioning profile.", v10, 2u);
    }
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return v2 != 0;
}

- (BOOL)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__7;
  char v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __99__MCProfileConnection_Profiles__installProvisioningProfileData_managingProfileIdentifier_outError___block_invoke;
  v15[3] = &unk_1E5A68258;
  v15[4] = &v22;
  v15[5] = &v16;
  uint64_t v10 = (void *)MEMORY[0x1A6232FE0](v15);
  uint64_t v11 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v10];
  [v12 installProvisioningProfileData:v8 managingProfileIdentifier:v9 completion:v10];

  if (a5) {
    *a5 = (id) v17[5];
  }
  char v13 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

void __99__MCProfileConnection_Profiles__installProvisioningProfileData_managingProfileIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      uint64_t v6 = [v3 MCVerboseDescription];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Install provisioning profile error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

- (BOOL)removeProvisioningProfileWithUUID:(id)a3 outError:(id *)a4
{
  return [(MCProfileConnection *)self removeProvisioningProfileWithUUID:a3 managingProfileIdentifier:0 outError:a4];
}

- (BOOL)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__7;
  id v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke;
  v16[3] = &unk_1E5A680A0;
  void v16[4] = &v17;
  uint64_t v10 = (void *)MEMORY[0x1A6232FE0](v16);
  uint64_t v11 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke_76;
  v15[3] = &unk_1E5A68280;
  v15[4] = &v23;
  v15[5] = &v17;
  [v12 removeProvisioningProfileWithUUID:v8 managingProfileIdentifier:v9 completion:v15];

  if (a5) {
    *a5 = (id) v18[5];
  }
  char v13 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      uint64_t v6 = [v3 MCVerboseDescription];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Remove provisioning profile error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __102__MCProfileConnection_Profiles__removeProvisioningProfileWithUUID_managingProfileIdentifier_outError___block_invoke_76(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = v6;
      id v8 = [v5 MCVerboseDescription];
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Remove provisioning profile error. Error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7;
  uint64_t v25 = __Block_byref_object_dispose__7;
  id v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke;
  v18[3] = &unk_1E5A682A8;
  id v7 = v6;
  id v19 = v7;
  char v20 = &v21;
  id v8 = (void *)MEMORY[0x1A6232FE0](v18);
  uint64_t v9 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke_78;
  v14[3] = &unk_1E5A682D0;
  id v11 = v7;
  id v15 = v11;
  uint64_t v16 = &v27;
  uint64_t v17 = &v21;
  [v10 addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:v11 completion:v14];

  if (a4) {
    *a4 = (id) v22[5];
  }
  char v12 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

void __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = v4;
      id v7 = [v3 MCVerboseDescription];
      int v10 = 138543618;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "MCProfileConnection+Profiles XPC failed to add trusted code signing identities for provisioning profile uuid '%{public}@' with error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __100__MCProfileConnection_Profiles__addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_outError___block_invoke_78(void *a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = v6;
      uint64_t v9 = [v5 MCVerboseDescription];
      int v12 = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "MCProfileConnection+Profiles failed to add trusted code signing identities for provisioning profile uuid '%{public}@' with error: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)provisiongProfileUUIDsForSignerIdentity:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__7;
  uint64_t v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __73__MCProfileConnection_Profiles__provisiongProfileUUIDsForSignerIdentity___block_invoke;
  v15[3] = &unk_1E5A682F8;
  id v5 = v4;
  id v16 = v5;
  id v6 = (void *)MEMORY[0x1A6232FE0](v15);
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__MCProfileConnection_Profiles__provisiongProfileUUIDsForSignerIdentity___block_invoke_79;
  v12[3] = &unk_1E5A68320;
  id v9 = v5;
  id v13 = v9;
  __int16 v14 = &v17;
  [v8 provisiongProfileUUIDsForSignerIdentity:v9 completion:v12];

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __73__MCProfileConnection_Profiles__provisiongProfileUUIDsForSignerIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = v4;
      uint64_t v7 = [v3 MCVerboseDescription];
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "MCProfileConnection+Profiles XPC failed to get provisioning profile UUIDs for signer identity '%{public}@' with error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __73__MCProfileConnection_Profiles__provisiongProfileUUIDsForSignerIdentity___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = v7;
      __int16 v10 = [v6 MCVerboseDescription];
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v10;
      _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_ERROR, "MCProfileConnection+Profiles failed to get provisioning profile UUIDs for signer identity '%{public}@' with error: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

- (BOOL)isProvisioningProfilesWithUUID:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[MCDependencyReader sharedReader];
  uint64_t v8 = [v7 dependentsOfParent:v5 inDomain:@"ManagingProfileToProvisioningProfile"];

  LOBYTE(v7) = [v8 containsObject:v6];
  return (char)v7;
}

- (BOOL)getIsBundleBlocked:(BOOL *)a3 bundlePath:(id)a4 outHash:(id *)a5 outHashType:(id *)a6 outError:(id *)a7
{
  id v12 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__7;
  uint64_t v36 = __Block_byref_object_dispose__7;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__7;
  char v30 = __Block_byref_object_dispose__7;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke;
  v19[3] = &unk_1E5A680A0;
  v19[4] = &v20;
  int v13 = (void *)MEMORY[0x1A6232FE0](v19);
  uint64_t v14 = [(MCProfileConnection *)self xpcConnection];
  __int16 v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke_81;
  v18[3] = &unk_1E5A68348;
  void v18[4] = &v38;
  v18[5] = &v32;
  v18[6] = &v26;
  v18[7] = &v20;
  [v15 isBundleBlocked:v12 completion:v18];

  if (a3) {
    *a3 = *((unsigned char *)v39 + 24);
  }
  if (a5) {
    *a5 = (id) v33[5];
  }
  if (a6) {
    *a6 = (id) v27[5];
  }
  if (a7) {
    *a7 = (id) v21[5];
  }
  BOOL v16 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v16;
}

void __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v9 = 138543362;
      __int16 v10 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "MCProfileConnection isBundleBlocked XPC error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __92__MCProfileConnection_Profiles__getIsBundleBlocked_bundlePath_outHash_outHashType_outError___block_invoke_81(void *a1, char a2, void *a3, void *a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    id v12 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v13 = v12;
      uint64_t v14 = [v11 MCVerboseDescription];
      int v23 = 138543362;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "MCProfileConnection isBundleBlocked error: %{public}@", (uint8_t *)&v23, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v15 = *(void *)(a1[5] + 8);
  BOOL v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  uint64_t v18 = *(void *)(a1[6] + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v10;
  id v20 = v10;

  uint64_t v21 = *(void *)(a1[7] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v11;
}

- (BOOL)getAreBundlesBlocked:(id *)a3 bundlePaths:(id)a4 outError:(id *)a5
{
  id v7 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7;
  uint64_t v25 = __Block_byref_object_dispose__7;
  id v26 = 0;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__7;
  uint64_t v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke;
  v14[3] = &unk_1E5A680A0;
  void v14[4] = &v15;
  uint64_t v8 = (void *)MEMORY[0x1A6232FE0](v14);
  id v9 = [(MCProfileConnection *)self xpcConnection];
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke_83;
  v13[3] = &unk_1E5A68370;
  v13[4] = &v21;
  void v13[5] = &v15;
  [v10 areBundlesBlocked:v7 completion:v13];

  if (a3) {
    *a3 = (id) v22[5];
  }
  BOOL v11 = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "MCProfileConnection areBundlesBlocked XPC error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __75__MCProfileConnection_Profiles__getAreBundlesBlocked_bundlePaths_outError___block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      int v9 = [v6 MCVerboseDescription];
      int v15 = 138543362;
      BOOL v16 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "MCProfileConnection areBundlesBlocked error: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)_detectProfiledCrashes
{
  id v2 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_ERROR, "detectProfiledCrashes is no longer available", v3, 2u);
  }
}

- (void)installProfileData:(id)a3 interactionDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self installProfileData:v7 options:0 interactionDelegate:v6];
}

+ (id)profileDaemonConnectionErrorWithUnderlyingError:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  id v12 = MCErrorArray(@"ERROR_PROFILE_INSTALLATION_FAILED_TITLE", v5, v6, v7, v8, v9, v10, v11, 0);
  uint64_t v13 = [v3 MCErrorWithDomain:@"MCInstallationErrorDomain" code:4045 descriptionArray:v12 underlyingError:v4 errorType:@"MCFatalError"];

  return v13;
}

+ (id)profileInstallationErrorWithUnderlyingError:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  id v12 = MCErrorArray(@"ERROR_PROFILE_INSTALLATION_FAILED_TITLE", v5, v6, v7, v8, v9, v10, v11, 0);
  uint64_t v13 = [v3 MCErrorWithDomain:@"MCInstallationErrorDomain" code:4001 descriptionArray:v12 underlyingError:v4 errorType:@"MCFatalError"];

  return v13;
}

- (void)installProfileData:(id)a3 options:(id)a4 interactionDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(MCProfileConnection *)self checkInIfNeeded];
  objc_storeStrong((id *)&self->_originalProfileData, a3);
  objc_storeWeak((id *)&self->_interactionDelegate, v11);
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke;
  v17[3] = &unk_1E5A68398;
  v17[4] = self;
  objc_copyWeak(&v18, &location);
  id v12 = (void *)MEMORY[0x1A6232FE0](v17);
  uint64_t v13 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v14 = [v13 remoteObjectProxyWithErrorHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke_89;
  v15[3] = &unk_1E5A683C0;
  void v15[4] = self;
  objc_copyWeak(&v16, &location);
  [v14 installProfileData:v9 interactive:1 options:v10 completion:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v3 MCVerboseDescription];
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Install profile data, interactive error. Error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = +[MCProfileConnection profileDaemonConnectionErrorWithUnderlyingError:v3];
  [WeakRetained profileConnection:v8 didFinishInstallationWithIdentifier:0 error:v9];
}

void __80__MCProfileConnection_Profiles__installProfileData_options_interactionDelegate___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v13 = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Install profile data, interactive error. Error: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = +[MCProfileConnection profileInstallationErrorWithUnderlyingError:v6];
  [WeakRetained profileConnection:v11 didFinishInstallationWithIdentifier:0 error:v12];
}

- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  objc_storeWeak((id *)&self->_interactionDelegate, v7);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke;
  v13[3] = &unk_1E5A68398;
  v13[4] = self;
  objc_copyWeak(&v14, &location);
  id v8 = (void *)MEMORY[0x1A6232FE0](v13);
  id v9 = [(MCProfileConnection *)self xpcConnection];
  int v10 = [v9 remoteObjectProxyWithErrorHandler:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke_90;
  v11[3] = &unk_1E5A683C0;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  [v10 updateProfileIdentifier:v6 interactive:v7 != 0 completion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = +[MCProfileConnection profileDaemonConnectionErrorWithUnderlyingError:v3];
  [WeakRetained profileConnection:v8 didFinishInstallationWithIdentifier:0 error:v9];
}

void __81__MCProfileConnection_Profiles__updateProfileWithIdentifier_interactionDelegate___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Update profile, interactive error. Error: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = +[MCProfileConnection profileInstallationErrorWithUnderlyingError:v6];
  [WeakRetained profileConnection:v11 didFinishInstallationWithIdentifier:0 error:v12];
}

- (void)setInteractionDelegate:(id)a3
{
}

- (BOOL)isProfileUIInstallationEffectivelyAllowed
{
  id v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveRestrictedBoolForSetting:@"allowUIConfigurationProfileInstallation"];

  return v3 != 2;
}

- (BOOL)isProfileUIInstallationAllowed
{
  [(MCProfileConnection *)self checkInIfNeeded];
  if (![(MCProfileConnection *)self isProfileUIInstallationEffectivelyAllowed])return 0; {
  int v3 = [MEMORY[0x1E4F73168] sharedConfiguration];
  }
  BOOL v4 = [v3 userMode] != 1;

  return v4;
}

- (BOOL)mustInstallProfileNonInteractively:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (-[MCProfileConnection isProfileUIInstallationEffectivelyAllowed](self, "isProfileUIInstallationEffectivelyAllowed")&& ([v4 mustInstallNonInteractively] & 1) == 0)
  {
    char v5 = MCIsEffectivelyInAppWhitelistMode();
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Profiles) preflightUserInputResponses:forPayloadIndex:]();
  }
  userInputReplyBlock = (void (**)(id, id, uint64_t, unint64_t, void))self->userInputReplyBlock;
  if (userInputReplyBlock)
  {
    userInputReplyBlock[2](userInputReplyBlock, v6, 1, a4, 0);
    id v8 = self->userInputReplyBlock;
    self->userInputReplyBlock = 0;
  }
}

- (void)cancelUserInputResponses
{
  [(MCProfileConnection *)self checkInIfNeeded];
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Profiles) cancelUserInputResponses]();
  }
  id userInputReplyBlock = self->userInputReplyBlock;
  if (userInputReplyBlock)
  {
    (*((void (**)(id, void, void, void, void))userInputReplyBlock + 2))(userInputReplyBlock, 0, 0, 0, 0);
    id v4 = self->userInputReplyBlock;
    self->id userInputReplyBlock = 0;
  }
}

- (void)submitUserInputResponses:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Profiles) submitUserInputResponses:]();
  }
  id userInputReplyBlock = self->userInputReplyBlock;
  if (userInputReplyBlock)
  {
    (*((void (**)(id, id, void, void, void))userInputReplyBlock + 2))(userInputReplyBlock, v4, 0, 0, 0);
    id v6 = self->userInputReplyBlock;
    self->id userInputReplyBlock = 0;
  }
}

- (void)__checkForProfiledCrash
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  if (WeakRetained)
  {
    id v4 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "profiled crash detected.", buf, 2u);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    int v13 = MCErrorArray(@"INSTALLATION_FAILED", v5, v6, v7, v8, v9, v10, v11, 0);
    id v14 = [v12 MCErrorWithDomain:@"MCInstallationErrorDomain" code:4001 descriptionArray:v13 errorType:@"MCFatalError"];

    [(MCProfileConnection *)self doMCICDidFinishInstallationWithIdentifier:0 error:v14 completion:0];
  }
}

- (void)respondToMAIDAuthenticationRequest:(BOOL)a3 error:(id)a4 isCancelled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Profiles) respondToMAIDAuthenticationRequest:error:isCancelled:]();
  }
  MAIDSignInReplyBlock = (void (**)(id, BOOL, id, BOOL))self->MAIDSignInReplyBlock;
  if (MAIDSignInReplyBlock)
  {
    MAIDSignInReplyBlock[2](MAIDSignInReplyBlock, v6, v8, v5);
    id v10 = self->MAIDSignInReplyBlock;
    self->MAIDSignInReplyBlock = 0;
  }
}

- (void)respondToManagedRestoreRequest:(BOOL)a3 error:(id)a4 isCancelled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Profiles) respondToManagedRestoreRequest:error:isCancelled:]();
  }
  restoreReplyBlock = (void (**)(id, BOOL, id, BOOL))self->restoreReplyBlock;
  if (restoreReplyBlock)
  {
    restoreReplyBlock[2](restoreReplyBlock, v6, v8, v5);
    id v10 = self->restoreReplyBlock;
    self->restoreReplyBlock = 0;
  }
}

- (void)respondToWarningsContinueInstallation:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Profiles) respondToWarningsContinueInstallation:]();
  }
  showWarningsReplyBlock = (void (**)(id, BOOL, void))self->showWarningsReplyBlock;
  if (showWarningsReplyBlock)
  {
    showWarningsReplyBlock[2](showWarningsReplyBlock, v3, 0);
    id v6 = self->showWarningsReplyBlock;
    self->showWarningsReplyBlock = 0;
  }
}

- (void)respondToCurrentPasscodeRequestContinue:(BOOL)a3 passcode:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Profiles) respondToCurrentPasscodeRequestContinue:passcode:]();
  }
  passcodeReplyBlock = (void (**)(id, BOOL, id, void))self->passcodeReplyBlock;
  if (passcodeReplyBlock)
  {
    passcodeReplyBlock[2](passcodeReplyBlock, v4, v6, 0);
    id v8 = self->passcodeReplyBlock;
    self->passcodeReplyBlock = 0;
  }
}

- (BOOL)isChaperoned
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 isSupervised];

  return v3;
}

- (id)chaperoneOrganization
{
  [(MCProfileConnection *)self checkInIfNeeded];
  char v3 = [(MCProfileConnection *)self cloudConfigurationDetails];
  BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73220]];

  return v4;
}

- (id)effectiveRestrictions
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  char v3 = [v2 currentRestrictions];

  return v3;
}

- (id)effectiveRestrictionsForPairedDevice
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  return v2;
}

- (id)valueRestrictionForFeature:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 valueForFeature:v4];

  return v6;
}

- (id)objectRestrictionForFeature:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 objectForFeature:v4];

  return v6;
}

- (BOOL)applyRestrictionDictionary:(id)a3 appsAndOptions:(id)a4 clientType:(id)a5 clientUUID:(id)a6 localizedClientDescription:(id)a7 localizedWarningMessage:(id)a8 outRestrictionChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outError:(id *)a11
{
  return [(MCProfileConnection *)self applyRestrictionDictionary:a3 overrideRestrictions:0 appsAndOptions:a4 clientType:a5 clientUUID:a6 localizedClientDescription:a7 localizedWarningMessage:a8 outRestrictionChanged:a9 outEffectiveSettingsChanged:a10 outError:a11];
}

- (BOOL)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 clientType:(id)a5 clientUUID:(id)a6 localizedClientDescription:(id)a7 localizedWarningMessage:(id)a8 outRestrictionChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outError:(id *)a11
{
  return [(MCProfileConnection *)self applyRestrictionDictionary:a3 overrideRestrictions:a4 appsAndOptions:0 clientType:a5 clientUUID:a6 localizedClientDescription:a7 localizedWarningMessage:a8 outRestrictionChanged:a9 outEffectiveSettingsChanged:a10 outError:a11];
}

void __232__MCProfileConnection_Restrictions__applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Apply restriction dict error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

- (int)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 complianceBlocking:(int)a8 displayImmediateAlert:(BOOL)a9 outRestrictionChanged:(BOOL *)a10 outEffectiveSettingsChanged:(BOOL *)a11 outError:(id *)a12
{
  return -[MCProfileConnection applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:complianceBlocking:displayImmediateAlert:limitForUserEnrollment:outRestrictionChanged:outEffectiveSettingsChanged:outError:](self, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:complianceBlocking:displayImmediateAlert:limitForUserEnrollment:outRestrictionChanged:outEffectiveSettingsChanged:outError:", a3, a4, a5, a6, a7, *(void *)&a8);
}

- (int)applyRestrictionDictionary:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 localizedWarningMessage:(id)a7 complianceBlocking:(int)a8 displayImmediateAlert:(BOOL)a9 limitForUserEnrollment:(BOOL)a10 outRestrictionChanged:(BOOL *)a11 outEffectiveSettingsChanged:(BOOL *)a12 outError:(id *)a13
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (__CFString *)a3;
  id v90 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v30 = MCLocalizedErrorFormatByDevice(@"ENCRYPTION_POLICY_CLIENT_FAILURE_TEXT", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v21);
  id v31 = +[MCDeviceCapabilities currentDevice];
  int v32 = [v31 validateCapabilitiesRequiredByRestrictions:v19 localizedIncompatibilityMessage:v30 outError:a13];

  if (v32)
  {
    int v87 = a8;
    if (v19 && a10)
    {
      uint64_t v33 = qword_1EB2223B0;
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        v101 = v19;
        _os_log_impl(&dword_1A13F0000, v33, OS_LOG_TYPE_DEBUG, "Transmogrifying client restrictions from: %{public}@", buf, 0xCu);
      }
      id v99 = 0;
      uint64_t v34 = [(MCProfileConnection *)self _transmogrifyRestrictionDictionaryForUserEnrollment:v19 outError:&v99];
      uint64_t v35 = (__CFString *)v99;
      uint64_t v36 = qword_1EB2223B0;
      BOOL v37 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG);
      v89 = (__CFString *)v34;
      if (!v34)
      {
        if (v37)
        {
          *(_DWORD *)long long buf = 138543362;
          v101 = v35;
          _os_log_impl(&dword_1A13F0000, v36, OS_LOG_TYPE_DEBUG, "Rejecting client restrictions: %{public}@", buf, 0xCu);
        }
        if (!a13)
        {
          int v45 = 2;
          uint64_t v46 = v22;
LABEL_48:

          goto LABEL_49;
        }
        v66 = (void *)MEMORY[0x1E4F28C58];
        long long v48 = MCErrorArray(@"USER_ENROLLMENT_DISALLOWED_RESTRICTIONS_P_CLIENT", v38, v39, v40, v41, v42, v43, v44, v21);
        *a13 = [v66 MCErrorWithDomain:@"MCDeviceCapabilitiesErrorDomain" code:26002 descriptionArray:v48 underlyingError:v35 errorType:@"MCFatalError"];
        int v45 = 2;
        uint64_t v46 = v22;
        goto LABEL_47;
      }
      if (v37)
      {
        *(_DWORD *)long long buf = 138543362;
        v101 = (__CFString *)v34;
        _os_log_impl(&dword_1A13F0000, v36, OS_LOG_TYPE_DEBUG, "Transmogrifying client restrictions to: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v89 = v19;
    }
    uint64_t v35 = +[MCRestrictionManager sharedManager];
    id v47 = [(__CFString *)v35 systemClientRestrictions];
    long long v48 = [v47 objectForKey:v20];

    if (v48)
    {
      long long v49 = [v48 objectForKey:@"clientType"];
      int v50 = [v49 isEqualToString:v90];

      if (v50)
      {
        id v82 = v20;
        v84 = v35;
        uint64_t v51 = [v48 objectForKey:@"clientRestrictions"];
        v52 = (void *)[(__CFString *)v89 MCMutableDeepCopy];
        id v53 = +[MCHacks sharedHacks];
        [v53 _applyHeuristicsToRestrictions:v52 forProfile:0 ignoresUnrestrictableApps:0];

        __int16 v54 = (void *)v51;
        if ([v52 isEqualToDictionary:v51])
        {
          v55 = [v48 objectForKey:@"compliant"];
          char v56 = [v55 BOOLValue];

          if (v56)
          {

            int v45 = 0;
            uint64_t v46 = v22;
            uint64_t v19 = v89;
            uint64_t v57 = v54;
            id v20 = v82;
            uint64_t v35 = v84;
LABEL_46:

            goto LABEL_47;
          }
        }

        id v20 = v82;
        uint64_t v35 = v84;
      }
    }
    uint64_t v19 = v89;
    uint64_t v46 = v22;
    if ([(MCProfileConnection *)self applyRestrictionDictionary:v89 clientType:v90 clientUUID:v20 localizedClientDescription:v21 localizedWarningMessage:v22 outRestrictionChanged:a11 outEffectiveSettingsChanged:a12 outError:a13])
    {
      uint64_t v57 = +[MCPasscodeManager sharedManager];
      int v58 = [v57 isDeviceLocked];
      if (!v87)
      {
        if (v58)
        {
          int v45 = 4;
          goto LABEL_46;
        }
        int v67 = [v57 currentPasscodeCompliesWithPolicyFromRestrictions:v89 outError:0];
        goto LABEL_38;
      }
      if (v58)
      {
        v83 = v57;
        v85 = v35;
        dispatch_semaphore_t v59 = dispatch_semaphore_create(0);
        int out_token = 0;
        v60 = (const char *)*MEMORY[0x1E4F78160];
        v61 = dispatch_get_global_queue(0, 0);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke;
        handler[3] = &unk_1E5A65D28;
        v62 = v59;
        v97 = v62;
        id v81 = (__CFString *)v60;
        uint32_t v63 = notify_register_dispatch(v60, &out_token, v61, handler);

        if (v63)
        {
          v64 = qword_1EB2223B0;
          uint64_t v35 = v85;
          if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136446466;
            v101 = v81;
            __int16 v102 = 1024;
            uint32_t v103 = v63;
            _os_log_impl(&dword_1A13F0000, v64, OS_LOG_TYPE_ERROR, "Unable to register for message %{public}s: %d", buf, 0x12u);
          }
          v65 = v97;
LABEL_45:

          int v45 = 3;
          uint64_t v19 = v89;
          uint64_t v57 = v83;
          goto LABEL_46;
        }
        uint64_t v57 = v83;
        uint64_t v35 = v85;
        if ([v83 isDeviceLocked])
        {
          do
            dispatch_semaphore_wait(v62, 0xFFFFFFFFFFFFFFFFLL);
          while (([v83 isDeviceLocked] & 1) != 0);
        }
        notify_cancel(out_token);
      }
      int v67 = [v57 currentPasscodeCompliesWithPolicyFromRestrictions:v89 outError:0];
      if (v87 == 1)
      {
LABEL_38:
        int v45 = v67 ^ 1;
        goto LABEL_46;
      }
      if (v67)
      {
LABEL_40:
        int v45 = 0;
        goto LABEL_46;
      }
      v83 = v57;
      v88 = v48;
      dispatch_semaphore_t v68 = dispatch_semaphore_create(0);
      int out_token = 0;
      v69 = (const char *)[@"com.apple.managedconfiguration.passcodechanged" cStringUsingEncoding:4];
      v70 = dispatch_get_global_queue(0, 0);
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_13;
      v94[3] = &unk_1E5A65D28;
      v62 = v68;
      v95 = v62;
      uint32_t v71 = notify_register_dispatch(v69, &out_token, v70, v94);

      if (v71)
      {
        id v72 = qword_1EB2223B0;
        uint64_t v46 = v22;
        long long v48 = v88;
        if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          v101 = @"com.apple.managedconfiguration.passcodechanged";
          __int16 v102 = 1024;
          uint32_t v103 = v71;
          _os_log_impl(&dword_1A13F0000, v72, OS_LOG_TYPE_ERROR, "Unable to register for message %{public}@: %d", buf, 0x12u);
        }
        v65 = v95;
        goto LABEL_45;
      }
      id v86 = v35;
      int v93 = 0;
      v74 = (const char *)[@"com.apple.managedconfiguration.restrictionchanged" cStringUsingEncoding:4];
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_14;
      v91[3] = &unk_1E5A65D28;
      v75 = v62;
      v92 = v75;
      uint32_t v76 = notify_register_dispatch(v74, &v93, v70, v91);

      uint32_t v77 = v76;
      if (v76)
      {
        v78 = qword_1EB2223B0;
        uint64_t v46 = v22;
        long long v48 = v88;
        if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          v101 = @"com.apple.managedconfiguration.restrictionchanged";
          __int16 v102 = 1024;
          uint32_t v79 = v77;
          uint32_t v103 = v77;
          _os_log_impl(&dword_1A13F0000, v78, OS_LOG_TYPE_ERROR, "Unable to register for message %{public}@: %d", buf, 0x12u);
          int v45 = 3;
          p_int out_token = &out_token;
          uint64_t v35 = v86;
          goto LABEL_58;
        }
        int v45 = 3;
        p_int out_token = &out_token;
      }
      else
      {
        uint64_t v46 = v22;
        long long v48 = v88;
        if (([v83 currentPasscodeCompliesWithPolicyFromRestrictions:v89 outError:0] & 1) == 0)
        {
          do
            dispatch_semaphore_wait(v75, 0xFFFFFFFFFFFFFFFFLL);
          while (![v83 currentPasscodeCompliesWithPolicyFromRestrictions:v89 outError:0]);
        }
        notify_cancel(out_token);
        int v45 = 2;
        p_int out_token = &v93;
      }
      uint64_t v35 = v86;
      uint32_t v79 = v77;
LABEL_58:
      notify_cancel(*p_out_token);

      uint64_t v19 = v89;
      uint64_t v57 = v83;
      if (v79) {
        goto LABEL_46;
      }
      goto LABEL_40;
    }
    int v45 = 3;
LABEL_47:

    goto LABEL_48;
  }
  int v45 = 2;
  uint64_t v46 = v22;
LABEL_49:

  return v45;
}

intptr_t __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_13(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __260__MCProfileConnection_Restrictions__applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_complianceBlocking_displayImmediateAlert_limitForUserEnrollment_outRestrictionChanged_outEffectiveSettingsChanged_outError___block_invoke_14(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)allClientUUIDsForClientType:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 allClientUUIDsForClientType:v4];

  return v6;
}

- (id)clientRestrictionsForClientUUID:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 clientRestrictionsForClientUUID:v4];

  return v6;
}

- (id)userInfoForClientUUID:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 userInfoForClientUUID:v4];

  return v6;
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (MCIsDaemonProcess)
  {
    id v8 = [NSClassFromString(&cfstr_Mcrestrictionm.isa) sharedManager];
    [v8 setUserInfo:v7 forClientUUID:v6 sender:@"profiled"];
  }
  else
  {
    id v8 = [(MCProfileConnection *)self xpcConnection];
    int v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30];
    [v9 setUserInfo:v7 forClientUUID:v6 completion:&__block_literal_global_30];

    id v6 = v7;
    id v7 = v9;
  }

  id v10 = +[MCRestrictionManager sharedManager];
  [v10 invalidateRestrictions];
}

void __63__MCProfileConnection_Restrictions__setUserInfo_forClientUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      BOOL v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set user info error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)clearUserInfoForClientUUIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = MCIsDaemonProcess;
  if (MCIsDaemonProcess)
  {
    BOOL v5 = [NSClassFromString(&cfstr_Mcrestrictionm.isa) sharedManager];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      uint64_t v10 = MEMORY[0x1E4F1CC08];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "setUserInfo:forClientUUID:sender:", v10, *(void *)(*((void *)&v13 + 1) + 8 * v11++), @"profiled", (void)v13);
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v4 != 0;
}

- (void)removeOrphanedClientRestrictions
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self xpcConnection];
  id v3 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22_0];
  [v3 removeOrphanedClientRestrictionsWithCompletion:&__block_literal_global_22_0];
}

void __69__MCProfileConnection_Restrictions__removeOrphanedClientRestrictions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      BOOL v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Remove orphaned client restrictions error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__MCProfileConnection_Restrictions__removeOrphanedClientRestrictionsWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1A6232FE0](v9);
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 removeOrphanedClientRestrictionsWithCompletion:v6];
}

void __84__MCProfileConnection_Restrictions__removeOrphanedClientRestrictionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Remove orphaned client restrictions error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (id)effectiveWhitelistedAppsAndOptions
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  id v3 = [v2 effectiveWhitelistedAppsAndOptions];

  return v3;
}

+ (NSArray)features
{
  if (features_onceToken != -1) {
    dispatch_once(&features_onceToken, &__block_literal_global_31);
  }
  id v2 = (void *)features_features;
  return (NSArray *)v2;
}

void __41__MCProfileConnection_Settings__features__block_invoke()
{
  id v14 = (id)objc_opt_new();
  v0 = +[MCRestrictionManager sharedManager];
  v1 = [v0 defaultRestrictions];

  id v2 = [v1 objectForKeyedSubscript:@"restrictedBool"];
  id v3 = [v2 allKeys];
  [v14 addObjectsFromArray:v3];

  id v4 = [v1 objectForKeyedSubscript:@"restrictedValue"];
  id v5 = [v4 allKeys];
  [v14 addObjectsFromArray:v5];

  int v6 = [v1 objectForKeyedSubscript:@"intersection"];
  uint64_t v7 = [v6 allKeys];
  [v14 addObjectsFromArray:v7];

  int v8 = [v1 objectForKeyedSubscript:@"union"];
  uint64_t v9 = [v8 allKeys];
  [v14 addObjectsFromArray:v9];

  uint64_t v10 = [v1 objectForKeyedSubscript:@"assignedObject"];
  uint64_t v11 = [v10 allKeys];
  [v14 addObjectsFromArray:v11];

  uint64_t v12 = [v14 copy];
  long long v13 = (void *)features_features;
  features_features = v12;
}

- (void)setParametersForSettingsByType:(id)a3
{
}

- (void)setParametersForSettingsByType:(id)a3 passcode:(id)a4
{
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5
{
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6
{
}

- (void)setParametersForSettingsByType:(id)a3 passcode:(id)a4 completion:(id)a5
{
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6 completion:(id)a7
{
}

- (void)setParametersForSettingsByType:(id)a3 toSystem:(BOOL)a4 user:(BOOL)a5 passcode:(id)a6 waitUntilCompleted:(BOOL)a7 completion:(id)a8
{
  LOBYTE(v8) = a7;
  [(MCProfileConnection *)self setParametersForSettingsByType:a3 configurationUUID:0 toSystem:a4 user:a5 passcode:a6 credentialSet:0 waitUntilCompleted:v8 completion:a8];
}

- (void)setParameters:(id)a3 forBoolSetting:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v11 = v7;
  uint64_t v12 = @"restrictedBool";
  id v10 = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  [(MCProfileConnection *)self setParametersForSettingsByType:v9];
}

- (void)setParameters:(id)a3 forValueSetting:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v11 = v7;
  uint64_t v12 = @"restrictedValue";
  id v10 = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  [(MCProfileConnection *)self setParametersForSettingsByType:v9];
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 passcode:(id)a5
{
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 passcode:(id)a5 completion:(id)a6
{
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 passcode:(id)a6
{
  LOBYTE(v6) = 1;
  [(MCProfileConnection *)self setBoolValue:a3 ask:a4 forSetting:a5 configurationUUID:0 toSystem:1 user:0 passcode:a6 credentialSet:0 waitUntilCompleted:v6 completion:0];
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 passcode:(id)a6 completion:(id)a7
{
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 completion:(id)a9
{
  LOBYTE(v9) = 0;
  [(MCProfileConnection *)self setBoolValue:a3 ask:a4 forSetting:a5 configurationUUID:0 toSystem:a6 user:a7 passcode:a8 credentialSet:0 waitUntilCompleted:v9 completion:a9];
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9
{
  LOBYTE(v9) = 1;
  [(MCProfileConnection *)self setBoolValue:a3 ask:a4 forSetting:a5 configurationUUID:a6 toSystem:a7 user:a8 passcode:a9 credentialSet:0 waitUntilCompleted:v9 completion:0];
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8 passcode:(id)a9 completion:(id)a10
{
  LOBYTE(v10) = 0;
  [(MCProfileConnection *)self setBoolValue:a3 ask:a4 forSetting:a5 configurationUUID:a6 toSystem:a7 user:a8 passcode:a9 credentialSet:0 waitUntilCompleted:v10 completion:a10];
}

- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8
{
  LOBYTE(v8) = 1;
  [(MCProfileConnection *)self setAsk:a3 forBoolSetting:a4 configurationUUID:a5 toSystem:a6 user:a7 passcode:a8 waitUntilCompleted:v8 completion:0];
}

- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 completion:(id)a9
{
  LOBYTE(v9) = 0;
  [(MCProfileConnection *)self setAsk:a3 forBoolSetting:a4 configurationUUID:a5 toSystem:a6 user:a7 passcode:a8 waitUntilCompleted:v9 completion:a9];
}

- (void)setAsk:(BOOL)a3 forBoolSetting:(id)a4 configurationUUID:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7 passcode:(id)a8 waitUntilCompleted:(BOOL)a9 completion:(id)a10
{
  BOOL v24 = a6;
  BOOL v25 = a7;
  BOOL v13 = a3;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v15 = a10;
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v30 = @"restrictedBool";
  id v28 = v18;
  uint64_t v26 = @"ask";
  uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithBool:v13];
  uint64_t v27 = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  uint64_t v29 = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v31[0] = v21;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];

  LOBYTE(v23) = a9;
  [(MCProfileConnection *)self setParametersForSettingsByType:v22 configurationUUID:v17 toSystem:v24 user:v25 passcode:v16 credentialSet:0 waitUntilCompleted:v23 completion:v15];
}

- (void)setValue:(id)a3 forSetting:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self setValue:v7 forSetting:v6 passcode:0];
}

- (void)setValue:(id)a3 forSetting:(id)a4 passcode:(id)a5
{
}

- (void)setValue:(id)a3 forSetting:(id)a4 passcode:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v14 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    *(_DWORD *)long long buf = 67109378;
    int v27 = [v10 unsignedIntValue];
    __int16 v28 = 2114;
    id v29 = v11;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEFAULT, "Set value %u for settings: %{public}@", buf, 0x12u);
  }
  BOOL v24 = @"restrictedValue";
  id v21 = v10;
  id v22 = v11;
  id v20 = @"value";
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  uint64_t v23 = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  BOOL v25 = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  LOBYTE(v19) = 0;
  [(MCProfileConnection *)self setParametersForSettingsByType:v18 configurationUUID:0 toSystem:1 user:0 passcode:v13 credentialSet:0 waitUntilCompleted:v19 completion:v12];
}

- (void)setValues:(id)a3 forIntersectionSetting:(id)a4
{
}

- (void)setValues:(id)a3 forUnionSetting:(id)a4
{
}

- (id)errorCheckedSetBoolValue:(BOOL)a3 forSetting:(id)a4
{
  BOOL v4 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__9;
  id v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __69__MCProfileConnection_Settings__errorCheckedSetBoolValue_forSetting___block_invoke;
  v15[3] = &unk_1E5A680A0;
  void v15[4] = &v16;
  id v7 = (void *)MEMORY[0x1A6232FE0](v15);
  uint64_t v26 = @"restrictedBool";
  id v24 = v6;
  id v22 = @"value";
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  uint64_t v23 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  BOOL v25 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

  LOBYTE(v14) = 1;
  [(MCProfileConnection *)self setParametersForSettingsByType:v11 configurationUUID:0 toSystem:1 user:0 passcode:0 credentialSet:0 waitUntilCompleted:v14 errorCompletionBlock:v7];
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __69__MCProfileConnection_Settings__errorCheckedSetBoolValue_forSetting___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      id v7 = [v4 MCVerboseDescription];
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Set parameters for settings error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    uint64_t v8 = +[MCRestrictionManager sharedManager];
    [v8 invalidateSettings];
  }
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 errorCompletionBlock:(id)a5
{
  BOOL v6 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __78__MCProfileConnection_Settings__setBoolValue_forSetting_errorCompletionBlock___block_invoke;
  id v20 = &unk_1E5A68118;
  id v21 = v8;
  id v9 = v8;
  id v10 = a4;
  uint64_t v11 = (void *)MEMORY[0x1A6232FE0](&v17);
  uint64_t v26 = @"restrictedBool";
  id v24 = v10;
  id v22 = @"value";
  id v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  uint64_t v23 = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  BOOL v25 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[0] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

  LOBYTE(v16) = 0;
  -[MCProfileConnection setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:](self, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:waitUntilCompleted:errorCompletionBlock:", v15, 0, 1, 0, 0, 0, v16, v11, v17, v18, v19, v20);
}

void __78__MCProfileConnection_Settings__setBoolValue_forSetting_errorCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (!os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v5 = v4;
    BOOL v6 = [v3 MCVerboseDescription];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Set parameters for settings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  else
  {
    id v5 = +[MCRestrictionManager sharedManager];
    [v5 invalidateSettings];
  }

LABEL_6:
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 completion:(id)a8
{
}

- (void)setValue:(id)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
}

- (void)setValue:(id)a3 forSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v15 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    *(_DWORD *)long long buf = 67109378;
    int v27 = [v12 unsignedIntValue];
    __int16 v28 = 2114;
    id v29 = v13;
    _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_DEFAULT, "Set value %u for settings: %{public}@", buf, 0x12u);
  }
  id v24 = @"restrictedValue";
  id v21 = v12;
  id v22 = v13;
  id v20 = @"value";
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  uint64_t v23 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  BOOL v25 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [(MCProfileConnection *)self setParametersForSettingsByType:v19 toSystem:v9 user:v8 passcode:v14];
}

- (void)setValues:(id)a3 forIntersectionSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v12 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v11;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEFAULT, "Set values %{public}@ for intersection settings: %{public}@", buf, 0x16u);
  }
  id v20 = @"intersection";
  id v18 = v11;
  if (v10)
  {
    uint64_t v16 = @"values";
    id v17 = v10;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v19 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v21 = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [(MCProfileConnection *)self setParametersForSettingsByType:v15 toSystem:v7 user:v6];

  if (v10) {
}
  }

- (void)setValues:(id)a3 forUnionSetting:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v12 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v11;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEFAULT, "Set values %{public}@ for union settings: %{public}@", buf, 0x16u);
  }
  id v20 = @"union";
  id v18 = v11;
  if (v10)
  {
    uint64_t v16 = @"values";
    id v17 = v10;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v19 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v21 = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [(MCProfileConnection *)self setParametersForSettingsByType:v15 toSystem:v7 user:v6];

  if (v10) {
}
  }

- (id)userSettingsForSystem
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  id v3 = [v2 systemUserSettings];

  return v3;
}

- (id)userSettingsForCurrentUser
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  id v3 = [v2 userUserSettings];

  return v3;
}

- (id)userSettingsForPairedDevice
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  return v2;
}

- (id)parametersForBoolSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = [(MCProfileConnection *)self userSettings];
  BOOL v6 = [v5 objectForKey:@"restrictedBool"];
  BOOL v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)parametersForValueSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = [(MCProfileConnection *)self userSettings];
  BOOL v6 = [v5 objectForKey:@"restrictedValue"];
  BOOL v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)parametersForIntersectionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = [(MCProfileConnection *)self userSettings];
  BOOL v6 = [v5 objectForKey:@"intersection"];
  BOOL v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)parametersForUnionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = [(MCProfileConnection *)self userSettings];
  BOOL v6 = [v5 objectForKeyedSubscript:@"values"];
  BOOL v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (int)defaultBoolValueForSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  LODWORD(self) = +[MCRestrictionManager defaultBoolValueForSetting:v4];

  return (int)self;
}

- (id)defaultValueForSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager defaultValueForSetting:v4];

  return v5;
}

- (id)defaultValuesForIntersectionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager defaultIntersectedValuesForSetting:v4];

  return v5;
}

- (id)defaultValuesForUnionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager defaultUnionValuesForSetting:v4];

  return v5;
}

- (id)defaultParametersForBoolSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager defaultParametersForBoolSetting:v4];

  return v5;
}

- (id)defaultParametersForValueSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager defaultParametersForValueSetting:v4];

  return v5;
}

- (id)defaultParametersForIntersectionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager defaultParametersForIntersectedValuesSetting:v4];

  return v5;
}

- (id)defaultParametersForUnionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager defaultParametersForUnionValuesSetting:v4];

  return v5;
}

- (int)effectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 outAsk:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    int v10 = 0;
  }
  else
  {
    id v11 = [(MCProfileConnection *)self effectiveParametersForBoolSetting:v8 configurationUUID:v9];
    id v12 = [v11 objectForKeyedSubscript:@"value"];
    id v13 = v12;
    if (v12)
    {
      if ([v12 BOOLValue])
      {
        if (a5)
        {
          id v14 = [v11 objectForKeyedSubscript:@"ask"];
          *a5 = [v14 BOOLValue];
        }
        int v10 = 1;
      }
      else
      {
        int v10 = 2;
      }
    }
    else
    {
      int v10 = 0;
    }
  }
  return v10;
}

- (int)effectiveBoolValueForWatchSetting:(id)a3 pairedDevice:(id)a4
{
  return [(MCProfileConnection *)self effectiveBoolValueForWatchSetting:a3 pairedDevice:a4 outError:0];
}

- (id)effectiveValueForWatchSetting:(id)a3 pairedDevice:(id)a4
{
  return [(MCProfileConnection *)self effectiveValueForWatchSetting:a3 pairedDevice:a4 outError:0];
}

- (id)effectiveValuesForWatchIntersectionSetting:(id)a3 pairedDevice:(id)a4
{
  return [(MCProfileConnection *)self effectiveValuesForWatchIntersectionSetting:a3 pairedDevice:a4 outError:0];
}

- (id)effectiveValuesForWatchUnionSetting:(id)a3 pairedDevice:(id)a4
{
  return [(MCProfileConnection *)self effectiveValuesForWatchUnionSetting:a3 pairedDevice:a4 outError:0];
}

- (int)effectiveBoolValueForWatchSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    int v10 = 0;
  }
  else
  {
    id v11 = [v9 valueForProperty:*MEMORY[0x1E4F79E10]];
    id v12 = [v9 valueForProperty:*MEMORY[0x1E4F79DC8]];
    uint64_t v26 = 0;
    int v27 = &v26;
    uint64_t v28 = 0x2020000000;
    int v29 = 0;
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__9;
    __int16 v24 = __Block_byref_object_dispose__9;
    id v25 = 0;
    id v13 = [(MCProfileConnection *)self xpcConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke;
    v19[3] = &unk_1E5A680A0;
    v19[4] = &v20;
    id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke_2;
    v18[3] = &unk_1E5A68410;
    void v18[4] = &v20;
    v18[5] = &v26;
    [v14 effectiveBoolValueForWatchSetting:v8 pairingID:v11 pairingDataStore:v12 completion:v18];

    if (v21[5])
    {
      id v15 = (id)qword_1EB2223B0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [(id)v21[5] MCVerboseDescription];
        *(_DWORD *)long long buf = 138543618;
        id v31 = v8;
        __int16 v32 = 2114;
        uint64_t v33 = v16;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve effective BOOL for feature “%{public}@” with error: %{public}@", buf, 0x16u);
      }
      int v10 = 0;
      if (a5) {
        *a5 = (id) v21[5];
      }
    }
    else
    {
      int v10 = *((_DWORD *)v27 + 6);
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v10;
}

void __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __89__MCProfileConnection_Settings__effectiveBoolValueForWatchSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v7)
  {
    if ([v7 BOOLValue]) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

- (id)effectiveValueForWatchSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v9 valueForProperty:*MEMORY[0x1E4F79E10]];
    id v12 = [v9 valueForProperty:*MEMORY[0x1E4F79DC8]];
    uint64_t v26 = 0;
    int v27 = &v26;
    uint64_t v28 = 0x3032000000;
    int v29 = __Block_byref_object_copy__9;
    uint64_t v30 = __Block_byref_object_dispose__9;
    id v31 = 0;
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__9;
    __int16 v24 = __Block_byref_object_dispose__9;
    id v25 = 0;
    id v13 = [(MCProfileConnection *)self xpcConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke;
    v19[3] = &unk_1E5A680A0;
    v19[4] = &v20;
    id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke_2;
    v18[3] = &unk_1E5A68410;
    void v18[4] = &v20;
    v18[5] = &v26;
    [v14 effectiveValueForWatchSetting:v8 pairingID:v11 pairingDataStore:v12 completion:v18];

    if (v21[5])
    {
      id v15 = (id)qword_1EB2223B0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [(id)v21[5] MCVerboseDescription];
        *(_DWORD *)long long buf = 138543618;
        id v33 = v8;
        __int16 v34 = 2114;
        uint64_t v35 = v16;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve effective value for feature “%{public}@” with error: %{public}@", buf, 0x16u);
      }
      id v10 = 0;
      if (a5) {
        *a5 = (id) v21[5];
      }
    }
    else
    {
      id v10 = (id)v27[5];
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v10;
}

void __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __85__MCProfileConnection_Settings__effectiveValueForWatchSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)effectiveValuesForWatchIntersectionSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v9 valueForProperty:*MEMORY[0x1E4F79E10]];
    id v12 = [v9 valueForProperty:*MEMORY[0x1E4F79DC8]];
    uint64_t v26 = 0;
    int v27 = &v26;
    uint64_t v28 = 0x3032000000;
    int v29 = __Block_byref_object_copy__9;
    uint64_t v30 = __Block_byref_object_dispose__9;
    id v31 = 0;
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__9;
    __int16 v24 = __Block_byref_object_dispose__9;
    id v25 = 0;
    id v13 = [(MCProfileConnection *)self xpcConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke;
    v19[3] = &unk_1E5A680A0;
    v19[4] = &v20;
    id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke_2;
    v18[3] = &unk_1E5A68438;
    void v18[4] = &v20;
    v18[5] = &v26;
    [v14 effectiveValuesForWatchIntersectionSetting:v8 pairingID:v11 pairingDataStore:v12 completion:v18];

    if (v21[5])
    {
      id v15 = (id)qword_1EB2223B0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [(id)v21[5] MCVerboseDescription];
        *(_DWORD *)long long buf = 138543618;
        id v33 = v8;
        __int16 v34 = 2114;
        uint64_t v35 = v16;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve effective intersection values for feature “%{public}@” with error: %{public}@", buf, 0x16u);
      }
      id v10 = 0;
      if (a5) {
        *a5 = (id) v21[5];
      }
    }
    else
    {
      id v10 = (id)v27[5];
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v10;
}

void __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __98__MCProfileConnection_Settings__effectiveValuesForWatchIntersectionSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)effectiveValuesForWatchUnionSetting:(id)a3 pairedDevice:(id)a4 outError:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v9 valueForProperty:*MEMORY[0x1E4F79E10]];
    id v12 = [v9 valueForProperty:*MEMORY[0x1E4F79DC8]];
    uint64_t v26 = 0;
    int v27 = &v26;
    uint64_t v28 = 0x3032000000;
    int v29 = __Block_byref_object_copy__9;
    uint64_t v30 = __Block_byref_object_dispose__9;
    id v31 = 0;
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__9;
    __int16 v24 = __Block_byref_object_dispose__9;
    id v25 = 0;
    id v13 = [(MCProfileConnection *)self xpcConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke;
    v19[3] = &unk_1E5A680A0;
    v19[4] = &v20;
    id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke_2;
    v18[3] = &unk_1E5A68438;
    void v18[4] = &v20;
    v18[5] = &v26;
    [v14 effectiveValuesForWatchUnionSetting:v8 pairingID:v11 pairingDataStore:v12 completion:v18];

    if (v21[5])
    {
      id v15 = (id)qword_1EB2223B0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [(id)v21[5] MCVerboseDescription];
        *(_DWORD *)long long buf = 138543618;
        id v33 = v8;
        __int16 v34 = 2114;
        uint64_t v35 = v16;
        _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve effective union values for feature “%{public}@” with error: %{public}@", buf, 0x16u);
      }
      id v10 = 0;
      if (a5) {
        *a5 = (id) v21[5];
      }
    }
    else
    {
      id v10 = (id)v27[5];
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v10;
}

void __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __91__MCProfileConnection_Settings__effectiveValuesForWatchUnionSetting_pairedDevice_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)requestEffectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke;
  v27[3] = &unk_1E5A68488;
  id v28 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)MEMORY[0x1A6232FE0](v27);
  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  id v17 = [v16 UUIDString];

  id v18 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  __int16 v24 = __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_2;
  id v25 = &unk_1E5A68118;
  id v26 = v15;
  id v19 = v15;
  uint64_t v20 = [v18 remoteObjectProxyWithErrorHandler:&v22];
  objc_msgSend(v20, "showFeaturePromptForSetting:configurationUUID:promptOptions:promptIdentifier:completion:", v14, v13, v12, v17, v19, v22, v23, v24, v25);

  return v17;
}

void __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id v8 = [v5 MCVerboseDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Request effective restricted BOOL value error. Error: %{public}@", buf, 0xCu);
    }
  }
  id v9 = *(void **)(a1 + 32);
  if (v9)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_13;
    block[3] = &unk_1E5A68460;
    id v13 = v9;
    int v14 = a2;
    id v12 = v5;
    dispatch_async(v10, block);
  }
}

uint64_t __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __112__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requestEffectiveBoolValueForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__9;
  __int16 v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  id v13 = [(MCProfileConnection *)self xpcConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke;
  v19[3] = &unk_1E5A680A0;
  v19[4] = &v20;
  int v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke_2;
  v18[3] = &unk_1E5A684B0;
  void v18[4] = &v20;
  v18[5] = &v26;
  [v14 showFeaturePromptForSetting:v10 configurationUUID:v11 promptOptions:v12 promptIdentifier:0 completion:v18];

  if (a6)
  {
    id v15 = (void *)v21[5];
    if (v15) {
      *a6 = v15;
    }
  }
  int v16 = *((_DWORD *)v27 + 6);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __110__MCProfileConnection_Settings__requestEffectiveBoolValueForSetting_configurationUUID_promptOptions_outError___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)cancelRequestEffectiveBoolValue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke;
  v18[3] = &unk_1E5A68118;
  id v19 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1A6232FE0](v18);
  id v10 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_2;
  int v16 = &unk_1E5A68118;
  id v17 = v9;
  id v11 = v9;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:&v13];
  objc_msgSend(v12, "cancelFeaturePromptWithIdentifier:completion:", v8, v11, v13, v14, v15, v16);
}

void __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Cancel request effective restricted BOOL value error. Error: %{public}@", buf, 0xCu);
    }
  }
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_16;
    v9[3] = &unk_1E5A684D8;
    id v11 = v7;
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__MCProfileConnection_Settings__cancelRequestEffectiveBoolValue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  char v6 = [v5 isSettingLockedDownByRestrictions:v4];

  return v6;
}

- (BOOL)_areProfilesRestrictingSettings:(id)a3 outMDMName:(id *)a4 outExchangeName:(id *)a5 outExchangeCount:(int64_t *)a6 outProfileName:(id *)a7 outProfileCount:(int64_t *)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  int v45 = v9;
  uint64_t v46 = [(MCProfileConnection *)self _settingsLockedDownByRestrictions:v9];
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = MDMFilePath();
  id v12 = [v10 dictionaryWithContentsOfFile:v11];

  if (v12)
  {
    int v50 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F732D0]];
  }
  else
  {
    int v50 = 0;
  }
  uint64_t v13 = +[MCRestrictionManager sharedManager];
  uint64_t v14 = [v13 profileIdentifiersRestrictingSettings:v46];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    int64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v48 = 0;
    uint64_t v19 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v22 = (void *)MEMORY[0x1A6232D90]();
        if (v12 && [v21 isEqualToString:v50])
        {
          uint64_t v23 = +[MCManifest installedProfileWithIdentifier:v21];
          __int16 v24 = [v23 organization];

          if (v24)
          {
            uint64_t v25 = [v23 organization];

            uint64_t v48 = v25;
          }
          else
          {
            uint64_t v27 = [v23 friendlyName];

            ++v17;
            uint64_t v18 = v27;
          }
        }
        else
        {
          if (!v18)
          {
            uint64_t v26 = +[MCManifest installedProfileWithIdentifier:v21];
            uint64_t v18 = [v26 friendlyName];
          }
          ++v17;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v16);
  }
  else
  {
    int64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v48 = 0;
  }

  uint64_t v28 = +[MCRestrictionManager sharedManager];
  int v29 = [v28 exchangeUUIDsRestrictingSettings:v46];

  uint64_t v30 = [MEMORY[0x1E4F179C8] defaultStore];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v31 = v29;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    int64_t v47 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(v31);
        }
        BOOL v37 = [v30 accountWithIdentifier:*(void *)(*((void *)&v51 + 1) + 8 * j)];
        uint64_t v38 = v37;
        if (!v34)
        {
          uint64_t v34 = [v37 accountDescription];
        }
      }
      v47 += v33;
      uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v33);
  }
  else
  {
    int64_t v47 = 0;
    uint64_t v34 = 0;
  }

  if (a4) {
    *a4 = (id) v48;
  }
  if (a5) {
    *a5 = (id) v34;
  }
  if (a6) {
    *a6 = v47;
  }
  if (a7) {
    *a7 = (id) v18;
  }
  if (a8) {
    *a8 = v17;
  }

  return (v48 | v18 | v34) != 0;
}

- (id)localizedRestrictionSourceDescriptionForFeatures:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  id v12 = 0;
  id v13 = 0;
  id v11 = 0;
  BOOL v5 = [(MCProfileConnection *)self _areProfilesRestrictingSettings:v4 outMDMName:&v13 outExchangeName:&v12 outExchangeCount:&v15 outProfileName:&v11 outProfileCount:&v14];

  id v6 = v13;
  id v7 = v12;
  id v8 = v11;
  id v9 = 0;
  if (v5)
  {
    id v9 = [(MCProfileConnection *)self _localizedRestrictionSourceDescriptionFromMDMName:v6 exchangeName:v7 exchangeCount:v15 profileName:v8 profileCount:v14];
  }

  return v9;
}

- (id)_settingsLockedDownByRestrictions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[MCProfileConnection isSettingLockedDownByRestrictions:](self, "isSettingLockedDownByRestrictions:", v11, (void)v14))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  return v12;
}

- (BOOL)areSettingsLockedDownByRestrictions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[MCProfileConnection isSettingLockedDownByRestrictions:](self, "isSettingLockedDownByRestrictions:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)isValueSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  char v6 = [v5 isValueSettingLockedDownByRestrictions:v4];

  return v6;
}

- (BOOL)isIntersectionSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  char v6 = [v5 isIntersectionSettingLockedDownByRestrictions:v4];

  return v6;
}

- (BOOL)isUnionSettingLockedDownByRestrictions:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCRestrictionManager sharedManager];
  char v6 = [v5 isUnionSettingLockedDownByRestrictions:v4];

  return v6;
}

- (void)removeBoolSetting:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Remove Bool settings: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  char v6 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_20_0];
  [v7 removeBoolSetting:v4 completion:&__block_literal_global_20_0];
}

void __51__MCProfileConnection_Settings__removeBoolSetting___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Remove BOOL setting error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)removeValueSetting:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Remove Value settings: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  int v6 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22_1];
  [v7 removeValueSetting:v4 completion:&__block_literal_global_22_1];
}

void __52__MCProfileConnection_Settings__removeValueSetting___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Remove value setting error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)resetAllSettingsToDefaults
{
}

void __59__MCProfileConnection_Settings__resetAllSettingsToDefaults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Reset all settings error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4
{
}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v9 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"NO";
    if (v6) {
      uint64_t v10 = @"YES";
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEFAULT, "Reset all settings to defaults. User Initiated: %{public}@", buf, 0xCu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__MCProfileConnection_Settings__resetAllSettingsToDefaultsIsUserInitiated_waitUntilCompleted_completion___block_invoke;
  v16[3] = &unk_1E5A68118;
  id v17 = v8;
  id v11 = v8;
  long long v12 = (void *)MEMORY[0x1A6232FE0](v16);
  long long v13 = [(MCProfileConnection *)self xpcConnection];
  long long v14 = v13;
  if (v5) {
    [v13 synchronousRemoteObjectProxyWithErrorHandler:v12];
  }
  else {
  long long v15 = [v13 remoteObjectProxyWithErrorHandler:v12];
  }

  [v15 resetAllSettingsToDefaultsIsUserInitiated:v6 completion:v12];
}

void __105__MCProfileConnection_Settings__resetAllSettingsToDefaultsIsUserInitiated_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      BOOL v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Reset all settings error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (int)userBoolValueForSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  int v6 = [v5 BOOLSettingForFeature:v4];

  return v6;
}

- (id)userValueForSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  int v6 = [v5 valueSettingForFeature:v4];

  return v6;
}

- (id)userValueForIntersectionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  int v6 = [v5 intersectedValuesSettingForFeature:v4];

  return v6;
}

- (id)userValueForUnionSetting:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = +[MCRestrictionManager sharedManager];
  int v6 = [v5 unionValuesSettingForFeature:v4];

  return v6;
}

- (id)lockedDownRootCertificatesWithOutLocalizedSourceDescription:(id *)a3
{
  id v4 = self;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v47 = [MEMORY[0x1E4F1CA48] array];
  BOOL v5 = +[MCManifest sharedManifest];
  int v6 = [v5 allProfileIdentifiersInstalledNonInteractivelyWithFilterFlags:1];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
  int v8 = [(MCProfileConnection *)v4 installedProfileIdentifiersWithFilterFlags:2];
  [v7 addObjectsFromArray:v8];

  id v9 = [(MCProfileConnection *)v4 installedMDMProfileIdentifier];
  if (v9) {
    [v7 addObject:v9];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v10 = v7;
  uint64_t v41 = [v10 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v41)
  {
    uint64_t v46 = 0;
    uint64_t v49 = 0;
    id v31 = 0;
    uint64_t v30 = v10;
    goto LABEL_35;
  }
  uint64_t v36 = v4;
  BOOL v37 = a3;
  uint64_t v38 = v6;
  char v44 = 0;
  uint64_t v49 = 0;
  uint64_t v46 = 0;
  uint64_t v40 = *(void *)v55;
  id v39 = v10;
  do
  {
    for (uint64_t i = 0; i != v41; ++i)
    {
      if (*(void *)v55 != v40) {
        objc_enumerationMutation(v10);
      }
      long long v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      long long v13 = (void *)MEMORY[0x1A6232D90]();
      long long v14 = +[MCManifest sharedManifest];
      int v45 = v12;
      long long v15 = [v14 installedProfileWithIdentifier:v12];

      if (v15)
      {
        uint64_t v42 = v13;
        uint64_t v43 = i;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v16 = [v15 payloads];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v51;
          uint64_t v48 = v16;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v51 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v50 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v22 = v21;
                if ([v22 isFullyTrustedRootCert])
                {
                  uint64_t v23 = (__SecCertificate *)[v22 copyCertificate];
                  if (v23)
                  {
                    __int16 v24 = v23;
                    CFDataRef v25 = SecCertificateCopyData(v23);
                    [v47 addObject:v25];
                    uint64_t v26 = v15;
                    [v15 installOptions];
                    v28 = uint64_t v27 = v9;
                    int v29 = [v28 objectForKey:@"managingProfileIdentifier"];

                    id v9 = v27;
                    if (v27
                      && (([v45 isEqualToString:v27] & 1) != 0
                       || v29 && ([v29 isEqualToString:v27] & 1) != 0))
                    {
                      char v44 = 1;
                    }
                    else
                    {
                      if (!v46)
                      {
                        uint64_t v46 = [v26 friendlyName];
                      }
                      ++v49;
                    }
                    CFRelease(v24);

                    long long v15 = v26;
                    long long v16 = v48;
                  }
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v18);
        }

        id v10 = v39;
        long long v13 = v42;
        uint64_t i = v43;
      }
    }
    uint64_t v41 = [v10 countByEnumeratingWithState:&v54 objects:v59 count:16];
  }
  while (v41);

  a3 = v37;
  if (v44)
  {
    id v4 = v36;
    uint64_t v30 = [(MCProfileConnection *)v36 installedProfileWithIdentifier:v9];
    id v31 = [v30 friendlyName];
    int v6 = v38;
LABEL_35:

    goto LABEL_37;
  }
  id v31 = 0;
  int v6 = v38;
  id v4 = v36;
LABEL_37:
  uint64_t v32 = [(MCProfileConnection *)v4 _localizedCertificateSourceDescriptionFromMDMName:v31 exchangeName:0 exchangeCount:0 profileName:v46 profileCount:v49];
  uint64_t v33 = v32;
  if (a3) {
    *a3 = v32;
  }
  id v34 = v47;

  return v34;
}

- (id)permittedAutoLockSeconds
{
  id v2 = +[MCHacks sharedHacks];
  id v3 = [v2 permittedAutoLockNumbers];

  return v3;
}

- (void)_setAllowedGrandfatheredRestrictionFeature:(id)a3 forRestrictionKey:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = MCSystemMetadataFilePath();
  char v9 = [v7 fileExistsAtPath:v8];

  id v10 = (void *)MEMORY[0x1E4F1CA60];
  if (v9)
  {
    id v11 = MCSystemMetadataFilePath();
    long long v12 = [v10 dictionaryWithContentsOfFile:v11];
  }
  else
  {
    long long v12 = objc_opt_new();
  }
  long long v13 = [v12 objectForKeyedSubscript:@"AllowedGrandfatheredRestrictions"];
  long long v14 = (void *)[v13 mutableCopy];

  if ([v14 count])
  {
    long long v15 = [v14 objectForKeyedSubscript:v6];
    if ([v15 count])
    {
      long long v16 = (void *)[v15 mutableCopy];
      if (([v16 containsObject:v5] & 1) == 0)
      {
        [v16 addObject:v5];
        uint64_t v17 = [v16 copy];

        long long v15 = (void *)v17;
      }
    }
    else
    {
      v22[0] = v5;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

      long long v15 = (void *)v18;
    }
  }
  else
  {
    id v21 = v5;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  }
  [v14 setObject:v15 forKeyedSubscript:v6];

  uint64_t v19 = (void *)[v14 copy];
  [v12 setObject:v19 forKeyedSubscript:@"AllowedGrandfatheredRestrictions"];

  uint64_t v20 = MCSystemMetadataFilePath();
  [v12 MCWriteToBinaryFile:v20];
}

- (void)setAllowedGrandfatheredRestrictionBoolFeature:(id)a3
{
}

- (void)setAllowedGrandfatheredRestrictionValueFeature:(id)a3
{
}

- (void)setAllowedGrandfatheredRestrictionIntersectionFeature:(id)a3
{
}

- (void)setAllowedGrandfatheredRestrictionUnionFeature:(id)a3
{
}

- (void)lockDeviceImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCPasscodeManager sharedManager];
  [v4 lockDeviceImmediately:v3];
}

- (void)lockDevice
{
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self lockDeviceImmediately:0];
}

- (BOOL)isPasscodeRequired
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 restrictedBoolForFeature:@"forcePIN"] == 1;

  return v3;
}

- (BOOL)isPasscodeRequiredByProfiles
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 systemProfileRestrictions];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [v3 objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        int v10 = +[MCRestrictionManager restrictedBoolForFeature:@"forcePIN" withRestrictionsDictionary:v9];

        if (v10 == 1)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isPasscodeModificationAllowed
{
  [(MCProfileConnection *)self checkInIfNeeded];
  if ([MEMORY[0x1E4F5E7A8] isSharediPad]) {
    return 1;
  }
  return +[MCRestrictionManager mayChangePasscode];
}

- (BOOL)isPasscodeRecoveryAllowed
{
  BOOL v3 = [(MCProfileConnection *)self isPasscodeRecoverySupported];
  if (v3) {
    LOBYTE(v3) = [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPasscodeRecovery"] != 2;
  }
  return v3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  if (![(MCProfileConnection *)self isPasscodeRecoverySupported]
    || [(MCProfileConnection *)self isSettingLockedDownByRestrictions:@"allowPasscodeRecovery"]|| ![(MCProfileConnection *)self isPasscodeModificationAllowed])
  {
    return 1;
  }
  return [(MCProfileConnection *)self isLockdownModeEnabled];
}

- (void)setPasscodeRecoveryAllowed:(BOOL)a3 passcode:(id)a4
{
  id v4 = -[MCProfileConnection setPasscodeRecoveryAllowed:](self, "setPasscodeRecoveryAllowed:", a3, a4);
}

- (id)setPasscodeRecoveryAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MCProfileConnection *)self isPasscodeRecoverySupported])
  {
    long long v12 = [(MCProfileConnection *)self errorCheckedSetBoolValue:v3 forSetting:@"allowPasscodeRecovery"];
  }
  else
  {
    long long v13 = (void *)MEMORY[0x1E4F28C58];
    long long v14 = MCErrorArray(@"SETTINGS_SETTING_IS_RESTRICTED", v5, v6, v7, v8, v9, v10, v11, 0);
    long long v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    long long v12 = [v13 MCErrorWithDomain:@"MCSettingsErrorDomain" code:28003 descriptionArray:v14 underlyingError:v15 errorType:@"MCFatalError"];
  }
  return v12;
}

- (void)setPasscodeRecoveryAllowed:(BOOL)a3 passcode:(id)a4 completionBlock:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__MCProfileConnection_Passcode__setPasscodeRecoveryAllowed_passcode_completionBlock___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v7;
  id v8 = v7;
  [(MCProfileConnection *)self setPasscodeRecoveryAllowed:v5 completionBlock:v9];
}

uint64_t __85__MCProfileConnection_Passcode__setPasscodeRecoveryAllowed_passcode_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPasscodeRecoveryAllowed:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = (void (**)(id, void *))a4;
  if ([(MCProfileConnection *)self isPasscodeRecoverySupported])
  {
    [(MCProfileConnection *)self setBoolValue:v4 forSetting:@"allowPasscodeRecovery" errorCompletionBlock:v17];
  }
  else if (v17)
  {
    long long v13 = (void *)MEMORY[0x1E4F28C58];
    long long v14 = MCErrorArray(@"SETTINGS_SETTING_IS_RESTRICTED", v6, v7, v8, v9, v10, v11, v12, 0);
    long long v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    long long v16 = [v13 MCErrorWithDomain:@"MCSettingsErrorDomain" code:28003 descriptionArray:v14 underlyingError:v15 errorType:@"MCFatalError"];

    v17[2](v17, v16);
  }
}

- (BOOL)recoveryPasscodeAvailable
{
  int v2 = [(MCProfileConnection *)self isPasscodeRecoveryAllowed];
  if (v2)
  {
    LOBYTE(v2) = MCKeybagMementoBlobExists();
  }
  return v2;
}

- (id)clearRecoveryPasscode
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__10;
  long long v14 = __Block_byref_object_dispose__10;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke;
  v9[3] = &unk_1E5A680A0;
  void v9[4] = &v10;
  BOOL v3 = (void *)MEMORY[0x1A6232FE0](v9);
  BOOL v4 = [(MCProfileConnection *)self xpcConnection];
  BOOL v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke_5;
  v8[3] = &unk_1E5A680A0;
  v8[4] = &v10;
  [v5 clearRecoveryPasscodeWithCompletion:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    BOOL v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      uint64_t v7 = [v4 MCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Clear recovery passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __54__MCProfileConnection_Passcode__clearRecoveryPasscode__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    BOOL v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      uint64_t v7 = [v4 MCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Clear recovery passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)clearRecoveryPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__MCProfileConnection_Passcode__clearRecoveryPasscodeWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1A6232FE0](v9);
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  int v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 clearRecoveryPasscodeWithCompletion:v6];
}

void __69__MCProfileConnection_Passcode__clearRecoveryPasscodeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Clear recovery passcode error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isPasscodeCompliantWithNamedPolicy:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__10;
  uint64_t v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke;
  v13[3] = &unk_1E5A680A0;
  v13[4] = &v14;
  int v7 = (void *)MEMORY[0x1A6232FE0](v13);
  int v8 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke_6;
  v12[3] = &unk_1E5A68280;
  void v12[4] = &v14;
  void v12[5] = &v20;
  [v9 isPasscodeCompliantWithNamedPolicy:v6 completion:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  char v10 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v7 = v5;
      int v8 = [v6 MCVerboseDescription];
      int v9 = 138543362;
      char v10 = v8;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Unable to determine passcode compliance. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __77__MCProfileConnection_Passcode__isPasscodeCompliantWithNamedPolicy_outError___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v9 = v7;
      char v10 = [v8 MCVerboseDescription];
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_ERROR, "Unable to determine passcode compliance. Error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)isPasscodeNagDaemonEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DisablePasscodeNagD", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  return !keyExistsAndHasValidFormat || AppBooleanValue == 0;
}

- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 outError:(id *)a5
{
  return [(MCProfileConnection *)self changePasscodeFrom:a3 to:a4 skipRecovery:0 outError:a5];
}

- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 outError:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__10;
  char v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke;
  v18[3] = &unk_1E5A680A0;
  void v18[4] = &v19;
  uint64_t v12 = (void *)MEMORY[0x1A6232FE0](v18);
  uint64_t v13 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke_8;
  v17[3] = &unk_1E5A68280;
  v17[4] = &v19;
  void v17[5] = &v25;
  [v14 changePasscode:v11 oldPasscode:v10 isRecovery:0 skipRecovery:v7 completion:v17];

  if (a6) {
    *a6 = (id) v20[5];
  }
  char v15 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      BOOL v7 = [v4 MCVerboseDescription];
      int v8 = 138543362;
      int v9 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Change passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __77__MCProfileConnection_Passcode__changePasscodeFrom_to_skipRecovery_outError___block_invoke_8(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v8 = v7;
      int v9 = [v6 MCVerboseDescription];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Change passcode error. Error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 outError:(id *)a5
{
  return [(MCProfileConnection *)self changePasscodeWithRecoveryPasscode:a3 to:a4 skipRecovery:0 outError:a5];
}

- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 outError:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__10;
  char v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke;
  v18[3] = &unk_1E5A680A0;
  void v18[4] = &v19;
  uint64_t v12 = (void *)MEMORY[0x1A6232FE0](v18);
  uint64_t v13 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke_9;
  v17[3] = &unk_1E5A68280;
  v17[4] = &v19;
  void v17[5] = &v25;
  [v14 changePasscode:v11 oldPasscode:v10 isRecovery:1 skipRecovery:v7 completion:v17];

  if (a6) {
    *a6 = (id) v20[5];
  }
  char v15 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      BOOL v7 = [v4 MCVerboseDescription];
      int v8 = 138543362;
      int v9 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Change passcode with recovery passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __93__MCProfileConnection_Passcode__changePasscodeWithRecoveryPasscode_to_skipRecovery_outError___block_invoke_9(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v8 = v7;
      int v9 = [v6 MCVerboseDescription];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Change passcode with recovery passcode error. Error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  int v10 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "Attempting clearing passcode with escrow keybag", buf, 2u);
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  *(void *)long long buf = 0;
  uint64_t v18 = buf;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__10;
  uint64_t v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__MCProfileConnection_Passcode__clearPasscodeWithEscrowKeybagData_secret_outError___block_invoke;
  v16[3] = &unk_1E5A68258;
  void v16[4] = &v23;
  void v16[5] = buf;
  id v11 = (void *)MEMORY[0x1A6232FE0](v16);
  uint64_t v12 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v13 clearPasscodeWithEscrowKeybagData:v8 secret:v9 completion:v11];

  if (a5) {
    *a5 = *((id *)v18 + 5);
  }
  char v14 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

void __83__MCProfileConnection_Passcode__clearPasscodeWithEscrowKeybagData_secret_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      BOOL v7 = [v4 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Clear passcode error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (BOOL)unlockDeviceWithPasscode:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v7 = +[MCPasscodeManager sharedManager];
  LOBYTE(a4) = [v7 unlockDeviceWithPasscode:v6 outError:a4];

  return (char)a4;
}

- (BOOL)isContentProtectionInEffect
{
  return MKBGetDeviceLockState() != 3 && (int)MKBDeviceFormattedForContentProtection() > 0;
}

- (BOOL)passcode:(id)a3 meetsCurrentConstraintsOutError:(id *)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v7 = +[MCPasscodeManager sharedManager];
  LOBYTE(a4) = [v7 passcode:v6 compliesWithPolicyCheckHistory:1 outError:a4];

  return (char)a4;
}

- (BOOL)currentPasscodeIsCompliantWithGlobalRestrictionsOutError:(id *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCRestrictionManager sharedManager];
  id v5 = [v4 currentRestrictions];

  id v6 = +[MCPasscodeManager sharedManager];
  id v9 = 0;
  [v6 currentPasscodeCompliesWithPolicyFromRestrictions:v5 outError:&v9];
  id v7 = v9;

  if (a3 && v7) {
    *a3 = v7;
  }

  return v7 == 0;
}

- (BOOL)currentPasscodeIsCompliantWithProfileRestrictionsOutError:(id *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCRestrictionManager sharedManager];
  id v5 = [v4 combinedProfileRestrictions];

  id v6 = +[MCPasscodeManager sharedManager];
  LOBYTE(a3) = [v6 currentPasscodeCompliesWithPolicyFromRestrictions:v5 outError:a3];

  return (char)a3;
}

- (int)_getPasscodeComplianceWarningExpiryDate:(id)a3 lastLockDate:(id)a4 outLocalizedTitle:(id *)a5 outLocalizedMessage:(id *)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (!+[MCRestrictionManager mayChangePasscode])
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    int v19 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [v10 timeIntervalSinceNow];
  if (v12 >= 0.0)
  {
    v73 = a5;
    v74 = a6;
    id v75 = v10;
    uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
    id v22 = MCNagUIMetaFilePath();
    uint64_t v23 = [v21 dictionaryWithContentsOfFile:v22];

    if ([v23 count])
    {
      char v24 = 0;
      while (1)
      {
        uint64_t v25 = [MEMORY[0x1E4F1CA20] currentLocale];
        char v26 = [v25 localeIdentifier];

        uint64_t v27 = [v23 objectForKeyedSubscript:@"lastLocale"];
        uint64_t v28 = [v23 objectForKeyedSubscript:@"message"];
        if (!v28
          || (v29 = (void *)v28, char v30 = [v26 isEqualToString:v27], v29, (v30 & 1) != 0))
        {

          uint64_t v18 = 0;
          uint64_t v35 = v23;
          goto LABEL_26;
        }
        id v31 = qword_1EB2223B0;
        BOOL v32 = os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT);
        if (v24) {
          break;
        }
        if (v32)
        {
          *(_DWORD *)long long buf = 138543874;
          id v77 = v27;
          __int16 v78 = 2114;
          uint32_t v79 = v26;
          __int16 v80 = 1024;
          int v81 = 1;
          _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_DEFAULT, "Cached nag may be in an old locale (it's %{public}@, we're %{public}@), asking to regenerate it (%d more tries)", buf, 0x1Cu);
        }
        [(MCProfileConnection *)self recomputeUserComplianceWarningSynchronously];

        uint64_t v33 = (void *)MEMORY[0x1E4F1C9E8];
        id v34 = MCNagUIMetaFilePath();
        uint64_t v35 = [v33 dictionaryWithContentsOfFile:v34];

        char v24 = 1;
        uint64_t v23 = v35;
        if (![v35 count]) {
          goto LABEL_22;
        }
      }
      if (v32)
      {
        *(_DWORD *)long long buf = 138543618;
        id v77 = v27;
        __int16 v78 = 2114;
        uint32_t v79 = v26;
        _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_DEFAULT, "Cached nag may be in an old locale (it's %{public}@, we're %{public}@), continuing anyway", buf, 0x16u);
      }

      uint64_t v18 = 0;
      uint64_t v17 = 0;
      int v19 = 0;
LABEL_59:

      a6 = v74;
      id v10 = v75;
      a5 = v73;
      if (!v73) {
        goto LABEL_9;
      }
LABEL_8:
      *a5 = v17;
      goto LABEL_9;
    }
    uint64_t v35 = v23;
LABEL_22:
    uint64_t v36 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v37 = MCBackupContainsPasscodeFilePath();
    int v38 = [v36 fileExistsAtPath:v37];

    if (!v38)
    {
      uint64_t v18 = 0;
      uint64_t v17 = 0;
      int v19 = 0;
      uint64_t v23 = v35;
      goto LABEL_59;
    }
    if ([(MCProfileConnection *)self isPasscodeSet])
    {
      [(MCProfileConnection *)self notifyUserHasSeenComplianceMessageWithLastLockDate:v11];
      uint64_t v18 = 0;
      uint64_t v17 = 0;
      int v19 = 0;
LABEL_58:
      uint64_t v23 = v35;
      goto LABEL_59;
    }
    long long v53 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A13F0000, v53, OS_LOG_TYPE_DEFAULT, "Advising user to set passcode since they've restored a backup", buf, 2u);
    }
    uint64_t v17 = MCLocalizedString(@"NAG_UI_PASSCODE_REMINDER_TITLE");
    uint64_t v18 = MCLocalizedStringByDevice(@"NAG_UI_PASSCODE_REMINDER_MESSAGE");
    if (!v17)
    {
LABEL_26:
      uint64_t v17 = MCLocalizedFormat(@"NAG_UI_COMPLIANCE_TITLE", v39, v40, v41, v42, v43, v44, v45, 0);
    }
    uint64_t v46 = [v35 objectForKeyedSubscript:@"mandatory"];
    int v47 = [v46 BOOLValue];

    if (!v47)
    {
      long long v52 = [v35 objectForKeyedSubscript:@"message"];
      id v49 = v52;
      if (v52)
      {
        id v49 = v52;

        uint64_t v18 = v49;
      }
      else if (!v18)
      {
        uint64_t v18 = MCLocalizedStringByDevice(@"NAG_UI_GENERIC_WARNING");
      }
LABEL_54:

      uint32_t v71 = [v35 objectForKeyedSubscript:@"lastLockDate"];
      id v72 = v71;
      if (v71) {
        int v19 = 2 * ([v71 compare:v11] == -1);
      }
      else {
        int v19 = 2;
      }

      goto LABEL_58;
    }
    uint64_t v48 = [v35 objectForKeyedSubscript:@"expiryDate"];
    if (v48)
    {
      id v49 = v48;
      [v48 timeIntervalSinceNow];
      if (v50 <= 3600.0)
      {
LABEL_43:
        [v49 timeIntervalSinceNow];
        double v57 = v56;
        long long v58 = MCFormattedStringForTimeInterval(v56);
        BOOL v59 = [(MCProfileConnection *)self isPasscodeSet];
        if (v57 <= 60.0)
        {
          if (v59) {
            v69 = @"NAG_UI_MANDATORY_MESSAGE";
          }
          else {
            v69 = @"NAG_UI_MANDATORY_NOPASS_MESSAGE";
          }
          uint64_t v70 = MCLocalizedFormatByDevice(v69, v60, v61, v62, v63, v64, v65, v66, (uint64_t)v58);

          int v19 = 1;
          uint64_t v23 = v35;
          uint64_t v18 = (void *)v70;
          goto LABEL_59;
        }
        if (v59) {
          int v67 = @"NAG_UI_COUNTDOWN_MESSAGE_P_MINUTES";
        }
        else {
          int v67 = @"NAG_UI_COUNTDOWN_NOPASS_MESSAGE_P_MINUTES";
        }
        uint64_t v68 = MCLocalizedFormatByDevice(v67, v60, v61, v62, v63, v64, v65, v66, (uint64_t)v58);

        uint64_t v18 = (void *)v68;
        goto LABEL_54;
      }
      uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");

      id v49 = (id)v51;
    }
    else
    {
      id v49 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
    }
    long long v54 = [(MCProfileConnection *)self xpcConnection];
    long long v55 = [v54 remoteObjectProxyWithErrorHandler:&__block_literal_global_33];
    [v55 notifyStartComplianceTimer:v49 completion:&__block_literal_global_33];

    goto LABEL_43;
  }
  uint64_t v13 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = (void *)MEMORY[0x1E4F1C9C8];
    char v15 = v13;
    uint64_t v16 = [v14 date];
    *(_DWORD *)long long buf = 138543618;
    id v77 = v10;
    __int16 v78 = 2114;
    uint32_t v79 = v16;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEFAULT, "Current passcode expired at %{public}@ and current date is %{public}@. Requiring mandatory passcode change.", buf, 0x16u);
  }
  uint64_t v17 = MCLocalizedString(@"NAG_UI_EXPIRY_TITLE");
  uint64_t v18 = MCLocalizedStringByDevice(@"NAG_UI_EXPIRY_MESSAGE");
  int v19 = 1;
  if (a5) {
    goto LABEL_8;
  }
LABEL_9:
  if (a6) {
    *a6 = v18;
  }

  return v19;
}

void __124__MCProfileConnection_Passcode___getPasscodeComplianceWarningExpiryDate_lastLockDate_outLocalizedTitle_outLocalizedMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Notify start compliance timer error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (int)getPasscodeComplianceWarningLastLockDate:(id)a3 outLocalizedTitle:(id *)a4 outLocalizedMessage:(id *)a5
{
  id v8 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v9 = [(MCProfileConnection *)self passcodeExpiryDate];
  LODWORD(a5) = [(MCProfileConnection *)self _getPasscodeComplianceWarningExpiryDate:v9 lastLockDate:v8 outLocalizedTitle:a4 outLocalizedMessage:a5];

  return (int)a5;
}

- (void)getPasscodeComplianceWarningLastLockDate:(id)a3 completionBlock:(id)a4
{
  int v6 = (void (**)(id, void, id, id))a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v8 = +[MCPasscodeManager sharedManager];
  id v9 = [v8 passcodeExpiryDate];

  id v13 = 0;
  id v14 = 0;
  uint64_t v10 = [(MCProfileConnection *)self _getPasscodeComplianceWarningExpiryDate:v9 lastLockDate:v7 outLocalizedTitle:&v14 outLocalizedMessage:&v13];

  id v11 = v14;
  id v12 = v13;
  if (v6) {
    v6[2](v6, v10, v11, v12);
  }
}

- (void)recomputeUserComplianceWarningSynchronously
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self xpcConnection];
  id v3 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_45];
  [v3 recomputeUserComplianceWarningWithCompletion:&__block_literal_global_45];
}

void __76__MCProfileConnection_Passcode__recomputeUserComplianceWarningSynchronously__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Recompute user compliance warning error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)recomputeUserComplianceWarning
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self xpcConnection];
  id v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_47_1];
  [v3 recomputeUserComplianceWarningWithCompletion:&__block_literal_global_47_1];
}

void __63__MCProfileConnection_Passcode__recomputeUserComplianceWarning__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Recompute user compliance warning error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)notifyClientsToRecomputeCompliance
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self xpcConnection];
  id v3 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_49];
  [v3 recomputePerClientUserComplianceWithCompletion:&__block_literal_global_49];
}

void __67__MCProfileConnection_Passcode__notifyClientsToRecomputeCompliance__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Notify clients to recompute compliance error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)notifyUserHasSeenComplianceMessageWithLastLockDate:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v4 sinceDate:1.0];

  id v5 = [(MCProfileConnection *)self xpcConnection];
  int v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_51_0];
  [v6 notifyHaveSeenComplianceMessageWithLastLockDate:v7 completion:&__block_literal_global_51_0];
}

void __84__MCProfileConnection_Passcode__notifyUserHasSeenComplianceMessageWithLastLockDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Notify user seen compliance error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)passcodeCreationDate
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCPasscodeManager sharedManager];
  id v3 = [v2 passcodeCreationDate];

  return v3;
}

- (id)passcodeExpiryDate
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCPasscodeManager sharedManager];
  id v3 = [v2 passcodeExpiryDate];

  return v3;
}

- (id)recoveryPasscodeExpiryDate
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCPasscodeManager sharedManager];
  id v3 = [v2 recoveryPasscodeExpiryDate];

  return v3;
}

- (int)unlockScreenType
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCPasscodeManager sharedManager];
  int v3 = [v2 currentUnlockScreenType];

  return v3;
}

- (int)unlockScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  if (a3)
  {
    id v4 = +[MCPasscodeManager sharedManager];
    int v5 = [v4 currentUnlockSimplePasscodeType];

    *a3 = v5;
  }
  int v6 = +[MCPasscodeManager sharedManager];
  int v7 = [v6 currentUnlockScreenType];

  return v7;
}

- (int)unlockScreenTypeForUser:(id)a3 outSimplePasscodeType:(int *)a4
{
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (a4)
  {
    int v7 = +[MCPasscodeManager sharedManager];
    int v8 = [v7 unlockSimplePasscodeTypeForUser:v6];

    *a4 = v8;
  }
  id v9 = +[MCPasscodeManager sharedManager];
  int v10 = [v9 unlockScreenTypeForUser:v6];

  return v10;
}

- (int)recoveryPasscodeUnlockScreenType
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCPasscodeManager sharedManager];
  int v3 = [v2 recoveryPasscodeUnlockScreenType];

  return v3;
}

- (int)recoveryPasscodeUnlockScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  if (a3)
  {
    id v4 = +[MCPasscodeManager sharedManager];
    int v5 = [v4 recoveryPasscodeUnlockSimplePasscodeType];

    *a3 = v5;
  }
  id v6 = +[MCPasscodeManager sharedManager];
  int v7 = [v6 recoveryPasscodeUnlockScreenType];

  return v7;
}

- (int)unlockScreenTypeForPasscode:(id)a3 outSimplePasscodeType:(int *)a4
{
  return +[MCPasscodeUtilities unlockScreenTypeForPasscode:a3 outSimplePasscodeType:a4];
}

- (int)newPasscodeEntryScreenType
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCPasscodeManager sharedManager];
  int v3 = [v2 newPasscodeEntryScreenType];

  return v3;
}

- (int)newPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCPasscodeManager sharedManager];
  LODWORD(a3) = [v4 newPasscodeEntryScreenTypeWithOutSimplePasscodeType:a3];

  return (int)a3;
}

- (int)minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCPasscodeManager sharedManager];
  LODWORD(a3) = [v4 minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:a3];

  return (int)a3;
}

- (int)defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:(int *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = +[MCPasscodeManager sharedManager];
  LODWORD(a3) = [v4 defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:a3];

  return (int)a3;
}

- (id)localizedDescriptionOfCurrentPasscodeConstraints
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 currentRestrictions];
  id v4 = +[MCPasscodeManager localizedDescriptionOfPasscodePolicyFromRestrictions:v3];

  return v4;
}

- (id)localizedDescriptionOfDefaultNewPasscodeConstraints
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 currentRestrictions];
  id v4 = +[MCPasscodeManager localizedDescriptionOfDefaultNewPasscodePolicyFromRestrictions:v3];

  return v4;
}

- (id)managedWiFiNetworkNames
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__11;
  id v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  int v3 = [(MCProfileConnection *)self xpcConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_34];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MCProfileConnection_Misc__managedWiFiNetworkNames__block_invoke_1;
  v7[3] = &unk_1E5A68500;
  void v7[4] = &v8;
  [v4 managedWiFiNetworkNamesWithCompletion:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __52__MCProfileConnection_Misc__managedWiFiNetworkNames__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    int v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Managed WLAN network names error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __52__MCProfileConnection_Misc__managedWiFiNetworkNames__block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Managed WLAN network names error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (void)invalidateRestrictionCache
{
  id v2 = +[MCRestrictionManager sharedManager];
  [v2 invalidateSettings];

  id v3 = +[MCRestrictionManager sharedManager];
  [v3 invalidateRestrictions];
}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v6 = [(MCProfileConnection *)self xpcConnection];
  id v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4_0];
  [v5 recomputeProfileRestrictionsWithCompletionBlock:v4];
}

void __77__MCProfileConnection_Misc__recomputeProfileRestrictionsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Remove Profile Restrictions remote object proxy error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)shutDown
{
}

- (void)shutDownWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke;
  v27[3] = &unk_1E5A68118;
  id v5 = v4;
  id v28 = v5;
  int v6 = (void *)MEMORY[0x1A6232FE0](v27);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_5;
  v20[3] = &unk_1E5A68528;
  objc_copyWeak(&v23, &location);
  id v22 = v25;
  uint64_t v8 = v7;
  uint64_t v21 = v8;
  id v9 = (void *)MEMORY[0x1A6232FE0](v20);
  id xpcConnectionInvalidatedActionBlock = self->xpcConnectionInvalidatedActionBlock;
  self->id xpcConnectionInvalidatedActionBlock = v9;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_2;
  v16[3] = &unk_1E5A685A0;
  id v11 = v5;
  id v18 = v11;
  int v19 = v25;
  void v16[4] = self;
  int v12 = v8;
  uint64_t v17 = v12;
  id v13 = (void *)MEMORY[0x1A6232FE0](v16);
  uint64_t v14 = [(MCProfileConnection *)self xpcConnection];
  char v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v6];
  [v15 shutDownWithCompletion:v13];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v25, 8);
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Shut down connection error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection with profiled was invalidated, stop waiting.", buf, 2u);
    }
    id v4 = WeakRetained[8];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_6;
    block[3] = &unk_1E5A67EE8;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(v4, block);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

uint64_t __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v15 = v3;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Failed to shut down profiled with error: %{public}@", buf, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
  else
  {
    int v6 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_8;
    v9[3] = &unk_1E5A68578;
    uint64_t v13 = *(void *)(a1 + 56);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    id v12 = *(id *)(a1 + 48);
    dispatch_async_and_wait(v6, v9);
  }
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_8(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v2 = a1[6];
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    id v4 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEFAULT, "Waiting for profiled to shut down...", buf, 2u);
    }
    uint64_t v5 = a1[4];
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v5, v6);
    id v7 = *(NSObject **)(a1[5] + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_9;
    block[3] = &unk_1E5A68550;
    long long v9 = *((_OWORD *)a1 + 3);
    id v8 = (id)v9;
    long long v11 = v9;
    dispatch_async(v7, block);
  }
}

void __52__MCProfileConnection_Misc__shutDownWithCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = qword_1EB2223B0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_DEFAULT, "Profiled has exited.", buf, 2u);
    }
    id v3 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A13F0000, v2, OS_LOG_TYPE_FAULT, "Timed out waiting for profiled to exit.", v16, 2u);
    }
    id v4 = (void *)MEMORY[0x1E4F5E768];
    uint64_t v5 = DMCHangTracerDirectory();
    [v4 dumpStackshotToPath:v5 fileName:@"profiled_shutdown_hang.ips"];

    dispatch_time_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = MCErrorArray(@"ERROR_FAILED_TO_SHUT_DOWN_PROFILED", v7, v8, v9, v10, v11, v12, v13, 0);
    id v3 = [v6 MCErrorWithDomain:@"MCGeneralErrorDomain" code:65000 descriptionArray:v14 errorType:@"MCFatalError"];
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v3);
  }
}

- (id)managedSystemConfigurationServiceIDs
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__11;
  uint64_t v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  id v3 = [(MCProfileConnection *)self xpcConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_17_0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MCProfileConnection_Misc__managedSystemConfigurationServiceIDs__block_invoke_18;
  v7[3] = &unk_1E5A68500;
  void v7[4] = &v8;
  [v4 managedSystemConfigurationServiceIDsWithCompletion:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __65__MCProfileConnection_Misc__managedSystemConfigurationServiceIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Managed system config service IDs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __65__MCProfileConnection_Misc__managedSystemConfigurationServiceIDs__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Managed system config service IDs error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)managedAppIDs
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73178] attributesByAppID];
  id v3 = [v2 allKeys];

  return v3;
}

- (id)doNotBackupAppIDs
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = (void *)MEMORY[0x1E4F73178];
  return (id)[v2 managedAppIDsWithFlags:4];
}

- (id)managedEmailDomains
{
  return [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"managedEmailDomains"];
}

- (void)setManagedEmailDomains:(id)a3
{
}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke;
  v23[3] = &unk_1E5A68118;
  id v24 = v8;
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x1A6232FE0](v23);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke_20;
  id v18 = &unk_1E5A685C8;
  int v19 = self;
  id v20 = v10;
  int v21 = v6;
  BOOL v22 = v5;
  id v11 = v10;
  int v12 = (void *)MEMORY[0x1A6232FE0](&v15);
  id v13 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v14 = [v13 remoteObjectProxyWithErrorHandler:v12];
  [v14 migrateWithContext:v6 passcodeWasSetInBackup:v5 completion:v12];
}

void __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      uint64_t v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Migrate with context error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void __82__MCProfileConnection_Misc__migrateWithContext_passcodeWasSetInBackup_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    if ([v7 code] == 4097)
    {

LABEL_6:
      BOOL v5 = [*(id *)(a1 + 32) xpcConnection];
      uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
      [v6 migrateWithContext:*(unsigned int *)(a1 + 48) passcodeWasSetInBackup:*(unsigned __int8 *)(a1 + 52) completion:*(void *)(a1 + 40)];

      goto LABEL_8;
    }
    uint64_t v4 = [v7 code];

    if (v4 == 4099) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_8:
}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke;
  v14[3] = &unk_1E5A68118;
  id v7 = v6;
  id v15 = v7;
  int v8 = (void *)MEMORY[0x1A6232FE0](v14);
  id v9 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke_21;
  v12[3] = &unk_1E5A68118;
  id v13 = v7;
  id v11 = v7;
  [v10 migrateCleanupMigratorWithContext:v4 completion:v12];
}

void __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "MCCleanupMigrator: Error in handler: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void __74__MCProfileConnection_Misc__migrateCleanupMigratorWithContext_completion___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "MCCleanupMigrator: Error in completion: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (id)associatedDomainsForManagedApps
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73178] attributesByAppID];
  id v3 = v2;
  if (v2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int v21 = 0;
      uint64_t v6 = *(void *)v23;
      id v18 = @"BundleID";
      int v19 = v3;
      do
      {
        uint64_t v7 = 0;
        uint64_t v20 = v5;
        do
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * v7);
          id v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, v18);
          uint64_t v10 = [v9 objectForKeyedSubscript:@"AssociatedDomains"];
          uint64_t v11 = [v9 objectForKeyedSubscript:@"AssociatedDomainsEnableDirectDownloads"];
          if (v10 | v11)
          {
            uint64_t v12 = v6;
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v13 setObject:v8 forKeyedSubscript:v18];
            [v13 setObject:v10 forKeyedSubscript:@"AssociatedDomains"];
            [v13 setObject:v11 forKeyedSubscript:@"AssociatedDomainsEnableDirectDownloads"];
            id v14 = v21;
            if (!v21) {
              id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            int v21 = v14;
            [v14 addObject:v13];

            uint64_t v6 = v12;
            uint64_t v5 = v20;
            id v3 = v19;
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
    }
    else
    {
      int v21 = 0;
    }
    id v15 = v21;
    uint64_t v16 = (void *)[v21 copy];
  }
  else
  {
    id v15 = 0;
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)isDeprecatedWebKitTLSAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDeprecatedWebKitTLS"] == 1;
}

- (BOOL)isDeprecatedWebKitSynchronousXHRLoadsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDeprecatedWebKitSynchronousXHRLoads"] == 1;
}

- (BOOL)isSafariPasswordAutoFillAllowedForURL:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = +[MCSafariPasswordAutoFillDomainsCache sharedCache];
  char v6 = [v5 isSafariPasswordAutoFillAllowedForURL:v4];

  return v6;
}

- (BOOL)isDefaultBrowserModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDefaultBrowserModification"] != 2;
}

- (BOOL)isDefaultBrowserPromptingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDefaultBrowserPrompting"] != 2;
}

- (BOOL)isAuthenticationBeforeAutoFillRequired
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceAuthenticationBeforeAutoFill"] == 1;
}

- (BOOL)isPasswordAutoFillAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPasswordAutoFill"] != 2;
}

- (BOOL)isPasswordSharingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPasswordSharing"] != 2;
}

- (BOOL)isPasswordProximityAutoFillRequestingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPasswordProximityRequests"] != 2;
}

- (id)trustedCodeSigningIdentities
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  id v3 = [v2 effectiveUnionValuesForSetting:@"trustedCodeSigningIdentities"];
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)setTrustedCodeSigningIdentities:(id)a3
{
}

- (void)validateAppBundleIDs:(id)a3
{
}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
}

- (void)validateAppBundleIDs:(id)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __80__MCProfileConnection_Misc__validateAppBundleIDs_waitUntilCompleted_completion___block_invoke;
  v15[3] = &unk_1E5A68118;
  id v16 = v8;
  id v10 = v8;
  uint64_t v11 = (void *)MEMORY[0x1A6232FE0](v15);
  uint64_t v12 = [(MCProfileConnection *)self xpcConnection];
  id v13 = v12;
  if (v5) {
    [v12 synchronousRemoteObjectProxyWithErrorHandler:v11];
  }
  else {
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v11];
  }

  [v14 validateAppBundleIDs:v9 completion:v11];
}

void __80__MCProfileConnection_Misc__validateAppBundleIDs_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      char v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Validate app bundle IDs error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (BOOL)isCloudKeychainSyncAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCloudKeychainSync"] != 2;
}

- (BOOL)isCloudPrivateRelayAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCloudPrivateRelay"] != 2;
}

- (BOOL)isVehicleUIAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowVehicleUI"] != 2;
}

- (BOOL)isOTAPKIUpdatesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowOTAPKIUpdates"] != 2;
}

- (void)setAutomaticAppUpdatesAllowed:(BOOL)a3
{
}

- (BOOL)isAutomaticAppUpdatesModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAutomaticAppUpdatesModification"] != 2;
}

- (BOOL)isAppCellularDataModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppCellularDataModification"] != 2;
}

- (BOOL)isCellularPlanModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCellularPlanModification"] != 2;
}

- (BOOL)isWebTextDefineAllowed
{
  return 1;
}

- (BOOL)isWebContentFilteringInEffect
{
  id v2 = +[MCRestrictionManager sharedManager];
  if ([v2 effectiveRestrictedBoolForSetting:@"forceWebContentFilterAuto"] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [v2 effectiveIntersectedValuesForSetting:@"webContentFilterWhitelistedURLs"];
    if (v4)
    {
      BOOL v3 = 1;
    }
    else
    {
      BOOL v5 = [v2 effectiveUnionValuesForSetting:@"webContentFilterBlacklistedURLs"];
      if (v5)
      {
        BOOL v3 = 1;
      }
      else
      {
        char v6 = +[MCDependencyReader sharedReader];
        uint64_t v7 = [v6 parentsInDomain:@"MCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey"];
        BOOL v3 = [v7 count] != 0;
      }
    }
  }
  return v3;
}

- (BOOL)isAdTrackingLimited
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceLimitAdTracking"] == 1;
}

- (BOOL)isIdentifierForAdvertisingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowIdentifierForAdvertising"] != 2;
}

- (BOOL)isApplePersonalizedAdvertisingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowApplePersonalizedAdvertising"] != 2;
}

- (BOOL)isLockScreenWiFiModificationAllowed
{
  return 1;
}

- (BOOL)isUIAppInstallationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowUIAppInstallation"] != 2;
}

- (BOOL)isSystemAppRemovalAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSystemAppRemoval"] != 2;
}

- (BOOL)isRemovalRestrictedByPolicyForApp:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = [MEMORY[0x1E4F73178] attributesByAppID];
  char v6 = v5;
  if (v5
    && ([v5 objectForKeyedSubscript:v4], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = v7;
    id v9 = [v7 objectForKeyedSubscript:@"Removable"];
    uint64_t v10 = v9;
    if (v9) {
      int v11 = [v9 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)isAppRatingLimitInEffect
{
  id v2 = [(MCProfileConnection *)self effectiveValueForSetting:@"ratingApps"];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = (int)[v2 intValue] < 1000;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isAirDropAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAirDrop"] != 2;
}

- (BOOL)isAirPrintAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAirPrint"] != 2;
}

- (BOOL)isAirPrintiBeaconDiscoveryAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAirPrintiBeaconDiscovery"] != 2;
}

- (BOOL)isAirPrintCredentialsStorageAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAirPrintCredentialsStorage"] != 2;
}

- (BOOL)isAirPrintTrustedTLSRequirementEnforced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceAirPrintTrustedTLSRequirement"] == 1;
}

- (BOOL)isCameraAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCamera"] != 2;
}

- (BOOL)isLockScreenNotificationsViewAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowLockScreenNotificationsView"] != 2;
}

- (BOOL)isLockScreenTodayViewAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowLockScreenTodayView"] != 2;
}

- (BOOL)isLockScreenControlCenterAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowLockScreenControlCenter"] != 2;
}

- (BOOL)isControlCenterAllowedInApps
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowControlCenterInApps"] != 2;
}

- (BOOL)isActivationLockAllowed
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 isSupervised];

  if (!v3) {
    return 1;
  }
  BOOL v4 = [MEMORY[0x1E4F73160] sharedClient];
  char v5 = [v4 isActivationLockAllowedWhileSupervised];

  return v5;
}

- (BOOL)isAssistantUserGeneratedContentAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAssistantUserGeneratedContent"] != 2;
}

- (BOOL)isFingerprintModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFingerprintModification"] != 2;
}

- (BOOL)isFingerprintUnlockAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFingerprintForUnlock"] != 2;
}

- (BOOL)isAutoUnlockAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAutoUnlock"] != 2;
}

- (BOOL)isAirPlayOutgoingRequestsPairingPasswordRequired
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceAirPlayOutgoingRequestsPairingPassword"] == 1;
}

- (BOOL)isAirPlayIncomingRequestsPairingPasswordRequired
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceAirPlayIncomingRequestsPairingPassword"] == 1;
}

- (BOOL)isAirPlayIncomingRequestsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAirPlayIncomingRequests"] != 2;
}

- (BOOL)isGeotagSharingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGeotagSharing"] != 2;
}

- (BOOL)isWiFiPasswordSharingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowWiFiPasswordSharing"] != 2;
}

- (void)setActivityContinuationAllowed:(BOOL)a3
{
}

- (BOOL)isBookstoreAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowBookstore"] != 2;
}

- (BOOL)isBookstoreEroticaAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowBookstoreErotica"] != 2;
}

- (BOOL)isEnterpriseBookBackupAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowEnterpriseBookBackup"] != 2;
}

- (BOOL)isEnterpriseBookMetadataSyncAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowEnterpriseBookMetadataSync"] != 2;
}

- (BOOL)isRCSMessagingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowRCSMessaging"] != 2;
}

- (BOOL)isSatelliteConnectionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSatelliteConnection"] != 2;
}

- (BOOL)hasDiagnosticSubmissionAllowedBeenSet
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 BOOLSettingForFeature:@"allowDiagnosticSubmission"] != 0;

  return v3;
}

- (BOOL)isDiagnosticSubmissionModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDiagnosticSubmissionModification"] != 2;
}

- (BOOL)isAppAnalyticsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppAnalytics"] == 1;
}

- (BOOL)hasAppAnalyticsAllowedBeenSet
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 BOOLSettingForFeature:@"allowAppAnalytics"] != 0;

  return v3;
}

- (BOOL)isAppAndAccessoryAnalyticsAllowed
{
  return 0;
}

- (BOOL)hasAppAndAccessoryAnalyticsAllowedBeenSet
{
  return 0;
}

- (BOOL)hasHealthDataSubmissionAllowedBeenSet
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 BOOLSettingForFeature:@"allowHealthDataSubmission"] != 0;

  return v3;
}

- (void)setHealthDataSubmissionAllowed:(BOOL)a3
{
}

- (BOOL)isHealthDataSubmission2Allowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowHealthDataSubmission2"] == 1;
}

- (BOOL)hasHealthDataSubmission2BeenSet
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 BOOLSettingForFeature:@"allowHealthDataSubmission2"] != 0;

  return v3;
}

- (void)setHealthDataSubmission2Allowed:(BOOL)a3
{
}

- (BOOL)isWheelchairDataSubmissionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowWheelchairDataSubmission"] == 1;
}

- (BOOL)hasWheelchairDataSubmissionAllowedBeenSet
{
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 BOOLSettingForFeature:@"allowWheelchairDataSubmission"] != 0;

  return v3;
}

- (void)setWheelchairDataSubmissionAllowed:(BOOL)a3
{
}

- (BOOL)isHandWashingDataSubmissionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowHandWashingDataSubmission"] == 1;
}

- (BOOL)hasHandWashingDataSubmissionAllowedBeenSet
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 BOOLSettingForFeature:@"allowHandWashingDataSubmission"] != 0;

  return v3;
}

- (void)setHandWashingDataSubmissionAllowed:(BOOL)a3
{
}

- (BOOL)isSafetyDataSubmissionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSafetyDataSubmission"] == 1;
}

- (BOOL)hasSafetyDataSubmissionAllowedBeenSet
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 BOOLSettingForFeature:@"allowSafetyDataSubmission"] != 0;

  return v3;
}

- (void)setSafetyDataSubmissionAllowed:(BOOL)a3
{
}

- (BOOL)isSiriServerLoggingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSiriServerLogging"] != 2;
}

- (BOOL)isOnDeviceOnlyDictationForced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceOnDeviceOnlyDictation"] == 1;
}

- (BOOL)isOnDeviceOnlyTranslationForced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceOnDeviceOnlyTranslation"] == 1;
}

- (BOOL)isPodcastsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPodcasts"] != 2;
}

- (void)setFindMyCarAllowed:(BOOL)a3
{
}

- (BOOL)isFindMyDeviceAllowed
{
  return ([MEMORY[0x1E4F5E7A8] isSharediPad] & 1) == 0
      && [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFindMyDevice"] != 2;
}

- (BOOL)isFindMyFriendsAllowed
{
  return ([MEMORY[0x1E4F5E7A8] isSharediPad] & 1) == 0
      && [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFindMyFriends"] != 2;
}

- (BOOL)isHomeAllowed
{
  return ([MEMORY[0x1E4F5E7A8] isSharediPad] & 1) == 0
      && [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowHome"] != 2;
}

- (BOOL)isiCloudDriveAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCloudDocumentSync"] != 2;
}

- (BOOL)isInstalledAppNearMeSuggestionsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowInstalledAppNearMeSuggestions"] != 2;
}

- (BOOL)isUninstalledAppNearMeSuggestionsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowUninstalledAppNearMeSuggestions"] != 2;
}

- (BOOL)isContactlessPaymentAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowContactlessPayment"] != 2;
}

- (BOOL)isFingerprintForContactlessPaymentAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFingerprintForContactlessPayment"] != 2;
}

- (BOOL)isBiometricAuthForSignInWithAppleAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowBiometricAuthForSignInWithApple"] != 2;
}

- (BOOL)isInAppPaymentAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowInAppPayment"] != 2;
}

- (BOOL)isWiFiPowerModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceWiFiPowerOn"] != 1;
}

- (BOOL)isNFCAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowNFC"] != 2;
}

- (BOOL)isESIMModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowESIMModification"] != 2;
}

- (BOOL)isESIMOutgoingTransferAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowESIMOutgoingTransfers"] != 2;
}

- (BOOL)isUSBDriveAccessInFilesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowFilesUSBDriveAccess"] != 2;
}

- (BOOL)isUSBDriveAccessAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowUSBDriveAccess"] != 2;
}

- (BOOL)isDeviceNameModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDeviceNameModification"] != 2;
}

- (BOOL)isWallpaperModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowWallpaperModification"] != 2;
}

- (BOOL)isScreenShotAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowScreenShot"] != 2;
}

- (BOOL)isScreenRecordingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowScreenRecording"] != 2;
}

- (BOOL)isMusicServiceAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMusicService"] != 2;
}

- (BOOL)isMusicVideoViewingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMusicVideos"] != 2;
}

- (BOOL)isMusicArtistActivityAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMusicArtistActivity"] != 2;
}

- (BOOL)isRadioServiceAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowRadioService"] != 2;
}

- (BOOL)isAutoCorrectionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAutoCorrection"] != 2;
}

- (BOOL)isSmartPunctuationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSmartPunctuation"] != 2;
}

- (BOOL)isPredictiveKeyboardAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPredictiveKeyboard"] != 2;
}

- (BOOL)isContinuousPathKeyboardAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowContinuousPathKeyboard"] != 2;
}

- (BOOL)isKeyboardShortcutsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowKeyboardShortcuts"] != 2;
}

- (BOOL)isSpellCheckAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSpellCheck"] != 2;
}

- (BOOL)isProximitySetupToNewDeviceAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowProximitySetupToNewDevice"] != 2;
}

- (BOOL)isAccessibilitySpeechAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAccessibilitySpeech"] != 2;
}

- (void)setAutoCorrectionAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v5 = [(MCProfileConnection *)self publicXPCConnection];
  char v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30_0];
  [v6 setAutoCorrectionAllowed:v3 completion:&__block_literal_global_30_0];

  id v7 = +[MCRestrictionManager sharedManager];
  [v7 invalidateSettings];
}

void __54__MCProfileConnection_Misc__setAutoCorrectionAllowed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      char v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set auto-correction allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setSmartPunctuationAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v5 = [(MCProfileConnection *)self publicXPCConnection];
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_32_1];
  [v6 setSmartPunctuationAllowed:v3 completion:&__block_literal_global_32_1];

  id v7 = +[MCRestrictionManager sharedManager];
  [v7 invalidateSettings];
}

void __56__MCProfileConnection_Misc__setSmartPunctuationAllowed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      char v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set smart punctuation allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v5 = [(MCProfileConnection *)self publicXPCConnection];
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_34];
  [v6 setPredictiveKeyboardAllowed:v3 completion:&__block_literal_global_34];

  id v7 = +[MCRestrictionManager sharedManager];
  [v7 invalidateSettings];
}

void __58__MCProfileConnection_Misc__setPredictiveKeyboardAllowed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      char v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set predictive keyboard allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v5 = [(MCProfileConnection *)self publicXPCConnection];
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_36];
  [v6 setContinuousPathKeyboardAllowed:v3 completion:&__block_literal_global_36];

  id v7 = +[MCRestrictionManager sharedManager];
  [v7 invalidateSettings];
}

void __62__MCProfileConnection_Misc__setContinuousPathKeyboardAllowed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      char v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set predictive keyboard allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v5 = [(MCProfileConnection *)self publicXPCConnection];
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_38];
  [v6 setKeyboardShortcutsAllowed:v3 completion:&__block_literal_global_38];

  id v7 = +[MCRestrictionManager sharedManager];
  [v7 invalidateSettings];
}

void __57__MCProfileConnection_Misc__setKeyboardShortcutsAllowed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      char v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set keyboard shortcuts allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setSpellCheckAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  char v5 = [(MCProfileConnection *)self publicXPCConnection];
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_40];
  [v6 setSpellCheckAllowed:v3 completion:&__block_literal_global_40];

  id v7 = +[MCRestrictionManager sharedManager];
  [v7 invalidateSettings];
}

void __50__MCProfileConnection_Misc__setSpellCheckAllowed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      char v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set spell-check allowed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)isNewsTodayAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowNewsToday"] != 2;
}

- (BOOL)isSpotlightNewsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSpotlightNews"] != 2;
}

- (BOOL)isQuickNoteAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowQuickNote"] != 2;
}

- (BOOL)isMultitaskingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMultitasking"] != 2;
}

- (void)setMultitaskingAllowed:(BOOL)a3
{
}

- (BOOL)isHashtagImagesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowHashtagImages"] != 2;
}

- (BOOL)isTVAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowTV"] != 2;
}

- (void)setTVAllowed:(BOOL)a3
{
}

- (BOOL)isSoftwareUpdateResisted
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceDelayedSoftwareUpdates"] == 1;
}

- (unint64_t)enforcedSoftwareUpdateDelayInDays
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 effectiveValueForSetting:@"enforcedSoftwareUpdateDelay"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)softwareUpdatePath
{
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v3 = MDMFilePath();
  unint64_t v4 = [v2 MCDictionaryFromFile:v3];

  char v5 = [v4 objectForKeyedSubscript:@"SoftwareUpdateSettings"];
  int v6 = [v5 objectForKeyedSubscript:@"RecommendationCadence"];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (BOOL)isAutomaticDateAndTimeEnforced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceAutomaticDateAndTime"] == 1;
}

- (BOOL)isWiFiWhitelistingEnforced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceWiFiWhitelisting"] == 1;
}

- (BOOL)isWiFiWithAllowedNetworksOnlyEnforced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceWiFiToAllowedNetworksOnly"] == 1;
}

- (BOOL)isGroupActivityAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGroupActivity"] != 2;
}

- (BOOL)isRemoteAppPairingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowRemoteAppPairing"] != 2;
}

- (void)setRemoteAppPairingAllowed:(BOOL)a3
{
}

- (BOOL)isTVProviderModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowTVProviderModification"] != 2;
}

- (void)setTVProviderModificationAllowed:(BOOL)a3
{
}

- (BOOL)isTVShowingUndownloadedTVShowsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowShowingUndownloadedTV"] != 2;
}

- (void)setTVShowingUndownloadedTVShowsAllowed:(BOOL)a3
{
}

- (BOOL)isTVShowingUndownloadedMoviesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowShowingUndownloadedMovies"] != 2;
}

- (void)setTVShowingUndownloadedMoviesAllowed:(BOOL)a3
{
}

- (BOOL)isVPNCreationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowVPNCreation"] != 2;
}

- (BOOL)isDriverDoNotDisturbModificationsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDriverDoNotDisturbModifications"] != 2;
}

- (void)setDriverDoNotDisturbModificationsAllowed:(BOOL)a3
{
}

- (BOOL)isUSBRestrictedModeAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowUSBRestrictedMode"] != 2;
}

- (BOOL)isLockdownModeEnabled
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowLockdownMode"] == 1;
}

- (BOOL)isSharedDeviceTemporarySessionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSharedDeviceTemporarySession"] != 2;
}

- (BOOL)isMailPrivacyProtectionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMailPrivacyProtection"] != 2;
}

- (BOOL)isRapidSecurityResponseInstallationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowRapidSecurityResponseInstallation"] != 2;
}

- (BOOL)isRapidSecurityResponseRemovalAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowRapidSecurityResponseRemoval"] != 2;
}

- (BOOL)isiPhoneWidgetsOnMacAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowiPhoneWidgetsOnMac"] != 2;
}

- (BOOL)isHidingAppsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppsToBeHidden"] != 2;
}

- (BOOL)isLockingAppsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAppsToBeLocked"] != 2;
}

- (BOOL)isPreserveESIMOnEraseEnforced
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forcePreserveESIMOnErase"] == 1;
}

- (BOOL)isCallRecordingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCallRecording"] != 2;
}

- (BOOL)isAutoDimAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAutoDim"] != 2;
}

- (BOOL)isCommandTabAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCommandTab"] != 2;
}

- (BOOL)isControlCenterAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowControlCenter"] != 2;
}

- (BOOL)isCoverSheetAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCoverSheet"] != 2;
}

- (BOOL)isHomeScreenEditingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowHomeScreenEditing"] != 2;
}

- (BOOL)isSpotlightAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSpotlight"] != 2;
}

- (BOOL)isExternalDisplayStageManagerAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowExternalDisplayStageManager"] != 2;
}

- (BOOL)isWallpaperAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowWallpaper"] != 2;
}

- (BOOL)isCalculatorInputModeRPNAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCalculatorInputModeRPN"] != 2;
}

- (BOOL)isCalculatorModeBasicAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCalculatorModeBasic"] != 2;
}

- (BOOL)isCalculatorModeProgrammerAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowCalculatorModeProgrammer"] != 2;
}

- (BOOL)isMarketplaceAppInstallationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMarketplaceAppInstallation"] != 2;
}

- (BOOL)isWebDistributionAppInstallationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowWebDistributionAppInstallation"] != 2;
}

- (id)allowedMarketplaces
{
  if ([(MCProfileConnection *)self isMarketplaceAppInstallationAllowed])
  {
    BOOL v3 = [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"allowedMarketplaceApps"];
    if (v3)
    {
      unint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  return v4;
}

- (id)deniedMarketplaces
{
  BOOL v3 = [(MCProfileConnection *)self allowedMarketplaces];

  if (v3)
  {
    unint64_t v4 = 0;
  }
  else
  {
    char v5 = [(MCProfileConnection *)self effectiveValuesForUnionSetting:@"deniedMarketplaceApps"];
    if (v5)
    {
      unint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isMarketplaceAllowed:(id)a3
{
  id v4 = a3;
  char v5 = [(MCProfileConnection *)self allowedMarketplaces];
  int v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 containsObject:v4];
  }
  else
  {
    uint64_t v8 = [(MCProfileConnection *)self deniedMarketplaces];
    int v7 = [v8 containsObject:v4] ^ 1;
  }
  return v7;
}

- (BOOL)anyMarketplaceAllowed
{
  id v2 = [(MCProfileConnection *)self allowedMarketplaces];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)allMarketplacesAllowed
{
  BOOL v3 = [(MCProfileConnection *)self allowedMarketplaces];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    char v5 = [(MCProfileConnection *)self deniedMarketplaces];
    int v6 = v5;
    if (v5) {
      BOOL v4 = [v5 count] == 0;
    }
    else {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (BOOL)isOnenessAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowiPhoneMirroring"] != 2;
}

- (BOOL)isVideoConferencingRemoteControlAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowVideoConferencingRemoteControl"] != 2;
}

- (BOOL)isVideoConferencingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowVideoConferencing"] != 2;
}

- (BOOL)isTodayViewAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowTodayView"] != 2;
}

- (BOOL)isTodayViewModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowTodayViewModification"] != 2;
}

uint64_t __68__MCProfileConnection_Misc__restrictionEnforcedNotificationSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 objectForKeyedSubscript:@"BundleIdentifier"];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)_sharedDeviceConfiguration
{
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v3 = MCSharedDeviceConfigurationFilePath();
  uint64_t v4 = [v2 dictionaryWithContentsOfFile:v3];

  return v4;
}

- (id)deviceLockScreenFootnote
{
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v3 = [(MCProfileConnection *)self _sharedDeviceConfiguration];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"LockScreenFootnote"];

  return v4;
}

- (id)deviceProvisionalEnrollmentFootnote
{
  if ([(MCProfileConnection *)self isProvisionallyEnrolled])
  {
    id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
    if ([v2 userMode] == 1) {
      MCLocalizedString(@"TESLA_PROVISIONAL_ENROLLMENT_EDU_TEXT");
    }
    else {
    BOOL v3 = MCLocalizedStringByDevice(@"TESLA_PROVISIONAL_ENROLLMENT_TEXT");
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)deviceAssetTag
{
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v3 = [(MCProfileConnection *)self _sharedDeviceConfiguration];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"AssetTagInformation"];

  return v4;
}

- (double)userSessionTimeout
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = (void *)MEMORY[0x1E4F5E7A8];
  [v2 userSessionTimeout];
  return result;
}

- (double)temporarySessionTimeout
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = (void *)MEMORY[0x1E4F5E7A8];
  [v2 temporarySessionTimeout];
  return result;
}

- (BOOL)isTemporarySessionOnlyModeEnabled
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = (void *)MEMORY[0x1E4F5E7A8];
  return [v2 temporarySessionOnly];
}

- (BOOL)communicationServiceRulesExistForBundleID:(id)a3 forCommunicationServiceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  LODWORD(self) = [v7 isEqualToString:@"AudioCall"];

  if (self)
  {
    uint64_t v8 = +[MCRestrictionManager sharedManager];
    id v9 = [v8 effectiveUnionValuesForSetting:@"audioCallDefaultHandlerAppBundleIDs"];

    char v10 = [v9 containsObject:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v8 = 0;
  if (v6 && v7)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__11;
    uint64_t v17 = __Block_byref_object_dispose__11;
    id v18 = 0;
    id v9 = [(MCProfileConnection *)self publicXPCConnection];
    char v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_59];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__MCProfileConnection_Misc__defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier___block_invoke_60;
    v12[3] = &unk_1E5A68628;
    void v12[4] = &v13;
    [v10 defaultAppBundleIDForCommunicationServiceType:v6 forAccountWithIdentifier:v7 completion:v12];

    id v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  return v8;
}

void __100__MCProfileConnection_Misc__defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = v3;
      char v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Default app bundle identifier for comm service type error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __100__MCProfileConnection_Misc__defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Default app bundle identifier for comm service type error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (BOOL)isSpotlightInternetResultsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSpotlightInternetResults"] != 2;
}

- (id)activationLockBypassKey
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v3 = [(MCProfileConnection *)self fetchActivationLockBypassKeyWithError:0];
  uint64_t v4 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3 != 0;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEFAULT, "Requested activation lock bypass code, it exists: %d", (uint8_t *)v6, 8u);
  }
  return v3;
}

- (void)deleteActivationLockBypassKey
{
  [(MCProfileConnection *)self checkInIfNeeded];
  +[MCCrypto clearStoredActivationLockBypassCode];
}

- (id)activationLockBypassHash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCCrypto storedActivationLockBypassCodeHash];
  BOOL v3 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2 != 0;
    _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEFAULT, "Requested activation lock bypass code hash, it exists: %d", (uint8_t *)v5, 8u);
  }
  return v2;
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  [(MCProfileConnection *)self checkInIfNeeded];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__MCProfileConnection_Misc__waitForMigrationIncludingPostRestoreMigration_waitUntilCompleted_completion___block_invoke;
  v14[3] = &unk_1E5A68118;
  id v15 = v8;
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x1A6232FE0](v14);
  int v11 = [(MCProfileConnection *)self publicXPCConnection];
  int v12 = v11;
  if (v5) {
    [v11 synchronousRemoteObjectProxyWithErrorHandler:v10];
  }
  else {
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v10];
  }

  [v13 waitForMigrationIncludingPostRestoreMigration:v6 completion:v10];
}

void __105__MCProfileConnection_Misc__waitForMigrationIncludingPostRestoreMigration_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      BOOL v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Wait for migration including post restore error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)flush
{
}

- (void)setGracePeriod:(unint64_t)a3 passcode:(id)a4 completionBlock:(id)a5
{
  id v12 = a5;
  int v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a4;
  uint64_t v10 = [v8 numberWithUnsignedInteger:a3];
  [(MCProfileConnection *)self setValue:v10 forSetting:@"maxGracePeriod" passcode:v9];

  int v11 = v12;
  if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
    int v11 = v12;
  }
}

- (unint64_t)gracePeriod
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  id v3 = [v2 effectiveValueForSetting:@"maxGracePeriod"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v9 = a5;
  [(MCProfileConnection *)self setFingerprintUnlockAllowed:v6 passcode:a4];
  int v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    int v8 = v9;
  }
}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4
{
  LOBYTE(v4) = 1;
  [(MCProfileConnection *)self setBoolValue:a3 ask:0 forSetting:@"allowFingerprintForUnlock" configurationUUID:0 toSystem:1 user:0 passcode:a4 credentialSet:0 waitUntilCompleted:v4 completion:0];
}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 passcode:(id)a4 completion:(id)a5
{
  LOBYTE(v5) = 0;
  [(MCProfileConnection *)self setBoolValue:a3 ask:0 forSetting:@"allowFingerprintForUnlock" configurationUUID:0 toSystem:1 user:0 passcode:a4 credentialSet:0 waitUntilCompleted:v5 completion:a5];
}

- (void)setFingerprintUnlockAllowed:(BOOL)a3 credentialSet:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v10 = a5;
  LOBYTE(v9) = 1;
  [(MCProfileConnection *)self setBoolValue:v6 ask:0 forSetting:@"allowFingerprintForUnlock" configurationUUID:0 toSystem:1 user:0 passcode:0 credentialSet:a4 waitUntilCompleted:v9 completion:0];
  int v8 = v10;
  if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    int v8 = v10;
  }
}

- (BOOL)isAttentionAwareAutoLockAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAttentionAwareAutoLock"] != 2;
}

- (BOOL)shouldDestroyOldKeybag
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v3 = [MEMORY[0x1E4F73160] sharedClient];
  char v4 = [v3 accessRights];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v6 = MDMFilePath();
  unsigned __int8 v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

  if (![(MCProfileConnection *)self isSupervised] || (v7 & ((v4 & 4) != 0)) != 0) {
    return 1;
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.managedconfiguration.notbackedup", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v10 = (void *)CFPreferencesCopyValue(@"KeybagMigrationHasBeenClearedByHost", @"com.apple.managedconfiguration.notbackedup", @"mobile", v9);
  char v11 = [v10 BOOLValue];

  return v11;
}

- (void)setAirPlaySettingsUIAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)isAirPlaySettingsUIAllowedOutAsk:(BOOL *)a3
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAirPlaySettingsUI" outAsk:a3] != 2;
}

- (void)setAirPlaySecuritySettingsUIAllowed:(BOOL)a3
{
}

- (BOOL)isAirPlaySecuritySettingsUIAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAirPlaySecuritySettingsUI"] != 2;
}

- (void)setMediaPurchaseAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)isMediaPurchaseAllowedOutAsk:(BOOL *)a3
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMediaPurchase" outAsk:a3] != 2;
}

- (void)setExplicitContentAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
}

- (void)setConferenceRoomDisplayModeEnabled:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)isConferenceRoomDisplayModeEnabledOutAsk:(BOOL *)a3
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"forceConferenceRoomDisplay" outAsk:a3] != 2;
}

- (void)setConferenceRoomDisplaySettingsUIAllowed:(BOOL)a3 ask:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)isConferenceRoomDisplaySettingsUIAllowedOutAsk:(BOOL *)a3
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowConferenceRoomDisplaySettingsUI" outAsk:a3] != 2;
}

- (BOOL)isDeviceSleepAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDeviceSleep"] != 2;
}

- (BOOL)isAutomaticScreenSaverAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowAutomaticScreenSaver"] != 2;
}

- (void)startMonitoringEnrollmentStateWithPersonaID:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v6 = [(MCProfileConnection *)self publicXPCConnection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 monitorEnrollmentStateWithPersonaID:v4];
}

- (void)stopMonitoringEnrollmentState
{
  waitForEnrollmentCompletionBlock = (void (**)(id, SEL))self->waitForEnrollmentCompletionBlock;
  if (waitForEnrollmentCompletionBlock)
  {
    waitForEnrollmentCompletionBlock[2](waitForEnrollmentCompletionBlock, a2);
    id v4 = self->waitForEnrollmentCompletionBlock;
    self->waitForEnrollmentCompletionBlock = 0;
  }
}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__MCProfileConnection_Misc__createMDMUnlockTokenIfNeededWithPasscode_completionBlock___block_invoke;
  v12[3] = &unk_1E5A68118;
  id v13 = v6;
  id v8 = v6;
  CFStringRef v9 = (void *)MEMORY[0x1A6232FE0](v12);
  id v10 = [(MCProfileConnection *)self xpcConnection];
  char v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v9];
  [v11 createMDMUnlockTokenIfNeededWithPasscode:v7 completion:v9];
}

void __86__MCProfileConnection_Misc__createMDMUnlockTokenIfNeededWithPasscode_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      CFStringRef v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Failed to create MDM unlock token. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (BOOL)isGameCenterAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGameCenter"] != 2;
}

- (BOOL)isNearbyMultiplayerGamingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGameCenterNearbyMultiplayer"] != 2;
}

- (BOOL)isGameCenterPrivateMessagingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGameCenterPrivateMessaging"] != 2;
}

- (BOOL)isGameCenterProfilePrivacyModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGameCenterProfilePrivacyModification"] != 2;
}

- (BOOL)isGameCenterProfileModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGameCenterProfileModification"] != 2;
}

- (BOOL)isGameCenterFriendsSharingModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGameCenterFriendsSharingModification"] != 2;
}

- (int64_t)allowedGameCenterPlayerTypes
{
  id v2 = +[MCRestrictionManager sharedManager];
  id v3 = [v2 effectiveValueForSetting:@"allowedGameCenterOtherPlayerTypes"];
  uint64_t v4 = [v3 integerValue];

  uint64_t v5 = 2;
  if (v4 < 2) {
    uint64_t v5 = v4;
  }
  return v5 & ~(v5 >> 63);
}

- (id)managingOrganizationForFontAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MCDependencyReader sharedReader];
  id v6 = [v4 absoluteString];

  uint64_t v7 = [v5 dependentsOfParent:v6 inDomain:@"MCDMFontURLToProfileIdentifierKey"];

  int v8 = [v7 firstObject];
  if (v8)
  {
    CFStringRef v9 = [(MCProfileConnection *)self installedProfileWithIdentifier:v8];
    uint64_t v10 = [v9 organization];

    if (v10)
    {
      char v11 = [v9 organization];
    }
    else
    {
      id v12 = [v9 managingProfileIdentifier];
      if (v12)
      {
        id v13 = [(MCProfileConnection *)self installedProfileWithIdentifier:v12];
        char v11 = [v13 organization];
      }
      else
      {
        char v11 = 0;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isDefinitionLookupAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowDefinitionLookup"] != 2;
}

- (BOOL)isTranslationLookupAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowTranslationLookup"] != 2;
}

- (BOOL)isSelectedTextSharingAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSelectedTextSharing"] != 2;
}

- (id)skipSetupKeys
{
  id v2 = objc_opt_new();
  id v3 = [v2 currentSkipKeys];
  id v4 = [v3 allObjects];

  return v4;
}

- (BOOL)isMultiUserNewUserCreationAllowed
{
  id v2 = [MCUMUserManagerClass() sharedManager];
  if (([v2 isSharedIPad] & 1) != 0
    || ([MEMORY[0x1E4F73170] sharedConfiguration],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 memberQueueManagingProfileIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F73170] sharedConfiguration];
    char v6 = [v5 isUserEnrollment];
  }
  return v6;
}

- (BOOL)isAudioToTextTranscriptionAllowed
{
  return 1;
}

- (BOOL)isExternalIntelligenceAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowExternalIntelligenceIntegrations"] != 2;
}

- (void)setExternalIntelligenceAllowed:(BOOL)a3
{
}

- (BOOL)isExternalIntelligenceSignInAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowExternalIntelligenceIntegrationsSignIn"] != 2;
}

- (id)allowedExternalIntelligenceAccountDomains
{
  return [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"allowedExternalIntelligenceAccountDomains"];
}

- (id)allowedExternalIntelligenceWorkspaceIDs
{
  return [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"allowedExternalIntelligenceWorkspaceIDs"];
}

- (BOOL)isPersonalizedHandwritingResultsAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowPersonalizedHandwritingResults"] != 2;
}

- (BOOL)isGenmojiAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowGenmoji"] != 2;
}

- (BOOL)isImagePlaygroundAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowImagePlayground"] != 2;
}

- (BOOL)isMailSummaryAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMailSummary"] != 2;
}

- (BOOL)isVisualIntelligenceSummaryAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowVisualIntelligenceSummary"] != 2;
}

- (BOOL)isMailSmartRepliesAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMailSmartReplies"] != 2;
}

- (BOOL)isSafariSummaryAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSafariSummary"] != 2;
}

- (BOOL)isNotesTranscriptionAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowNotesTranscription"] != 2;
}

- (BOOL)isNotesTranscriptionSummaryAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowNotesTranscriptionSummary"] != 2;
}

- (BOOL)isSpeakerVolumeLimitModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowSpeakerVolumeLimitModification"] != 2;
}

- (BOOL)isScreenTimeModificationAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowScreenTimeModification"] != 2;
}

- (void)checkCarrierProfile
{
}

- (void)checkCarrierProfileForceInstallation:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v6 = [(MCProfileConnection *)self publicXPCConnection];
  uint64_t v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_35];
  [v5 checkCarrierProfileAndForceReinstallation:v3 completion:&__block_literal_global_35];
}

void __69__MCProfileConnection_Private__checkCarrierProfileForceInstallation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Check carrier profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)notifyDeviceUnlocked
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self publicXPCConnection];
  BOOL v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_3_1];
  [v3 notifyDeviceUnlockedWithCompletion:&__block_literal_global_3_1];
}

void __52__MCProfileConnection_Private__notifyDeviceUnlocked__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Notify device unlocked error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)notifyDeviceUnlockedAndPasscodeRequired
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self publicXPCConnection];
  BOOL v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
  [v3 notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:&__block_literal_global_5];
}

void __71__MCProfileConnection_Private__notifyDeviceUnlockedAndPasscodeRequired__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Notify device unlocked and passcode required error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)removeExpiredProfiles
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self xpcConnection];
  BOOL v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_7];
  [v3 removeExpiredProfilesWithCompletion:&__block_literal_global_7];
}

void __53__MCProfileConnection_Private__removeExpiredProfiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Remove expired profiles error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)rereadManagedAppAttributes
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self xpcConnection];
  BOOL v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_9_0];
  [v3 rereadManagedAppAttributesWithCompletion:&__block_literal_global_9_0];
}

void __58__MCProfileConnection_Private__rereadManagedAppAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Reread managed app attributes error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__MCProfileConnection_Private__resetPasscodeMetadataWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1A6232FE0](v9);
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v5];
  [v8 resetPasscodeMetadataWithCompletion:v6];
}

void __68__MCProfileConnection_Private__resetPasscodeMetadataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Reset passcode metadata failed. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)doMCICDidUpdateStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidUpdateStatus:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [v10 profileConnection:self didUpdateStatus:v6];
  }
  if (v7) {
    v7[2](v7, 0);
  }
}

- (void)doMCICDidRequestCurrentPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidRequestCurrentPasscodeWithCompletion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = (void *)MEMORY[0x1A6232FE0](v4);
    id passcodeReplyBlock = self->passcodeReplyBlock;
    self->id passcodeReplyBlock = v7;

    id v9 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [v9 profileConnectionDidRequestCurrentPasscode:self];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
}

- (void)doMCICDidBeginInstallingNextProfileData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidBeginInstallingNextProfileData:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v6 && (v9 & 1) != 0)
  {
    id v10 = +[MCProfile profileWithData:v6 outError:0];
    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
      [v11 profileConnection:self didBeginInstallingNextProfile:v10];
    }
  }
  if (v7) {
    v7[2](v7, 0);
  }
}

- (void)doMCICDidFinishInstallationWithIdentifier:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidFinishInstallationWithIdentifier:error:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [v13 profileConnection:self didFinishInstallationWithIdentifier:v8 error:v9];

    objc_storeWeak((id *)&self->_interactionDelegate, 0);
  }
  if (v10) {
    v10[2](v10, 0);
  }
}

- (void)doMCICDidRequestUserInput:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidRequestUserInput:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1A6232FE0](v7);
    id userInputReplyBlock = self->userInputReplyBlock;
    self->id userInputReplyBlock = v10;

    char v12 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [v12 profileConnection:self didRequestUserInput:v6];
  }
  else
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      while (1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary", v18);
        [v12 addObject:v17];

        if (!--v15)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    if (v7) {
      (*((void (**)(id, void *, void, void, void))v7 + 2))(v7, v12, 0, 0, 0);
    }
  }
}

- (void)doMCICDidRequestMAIDSignIn:(id)a3 personaID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidRequestMAIDSignIn:personaID:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = (void *)MEMORY[0x1A6232FE0](v10);
    id MAIDSignInReplyBlock = self->MAIDSignInReplyBlock;
    self->id MAIDSignInReplyBlock = v13;

    uint64_t v15 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [v15 profileConnection:self didRequestMAIDSignIn:v8 personaID:v9];
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] MCErrorWithDomain:@"MCInstallationErrorDomain" code:4001 descriptionArray:&unk_1EF4D0C28 errorType:@"MCFatalError"];
    (*((void (**)(id, void, void *, void))v10 + 2))(v10, 0, v15, 0);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)doMCICDidRequestManagedRestoreWithManagedAppleID:(id)a3 personaID:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = (void *)MEMORY[0x1A6232FE0](v9);
    id restoreReplyBlock = self->restoreReplyBlock;
    self->id restoreReplyBlock = v12;

    uint64_t v14 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [v14 profileConnection:self didRequestManagedRestoreWithManagedAppleID:v15 personaID:v8];
  }
  else
  {
    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] MCErrorWithDomain:@"MCInstallationErrorDomain" code:4001 descriptionArray:&unk_1EF4D0C40 errorType:@"MCFatalError"];
    (*((void (**)(id, void, void *, void))v9 + 2))(v9, 0, v14, 0);
  }

LABEL_6:
}

- (void)doMCICDidRequestShowUserWarnings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidRequestShowUserWarnings:completion:]();
  }
  if (![v6 count])
  {

    id v6 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1A6232FE0](v7);
    id showWarningsReplyBlock = self->showWarningsReplyBlock;
    self->id showWarningsReplyBlock = v10;

    id v12 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    [v12 profileConnection:self didShowUserWarnings:v6];
  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }
}

- (void)doMCICDidFinishPreflightWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICDidFinishPreflightWithError:completion:]();
  }
  id v8 = (void *)MEMORY[0x1A6232FE0](v7);
  id userInputReplyBlock = self->userInputReplyBlock;
  self->id userInputReplyBlock = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  [WeakRetained profileConnection:self didFinishPreflightWithError:v6];
}

- (void)doMCICWaitForEnrollmentToFinishWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG)) {
    -[MCProfileConnection(Private) doMCICWaitForEnrollmentToFinishWithCompletion:]();
  }
  id v5 = (void *)MEMORY[0x1A6232FE0](v4);
  id waitForEnrollmentCompletionBlock = self->waitForEnrollmentCompletionBlock;
  self->id waitForEnrollmentCompletionBlock = v5;
}

- (id)fetchActivationLockBypassKeyWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v10 = 0;
  id v4 = +[MCCrypto storedActivationLockBypassCodeWithOutError:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id v8 = [v5 MCVerboseDescription];
      *(_DWORD *)long long buf = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Activation lock bypass key fetch error. Error: %{public}@", buf, 0xCu);
    }
    if (a3) {
      *a3 = v5;
    }
  }

  return v4;
}

- (id)_localizedCertificateSourceDescriptionFromMDMName:(id)a3 exchangeName:(id)a4 exchangeCount:(int64_t)a5 profileName:(id)a6 profileCount:(int64_t)a7
{
  return [(MCProfileConnection *)self _localizedSourceDescriptionForType:0 MDMName:a3 exchangeName:a4 exchangeCount:a5 profileName:a6 profileCount:a7];
}

- (id)_localizedRestrictionSourceDescriptionFromMDMName:(id)a3 exchangeName:(id)a4 exchangeCount:(int64_t)a5 profileName:(id)a6 profileCount:(int64_t)a7
{
  return [(MCProfileConnection *)self _localizedSourceDescriptionForType:1 MDMName:a3 exchangeName:a4 exchangeCount:a5 profileName:a6 profileCount:a7];
}

- (id)_localizedSourceDescriptionForType:(int64_t)a3 MDMName:(id)a4 exchangeName:(id)a5 exchangeCount:(int64_t)a6 profileName:(id)a7 profileCount:(int64_t)a8
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = v15;
  uint64_t v17 = @"SETTINGS";
  if (!a3) {
    uint64_t v17 = @"CERTIFICATES";
  }
  if (v13) {
    BOOL v18 = a6 < 1;
  }
  else {
    BOOL v18 = 0;
  }
  int v19 = v18;
  if (v19 == 1 && a8 <= 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME", v17];
    goto LABEL_19;
  }
  char v21 = v19 ^ 1;
  if (a8 == 1) {
    char v22 = v21;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_AND_ONE_PROFILE", v17];
    uint64_t v23 = LABEL_19:;
    MCLocalizedFormat(v23, v24, v25, v26, v27, v28, v29, v30, (uint64_t)v13);
    id v31 = LABEL_20:;
LABEL_21:

    goto LABEL_22;
  }
  if (a8 < 2) {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_AND_MULTIPLE_PROFILES", v17];
    uint64_t v23 = LABEL_29:;
    uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:a8];
    MCLocalizedFormat(v23, v34, v35, v36, v37, v38, v39, v40, (uint64_t)v13);
    id v31 = LABEL_30:;

    goto LABEL_21;
  }
  if (v13) {
    BOOL v41 = a6 == 1;
  }
  else {
    BOOL v41 = 0;
  }
  char v42 = v41;
  if (v41 && a8 <= 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_AND_ONE_EXCHANGE", v17];
    goto LABEL_19;
  }
  if (v13) {
    BOOL v43 = a6 <= 1;
  }
  else {
    BOOL v43 = 1;
  }
  int v44 = !v43;
  if (v44 == 1 && a8 <= 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_AND_MULTIPLE_EXCHANGES", v17];
    uint64_t v45 = LABEL_50:;
    uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithInteger:a6];
    MCLocalizedFormat(v45, v47, v48, v49, v50, v51, v52, v53, (uint64_t)v13);
    id v31 = LABEL_51:;
LABEL_52:

    goto LABEL_22;
  }
  char v54 = v42 ^ 1;
  if (a8 == 1) {
    char v55 = v54;
  }
  else {
    char v55 = 1;
  }
  if ((v55 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_ONE_EXCHANGE_AND_ONE_PROFILE", v17];
    goto LABEL_19;
  }
  if (a8 < 2) {
    char v54 = 1;
  }
  if ((v54 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_ONE_EXCHANGE_AND_MULTIPLE_PROFILES", v17];
    goto LABEL_29;
  }
  char v56 = v44 ^ 1;
  if (a8 == 1) {
    char v57 = v56;
  }
  else {
    char v57 = 1;
  }
  if ((v57 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_MULTIPLE_EXCHANGES_AND_ONE_PROFILE", v17];
    goto LABEL_50;
  }
  if (a8 < 2) {
    char v56 = 1;
  }
  if ((v56 & 1) == 0)
  {
    uint64_t v45 = [NSString stringWithFormat:@"%@_RESTRICTED_BY_MDM_NAME_MULTIPLE_EXCHANGES_AND_MULTIPLE_PROFILES", v17];
    uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithInteger:a6];
    long long v58 = [MEMORY[0x1E4F28ED0] numberWithInteger:a8];
    MCLocalizedFormat(v45, v59, v60, v61, v62, v63, v64, v65, (uint64_t)v13);
    id v31 = LABEL_71:;

    goto LABEL_52;
  }
  if (v14) {
    BOOL v66 = a6 == 1;
  }
  else {
    BOOL v66 = 0;
  }
  char v67 = v66;
  if (v66 && a8 <= 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_EXCHANGE_NAME", v17];
    uint64_t v23 = LABEL_95:;
    MCLocalizedFormat(v23, v77, v78, v79, v80, v81, v82, v83, (uint64_t)v14);
    goto LABEL_20;
  }
  if (v14 && a6 == 2 && a8 <= 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_EXCHANGE_NAME_AND_ONE_OTHER", v17];
    goto LABEL_95;
  }
  if (v14 && a6 >= 3 && a8 <= 0)
  {
    uint64_t v45 = [NSString stringWithFormat:@"%@_RESTRICTED_BY_EXCHANGE_NAME_AND_MULTIPLE_OTHERS", v17];
    uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithInteger:a6 - 1];
    MCLocalizedFormat(v45, v68, v69, v70, v71, v72, v73, v74, (uint64_t)v14);
    goto LABEL_51;
  }
  char v75 = v67 ^ 1;
  if (a8 == 1) {
    char v76 = v75;
  }
  else {
    char v76 = 1;
  }
  if ((v76 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_EXCHANGE_NAME_AND_ONE_PROFILE", v17];
    goto LABEL_95;
  }
  if (a8 < 2) {
    char v75 = 1;
  }
  if ((v75 & 1) == 0)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%@_RESTRICTED_BY_EXCHANGE_NAME_AND_MULTIPLE_PROFILES", v17];
    uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:a8];
    MCLocalizedFormat(v23, v84, v85, v86, v87, v88, v89, v90, (uint64_t)v14);
    goto LABEL_30;
  }
  if (a6 >= 2 && a8 == 1)
  {
    uint64_t v45 = [NSString stringWithFormat:@"%@_RESTRICTED_BY_MULTIPLE_EXCHANGES_AND_ONE_PROFILE", v17];
    uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithInteger:a6];
    MCLocalizedFormat(v45, v91, v92, v93, v94, v95, v96, v97, (uint64_t)v46);
    goto LABEL_51;
  }
  if (a6 >= 2 && a8 >= 2)
  {
    uint64_t v45 = [NSString stringWithFormat:@"%@_RESTRICTED_BY_MULTIPLE_EXCHANGES_AND_MULTIPLE_PROFILES", v17];
    uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithInteger:a6];
    long long v58 = [MEMORY[0x1E4F28ED0] numberWithInteger:a8];
    MCLocalizedFormat(v45, v98, v99, v100, v101, v102, v103, v104, (uint64_t)v46);
    goto LABEL_71;
  }
  if (v15 && a8 == 1)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_PROFILE_NAME", v17];
    uint64_t v23 = LABEL_112:;
    MCLocalizedFormat(v23, v105, v106, v107, v108, v109, v110, v111, (uint64_t)v16);
    goto LABEL_20;
  }
  if (v15 && a8 == 2)
  {
    [NSString stringWithFormat:@"%@_RESTRICTED_BY_PROFILE_NAME_AND_ONE_OTHER", v17];
    goto LABEL_112;
  }
  if (v15 && a8 >= 3)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%@_RESTRICTED_BY_PROFILE_NAME_AND_MULTIPLE_OTHERS", v17];
    uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:a8 - 1];
    MCLocalizedFormat(v23, v112, v113, v114, v115, v116, v117, v118, (uint64_t)v16);
    goto LABEL_30;
  }
  v119 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    id v120 = (void *)MEMORY[0x1E4F28ED0];
    v121 = v119;
    id v122 = [v120 numberWithInteger:a6];
    v123 = [MEMORY[0x1E4F28ED0] numberWithInteger:a8];
    *(_DWORD *)long long buf = 138544386;
    id v125 = v13;
    __int16 v126 = 2114;
    id v127 = v14;
    __int16 v128 = 2114;
    v129 = v122;
    __int16 v130 = 2114;
    v131 = v16;
    __int16 v132 = 2114;
    v133 = v123;
    _os_log_impl(&dword_1A13F0000, v121, OS_LOG_TYPE_ERROR, "Couldn't craft proper restriction info string for (%{public}@, %{public}@, %{public}@, %{public}@, %{public}@)", buf, 0x34u);
  }
  id v31 = 0;
LABEL_22:

  return v31;
}

- (id)_disallowedRestrictionErrorForRestrictionKey:(id)a3
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  char v9 = MCErrorArray(@"USER_ENROLLMENT_DISALLOWED_RESTRICTION_P_RESTRICTION", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  id v10 = [v8 MCErrorWithDomain:@"MCDeviceCapabilitiesErrorDomain" code:26002 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (id)_transmogrifyRestrictionDictionaryForUserEnrollment:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v40 = 0;
  BOOL v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__12;
  uint64_t v34 = __Block_byref_object_dispose__12;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__12;
  uint64_t v28 = __Block_byref_object_dispose__12;
  id v29 = (id)[v6 MCMutableDeepCopy];
  uint64_t v7 = +[MCRestrictionsPayload userEnrollmentAllowedKeysFilter];
  id v8 = +[MCRestrictionManager sharedManager];
  char v9 = [v8 defaultRestrictions];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke;
  v16[3] = &unk_1E5A68678;
  id v10 = v7;
  id v17 = v10;
  long long v20 = &v36;
  char v21 = &v24;
  id v11 = v9;
  char v22 = &v40;
  uint64_t v23 = &v30;
  id v18 = v11;
  int v19 = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];
  if (*((unsigned char *)v37 + 24))
  {
    [(id)v25[5] MCSetBoolRestriction:@"allowSimple" value:0];
    [(id)v25[5] MCSetValueRestriction:@"minLength" value:&unk_1EF4D0A78];
  }
  int v12 = *((unsigned __int8 *)v41 + 24);
  if (a4 && !*((unsigned char *)v41 + 24))
  {
    *a4 = (id) v31[5];
    int v12 = *((unsigned __int8 *)v41 + 24);
  }
  if (v12) {
    id v13 = (void *)v25[5];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v14;
}

void __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = [v8 objectForKeyedSubscript:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke_2;
  v15[3] = &unk_1E5A68650;
  id v16 = v10;
  id v17 = v7;
  long long v20 = *(_OWORD *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  long long v21 = *(_OWORD *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 48);
  id v18 = v11;
  uint64_t v19 = v12;
  id v13 = v7;
  id v14 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) ^ 1;
}

void __93__MCProfileConnection_Private___transmogrifyRestrictionDictionaryForUserEnrollment_outError___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v19 = a2;
  id v7 = a3;
  if (([*(id *)(a1 + 32) containsObject:v19] & 1) == 0)
  {
    if ([*(id *)(a1 + 40) isEqualToString:@"restrictedValue"])
    {
      if (![v19 isEqualToString:@"minLength"])
      {
LABEL_8:
        id v15 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
        [v15 setObject:0 forKeyedSubscript:v19];

        goto LABEL_12;
      }
LABEL_4:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      goto LABEL_8;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"restrictedBool"])
    {
      id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
      id v9 = [v8 objectForKeyedSubscript:v19];

      if (v9)
      {
        id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
        id v11 = [v10 objectForKeyedSubscript:v19];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"preference"];
        int v13 = [v12 BOOLValue];

        id v14 = [v7 objectForKeyedSubscript:@"value"];
        LODWORD(v11) = [v14 BOOLValue];

        if (v13 != v11) {
          goto LABEL_8;
        }
        if (([v19 isEqualToString:@"forcePIN"] & 1) != 0
          || [v19 isEqualToString:@"allowSimple"])
        {
          goto LABEL_4;
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    uint64_t v16 = [*(id *)(a1 + 56) _disallowedRestrictionErrorForRestrictionKey:v19];
    uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
  }
LABEL_12:
}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v14 = [(MCProfileConnection *)self xpcConnection];
  int v13 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_113];
  [v13 debugRescheduleBackgroundActivity:a3 startDate:v12 gracePeriod:v11 repeatingInterval:v10 completion:&__block_literal_global_113];
}

void __106__MCProfileConnection_Private__debugRescheduleBackgroundActivity_startDate_gracePeriod_repeatingInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = v3;
      uint64_t v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Reschedule background activity error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)checkApplicationIdentifierEntitlement
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v2)
  {
    uint64_t v3 = v2;
    CFErrorRef error = 0;
    uint64_t v4 = (void *)SecTaskCopyValueForEntitlement(v2, @"application-identifier", &error);
    BOOL v5 = v4 != 0;
    if (!v4)
    {
      uint64_t v6 = qword_1EB2223B0;
      if (error)
      {
        if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          CFErrorRef v15 = error;
          id v7 = "Failed to retrieve application-identifier entitlement with error: %{public}@";
          uint64_t v8 = v6;
          os_log_type_t v9 = OS_LOG_TYPE_ERROR;
          uint32_t v10 = 12;
LABEL_11:
          _os_log_impl(&dword_1A13F0000, v8, v9, v7, buf, v10);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        id v7 = "This process requires an application-identifier entitlement to communicate with profiled. This will cause a"
             " crash in the future.";
        uint64_t v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_FAULT;
        uint32_t v10 = 2;
        goto LABEL_11;
      }
    }
    CFRelease(v3);

    return v5;
  }
  id v11 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_ERROR, "Failed to construct SecTask for client application-identifier entitlement check", buf, 2u);
  }
  return 0;
}

- (void)updateCloudConfigWithSupervision:(BOOL)a3 replaceExistingConfig:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  os_log_type_t v9 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint32_t v10 = [v9 details];
  id v11 = (void *)[v10 mutableCopy];

  if (a4 || !v11)
  {
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];

    [v12 setObject:&unk_1EF4D0A90 forKeyedSubscript:*MEMORY[0x1E4F731B8]];
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F73198]];
    [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F73238]];
    id v11 = v12;
  }
  int v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F731D8]];

  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F731A8]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __98__MCProfileConnection_Private__updateCloudConfigWithSupervision_replaceExistingConfig_completion___block_invoke;
  v15[3] = &unk_1E5A68118;
  id v16 = v8;
  id v14 = v8;
  [(MCProfileConnection *)self storeCloudConfigurationDetails:v11 completion:v15];
}

uint64_t __98__MCProfileConnection_Private__updateCloudConfigWithSupervision_replaceExistingConfig_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserBookmarks:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (v4)
  {
    BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
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
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "serializableDictionary", (void)v14);
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  id v12 = [(MCProfileConnection *)self xpcConnection];
  int v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_38];
  [v13 setUserBookmarks:v5 completion:&__block_literal_global_38];
}

void __57__MCProfileConnection_SafariBookmarks__setUserBookmarks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      BOOL v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set user bookmarks error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)userBookmarks
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCBookmarkManager sharedManager];
  uint64_t v3 = [v2 userBookmarks];

  return v3;
}

- (id)defaultUserBookmarks
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = MCSystemRootDirectory();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/WebContentAnalysis.framework"];

  id v4 = [MEMORY[0x1E4F28B50] bundleWithPath:v3];
  BOOL v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v6 = [v5 languageCode];
  uint64_t v7 = [@"com.apple.webcontentfilter.defaults." stringByAppendingString:v6];

  uint64_t v8 = [v4 pathForResource:v7 ofType:@"plist"];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = v7;
LABEL_5:
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v9];
    int v13 = [v12 objectForKeyedSubscript:@"siteWhitelist"];
    if ([v13 count])
    {
      id v29 = v9;
      uint64_t v30 = v10;
      id v31 = v5;
      uint64_t v32 = v4;
      long long v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v28 = v13;
      id obj = v13;
      uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            long long v20 = objc_alloc_init(MCBookmark);
            long long v21 = (void *)MEMORY[0x1E4F1CB10];
            char v22 = [v19 objectForKeyedSubscript:@"address"];
            uint64_t v23 = [v21 URLWithString:v22];
            [(MCBookmark *)v20 setURL:v23];

            uint64_t v24 = [v19 objectForKeyedSubscript:@"bookmarkPath"];
            [(MCBookmark *)v20 setPath:v24];

            uint64_t v25 = [v19 objectForKeyedSubscript:@"pageTitle"];
            [(MCBookmark *)v20 setTitle:v25];

            [v14 addObject:v20];
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v16);
      }

      id v4 = v32;
      uint64_t v10 = v30;
      BOOL v5 = v31;
      uint64_t v9 = v29;
      int v13 = v28;
    }
    else
    {
      long long v14 = 0;
    }

    goto LABEL_16;
  }
  uint64_t v10 = [@"com.apple.webcontentfilter.defaults." stringByAppendingString:@"en"];

  uint64_t v11 = [v4 pathForResource:v10 ofType:@"plist"];
  if (v11)
  {
    uint64_t v9 = (void *)v11;
    goto LABEL_5;
  }
  uint64_t v27 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A13F0000, v27, OS_LOG_TYPE_ERROR, "Could not find English default bookmarks file", buf, 2u);
  }
  long long v14 = 0;
LABEL_16:

  return v14;
}

- (void)setWebContentFilterAutoPermittedURLStrings:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v6 = [(MCProfileConnection *)self publicXPCConnection];
  BOOL v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30_1];
  [v5 setAllowedURLStrings:v4 completion:&__block_literal_global_30_1];
}

void __83__MCProfileConnection_SafariBookmarks__setWebContentFilterAutoPermittedURLStrings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      BOOL v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Set webcontentfilter autopermitted URLs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setWebContentFilterUserBlacklistedURLStrings:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self setValues:v4 forUnionSetting:@"webContentFilterBlacklistedURLs"];
}

- (int)hostMayPairWithOptions:(id)a3 challenge:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v8 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_INFO, "Received pairing request.", buf, 2u);
  }
  uint64_t v9 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_DEBUG, "Pairing options: %{public}@", buf, 0xCu);
  }
  uint64_t v10 = [(MCProfileConnection *)self cloudConfigurationDetails];
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F73248]];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = qword_1EB2223B0;
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_ERROR, "Rejecting pairing options because it's not a dictionary.", buf, 2u);
      }

      id v6 = 0;
    }
  }
  int v13 = [v6 objectForKeyedSubscript:@"SupervisorCertificate"];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v14 = qword_1EB2223B0;
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "Rejecting supervisor certificate because it is not a data object.", buf, 2u);
      }

      int v13 = 0;
    }
  }
  uint64_t v15 = +[MCRestrictionManager sharedManager];
  int v16 = [v15 effectiveRestrictedBoolForSetting:@"allowHostPairing"];
  if (v13)
  {
    if ([v11 containsObject:v13])
    {
      uint64_t v17 = qword_1EB2223B0;
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_INFO, "Challenge requested for silent pairing.", buf, 2u);
      }
      int v18 = 3;
      goto LABEL_40;
    }
    goto LABEL_34;
  }
  if (!v7 || ![v11 count])
  {
LABEL_34:
    uint64_t v25 = qword_1EB2223B0;
    if (v16 == 2)
    {
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_ERROR, "Pairing is not allowed.", buf, 2u);
      }
      int v18 = 0;
    }
    else
    {
      int v18 = 1;
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_INFO, "Pairing is allowed pending user acceptance.", buf, 2u);
      }
    }
    goto LABEL_40;
  }
  uint64_t v19 = [v6 objectForKeyedSubscript:@"ChallengeResponse"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v24 = "Challenge response is invalid.";
LABEL_32:
      _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    }
LABEL_33:

    goto LABEL_34;
  }
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  if (!BasicX509)
  {
    uint64_t v23 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v24 = "Could not create security policy.";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  SecPolicyRef v21 = BasicX509;
  uint64_t v38 = 0;
  *(void *)long long buf = 0;
  long long v36 = v19;
  if (SecCMSVerifyCopyDataAndAttributes())
  {
    char v22 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v37 = 0;
      _os_log_impl(&dword_1A13F0000, v22, OS_LOG_TYPE_ERROR, "Could not extract the signing certificate from the response.", v37, 2u);
    }
    CFRelease(v21);
    uint64_t v19 = v36;
    goto LABEL_33;
  }
  long long v35 = v38;
  if (!objc_msgSend(v7, "isEqualToData:"))
  {
    id v29 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v37 = 0;
      uint64_t v30 = "Response data does not match challenge.";
LABEL_51:
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, v30, v37, 2u);
    }
LABEL_52:
    char v34 = 0;
    int v18 = 0;
    goto LABEL_53;
  }
  if (!*(void *)buf || SecTrustGetCertificateCount(*(SecTrustRef *)buf) < 1)
  {
    id v29 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v37 = 0;
      uint64_t v30 = "Could not determine challenge signer.";
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  CertificateAtIndex = SecTrustGetCertificateAtIndex(*(SecTrustRef *)buf, 0);
  CFDataRef v33 = SecCertificateCopyData(CertificateAtIndex);
  int v28 = objc_msgSend(v11, "containsObject:");
  char v34 = v28;
  if (v28)
  {
    log = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v37 = 0;
      int v18 = 2;
      _os_log_impl(&dword_1A13F0000, log, OS_LOG_TYPE_INFO, "Pairing approved without prompting.", v37, 2u);
    }
    else
    {
      int v18 = 2;
    }
  }
  else
  {
    id v31 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v37 = 0;
      _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_ERROR, "The signing certificate is not among the list of approved certificates.", v37, 2u);
    }
    int v18 = 0;
  }

LABEL_53:
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }

  CFRelease(v21);
  if ((v34 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_40:

  return v18;
}

- (void)lockdownDidReceiveActivationRecord:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = qword_1EB2223B0;
  if (isKindOfClass)
  {
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_INFO, "Received activation record: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = [(MCProfileConnection *)self xpcConnection];
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_41];
    [v8 storeActivationRecord:v4 completion:&__block_literal_global_41];
  }
  else if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Activation record configuration is not a dictionary. Ignoring.", (uint8_t *)&v9, 2u);
  }
}

void __68__MCProfileConnection_Lockdown__lockdownDidReceiveActivationRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      BOOL v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Lockdown did receive activation record error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)isUnpairedExternalBootToRecoveryAllowed
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowUnpairedExternalBootToRecovery"] == 1;
}

- (BOOL)isHomeScreenLayoutApplied
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = MCUserHomeScreenLayoutFilePath();
  if ([v2 fileExistsAtPath:v3])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = MCSystemHomeScreenLayoutFilePath();
    char v4 = [v2 fileExistsAtPath:v5];
  }
  return v4;
}

- (id)restrictionEnforcedHomeScreenLayout
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = MCUserHomeScreenLayoutFilePath();
  char v4 = [v2 arrayWithContentsOfFile:v3];

  if (!v4)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1C978];
    int v6 = MCSystemHomeScreenLayoutFilePath();
    char v4 = [v5 arrayWithContentsOfFile:v6];
  }
  return v4;
}

- (id)removedSystemAppBundleIDs
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = +[MCRestrictionManager sharedManager];
    char v4 = [v3 effectiveUnionValuesForSetting:@"removedSystemAppBundleIDs"];
    id v2 = (void *)[v4 copy];
  }
  return v2;
}

- (id)restrictionEnforcedBlockedAppBundleIDs
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = +[MCRestrictionManager sharedManager];
    char v4 = [v3 restrictionEnforcedBlockedAppBundleIDsExcludingRemovedSystemApps:1];
    id v2 = (void *)[v4 copy];
  }
  return v2;
}

- (id)parentalControlsBlockedAppBundleIDs
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = +[MCRestrictionManager sharedManager];
    char v4 = [v3 parentalControlsBlockedAppBundleIDs];
    id v2 = (void *)[v4 copy];
  }
  return v2;
}

- (void)setParentalControlsBlockedAppBundleIDs:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 allObjects];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(MCProfileConnection *)self setValues:v4 forUnionSetting:@"blockedAppBundleIDs"];
}

- (id)restrictionEnforcedWhitelistedAppBundleIDs
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = +[MCRestrictionManager sharedManager];
    uint64_t v4 = [v3 restrictionEnforcedWhitelistedAppBundleIDs];
    id v2 = (void *)[v4 copy];
  }
  return v2;
}

- (BOOL)isInSingleAppMode
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  char v3 = [v2 isInSingleAppMode];

  return v3;
}

- (BOOL)isEffectivelyInAppAllowListMode
{
  [(MCProfileConnection *)self checkInIfNeeded];
  return MCIsEffectivelyInAppWhitelistMode();
}

- (BOOL)isPasscodeRequiredToAccessWhitelistedApps
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  char v3 = [v2 effectiveUserSettings];
  BOOL v4 = +[MCRestrictionManager isPasscodeRequiredToAccessWhitelistedAppsWithSettingsDictionary:v3];

  return v4;
}

- (BOOL)mayEnterPasscodeToAccessNonWhitelistedApps
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  char v3 = [v2 effectiveUserSettings];
  BOOL v4 = +[MCRestrictionManager mayEnterPasscodeToAccessNonWhitelistedAppsWithSettingsDictionary:v3];

  return v4;
}

- (BOOL)isSingleAppModeLogoutAllowed
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  char v3 = [v2 isSingleAppModeLogoutAllowed];

  return v3;
}

- (id)parentalControlsWhitelistedAppBundleIDs
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    id v2 = 0;
  }
  else
  {
    char v3 = +[MCRestrictionManager sharedManager];
    BOOL v4 = [v3 parentalControlsWhitelistedAppBundleIDs];
    id v2 = (void *)[v4 copy];
  }
  return v2;
}

- (void)setParentalControlsWhitelistedAppBundleIDs:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 allObjects];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(MCProfileConnection *)self setValues:v4 forIntersectionSetting:@"appLockBundleIDs"];
}

- (BOOL)isParentalControlsAllowPasscodeAccessToNonWhitelistedAppsUIForcedByRestrictions
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:@"allowAccessWithoutPasscodeInAppLock"];

  return v3;
}

- (BOOL)parentalControlsAllowPasscodeAccessToNonWhitelistedApps
{
  return [(MCProfileConnection *)self effectiveBoolValueForSetting:@"allowMultipleAppsInAppLock"] != 2;
}

- (void)parentalControlsSetAllowPasscodeAccessToNonWhitelistedApps:(BOOL)a3
{
}

- (id)autonomousSingleAppModePermittedBundleIDs
{
  if ([(MCProfileConnection *)self needsCheckIn])
  {
    char v3 = 0;
  }
  else
  {
    uint64_t v4 = [(MCProfileConnection *)self effectiveValuesForIntersectionSetting:@"autonomousSingleAppModePermittedAppIDs"];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
      int v6 = [(MCProfileConnection *)self restrictedAppBundleIDs];
      id v7 = [(MCProfileConnection *)self effectiveWhitelistedAppBundleIDs];
      if (v6) {
        [v5 minusSet:v6];
      }
      if (v7) {
        [v5 intersectSet:v7];
      }
      char v3 = [v5 allObjects];
    }
    else
    {
      char v3 = 0;
    }
  }
  return v3;
}

- (id)companionBundleIDToWatchBundleIDsMap
{
  return +[MCGizmoUtilities MCFirstPartyCompanionToWatchAppBundleIDs];
}

- (void)storeCertificateData:(id)a3 forHostIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  if ([(MCProfileConnection *)self _checkRemoteProcessHasMDMEntitlement])
  {
    id v7 = [(MCProfileConnection *)self xpcConnection];
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_47];
    [v8 storeCertificateData:v9 forIPCUIdentifier:v6 completion:&__block_literal_global_47];
  }
  else
  {
    id v7 = [(MCProfileConnection *)self _lacksEntitlementError];
    __67__MCProfileConnection_MDM__storeCertificateData_forHostIdentifier___block_invoke((uint64_t)v7, v7);
  }
}

void __67__MCProfileConnection_MDM__storeCertificateData_forHostIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    char v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Store certificate data error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  int v28 = __176__MCProfileConnection_MDM__stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion___block_invoke;
  id v29 = &unk_1E5A68118;
  id v30 = v16;
  id v22 = v16;
  uint64_t v23 = (void *)MEMORY[0x1A6232FE0](&v26);
  uint64_t v24 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v25 = [v24 remoteObjectProxyWithErrorHandler:v23];
  objc_msgSend(v25, "stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:declarationConfiguration:completion:", v21, v20, v19, v11, v18, v17, v22, v26, v27, v28, v29);
}

void __176__MCProfileConnection_MDM__stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC error staging enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__MCProfileConnection_MDM__unstageMDMEnrollmentInfoForPairingWatchWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1A6232FE0](v9);
  int v7 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 unstageMDMEnrollmentInfoForPairingWatchWithCompletion:v5];
}

void __82__MCProfileConnection_MDM__unstageMDMEnrollmentInfoForPairingWatchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC error unstaging enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1A6232FE0](v9);
  int v7 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:v5];
}

void __86__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC error fetching staged enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken_completion___block_invoke;
  v12[3] = &unk_1E5A68118;
  id v13 = v6;
  id v8 = v6;
  uint64_t v9 = (void *)MEMORY[0x1A6232FE0](v12);
  id v10 = [(MCProfileConnection *)self xpcConnection];
  BOOL v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:v7 completion:v8];
}

void __99__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC error fetching staged enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1A6232FE0](v9);
  int v7 = [(MCProfileConnection *)self xpcConnection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:v5];
}

void __97__MCProfileConnection_MDM__fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC error fetching staged declaration keys: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__MCProfileConnection_MDM__applyPairingWatchMDMEnrollmentData_completion___block_invoke;
  v12[3] = &unk_1E5A68118;
  id v13 = v6;
  id v8 = v6;
  uint64_t v9 = (void *)MEMORY[0x1A6232FE0](v12);
  id v10 = [(MCProfileConnection *)self xpcConnection];
  BOOL v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 applyPairingWatchMDMEnrollmentData:v7 completion:v8];
}

void __74__MCProfileConnection_MDM__applyPairingWatchMDMEnrollmentData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC error applying enrollment data: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v8 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_DEBUG, "updateMDMEnrollmentInfoForPairingWatch", buf, 2u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __78__MCProfileConnection_MDM__updateMDMEnrollmentInfoForPairingWatch_completion___block_invoke;
  v13[3] = &unk_1E5A68118;
  id v14 = v6;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x1A6232FE0](v13);
  BOOL v11 = [(MCProfileConnection *)self xpcConnection];
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v10];
  [v12 updateMDMEnrollmentInfoForPairingWatch:v7 completion:v9];
}

void __78__MCProfileConnection_MDM__updateMDMEnrollmentInfoForPairingWatch_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC error updating enrollment data for pairing watch: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_checkRemoteProcessHasMDMEntitlement
{
  id v2 = [(MCProfileConnection *)self xpcConnection];
  id v3 = [v2 valueForEntitlement:@"com.apple.managedconfiguration.profileconnection.mdm-access"];

  BOOL v4 = 0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue]) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

- (id)_lacksEntitlementError
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"XPC_ERROR_LACKS_ENTITLEMENT_CODE", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"com.apple.managedconfiguration.profileconnection.mdm-access");
  id v10 = [v8 MCErrorWithDomain:@"MCXPCErrorDomain" code:39000 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (id)knownAirPrintIPPURLStrings
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v2 = +[MCRestrictionManager sharedManager];
  uint64_t v3 = [v2 effectiveUnionValuesForSetting:@"knownAirPrintTargets"];

  return v3;
}

- (id)cloudConfigurationDetails
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v3 = [v2 details];

  return v3;
}

- (void)enrollProvisionallyWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v8 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__MCProfileConnection_CloudConfiguration__enrollProvisionallyWithNonce_completionBlock___block_invoke;
  v10[3] = &unk_1E5A68D80;
  id v11 = v6;
  id v9 = v6;
  [v8 provisionallyEnrollWithNonce:v7 completionBlock:v10];
}

void __88__MCProfileConnection_CloudConfiguration__enrollProvisionallyWithNonce_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v20 = a3;
  id v14 = a4;
  if (a2)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v20);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    id v17 = MCErrorArray(@"CLOUD_CONFIG_PROVISIONAL_ENROLLMENT_FAILED", v7, v8, v9, v10, v11, v12, v13, 0);
    id v18 = [v16 MCErrorWithDomain:@"MCCloudConfigErrorDomain" code:33007 descriptionArray:v17 underlyingError:v14 errorType:@"MCFatalError"];

    uint64_t v19 = *(void *)(a1 + 32);
    if (v19) {
      (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v18, 0);
    }
  }
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v5 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MCProfileConnection_CloudConfiguration__unenrollWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E5A68D80;
  id v8 = v4;
  id v6 = v4;
  [v5 unenrollWithCompletionBlock:v7];
}

void __71__MCProfileConnection_CloudConfiguration__unenrollWithCompletionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v20 = a3;
  id v14 = a4;
  if (a2)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, void))(v15 + 16))(v15, 0);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    id v17 = MCErrorArray(@"CLOUD_CONFIG_UNENROLLMENT_FAILED", v7, v8, v9, v10, v11, v12, v13, 0);
    id v18 = [v16 MCErrorWithDomain:@"MCCloudConfigErrorDomain" code:33008 descriptionArray:v17 underlyingError:v14 errorType:@"MCFatalError"];

    uint64_t v19 = *(void *)(a1 + 32);
    if (v19) {
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v18);
    }
  }
}

- (void)retrieveCloudConfigurationDetailsCompletionBlock:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v6 = (id)objc_opt_new();
  uint64_t v5 = [(MCProfileConnection *)self _cloudConfigurationRetrievalBlockWithCompletion:v4];

  [v6 fetchConfigurationWithCompletionBlock:v5];
}

- (void)retrieveCloudConfigurationWithoutValidationCompletionBlock:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v6 = (id)objc_opt_new();
  uint64_t v5 = [(MCProfileConnection *)self _cloudConfigurationRetrievalBlockWithCompletion:v4];

  [v6 fetchConfigurationWithoutValidationWithCompletionBlock:v5];
}

- (void)retrieveAndStoreCloudConfigurationDetailsCompletionBlock:(id)a3
{
  id v6 = (void (**)(id, void))a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v5 = [v4 details];

  if (v5)
  {
    if (v6) {
      v6[2](v6, 0);
    }
  }
  else
  {
    [(MCProfileConnection *)self forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock:v6];
  }
}

- (void)forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __105__MCProfileConnection_CloudConfiguration__forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock___block_invoke;
  v6[3] = &unk_1E5A68DA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MCProfileConnection *)self retrieveCloudConfigurationDetailsCompletionBlock:v6];
}

void __105__MCProfileConnection_CloudConfiguration__forceRetrieveAndStoreCloudConfigurationDetailsCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_4;
  }
  if (v5)
  {
    uint64_t v8 = (void *)[v5 mutableCopy];
    [v8 setObject:&unk_1EF4D0B80 forKeyedSubscript:*MEMORY[0x1E4F731B8]];
    [*(id *)(a1 + 32) storeCloudConfigurationDetails:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v7 = *(void (**)(void))(v9 + 16);
LABEL_4:
      v7();
    }
  }
LABEL_7:
}

- (id)_cloudConfigurationRetrievalBlockWithCompletion:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__MCProfileConnection_CloudConfiguration___cloudConfigurationRetrievalBlockWithCompletion___block_invoke;
  v7[3] = &unk_1E5A68D80;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1A6232FE0](v7);

  return v5;
}

void __91__MCProfileConnection_CloudConfiguration___cloudConfigurationRetrievalBlockWithCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v20 = a4;
  if (a2)
  {
    id v14 = (void *)[a3 mutableCopy];
    [v14 setObject:&unk_1EF4D0B80 forKeyedSubscript:*MEMORY[0x1E4F731B8]];
    uint64_t v15 = *(void *)(a1 + 32);
    if (!v15) {
      goto LABEL_7;
    }
    id v16 = *(void (**)(void))(v15 + 16);
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    id v18 = MCErrorArray(@"CLOUD_CONFIG_NOT_AVAILABLE", v7, v8, v9, v10, v11, v12, v13, 0);
    id v14 = [v17 MCErrorWithDomain:@"MCCloudConfigErrorDomain" code:33001 descriptionArray:v18 underlyingError:v20 errorType:@"MCFatalError"];

    uint64_t v19 = *(void *)(a1 + 32);
    if (!v19) {
      goto LABEL_7;
    }
    id v16 = *(void (**)(void))(v19 + 16);
  }
  v16();
LABEL_7:
}

- (id)getMachineInfo
{
  return [(MCProfileConnection *)self getMachineInfoWithAdditionalInfo:0];
}

- (id)getMachineInfoWithAdditionalInfo:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__15;
  id v14 = __Block_byref_object_dispose__15;
  id v15 = 0;
  id v5 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_49];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__MCProfileConnection_CloudConfiguration__getMachineInfoWithAdditionalInfo___block_invoke_13;
  v9[3] = &unk_1E5A68168;
  void v9[4] = &v10;
  [v6 cloudConfigurationMachineInfoDataWithAdditionalInfo:v4 completion:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __76__MCProfileConnection_CloudConfiguration__getMachineInfoWithAdditionalInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with profiled. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __76__MCProfileConnection_CloudConfiguration__getMachineInfoWithAdditionalInfo___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Cloud config machine info error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)getReducedMachineInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  id v2 = [(MCProfileConnection *)self xpcConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __64__MCProfileConnection_CloudConfiguration__getReducedMachineInfo__block_invoke_17;
  v6[3] = &unk_1E5A68168;
  v6[4] = &v7;
  [v3 reducedMachineInfoDataWithCompletion:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __64__MCProfileConnection_CloudConfiguration__getReducedMachineInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "User enrollment machine info error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __64__MCProfileConnection_CloudConfiguration__getReducedMachineInfo__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "User enrollment machine info error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 completionBlock:(id)a7
{
}

- (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 additionalMachineInfo:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v20 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke;
  block[3] = &unk_1E5A68E20;
  id v28 = v14;
  id v29 = self;
  id v30 = v18;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v19;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v18;
  id v26 = v14;
  dispatch_async(v20, block);
}

void __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28E88] requestWithURL:*(void *)(a1 + 32)];
  [v2 setHTTPMethod:@"POST"];
  [v2 setTimeoutInterval:90.0];
  [v2 setValue:@"application/pkcs7-signature" forHTTPHeaderField:@"Content-Type"];
  [v2 setValue:@"CloudConfiguration/1.0" forHTTPHeaderField:@"User-Agent"];
  id v3 = [*(id *)(a1 + 40) getMachineInfoWithAdditionalInfo:*(void *)(a1 + 48)];
  [v2 setHTTPBody:v3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F5E790]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_2;
  v7[3] = &unk_1E5A68DF8;
  id v8 = v4;
  id v9 = v2;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 80);
  id v5 = v2;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_3;
  v6[3] = &unk_1E5A68DD0;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v1 startWithRequest:v2 username:v3 password:v4 anchorCertificateRefs:v5 completionBlock:v6];
}

void __152__MCProfileConnection_CloudConfiguration__retrieveCloudConfigurationFromURL_username_password_anchorCertificates_additionalMachineInfo_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v24 = 0;
    id v16 = +[MCProfile profileWithData:v7 fileName:0 outError:&v24];
    id v17 = v24;
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)(a1 + 32);
    }
    else
    {
      id v25 = @"isCloudProfile";
      v26[0] = MEMORY[0x1E4F1CC38];
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      id v23 = 0;
      char v21 = [v16 mayInstallWithOptions:v20 hasInteractionClient:0 outError:&v23];
      id v18 = v23;

      uint64_t v19 = *(void *)(a1 + 32);
      if (v21)
      {
        if (v19)
        {
          id v22 = *(void (**)(void))(v19 + 16);
LABEL_15:
          v22();
        }
LABEL_16:

        id v10 = 0;
        goto LABEL_17;
      }
    }
    if (v19)
    {
      id v22 = *(void (**)(void))(v19 + 16);
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v10 = v9;
  id v11 = [v9 domain];
  if ([v11 isEqualToString:*MEMORY[0x1E4F5E728]])
  {
    uint64_t v12 = [v10 code];

    if (v12 != 23003) {
      goto LABEL_6;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    id v11 = [v10 userInfo];
    uint64_t v14 = [v13 errorWithDomain:@"MCCloudConfigErrorDomain" code:33000 userInfo:v11];

    id v10 = (void *)v14;
  }

LABEL_6:
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v10, 0);
  }
LABEL_17:
}

- (BOOL)wasCloudConfigurationApplied
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v3 = [v2 details];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F731B0]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)wasTeslaCloudConfigurationApplied
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v3 = [v2 details];

  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731B0]];
  if ([v4 BOOLValue])
  {
    char v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731B8]];
    BOOL v6 = [v5 intValue] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isAwaitingDeviceConfigured
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v3 = [v2 details];

  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731A0]];
  if ([v4 BOOLValue])
  {
    char v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731C0]];
    int v6 = [v5 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isAwaitingUserConfigured
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v2 = [MEMORY[0x1E4F73190] sharedClient];
  char v3 = [v2 isAwaitingUserConfigured];

  return v3;
}

- (void)updateCloudConfigurationWithRMAccountIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F73168];
  id v5 = a3;
  int v6 = [v4 sharedConfiguration];
  id v7 = [v6 details];
  id v8 = (id)[v7 mutableCopy];

  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F73240]];
  [(MCProfileConnection *)self storeCloudConfigurationDetails:v8 waitUntilCompleted:1 completion:0];
}

- (void)updateCloudConfigurationWithLastPushTokenHash:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F73168];
  id v5 = a3;
  int v6 = [v4 sharedConfiguration];
  id v7 = [v6 details];
  id v8 = (id)[v7 mutableCopy];

  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F731E0]];
  [(MCProfileConnection *)self storeCloudConfigurationDetails:v8 waitUntilCompleted:1 completion:0];
}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = [(MCProfileConnection *)self xpcConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_41];

  [v6 restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:v4];
}

void __105__MCProfileConnection_CloudConfiguration__restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    char v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Failed to restore set aside cloud config and MDM profile. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)cloudConfigurationUIDidCompleteWasApplied:(BOOL)a3
{
}

- (void)cloudConfigurationUIDidCompleteWasApplied:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v7 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v8 = [v7 details];
  id v10 = (id)[v8 mutableCopy];

  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F731A8]];
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F731B0]];

  [(MCProfileConnection *)self storeCloudConfigurationDetails:v10 waitUntilCompleted:1 completion:v6];
}

- (void)storeCloudConfigurationDetails:(id)a3
{
}

- (void)storeCloudConfigurationDetails:(id)a3 completion:(id)a4
{
}

- (void)storeCloudConfigurationDetails:(id)a3 waitUntilCompleted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __104__MCProfileConnection_CloudConfiguration__storeCloudConfigurationDetails_waitUntilCompleted_completion___block_invoke;
  v15[3] = &unk_1E5A68118;
  id v16 = v8;
  id v10 = v8;
  id v11 = (void *)MEMORY[0x1A6232FE0](v15);
  uint64_t v12 = [(MCProfileConnection *)self xpcConnection];
  id v13 = v12;
  if (v5) {
    [v12 synchronousRemoteObjectProxyWithErrorHandler:v11];
  }
  else {
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v11];
  }

  [v14 cloudConfigurationStoreDetails:v9 completion:v11];
}

void __104__MCProfileConnection_CloudConfiguration__storeCloudConfigurationDetails_waitUntilCompleted_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = (void *)qword_1EB2223B0;
    if (!os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    BOOL v5 = v4;
    id v6 = [v3 MCVerboseDescription];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Store cloud config details error. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F73168] sharedConfiguration];
    [v5 refreshDetailsFromDisk];
  }

LABEL_6:
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__MCProfileConnection_CloudConfiguration__removeSetAsideCloudConfigurationProfileWithCompletion___block_invoke;
  v9[3] = &unk_1E5A68118;
  id v10 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1A6232FE0](v9);
  uint64_t v7 = [(MCProfileConnection *)self xpcConnection];
  int v8 = [v7 remoteObjectProxyWithErrorHandler:v6];

  [v8 removeSetAsideCloudConfigurationProfileWithCompletion:v5];
}

void __97__MCProfileConnection_CloudConfiguration__removeSetAsideCloudConfigurationProfileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "XPC connection failed when removing set aside cloud config profile. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (BOOL)activationRecordIndicatesCloudConfigurationIsAvailable
{
  return [(MCProfileConnection *)self activationRecordIndicatesCloudConfigurationIsAvailableAndKeyExists:0];
}

- (BOOL)activationRecordIndicatesCloudConfigurationIsAvailableAndKeyExists:(BOOL *)a3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  [(MCProfileConnection *)self flush];
  id v5 = (void *)CFPreferencesCopyAppValue(@"LockdownActivationIndicatesCloudConfigurationAvailable", @"com.apple.managedconfiguration.notbackedup");
  id v6 = v5;
  if (!v5)
  {
    char v7 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v7 = [v5 BOOLValue];
  if (a3) {
LABEL_3:
  }
    *a3 = v6 != 0;
LABEL_4:

  return v7;
}

- (BOOL)shouldSkipSetupPanes
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  id v3 = [v2 details];

  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731B8]];
  if ([v4 intValue] == 1)
  {
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731B0]];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)shouldShowCloudConfigurationUI
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v3 = [MEMORY[0x1E4F73168] sharedConfiguration];
  id v4 = [v3 details];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    char v7 = [MEMORY[0x1E4F73168] sharedConfiguration];
    id v6 = [v7 setAsideDetails];
  }
  if ([(MCProfileConnection *)self activationRecordIndicatesCloudConfigurationIsAvailable]|| v6)
  {
    int v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F731A8]];
    int v9 = [v8 BOOLValue];

    uint64_t v10 = qword_1EB2223B0;
    if (!v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        id v13 = "Cloud configuration is available.";
        uint64_t v14 = v18;
        goto LABEL_15;
      }
LABEL_16:
      BOOL v15 = 1;
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_INFO, "User has completed cloud configuration. Not showing UI again.", buf, 2u);
    }
  }
  id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v12 = [v11 BOOLForKey:@"MCForceShowCloudConfigurationUI"];

  if (v12)
  {
    uint64_t v10 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      id v13 = "Force-displaying cloud configuration UI.";
      uint64_t v14 = (uint8_t *)&v17;
LABEL_15:
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)cloudConfigIndicatesMDMProfileNeedsToBeInstalled
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v3 = [MEMORY[0x1E4F73168] sharedConfiguration];
  id v4 = [v3 details];

  if (!v4) {
    goto LABEL_17;
  }
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F73238]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    char v7 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = 0;
      int v8 = "Cloud config indicates that MDM profile has been installed.";
      int v9 = (uint8_t *)&v22;
LABEL_16:
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F731D8]];
  int v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
    char v7 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = 0;
      int v8 = "Cloud config indicates that the device is not supervised.";
      int v9 = (uint8_t *)&v21;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  int v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F731D0]];
  if (([v12 BOOLValue] & 1) == 0)
  {

LABEL_14:
    char v7 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      int v8 = "Cloud config indicates that the MDM profile is not mandatory or is removable.";
      int v9 = buf;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F731C8]];
  char v14 = [v13 BOOLValue];

  if ((v14 & 1) == 0) {
    goto LABEL_14;
  }
  BOOL v15 = [(MCProfileConnection *)self unverifiedInstalledMDMProfileIdentifier];

  char v7 = qword_1EB2223B0;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = 0;
      int v8 = "Found installed MDM profile.";
      int v9 = (uint8_t *)&v19;
      goto LABEL_16;
    }
LABEL_17:
    BOOL v16 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEFAULT, "Cloud configuration is available and the MDM profile hasn't been installed.", v18, 2u);
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)shouldShowSetupAssistant
{
  DMPerformMigrationIfNeeded();
  if ([(MCProfileConnection *)self shouldShowCloudConfigurationUI]
    || [(MCProfileConnection *)self cloudConfigIndicatesMDMProfileNeedsToBeInstalled])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(MCProfileConnection *)self wasCloudConfigurationApplied];
    if (v3)
    {
      LOBYTE(v3) = [(MCProfileConnection *)self isAwaitingDeviceConfigured];
    }
  }
  return v3;
}

- (void)storedProfileDataWithCompletion:(id)a3
{
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke;
  v12[3] = &unk_1E5A68118;
  id v5 = v4;
  id v13 = v5;
  int v6 = (void *)MEMORY[0x1A6232FE0](v12);
  char v7 = [(MCProfileConnection *)self xpcConnection];
  int v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_2;
  v10[3] = &unk_1E5A68E70;
  id v11 = v5;
  id v9 = v5;
  [v8 storedProfileDataWithCompletion:v10];
}

void __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 MCVerboseDescription];
      *(_DWORD *)long long buf = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Profile data stored for purpose error. Error: %{public}@", buf, 0xCu);
    }
  }
  char v7 = *(void **)(a1 + 32);
  if (v7)
  {
    int v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_47;
    v9[3] = &unk_1E5A684D8;
    id v11 = v7;
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      *(_DWORD *)long long buf = 138543362;
      __int16 v17 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Profile data stored for purpose error. Error: %{public}@", buf, 0xCu);
    }
  }
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_48;
    block[3] = &unk_1E5A68E48;
    id v15 = v10;
    id v13 = v5;
    id v14 = v6;
    dispatch_async(v11, block);
  }
}

uint64_t __75__MCProfileConnection_CloudConfiguration__storedProfileDataWithCompletion___block_invoke_48(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)installProfileDataStoredForPurpose:(int)a3 completionBlock:(id)a4
{
}

- (void)installProfileDataStoredForPurpose:(int)a3 extraOptions:(id)a4 completionBlock:(id)a5
{
}

- (void)installStoredProfileDataWithCompletion:(id)a3
{
}

- (void)installStoredProfileDataWithExtraOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke;
  v10[3] = &unk_1E5A68EC0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MCProfileConnection *)self storedProfileDataWithCompletion:v10];
}

void __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v14 = v6;
  if (v5)
  {
    id v15 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke_2;
    block[3] = &unk_1E5A68E98;
    BOOL v16 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v21 = v16;
    id v22 = v5;
    id v23 = *(id *)(a1 + 48);
    dispatch_async(v15, block);
  }
  else
  {
    if (!v6)
    {
      __int16 v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = MCErrorArray(@"ERROR_PROFILE_NOT_FOUND", v7, v8, v9, v10, v11, v12, v13, 0);
      id v14 = [v17 MCErrorWithDomain:@"MCInstallationErrorDomain" code:4023 descriptionArray:v18 errorType:@"MCFatalError"];
    }
    uint64_t v19 = *(void *)(a1 + 48);
    if (v19) {
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v14);
    }
  }
}

void __95__MCProfileConnection_CloudConfiguration__installStoredProfileDataWithExtraOptions_completion___block_invoke_2(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) cloudConfigurationDetails];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F731C8]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = [*(id *)(a1 + 32) cloudConfigurationDetails];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F731B8]];
  BOOL v7 = [v6 intValue] == 1;

  v18[0] = @"isCloudLocked";
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  v19[0] = v8;
  v18[1] = @"isCloudProfile";
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
  v19[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (*(void *)(a1 + 40)) {
    objc_msgSend(v11, "addEntriesFromDictionary:");
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  id v17 = 0;
  id v14 = (id)[v12 installProfileData:v13 options:v11 outError:&v17];
  id v15 = v17;
  if (!v15) {
    [*(id *)(a1 + 32) markStoredProfileAsInstalled];
  }
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v15);
  }
}

- (void)storeProfileData:(id)a3 configurationSource:(int)a4 purpose:(int)a5 completionBlock:(id)a6
{
}

- (void)storeProfileData:(id)a3
{
}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v9 = [(MCProfileConnection *)self xpcConnection];
  uint64_t v8 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v6];
  [v8 storeProfileData:v7 completion:v6];
}

- (BOOL)shouldInstallStoredProfile
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = MCPostSetupAutoInstallProfilePath();
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F73168] sharedConfiguration];
    id v6 = [v5 details];

    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F731A8]];
    if ([v7 BOOLValue])
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F73238]];
      int v4 = [v8 BOOLValue] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)markStoredProfileAsInstalled
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v4 = [(MCProfileConnection *)self xpcConnection];
  id v3 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_56_2];
  [v3 markStoredProfileAsInstalledWithCompletion:&__block_literal_global_56_2];
}

void __71__MCProfileConnection_CloudConfiguration__markStoredProfileAsInstalled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Mark stored profile for purpose as installed error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)setupAssistantDidFinish
{
}

- (void)setupAssistantDidFinishWithCompletion:(id)a3
{
  id v4 = a3;
  DMPerformMigrationIfNeeded();
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_INFO, "Setup assistant has finished. Preventing further cloud configuration changes.", buf, 2u);
  }
  unsigned int v6 = ([MEMORY[0x1E4F73170] getManagementStateForMAID] >> 2) & 1;
  id v7 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v8 = [v7 details];
  uint64_t v9 = [v8 mutableCopy];

  uint64_t v10 = [MEMORY[0x1E4F73168] sharedConfiguration];
  uint64_t v11 = [v10 setAsideDetails];
  uint64_t v12 = [v11 mutableCopy];

  if (v9 || !v12)
  {
    if (v9 | v12) {
      goto LABEL_9;
    }
    id v13 = [MEMORY[0x1E4F73168] canonicalConfigurationWithSupervision:0];
  }
  else
  {
    id v13 = (id)v12;
  }
  uint64_t v9 = (uint64_t)v13;
LABEL_9:
  [(id)v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F731A8]];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke;
  v21[3] = &unk_1E5A68EE8;
  char v23 = v6;
  v21[4] = self;
  id v14 = v4;
  id v22 = v14;
  id v15 = (void *)MEMORY[0x1A6232FE0](v21);
  uint64_t v16 = v15;
  if (v14)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_63;
    void v19[3] = &unk_1E5A68F10;
    v19[4] = self;
    id v20 = v15;
    [(MCProfileConnection *)self storeCloudConfigurationDetails:v9 waitUntilCompleted:0 completion:v19];
  }
  else
  {
    [(MCProfileConnection *)self storeCloudConfigurationDetails:v9 waitUntilCompleted:1 completion:0];
    id v17 = [(MCProfileConnection *)self xpcConnection];
    uint64_t v18 = [v17 remoteObjectProxyWithErrorHandler:v16];
    [v18 setupAssistantDidFinishCompletion:v16];
  }
}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    MDMSendDevicePostureChangedNotification();
  }
  [*(id *)(a1 + 32) removeSetAsideCloudConfigurationProfileWithCompletion:&__block_literal_global_59_0];
  [*(id *)(a1 + 32) removePostSetupAutoInstallSetAsideProfileWithCompletion:&__block_literal_global_62];
  if (v3)
  {
    id v4 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Could not tell profiled that Setup Assistant has completed. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_ERROR, "Failed to remove set aside cloud config profile with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_ERROR, "Failed to remove auto install set aside profile with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __81__MCProfileConnection_CloudConfiguration__setupAssistantDidFinishWithCompletion___block_invoke_63(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
  [v2 setupAssistantDidFinishCompletion:*(void *)(a1 + 40)];
}

- (id)diagnosticsUploadURL
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  id v3 = [v2 diagnosticsUploadURL];

  return v3;
}

- (BOOL)isProvisionallyEnrolled
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 isProvisionallyEnrolled];

  return v3;
}

- (id)provisionalEnrollmentExpirationDate
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 provisionalEnrollmentExpirationDate];

  return v3;
}

- (int)userMode
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 userMode];

  return v3 != 0;
}

- (id)tvProviderUserToken
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 tvProviderUserToken];

  return v3;
}

- (id)deviceOrganizationName
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73220]];

  return v4;
}

- (id)deviceDepartmentName
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73218]];

  return v4;
}

- (id)deviceOrganizationAddress
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731E8]];

  return v4;
}

- (id)deviceOrganizationAddressLine1
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731F0]];

  return v4;
}

- (id)deviceOrganizationAddressLine2
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F731F8]];

  return v4;
}

- (id)deviceOrganizationAddressLine3
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73200]];

  return v4;
}

- (id)deviceOrganizationCity
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73208]];

  return v4;
}

- (id)deviceOrganizationRegion
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73228]];

  return v4;
}

- (id)deviceOrganizationZipCode
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73230]];

  return v4;
}

- (id)deviceOrganizationCountry
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  int v3 = [v2 details];

  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73210]];

  return v4;
}

- (id)deviceOrganizationVendorID
{
  return 0;
}

- (id)managingOrganizationInformation
{
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__15;
  uint64_t v12 = __Block_byref_object_dispose__15;
  id v13 = 0;
  int v3 = [(MCProfileConnection *)self publicXPCConnection];
  int v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_66_0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__MCProfileConnection_CloudConfiguration__managingOrganizationInformation__block_invoke_67;
  v7[3] = &unk_1E5A68F38;
  void v7[4] = &v8;
  [v4 managingOrganizationInformationWithCompletion:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __74__MCProfileConnection_CloudConfiguration__managingOrganizationInformation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    int v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v4 = v3;
      id v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch organization info. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __74__MCProfileConnection_CloudConfiguration__managingOrganizationInformation__block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch organization info. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (BOOL)applySingleAppModeConfiguration:(id)a3 clientType:(id)a4 clientUUID:(id)a5 localizedClientDescription:(id)a6 outError:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v21 = [v15 objectForKeyedSubscript:v20];
        objc_msgSend(v14, "MCSetBoolRestriction:value:", v20, objc_msgSend(v21, "BOOLValue"));
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  BOOL v22 = [(MCProfileConnection *)self applyRestrictionDictionary:v14 appsAndOptions:0 clientType:v11 clientUUID:v12 localizedClientDescription:v13 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:a7];
  return v22;
}

- (BOOL)isAirDropUnmanagedForced
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveRestrictedBoolForSetting:@"forceAirDropUnmanaged"];

  int v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v5 = @"NO";
    if (v3 == 1) {
      id v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "isAirDropUnmanagedForced: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 == 1;
}

- (BOOL)isURLManaged:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v5 = +[MCManagedDomainsCache sharedCache];
  int v6 = [v5 isURLManaged:v4];

  int v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = @"NO";
    if (v6) {
      uint64_t v8 = @"YES";
    }
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "isURLManaged(%@): %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (BOOL)mayShareToMessagesOriginatingAccountIsManaged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(MCProfileConnection *)self mayShareToMessagesForOriginatingAppBundleID:0 originatingAccountIsManaged:a3];
  id v5 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    int v6 = @"NO";
    if (v3) {
      int v7 = @"YES";
    }
    else {
      int v7 = @"NO";
    }
    if (v4) {
      int v6 = @"YES";
    }
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEBUG, "mayShareToMessagesOriginatingAccountIsManaged:%@ => %@", (uint8_t *)&v9, 0x16u);
  }
  return v4;
}

- (BOOL)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  if ([(MCProfileConnection *)self isOpenInRestrictionInEffect])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke;
    v17[3] = &unk_1E5A68FA0;
    v17[4] = &v19;
    BOOL v18 = v4;
    int v7 = (void *)MEMORY[0x1A6232FE0](v17);
    uint64_t v8 = [(MCProfileConnection *)self publicXPCConnection];
    int v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_6;
    v16[3] = &unk_1E5A68FC8;
    void v16[4] = &v19;
    [v9 mayShareToMessagesForOriginatingAppBundleID:v6 originatingAccountIsManaged:v4 completion:v16];
  }
  int v10 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    __int16 v11 = @"NO";
    int v12 = *((unsigned __int8 *)v20 + 24);
    if (v4) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    *(_DWORD *)long long buf = 138412802;
    if (v12) {
      __int16 v11 = @"YES";
    }
    id v24 = v6;
    __int16 v25 = 2112;
    long long v26 = v13;
    __int16 v27 = 2112;
    long long v28 = v11;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "mayShareToMessagesForOriginatingAppBundleID:%@ originatingAccountIsManaged:%@ => %@", buf, 0x20u);
  }
  BOOL v14 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "May share to Messages error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned char *)(a1 + 40) ^ 1;
}

void __110__MCProfileConnection_ManagedOpenIn__mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v7 = v6;
      uint64_t v8 = [v5 MCVerboseDescription];
      int v9 = 138543362;
      int v10 = v8;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "May share to Messages error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)mayShareToAirDropOriginatingAccountIsManaged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(MCProfileConnection *)self mayShareToAirDropForOriginatingAppBundleID:0 originatingAccountIsManaged:a3];
  id v5 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v6 = @"NO";
    if (v3) {
      int v7 = @"YES";
    }
    else {
      int v7 = @"NO";
    }
    if (v4) {
      id v6 = @"YES";
    }
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 2112;
    int v12 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEBUG, "mayShareToAirDropOriginatingAccountIsManaged:%@ => %@", (uint8_t *)&v9, 0x16u);
  }
  return v4;
}

- (BOOL)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  if ([(MCProfileConnection *)self isAirDropUnmanagedForced]
    && ![(MCProfileConnection *)self mayOpenFromManagedToUnmanaged])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke;
    v17[3] = &unk_1E5A68FA0;
    v17[4] = &v19;
    BOOL v18 = v4;
    int v7 = (void *)MEMORY[0x1A6232FE0](v17);
    uint64_t v8 = [(MCProfileConnection *)self publicXPCConnection];
    int v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_8;
    v16[3] = &unk_1E5A68FC8;
    void v16[4] = &v19;
    [v9 mayShareToAirDropForOriginatingAppBundleID:v6 originatingAccountIsManaged:v4 completion:v16];
  }
  int v10 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    __int16 v11 = @"NO";
    int v12 = *((unsigned __int8 *)v20 + 24);
    if (v4) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    *(_DWORD *)long long buf = 138412802;
    if (v12) {
      __int16 v11 = @"YES";
    }
    id v24 = v6;
    __int16 v25 = 2112;
    long long v26 = v13;
    __int16 v27 = 2112;
    long long v28 = v11;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "mayShareToAirDropForOriginatingAppBundleID:%@ originatingAccountIsManaged:%@ => %@", buf, 0x20u);
  }
  BOOL v14 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 MCVerboseDescription];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "May share to AirDrop error. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned char *)(a1 + 40) ^ 1;
}

void __109__MCProfileConnection_ManagedOpenIn__mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged___block_invoke_8(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      int v7 = v6;
      uint64_t v8 = [v5 MCVerboseDescription];
      int v9 = 138543362;
      int v10 = v8;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "May share to AirDrop error. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy__16;
  id v24 = __Block_byref_object_dispose__16;
  id v25 = 0;
  if ([(MCProfileConnection *)self isOpenInRestrictionInEffect])
  {
    int v10 = [(MCProfileConnection *)self publicXPCConnection];
    uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_51];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __148__MCProfileConnection_ManagedOpenIn__allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged___block_invoke_9;
    void v19[3] = &unk_1E5A68500;
    v19[4] = &v20;
    [v11 allowedOpenInAppBundleIDs:v8 originatingAppBundleID:v9 originatingIsManaged:v5 completion:v19];
  }
  else
  {
    int v12 = v21;
    id v13 = v8;
    int v10 = (void *)v12[5];
    void v12[5] = (uint64_t)v13;
  }

  BOOL v14 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v15 = @"NO";
    uint64_t v16 = v21[5];
    if (v5) {
      id v15 = @"YES";
    }
    *(_DWORD *)long long buf = 138413058;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_DEBUG, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:%@ originatingAppBundleID:%@ originatingAccountIsManaged:%@ => %@", buf, 0x2Au);
  }
  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __148__MCProfileConnection_ManagedOpenIn__allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      BOOL v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Allowed open in app bundleIDs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __148__MCProfileConnection_ManagedOpenIn__allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Allowed open in app bundleIDs error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingAccountIsManaged:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__16;
  uint64_t v22 = __Block_byref_object_dispose__16;
  id v23 = 0;
  uint64_t v10 = [(MCProfileConnection *)self publicXPCConnection];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_12_1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __145__MCProfileConnection_ManagedOpenIn__allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs_importingAppBundleID_importingAccountIsManaged___block_invoke_13;
  v17[3] = &unk_1E5A68500;
  v17[4] = &v18;
  [v11 allowedImportFromAppBundleIDs:v8 importingAppBundleID:v9 importingIsManaged:v5 completion:v17];

  int v12 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v13 = @"NO";
    uint64_t v14 = v19[5];
    if (v5) {
      id v13 = @"YES";
    }
    *(_DWORD *)long long buf = 138413058;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = v14;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEBUG, "allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:%@ importingAppBundleID:%@ importingAccountIsManaged:%@ => %@", buf, 0x2Au);
  }
  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

void __145__MCProfileConnection_ManagedOpenIn__allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs_importingAppBundleID_importingAccountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = v3;
      BOOL v5 = [v2 MCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Allowed import from app bundleIDs error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __145__MCProfileConnection_ManagedOpenIn__allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs_importingAppBundleID_importingAccountIsManaged___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = (void *)qword_1EB2223B0;
    if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v9 = [v6 MCVerboseDescription];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Allowed import from app bundleIDs error. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)allowedAppBundleIDsForBidirectionalDataMovementAfterApplyingFilterToBundleIDs:(id)a3 localAppBundleID:(id)a4 localAccountIsManaged:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v10 = [(MCProfileConnection *)self allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:v8 originatingAppBundleID:v9 originatingAccountIsManaged:v5];
  uint64_t v11 = [(MCProfileConnection *)self allowedImportFromAppBundleIDsAfterApplyingFilterToBundleIDs:v10 importingAppBundleID:v9 importingAccountIsManaged:v5];
  int v12 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v13 = @"NO";
    int v15 = 138413058;
    id v16 = v8;
    __int16 v17 = 2112;
    if (v5) {
      id v13 = @"YES";
    }
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEBUG, "allowedAppBundleIDsForBidirectionalDataMovementAfterApplyingFilterToBundleIDs:%@ originatingAppBundleID:%@ localAccountIsManaged:%@ => %@", (uint8_t *)&v15, 0x2Au);
  }

  return v11;
}

- (id)managedAppBundleIDs
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = [MEMORY[0x1E4F73178] attributesByAppID];
  id v3 = [v2 allKeys];

  BOOL v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "managedAppBundleIDs => %@", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

- (BOOL)isBidirectionalDataTransferAllowedWithBundleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if ([(MCProfileConnection *)self isOpenInRestrictionInEffect])
  {
    BOOL v5 = MCContainingBundleIDForBundleID(v4);
    if ((MCIsAppAccountBasedTargetForOpenIn(v5) & 1) != 0
      || (MCIsAppExemptFromImportFromTargetRestrictions(v5) & 1) != 0)
    {
      int v6 = 1;
    }
    else
    {
      BOOL v7 = [(MCProfileConnection *)self isAppManaged:v5];
      int v6 = v7 ^ [MEMORY[0x1E4F5E7B0] isCurrentPersonaEnterprise] ^ 1;
    }
  }
  else
  {
    int v6 = 1;
  }
  uint64_t v8 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v9 = @"NO";
    if (v6) {
      id v9 = @"YES";
    }
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_DEBUG, "isBidirectionalDataTransferAllowedWithBundleID:%@ => %@", (uint8_t *)&v11, 0x16u);
  }

  return v6;
}

- (int64_t)dragDropBidirectionalManagementStateForBaseBundleID:(id)a3
{
  id v4 = a3;
  if (MCIsAppAccountBasedForDragDrop(v4))
  {
    int64_t v5 = 2;
  }
  else if (MCIsAppExemptFromDragDropManagement(v4))
  {
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = [(MCProfileConnection *)self isAppManaged:v4];
  }

  return v5;
}

- (int64_t)dragDropSourceManagementStateForBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = MCContainingBundleIDForBundleID(v4);
  if ([v5 isEqualToString:@"com.apple.MobileSMS"]) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = [(MCProfileConnection *)self dragDropBidirectionalManagementStateForBaseBundleID:v5];
  }
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    int64_t v12 = v6;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "dragDropSourceManagementStateForBundleID:%@ => %li", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (int64_t)dragDropTargetManagementStateForBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = MCContainingBundleIDForBundleID(v4);
  if ([v5 isEqualToString:@"com.apple.MobileSMS"]) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = [(MCProfileConnection *)self dragDropBidirectionalManagementStateForBaseBundleID:v5];
  }
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2048;
    int64_t v12 = v6;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "dragDropTargetManagementStateForBundleID:%@ => %li", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (BOOL)isContactsReadAffectedByOpenInRestrictionsForTargetBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v5 = (MCIsAppExemptFromImportFromTargetRestrictionsForContacts(v4) & 1) == 0
    && [(MCProfileConnection *)self _shouldApplyContactsFilterForTargetBundleID:v4 targetAccountManagement:0 outAllowManagedAccounts:0 outAllowUnmanagedAccounts:0];
  int64_t v6 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = @"NO";
    if (v5) {
      BOOL v7 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    int64_t v12 = v7;
    _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_DEBUG, "isContactsReadAffectedByOpenInRestrictionsForTargetBundleID:%@ => %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)mayShowLocalContactsAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  __int16 v12 = 0;
  [(MCProfileConnection *)self _shouldApplyContactsFilterForBundleID:v6 sourceAccountManagement:v4 outAllowManagedAccounts:(char *)&v12 + 1 outAllowUnmanagedAccounts:&v12];
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = @"UNMANAGED";
    if (v4 == 2) {
      uint64_t v8 = @"MANAGED";
    }
    if (!v4) {
      uint64_t v8 = @"NONE";
    }
    *(_DWORD *)long long buf = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    if ((_BYTE)v12) {
      int v9 = @"YES";
    }
    else {
      int v9 = @"NO";
    }
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalContactsAccountsForBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x20u);
  }
  BOOL v10 = v12;

  return v10;
}

- (id)filteredOpenInContactsAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v10 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    *(void *)uint64_t v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)uint64_t v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(void *)&v33[6] = v8;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "Filtering contacts accounts for bundle ID: %{public}@, source account management: %d, contacts accounts: %{public}@", buf, 0x1Cu);
  }
  __int16 v30 = 0;
  BOOL v11 = [(MCProfileConnection *)self _shouldApplyContactsFilterForBundleID:v9 sourceAccountManagement:v5 outAllowManagedAccounts:(char *)&v30 + 1 outAllowUnmanagedAccounts:&v30];
  __int16 v12 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)uint64_t v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)uint64_t v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEBUG, "Apply contacts filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v20 = objc_msgSend(v19, "MCIsManaged", (void)v26);
          if (v20) {
            BOOL v21 = HIBYTE(v30) == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            char v22 = (_BYTE)v30 ? v20 : 1;
            if (v22) {
              continue;
            }
          }
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v13 = v8;
  }
  uint64_t v23 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v24 = @"UNMANAGED";
    if (v5 == 2) {
      id v24 = @"MANAGED";
    }
    *(_DWORD *)long long buf = 138413058;
    *(void *)uint64_t v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(void *)uint64_t v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!v5) {
      id v24 = @"NONE";
    }
    *(void *)&v33[10] = v24;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInContactsAccounts:%@ originatingAppBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (id)filteredOpenInOriginatingContactsAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v10 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    *(void *)uint64_t v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)uint64_t v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(void *)&v33[6] = v8;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "Filtering originating contacts accounts for target bundle ID: %{public}@, target account management: %d, accounts: %{public}@", buf, 0x1Cu);
  }
  __int16 v30 = 0;
  BOOL v11 = [(MCProfileConnection *)self _shouldApplyContactsFilterForTargetBundleID:v9 targetAccountManagement:v5 outAllowManagedAccounts:(char *)&v30 + 1 outAllowUnmanagedAccounts:&v30];
  __int16 v12 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)uint64_t v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)uint64_t v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEBUG, "Apply contacts filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v20 = objc_msgSend(v19, "MCIsManaged", (void)v26);
          if (v20) {
            BOOL v21 = HIBYTE(v30) == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            char v22 = (_BYTE)v30 ? v20 : 1;
            if (v22) {
              continue;
            }
          }
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v13 = v8;
  }
  uint64_t v23 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v24 = @"UNMANAGED";
    if (v5 == 2) {
      id v24 = @"MANAGED";
    }
    *(_DWORD *)long long buf = 138413058;
    *(void *)uint64_t v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(void *)uint64_t v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!v5) {
      id v24 = @"NONE";
    }
    *(void *)&v33[10] = v24;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInOriginatingContactsAccounts:%@ targetAppBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (BOOL)mayShowLocalContactsAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  __int16 v12 = 0;
  [(MCProfileConnection *)self _shouldApplyContactsFilterForTargetBundleID:v6 targetAccountManagement:v4 outAllowManagedAccounts:(char *)&v12 + 1 outAllowUnmanagedAccounts:&v12];
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v8 = @"UNMANAGED";
    if (v4 == 2) {
      id v8 = @"MANAGED";
    }
    if (!v4) {
      id v8 = @"NONE";
    }
    *(_DWORD *)long long buf = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    if ((_BYTE)v12) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalContactsAccountsForTargetBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x20u);
  }
  BOOL v10 = v12;

  return v10;
}

- (BOOL)mayShowLocalAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  __int16 v12 = 0;
  [(MCProfileConnection *)self shouldApplyFilterForBundleID:v6 sourceAccountManagement:v4 outAllowManagedAccounts:(char *)&v12 + 1 outAllowUnmanagedAccounts:&v12];
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v8 = @"UNMANAGED";
    if (v4 == 2) {
      id v8 = @"MANAGED";
    }
    if (!v4) {
      id v8 = @"NONE";
    }
    *(_DWORD *)long long buf = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    if ((_BYTE)v12) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalAccountsForBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x20u);
  }
  BOOL v10 = v12;

  return v10;
}

- (BOOL)mayShowLocalAccountsForTargetBundleID:(id)a3 targetAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  __int16 v12 = 0;
  [(MCProfileConnection *)self shouldApplyFilterForTargetBundleID:v6 targetAccountManagement:v4 outAllowManagedAccounts:(char *)&v12 + 1 outAllowUnmanagedAccounts:&v12];
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    id v8 = @"UNMANAGED";
    if (v4 == 2) {
      id v8 = @"MANAGED";
    }
    if (!v4) {
      id v8 = @"NONE";
    }
    *(_DWORD *)long long buf = 138412802;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    if ((_BYTE)v12) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "mayShowLocalAccountsForTargetBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x20u);
  }
  BOOL v10 = v12;

  return v10;
}

- (BOOL)canSendMail:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "Filtering mail sheet accounts for bundle ID: %{public}@, source account management: %d", buf, 0x12u);
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v24 = 0;
  id v8 = [(MCProfileConnection *)self publicXPCConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27_0];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MCProfileConnection_ManagedOpenIn__canSendMail_sourceAccountManagement___block_invoke_28;
  v16[3] = &unk_1E5A68FC8;
  void v16[4] = buf;
  [v9 hasMailAccountsWithFilteringEnabled:1 sourceAccountManagement:v4 completion:v16];
  BOOL v10 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    BOOL v11 = @"UNMANAGED";
    if (v4 == 2) {
      BOOL v11 = @"MANAGED";
    }
    if (!v4) {
      BOOL v11 = @"NONE";
    }
    int v12 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
    *(_DWORD *)__int16 v17 = 138412802;
    id v18 = v6;
    __int16 v19 = 2112;
    int v20 = v11;
    if (v12) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    __int16 v21 = 2112;
    char v22 = v13;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "canSendMail:%@ sourceAccountManagement:%@ => %@", v17, 0x20u);
  }
  BOOL v14 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v14;
}

void __74__MCProfileConnection_ManagedOpenIn__canSendMail_sourceAccountManagement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [a2 MCVerboseDescription];
    int v6 = 138543362;
    BOOL v7 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Could not filter accounts. Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

uint64_t __74__MCProfileConnection_ManagedOpenIn__canSendMail_sourceAccountManagement___block_invoke_28(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasAnyMailAccountIgnoringFiltering
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v3 = [(MCProfileConnection *)self publicXPCConnection];
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30_3];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__MCProfileConnection_ManagedOpenIn__hasAnyMailAccountIgnoringFiltering__block_invoke_31;
  v9[3] = &unk_1E5A68FC8;
  void v9[4] = &v10;
  [v4 hasMailAccountsWithFilteringEnabled:0 sourceAccountManagement:0 completion:v9];
  uint64_t v5 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    if (*((unsigned char *)v11 + 24)) {
      int v6 = @"YES";
    }
    else {
      int v6 = @"NO";
    }
    *(_DWORD *)long long buf = 138412290;
    __int16 v15 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEBUG, "canSendMailIgnoringAllFiltering => %@", buf, 0xCu);
  }
  BOOL v7 = *((unsigned char *)v11 + 24) != 0;

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __72__MCProfileConnection_ManagedOpenIn__hasAnyMailAccountIgnoringFiltering__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [a2 MCVerboseDescription];
    int v6 = 138543362;
    BOOL v7 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Could not filter accounts. Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

uint64_t __72__MCProfileConnection_ManagedOpenIn__hasAnyMailAccountIgnoringFiltering__block_invoke_31(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)filteredMailSheetAccountsForBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  BOOL v7 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543618;
    id v30 = v6;
    __int16 v31 = 1024;
    LODWORD(v32) = v4;
    _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEBUG, "Filtering mail sheet accounts for bundle ID: %{public}@, source account management: %d", buf, 0x12u);
  }
  id v8 = MCMailAccountClass();
  __int16 v28 = 0;
  BOOL v9 = [(MCProfileConnection *)self shouldApplyFilterForBundleID:v6 sourceAccountManagement:v4 outAllowManagedAccounts:(char *)&v28 + 1 outAllowUnmanagedAccounts:&v28];
  uint64_t v10 = [v8 activeAccounts];
  BOOL v11 = v10;
  if (v9)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v18, "sourceIsManaged", (void)v24)) {
            BOOL v19 = HIBYTE(v28) == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19 || ([v18 sourceIsManaged] & 1) == 0 && (_BYTE)v28) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v35 count:16];
      }
      while (v15);
    }
  }
  else
  {
    uint64_t v12 = v10;
  }
  int v20 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    __int16 v21 = @"UNMANAGED";
    if (v4 == 2) {
      __int16 v21 = @"MANAGED";
    }
    if (!v4) {
      __int16 v21 = @"NONE";
    }
    char v22 = @"YES";
    *(_DWORD *)long long buf = 138412802;
    id v30 = v6;
    uint64_t v32 = v21;
    __int16 v31 = 2112;
    if (!v12) {
      char v22 = @"NO";
    }
    __int16 v33 = 2112;
    __int16 v34 = v22;
    _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_DEBUG, "filteredMailSheetAccountsForBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x20u);
  }

  return v12;
}

- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (![(MCProfileConnection *)self isOpenInRestrictionInEffect]
    || (MCIsAppExemptFromOpenInSourceRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedSourceForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2)
      {
LABEL_3:
        int v11 = 0;
        LOBYTE(v12) = 1;
LABEL_4:
        BOOL v13 = 1;
        BOOL v14 = v11;
        goto LABEL_5;
      }
LABEL_34:
      BOOL v12 = [(MCProfileConnection *)self mayOpenFromManagedToUnmanaged];
      int v11 = !v12;
      goto LABEL_4;
    }
  }
  else
  {
    __int16 v21 = +[MCProfileConnection sharedConnection];
    int v22 = [v21 isAppManaged:v10];

    if (v22) {
      goto LABEL_34;
    }
  }
  BOOL v23 = [(MCProfileConnection *)self mayOpenFromUnmanagedToManaged];
  int v11 = 0;
  BOOL v13 = 0;
  LOBYTE(v12) = 1;
  BOOL v14 = 1;
  if (v23) {
    goto LABEL_4;
  }
LABEL_5:
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v12;
  }
  uint64_t v15 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = @"UNMANAGED";
    if (a4 == 2) {
      uint64_t v16 = @"MANAGED";
    }
    if (!a4) {
      uint64_t v16 = @"NONE";
    }
    __int16 v17 = @"NO";
    if (v14) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    if (a5)
    {
      if (*a5) {
        BOOL v19 = @"YES";
      }
      else {
        BOOL v19 = @"NO";
      }
      if (a6) {
        goto LABEL_22;
      }
    }
    else
    {
      BOOL v19 = @"NOT RETURNED";
      if (a6)
      {
LABEL_22:
        if (*a6) {
          __int16 v17 = @"YES";
        }
        goto LABEL_31;
      }
    }
    __int16 v17 = @"NOT RETURNED";
LABEL_31:
    int v24 = 138413314;
    id v25 = v10;
    __int16 v26 = 2112;
    long long v27 = v16;
    __int16 v28 = 2112;
    long long v29 = v18;
    __int16 v30 = 2112;
    __int16 v31 = v19;
    __int16 v32 = 2112;
    __int16 v33 = v17;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyFilterForBundleID:%@ sourceAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

- (BOOL)shouldApplyFilterForTargetBundleID:(id)a3 targetAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (![(MCProfileConnection *)self isOpenInRestrictionInEffect]
    || (MCIsAppExemptFromImportFromTargetRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedTargetForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2)
      {
LABEL_3:
        int v11 = 0;
        LOBYTE(v12) = 1;
LABEL_4:
        BOOL v13 = 1;
        BOOL v14 = v11;
        goto LABEL_5;
      }
LABEL_34:
      BOOL v12 = [(MCProfileConnection *)self mayOpenFromUnmanagedToManaged];
      int v11 = !v12;
      goto LABEL_4;
    }
  }
  else
  {
    __int16 v21 = +[MCProfileConnection sharedConnection];
    int v22 = [v21 isAppManaged:v10];

    if (v22) {
      goto LABEL_34;
    }
  }
  BOOL v23 = [(MCProfileConnection *)self mayOpenFromManagedToUnmanaged];
  int v11 = 0;
  BOOL v13 = 0;
  LOBYTE(v12) = 1;
  BOOL v14 = 1;
  if (v23) {
    goto LABEL_4;
  }
LABEL_5:
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v12;
  }
  uint64_t v15 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = @"UNMANAGED";
    if (a4 == 2) {
      uint64_t v16 = @"MANAGED";
    }
    if (!a4) {
      uint64_t v16 = @"NONE";
    }
    __int16 v17 = @"NO";
    if (v14) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    if (a5)
    {
      if (*a5) {
        BOOL v19 = @"YES";
      }
      else {
        BOOL v19 = @"NO";
      }
      if (a6) {
        goto LABEL_22;
      }
    }
    else
    {
      BOOL v19 = @"NOT RETURNED";
      if (a6)
      {
LABEL_22:
        if (*a6) {
          __int16 v17 = @"YES";
        }
        goto LABEL_31;
      }
    }
    __int16 v17 = @"NOT RETURNED";
LABEL_31:
    int v24 = 138413314;
    id v25 = v10;
    __int16 v26 = 2112;
    long long v27 = v16;
    __int16 v28 = 2112;
    long long v29 = v18;
    __int16 v30 = 2112;
    __int16 v31 = v19;
    __int16 v32 = 2112;
    __int16 v33 = v17;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyFilterForTargetBundleID:%@ targetAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

- (id)filteredOpenInAccounts:(id)a3 originatingAppBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v10 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    *(void *)__int16 v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)__int16 v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(void *)&v33[6] = v8;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "Filtering accounts for bundle ID: %{public}@, source account management: %d, accounts: %{public}@", buf, 0x1Cu);
  }
  __int16 v30 = 0;
  BOOL v11 = [(MCProfileConnection *)self shouldApplyFilterForBundleID:v9 sourceAccountManagement:v5 outAllowManagedAccounts:(char *)&v30 + 1 outAllowUnmanagedAccounts:&v30];
  BOOL v12 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)__int16 v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)__int16 v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEBUG, "Apply filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v20 = objc_msgSend(v19, "MCIsManaged", (void)v26);
          if (v20) {
            BOOL v21 = HIBYTE(v30) == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            char v22 = (_BYTE)v30 ? v20 : 1;
            if (v22) {
              continue;
            }
          }
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v13 = v8;
  }
  BOOL v23 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    int v24 = @"UNMANAGED";
    if (v5 == 2) {
      int v24 = @"MANAGED";
    }
    *(_DWORD *)long long buf = 138413058;
    *(void *)__int16 v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(void *)__int16 v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!v5) {
      int v24 = @"NONE";
    }
    *(void *)&v33[10] = v24;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInAccounts:%@ originatingAppBundleID:%@ sourceAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (id)filteredOpenInOriginatingAccounts:(id)a3 targetAppBundleID:(id)a4 targetAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  id v10 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543874;
    *(void *)__int16 v32 = v9;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)__int16 v33 = v5;
    *(_WORD *)&v33[4] = 2114;
    *(void *)&v33[6] = v8;
    _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_DEBUG, "Filtering originating accounts for target bundle ID: %{public}@, target account management: %d, accounts: %{public}@", buf, 0x1Cu);
  }
  __int16 v30 = 0;
  BOOL v11 = [(MCProfileConnection *)self shouldApplyFilterForTargetBundleID:v9 targetAccountManagement:v5 outAllowManagedAccounts:(char *)&v30 + 1 outAllowUnmanagedAccounts:&v30];
  BOOL v12 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)__int16 v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = HIBYTE(v30);
    *(_WORD *)__int16 v33 = 1024;
    *(_DWORD *)&v33[2] = v30;
    _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_DEBUG, "Apply filter: %d, allowManaged: %d, allowUnmanaged: %d", buf, 0x14u);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v20 = objc_msgSend(v19, "MCIsManaged", (void)v26);
          if (v20) {
            BOOL v21 = HIBYTE(v30) == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
            char v22 = (_BYTE)v30 ? v20 : 1;
            if (v22) {
              continue;
            }
          }
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v13 = v8;
  }
  BOOL v23 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    int v24 = @"UNMANAGED";
    if (v5 == 2) {
      int v24 = @"MANAGED";
    }
    *(_DWORD *)long long buf = 138413058;
    *(void *)__int16 v32 = v8;
    *(_WORD *)&v32[8] = 2112;
    *(void *)__int16 v33 = v9;
    *(_WORD *)&v33[8] = 2112;
    if (!v5) {
      int v24 = @"NONE";
    }
    *(void *)&v33[10] = v24;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_DEBUG, "filteredOpenInOriginatingAccounts:%@ targetAppBundleID:%@ targetAccountManagement:%@ => %@", buf, 0x2Au);
  }

  return v13;
}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(MCProfileConnection *)self checkInIfNeeded];
  if ([(MCProfileConnection *)self isOpenInRestrictionInEffect])
  {
    id v13 = [(MCProfileConnection *)self publicXPCConnection];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke;
    v26[3] = &unk_1E5A68118;
    id v14 = &v27;
    id v15 = v12;
    id v27 = v15;
    uint64_t v16 = [v13 remoteObjectProxyWithErrorHandler:v26];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_36;
    v21[3] = &unk_1E5A68FF0;
    id v22 = v10;
    id v23 = v11;
    BOOL v25 = v7;
    id v24 = v15;
    [v16 allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:v22 hostAppBundleID:v23 accountIsManaged:v7 completion:v21];

LABEL_5:
    goto LABEL_6;
  }
  if (v12)
  {
    uint64_t v17 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_38;
    block[3] = &unk_1E5A684D8;
    id v14 = &v20;
    id v20 = v12;
    id v19 = v10;
    dispatch_async(v17, block);

    uint64_t v16 = v19;
    goto LABEL_5;
  }
LABEL_6:
}

void __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = v4;
    id v6 = [v3 MCVerboseDescription];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Could not filter keyboards. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    int v9 = 138413058;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:%@ hostAppBundleID:%@ accountIsManaged:%@ => %@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

uint64_t __137__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged_completion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(MCProfileConnection *)self checkInIfNeeded];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__16;
  BOOL v25 = __Block_byref_object_dispose__16;
  id v26 = (id)MEMORY[0x1E4F1CBF0];
  if ([(MCProfileConnection *)self isOpenInRestrictionInEffect])
  {
    uint64_t v10 = [(MCProfileConnection *)self publicXPCConnection];
    __int16 v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_41_0];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __126__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged___block_invoke_42;
    v16[3] = &unk_1E5A69018;
    id v17 = v8;
    BOOL v20 = v5;
    id v18 = v9;
    id v19 = &v21;
    [v11 allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:v17 hostAppBundleID:v18 accountIsManaged:v5 completion:v16];
  }
  else
  {
    uint64_t v12 = v22;
    id v13 = v8;
    __int16 v11 = (void *)v12[5];
    void v12[5] = (uint64_t)v13;
  }

  id v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __126__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)qword_1EB2223B0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223B0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = v3;
    BOOL v5 = [a2 MCVerboseDescription];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_ERROR, "Could not filter keyboards synchronously. Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void __126__MCProfileConnection_ManagedOpenIn__allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_hostAppBundleID_accountIsManaged___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    int v10 = 138413058;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:%@ hostAppBundleID:%@ accountIsManaged:%@ => %@", (uint8_t *)&v10, 0x2Au);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

- (BOOL)isManagedPasteboardRequired
{
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  BOOL v3 = [v2 effectiveRestrictedBoolForSetting:@"requireManagedPasteboard"] == 1;

  return v3;
}

- (BOOL)isContinuityPasteboardWithManagedDataAllowed
{
  return 1;
}

- (BOOL)_unmanagedMayReadManagedContacts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveRestrictedBoolForSetting:@"allowUnmanagedToReadManagedContacts"];

  uint64_t v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = @"NO";
    if (v3 != 2) {
      uint64_t v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "unmanagedMayReadManagedContacts: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (BOOL)_managedMayWriteUnmanagedContacts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MCProfileConnection *)self checkInIfNeeded];
  id v2 = +[MCRestrictionManager sharedManager];
  int v3 = [v2 effectiveRestrictedBoolForSetting:@"allowManagedToWriteUnmanagedContacts"];

  uint64_t v4 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = @"NO";
    if (v3 != 2) {
      uint64_t v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "managedMayWriteUnmanagedContacts: %@", (uint8_t *)&v7, 0xCu);
  }
  return v3 != 2;
}

- (BOOL)_shouldApplyContactsFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (![(MCProfileConnection *)self isOpenInRestrictionInEffect]
    || (MCIsAppExemptFromOpenInSourceRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedSourceForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2) {
        goto LABEL_3;
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v21 = +[MCProfileConnection sharedConnection];
    int v22 = [v21 isAppManaged:v10];

    if (v22)
    {
LABEL_34:
      if (![(MCProfileConnection *)self mayOpenFromManagedToUnmanaged]
        && ![(MCProfileConnection *)self _managedMayWriteUnmanagedContacts])
      {
        BOOL v12 = 0;
        int v11 = 1;
        goto LABEL_4;
      }
LABEL_3:
      int v11 = 0;
      BOOL v12 = 1;
LABEL_4:
      BOOL v13 = 1;
      BOOL v14 = v11;
      goto LABEL_5;
    }
  }
  BOOL v23 = [(MCProfileConnection *)self mayOpenFromUnmanagedToManaged];
  int v11 = 0;
  BOOL v13 = 0;
  BOOL v12 = 1;
  BOOL v14 = 1;
  if (v23) {
    goto LABEL_4;
  }
LABEL_5:
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v12;
  }
  __int16 v15 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = @"UNMANAGED";
    if (a4 == 2) {
      __int16 v16 = @"MANAGED";
    }
    if (!a4) {
      __int16 v16 = @"NONE";
    }
    id v17 = @"NO";
    if (v14) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    if (a5)
    {
      if (*a5) {
        id v19 = @"YES";
      }
      else {
        id v19 = @"NO";
      }
      if (a6) {
        goto LABEL_22;
      }
    }
    else
    {
      id v19 = @"NOT RETURNED";
      if (a6)
      {
LABEL_22:
        if (*a6) {
          id v17 = @"YES";
        }
        goto LABEL_31;
      }
    }
    id v17 = @"NOT RETURNED";
LABEL_31:
    int v24 = 138413314;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 2112;
    long long v29 = v18;
    __int16 v30 = 2112;
    __int16 v31 = v19;
    __int16 v32 = 2112;
    __int16 v33 = v17;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyContactsFilterForBundleID:%@ sourceAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

- (BOOL)_shouldApplyContactsFilterForTargetBundleID:(id)a3 targetAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  [(MCProfileConnection *)self checkInIfNeeded];
  if (![(MCProfileConnection *)self isOpenInRestrictionInEffect]
    || (MCIsAppExemptFromImportFromTargetRestrictionsForContacts(v10) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (MCIsAppAccountBasedTargetForOpenIn(v10))
  {
    if (a4 != 1)
    {
      if (a4 != 2) {
        goto LABEL_3;
      }
LABEL_34:
      BOOL v12 = [(MCProfileConnection *)self mayOpenFromUnmanagedToManaged];
      int v11 = !v12;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v21 = +[MCProfileConnection sharedConnection];
    char v22 = [v21 isAppManaged:v10];

    if (v22) {
      goto LABEL_34;
    }
  }
  if ([(MCProfileConnection *)self mayOpenFromManagedToUnmanaged])
  {
LABEL_3:
    int v11 = 0;
    LOBYTE(v12) = 1;
LABEL_4:
    BOOL v13 = 1;
    BOOL v14 = v11;
    goto LABEL_5;
  }
  BOOL v23 = [(MCProfileConnection *)self _unmanagedMayReadManagedContacts];
  int v11 = 0;
  BOOL v13 = 0;
  LOBYTE(v12) = 1;
  BOOL v14 = 1;
  if (v23) {
    goto LABEL_4;
  }
LABEL_5:
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v12;
  }
  __int16 v15 = qword_1EB222390;
  if (os_log_type_enabled((os_log_t)qword_1EB222390, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = @"UNMANAGED";
    if (a4 == 2) {
      __int16 v16 = @"MANAGED";
    }
    if (!a4) {
      __int16 v16 = @"NONE";
    }
    id v17 = @"NO";
    if (v14) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    if (a5)
    {
      if (*a5) {
        id v19 = @"YES";
      }
      else {
        id v19 = @"NO";
      }
      if (a6) {
        goto LABEL_22;
      }
    }
    else
    {
      id v19 = @"NOT RETURNED";
      if (a6)
      {
LABEL_22:
        if (*a6) {
          id v17 = @"YES";
        }
        goto LABEL_31;
      }
    }
    id v17 = @"NOT RETURNED";
LABEL_31:
    int v24 = 138413314;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 2112;
    long long v29 = v18;
    __int16 v30 = 2112;
    __int16 v31 = v19;
    __int16 v32 = 2112;
    __int16 v33 = v17;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEBUG, "shouldApplyContactsFilterForTargetBundleID:%@ targetAccountManagement:%@ => %@, allowManagedAccounts:%@, allowUnamangedAccounts:%@", (uint8_t *)&v24, 0x34u);
  }

  return v14;
}

@end