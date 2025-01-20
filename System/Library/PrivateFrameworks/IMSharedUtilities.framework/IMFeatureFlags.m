@interface IMFeatureFlags
+ (IMFeatureFlags)sharedFeatureFlags;
+ (void)testWithFeature:(SEL)a3 block:(id)a4;
+ (void)testWithFeature:(SEL)a3 enabled:(BOOL)a4 block:(id)a5;
- (BOOL)CKScreenshotTestFeatureFlagValue;
- (BOOL)_isEntryViewInTranscriptEnabled;
- (BOOL)_isEntryViewInTranscriptEnabledForiPad;
- (BOOL)_isModernScreenSharingEnabled;
- (BOOL)_isSMSRefactorEnabled;
- (BOOL)_isSendMenuEnabled;
- (BOOL)_isSendMenuEnabledForiPad;
- (BOOL)_isServiceForSendingRefactorEnabled;
- (BOOL)arePreResolvedSiriMatchesEnabled;
- (BOOL)avatarViewAllowsStaleRendering;
- (BOOL)certifiedDeliveryEnabled;
- (BOOL)conversationPinningMultiDragEnabled;
- (BOOL)conversationPinningTouchdownDimEnabled;
- (BOOL)conversationPinningUsesLastNameForDuplicatesEnabled;
- (BOOL)fullTranscriptLoggingEnabled;
- (BOOL)generativeModelsAvailable;
- (BOOL)generativePlaygroundModelsAvailable;
- (BOOL)isAVLessSharePlayEnabled;
- (BOOL)isAllowMultiplePhoneNumbersSNaPEnabled;
- (BOOL)isAllowU18SnapAssetsEnabled;
- (BOOL)isAllowU18SnapWatchAssetsEnabled;
- (BOOL)isAlwaysShowStickerDropUIEnabled;
- (BOOL)isAppCardsEnabled;
- (BOOL)isAttachmentsPurgeabilityMonitoringEnabled;
- (BOOL)isAudioMessagesEntryViewRecordingEnabled;
- (BOOL)isBIAEnabled;
- (BOOL)isBackgroundAudioMessagesEnabled;
- (BOOL)isBackgroundMessagingAPIEnabled;
- (BOOL)isCKScreenshotTestFeatureFlagMember:(id)a3 withDomain:(id)a4;
- (BOOL)isCarrierPigeonEnabled;
- (BOOL)isCatchUpEnabled;
- (BOOL)isClingBackwardsCompatibilityEnabled;
- (BOOL)isClingEnabled;
- (BOOL)isConsolidatedChatItemsEnabled;
- (BOOL)isCriticalAlertingEnabled;
- (BOOL)isCroppingAvoidanceEnabled;
- (BOOL)isDashedBalloonsEnabled;
- (BOOL)isDiffableTranscriptDataSourceEnabled;
- (BOOL)isDynamicLQMDisabledByWRM;
- (BOOL)isEmojiTapbacksEnabled;
- (BOOL)isEntryViewInTranscriptEnabled;
- (BOOL)isEntryViewUsesKeyboardLayoutGuideEnabled;
- (BOOL)isExpressiveTextEnabled;
- (BOOL)isFeatureFlagEnabledWithName:(id)a3;
- (BOOL)isFluidTransitioningEnabled;
- (BOOL)isGFTOnWatchEnabled;
- (BOOL)isGenPlaygroundEnabled;
- (BOOL)isGenPlaygroundSparkleButtonEnabled;
- (BOOL)isHighQualityPhotosEnabled;
- (BOOL)isIMLLegacyRelayEnabled;
- (BOOL)isInboxSummaryEnabled;
- (BOOL)isInboxSummaryEnabled_iOS;
- (BOOL)isInboxSummaryEnabled_mac;
- (BOOL)isInlineTapbackMenuEnabled;
- (BOOL)isIntensiveSpotlightCPUEnabled;
- (BOOL)isIntensiveSpotlightDiskEnabled;
- (BOOL)isIntensiveSpotlightMemoryEnabled;
- (BOOL)isKeyTransparencyEnabled;
- (BOOL)isKeyTransparencyReportToAppleEnabled;
- (BOOL)isLQMImageQualityEstimatorEnabled;
- (BOOL)isLazuliEnabled;
- (BOOL)isMessagesAppDeletionEnabled;
- (BOOL)isMessagesInICloudNewUIEnabled;
- (BOOL)isMessagesInICloudNewUIEnabled_iOS;
- (BOOL)isMessagesInICloudNewUIEnabled_mac;
- (BOOL)isMessagesIniCloudOnboardingUIEnabled;
- (BOOL)isMessagesIniCloudVersion2;
- (BOOL)isModernDetailsViewEnabled;
- (BOOL)isModernMentionsAndEmojiAnimationsEnabled;
- (BOOL)isModernPersistenceXPCEnabled;
- (BOOL)isModernScreenSharingEnabled;
- (BOOL)isModernSettingsEnabled;
- (BOOL)isNameAndPhotoC3Enabled;
- (BOOL)isOOPKeyboardEnabled;
- (BOOL)isParakeetCompressionEnabled;
- (BOOL)isPinActionEnabled;
- (BOOL)isPinnedConversationOnWatchEnabled;
- (BOOL)isPriusCompatibilityEnabled;
- (BOOL)isPriusEnabled;
- (BOOL)isQuickRepliesEnabled;
- (BOOL)isReactWithAStickerEnabled;
- (BOOL)isReadMMSDefaultFromCBEnabled;
- (BOOL)isRelayGroupMutationEnabled;
- (BOOL)isReplicationEnabled;
- (BOOL)isRichLinkImprovementsEnabled;
- (BOOL)isRockNRollEnabled;
- (BOOL)isSMSFilterEnabledForUK;
- (BOOL)isSMSFilterEnabledForUS;
- (BOOL)isSMSFilterSyncEnabled;
- (BOOL)isSMSForwardingEnabled;
- (BOOL)isSMSRefactorEnabled;
- (BOOL)isSOSAlertingEnabled;
- (BOOL)isSWYAttachmentsEnabled;
- (BOOL)isScheduledMessagesCoreEnabled;
- (BOOL)isScheduledMessagesEnabled;
- (BOOL)isSearchImprovementsEnabled;
- (BOOL)isSearchTokensEnabled;
- (BOOL)isSearchTokensEnabled_iOS;
- (BOOL)isSearchTokensEnabled_mac;
- (BOOL)isSearchTokensForDatesEnabled;
- (BOOL)isSemanticSearchEnabled;
- (BOOL)isSendMenuEnabled;
- (BOOL)isServiceForSendingRefactorEnabled;
- (BOOL)isSessionAnimatedImageUnpackerEnabled;
- (BOOL)isSiriReactionReadingEnabled;
- (BOOL)isSpotlightClientStateEnabled;
- (BOOL)isSpotlightDaemonDelegateEnabled;
- (BOOL)isStaticTextEffectMenusEnabled;
- (BOOL)isStickerRepositioningEnabled;
- (BOOL)isStickerRepositioningEnabled_iOS;
- (BOOL)isStickerRepositioningEnabled_macOS;
- (BOOL)isStickersAppEnabled;
- (BOOL)isStickersAppEnabled_iOS;
- (BOOL)isStickersAppEnabled_mac;
- (BOOL)isSwipeToReplyEnabled;
- (BOOL)isSwipeToReplyOnWatchEnabled;
- (BOOL)isTapbackInferenceEnabled;
- (BOOL)isTextKit2Enabled;
- (BOOL)isTranscriptSharingEnabled;
- (BOOL)isUnitTestableFeatureEnabled;
- (BOOL)isUnitTestableFeatureForNewPlatformEnabled;
- (BOOL)isUnknownSenderBlastDoorEnabled;
- (BOOL)isWaldoEnabled;
- (BOOL)isWatchMultiReplyEnabled;
- (BOOL)isWatchNamePhotoEnabled;
- (BOOL)isWatchWorkoutRemoteViewPreviewEnabled;
- (BOOL)isWidgetKitComplicationsEnabled;
- (BOOL)isWolfFullScreenEffectsEnabled;
- (BOOL)isZelkovaEnabled;
- (BOOL)isZelkovaGroupEnabled;
- (BOOL)isZelkovaOnWatchEnabled;
- (BOOL)macApplicationMetricsGatheringEnabled;
- (BOOL)macToolbarEnabled;
- (BOOL)manuallyAckMessagesEnabled;
- (BOOL)messageSyncP2Enabled;
- (BOOL)micGroupPhotoEnabled;
- (BOOL)photoAnalysisInSpotlightEnabled;
- (BOOL)shouldShowServiceEncryptionIcon;
- (BOOL)showAllInstalledMessageApps;
- (BOOL)showTapToRadarMessagesApp;
- (BOOL)stewieEnabled;
- (BOOL)summarizationUserPreferenceEnabled;
- (BOOL)threeAttachmentStackEnabled;
- (id)CKScreenshotTestFeatureFlagMembers;
- (void)checkForUnitTestingWithFeatureName:(id)a3;
- (void)setSummarizationUserPreferenceEnabled:(BOOL)a3;
@end

