@interface GKPreferences
+ (GKPreferences)shared;
+ (id)displayNameForEnvironment:(int64_t)a3;
+ (id)hostNameForEnvironment:(int64_t)a3;
+ (int64_t)environmentForString:(id)a3;
- (BOOL)BOOLeanValueForKey:(id)a3;
- (BOOL)BOOLeanValueForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)HTTPShouldUsePipelining;
- (BOOL)_shouldSynchronizeOnNextRead;
- (BOOL)accessPointCustomTransition;
- (BOOL)accessPointIsOnAutomatically;
- (BOOL)accessPointShowHighlights;
- (BOOL)activityFeedTestFeedOnly;
- (BOOL)dashboardDeepLinkEnabled;
- (BOOL)disableViceroyNearby;
- (BOOL)easySignInSheetEnabled;
- (BOOL)enterSandbox;
- (BOOL)fastSyncTransportEnabled;
- (BOOL)fetchFriendCodeInExtensionEnabled;
- (BOOL)forceDefaultContactsIntegrationConsent;
- (BOOL)forceDefaultNickname;
- (BOOL)forceDefaultPrivacy;
- (BOOL)forceFriendSuggestions;
- (BOOL)forcePrivacyNotice;
- (BOOL)forceRelay;
- (BOOL)forceUnderage;
- (BOOL)inboxContactsOnly;
- (BOOL)isAccountModificationRestricted;
- (BOOL)isAddingFriendsRestricted;
- (BOOL)isAppInstallationRestricted;
- (BOOL)isClipGestureEnabled;
- (BOOL)isCustomizedCommunicationRestricted;
- (BOOL)isFriendRequestsRestricted;
- (BOOL)isFriendsSharingRestricted;
- (BOOL)isGameCenterDisabled;
- (BOOL)isGameCenterRestricted;
- (BOOL)isInternalBuild;
- (BOOL)isMultiplayerGamingRestricted;
- (BOOL)isNearbyMultiplayerRestricted;
- (BOOL)isNotificationCenterEnabled;
- (BOOL)isProfileModificationRestricted;
- (BOOL)isProfilePrivacyModificationRestricted;
- (BOOL)isSharingRestricted;
- (BOOL)isStoreDemoModeEnabled;
- (BOOL)isWebKitInspectElementEnabled;
- (BOOL)lockedDown;
- (BOOL)multiplayerHealthCheckEnabled;
- (BOOL)multiplayerInGameOverlayEnabled;
- (BOOL)multiplayerShouldAlwaysReloadCollectionView;
- (BOOL)multiplayerTransportOverrideV1Disabled;
- (BOOL)multiplayerTransportOverrideV1Enabled;
- (BOOL)multiplayerTransportOverrideV2Disabled;
- (BOOL)multiplayerTransportOverrideV2Enabled;
- (BOOL)networkManagerIgnoreCache;
- (BOOL)notificationAlertsEnabled;
- (BOOL)notificationBadgesEnabled;
- (BOOL)notificationSoundsEnabled;
- (BOOL)notifyAboutScoreSubmissions;
- (BOOL)preemptiveRelay;
- (BOOL)requestHeadersPrivacyEnabled;
- (BOOL)restrictToAutomatch;
- (BOOL)restrictionEnabledForKey:(id)a3;
- (BOOL)shouldAddPlayerInfoToAddressBook;
- (BOOL)shouldAllowCustomCommunication;
- (BOOL)shouldAllowNearbyMultiplayer;
- (BOOL)shouldAllowSharing;
- (BOOL)shouldAnnotateImageUsage;
- (BOOL)shouldDisallowInvitesFromStrangers;
- (BOOL)shouldLinkPlayerToFacebook;
- (BOOL)shouldLinkPlayerToICloud;
- (BOOL)shouldLinkPlayerToTwitter;
- (BOOL)shouldTrackAtlasImageUsage;
- (BOOL)shouldUseTestIcons;
- (BOOL)supportLockdownMode;
- (BOOL)supportsChallenges;
- (BOOL)useInternalHeader;
- (BOOL)useTestProtocols;
- (GKPreferences)initWithNotifications;
- (GKPreferences)initWithoutNotifications;
- (GKPreferencesDelegate)preferencesDelegate;
- (NSArray)forceDisabledTransportVersions;
- (NSArray)forceEnabledTransportVersions;
- (NSDictionary)overrideValues;
- (NSDictionary)recentNumberOfPlayersPerGame;
- (NSDictionary)recentPickerSortPreferencePerGame;
- (NSString)networkManagerUserOverride;
- (NSString)storeBagURL;
- (NSString)testRunID;
- (double)cacheTTLOverride;
- (double)debugRequestTimeout;
- (double)garbageCollectionInterval;
- (double)maxRecentPlayersTime;
- (double)minimumCacheTTL;
- (double)multiplayerActivityFeedMaxSessionDuration;
- (double)operationRetryDelay;
- (double)operationTimeout;
- (double)terminationInterval;
- (double)timeIntervalForKey:(id)a3 defaultValue:(double)a4;
- (id)dictionaryValueForKey:(id)a3;
- (id)overrideValueForKey:(id)a3;
- (id)preferencesValueForKey:(id)a3;
- (id)stringValueForKey:(id)a3 defaultValue:(id)a4;
- (id)valueRestrictionForKey:(id)a3;
- (int64_t)accessPointLocation;
- (int64_t)environment;
- (int64_t)fakeFriendRequestCount;
- (int64_t)integerValueForKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)networkManagerStateOverride;
- (int64_t)pipeliningSetting;
- (int64_t)pushEnvironment;
- (int64_t)recentPlayerPickerSortPreferenceForBundleID:(id)a3;
- (int64_t)unsignedIntegerValueForKey:(id)a3 defaultValue:(int64_t)a4;
- (unint64_t)coreRecentMultiplier;
- (unint64_t)coreRecentUpperLimit;
- (unint64_t)exchangeDataDefaultMaximumSize;
- (unint64_t)exchangeDataMaximumSize;
- (unint64_t)exchangeDefaultMaxInitiatedExchangesPerPlayer;
- (unint64_t)exchangeMaxInitiatedExchangesPerPlayer;
- (unint64_t)loginDisableThreshold;
- (unint64_t)maxDefaultGameStateSizeTurnBased;
- (unint64_t)maxDefaultPlayersHosted;
- (unint64_t)maxDefaultPlayersP2P;
- (unint64_t)maxDefaultPlayersTurnBased;
- (unint64_t)maxGameStateSizeTurnBased;
- (unint64_t)maxPlayersHosted;
- (unint64_t)maxPlayersP2P;
- (unint64_t)maxPlayersTurnBased;
- (unint64_t)maxRecentPlayersCount;
- (unint64_t)maximumInviteVersionSupported;
- (unint64_t)mescalSetupRetries;
- (unint64_t)multiplayerAllowedPlayerType;
- (unint64_t)operationRetryCount;
- (unint64_t)recentNumberOfPlayers;
- (unint64_t)recentNumberOfPlayersForBundleID:(id)a3;
- (void)_didWriteKey:(id)a3;
- (void)applicationWillEnterBackground:(id)a3;
- (void)getMultiplayerAllowedPlayerTypeWithHandler:(id)a3;
- (void)invalidate;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeOverrideForKey:(id)a3;
- (void)setAccessPointCustomTransition:(BOOL)a3;
- (void)setAccessPointIsOnAutomatically:(BOOL)a3;
- (void)setAccessPointLocation:(int64_t)a3;
- (void)setAccessPointShowHighlights:(BOOL)a3;
- (void)setActivityFeedTestFeedOnly:(BOOL)a3;
- (void)setBooleanValue:(BOOL)a3 forKey:(id)a4;
- (void)setCacheTTLOverride:(double)a3;
- (void)setClipGestureEnabled:(BOOL)a3;
- (void)setCoreRecentMultiplier:(unint64_t)a3;
- (void)setCoreRecentUpperLimit:(unint64_t)a3;
- (void)setDashboardDeepLinkEnabled:(BOOL)a3;
- (void)setDebugRequestTimeout:(double)a3;
- (void)setDictionaryValue:(id)a3 forKey:(id)a4;
- (void)setDisableViceroyNearby:(BOOL)a3;
- (void)setEnterSandbox:(BOOL)a3;
- (void)setEnvironment:(int64_t)a3;
- (void)setExchangeDataMaximumSize:(unint64_t)a3;
- (void)setExchangeMaxInitiatedExchangesPerPlayer:(unint64_t)a3;
- (void)setFakeFriendRequestCount:(int64_t)a3;
- (void)setForceDefaultContactsIntegrationConsent:(BOOL)a3;
- (void)setForceDefaultNickname:(BOOL)a3;
- (void)setForceDefaultPrivacy:(BOOL)a3;
- (void)setForceFriendSuggestions:(BOOL)a3;
- (void)setForcePrivacyNotice:(BOOL)a3;
- (void)setForceRelay:(BOOL)a3;
- (void)setForceUnderage:(BOOL)a3;
- (void)setGarbageCollectionInterval:(double)a3;
- (void)setInboxContactsOnly:(BOOL)a3;
- (void)setInboxContactsOnly:(BOOL)a3 refresh:(BOOL)a4;
- (void)setIntegerValue:(int64_t)a3 forKey:(id)a4;
- (void)setLoginDisableThreshold:(unint64_t)a3;
- (void)setMaxGameStateSizeTurnBased:(unint64_t)a3;
- (void)setMaxPlayersHosted:(unint64_t)a3;
- (void)setMaxPlayersP2P:(unint64_t)a3;
- (void)setMaxPlayersTurnBased:(unint64_t)a3;
- (void)setMaxRecentPlayersCount:(unint64_t)a3;
- (void)setMaxRecentPlayersTime:(double)a3;
- (void)setMaximumInviteVersionSupported:(unint64_t)a3;
- (void)setMescalSetupRetries:(unint64_t)a3;
- (void)setMinimumCacheTTL:(double)a3;
- (void)setMultiplayerActivityFeedMaxSessionDuration:(double)a3;
- (void)setMultiplayerHealthCheckEnabled:(BOOL)a3;
- (void)setMultiplayerInGameOverlayEnabled:(BOOL)a3;
- (void)setMultiplayerShouldAlwaysReloadCollectionView:(BOOL)a3;
- (void)setMultiplayerTransportOverrideV1Disabled:(BOOL)a3;
- (void)setMultiplayerTransportOverrideV1Enabled:(BOOL)a3;
- (void)setMultiplayerTransportOverrideV2Disabled:(BOOL)a3;
- (void)setMultiplayerTransportOverrideV2Enabled:(BOOL)a3;
- (void)setNetworkManagerIgnoreCache:(BOOL)a3;
- (void)setNetworkManagerStateOverride:(int64_t)a3;
- (void)setNetworkManagerUserOverride:(id)a3;
- (void)setNotificationAlertsEnabled:(BOOL)a3;
- (void)setNotificationBadgesEnabled:(BOOL)a3;
- (void)setNotificationCenterEnabled:(BOOL)a3;
- (void)setNotificationSoundsEnabled:(BOOL)a3;
- (void)setNotifyAboutScoreSubmissions:(BOOL)a3;
- (void)setOperationRetryCount:(unint64_t)a3;
- (void)setOperationRetryDelay:(double)a3;
- (void)setOperationTimeout:(double)a3;
- (void)setOverrideValues:(id)a3;
- (void)setPipeliningSetting:(int64_t)a3;
- (void)setPreemptiveRelay:(BOOL)a3;
- (void)setPreferencesDelegate:(id)a3;
- (void)setPushEnvironment:(int64_t)a3;
- (void)setRecentNumberOfPlayers:(unint64_t)a3;
- (void)setRecentNumberOfPlayers:(unint64_t)a3 forBundleID:(id)a4;
- (void)setRecentNumberOfPlayersPerGame:(id)a3;
- (void)setRecentPickerSortPreferencePerGame:(id)a3;
- (void)setRecentPlayerPickerSortPreference:(int64_t)a3 forBundleID:(id)a4;
- (void)setRestrictToAutomatch:(BOOL)a3;
- (void)setShouldAddPlayerInfoToAddressBook:(BOOL)a3;
- (void)setShouldAllowNearbyMultiplayer:(BOOL)a3;
- (void)setShouldAnnotateImageUsage:(BOOL)a3;
- (void)setShouldLinkPlayerToFacebook:(BOOL)a3;
- (void)setShouldLinkPlayerToICloud:(BOOL)a3;
- (void)setShouldLinkPlayerToTwitter:(BOOL)a3;
- (void)setShouldTrackAtlasImageUsage:(BOOL)a3;
- (void)setShouldUseTestIcons:(BOOL)a3;
- (void)setStoreBagURL:(id)a3;
- (void)setStringValue:(id)a3 forKey:(id)a4;
- (void)setSupportLockdownMode:(BOOL)a3;
- (void)setSupportsChallenges:(BOOL)a3;
- (void)setTerminationInterval:(double)a3;
- (void)setTestRunID:(id)a3;
- (void)setTimeInterval:(double)a3 forKey:(id)a4;
- (void)setUnsignedIntegerValue:(int64_t)a3 forKey:(id)a4;
- (void)setUseInternalHeader:(BOOL)a3;
- (void)setUseTestProtocols:(BOOL)a3;
- (void)setWebKitInspectElementEnabled:(BOOL)a3;
- (void)set_shouldSynchronizeOnNextRead:(BOOL)a3;
- (void)synchronize;
@end

