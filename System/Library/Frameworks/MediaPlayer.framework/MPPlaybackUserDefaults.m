@interface MPPlaybackUserDefaults
+ (MPPlaybackUserDefaults)standardUserDefaults;
- (BOOL)allowScreenRecording;
- (BOOL)allowsHighQualityMusicStreamingOnCellular;
- (BOOL)archiveSessionArtwork;
- (BOOL)autoPlayEnabledForUserIdentity:(id)a3;
- (BOOL)disableAssetCaching;
- (BOOL)disableAudioAnalysis;
- (BOOL)disableAudioProcessing;
- (BOOL)disableHLSAssetCaching;
- (BOOL)disableMiniSINF;
- (BOOL)disablePeriodicStateRestore;
- (BOOL)disableQHO;
- (BOOL)disableStateRestoration;
- (BOOL)forceDisableUpNext;
- (BOOL)forceLibrarySupplementalContexts;
- (BOOL)forceMusicResolution;
- (BOOL)forceMusicStreaming;
- (BOOL)ignoreDisableUpNext;
- (BOOL)includeContentItemDebugFields;
- (BOOL)isCrossFadeEnabled;
- (BOOL)isProcessTapEnabled;
- (BOOL)prefersSpatialAudio;
- (BOOL)prefersSpatialDownloads;
- (BOOL)prerollEnabled;
- (BOOL)shouldBypassVocalAttenuationDenoising;
- (BOOL)shouldBypassVocalAttenuationSupportFlag;
- (BOOL)shouldPurgeSideLoadedVocalAttenuationModels;
- (BOOL)shouldRecordVocalAttenuationStatistics;
- (BOOL)shouldSkipNextStateRestoration;
- (BOOL)shouldUseRemoteVocalAttenuationModel;
- (BOOL)shouldUseSideLoadedVocalAttenuationModel;
- (BOOL)showDebugUI;
- (BOOL)showLosslessAudio;
- (BOOL)sonicHijack;
- (BOOL)soundCheckEnabled;
- (BOOL)speakerRouteEnabled;
- (BOOL)vocalAttenuationLogInputAndOuputRMSValues;
- (MPPlaybackEQSetting)musicEQSetting;
- (NSDictionary)rewrittenAssetInfo;
- (NSNumber)delayAssetLoadDuration;
- (NSNumber)delayQueueLoadDuration;
- (NSNumber)forcedIntentDestination;
- (NSNumber)isDevicePrivateListeningEnabled;
- (NSNumber)isFocusModePrivateListeningEnabled;
- (NSNumber)isPrivateListeningEnabled;
- (NSNumber)progressiveDownloadAssetRatio;
- (NSString)vocalAttenuationStatisticsName;
- (double)HomePodPFSQForcedLeaseRenewThreshold;
- (double)activationDelay;
- (double)assetURLExpirationDuration;
- (double)crossFadeDuration;
- (double)forwardBufferDuration;
- (double)unloadingPlaybackAssetsOnIdleDuration;
- (double)vocalAttenuationGracePeriodAfterPause;
- (float)audioTapTimeOutRatioForFailureDetection;
- (float)defaultVocalLevel;
- (float)minVocalLevel;
- (float)playbackRate;
- (id)_init;
- (int64_t)artworkCacheLimit;
- (int64_t)exportableArtworkCacheLimit;
- (int64_t)forcedMusicResolution;
- (int64_t)maximumQueueHandOffSize;
- (int64_t)musicRepeatType;
- (int64_t)musicShuffleType;
- (int64_t)preferredMusicDownloadResolution;
- (int64_t)preferredMusicHighBandwidthResolution;
- (int64_t)preferredMusicLowBandwidthResolution;
- (int64_t)preferredVideoDownloadResolution;
- (int64_t)preferredVideoHighBandwidthResolution;
- (int64_t)preferredVideoLowBandwidthResolution;
- (int64_t)spatialAudioPreference;
- (unint64_t)audioAnalysisRefreshRate;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_loadAccountProperties;
- (void)_migrateUserDefaults;
- (void)clearShouldSkipNextStateRestoration;
- (void)dealloc;
- (void)resetAllInternalSettings;
- (void)setAutoPlayEnabled:(BOOL)a3 forUserIdentity:(id)a4;
- (void)setCrossFadeDuration:(double)a3;
- (void)setCrossFadeEnabled:(BOOL)a3;
- (void)setFocusModePrivateListeningEnabled:(id)a3;
- (void)setMusicRepeatType:(int64_t)a3;
- (void)setMusicShuffleType:(int64_t)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPreferredMusicDownloadResolution:(int64_t)a3;
- (void)setPreferredMusicHighBandwidthResolution:(int64_t)a3;
- (void)setPreferredMusicLowBandwidthResolution:(int64_t)a3;
- (void)setPrefersSpatialAudio:(BOOL)a3;
- (void)setPrefersSpatialDownloads:(BOOL)a3;
- (void)setPrivateListeningEnabled:(id)a3;
- (void)setShowLosslessAudio:(BOOL)a3;
- (void)setSoundCheckEnabled:(BOOL)a3;
- (void)setSpatialAudioPreference:(int64_t)a3;
@end

@implementation MPPlaybackUserDefaults

void __46__MPPlaybackUserDefaults_standardUserDefaults__block_invoke()
{
  id v0 = [[MPPlaybackUserDefaults alloc] _init];
  v1 = (void *)standardUserDefaults___defaults;
  standardUserDefaults___defaults = (uint64_t)v0;
}