@implementation IMFeatureFlags

- (BOOL)isCarrierPigeonEnabled
{
  if (!_os_feature_enabled_impl() || !_os_feature_enabled_impl()) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (BOOL)isSMSFilterSyncEnabled
{
  if (qword_1EB4A5F70 != -1) {
    dispatch_once(&qword_1EB4A5F70, &unk_1EF2BFE20);
  }
  return byte_1EB4A5F68;
}

- (BOOL)isPriusEnabled
{
  if (qword_1EB4A6158 != -1) {
    dispatch_once(&qword_1EB4A6158, &unk_1EF2C03A0);
  }
  return byte_1EB4A6150;
}

- (BOOL)isTranscriptSharingEnabled
{
  if (qword_1EB4A63F8 != -1) {
    dispatch_once(&qword_1EB4A63F8, &unk_1EF2BFFE0);
  }
  return byte_1EB4A63F0;
}

- (void)checkForUnitTestingWithFeatureName:(id)a3
{
  id v3 = a3;
  if (qword_1EB4A65C8 != -1)
  {
    id v5 = v3;
    dispatch_once(&qword_1EB4A65C8, &unk_1EF2C02A0);
    id v3 = v5;
  }
  if (byte_1E94FF8F0)
  {
    [NSString stringWithFormat:@"Called into IMFeatureFlags from a unit test without mocking the feature flag (%@) with [IMFeatureFlags testWithFeature:block:]. Ensure any test code that hits this path is enclosed in a test feature call.", v3];
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"IMFeatureFlagNotMockedInTest" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v4);
  }

  MEMORY[0x1F41817F8]();
}