@implementation GKPreferences

- (void)invalidate
{
}

- (int64_t)fakeFriendRequestCount
{
  return [(GKPreferences *)self integerValueForKey:@"GKFakeFriendRequestCount" defaultValue:0];
}

+ (GKPreferences)shared
{
  if (shared_sDispatchOnceToken != -1) {
    dispatch_once(&shared_sDispatchOnceToken, &__block_literal_global_8);
  }
  if ([(id)shared_sSharedPreferences _shouldSynchronizeOnNextRead])
  {
    [(id)shared_sSharedPreferences synchronize];
    objc_msgSend((id)shared_sSharedPreferences, "set_shouldSynchronizeOnNextRead:", 0);
  }
  v2 = (void *)shared_sSharedPreferences;

  return (GKPreferences *)v2;
}

- (BOOL)_shouldSynchronizeOnNextRead
{
  return self->_shouldSynchronizeOnNextRead;
}

- (void)set_shouldSynchronizeOnNextRead:(BOOL)a3
{
  self->_shouldSynchronizeOnNextRead = a3;
}

- (void)synchronize
{
}

- (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken_0 != -1) {
    dispatch_once(&isInternalBuild_onceToken_0, &__block_literal_global_9_0);
  }
  return isInternalBuild_isInternal;
}

