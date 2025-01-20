@interface MSFeature
+ (NSString)accountModificationAllowed;
+ (NSString)addingGameCenterFriendsAllowed;
+ (NSString)airDropAllowed;
+ (NSString)allowedOtherPlayerTypes;
+ (NSString)appCellularDataModificationAllowed;
+ (NSString)appClipsAllowed;
+ (NSString)appInstallationAllowed;
+ (NSString)appRemovalAllowed;
+ (NSString)assistantAllowed;
+ (NSString)assistantProfanityFilterForced;
+ (NSString)assistantUserGeneratedContentAllowed;
+ (NSString)automaticAppUpdatesAllowed;
+ (NSString)automaticDateAndTimeForced;
+ (NSString)blockedAppBundleIDs;
+ (NSString)bookstoreAllowed;
+ (NSString)bookstoreEroticaAllowed;
+ (NSString)cameraAllowed;
+ (NSString)cellularPlanModificationAllowed;
+ (NSString)chatAllowed;
+ (NSString)dictationAllowed;
+ (NSString)driverDoNotDisturbModificationsAllowed;
+ (NSString)eSIMModificationAllowed;
+ (NSString)explicitContentAllowed;
+ (NSString)findMyFriendsModificationAllowed;
+ (NSString)forceWebContentFilterAuto;
+ (NSString)gameCenterAllowed;
+ (NSString)gameCenterFriendsSharingModificationAllowed;
+ (NSString)gameCenterNearbyMultiplayerAllowed;
+ (NSString)gameCenterPrivateMessagingAllowed;
+ (NSString)gameCenterProfileModificationAllowed;
+ (NSString)gameCenterProfilePrivacyModificationAllowed;
+ (NSString)groupActivityAllowed;
+ (NSString)iTunesAllowed;
+ (NSString)iTunesStorePasswordEntryForced;
+ (NSString)inAppPurchasesAllowed;
+ (NSString)keyboardMathSolvingAllowed;
+ (NSString)limitAdTrackingForced;
+ (NSString)marketplaceAppInstallationAllowed;
+ (NSString)mathPaperSolvingAllowed;
+ (NSString)maximumAppsRating;
+ (NSString)maximumMoviesRating;
+ (NSString)maximumTVShowsRating;
+ (NSString)mdmEnrollmentAllowed;
+ (NSString)montaraAllowed;
+ (NSString)multiplayerGamingAllowed;
+ (NSString)musicArtistActivityAllowed;
+ (NSString)musicServiceAllowed;
+ (NSString)musicVideosAllowed;
+ (NSString)newsAllowed;
+ (NSString)passcodeModificationAllowed;
+ (NSString)podcastsAllowed;
+ (NSString)safariAcceptCookies;
+ (NSString)safariAllowed;
+ (NSString)safariAutoFillAllowed;
+ (NSString)screenRecordingAllowed;
+ (NSString)speakerVolumeLimitModificationAllowed;
+ (NSString)tvProviderModificationAllowed;
+ (NSString)uiAppInstallationAllowed;
+ (NSString)vehicleUIAllowed;
+ (NSString)videoConferencingAllowed;
+ (NSString)webContentFilterAutoPermittedURLs;
+ (NSString)webContentFilterBlockedURLs;
+ (NSString)webContentFilterOnlyAllowedBookmarks;
+ (NSString)webContentFilterOnlyAllowedURLs;
+ (NSString)webDistributionAppInstallationAllowed;
+ (double)gameCenterOtherPlayerTypesEveryone;
+ (double)gameCenterOtherPlayerTypesFriendsOnly;
+ (double)gameCenterOtherPlayerTypesNone;
+ (double)safariAcceptCookiesAlways;
+ (double)safariAcceptCookiesExclusivelyFromMainDocumentDomain;
+ (double)safariAcceptCookiesFromMainDocumentDomain;
+ (double)safariAcceptCookiesNever;
@end

@implementation MSFeature

+ (NSString)accountModificationAllowed
{
  return (NSString *)MCFeatureAccountModificationAllowed;
}

+ (NSString)airDropAllowed
{
  return (NSString *)MCFeatureAirDropAllowed;
}

+ (NSString)mdmEnrollmentAllowed
{
  return (NSString *)MCFeatureMDMEnrollmentAllowed;
}

+ (NSString)appClipsAllowed
{
  return (NSString *)MCFeatureAppClipsAllowed;
}