- (BOOL)isExpressiveTextEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)stewieEnabled
{
  if (qword_1EB4A61C0 != -1) {
    dispatch_once(&qword_1EB4A61C0, &unk_1EF2BF3E0);
  }
  return byte_1EB4A6228;
}

+ (IMFeatureFlags)sharedFeatureFlags
{
  if (qword_1EB4A65D8 != -1) {
    dispatch_once(&qword_1EB4A65D8, &unk_1EF2BF9C0);
  }
  v2 = (void *)qword_1EB4A65E0;

  return (IMFeatureFlags *)v2;
}

- (BOOL)isLazuliEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)avatarViewAllowsStaleRendering
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)isStaticTextEffectMenusEnabled
{
  if (qword_1E94FE9E0 != -1) {
    dispatch_once(&qword_1E94FE9E0, &unk_1EF2C0A40);
  }
  return byte_1E94FF6A0;
}

- (BOOL)isZelkovaEnabled
{
  if (qword_1EB4A6070 != -1) {
    dispatch_once(&qword_1EB4A6070, &unk_1EF2C0840);
  }
  return byte_1EB4A5F30;
}

- (BOOL)isWaldoEnabled
{
  if (qword_1EB4A6068 != -1) {
    dispatch_once(&qword_1EB4A6068, &unk_1EF2C0500);
  }
  return byte_1EB4A6060;
}

- (BOOL)isStickersAppEnabled_iOS
{
  if (qword_1EB4A5F18 != -1) {
    dispatch_once(&qword_1EB4A5F18, &unk_1EF2C06A0);
  }
  return byte_1EB4A5F10;
}

- (BOOL)isStickersAppEnabled
{
  return MEMORY[0x1F4181798](self, sel_isStickersAppEnabled_iOS);
}

- (BOOL)isSendMenuEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0790EFC;
  block[3] = &unk_1E5A11D40;
  block[4] = self;
  if (qword_1EB4A5F08 != -1) {
    dispatch_once(&qword_1EB4A5F08, block);
  }
  return byte_1EB4A5F00;
}

- (BOOL)isInboxSummaryEnabled_iOS
{
  if (qword_1E94FF298 != -1) {
    dispatch_once(&qword_1E94FF298, &unk_1EF2BE2F8);
  }
  return byte_1E94FF290;
}

- (BOOL)isInboxSummaryEnabled
{
  return MEMORY[0x1F4181798](self, sel_isInboxSummaryEnabled_iOS);
}

- (BOOL)isGenPlaygroundEnabled
{
  int v2 = [(IMFeatureFlags *)self generativePlaygroundModelsAvailable];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)isModernPersistenceXPCEnabled
{
  if (qword_1EB4A6318 != -1) {
    dispatch_once(&qword_1EB4A6318, &unk_1EF2C1438);
  }
  return byte_1E94FF2F0;
}

- (BOOL)isScheduledMessagesEnabled
{
  if (qword_1E94FF2D8 != -1) {
    dispatch_once(&qword_1E94FF2D8, &unk_1EF2C11B8);
  }
  return byte_1E94FF2B0;
}

- (BOOL)generativePlaygroundModelsAvailable
{
  return +[IMGenerativeModelsAvailabilityProvider generativePlaygroundModelsAvailable];
}

- (BOOL)isTextKit2Enabled
{
  if (qword_1EB4A5F28 != -1) {
    dispatch_once(&qword_1EB4A5F28, &unk_1EF2C0300);
  }
  return byte_1EB4A5F20;
}

- (BOOL)isSemanticSearchEnabled
{
  if (qword_1E94FEAD8[0] != -1) {
    dispatch_once(qword_1E94FEAD8, &unk_1EF2C0260);
  }
  return byte_1E94FF9A8;
}

- (BOOL)isSearchTokensEnabled_iOS
{
  if (qword_1EB4A5DF0 != -1) {
    dispatch_once(&qword_1EB4A5DF0, &unk_1EF2C01C0);
  }
  return byte_1EB4A5DE8;
}

- (BOOL)isSearchTokensEnabled
{
  return MEMORY[0x1F4181798](self, sel_isSearchTokensEnabled_iOS);
}

- (BOOL)isMessagesIniCloudOnboardingUIEnabled
{
  if (qword_1E94FE7F0 != -1) {
    dispatch_once(&qword_1E94FE7F0, &unk_1EF2BFD60);
  }
  return byte_1E94FE7E8;
}

- (BOOL)isMessagesInICloudNewUIEnabled_iOS
{
  if (qword_1E94FE7D8 != -1) {
    dispatch_once(&qword_1E94FE7D8, &unk_1EF2C0BE0);
  }
  return byte_1E94FE7D0;
}

- (BOOL)isMessagesInICloudNewUIEnabled
{
  return MEMORY[0x1F4181798](self, sel_isMessagesInICloudNewUIEnabled_iOS);
}

- (BOOL)isDynamicLQMDisabledByWRM
{
  if (qword_1EB4A6550 != -1) {
    dispatch_once(&qword_1EB4A6550, &unk_1EF2BFEA0);
  }
  return byte_1EB4A6558;
}