- (BOOL)inboxContactsOnly
{
  v3 = +[GKLocalPlayer localPlayer];
  v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 isUnderage];
  }
  else {
    uint64_t v5 = 1;
  }
  BOOL v6 = [(GKPreferences *)self BOOLeanValueForKey:@"GKFriendRequestsInboxContactsOnly" defaultValue:v5];

  return v6;
}

- (BOOL)BOOLeanValueForKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v5 = [(GKPreferences *)self preferencesValueForKey:a3];
  BOOL v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (int64_t)integerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  uint64_t v5 = [(GKPreferences *)self preferencesValueForKey:a3];
  BOOL v6 = v5;
  if (v5) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (id)preferencesValueForKey:(id)a3
{
  v4 = (__CFString *)a3;
  uint64_t v5 = [(GKPreferences *)self overrideValueForKey:v4];
  if (!v5) {
    uint64_t v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.gamecenter");
  }

  return v5;
}

- (id)overrideValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(NSDictionary *)v5->_overrideValues objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

uint64_t __23__GKPreferences_shared__block_invoke()
{
  shared_sSharedPreferences = objc_alloc_init(GKPreferences);

  return MEMORY[0x1F41817F8]();
}

- (GKPreferences)initWithNotifications
{
  v2 = [(GKPreferences *)self initWithoutNotifications];
  v3 = GKGetRuntimeStrategy();
  int v4 = [v3 shouldRefreshPreferencesAfterBackgrounding];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v6 = +[GKApplicationNotificationNames didEnterBackground];
    [v5 addObserver:v2 selector:sel_applicationWillEnterBackground_ name:v6 object:0];
  }
  return v2;
}

- (GKPreferences)initWithoutNotifications
{
  v5.receiver = self;
  v5.super_class = (Class)GKPreferences;
  v2 = [(GKPreferences *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 addSuiteNamed:@"com.apple.demo-settings"];
    [(GKPreferences *)v2 synchronize];
  }
  return v2;
}

void __32__GKPreferences_isInternalBuild__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  isInternalBuild_isInternal = v0 == (const void *)*MEMORY[0x1E4F1CFD0];

  CFRelease(v0);
}

- (void)_didWriteKey:(id)a3
{
  [(GKPreferences *)self removeOverrideForKey:a3];

  CFPreferencesAppSynchronize(@"com.apple.gamecenter");
}

- (void)applicationWillEnterBackground:(id)a3
{
}

- (void)setOverrideValues:(id)a3
{
  int v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  overrideValues = obj->_overrideValues;
  obj->_overrideValues = v4;

  objc_sync_exit(obj);
}

- (NSDictionary)overrideValues
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_overrideValues;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)BOOLeanValueForKey:(id)a3
{
  return [(GKPreferences *)self BOOLeanValueForKey:a3 defaultValue:0];
}

- (void)setBooleanValue:(BOOL)a3 forKey:(id)a4
{
  objc_super v5 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    objc_super v5 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  BOOL v6 = *v5;
  v7 = (__CFString *)a4;
  CFPreferencesSetAppValue(v7, v6, @"com.apple.gamecenter");
  [(GKPreferences *)self _didWriteKey:v7];
}

- (void)setIntegerValue:(int64_t)a3 forKey:(id)a4
{
  BOOL v6 = NSNumber;
  key = (__CFString *)a4;
  v7 = [v6 numberWithInteger:a3];
  CFPreferencesSetAppValue(key, v7, @"com.apple.gamecenter");

  [(GKPreferences *)self _didWriteKey:key];
}