- (id)_init
{
  v46[26] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)MPPlaybackUserDefaults;
  v2 = [(MPPlaybackUserDefaults *)&v38 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaPlayer/MPPlaybackUserDefaults", v3);
    accountsQueue = v2->_accountsQueue;
    v2->_accountsQueue = (OS_dispatch_queue *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileipod"];
    iPodUserDefaults = v2->_iPodUserDefaults;
    v2->_iPodUserDefaults = (NSUserDefaults *)v6;

    v8 = v2->_iPodUserDefaults;
    v45[0] = @"MusicRepeatSetting";
    v45[1] = @"MusicShuffleSetting";
    v46[0] = @"Off";
    v46[1] = @"Off";
    v45[2] = @"PodcastsPlaybackRate";
    v45[3] = @"MusicLowBandwidthResolution";
    v46[2] = &unk_1EE6EE3F0;
    v46[3] = &unk_1EE6ED160;
    v45[4] = @"MusicHighBandwidthResolution";
    v45[5] = @"MusicDownloadResolution";
    v46[4] = &unk_1EE6ED178;
    v46[5] = &unk_1EE6ED178;
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    v45[6] = @"MusicSoundCheckEnabledSetting";
    v45[7] = @"CrossFadeEnabled";
    v46[6] = MEMORY[0x1E4F1CC38];
    v46[7] = MEMORY[0x1E4F1CC28];
    v45[8] = @"CrossFadeDuration";
    v45[9] = @"SpatialAudioPreference";
    v46[8] = &unk_1EE6ED190;
    v46[9] = &unk_1EE6ED1A8;
    v45[10] = @"MusicMinVocalLevel";
    v45[11] = @"MusicDefaultVocalLevel";
    v46[10] = &unk_1EE6ED1C0;
    v46[11] = &unk_1EE6ED1D8;
    v45[12] = @"AllowScreenRecording";
    v45[13] = @"QHOMaximumSize";
    v46[12] = MEMORY[0x1E4F1CC28];
    v46[13] = &unk_1EE6ED1F0;
    v45[14] = @"EnableProcessTap";
    v45[15] = @"AudioAnalysisRefreshRate";
    v46[14] = MEMORY[0x1E4F1CC38];
    v46[15] = &unk_1EE6ED208;
    v45[16] = @"ForcedMusicResolution";
    v45[17] = @"ForwardBufferDuration";
    v46[16] = &unk_1EE6ED178;
    v46[17] = &unk_1EE6EE400;
    v45[18] = @"PrerollEnabled";
    v45[19] = @"AssetURLExpirationDuration";
    v46[18] = MEMORY[0x1E4F1CC28];
    v46[19] = &unk_1EE6ED220;
    v45[20] = @"PurgeSideLoadedVocalAttenuationModels";
    v45[21] = @"BypassVocalAttenuationDenoising";
    v46[20] = MEMORY[0x1E4F1CC38];
    v46[21] = MEMORY[0x1E4F1CC38];
    v45[22] = @"BypassVocalAttenuationSupportFlag";
    v45[23] = @"UseRemoteVocalAttenuationModel";
    v46[22] = MEMORY[0x1E4F1CC28];
    v46[23] = MEMORY[0x1E4F1CC28];
    v45[24] = @"AudioTapTimeOutRatioForFailureDetection";
    v45[25] = @"VocalAttenuationGracePeriodAfterPause";
    v46[24] = &unk_1EE6EE3F0;
    v46[25] = &unk_1EE6ED238;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:26];
    [(NSUserDefaults *)v8 registerDefaults:v10];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.videos-preferences"];
    videoUserDefaults = v2->_videoUserDefaults;
    v2->_videoUserDefaults = (NSUserDefaults *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mediaplaybackcore"];
    mediaPlaybackCoreUserDefaults = v2->_mediaPlaybackCoreUserDefaults;
    v2->_mediaPlaybackCoreUserDefaults = (NSUserDefaults *)v13;

    if (MSVCurrentProcessIsNonUIPlaybackService()) {
      uint64_t v15 = 20;
    }
    else {
      uint64_t v15 = 200;
    }
    v16 = v2->_mediaPlaybackCoreUserDefaults;
    v44[0] = &unk_1EE6ED250;
    v43[0] = @"HomePodPFSQForcedLeaseRenewThreshold";
    v43[1] = @"ArtworkCacheLimit";
    v17 = [NSNumber numberWithInteger:v15];
    v44[1] = v17;
    v43[2] = @"ExportableArtworkCacheLimit";
    v18 = [NSNumber numberWithInteger:v15];
    v44[2] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
    [(NSUserDefaults *)v16 registerDefaults:v19];

    if (MSVDeviceIsAudioAccessory())
    {
      v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v41 = @"MPUnloadingPlaybackAssetsOnIdleDuration";
      v42 = &unk_1EE6ED238;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      [v20 registerDefaults:v21];
    }
    if (MSVDeviceIsAudioAccessory())
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.airplay"];
      airplayUserDefaults = v2->_airplayUserDefaults;
      v2->_airplayUserDefaults = (NSUserDefaults *)v22;

      v24 = v2->_airplayUserDefaults;
      v39 = @"BufferedSurroundSwitch";
      uint64_t v40 = v9;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      [(NSUserDefaults *)v24 registerDefaults:v25];
    }
    [(MPPlaybackUserDefaults *)v2 _migrateUserDefaults];
    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    autoplaySettingCache = v2->_autoplaySettingCache;
    v2->_autoplaySettingCache = (NSMutableDictionary *)v26;

    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __31__MPPlaybackUserDefaults__init__block_invoke;
    v36 = &unk_1E57F3C90;
    v28 = v2;
    v37 = v28;
    v29 = MEMORY[0x1E4F14428];
    notify_register_dispatch("com.apple.mobileipod-prefsChanged", &v2->_notifyTokens.mobileiPodPrefsChanged, MEMORY[0x1E4F14428], &v33);
    notify_register_dispatch("com.apple.videos-preferences-changed", v28 + 17, v29, &__block_literal_global_292);

    if (MSVDeviceIsAudioAccessory())
    {
      v30 = (void *)MEMORY[0x1E4F14428];
      notify_register_dispatch("com.apple.airplay.prefsChanged", v28 + 18, MEMORY[0x1E4F14428], &__block_literal_global_294);
    }
    v31 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v33, v34, v35, v36);
    [v31 addObserver:v28 selector:sel__accountStoreChangedNotification_ name:*MEMORY[0x1E4FB8578] object:0];

    [v28 _loadAccountProperties];
  }
  return v2;
}