- (BOOL)_isSendMenuEnabled
{
  if (qword_1E94FF0C8 != -1) {
    dispatch_once(&qword_1E94FF0C8, &unk_1EF2C07C0);
  }
  return byte_1E94FF0C0;
}

+ (void)testWithFeature:(SEL)a3 block:(id)a4
{
}

+ (void)testWithFeature:(SEL)a3 enabled:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  v8 = (void (**)(void))a5;
  v7 = [[IMFeatureFlagsTestSwizzler alloc] initWithFeature:a3 enabled:v5];
  [(IMFeatureFlagsTestSwizzler *)v7 swizzle];
  v8[2]();
  [(IMFeatureFlagsTestSwizzler *)v7 unswizzle];
}

- (BOOL)certifiedDeliveryEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)manuallyAckMessagesEnabled
{
  return IMGetCachedDomainBoolForKey();
}

- (BOOL)conversationPinningUsesLastNameForDuplicatesEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)conversationPinningMultiDragEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)conversationPinningTouchdownDimEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)showAllInstalledMessageApps
{
  int v2 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
    char v4 = [v3 isInternalInstall];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)showTapToRadarMessagesApp
{
  int v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v3 = [v2 isInternalInstall];

  if (!v3) {
    return 0;
  }

  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)macToolbarEnabled
{
  return 0;
}

- (BOOL)macApplicationMetricsGatheringEnabled
{
  return 0;
}

- (BOOL)messageSyncP2Enabled
{
  if (qword_1E94FEA28 != -1) {
    dispatch_once(&qword_1E94FEA28, &unk_1EF2BE4B8);
  }
  return byte_1E94FEA20;
}

- (BOOL)fullTranscriptLoggingEnabled
{
  if (qword_1E94FF258 != -1) {
    dispatch_once(&qword_1E94FF258, &unk_1EF2C0440);
  }
  return byte_1E94FF4F8;
}

- (BOOL)micGroupPhotoEnabled
{
  if (qword_1E94FF508 != -1) {
    dispatch_once(&qword_1E94FF508, &unk_1EF2BE518);
  }
  return byte_1E94FF500;
}

- (BOOL)photoAnalysisInSpotlightEnabled
{
  return 0;
}

- (BOOL)threeAttachmentStackEnabled
{
  if (qword_1EB4A5D88 != -1) {
    dispatch_once(&qword_1EB4A5D88, &unk_1EF2C0740);
  }
  if (!byte_1E94FF510) {
    return 0;
  }
  int v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v3 = [v2 isInternalInstall];

  return v3;
}

- (BOOL)CKScreenshotTestFeatureFlagValue
{
  return IMGetCachedDomainBoolForKey();
}

- (id)CKScreenshotTestFeatureFlagMembers
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)isCKScreenshotTestFeatureFlagMember:(id)a3 withDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(IMFeatureFlags *)self CKScreenshotTestFeatureFlagMembers];
  v9 = [v8 objectForKey:v6];

  LOBYTE(v6) = [v9 containsObject:v7];
  return (char)v6;
}

- (BOOL)isParakeetCompressionEnabled
{
  if (qword_1E94FF668 != -1) {
    dispatch_once(&qword_1E94FF668, &unk_1EF2BF6C0);
  }
  return byte_1E94FF660;
}

- (BOOL)isWatchMultiReplyEnabled
{
  if (qword_1E94FF678 != -1) {
    dispatch_once(&qword_1E94FF678, &unk_1EF2BFF80);
  }
  return byte_1E94FF670;
}

- (BOOL)isZelkovaOnWatchEnabled
{
  if (qword_1E94FF688 != -1) {
    dispatch_once(&qword_1E94FF688, &unk_1EF2BE3F8);
  }
  return byte_1E94FF680;
}

- (BOOL)isEmojiTapbacksEnabled
{
  if (qword_1E94FF278 != -1) {
    dispatch_once(&qword_1E94FF278, &unk_1EF2C0460);
  }
  return byte_1E94FF2A8;
}

- (BOOL)_isModernScreenSharingEnabled
{
  if (qword_1E94FE7A8 != -1) {
    dispatch_once(&qword_1E94FE7A8, &unk_1EF2C0800);
  }
  return byte_1E94FE7A0;
}

- (BOOL)isModernScreenSharingEnabled
{
  return MEMORY[0x1F4181798](self, sel__isModernScreenSharingEnabled);
}

- (BOOL)isSwipeToReplyOnWatchEnabled
{
  if (qword_1E94FF698 != -1) {
    dispatch_once(&qword_1E94FF698, &unk_1EF2C09A0);
  }
  return byte_1E94FF690;
}