- (int64_t)unsignedIntegerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  objc_super v5 = [(GKPreferences *)self preferencesValueForKey:a3];
  BOOL v6 = v5;
  if (v5) {
    a4 = [v5 unsignedIntegerValue];
  }

  return a4;
}

- (void)setUnsignedIntegerValue:(int64_t)a3 forKey:(id)a4
{
  BOOL v6 = NSNumber;
  key = (__CFString *)a4;
  v7 = [v6 numberWithUnsignedInteger:a3];
  CFPreferencesSetAppValue(key, v7, @"com.apple.gamecenter");

  [(GKPreferences *)self _didWriteKey:key];
}

- (id)dictionaryValueForKey:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.gamecenter");
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)setDictionaryValue:(id)a3 forKey:(id)a4
{
}

- (double)timeIntervalForKey:(id)a3 defaultValue:(double)a4
{
  objc_super v5 = [(GKPreferences *)self preferencesValueForKey:a3];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    a4 = v7;
  }

  return a4;
}

- (void)setTimeInterval:(double)a3 forKey:(id)a4
{
  BOOL v6 = NSNumber;
  key = (__CFString *)a4;
  double v7 = [v6 numberWithDouble:a3];
  CFPreferencesSetAppValue(key, v7, @"com.apple.gamecenter");

  [(GKPreferences *)self _didWriteKey:key];
}

- (id)stringValueForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(GKPreferences *)self preferencesValueForKey:a3];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (void)setStringValue:(id)a3 forKey:(id)a4
{
}

- (void)removeOverrideForKey:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4->_overrideValues];
  [v5 removeObjectForKey:v6];
  [(GKPreferences *)v4 setOverrideValues:v5];

  objc_sync_exit(v4);
}

- (BOOL)supportLockdownMode
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKSupportLockdownMode" defaultValue:1];
}

- (void)setSupportLockdownMode:(BOOL)a3
{
}

- (BOOL)lockedDown
{
  BOOL v2 = [(GKPreferences *)self supportLockdownMode];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F73060] shared];
    char v4 = [v3 enabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (int64_t)environment
{
  if ([(GKPreferences *)self isStoreDemoModeEnabled]) {
    return 5;
  }

  return [(GKPreferences *)self integerValueForKey:@"GKStoreBagEnvironment" defaultValue:5];
}

- (void)setEnvironment:(int64_t)a3
{
  if (a3 && a3 <= 11)
  {
    -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:");
    GKGetRuntimeStrategy();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    char v4 = [v5 utilityServicePrivate];
    [v4 terminate];
  }
}

- (NSString)storeBagURL
{
  return (NSString *)[(GKPreferences *)self preferencesValueForKey:@"GKCustomStoreBagURL"];
}

- (void)setStoreBagURL:(id)a3
{
  CFPreferencesSetAppValue(@"GKCustomStoreBagURL", a3, @"com.apple.gamecenter");
  [(GKPreferences *)self _didWriteKey:@"GKCustomStoreBagURL"];
  GKGetRuntimeStrategy();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  char v4 = [v5 utilityServicePrivate];
  [v4 refreshPreferences];
}

- (BOOL)useTestProtocols
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKUseTestProtocols"];
}

- (void)setUseTestProtocols:(BOOL)a3
{
}

- (BOOL)enterSandbox
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKEnterSandbox" defaultValue:1];
}

- (void)setEnterSandbox:(BOOL)a3
{
}

- (BOOL)forcePrivacyNotice
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKForcePrivacyNotice"];
}

- (void)setForcePrivacyNotice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKOnboarding;
  if (os_log_type_enabled((os_log_t)os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKPreferences.shared.forcePrivacyNotice is set to %d", (uint8_t *)v7, 8u);
  }
  [(GKPreferences *)self setBooleanValue:v3 forKey:@"GKForcePrivacyNotice"];
}

- (BOOL)forceDefaultNickname
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKForceDefaultNickname"];
}

- (void)setForceDefaultNickname:(BOOL)a3
{
}

- (BOOL)forceDefaultPrivacy
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKForceFriendSuggestions"];
}

- (void)setForceDefaultPrivacy:(BOOL)a3
{
}

- (BOOL)forceFriendSuggestions
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKForceDefaultPrivacy"];
}

- (void)setForceFriendSuggestions:(BOOL)a3
{
}

- (BOOL)forceDefaultContactsIntegrationConsent
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKForceDefaultContactsIntegrationConsent"];
}

- (void)setForceDefaultContactsIntegrationConsent:(BOOL)a3
{
}

- (BOOL)forceUnderage
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKForceUnderage"];
}

- (void)setForceUnderage:(BOOL)a3
{
}

- (unint64_t)mescalSetupRetries
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKMescalSetupRetries" defaultValue:3];
}

- (void)setMescalSetupRetries:(unint64_t)a3
{
}

- (unint64_t)coreRecentUpperLimit
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKCoreRecentUpperLimit" defaultValue:50];
}

- (void)setCoreRecentUpperLimit:(unint64_t)a3
{
}

- (unint64_t)coreRecentMultiplier
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKCoreRecentMultiplier" defaultValue:3];
}

- (void)setCoreRecentMultiplier:(unint64_t)a3
{
}

- (unint64_t)loginDisableThreshold
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKLoginDisabledThreshold" defaultValue:3];
}

- (void)setNetworkManagerUserOverride:(id)a3
{
}

- (NSString)networkManagerUserOverride
{
  return (NSString *)[(GKPreferences *)self stringValueForKey:@"GKNetworkManagerUserOverride" defaultValue:&stru_1F1E47DF8];
}

- (void)setNetworkManagerStateOverride:(int64_t)a3
{
}

- (int64_t)networkManagerStateOverride
{
  return [(GKPreferences *)self integerValueForKey:@"GKNetworkManagerStateOverride" defaultValue:-1];
}

- (BOOL)networkManagerIgnoreCache
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKNetworkManagerIgnoreCache" defaultValue:0];
}

- (void)setNetworkManagerIgnoreCache:(BOOL)a3
{
}

- (void)setLoginDisableThreshold:(unint64_t)a3
{
}

- (double)operationTimeout
{
  [(GKPreferences *)self timeIntervalForKey:@"GKOperationTimout" defaultValue:15.0];
  return result;
}