+ (NSString)appInstallationAllowed
{
  return (NSString *)MCFeatureAppInstallationAllowed;
}

+ (NSString)appRemovalAllowed
{
  return (NSString *)MCFeatureAppRemovalAllowed;
}

+ (NSString)automaticAppUpdatesAllowed
{
  return (NSString *)MCFeatureAutomaticAppUpdatesAllowed;
}

+ (NSString)blockedAppBundleIDs
{
  return (NSString *)MCFeatureBlockedAppBundleIDs;
}

+ (NSString)inAppPurchasesAllowed
{
  return (NSString *)MCFeatureInAppPurchasesAllowed;
}

+ (NSString)iTunesStorePasswordEntryForced
{
  return (NSString *)MCFeatureITunesStorePasswordEntryForced;
}

+ (NSString)marketplaceAppInstallationAllowed
{
  return (NSString *)MCFeatureMarketplaceAppInstallationAllowed;
}

+ (NSString)maximumAppsRating
{
  return (NSString *)MCFeatureMaximumAppsRating;
}

+ (NSString)uiAppInstallationAllowed
{
  return (NSString *)MCFeatureUIAppInstallationAllowed;
}

+ (NSString)webDistributionAppInstallationAllowed
{
  return (NSString *)MCFeatureWebDistributionAppInstallationAllowed;
}

+ (NSString)mathPaperSolvingAllowed
{
  return (NSString *)MCFeatureMathPaperSolvingAllowed;
}

+ (NSString)cameraAllowed
{
  return (NSString *)MCFeatureCameraAllowed;
}

+ (NSString)screenRecordingAllowed
{
  return (NSString *)MCFeatureScreenRecordingAllowed;
}

+ (NSString)vehicleUIAllowed
{
  return (NSString *)MCFeatureVehicleUIAllowed;
}

+ (NSString)appCellularDataModificationAllowed
{
  return (NSString *)MCFeatureAppCellularDataModificationAllowed;
}

+ (NSString)cellularPlanModificationAllowed
{
  return (NSString *)MCFeatureCellularPlanModificationAllowed;
}

+ (NSString)eSIMModificationAllowed
{
  return (NSString *)MCFeatureESIMModificationAllowed;
}

+ (NSString)automaticDateAndTimeForced
{
  return (NSString *)MCFeatureAutomaticDateAndTimeForced;
}

+ (NSString)groupActivityAllowed
{
  return (NSString *)MCFeatureGroupActivityAllowed;
}

+ (NSString)videoConferencingAllowed
{
  return (NSString *)MCFeatureVideoConferencingAllowed;
}

+ (NSString)findMyFriendsModificationAllowed
{
  return (NSString *)MCFeatureFindMyFriendsModificationAllowed;
}

+ (NSString)addingGameCenterFriendsAllowed
{
  return (NSString *)MCFeatureAddingGameCenterFriendsAllowed;
}

+ (NSString)allowedOtherPlayerTypes
{
  return (NSString *)MCFeatureGameCenterAllowedOtherPlayerTypes;
}

+ (double)gameCenterOtherPlayerTypesNone
{
  return 0.0;
}

+ (double)gameCenterOtherPlayerTypesFriendsOnly
{
  return 1.0;
}

+ (double)gameCenterOtherPlayerTypesEveryone
{
  return 2.0;
}

+ (NSString)gameCenterFriendsSharingModificationAllowed
{
  return (NSString *)MCFeatureGameCenterFriendsSharingModificationAllowed;
}

+ (NSString)gameCenterAllowed
{
  return (NSString *)MCFeatureGameCenterAllowed;
}

+ (NSString)gameCenterNearbyMultiplayerAllowed
{
  return (NSString *)MCFeatureGameCenterNearbyMultiplayerAllowed;
}

+ (NSString)gameCenterPrivateMessagingAllowed
{
  return (NSString *)MCFeatureGameCenterPrivateMessagingAllowed;
}

+ (NSString)gameCenterProfileModificationAllowed
{
  return (NSString *)MCFeatureGameCenterProfileModificationAllowed;
}

+ (NSString)gameCenterProfilePrivacyModificationAllowed
{
  return (NSString *)MCFeatureGameCenterProfilePrivacyModificationAllowed;
}

+ (NSString)multiplayerGamingAllowed
{
  return (NSString *)MCFeatureMultiplayerGamingAllowed;
}