- (BOOL)isModernMentionsAndEmojiAnimationsEnabled
{
  int v2 = [(IMFeatureFlags *)self isExpressiveTextEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)_isSMSRefactorEnabled
{
  if (qword_1E94FE930 != -1) {
    dispatch_once(&qword_1E94FE930, &unk_1EF2C1158);
  }
  return byte_1E94FE928;
}

- (BOOL)isSMSRefactorEnabled
{
  if ([(IMFeatureFlags *)self _isSMSRefactorEnabled]
    || [(IMFeatureFlags *)self isLazuliEnabled])
  {
    return 1;
  }

  return [(IMFeatureFlags *)self isCarrierPigeonEnabled];
}

- (BOOL)isConsolidatedChatItemsEnabled
{
  if (qword_1E94FE7C0 != -1) {
    dispatch_once(&qword_1E94FE7C0, &unk_1EF2C1178);
  }
  return byte_1E94FE9D8;
}

- (BOOL)isGenPlaygroundSparkleButtonEnabled
{
  if (qword_1E94FF6B0 != -1) {
    dispatch_once(&qword_1E94FF6B0, &unk_1EF2C1198);
  }
  return byte_1E94FF6A8;
}

- (BOOL)isDashedBalloonsEnabled
{
  if (qword_1E94FF118 != -1) {
    dispatch_once(&qword_1E94FF118, &unk_1EF2BE158);
  }
  return byte_1E94FF110;
}

- (BOOL)isScheduledMessagesCoreEnabled
{
  if (qword_1E94FF2D0 != -1) {
    dispatch_once(&qword_1E94FF2D0, &unk_1EF2BE1D8);
  }
  return byte_1E94FF2E0;
}

- (BOOL)isRichLinkImprovementsEnabled
{
  if (qword_1E94FF0A0 != -1) {
    dispatch_once(&qword_1E94FF0A0, &unk_1EF2C11D8);
  }
  return byte_1E94FF120;
}

- (BOOL)isInboxSummaryEnabled_mac
{
  if (qword_1E94FF6C0 != -1) {
    dispatch_once(&qword_1E94FF6C0, &unk_1EF2C11F8);
  }
  return byte_1E94FF6B8;
}

- (BOOL)generativeModelsAvailable
{
  return MEMORY[0x1F4181798](IMGenerativeModelsAvailabilityProvider, sel_summarizationModelsAvailable);
}

- (BOOL)summarizationUserPreferenceEnabled
{
  return MEMORY[0x1F4181798](IMGenerativeModelsAvailabilityProvider, sel_summarizationUserPreferenceEnabled);
}

- (void)setSummarizationUserPreferenceEnabled:(BOOL)a3
{
}

- (BOOL)_isServiceForSendingRefactorEnabled
{
  if (qword_1E94FF270 != -1) {
    dispatch_once(&qword_1E94FF270, &unk_1EF2C1218);
  }
  return byte_1E94FF0D0;
}

- (BOOL)isServiceForSendingRefactorEnabled
{
  if ([(IMFeatureFlags *)self isLazuliEnabled]
    || [(IMFeatureFlags *)self isCarrierPigeonEnabled])
  {
    return 1;
  }

  return MEMORY[0x1F4181798](self, sel__isServiceForSendingRefactorEnabled);
}

- (BOOL)isWatchWorkoutRemoteViewPreviewEnabled
{
  if (qword_1E94FF6D0 != -1) {
    dispatch_once(&qword_1E94FF6D0, &unk_1EF2C1238);
  }
  return byte_1E94FF6C8;
}

- (BOOL)isSiriReactionReadingEnabled
{
  if (qword_1E94FF6E0 != -1) {
    dispatch_once(&qword_1E94FF6E0, &unk_1EF2BFF20);
  }
  return byte_1E94FF6D8;
}

- (BOOL)isHighQualityPhotosEnabled
{
  if (qword_1E94FF080 != -1) {
    dispatch_once(&qword_1E94FF080, &unk_1EF2C1258);
  }
  return byte_1E94FF0A8;
}

- (BOOL)isFluidTransitioningEnabled
{
  if (qword_1E94FE7C8 != -1) {
    dispatch_once(&qword_1E94FE7C8, &unk_1EF2BD7B8);
  }
  return byte_1E94FF6E8;
}

- (BOOL)isSpotlightDaemonDelegateEnabled
{
  if (qword_1E94FEA18 != -1) {
    dispatch_once(&qword_1E94FEA18, &unk_1EF2C1278);
  }
  return byte_1E94FEA10;
}

- (BOOL)isSessionAnimatedImageUnpackerEnabled
{
  if (qword_1E94FF6F8 != -1) {
    dispatch_once(&qword_1E94FF6F8, &unk_1EF2C1298);
  }
  return byte_1E94FF6F0;
}

- (BOOL)isSpotlightClientStateEnabled
{
  if (qword_1E94FE960 != -1) {
    dispatch_once(&qword_1E94FE960, &unk_1EF2C12B8);
  }
  return byte_1E94FE9A8;
}

- (BOOL)isModernSettingsEnabled
{
  if (qword_1E94FF708 != -1) {
    dispatch_once(&qword_1E94FF708, &unk_1EF2C12D8);
  }
  return byte_1E94FF700;
}

- (BOOL)isIntensiveSpotlightCPUEnabled
{
  if (qword_1E94FEFF0 != -1) {
    dispatch_once(&qword_1E94FEFF0, &unk_1EF2C12F8);
  }
  return byte_1E94FEFE8;
}

- (BOOL)isIntensiveSpotlightDiskEnabled
{
  if (qword_1E94FEFF8 != -1) {
    dispatch_once(&qword_1E94FEFF8, &unk_1EF2BE398);
  }
  return byte_1E94FF710;
}

- (BOOL)isIntensiveSpotlightMemoryEnabled
{
  if (qword_1E94FF000 != -1) {
    dispatch_once(&qword_1E94FF000, &unk_1EF2C0160);
  }
  return byte_1E94FF718;
}

- (BOOL)isMessagesAppDeletionEnabled
{
  if (qword_1E94FF010 != -1) {
    dispatch_once(&qword_1E94FF010, &unk_1EF2BD818);
  }
  return byte_1E94FF008;
}

- (BOOL)isBackgroundAudioMessagesEnabled
{
  if (qword_1E94FEAD0 != -1) {
    dispatch_once(&qword_1E94FEAD0, &unk_1EF2BD838);
  }
  return byte_1E94FEAC8;
}

- (BOOL)isRelayGroupMutationEnabled
{
  if (qword_1E94FF738 != -1) {
    dispatch_once(&qword_1E94FF738, &unk_1EF2BF7C0);
  }
  return byte_1E94FF730;
}

- (BOOL)_isEntryViewInTranscriptEnabled
{
  if (qword_1E94FF0B8 != -1) {
    dispatch_once(&qword_1E94FF0B8, &unk_1EF2BFEE0);
  }
  return byte_1E94FF0B0;
}

- (BOOL)_isEntryViewInTranscriptEnabledForiPad
{
  if (qword_1EB4A5FA8 != -1) {
    dispatch_once(&qword_1EB4A5FA8, &unk_1EF2C02E0);
  }
  return byte_1EB4A5FA0;
}

- (BOOL)isEntryViewInTranscriptEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0846140;
  block[3] = &unk_1E5A11D40;
  block[4] = self;
  if (qword_1EB4A5EE8 != -1) {
    dispatch_once(&qword_1EB4A5EE8, block);
  }
  return byte_1EB4A5EE0;
}