- (void)setOperationTimeout:(double)a3
{
}

- (double)operationRetryDelay
{
  [(GKPreferences *)self timeIntervalForKey:@"GKOperationRetryDelay" defaultValue:1.0];
  return result;
}

- (void)setOperationRetryDelay:(double)a3
{
}

- (unint64_t)operationRetryCount
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKOperationRetryCount" defaultValue:3];
}

- (void)setOperationRetryCount:(unint64_t)a3
{
}

- (double)debugRequestTimeout
{
  [(GKPreferences *)self timeIntervalForKey:@"GKDebugRequestTimeout" defaultValue:0.0];
  return result;
}

- (void)setDebugRequestTimeout:(double)a3
{
}

- (BOOL)isNotificationCenterEnabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKNotificationCenter" defaultValue:1];
}

- (void)setNotificationCenterEnabled:(BOOL)a3
{
}

- (BOOL)notificationBadgesEnabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKNotificationBadges" defaultValue:1];
}

- (void)setNotificationBadgesEnabled:(BOOL)a3
{
}

- (BOOL)notificationSoundsEnabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKNotificationSounds" defaultValue:1];
}

- (void)setNotificationSoundsEnabled:(BOOL)a3
{
}

- (BOOL)notificationAlertsEnabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKNotificationAlerts" defaultValue:1];
}

- (void)setNotificationAlertsEnabled:(BOOL)a3
{
}

- (NSString)testRunID
{
  return (NSString *)[(GKPreferences *)self stringValueForKey:@"GKTestRunID" defaultValue:0];
}

- (void)setTestRunID:(id)a3
{
}

- (BOOL)forceRelay
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKForceRelay"];
}

- (void)setForceRelay:(BOOL)a3
{
}

- (BOOL)preemptiveRelay
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKPreemptiveRelay" defaultValue:1];
}

- (void)setPreemptiveRelay:(BOOL)a3
{
}

- (BOOL)disableViceroyNearby
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKDisableViceroyNearby" defaultValue:0];
}

- (void)setDisableViceroyNearby:(BOOL)a3
{
}

- (NSArray)forceEnabledTransportVersions
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(GKPreferences *)self multiplayerTransportOverrideV1Enabled]) {
    [v3 addObject:&unk_1F1E7EA98];
  }
  if ([(GKPreferences *)self multiplayerTransportOverrideV2Enabled]) {
    [v3 addObject:&unk_1F1E7EAB0];
  }

  return (NSArray *)v3;
}

- (NSArray)forceDisabledTransportVersions
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(GKPreferences *)self multiplayerTransportOverrideV1Disabled]) {
    [v3 addObject:&unk_1F1E7EA98];
  }
  if ([(GKPreferences *)self multiplayerTransportOverrideV2Disabled]) {
    [v3 addObject:&unk_1F1E7EAB0];
  }

  return (NSArray *)v3;
}

- (BOOL)multiplayerTransportOverrideV1Enabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKMultiplayerTransportOverrideV1Enabled" defaultValue:0];
}

- (void)setMultiplayerTransportOverrideV1Enabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKPreferences *)self setBooleanValue:a3 forKey:@"GKMultiplayerTransportOverrideV1Enabled"];
  if (v3)
  {
    [(GKPreferences *)self setMultiplayerTransportOverrideV1Disabled:0];
  }
}

- (BOOL)multiplayerTransportOverrideV1Disabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKMultiplayerTransportOverrideV1Disabled" defaultValue:0];
}

- (void)setMultiplayerTransportOverrideV1Disabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKPreferences *)self setBooleanValue:a3 forKey:@"GKMultiplayerTransportOverrideV1Disabled"];
  if (v3)
  {
    [(GKPreferences *)self setMultiplayerTransportOverrideV1Enabled:0];
  }
}

- (BOOL)multiplayerTransportOverrideV2Enabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKMultiplayerTransportOverrideV2Enabled" defaultValue:0];
}

- (void)setMultiplayerTransportOverrideV2Enabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKPreferences *)self setBooleanValue:a3 forKey:@"GKMultiplayerTransportOverrideV2Enabled"];
  if (v3)
  {
    [(GKPreferences *)self setMultiplayerTransportOverrideV2Disabled:0];
  }
}

- (BOOL)multiplayerTransportOverrideV2Disabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKMultiplayerTransportOverrideV2Disabled" defaultValue:0];
}

- (void)setMultiplayerTransportOverrideV2Disabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKPreferences *)self setBooleanValue:a3 forKey:@"GKMultiplayerTransportOverrideV2Disabled"];
  if (v3)
  {
    [(GKPreferences *)self setMultiplayerTransportOverrideV2Enabled:0];
  }
}

- (int64_t)pushEnvironment
{
  return [(GKPreferences *)self integerValueForKey:@"GKPushEnvironment" defaultValue:1];
}

- (void)setPushEnvironment:(int64_t)a3
{
}

- (int64_t)pipeliningSetting
{
  return [(GKPreferences *)self integerValueForKey:@"GKHTTPPipelining" defaultValue:0];
}

- (void)setPipeliningSetting:(int64_t)a3
{
}

- (BOOL)restrictToAutomatch
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKRestrictToAutomatch" defaultValue:0];
}

- (void)setRestrictToAutomatch:(BOOL)a3
{
}

- (unint64_t)maximumInviteVersionSupported
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKMaximumInviteVersionSupported" defaultValue:2];
}

- (void)setMaximumInviteVersionSupported:(unint64_t)a3
{
}

- (unint64_t)recentNumberOfPlayers
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"com.apple.gamecenter.recentnumberofplayers" defaultValue:0];
}

- (void)setRecentNumberOfPlayers:(unint64_t)a3
{
}

- (NSDictionary)recentNumberOfPlayersPerGame
{
  return (NSDictionary *)[(GKPreferences *)self dictionaryValueForKey:@"com.apple.gamecenter.recentnumberofplayerspergame"];
}

- (void)setRecentNumberOfPlayersPerGame:(id)a3
{
}