- (void)_migrateUserDefaults
{
  if ((MSVDeviceOSIsInternalInstall() & 1) == 0) {
    [(MPPlaybackUserDefaults *)self resetAllInternalSettings];
  }
  v3 = [(NSUserDefaults *)self->_iPodUserDefaults objectForKey:@"MusicAllowsCellularData"];
  id v7 = v3;
  if (v3)
  {
    int v4 = [v3 BOOLValue];
    if (v4
      && ![(MPPlaybackUserDefaults *)self preferredMusicLowBandwidthResolution])
    {
      [(MPPlaybackUserDefaults *)self setPreferredMusicLowBandwidthResolution:64];
    }
    [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"MusicAllowsCellularData"];
    v5 = [(NSUserDefaults *)self->_iPodUserDefaults objectForKey:@"MusicAllowsHighQualityStreamingOnCellular"];
    uint64_t v6 = v5;
    if (v5)
    {
      if ((v4 & [v5 BOOLValue]) == 1
        && [(MPPlaybackUserDefaults *)self preferredMusicLowBandwidthResolution] <= 255)
      {
        [(MPPlaybackUserDefaults *)self setPreferredMusicLowBandwidthResolution:256];
      }
      [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"MusicAllowsHighQualityStreamingOnCellular"];
    }
  }
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"MusicVocalLevel"];
}

- (void)_loadAccountProperties
{
  accountsQueue = self->_accountsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(accountsQueue, block);
}

- (BOOL)disableQHO
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisableQHO"];
  }
  return v3;
}

void __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB87B8] activeAccount];
  int v3 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v14 = 0;
  int v4 = [v3 getPropertiesForUserIdentity:v2 error:&v14];
  id v5 = v14;

  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543618;
      v16 = v2;
      __int16 v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "MPPlaybackUserDefaults: _loadAccountProperties: getPropertiesForUserIdentity: identity=%{public}@ error=%{public}@", buf, 0x16u);
    }
  }
  if (v4)
  {
    id v8 = [v4 privateListeningEnabled];
    id v9 = [*(id *)(a1 + 32) isDevicePrivateListeningEnabled];
    if (v8 == v9)
    {
    }
    else
    {
      char v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0)
      {
        char IsAudioAccessory = MSVDeviceIsAudioAccessory();

        if ((IsAudioAccessory & 1) == 0)
        {
          [*(id *)(*(void *)(a1 + 32) + 24) setObject:v8 forKey:@"MPCPlaybackPrivateListeningEnabled"];
          v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v12 postNotificationName:@"MPPlaybackUserDefaultsPrivateListeningEnabledDidChangeNotification" object:*(void *)(a1 + 32)];
          goto LABEL_14;
        }
LABEL_12:
        if (v8)
        {
LABEL_15:

          goto LABEL_16;
        }
        v12 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke_311;
        v13[3] = &unk_1E57F3CD8;
        v13[4] = *(void *)(a1 + 32);
        [v12 updatePropertiesForUserIdentity:v2 usingBlock:v13];
LABEL_14:

        goto LABEL_15;
      }
    }

    goto LABEL_12;
  }
LABEL_16:
}

+ (MPPlaybackUserDefaults)standardUserDefaults
{
  if (standardUserDefaults_onceToken != -1) {
    dispatch_once(&standardUserDefaults_onceToken, &__block_literal_global_30216);
  }
  v2 = (void *)standardUserDefaults___defaults;

  return (MPPlaybackUserDefaults *)v2;
}

- (BOOL)includeContentItemDebugFields
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"IncludeContentItemDebugFields"];
  }
  return v3;
}

- (int64_t)exportableArtworkCacheLimit
{
  return [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults integerForKey:@"ExportableArtworkCacheLimit"];
}

- (int64_t)artworkCacheLimit
{
  return [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults integerForKey:@"ArtworkCacheLimit"];
}

- (BOOL)showDebugUI
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"ShowDebugUI"];
  }
  return v3;
}

- (float)minVocalLevel
{
  [(NSUserDefaults *)self->_iPodUserDefaults floatForKey:@"MusicMinVocalLevel"];
  return fminf(fmaxf(v2, 1.0), 99.0);
}

- (NSNumber)isFocusModePrivateListeningEnabled
{
  return (NSNumber *)[(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults objectForKey:@"MPCPlaybackFocusModePrivateListeningEnabled"];
}

- (float)defaultVocalLevel
{
  [(NSUserDefaults *)self->_iPodUserDefaults floatForKey:@"MusicDefaultVocalLevel"];
  return result;
}

- (BOOL)shouldBypassVocalAttenuationSupportFlag
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"BypassVocalAttenuationSupportFlag"];
  }
  return v3;
}

- (int64_t)maximumQueueHandOffSize
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 2000;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults integerForKey:@"QHOMaximumSize"];
}

- (BOOL)sonicHijack
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"SonicHijack"];
  }
  return v3;
}

- (int64_t)spatialAudioPreference
{
  if (!MSVDeviceSupportsMultiChannelMusic()) {
    return 0;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults integerForKey:@"SpatialAudioPreference"];
}