- (BOOL)isEntryViewUsesKeyboardLayoutGuideEnabled
{
  if (qword_1EB4A5EF8 != -1) {
    dispatch_once(&qword_1EB4A5EF8, &unk_1EF2C04E0);
  }
  return byte_1EB4A5EF0;
}

- (BOOL)_isSendMenuEnabledForiPad
{
  if (qword_1EB4A5FB8 != -1) {
    dispatch_once(&qword_1EB4A5FB8, &unk_1EF2C0980);
  }
  return byte_1EB4A5FB0;
}

- (BOOL)isUnitTestableFeatureEnabled
{
  if (qword_1E94FF900 != -1) {
    dispatch_once(&qword_1E94FF900, &unk_1EF2C0A00);
  }
  return byte_1E94FF8F8;
}

- (BOOL)isUnitTestableFeatureForNewPlatformEnabled
{
  if (qword_1E94FF910 != -1) {
    dispatch_once(&qword_1E94FF910, &unk_1EF2C0B20);
  }
  return byte_1E94FF908;
}

- (BOOL)isKeyTransparencyEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isKeyTransparencyReportToAppleEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isMessagesIniCloudVersion2
{
  if (qword_1EB4A5F88 != -1) {
    dispatch_once(&qword_1EB4A5F88, &unk_1EF2C0B80);
  }
  return byte_1EB4A5F80;
}

- (BOOL)isMessagesInICloudNewUIEnabled_mac
{
  if (qword_1E94FE7E0 != -1) {
    dispatch_once(&qword_1E94FE7E0, &unk_1EF2BFCC0);
  }
  return byte_1E94FF918;
}

- (BOOL)isSMSForwardingEnabled
{
  if (qword_1EB4A5E38 != -1) {
    dispatch_once(&qword_1EB4A5E38, &unk_1EF2BFD80);
  }
  return byte_1EB4A5E30;
}

- (BOOL)isSMSFilterEnabledForUS
{
  if (qword_1E94FE7F8[0] != -1) {
    dispatch_once(qword_1E94FE7F8, &unk_1EF2BFDC0);
  }
  return byte_1E94FF920;
}

- (BOOL)isSMSFilterEnabledForUK
{
  if (qword_1E94FF930 != -1) {
    dispatch_once(&qword_1E94FF930, &unk_1EF2BFE00);
  }
  return byte_1E94FF928;
}

- (BOOL)isLQMImageQualityEstimatorEnabled
{
  if (qword_1EB4A5DA8 != -1) {
    dispatch_once(&qword_1EB4A5DA8, &unk_1EF2BFE80);
  }
  return byte_1EB4A5DB0;
}

- (BOOL)isAttachmentsPurgeabilityMonitoringEnabled
{
  if (qword_1E94FE938 != -1) {
    dispatch_once(&qword_1E94FE938, &unk_1EF2BFF00);
  }
  return byte_1E94FF938;
}

- (BOOL)isAVLessSharePlayEnabled
{
  if (qword_1E94FF948 != -1) {
    dispatch_once(&qword_1E94FF948, &unk_1EF2C0020);
  }
  return byte_1E94FF940;
}

- (BOOL)isSWYAttachmentsEnabled
{
  if (qword_1EB4A6058 != -1) {
    dispatch_once(&qword_1EB4A6058, &unk_1EF2C0040);
  }
  return byte_1E94FF050;
}

- (BOOL)isNameAndPhotoC3Enabled
{
  if (qword_1EB4A5F60 != -1) {
    dispatch_once(&qword_1EB4A5F60, &unk_1EF2C0060);
  }
  return byte_1EB4A5F58;
}

- (BOOL)isWatchNamePhotoEnabled
{
  if (qword_1E94FF958 != -1) {
    dispatch_once(&qword_1E94FF958, &unk_1EF2C00C0);
  }
  return byte_1E94FF950;
}