- (unint64_t)recentNumberOfPlayersForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPreferences *)self recentNumberOfPlayersPerGame];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = [(GKPreferences *)self recentNumberOfPlayers];
  }
  unint64_t v8 = v7;

  return v8;
}

- (void)setRecentNumberOfPlayers:(unint64_t)a3 forBundleID:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = [v6 alloc];
  v9 = [(GKPreferences *)self recentNumberOfPlayersPerGame];
  id v11 = (id)[v8 initWithDictionary:v9];

  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setObject:v10 forKeyedSubscript:v7];

  [(GKPreferences *)self setRecentNumberOfPlayersPerGame:v11];
}

- (NSDictionary)recentPickerSortPreferencePerGame
{
  return (NSDictionary *)[(GKPreferences *)self dictionaryValueForKey:@"com.apple.gamecenter.recentpickersortpreferencepergame"];
}

- (void)setRecentPickerSortPreferencePerGame:(id)a3
{
}

- (int64_t)recentPlayerPickerSortPreferenceForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKPreferences *)self recentPickerSortPreferencePerGame];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v7 = [v6 integerValue];
  }
  else {
    int64_t v7 = -1;
  }

  return v7;
}

- (void)setRecentPlayerPickerSortPreference:(int64_t)a3 forBundleID:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = [v6 alloc];
  v9 = [(GKPreferences *)self recentPickerSortPreferencePerGame];
  id v11 = (id)[v8 initWithDictionary:v9];

  id v10 = [NSNumber numberWithInteger:a3];
  [v11 setObject:v10 forKeyedSubscript:v7];

  [(GKPreferences *)self setRecentPickerSortPreferencePerGame:v11];
}

- (unint64_t)maxPlayersP2P
{
  unint64_t v3 = [(GKPreferences *)self maxDefaultPlayersP2P];

  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKMaxPlayersP2P" defaultValue:v3];
}

- (void)setMaxPlayersP2P:(unint64_t)a3
{
}

- (unint64_t)maxPlayersHosted
{
  unint64_t v3 = [(GKPreferences *)self maxDefaultPlayersHosted];

  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKMaxPlayersHosted" defaultValue:v3];
}

- (void)setMaxPlayersHosted:(unint64_t)a3
{
}

- (unint64_t)maxPlayersTurnBased
{
  unint64_t v3 = [(GKPreferences *)self maxDefaultPlayersTurnBased];

  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKMaxPlayersTurnBased" defaultValue:v3];
}

- (void)setMaxPlayersTurnBased:(unint64_t)a3
{
}

- (unint64_t)maxGameStateSizeTurnBased
{
  unint64_t v3 = [(GKPreferences *)self maxDefaultGameStateSizeTurnBased];

  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKMaxGameStateSizeTurnBased" defaultValue:v3];
}

- (void)setMaxGameStateSizeTurnBased:(unint64_t)a3
{
}

- (unint64_t)exchangeDataMaximumSize
{
  unint64_t v3 = [(GKPreferences *)self exchangeDataDefaultMaximumSize];

  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKExchangeDataMaximumSize" defaultValue:v3];
}

- (void)setExchangeDataMaximumSize:(unint64_t)a3
{
}

- (unint64_t)exchangeMaxInitiatedExchangesPerPlayer
{
  unint64_t v3 = [(GKPreferences *)self exchangeDefaultMaxInitiatedExchangesPerPlayer];

  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKExchangeMaxPerPlayer" defaultValue:v3];
}

- (void)setExchangeMaxInitiatedExchangesPerPlayer:(unint64_t)a3
{
}

- (BOOL)useInternalHeader
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKInternalHeader"];
}

- (void)setUseInternalHeader:(BOOL)a3
{
}

- (double)terminationInterval
{
  [(GKPreferences *)self timeIntervalForKey:@"GKTerminationInterval" defaultValue:30.0];
  return result;
}

- (void)setTerminationInterval:(double)a3
{
}

- (double)garbageCollectionInterval
{
  [(GKPreferences *)self timeIntervalForKey:@"GKGarbageCollectionInterval" defaultValue:300.0];
  return result;
}

- (void)setGarbageCollectionInterval:(double)a3
{
}

- (double)minimumCacheTTL
{
  [(GKPreferences *)self timeIntervalForKey:@"GKMinimumCacheTTL" defaultValue:0.0];
  return result;
}

- (void)setMinimumCacheTTL:(double)a3
{
}

- (double)cacheTTLOverride
{
  [(GKPreferences *)self timeIntervalForKey:@"GKCacheTTLOverride" defaultValue:0.0];
  return result;
}

- (void)setCacheTTLOverride:(double)a3
{
}

+ (id)hostNameForEnvironment:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 7) {
    unint64_t v3 = GKURLComponentHostProduction;
  }
  else {
    unint64_t v3 = off_1E646DDA8[a3 - 3];
  }
  id v4 = *v3;

  return v4;
}

+ (id)displayNameForEnvironment:(int64_t)a3
{
  int64_t v3 = a3 - 3;
  if (unint64_t)(a3 - 3) < 8 && ((0xA7u >> v3))
  {
    id v4 = off_1E646DDE8[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown (%d)", a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (int64_t)environmentForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TD2"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"TD3"])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

- (BOOL)shouldAnnotateImageUsage
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKAnnotateImageUsage"];
}

- (void)setShouldAnnotateImageUsage:(BOOL)a3
{
}

- (BOOL)shouldTrackAtlasImageUsage
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKTrackAtlasUsage"];
}

- (void)setShouldTrackAtlasImageUsage:(BOOL)a3
{
}

- (BOOL)shouldUseTestIcons
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKUseTestGameIcons"];
}

- (void)setShouldUseTestIcons:(BOOL)a3
{
}

- (BOOL)shouldLinkPlayerToICloud
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKLinkICloud" defaultValue:1];
}

- (void)setShouldLinkPlayerToICloud:(BOOL)a3
{
}

- (BOOL)shouldLinkPlayerToTwitter
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKLinkTwitter"];
}

- (void)setShouldLinkPlayerToTwitter:(BOOL)a3
{
}

- (BOOL)shouldLinkPlayerToFacebook
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKLinkFacebook" defaultValue:1];
}

- (void)setShouldLinkPlayerToFacebook:(BOOL)a3
{
}