+ (NSString)dictationAllowed
{
  return (NSString *)MCFeatureDictationAllowed;
}

+ (NSString)keyboardMathSolvingAllowed
{
  return (NSString *)MCFeatureKeyboardMathSolvingAllowed;
}

+ (NSString)bookstoreAllowed
{
  return (NSString *)MCFeatureBookstoreAllowed;
}

+ (NSString)bookstoreEroticaAllowed
{
  return (NSString *)MCFeatureBookstoreEroticaAllowed;
}

+ (NSString)explicitContentAllowed
{
  return (NSString *)MCFeatureExplicitContentAllowed;
}

+ (NSString)iTunesAllowed
{
  return (NSString *)MCFeatureITunesAllowed;
}

+ (NSString)maximumMoviesRating
{
  return (NSString *)MCFeatureMaximumMoviesRating;
}

+ (NSString)maximumTVShowsRating
{
  return (NSString *)MCFeatureMaximumTVShowsRating;
}

+ (NSString)musicArtistActivityAllowed
{
  return (NSString *)MCFeatureMusicArtistActivityAllowed;
}

+ (NSString)musicServiceAllowed
{
  return (NSString *)MCFeatureMusicServiceAllowed;
}

+ (NSString)musicVideosAllowed
{
  return (NSString *)MCFeatureMusicVideosAllowed;
}

+ (NSString)podcastsAllowed
{
  return (NSString *)MCFeaturePodcastsAllowed;
}

+ (NSString)speakerVolumeLimitModificationAllowed
{
  return (NSString *)MCFeatureSpeakerVolumeLimitModificationAllowed;
}

+ (NSString)tvProviderModificationAllowed
{
  return (NSString *)MCFeatureTVProviderModificationAllowed;
}

+ (NSString)chatAllowed
{
  return (NSString *)MCFeatureChatAllowed;
}

+ (NSString)newsAllowed
{
  return (NSString *)MCFeatureNewsAllowed;
}

+ (NSString)driverDoNotDisturbModificationsAllowed
{
  return (NSString *)MCFeatureDriverDoNotDisturbModificationsAllowed;
}

+ (NSString)passcodeModificationAllowed
{
  return (NSString *)MCFeaturePasscodeModificationAllowed;
}

+ (NSString)limitAdTrackingForced
{
  return (NSString *)MCFeatureLimitAdTrackingForced;
}

+ (NSString)safariAutoFillAllowed
{
  return (NSString *)MCFeatureSafariAutoFillAllowed;
}

+ (NSString)safariAllowed
{
  return (NSString *)MCFeatureSafariAllowed;
}

+ (NSString)safariAcceptCookies
{
  return (NSString *)MCFeatureSafariAcceptCookies;
}

+ (double)safariAcceptCookiesNever
{
  return 0.0;
}

+ (double)safariAcceptCookiesExclusivelyFromMainDocumentDomain
{
  return 1.0;
}

+ (double)safariAcceptCookiesFromMainDocumentDomain
{
  return 1.5;
}

+ (double)safariAcceptCookiesAlways
{
  return 2.0;
}

+ (NSString)assistantAllowed
{
  return (NSString *)MCFeatureAssistantAllowed;
}

+ (NSString)assistantProfanityFilterForced
{
  return (NSString *)MCFeatureAssistantProfanityFilterForced;
}

+ (NSString)assistantUserGeneratedContentAllowed
{
  return (NSString *)MCFeatureAssistantUserGeneratedContentAllowed;
}

+ (NSString)montaraAllowed
{
  return (NSString *)MCFeatureMontaraAllowed;
}

+ (NSString)forceWebContentFilterAuto
{
  return (NSString *)MCFeatureWebContentFilterAutoForced;
}

+ (NSString)webContentFilterAutoPermittedURLs
{
  return (NSString *)MCFeatureWebContentFilterAutoPermittedURLs;
}

+ (NSString)webContentFilterBlockedURLs
{
  return (NSString *)MCFeatureWebContentFilterBlacklistedURLs;
}

+ (NSString)webContentFilterOnlyAllowedBookmarks
{
  return (NSString *)MCFeatureWebContentFilterWhitelistedBookmarks;
}

+ (NSString)webContentFilterOnlyAllowedURLs
{
  return (NSString *)MCFeatureWebContentFilterWhitelistedURLs;
}

@end