- (BOOL)isAllowU18SnapAssetsEnabled
{
  if (qword_1E94FF968 != -1) {
    dispatch_once(&qword_1E94FF968, &unk_1EF2C00E0);
  }
  return byte_1E94FF960;
}

- (BOOL)isAllowU18SnapWatchAssetsEnabled
{
  if (qword_1E94FF978 != -1) {
    dispatch_once(&qword_1E94FF978, &unk_1EF2C0100);
  }
  return byte_1E94FF970;
}

- (BOOL)arePreResolvedSiriMatchesEnabled
{
  if (qword_1E94FF988 != -1) {
    dispatch_once(&qword_1E94FF988, &unk_1EF2BD7D8);
  }
  return byte_1E94FF980;
}

- (BOOL)isCroppingAvoidanceEnabled
{
  if (qword_1EB4A5F50 != -1) {
    dispatch_once(&qword_1EB4A5F50, &unk_1EF2C13B8);
  }
  return byte_1EB4A5F48;
}

- (BOOL)isSearchImprovementsEnabled
{
  if (qword_1EB4A5DE0 != -1) {
    dispatch_once(&qword_1EB4A5DE0, &unk_1EF2C01A0);
  }
  return byte_1EB4A5DD8;
}

- (BOOL)isSearchTokensEnabled_mac
{
  if (qword_1E94FF998 != -1) {
    dispatch_once(&qword_1E94FF998, &unk_1EF2C01E0);
  }
  return byte_1E94FF990;
}

- (BOOL)isSearchTokensForDatesEnabled
{
  if (qword_1E94FE778 != -1) {
    dispatch_once(&qword_1E94FE778, &unk_1EF2C0240);
  }
  return byte_1E94FF9A0;
}

- (BOOL)isAudioMessagesEntryViewRecordingEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0847054;
  block[3] = &unk_1E5A11D40;
  block[4] = self;
  if (qword_1EB4A5ED8 != -1) {
    dispatch_once(&qword_1EB4A5ED8, block);
  }
  return byte_1EB4A5ED0;
}

- (BOOL)isAppCardsEnabled
{
  if (qword_1EB4A5EC8 != -1) {
    dispatch_once(&qword_1EB4A5EC8, &unk_1EF2C0340);
  }
  return byte_1EB4A5EC0;
}

- (BOOL)isSOSAlertingEnabled
{
  if (qword_1EB4A5E98 != -1) {
    dispatch_once(&qword_1EB4A5E98, &unk_1EF2C0360);
  }
  return byte_1EB4A5E90;
}

- (BOOL)isCriticalAlertingEnabled
{
  if ([(IMFeatureFlags *)self isSOSAlertingEnabled]) {
    return 1;
  }

  return MEMORY[0x1F4181798](self, sel_isZelkovaEnabled);
}

- (BOOL)isReplicationEnabled
{
  if ([(IMFeatureFlags *)self isPriusEnabled]) {
    return 1;
  }

  return [(IMFeatureFlags *)self isSOSAlertingEnabled];
}

- (BOOL)isPriusCompatibilityEnabled
{
  if (qword_1E94FE788 != -1) {
    dispatch_once(&qword_1E94FE788, &unk_1EF2C03E0);
  }
  return byte_1E94FE940;
}

- (BOOL)isSwipeToReplyEnabled
{
  if (qword_1EB4A5E00 != -1) {
    dispatch_once(&qword_1EB4A5E00, &unk_1EF2C0400);
  }
  return byte_1EB4A5DF8;
}

- (BOOL)isCatchUpEnabled
{
  if (qword_1EB4A6040 != -1) {
    dispatch_once(&qword_1EB4A6040, &unk_1EF2C0420);
  }
  return byte_1E94FF288;
}

- (BOOL)isGFTOnWatchEnabled
{
  if (qword_1E94FF9B8 != -1) {
    dispatch_once(&qword_1E94FF9B8, &unk_1EF2C04A0);
  }
  return byte_1E94FF9B0;
}

- (BOOL)isDiffableTranscriptDataSourceEnabled
{
  if (qword_1EB4A5DD0 != -1) {
    dispatch_once(&qword_1EB4A5DD0, &unk_1EF2C13D8);
  }
  return byte_1E94FF028;
}

- (BOOL)isReadMMSDefaultFromCBEnabled
{
  if (qword_1EB4A62A8 != -1) {
    dispatch_once(&qword_1EB4A62A8, &unk_1EF2C13F8);
  }
  return byte_1EB4A62A0;
}

- (BOOL)isBIAEnabled
{
  if (qword_1EB4A6088 != -1) {
    dispatch_once(&qword_1EB4A6088, &unk_1EF2C05C0);
  }
  return byte_1E94FE790;
}

- (BOOL)isIMLLegacyRelayEnabled
{
  if (qword_1E94FE990 != -1) {
    dispatch_once(&qword_1E94FE990, &unk_1EF2C05E0);
  }
  return byte_1E94FF9C0;
}

- (BOOL)isBackgroundMessagingAPIEnabled
{
  if (qword_1E94FF9D0 != -1) {
    dispatch_once(&qword_1E94FF9D0, &unk_1EF2C0600);
  }
  return byte_1E94FF9C8;
}