- (BOOL)shouldUseRemoteVocalAttenuationModel
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"UseRemoteVocalAttenuationModel"];
  }
  return v3;
}

- (NSNumber)isDevicePrivateListeningEnabled
{
  float v2 = NSNumber;
  BOOL v3 = [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults BOOLForKey:@"MPCPlaybackPrivateListeningEnabled"];

  return (NSNumber *)[v2 numberWithBool:v3];
}

- (BOOL)shouldUseSideLoadedVocalAttenuationModel
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"UseSideLoadedVocalAttenuationModel"];
  }
  return v3;
}

- (BOOL)shouldSkipNextStateRestoration
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"_MPCSkipNextStateRestoration"];
  }
  return v3;
}

- (BOOL)forceLibrarySupplementalContexts
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"ForceLibrarySupplemental"];
  }
  return v3;
}

- (BOOL)disableStateRestoration
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisableStateRestoration"];
  }
  return v3;
}

- (BOOL)isProcessTapEnabled
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 1;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"EnableProcessTap"];
}

- (float)audioTapTimeOutRatioForFailureDetection
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 1.0;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  [(NSUserDefaults *)iPodUserDefaults floatForKey:@"AudioTapTimeOutRatioForFailureDetection"];
  return result;
}

- (unint64_t)audioAnalysisRefreshRate
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 30;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults integerForKey:@"AudioAnalysisRefreshRate"];
}

- (BOOL)disableAudioAnalysis
{
  if (MSVDeviceIsAppleTV())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = MSVDeviceOSIsInternalInstall();
    if (v3)
    {
      iPodUserDefaults = self->_iPodUserDefaults;
      LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisableAudioAnalysis"];
    }
  }
  return v3;
}

- (NSNumber)progressiveDownloadAssetRatio
{
  if (MSVDeviceOSIsInternalInstall())
  {
    int v3 = [(NSUserDefaults *)self->_iPodUserDefaults objectForKey:@"ProgressiveDownloadAssetRatio"];
    if (_NSIsNSNumber()) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)delayQueueLoadDuration
{
  if (MSVDeviceOSIsInternalInstall())
  {
    int v3 = [(NSUserDefaults *)self->_iPodUserDefaults objectForKey:@"DelayQueueLoad"];
    if (_NSIsNSNumber()) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (BOOL)archiveSessionArtwork
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"ArchiveSessionArtwork"];
  }
  return v3;
}

- (NSNumber)isPrivateListeningEnabled
{
  float v2 = NSNumber;
  BOOL v3 = [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults BOOLForKey:@"MPCPlaybackPrivateListeningEnabled"];

  return (NSNumber *)[v2 numberWithBool:v3];
}

- (MPPlaybackEQSetting)musicEQSetting
{
  float v2 = [(NSUserDefaults *)self->_iPodUserDefaults stringForKey:@"MusicEQPresetName"];
  BOOL v3 = +[MPPlaybackEQSetting settingWithName:v2];

  return (MPPlaybackEQSetting *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsQueue, 0);
  objc_storeStrong((id *)&self->_autoplaySettingCache, 0);
  objc_storeStrong((id *)&self->_airplayUserDefaults, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackCoreUserDefaults, 0);
  objc_storeStrong((id *)&self->_videoUserDefaults, 0);

  objc_storeStrong((id *)&self->_iPodUserDefaults, 0);
}

- (int64_t)preferredVideoDownloadResolution
{
  return self->_preferredVideoDownloadResolution;
}

- (void)_accountStoreChangedNotification:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_autoplaySettingCache removeAllObjects];
  os_unfair_lock_unlock(p_lock);

  [(MPPlaybackUserDefaults *)self _loadAccountProperties];
}

void __48__MPPlaybackUserDefaults__loadAccountProperties__block_invoke_311(uint64_t a1, void *a2)
{
  float v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 isDevicePrivateListeningEnabled];
  [v3 setPrivateListeningEnabled:v4];
}

- (void)resetAllInternalSettings
{
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"AudioAnalysisRefreshRate"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisableAssetCaching"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisableHLSAssetCaching"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisableAudioAnalysis"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisableAudioProcessing"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisableMiniSINF"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisablePeriodicRestore"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisableQHO"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DisableStateRestoration"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"EnableProcessTap"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ForceMusicResolution"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ForcedMusicResolution"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ForceLibrarySupplemental"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"IncludeContentItemDebugFields"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ProgressiveDownloadAssetRatio"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"QHOMaximumSize"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ShowDebugUI"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"SpeakerRouteEnabled"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"AssetURLExpirationDuration"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ActivationDelay"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ForwardBufferDuration"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"PrerollEnabled"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ArchiveSessionArtwork"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"PurgeSideLoadedVocalAttenuationModels"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"RecordVocalAttenuationStatistics"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"VocalAttenuationStatisticsName"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"BypassVocalAttenuationDenoising"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"BypassVocalAttenuationSupportFlag"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"UseRemoteVocalAttenuationModel"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"UseSideLoadedVocalAttenuationModel"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"AudioTapTimeOutRatioForFailureDetection"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"VocalAttenuationGracePeriodAfterPause"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"VocalAttenuationLogInputAndOuputRMSValues"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ForceIntentDestination"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DelayQueueLoad"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"DelayAssetLoad"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"ForceDisableUpNext"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"IgnoreDisableUpNext"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"_MPCSkipNextStateRestoration"];
  [(NSUserDefaults *)self->_iPodUserDefaults removeObjectForKey:@"SonicHijack"];
  [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults removeObjectForKey:@"MPCRewrittenAssetInfo"];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObjectForKey:@"MPUnloadingPlaybackAssetsOnIdleDuration"];
}