- (BOOL)shouldDisallowInvitesFromStrangers
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"IncomingMessageAlertFiltration"];
}

- (BOOL)shouldAllowNearbyMultiplayer
{
  id v3 = GKGetRuntimeStrategy();
  int64_t v4 = [v3 localPlayer];

  uint64_t v5 = [v4 isUnderage] ^ 1;
  id v6 = NSString;
  id v7 = [v4 playerID];
  id v8 = [v6 stringWithFormat:@"%@-%@", @"GKAllowNearbyMultiplayer", v7];

  if ([(GKPreferences *)self BOOLeanValueForKey:v8 defaultValue:v5])
  {
    v9 = +[GKPreferences shared];
    int v10 = [v9 isNearbyMultiplayerRestricted] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setShouldAllowNearbyMultiplayer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = GKGetRuntimeStrategy();
  id v9 = [v5 localPlayer];

  id v6 = NSString;
  id v7 = [v9 playerID];
  id v8 = [v6 stringWithFormat:@"%@-%@", @"GKAllowNearbyMultiplayer", v7];

  [(GKPreferences *)self setBooleanValue:v3 forKey:v8];
}

- (BOOL)shouldAllowSharing
{
  BOOL v2 = GKGetRuntimeStrategy();
  BOOL v3 = [v2 localPlayer];

  if ([v3 isUnderage])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v5 = +[GKPreferences shared];
    int v4 = [v5 isSharingRestricted] ^ 1;
  }
  return v4;
}

- (BOOL)shouldAddPlayerInfoToAddressBook
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKShouldAddGameCenterToAddressBook" defaultValue:1];
}

- (void)setShouldAddPlayerInfoToAddressBook:(BOOL)a3
{
}

- (BOOL)notifyAboutScoreSubmissions
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKNotifyScoreSubmit" defaultValue:0];
}

- (void)setNotifyAboutScoreSubmissions:(BOOL)a3
{
}

- (BOOL)shouldAllowCustomCommunication
{
  BOOL v2 = GKGetRuntimeStrategy();
  BOOL v3 = [v2 localPlayer];

  if ([v3 isUnderage])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v5 = +[GKPreferences shared];
    int v4 = [v5 isCustomizedCommunicationRestricted] ^ 1;
  }
  return v4;
}

- (BOOL)multiplayerShouldAlwaysReloadCollectionView
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKMuiltplayerShouldAlwaysReloadCollectionView" defaultValue:0];
}

- (void)setMultiplayerShouldAlwaysReloadCollectionView:(BOOL)a3
{
}

- (void)setMaxRecentPlayersCount:(unint64_t)a3
{
}

- (unint64_t)maxRecentPlayersCount
{
  return [(GKPreferences *)self unsignedIntegerValueForKey:@"GKMaxRecentPlayersCount" defaultValue:200];
}

- (void)setMaxRecentPlayersTime:(double)a3
{
}

- (double)maxRecentPlayersTime
{
  [(GKPreferences *)self timeIntervalForKey:@"GKMaxRecentPlayersTime" defaultValue:5184000.0];
  return result;
}

- (unint64_t)maxDefaultPlayersP2P
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"maxDefaultPlayersP2P"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 16;
  }

  return v4;
}

- (unint64_t)maxDefaultPlayersHosted
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"maxDefaultPlayersHosted"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 16;
  }

  return v4;
}

- (unint64_t)maxDefaultPlayersTurnBased
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"maxDefaultPlayersTurnBased"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 16;
  }

  return v4;
}

- (unint64_t)maxDefaultGameStateSizeTurnBased
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"maxDefaultGameStateSizeTurnBased"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0x10000;
  }

  return v4;
}

- (unint64_t)exchangeDataDefaultMaximumSize
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"exchangeDataDefaultMaximumSize"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 1024;
  }

  return v4;
}

- (unint64_t)exchangeDefaultMaxInitiatedExchangesPerPlayer
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"exchangeDefaultMaxInitiatedExchangesPerPlayer"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 30;
  }

  return v4;
}

- (BOOL)HTTPShouldUsePipelining
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"exchangeDefaultMaxInitiatedExchangesPerPlayer"];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isClipGestureEnabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKUseClipGesture" defaultValue:0];
}

- (void)setClipGestureEnabled:(BOOL)a3
{
}

- (BOOL)fastSyncTransportEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)fetchFriendCodeInExtensionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)easySignInSheetEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)requestHeadersPrivacyEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)dashboardDeepLinkEnabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKDashboardDeepLinkEnabled" defaultValue:1];
}

- (void)setDashboardDeepLinkEnabled:(BOOL)a3
{
}

- (BOOL)multiplayerInGameOverlayEnabled
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKMultiplayerInGameOverlayEnabled" defaultValue:0];
}

- (void)setMultiplayerInGameOverlayEnabled:(BOOL)a3
{
}

- (BOOL)multiplayerHealthCheckEnabled
{
  BOOL v3 = [(GKPreferences *)self BOOLeanValueForKey:@"GKMultiplayerHealthCheckEnabled" defaultValue:0];
  if (v3)
  {
    LOBYTE(v3) = [(GKPreferences *)self isInternalBuild];
  }
  return v3;
}

- (void)setMultiplayerHealthCheckEnabled:(BOOL)a3
{
}

- (void)setInboxContactsOnly:(BOOL)a3
{
}

- (void)setInboxContactsOnly:(BOOL)a3 refresh:(BOOL)a4
{
  BOOL v4 = a4;
  [(GKPreferences *)self setBooleanValue:a3 forKey:@"GKFriendRequestsInboxContactsOnly"];
  if (v4)
  {
    GKGetRuntimeStrategy();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v6 utilityServicePrivate];
    [v5 refreshPreferencesWithDataType:3];
  }
}

- (void)setFakeFriendRequestCount:(int64_t)a3
{
}

- (BOOL)activityFeedTestFeedOnly
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKActivityFeedTestFeedOnly" defaultValue:0];
}

- (void)setActivityFeedTestFeedOnly:(BOOL)a3
{
}