- (BOOL)isClingEnabled
{
  if (qword_1EB4A6050 != -1) {
    dispatch_once(&qword_1EB4A6050, &unk_1EF2C0620);
  }
  return byte_1EB4A6048;
}

- (BOOL)isClingBackwardsCompatibilityEnabled
{
  if (qword_1EB4A5E28 != -1) {
    dispatch_once(&qword_1EB4A5E28, &unk_1EF2C0680);
  }
  return byte_1EB4A5E20;
}

- (BOOL)isStickersAppEnabled_mac
{
  if (qword_1E94FF9E0 != -1) {
    dispatch_once(&qword_1E94FF9E0, &unk_1EF2C06E0);
  }
  return byte_1E94FF9D8;
}

- (BOOL)isStickerRepositioningEnabled_iOS
{
  if (qword_1E94FF9F0 != -1) {
    dispatch_once(&qword_1E94FF9F0, &unk_1EF2C0700);
  }
  return byte_1E94FF9E8;
}

- (BOOL)isStickerRepositioningEnabled_macOS
{
  if (qword_1E94FFA00 != -1) {
    dispatch_once(&qword_1E94FFA00, &unk_1EF2C0780);
  }
  return byte_1E94FF9F8;
}

- (BOOL)isStickerRepositioningEnabled
{
  return MEMORY[0x1F4181798](self, sel_isStickerRepositioningEnabled_iOS);
}

- (BOOL)isAlwaysShowStickerDropUIEnabled
{
  if (qword_1E94FFA10 != -1) {
    dispatch_once(&qword_1E94FFA10, &unk_1EF2C07E0);
  }
  return byte_1E94FFA08;
}

- (BOOL)isZelkovaGroupEnabled
{
  if (qword_1E94FE780 != -1) {
    dispatch_once(&qword_1E94FE780, &unk_1EF2C08A0);
  }
  return byte_1E94FE9E8;
}

- (BOOL)isPinnedConversationOnWatchEnabled
{
  if (qword_1E94FFA20 != -1) {
    dispatch_once(&qword_1E94FFA20, &unk_1EF2C08C0);
  }
  return byte_1E94FFA18;
}

- (BOOL)isPinActionEnabled
{
  if (qword_1E94FFA30 != -1) {
    dispatch_once(&qword_1E94FFA30, &unk_1EF2C08E0);
  }
  return byte_1E94FFA28;
}

- (BOOL)isUnknownSenderBlastDoorEnabled
{
  if (qword_1EB4A5F98 != -1) {
    dispatch_once(&qword_1EB4A5F98, &unk_1EF2C1418);
  }
  return byte_1EB4A5F90;
}

- (BOOL)isWidgetKitComplicationsEnabled
{
  if (qword_1E94FFA40 != -1) {
    dispatch_once(&qword_1E94FFA40, &unk_1EF2C0920);
  }
  return byte_1E94FFA38;
}

- (BOOL)shouldShowServiceEncryptionIcon
{
  if (qword_1EB4A5E18 != -1) {
    dispatch_once(&qword_1EB4A5E18, &unk_1EF2C1458);
  }
  return byte_1E94FFA48;
}

- (BOOL)isInlineTapbackMenuEnabled
{
  if (qword_1E94FFA58 != -1) {
    dispatch_once(&qword_1E94FFA58, &unk_1EF2C0940);
  }
  return byte_1E94FFA50;
}

- (BOOL)isReactWithAStickerEnabled
{
  if (qword_1E94FFA68 != -1) {
    dispatch_once(&qword_1E94FFA68, &unk_1EF2C0960);
  }
  return byte_1E94FFA60;
}

- (BOOL)isAllowMultiplePhoneNumbersSNaPEnabled
{
  if (qword_1E94FF308 != -1) {
    dispatch_once(&qword_1E94FF308, &unk_1EF2C1478);
  }
  return byte_1E94FF300;
}

- (BOOL)isQuickRepliesEnabled
{
  if (qword_1E94FFA78 != -1) {
    dispatch_once(&qword_1E94FFA78, &unk_1EF2C1498);
  }
  return byte_1E94FFA70;
}

- (BOOL)isWolfFullScreenEffectsEnabled
{
  if (qword_1E94FFA88 != -1) {
    dispatch_once(&qword_1E94FFA88, &unk_1EF2C14B8);
  }
  return byte_1E94FFA80;
}

- (BOOL)isModernDetailsViewEnabled
{
  if (qword_1E94FFA98 != -1) {
    dispatch_once(&qword_1E94FFA98, &unk_1EF2C14D8);
  }
  return byte_1E94FFA90;
}

- (BOOL)isRockNRollEnabled
{
  if (qword_1E94FEA08 != -1) {
    dispatch_once(&qword_1E94FEA08, &unk_1EF2C14F8);
  }
  return byte_1E94FF018;
}

- (BOOL)isOOPKeyboardEnabled
{
  if (qword_1E94FFAA8 != -1) {
    dispatch_once(&qword_1E94FFAA8, &unk_1EF2C1518);
  }
  return byte_1E94FFAA0;
}

- (BOOL)isTapbackInferenceEnabled
{
  return self->_tapbackInferenceEnabled;
}

- (BOOL)isFeatureFlagEnabledWithName:(id)a3
{
  [a3 cStringUsingEncoding:4];

  return _os_feature_enabled_impl();
}

@end