- (NSDictionary)rewrittenAssetInfo
{
  if (MSVDeviceOSIsInternalInstall())
  {
    id v3 = [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults objectForKey:@"MPCRewrittenAssetInfo"];
    if (_NSIsNSDictionary()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (double)unloadingPlaybackAssetsOnIdleDuration
{
  float v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"MPUnloadingPlaybackAssetsOnIdleDuration"];
  double v4 = v3;

  return v4;
}

- (double)HomePodPFSQForcedLeaseRenewThreshold
{
  [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults doubleForKey:@"HomePodPFSQForcedLeaseRenewThreshold"];
  return result;
}

- (void)clearShouldSkipNextStateRestoration
{
}

- (BOOL)ignoreDisableUpNext
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"IgnoreDisableUpNext"];
  }
  return v3;
}

- (BOOL)forceDisableUpNext
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"ForceDisableUpNext"];
  }
  return v3;
}

- (NSNumber)delayAssetLoadDuration
{
  if (MSVDeviceOSIsInternalInstall())
  {
    int v3 = [(NSUserDefaults *)self->_iPodUserDefaults objectForKey:@"DelayAssetLoad"];
    if (_NSIsNSNumber()) {
      double v4 = v3;
    }
    else {
      double v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)forcedIntentDestination
{
  if (MSVDeviceOSIsInternalInstall())
  {
    int v3 = [(NSUserDefaults *)self->_iPodUserDefaults objectForKey:@"ForceIntentDestination"];
    if (_NSIsNSNumber()) {
      double v4 = v3;
    }
    else {
      double v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (NSNumber *)v5;
}

- (BOOL)vocalAttenuationLogInputAndOuputRMSValues
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"VocalAttenuationLogInputAndOuputRMSValues"];
  }
  return v3;
}

- (double)vocalAttenuationGracePeriodAfterPause
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 480.0;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  [(NSUserDefaults *)iPodUserDefaults doubleForKey:@"VocalAttenuationGracePeriodAfterPause"];
  return result;
}

- (BOOL)shouldBypassVocalAttenuationDenoising
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 1;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"BypassVocalAttenuationDenoising"];
}

- (NSString)vocalAttenuationStatisticsName
{
  if (MSVDeviceOSIsInternalInstall())
  {
    int v3 = [(NSUserDefaults *)self->_iPodUserDefaults stringForKey:@"VocalAttenuationStatisticsName"];
  }
  else
  {
    int v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)shouldRecordVocalAttenuationStatistics
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"RecordVocalAttenuationStatistics"];
  }
  return v3;
}

- (BOOL)shouldPurgeSideLoadedVocalAttenuationModels
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 1;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"PurgeSideLoadedVocalAttenuationModels"];
}

- (BOOL)prerollEnabled
{
  if (MSVDeviceIsHomePod())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = MSVDeviceOSIsInternalInstall();
    if (v3)
    {
      iPodUserDefaults = self->_iPodUserDefaults;
      LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"PrerollEnabled"];
    }
  }
  return v3;
}

- (double)forwardBufferDuration
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 120.0;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  [(NSUserDefaults *)iPodUserDefaults doubleForKey:@"ForwardBufferDuration"];
  return result;
}

- (double)activationDelay
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 0.0;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  [(NSUserDefaults *)iPodUserDefaults doubleForKey:@"ActivationDelay"];
  return result;
}

- (double)assetURLExpirationDuration
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 604800.0;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  [(NSUserDefaults *)iPodUserDefaults doubleForKey:@"AssetURLExpirationDuration"];
  return result;
}

- (BOOL)speakerRouteEnabled
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"SpeakerRouteEnabled"];
  }
  return v3;
}

- (BOOL)forceMusicStreaming
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"ForceMusicStreaming"];
  }
  return v3;
}

- (int64_t)forcedMusicResolution
{
  if (!MSVDeviceOSIsInternalInstall()) {
    return 0;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults integerForKey:@"ForcedMusicResolution"];
}

- (BOOL)forceMusicResolution
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"ForceMusicResolution"];
  }
  return v3;
}

- (BOOL)disablePeriodicStateRestore
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisablePeriodicRestore"];
  }
  return v3;
}

- (BOOL)disableMiniSINF
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisableMiniSINF"];
  }
  return v3;
}

- (BOOL)disableAudioProcessing
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisableAudioProcessing"];
  }
  return v3;
}

- (BOOL)disableHLSAssetCaching
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisableHLSAssetCaching"];
  }
  return v3;
}

- (BOOL)disableAssetCaching
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"DisableAssetCaching"];
  }
  return v3;
}

- (BOOL)allowScreenRecording
{
  int v3 = MSVDeviceOSIsInternalInstall();
  if (v3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)iPodUserDefaults BOOLForKey:@"AllowScreenRecording"];
  }
  return v3;
}

- (BOOL)allowsHighQualityMusicStreamingOnCellular
{
  return [(NSUserDefaults *)self->_iPodUserDefaults integerForKey:@"MusicLowBandwidthResolution"] > 64;
}

- (int64_t)preferredVideoHighBandwidthResolution
{
  int64_t v2 = 1000000;
  int v3 = [(NSUserDefaults *)self->_videoUserDefaults stringForKey:@"PlaybackQuality"];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
    if (v5 != @"BestQuality")
    {
      uint64_t v6 = v5;
      int v7 = [(__CFString *)v5 isEqual:@"BestQuality"];

      if (!v7) {
        int64_t v2 = 1000;
      }
    }
  }

  return v2;
}