- (double)multiplayerActivityFeedMaxSessionDuration
{
  [(GKPreferences *)self timeIntervalForKey:@"GKMultiplayerActivityFeedMaxSessionDuration" defaultValue:10800.0];
  return result;
}

- (void)setMultiplayerActivityFeedMaxSessionDuration:(double)a3
{
}

- (BOOL)accessPointIsOnAutomatically
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKAccessPointIsOnAutomatically" defaultValue:0];
}

- (void)setAccessPointIsOnAutomatically:(BOOL)a3
{
}

- (BOOL)accessPointShowHighlights
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKAccessPointShowHighlights" defaultValue:1];
}

- (void)setAccessPointShowHighlights:(BOOL)a3
{
}

- (int64_t)accessPointLocation
{
  return [(GKPreferences *)self integerValueForKey:@"GKAccessPointCorner" defaultValue:1];
}

- (void)setAccessPointLocation:(int64_t)a3
{
}

- (BOOL)accessPointCustomTransition
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKAccessPointCustomTransition" defaultValue:0];
}

- (void)setAccessPointCustomTransition:(BOOL)a3
{
}

- (BOOL)supportsChallenges
{
  return [(GKPreferences *)self BOOLeanValueForKey:@"GKSupportsChallenges" defaultValue:0];
}

- (void)setSupportsChallenges:(BOOL)a3
{
}

- (BOOL)isWebKitInspectElementEnabled
{
  return self->_webKitInspectElementEnabled;
}

- (void)setWebKitInspectElementEnabled:(BOOL)a3
{
  self->_webKitInspectElementEnabled = a3;
}

- (void).cxx_destruct
{
}

- (void)setPreferencesDelegate:(id)a3
{
  id value = a3;
  id v4 = [(GKPreferences *)self preferencesDelegate];

  uint64_t v5 = value;
  if (v4 != value)
  {
    id v6 = [(GKPreferences *)self preferencesDelegate];

    if (v6)
    {
      if (value)
      {
LABEL_7:
        objc_setAssociatedObject(self, "GKPreferencesDelegate", value, 0);
        uint64_t v5 = value;
        goto LABEL_8;
      }
      id v7 = [MEMORY[0x1E4F74230] sharedConnection];
      [v7 removeObserver:self];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F74230] sharedConnection];
      [v7 addObserver:self];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (GKPreferencesDelegate)preferencesDelegate
{
  return (GKPreferencesDelegate *)objc_getAssociatedObject(self, "GKPreferencesDelegate");
}

- (BOOL)isStoreDemoModeEnabled
{
  BOOL v2 = [(GKPreferences *)self overrideValueForKey:@"storeDemoModeEnabled"];
  BOOL v3 = v2;
  if (v2)
  {
    LOBYTE(v4) = [v2 BOOLValue];
  }
  else
  {
    CFStringRef v4 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
    if (v4)
    {
      Boolean keyExistsAndHasValidFormat = 0;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", v4, &keyExistsAndHasValidFormat);
      CFRelease(v4);
      if (keyExistsAndHasValidFormat) {
        BOOL v6 = AppBooleanValue == 0;
      }
      else {
        BOOL v6 = 1;
      }
      LOBYTE(v4) = !v6;
    }
  }

  return (char)v4;
}

- (BOOL)isMultiplayerGamingRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F740D0]];
}

- (unint64_t)multiplayerAllowedPlayerType
{
  BOOL v2 = [(GKPreferences *)self valueRestrictionForKey:*MEMORY[0x1E4F74030]];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (void)getMultiplayerAllowedPlayerTypeWithHandler:(id)a3
{
  unint64_t v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [(GKPreferences *)self valueRestrictionForKey:*MEMORY[0x1E4F74030]];
    BOOL v6 = v8;
    if (v5)
    {
      uint64_t v7 = [v5 unsignedIntegerValue];
      BOOL v6 = v8;
    }
    else
    {
      uint64_t v7 = 2;
    }
    v6[2](v8, v7);

    unint64_t v4 = v8;
  }
}

- (BOOL)isAddingFriendsRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F73ED8]];
}

- (BOOL)isAppInstallationRestricted
{
  BOOL v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isUIAppInstallationAllowed] ^ 1;

  return v3;
}

- (BOOL)isAccountModificationRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F73ED0]];
}

- (BOOL)isGameCenterDisabled
{
  if ([(GKPreferences *)self lockedDown]
    || [(GKPreferences *)self isGameCenterRestricted])
  {
    return 1;
  }

  return [(GKPreferences *)self isStoreDemoModeEnabled];
}

- (BOOL)isGameCenterRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F74028]];
}

- (BOOL)isSharingRestricted
{
  return 0;
}

- (BOOL)isProfileModificationRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F74050]];
}

- (BOOL)isCustomizedCommunicationRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F74048]];
}

- (BOOL)isNearbyMultiplayerRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F74040]];
}

- (BOOL)isProfilePrivacyModificationRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F74058]];
}

- (BOOL)isFriendsSharingRestricted
{
  return [(GKPreferences *)self restrictionEnabledForKey:*MEMORY[0x1E4F74038]];
}

- (BOOL)isFriendRequestsRestricted
{
  if ([(GKPreferences *)self isAccountModificationRestricted]
    || [(GKPreferences *)self isAddingFriendsRestricted])
  {
    return 1;
  }

  return [(GKPreferences *)self isGameCenterRestricted];
}

- (BOOL)restrictionEnabledForKey:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F74230];
  id v4 = a3;
  uint64_t v5 = [v3 sharedConnection];
  int v6 = [v5 effectiveBoolValueForSetting:v4];

  return v6 == 2;
}

- (id)valueRestrictionForKey:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F74230];
  id v4 = a3;
  uint64_t v5 = [v3 sharedConnection];
  int v6 = [v5 effectiveValueForSetting:v4];

  return v6;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if ([(GKPreferences *)self isGameCenterRestricted])
  {
    id v5 = [(GKPreferences *)self preferencesDelegate];
    [v5 gameCenterDidBecomeRestricted];
  }
  else
  {
    if (![(GKPreferences *)self isNearbyMultiplayerRestricted]) {
      return;
    }
    id v5 = +[GKPreferences shared];
    [v5 setShouldAllowNearbyMultiplayer:0];
  }
}

@end