- (int64_t)preferredVideoLowBandwidthResolution
{
  int64_t v2 = [(NSUserDefaults *)self->_videoUserDefaults stringForKey:@"PlaybackQualityCellular"];
  int v3 = v2;
  if (v2 == @"BestQuality"
    || (int v4 = [(__CFString *)v2 isEqual:@"BestQuality"], v3, v4))
  {
    int64_t v5 = 1000000;
  }
  else
  {
    int64_t v5 = 1000;
  }

  return v5;
}

- (void)setShowLosslessAudio:(BOOL)a3
{
}

- (BOOL)showLosslessAudio
{
  return [(NSUserDefaults *)self->_iPodUserDefaults BOOLForKey:@"ShowLosslessAudio"];
}

- (void)setPrefersSpatialDownloads:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPPlaybackUserDefaults *)self prefersSpatialDownloads] != a3)
  {
    [(NSUserDefaults *)self->_iPodUserDefaults setBool:v3 forKey:@"PrefersSpatialDownloads"];
    int64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:self];

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (BOOL)prefersSpatialDownloads
{
  return [(NSUserDefaults *)self->_iPodUserDefaults BOOLForKey:@"PrefersSpatialDownloads"];
}

- (void)setPrefersSpatialAudio:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(MPPlaybackUserDefaults *)self setSpatialAudioPreference:v3];
}

- (BOOL)prefersSpatialAudio
{
  return [(MPPlaybackUserDefaults *)self spatialAudioPreference] != 0;
}

- (void)setSpatialAudioPreference:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(MPPlaybackUserDefaults *)self spatialAudioPreference] != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    uint64_t v6 = (char *)&v13 + 1;
    int64_t quot = a3;
    do
    {
      ldiv_t v8 = ldiv(quot, 10);
      int64_t quot = v8.quot;
      if (v8.rem >= 0) {
        LOBYTE(v9) = v8.rem;
      }
      else {
        uint64_t v9 = -v8.rem;
      }
      *(v6 - 2) = v9 + 48;
      char v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      char v10 = (const UInt8 *)(v6 - 2);
    }
    uint64_t v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    [(NSUserDefaults *)iPodUserDefaults setObject:v11 forKey:@"SpatialAudioPreference"];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:self];

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (void)setPreferredMusicDownloadResolution:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(MPPlaybackUserDefaults *)self preferredMusicDownloadResolution] != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    uint64_t v6 = (char *)&v13 + 1;
    int64_t quot = a3;
    do
    {
      ldiv_t v8 = ldiv(quot, 10);
      int64_t quot = v8.quot;
      if (v8.rem >= 0) {
        LOBYTE(v9) = v8.rem;
      }
      else {
        uint64_t v9 = -v8.rem;
      }
      *(v6 - 2) = v9 + 48;
      char v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      char v10 = (const UInt8 *)(v6 - 2);
    }
    uint64_t v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    [(NSUserDefaults *)iPodUserDefaults setObject:v11 forKey:@"MusicDownloadResolution"];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:self];

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (int64_t)preferredMusicDownloadResolution
{
  return [(NSUserDefaults *)self->_iPodUserDefaults integerForKey:@"MusicDownloadResolution"];
}

- (void)setPreferredMusicHighBandwidthResolution:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(MPPlaybackUserDefaults *)self preferredMusicHighBandwidthResolution] != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    uint64_t v6 = (char *)&v13 + 1;
    int64_t quot = a3;
    do
    {
      ldiv_t v8 = ldiv(quot, 10);
      int64_t quot = v8.quot;
      if (v8.rem >= 0) {
        LOBYTE(v9) = v8.rem;
      }
      else {
        uint64_t v9 = -v8.rem;
      }
      *(v6 - 2) = v9 + 48;
      char v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      char v10 = (const UInt8 *)(v6 - 2);
    }
    uint64_t v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    [(NSUserDefaults *)iPodUserDefaults setObject:v11 forKey:@"MusicHighBandwidthResolution"];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:self];

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (int64_t)preferredMusicHighBandwidthResolution
{
  if (MSVDeviceIsAudioAccessory()
    && [(NSUserDefaults *)self->_airplayUserDefaults BOOLForKey:@"BufferedLosslessSwitch"])
  {
    return 48000;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults integerForKey:@"MusicHighBandwidthResolution"];
}

- (void)setPreferredMusicLowBandwidthResolution:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(MPPlaybackUserDefaults *)self preferredMusicLowBandwidthResolution] != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    uint64_t v6 = (char *)&v13 + 1;
    int64_t quot = a3;
    do
    {
      ldiv_t v8 = ldiv(quot, 10);
      int64_t quot = v8.quot;
      if (v8.rem >= 0) {
        LOBYTE(v9) = v8.rem;
      }
      else {
        uint64_t v9 = -v8.rem;
      }
      *(v6 - 2) = v9 + 48;
      char v10 = (const UInt8 *)(v6 - 2);
      --v6;
    }
    while (v8.quot);
    if (a3 < 0)
    {
      *(v6 - 2) = 45;
      char v10 = (const UInt8 *)(v6 - 2);
    }
    uint64_t v11 = (__CFString *)CFStringCreateWithBytes(0, v10, (char *)&v13 - (char *)v10, 0x8000100u, 0);
    [(NSUserDefaults *)iPodUserDefaults setObject:v11 forKey:@"MusicLowBandwidthResolution"];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:self];

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (int64_t)preferredMusicLowBandwidthResolution
{
  if (MSVDeviceIsAudioAccessory()
    && [(NSUserDefaults *)self->_airplayUserDefaults BOOLForKey:@"BufferedLosslessSwitch"])
  {
    return 48000;
  }
  iPodUserDefaults = self->_iPodUserDefaults;

  return [(NSUserDefaults *)iPodUserDefaults integerForKey:@"MusicLowBandwidthResolution"];
}

- (void)setFocusModePrivateListeningEnabled:(id)a3
{
  [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults setObject:a3 forKey:@"MPCPlaybackFocusModePrivateListeningEnabled"];
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 postNotificationName:@"MPPlaybackUserDefaultsPrivateListeningEnabledDidChangeNotification" object:0];
}

- (void)setPrivateListeningEnabled:(id)a3
{
  id v4 = a3;
  [(NSUserDefaults *)self->_mediaPlaybackCoreUserDefaults setObject:v4 forKey:@"MPCPlaybackPrivateListeningEnabled"];
  int64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 postNotificationName:@"MPPlaybackUserDefaultsPrivateListeningEnabledDidChangeNotification" object:0];

  accountsQueue = self->_accountsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke;
  block[3] = &unk_1E57F9EA8;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(accountsQueue, block);
}

void __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke(uint64_t a1)
{
  int64_t v2 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke_2;
  v4[3] = &unk_1E57F3CD8;
  id v5 = *(id *)(a1 + 32);
  [v2 updatePropertiesForUserIdentity:v3 usingBlock:v4];
}

uint64_t __53__MPPlaybackUserDefaults_setPrivateListeningEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPrivateListeningEnabled:*(void *)(a1 + 32)];
}

- (void)setCrossFadeDuration:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(MPPlaybackUserDefaults *)self crossFadeDuration];
  if (v5 != a3)
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [(MPPlaybackUserDefaults *)self crossFadeDuration];
      int v8 = 134218240;
      uint64_t v9 = v7;
      __int16 v10 = 2048;
      double v11 = a3;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setCrossFadeDuration: %2.1fs -> %2.1fs", (uint8_t *)&v8, 0x16u);
    }

    [(NSUserDefaults *)self->_iPodUserDefaults setDouble:@"CrossFadeDuration" forKey:a3];
  }
}

- (double)crossFadeDuration
{
  [(NSUserDefaults *)self->_iPodUserDefaults doubleForKey:@"CrossFadeDuration"];
  return result;
}

- (void)setCrossFadeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(MPPlaybackUserDefaults *)self isCrossFadeEnabled] != a3)
  {
    double v5 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109376;
      v6[1] = [(MPPlaybackUserDefaults *)self isCrossFadeEnabled];
      __int16 v7 = 1024;
      BOOL v8 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setCrossFadeEnabled: %{BOOL}u -> %{BOOL}u", (uint8_t *)v6, 0xEu);
    }

    [(NSUserDefaults *)self->_iPodUserDefaults setBool:v3 forKey:@"CrossFadeEnabled"];
  }
}

- (BOOL)isCrossFadeEnabled
{
  return [(NSUserDefaults *)self->_iPodUserDefaults BOOLForKey:@"CrossFadeEnabled"];
}

- (void)setSoundCheckEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(MPPlaybackUserDefaults *)self soundCheckEnabled] != a3)
  {
    double v5 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = [(MPPlaybackUserDefaults *)self soundCheckEnabled];
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setSoundCheckEnable: %{BOOL}u -> %{BOOL}u", (uint8_t *)v8, 0xEu);
    }

    [(NSUserDefaults *)self->_iPodUserDefaults setBool:v3 forKey:@"MusicSoundCheckEnabledSetting"];
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MPPlaybackUserDefaultsSoundCheckEnabledDidChangeNotification" object:self];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileipod-prefsChanged", 0, 0, 1u);
  }
}

- (BOOL)soundCheckEnabled
{
  return [(NSUserDefaults *)self->_iPodUserDefaults BOOLForKey:@"MusicSoundCheckEnabledSetting"];
}

- (void)setMusicShuffleType:(int64_t)a3
{
  if (a3 != 1000)
  {
    MPNSStringFromShuffleType(a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(NSUserDefaults *)self->_iPodUserDefaults setObject:v6 forKey:@"MusicShuffleSetting"];
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MPPlaybackUserDefaultsMusicShuffleTypeDidChangeNotification" object:self];

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (int64_t)musicShuffleType
{
  int64_t v2 = [(NSUserDefaults *)self->_iPodUserDefaults stringForKey:@"MusicShuffleSetting"];
  int64_t v3 = MPShuffleTypeFromNSString(v2);

  return v3;
}

- (void)setMusicRepeatType:(int64_t)a3
{
  if (a3 != 3)
  {
    MPNSStringFromRepeatType(a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(NSUserDefaults *)self->_iPodUserDefaults setObject:v6 forKey:@"MusicRepeatSetting"];
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MPPlaybackUserDefaultsMusicRepeatTypeDidChangeNotification" object:self];

    notify_post("com.apple.mobileipod-prefsChanged");
  }
}

- (void)setPlaybackRate:(float)a3
{
  [(MPPlaybackUserDefaults *)self playbackRate];
  if (*(float *)&v5 != a3)
  {
    iPodUserDefaults = self->_iPodUserDefaults;
    *(float *)&double v5 = a3;
    [(NSUserDefaults *)iPodUserDefaults setFloat:@"PodcastsPlaybackRate" forKey:v5];
  }
}

- (float)playbackRate
{
  [(NSUserDefaults *)self->_iPodUserDefaults floatForKey:@"PodcastsPlaybackRate"];
  return result;
}

- (int64_t)musicRepeatType
{
  int64_t v2 = [(NSUserDefaults *)self->_iPodUserDefaults stringForKey:@"MusicRepeatSetting"];
  int64_t v3 = MPRepeatTypeFromNSString(v2);

  return v3;
}

- (void)setAutoPlayEnabled:(BOOL)a3 forUserIdentity:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  __int16 v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB87B8] activeAccount];
  }
  __int16 v9 = v8;
  BOOL v10 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v25 = v4;
    *(_WORD *)&v25[4] = 2114;
    *(void *)&v25[6] = v9;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "[PlaybackUserDefaults] setAutoPlayEnabled:forUserIdentity: %{BOOL}u userIdentity=%{public}@", buf, 0x12u);
  }

  uint64_t v11 = [NSNumber numberWithBool:v4];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_autoplaySettingCache setObject:v11 forKey:v9];
  os_unfair_lock_unlock(&self->_lock);
  id v12 = v9;
  if (!v12)
  {
    id v14 = [MEMORY[0x1E4FB8658] sharedAccountStore];
    id v23 = 0;
    __int16 v17 = [v14 activeStoreAccountWithError:&v23];
    id v15 = v23;
LABEL_10:

    if (v17) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  uint64_t v13 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v23 = 0;
  id v14 = [v13 DSIDForUserIdentity:v12 outError:&v23];
  id v15 = v23;

  if (v14)
  {
    v16 = [MEMORY[0x1E4FB8658] sharedAccountStore];
    id v22 = v15;
    __int16 v17 = [v16 storeAccountForDSID:v14 error:&v22];
    id v18 = v22;

    id v15 = v18;
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v19 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v25 = v12;
    *(_WORD *)&v25[8] = 2114;
    *(void *)&v25[10] = v15;
    _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "[PlaybackUserDefaults] _MPACAccountForUserIdentity failed to resolve account for identity %{public}@. err=%{public}@", buf, 0x16u);
  }

  __int16 v17 = 0;
LABEL_14:

  objc_msgSend(v17, "ams_setAccountFlagValue:forAccountFlag:", v11, *MEMORY[0x1E4F4D9C8]);
  v20 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
  id v21 = (id)objc_msgSend(v20, "ams_saveAccount:", v17);
}

- (BOOL)autoPlayEnabledForUserIdentity:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB87B8] activeAccount];
  }
  id v6 = v5;
  __int16 v7 = [(NSMutableDictionary *)self->_autoplaySettingCache objectForKey:v5];
  if (v7) {
    goto LABEL_18;
  }
  id v8 = v6;
  if (v8)
  {
    __int16 v9 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    id v22 = 0;
    BOOL v10 = [v9 DSIDForUserIdentity:v8 outError:&v22];
    id v11 = v22;

    if (!v10)
    {
LABEL_10:
      id v15 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)v24 = v8;
        *(_WORD *)&v24[8] = 2114;
        *(void *)&v24[10] = v11;
        _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "[PlaybackUserDefaults] _MPACAccountForUserIdentity failed to resolve account for identity %{public}@. err=%{public}@", buf, 0x16u);
      }

      uint64_t v13 = 0;
      goto LABEL_13;
    }
    id v12 = [MEMORY[0x1E4FB8658] sharedAccountStore];
    id v21 = v11;
    uint64_t v13 = [v12 storeAccountForDSID:v10 error:&v21];
    id v14 = v21;

    id v11 = v14;
  }
  else
  {
    BOOL v10 = [MEMORY[0x1E4FB8658] sharedAccountStore];
    id v22 = 0;
    uint64_t v13 = [v10 activeStoreAccountWithError:&v22];
    id v11 = v22;
  }

  if (!v13) {
    goto LABEL_10;
  }
LABEL_13:

  __int16 v7 = objc_msgSend(v13, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E4F4D9C8]);
  if (!v7)
  {
    v16 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_INFO, "[PlaybackUserDefaults] Returning NO as [account ams_accountFlagValueForAccountFlag:AMSAccountFlagAutoPlay] could not resolve.", buf, 2u);
    }

    __int16 v7 = (void *)MEMORY[0x1E4F1CC28];
  }
  [(NSMutableDictionary *)self->_autoplaySettingCache setObject:v7 forKey:v8];

LABEL_18:
  os_unfair_lock_unlock(&self->_lock);
  __int16 v17 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = [v7 BOOLValue];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v24 = v18;
    *(_WORD *)&v24[4] = 2114;
    *(void *)&v24[6] = v6;
    _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_INFO, "[PlaybackUserDefaults] autoPlayEnabledForUserIdentity: %{BOOL}u userIdentity=%{public}@", buf, 0x12u);
  }

  char v19 = [v7 BOOLValue];
  return v19;
}

- (void)dealloc
{
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB8578] object:0];

  notify_cancel(self->_notifyTokens.mobileiPodPrefsChanged);
  notify_cancel(self->_notifyTokens.videoPrefsChanged);
  if (MSVDeviceIsAudioAccessory()) {
    notify_cancel(self->_notifyTokens.airplayPrefsChanged);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPPlaybackUserDefaults;
  [(MPPlaybackUserDefaults *)&v4 dealloc];
}

void __31__MPPlaybackUserDefaults__init__block_invoke(uint64_t a1)
{
  int64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int64_t v3 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v2 postNotificationName:@"MPPlaybackUserDefaultsMusicRepeatTypeDidChangeNotification" object:v3];

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v4 postNotificationName:@"MPPlaybackUserDefaultsMusicShuffleTypeDidChangeNotification" object:v5];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"MPPlaybackUserDefaultsSoundCheckEnabledDidChangeNotification" object:*(void *)(a1 + 32)];

  __int16 v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v7 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:v8];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  __int16 v9 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v10 postNotificationName:@"MPPlaybackUserDefaultsMusicEQPresetDidChangeNotification" object:v9];
}

void __31__MPPlaybackUserDefaults__init__block_invoke_3()
{
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v0 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v1 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:v0];
}

void __31__MPPlaybackUserDefaults__init__block_invoke_2()
{
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v0 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v1 postNotificationName:@"MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification" object:v0];
}

@end