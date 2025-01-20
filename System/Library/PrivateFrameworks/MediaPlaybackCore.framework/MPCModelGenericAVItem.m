@interface MPCModelGenericAVItem
+ (BOOL)_prefersHighQualityAudioContentForNetworkType:(int64_t)a3;
+ (BOOL)_prefersHighQualityVideoContentForNetworkType:(int64_t)a3;
+ (BOOL)automaticallyNotifiesObserversOfChapters;
+ (id)_downloadCompletionPendingItems;
+ (id)_utilitySerialQueue;
+ (int64_t)_unwrapPlaybackError:(id)a3;
- ($C4B24A06E922887A36692F481211F72A)_timeoutValues;
- (BOOL)_allowsStreamingPlayback;
- (BOOL)_isAssetLoadResultValidForPlayback:(id)a3 error:(id *)a4;
- (BOOL)_linkAssetIfNeededAtURL:(id)a3 toDestinationURL:(id)a4 shareCacheURL:(id)a5;
- (BOOL)_prefersHighQualityContent;
- (BOOL)allowsAirPlayFromCloud;
- (BOOL)allowsEQ;
- (BOOL)allowsExternalPlayback;
- (BOOL)canUseLoadedAsset;
- (BOOL)hasStoreLyrics;
- (BOOL)hasTimeSyncedLyrics;
- (BOOL)hasVideo;
- (BOOL)isAlwaysLive;
- (BOOL)isArtistUploadedContent;
- (BOOL)isDownloadedAsset;
- (BOOL)isExplicitTrack;
- (BOOL)isHLSAsset;
- (BOOL)isLikedStateEnabled;
- (BOOL)isRadioPlayback;
- (BOOL)isRadioStreamPlayback;
- (BOOL)isStreamable;
- (BOOL)isSubscriptionRequired;
- (BOOL)isValidPlayerSubstituteForItem:(id)a3;
- (BOOL)prefersSeekOverSkip;
- (BOOL)prioritizeStartupOverQuality;
- (BOOL)requiresLoadedAssetForAirPlayProperties;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (BOOL)shouldPreventPlayback;
- (BOOL)shouldReportPlayEventsToStore;
- (BOOL)shouldShowComposer;
- (BOOL)supportsLikedState;
- (BOOL)supportsRating;
- (BOOL)supportsVocalAttenuation;
- (BOOL)updateActiveFormat:(id)a3 justification:(int64_t)a4;
- (BOOL)updateAudioFormatsDictionary:(id)a3;
- (BOOL)updatePreferredFormat:(id)a3;
- (BOOL)useEmbeddedChapterData;
- (BOOL)usesBookmarking;
- (BOOL)usesSubscriptionLease;
- (ICUserIdentity)playbackRequestUserIdentity;
- (MPCAudioAssetTypeSelection)preferredAudioAssetTypeSelection;
- (MPCAudioAssetTypeSelector)audioAssetTypeSelector;
- (MPCModelGenericAVItem)initWithGenericObject:(id)a3 itemProperties:(id)a4 playbackRequestEnvironment:(id)a5 identityPropertySet:(id)a6;
- (MPCModelPlaybackAssetCacheProviding)assetCacheProvider;
- (MPCPlaybackEngineEventStream)eventStream;
- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment;
- (MPCPlayerAudioFormat)activeFormat;
- (MPCPlayerAudioFormat)preferredFormat;
- (MPCPlayerAudioRoute)audioRoute;
- (MPGaplessInfo)gaplessInfo;
- (MPMediaLibrary)mediaLibrary;
- (MPModelGenericObject)genericObject;
- (NSArray)alternateFormats;
- (NSArray)availableSortedFormats;
- (NSArray)chapters;
- (NSData)jingleTimedMetadata;
- (NSData)trackInfoData;
- (NSDictionary)audioFormatsDictionary;
- (NSDictionary)trackInfo;
- (NSNumber)isSiriInitiated;
- (NSString)description;
- (NSString)playerID;
- (NSString)previousQueueItemID;
- (double)_startTime;
- (double)durationFromExternalMetadata;
- (float)_volumeAdjustment;
- (float)userRating;
- (id)_assetLoadPropertiesWithUserIdentityProperties:(id)a3 delegatedUserIdentityProperties:(id)a4 subscriptionPlaybackInfo:(id)a5;
- (id)_bookmarkTime;
- (id)_chapterDataAt:(double)a3;
- (id)_createOrUpdateDatabaseEntry:(id)a3 loadResult:(id)a4 urlBag:(id)a5 destinationURL:(id)a6 purgeable:(BOOL)a7;
- (id)_decorateAssetLoadResult:(id)a3 withURLBag:(id)a4;
- (id)_delegatedUserIdentityProperties:(id *)a3;
- (id)_hlsDownloadOptionsDictionary:(id)a3;
- (id)_iTunesStorePurchasedMediaKind;
- (id)_loudnessInfoMediaKind;
- (id)_modelPlaybackPosition;
- (id)_radioStation;
- (id)_rtcReportingMediaIdentifierWithAssetLoadProperties:(id)a3;
- (id)_rtcReportingServiceIdentifierWithAssetURL:(id)a3;
- (id)_stopTime;
- (id)_storeRequestContext;
- (id)_storeUbiquitousIdentifier;
- (id)album;
- (id)albumArtist;
- (id)analyticsContentType;
- (id)analyticsFormatType;
- (id)artist;
- (id)artworkCatalogBlock;
- (id)artworkTimeMarkers;
- (id)audioFormatForStableVariantID:(id)a3;
- (id)chapterAt:(double)a3;
- (id)chapterTimeMarkers;
- (id)cloudAlbumID;
- (id)cloudUniversalLibraryID;
- (id)composer;
- (id)containerUniqueID;
- (id)copyrightText;
- (id)databaseID;
- (id)explicitBadge;
- (id)externalContentIdentifier;
- (id)genre;
- (id)leaseStatus;
- (id)libraryLyrics;
- (id)mainTitle;
- (id)mediaItem;
- (id)modelGenericObject;
- (id)mpcReporting_identityPropertiesLoader;
- (id)mpcReporting_requestingBundleIdentifier;
- (id)mpcReporting_requestingBundleVersion;
- (id)nextChapterAfter:(double)a3;
- (id)personID;
- (id)playbackError;
- (id)playbackInfo;
- (id)previousChapterBefore:(double)a3;
- (id)rtcReportingServiceIdentifier;
- (id)stationHash;
- (id)stationName;
- (id)stationStringID;
- (id)storeAccountID;
- (id)storeFrontIdentifier;
- (id)urlTimeMarkers;
- (int64_t)_keyServerAdamID;
- (int64_t)_persistedLikedState;
- (int64_t)_suzeLeaseMediaType;
- (int64_t)activeFormatJustification;
- (int64_t)albumStoreID;
- (int64_t)albumYear;
- (int64_t)artistStoreID;
- (int64_t)equivalencySourceAdamID;
- (int64_t)leasePlaybackPreventionState;
- (int64_t)loadedAudioAssetType;
- (int64_t)lyricsAdamID;
- (int64_t)playbackMode;
- (int64_t)playerItemType;
- (int64_t)preferredAudioAssetType;
- (int64_t)reportingAdamID;
- (int64_t)stationID;
- (int64_t)stationItemLikedState;
- (int64_t)stationProviderID;
- (int64_t)storeAlbumArtistID;
- (int64_t)storeItemInt64ID;
- (int64_t)storePurchasedAdamID;
- (int64_t)storeSubscriptionAdamID;
- (int64_t)type;
- (unint64_t)_audioFormatPreference;
- (unint64_t)albumArtistPersistentID;
- (unint64_t)albumPersistentID;
- (unint64_t)albumTrackCount;
- (unint64_t)albumTrackNumber;
- (unint64_t)artistPersistentID;
- (unint64_t)cloudID;
- (unint64_t)composerPersistentID;
- (unint64_t)genrePersistentID;
- (unint64_t)mediaType;
- (unint64_t)mpcReporting_itemType;
- (unint64_t)persistentID;
- (void)_addToDownloadCompletionPendingItems;
- (void)_ageVerificationStateDidChangeNotification:(id)a3;
- (void)_allowsHighQualityMusicStreamingOnCellularDidChangeNotification:(id)a3;
- (void)_applyLoudnessInfo;
- (void)_applyPreferredPeakBitRateToPlayerItem:(id)a3 withItemType:(int64_t)a4;
- (void)_checkDownloadErrorAndValidityOfDownloadedHLSAsset:(id)a3 downloadLocationURL:(id)a4 completion:(id)a5;
- (void)_contentTasteControllerDidChangeNotification:(id)a3;
- (void)_currentPlaybackRateDidChange:(float)a3;
- (void)_didBecomeActivePlayerItem;
- (void)_didResignActivePlayerItem;
- (void)_downloadHLSAsset:(id)a3 destinationURL:(id)a4 sharedCacheURL:(id)a5 assetLoadProperties:(id)a6 loadResult:(id)a7 storeRequestContext:(id)a8 urlBag:(id)a9 fileUpgradeRecommendation:(int64_t)a10;
- (void)_downloadHLSAssetWhilePlaying:(id)a3 assetLoadProperties:(id)a4 assetLoadResult:(id)a5 destinationURL:(id)a6 sharedCacheURL:(id)a7 storeRequestContext:(id)a8 urlBag:(id)a9 fileUpgradeRecommendation:(int64_t)a10;
- (void)_emitAudioAssetTypeSelection:(id)a3 assetLoadInfo:(id)a4;
- (void)_emitAudioFormatChangeEvent;
- (void)_emitNetworkOperationWithPerformanceMetrics:(id)a3 operationType:(int64_t)a4 reason:(id)a5 blocksPlayback:(BOOL)a6;
- (void)_getHLSServerDataForLoadResults:(id)a3 bag:(id)a4 keyCertificateURL:(id *)a5 keyServerURL:(id *)a6 keyServerAdamID:(id *)a7 keyServerProtocolType:(int64_t *)a8;
- (void)_getSubscriptionLeasePropertiesWithCompletion:(id)a3;
- (void)_getSubscriptionStatusWithStoreRequestContext:(id)a3 completion:(id)a4;
- (void)_getUnverifiedSubscriptionLeaseSessionWithCompletion:(id)a3;
- (void)_handleUpdatedLikedState:(int64_t)a3 forUserIdentity:(id)a4 completion:(id)a5;
- (void)_invalidateContentItemForTimedMetadataChangesChangingRevisionID:(BOOL)a3;
- (void)_postInvalidationNotifications;
- (void)_prepareAssetForHLSPlayback:(id)a3 loadResult:(id)a4 destinationURL:(id)a5 storeRequestContext:(id)a6 urlBag:(id)a7 identityProperties:(id)a8 isStoreKeyServer:(BOOL)a9;
- (void)_prepareLeaseWithShouldRequireLeaseAcquisition:(BOOL)a3 completionHandler:(id)a4;
- (void)_reloadTimedMetadataRequest;
- (void)_removeFromDownloadCompletionPendingItems;
- (void)_subscriptionLeaseStatusDidChangeNotification:(id)a3;
- (void)_suzeLeaseSessionRenewDidFailNotification:(id)a3;
- (void)_timedMetadataResponseDidInvalidateNotification:(id)a3;
- (void)_updateActiveFormatJustification:(int64_t)a3;
- (void)_updateAudioFormatInfoForContentItem:(id)a3;
- (void)_updateAutomaticSubscriptionLeaseRefresh;
- (void)_updateContentItemIncludingPlaybackState:(BOOL)a3;
- (void)_updateJingleTimedMetadata;
- (void)_updatePreventionStatusWithLeaseSession:(id)a3;
- (void)_willBecomeActivePlayerItem;
- (void)_willResignActivePlayerItem;
- (void)applyVolumeNormalizationWithSoundCheckEnabled:(BOOL)a3;
- (void)configureAVPlayerItemWithAudioFormat:(id)a3 forceSpatial:(BOOL)a4;
- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4;
- (void)metadataOutput:(id)a3 didOutputTimedMetadataGroups:(id)a4 fromPlayerItemTrack:(id)a5;
- (void)notePlaybackFinishedByHittingEnd;
- (void)nowPlayingInfoCenter:(id)a3 lyricsForContentItem:(id)a4 completion:(id)a5;
- (void)pauseContentKeySession;
- (void)prepareForRate:(float)a3 completionHandler:(id)a4;
- (void)reevaluateType;
- (void)resetPlaybackStartTimeForReuse;
- (void)resolvePlaybackError:(id)a3 withCompletion:(id)a4;
- (void)resumeContentKeySession;
- (void)setActiveFormat:(id)a3;
- (void)setActiveFormatJustification:(int64_t)a3;
- (void)setAlternateFormats:(id)a3;
- (void)setAssetCacheProvider:(id)a3;
- (void)setAudioAssetTypeSelector:(id)a3;
- (void)setAudioFormatsDictionary:(id)a3;
- (void)setAudioRoute:(id)a3;
- (void)setAvailableSortedFormats:(id)a3;
- (void)setChapters:(id)a3;
- (void)setEquivalencySourceAdamID:(int64_t)a3;
- (void)setEventStream:(id)a3;
- (void)setGenericObject:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setPreferredFormat:(id)a3;
- (void)setPreviousQueueItemID:(id)a3;
- (void)setPrioritizeStartupOverQuality:(BOOL)a3;
- (void)setRadioPlayback:(BOOL)a3;
- (void)setRadioStreamPlayback:(BOOL)a3;
- (void)setRating:(float)a3;
- (void)setSiriInitiated:(id)a3;
- (void)setStationItemLikedState:(int64_t)a3;
- (void)setSubscriptionRequired:(BOOL)a3;
- (void)setTrackInfo:(id)a3;
- (void)setupWithPlaybackInfo;
@end

@implementation MPCModelGenericAVItem

- (unint64_t)mediaType
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      unint64_t v7 = 256;
      break;
    case 6:
      unint64_t v7 = 512;
      break;
    case 1:
      v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      int v6 = [v5 hasVideo];

      if (v6) {
        unint64_t v7 = 2048;
      }
      else {
        unint64_t v7 = 1;
      }
      break;
    default:
      unint64_t v7 = 0;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (int64_t)type
{
  v8.receiver = self;
  v8.super_class = (Class)MPCModelGenericAVItem;
  int64_t v3 = [(MPCModelGenericAVItem *)&v8 type];
  if (!v3)
  {
    p_genericObjectLock = &self->_genericObjectLock;
    os_unfair_lock_lock(&self->_genericObjectLock);
    uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
    if (v5 == 9 || v5 == 6)
    {
      int64_t v3 = 2;
    }
    else if (v5 == 1)
    {
      int v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      if ([v6 hasVideo]) {
        int64_t v3 = 2;
      }
      else {
        int64_t v3 = 1;
      }
    }
    else
    {
      int64_t v3 = 0;
    }
    os_unfair_lock_unlock(p_genericObjectLock);
  }
  return v3;
}

- (id)_modelPlaybackPosition
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      goto LABEL_7;
    case 6:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      goto LABEL_7;
    case 1:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
LABEL_7:
      int v6 = v5;
      unint64_t v7 = [v5 playbackPosition];

      goto LABEL_9;
  }
  unint64_t v7 = 0;
LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);

  return v7;
}

- (NSString)description
{
  int64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPCModelGenericAVItem;
  uint64_t v4 = [(MPCModelGenericAVItem *)&v8 description];
  uint64_t v5 = [(MPCModelGenericAVItem *)self mainTitle];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)mainTitle
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      goto LABEL_7;
    case 6:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      goto LABEL_7;
    case 1:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
LABEL_7:
      int v6 = v5;
      unint64_t v7 = [v5 title];

      goto LABEL_9;
  }
  unint64_t v7 = 0;
LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);

  return v7;
}

- (id)playbackInfo
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v31.receiver = self;
  v31.super_class = (Class)MPCModelGenericAVItem;
  uint64_t v4 = [(MPCModelGenericAVItem *)&v31 playbackInfo];
  [(MPCModelGenericAVItem *)self _startTime];
  double v6 = v5;
  unint64_t v7 = [(MPCModelGenericAVItem *)self _stopTime];
  uint64_t v8 = *MEMORY[0x263F11128];
  v9 = [v4 objectForKey:*MEMORY[0x263F11128]];
  if (v9)
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v10 = *MEMORY[0x263F11130];
  v11 = [v4 objectForKey:*MEMORY[0x263F11130]];

  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v6 <= 0.00000011920929;
  }
  if (!v12)
  {
    v13 = [(MPCModelGenericAVItem *)self eventStream];
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v13 engineID];
      *(_DWORD *)buf = 138543874;
      v33 = v15;
      __int16 v34 = 2114;
      v35 = self;
      __int16 v36 = 2048;
      double v37 = v6;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using start time: %f", buf, 0x20u);
    }
    v9 = [NSNumber numberWithDouble:v6];
    [v3 setObject:v9 forKey:v10];
    goto LABEL_9;
  }
LABEL_10:
  if (v7)
  {
    [v7 doubleValue];
    double v17 = v16;
    if (v16 > 0.00000011920929)
    {
      [(MPCModelGenericAVItem *)self durationFromExternalMetadata];
      if (v17 < v18)
      {
        v19 = [(MPCModelGenericAVItem *)self eventStream];
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v19 engineID];
          *(_DWORD *)buf = 138543874;
          v33 = v21;
          __int16 v34 = 2114;
          v35 = self;
          __int16 v36 = 2048;
          double v37 = v6;
          _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using stop time: %f", buf, 0x20u);
        }
        v22 = [NSNumber numberWithDouble:v17];
        [v3 setObject:v22 forKey:*MEMORY[0x263F11118]];
      }
    }
  }
  [v3 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F11120]];
  v23 = [v4 objectForKey:v8];
  if (v23) {
    goto LABEL_17;
  }
  v24 = [v4 objectForKey:*MEMORY[0x263F11130]];

  if (!v24)
  {
    if ([(MPCModelGenericAVItem *)self usesBookmarking])
    {
      v23 = [(MPCModelGenericAVItem *)self _bookmarkTime];
    }
    else
    {
      v23 = 0;
    }
    [v23 doubleValue];
    if (v23)
    {
      double v27 = v26;
      if (v26 > 0.00000011920929)
      {
        [v3 setObject:v23 forKey:v8];
        v28 = [(MPCModelGenericAVItem *)self eventStream];
        v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = [v28 engineID];
          *(_DWORD *)buf = 138543874;
          v33 = v30;
          __int16 v34 = 2114;
          v35 = self;
          __int16 v36 = 2048;
          double v37 = v27;
          _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using bookmark start time: %f", buf, 0x20u);
        }
      }
    }
LABEL_17:
  }
  if ([v4 count]) {
    [v3 addEntriesFromDictionary:v4];
  }

  return v3;
}

- (id)_stopTime
{
  v2 = [(MPCModelGenericAVItem *)self _modelPlaybackPosition];
  id v3 = [v2 stopTime];

  return v3;
}

- (BOOL)isRadioPlayback
{
  return self->_radioPlayback;
}

- (id)modelGenericObject
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = self->_metadataGenericObject;
  os_unfair_lock_unlock(p_genericObjectLock);

  return v4;
}

- (BOOL)isLikedStateEnabled
{
  return 1;
}

- (id)genre
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 genre];
    double v6 = [v5 name];
  }
  else
  {
    double v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);

  return v6;
}

- (id)databaseID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject identifiers];
  double v5 = [v4 library];
  double v6 = [v5 databaseID];

  os_unfair_lock_unlock(p_genericObjectLock);

  return v6;
}

- (id)album
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 album];
    double v6 = [v5 title];
  }
  else
  {
    double v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);

  return v6;
}

- (int64_t)albumYear
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 album];
    int64_t v6 = [v5 year];
  }
  else
  {
    int64_t v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (id)artist
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  if (v4 == 6)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
    int64_t v6 = [v5 show];
    uint64_t v7 = [v6 title];
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    int64_t v6 = [v5 artist];
    uint64_t v7 = [v6 name];
LABEL_5:
    uint64_t v8 = (void *)v7;

    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);

  return v8;
}

- (BOOL)hasTimeSyncedLyrics
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 lyrics];
    char v6 = [v5 hasTimeSyncedLyrics];
  }
  else
  {
    char v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (int64_t)lyricsAdamID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      break;
    case 6:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      break;
    case 1:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      break;
    default:
      uint64_t v7 = 0;
      goto LABEL_9;
  }
  char v6 = v5;
  uint64_t v7 = [v5 identifiers];

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  uint64_t v8 = [v7 universalStore];
  int64_t v9 = [v8 lyricsAdamID];

  if ([(MPCModelGenericAVItem *)self hasStoreLyrics])
  {
    if (!v9)
    {
      int64_t v9 = [(MPCModelGenericAVItem *)self reportingAdamID];
      if (!v9) {
        int64_t v9 = [(MPCModelGenericAVItem *)self storeSubscriptionAdamID];
      }
    }
  }

  return v9;
}

- (BOOL)hasStoreLyrics
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 lyrics];
    char v6 = [v5 hasStoreLyrics];
  }
  else
  {
    char v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (id)libraryLyrics
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 lyrics];
    char v6 = [v5 text];
  }
  else
  {
    char v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);

  return v6;
}

- (int64_t)reportingAdamID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      break;
    case 6:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      break;
    case 1:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      break;
    default:
      uint64_t v7 = 0;
      goto LABEL_9;
  }
  char v6 = v5;
  uint64_t v7 = [v5 identifiers];

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  uint64_t v8 = [v7 universalStore];
  int64_t v9 = [v8 reportingAdamID];

  return v9;
}

- (int64_t)storePurchasedAdamID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedGenericObject identifiers];
  double v5 = [v4 universalStore];
  int64_t v6 = [v5 purchasedAdamID];

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (int64_t)albumStoreID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  if (v4 == 6)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
    int64_t v6 = [v5 season];
  }
  else
  {
    if (v4 != 1)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    int64_t v6 = [v5 album];
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 identifiers];

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  int64_t v9 = [v8 universalStore];
  int64_t v10 = [v9 adamID];

  if (!v10)
  {
    v11 = [v8 universalStore];
    int64_t v10 = [v11 purchasedAdamID];

    if (!v10)
    {
      BOOL v12 = [v8 universalStore];
      int64_t v10 = [v12 subscriptionAdamID];
    }
  }

  return v10;
}

- (int64_t)storeItemInt64ID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      break;
    case 6:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      break;
    case 1:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      break;
    default:
      uint64_t v7 = 0;
      goto LABEL_9;
  }
  int64_t v6 = v5;
  uint64_t v7 = [v5 identifiers];

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  uint64_t v8 = [v7 universalStore];
  int64_t v9 = [v8 adamID];

  if (!v9)
  {
    int64_t v10 = [v7 universalStore];
    int64_t v9 = [v10 purchasedAdamID];

    if (!v9)
    {
      v11 = [v7 universalStore];
      int64_t v9 = [v11 subscriptionAdamID];
    }
  }

  return v9;
}

- (int64_t)storeSubscriptionAdamID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      break;
    case 6:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      break;
    case 1:
      double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      break;
    default:
      uint64_t v7 = 0;
      goto LABEL_9;
  }
  int64_t v6 = v5;
  uint64_t v7 = [v5 identifiers];

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  uint64_t v8 = [v7 universalStore];
  int64_t v9 = [v8 subscriptionAdamID];

  return v9;
}

- (int64_t)artistStoreID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  if (v4 == 6)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
    int64_t v6 = [v5 show];
  }
  else
  {
    if (v4 != 1)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    int64_t v6 = [v5 artist];
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 identifiers];

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  int64_t v9 = [v8 universalStore];
  int64_t v10 = [v9 adamID];

  if (!v10)
  {
    v11 = [v8 universalStore];
    int64_t v10 = [v11 purchasedAdamID];

    if (!v10)
    {
      BOOL v12 = [v8 universalStore];
      int64_t v10 = [v12 subscriptionAdamID];
    }
  }

  return v10;
}

- (BOOL)supportsRating
{
  unint64_t v3 = [(MPCModelGenericAVItem *)self persistentID];
  uint64_t v4 = [(MPCModelGenericAVItem *)self cloudUniversalLibraryID];

  if (!v3 || !v4 || [(MPModelGenericObject *)self->_flattenedGenericObject type] != 1) {
    return 0;
  }
  double v5 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
  char v6 = [v5 isLibraryAdded];

  return v6;
}

- (id)cloudUniversalLibraryID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject identifiers];
  double v5 = [v4 universalStore];
  char v6 = [v5 universalCloudLibraryID];

  os_unfair_lock_unlock(p_genericObjectLock);

  return v6;
}

- (int64_t)storeAlbumArtistID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 album];
    char v6 = [v5 artist];
    uint64_t v7 = [v6 identifiers];
  }
  else
  {
    uint64_t v7 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  uint64_t v8 = [v7 universalStore];
  int64_t v9 = [v8 adamID];

  return v9;
}

- (id)albumArtist
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  if (v4 == 6)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
    char v6 = [v5 season];
    uint64_t v7 = [v6 show];
    uint64_t v8 = [v7 title];
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    char v6 = [v5 album];
    uint64_t v7 = [v6 artist];
    uint64_t v8 = [v7 name];
LABEL_5:
    int64_t v9 = (void *)v8;

    goto LABEL_7;
  }
  int64_t v9 = 0;
LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);

  return v9;
}

- (id)composer
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 composer];
    char v6 = [v5 name];
  }
  else
  {
    char v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);

  return v6;
}

- (unint64_t)composerPersistentID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 composer];
    char v6 = [v5 identifiers];
    uint64_t v7 = [v6 library];
    unint64_t v8 = [v7 persistentID];
  }
  else
  {
    unint64_t v8 = *MEMORY[0x263F111C8];
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v8;
}

- (unint64_t)artistPersistentID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  if (v4 == 6)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
    char v6 = [v5 show];
  }
  else
  {
    if (v4 != 1)
    {
      unint64_t v10 = *MEMORY[0x263F111C8];
      goto LABEL_7;
    }
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    char v6 = [v5 artist];
  }
  uint64_t v7 = v6;
  unint64_t v8 = [v6 identifiers];
  int64_t v9 = [v8 library];
  unint64_t v10 = [v9 persistentID];

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v10;
}

- (unint64_t)albumArtistPersistentID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 album];
    char v6 = [v5 artist];
    uint64_t v7 = [v6 identifiers];
    unint64_t v8 = [v7 library];
    unint64_t v9 = [v8 persistentID];
  }
  else
  {
    unint64_t v9 = *MEMORY[0x263F111C8];
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v9;
}

- (unint64_t)albumPersistentID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  if (v4 == 6)
  {
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
    char v6 = [v5 season];
  }
  else
  {
    if (v4 != 1)
    {
      unint64_t v10 = *MEMORY[0x263F111C8];
      goto LABEL_7;
    }
    double v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    char v6 = [v5 album];
  }
  uint64_t v7 = v6;
  unint64_t v8 = [v6 identifiers];
  unint64_t v9 = [v8 library];
  unint64_t v10 = [v9 persistentID];

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v10;
}

- (unint64_t)genrePersistentID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    double v5 = [v4 genre];
    char v6 = [v5 identifiers];
    uint64_t v7 = [v6 library];
    unint64_t v8 = [v7 persistentID];
  }
  else
  {
    unint64_t v8 = *MEMORY[0x263F111C8];
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v8;
}

- (unint64_t)persistentID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject identifiers];
  double v5 = [v4 library];
  unint64_t v6 = [v5 persistentID];

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (double)_startTime
{
  v2 = [(MPCModelGenericAVItem *)self _modelPlaybackPosition];
  [v2 startTime];
  double v4 = v3;

  return v4;
}

- (id)explicitBadge
{
  if (![(MPCModelGenericAVItem *)self isExplicitTrack]) {
    return 0;
  }
  double v3 = [(ICStoreRequestContext *)self->_storeRequestContext identity];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F893C0] activeAccount];
  }
  uint64_t v7 = v5;

  unint64_t v8 = [MEMORY[0x263F890A0] defaultManager];
  unint64_t v9 = [v8 ageVerificationStateForUserIdentity:v7];

  uint64_t v10 = [v9 treatment];
  v11 = @"🅴";
  if (v10) {
    v11 = 0;
  }
  if (v10 == 1) {
    unint64_t v6 = @"⓳";
  }
  else {
    unint64_t v6 = v11;
  }

  return v6;
}

- (BOOL)isExplicitTrack
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      id v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      char IsRestricted = MPModelMovieIsRestricted();
      break;
    case 6:
      id v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      char IsRestricted = MPModelTVEpisodeIsRestricted();
      break;
    case 1:
      id v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      char IsRestricted = [v5 isExplicitSong];
      break;
    default:
      BOOL v7 = 0;
      goto LABEL_9;
  }
  BOOL v7 = IsRestricted;

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (BOOL)isArtistUploadedContent
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    char v5 = [v4 isArtistUploadedContent];
  }
  else
  {
    char v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (BOOL)prefersSeekOverSkip
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  double v3 = [(MPCModelGenericAVItem *)self _radioStation];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = (void *)MEMORY[0x263F11F78];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__MPCModelGenericAVItem_prefersSeekOverSkip__block_invoke;
    v8[3] = &unk_2643C67A0;
    uint64_t v10 = &v11;
    id v9 = v3;
    [v5 performWithoutEnforcement:v8];
  }
  if (*((unsigned char *)v12 + 24)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = [(MPCModelGenericAVItem *)self usesBookmarking];
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)usesBookmarking
{
  if (self->_radioPlayback) {
    return 0;
  }
  double v3 = [(MPCModelGenericAVItem *)self _modelPlaybackPosition];
  char v4 = [v3 shouldRememberBookmarkTime];

  return v4;
}

- (BOOL)supportsVocalAttenuation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!MSVDeviceSupportsVocalAttenuation()) {
    return 0;
  }
  os_unfair_lock_lock(&self->_genericObjectLock);
  double v3 = self->_flattenedGenericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)v3 type] == 1
    && ![(MPCModelGenericAVItem *)self isAlwaysLive]
    && ![(MPCModelGenericAVItem *)self isRadioStreamPlayback]
    && ![(MPCModelGenericAVItem *)self hasVideo])
  {
    BOOL v6 = [(MPModelGenericObject *)v3 song];
    if (([v6 supportsExtendedLyricsAttribute] & 1) == 0)
    {
      BOOL v7 = [MEMORY[0x263F12178] standardUserDefaults];
      if ([v7 shouldBypassVocalAttenuationSupportFlag])
      {
        unint64_t v8 = [v6 lyrics];
        int v9 = [v8 hasTimeSyncedLyrics];

        if (v9)
        {
          uint64_t v10 = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            int v12 = 138543618;
            uint64_t v13 = self;
            __int16 v14 = 1024;
            int v15 = [v6 supportsExtendedLyricsAttribute];
            _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_INFO, "%{public}@ - [AP] - Overriding vocal attenuation support: %{BOOL}u -> YES [bypassing server flag for time synced lyrics song]", (uint8_t *)&v12, 0x12u);
          }

          char v4 = 1;
LABEL_20:

          goto LABEL_7;
        }
      }
      else
      {
      }
    }
    uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 1024;
      int v15 = [v6 supportsExtendedLyricsAttribute];
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_INFO, "%{public}@ - [AP] - Supports vocal attenuation: %{BOOL}u", (uint8_t *)&v12, 0x12u);
    }

    char v4 = [v6 supportsExtendedLyricsAttribute];
    goto LABEL_20;
  }
  char v4 = 0;
LABEL_7:

  return v4;
}

- (id)artworkCatalogBlock
{
  double v3 = [(MPCModelGenericAVItem *)self _radioStation];
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v5)
  {
    case 9:
      uint64_t v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      goto LABEL_7;
    case 6:
      uint64_t v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      goto LABEL_7;
    case 1:
      uint64_t v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
LABEL_7:
      BOOL v7 = (void *)v6;
      goto LABEL_9;
  }
  BOOL v7 = 0;
LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke;
  v12[3] = &unk_2643BE860;
  id v13 = v7;
  id v14 = v3;
  id v8 = v3;
  id v9 = v7;
  uint64_t v10 = _Block_copy(v12);

  return v10;
}

- (BOOL)isAlwaysLive
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  double v3 = [(MPCModelGenericAVItem *)self _radioStation];
  char v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263F11F78];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__MPCModelGenericAVItem_isAlwaysLive__block_invoke;
    v11[3] = &unk_2643C67A0;
    id v13 = &v14;
    id v12 = v3;
    [v5 performWithoutEnforcement:v11];
  }
  if ([(MPCModelGenericAVItem *)self isRadioStreamPlayback]) {
    BOOL v6 = *((unsigned char *)v15 + 24) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if ([(MPCModelGenericAVItem *)self isAssetLoaded])
  {
    BOOL v7 = [(MPCModelGenericAVItem *)self playerItem];
    id v8 = v7;
    if (v7 && [v7 status] == 1)
    {
      [(MPCModelGenericAVItem *)self _playerItemDurationIfAvailable];
      BOOL v6 = (v10 & 0x1D) != 1;
    }
  }
  _Block_object_dispose(&v14, 8);
  return v6;
}

- (id)_radioStation
{
  v2 = [(MPCModelGenericAVItem *)self modelPlayEvent];
  if ([v2 itemType] == 4)
  {
    double v3 = [v2 radioStation];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (BOOL)isRadioStreamPlayback
{
  return self->_radioStreamPlayback;
}

- (BOOL)hasVideo
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
  flattenedGenericObject = self->_flattenedGenericObject;
  if (v4 == 1)
  {
    BOOL v6 = [(MPModelGenericObject *)flattenedGenericObject song];
    char v7 = [v6 hasVideo];
  }
  else
  {
    char v7 = [(MPModelGenericObject *)flattenedGenericObject type] == 6
      || [(MPModelGenericObject *)self->_flattenedGenericObject type] == 9;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (id)containerUniqueID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_genericObject identifiers];
  uint64_t v5 = [v4 containerUniqueID];

  os_unfair_lock_unlock(p_genericObjectLock);

  return v5;
}

- (NSData)trackInfoData
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  trackInfo = self->_trackInfo;
  if (trackInfo)
  {
    id v12 = 0;
    uint64_t v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:trackInfo format:100 options:0 error:&v12];
    id v5 = v12;
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      char v7 = [(MPCModelGenericAVItem *)self eventStream];
      id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v7 engineID];
        char v10 = self->_trackInfo;
        *(_DWORD *)buf = 138544130;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = self;
        __int16 v17 = 2114;
        double v18 = v10;
        __int16 v19 = 2114;
        id v20 = v5;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Unable to report track information [serialization error] - track-info=%{public}@ - error=%{public}@", buf, 0x2Au);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSData *)v4;
}

- (BOOL)shouldShowComposer
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    char v5 = [v4 shouldShowComposer];
  }
  else
  {
    char v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

id __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__767;
  id v13 = __Block_byref_object_dispose__768;
  id v14 = [*(id *)(a1 + 32) artworkCatalog];
  v2 = (void *)v10[5];
  if (!v2)
  {
    double v3 = (void *)MEMORY[0x263F11F78];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke_2;
    v6[3] = &unk_2643C67A0;
    id v8 = &v9;
    id v7 = *(id *)(a1 + 40);
    [v3 performWithoutEnforcement:v6];

    v2 = (void *)v10[5];
  }
  id v4 = v2;
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (int64_t)_persistedLikedState
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 1:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      break;
    case 6:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      break;
    case 9:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      break;
    default:
      os_unfair_lock_unlock(p_genericObjectLock);
      return 0;
  }
  BOOL v6 = (void *)v5;
  os_unfair_lock_unlock(p_genericObjectLock);
  if (v6)
  {
    id v7 = [MEMORY[0x263F11D78] sharedController];
    [v7 tasteTypeForModel:v6];
    int64_t v8 = MPMediaContentTasteTasteTypeToMPMediaEntityLikedState();

    return v8;
  }
  return 0;
}

- (void)setSiriInitiated:(id)a3
{
}

- (void)setPrioritizeStartupOverQuality:(BOOL)a3
{
  self->_prioritizeStartupOverQuality = a3;
}

- (void)setMediaLibrary:(id)a3
{
}

- (void)setAssetCacheProvider:(id)a3
{
}

- (MPCModelGenericAVItem)initWithGenericObject:(id)a3 itemProperties:(id)a4 playbackRequestEnvironment:(id)a5 identityPropertySet:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)MPCModelGenericAVItem;
  __int16 v15 = [(MPCModelGenericAVItem *)&v31 init];
  if (v15)
  {
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v15->_accessQueue;
    v15->_accessQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_genericObject, a3);
    v15->_genericObjectLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [(MPModelGenericObject *)v15->_genericObject flattenedGenericObject];
    flattenedGenericObject = v15->_flattenedGenericObject;
    v15->_flattenedGenericObject = (MPModelGenericObject *)v18;

    objc_storeStrong((id *)&v15->_metadataGenericObject, v15->_genericObject);
    uint64_t v20 = [(MPModelGenericObject *)v15->_metadataGenericObject flattenedGenericObject];
    flattenedMetadataGenericObject = v15->_flattenedMetadataGenericObject;
    v15->_flattenedMetadataGenericObject = (MPModelGenericObject *)v20;

    uint64_t v22 = [v13 copy];
    playbackRequestEnvironment = v15->_playbackRequestEnvironment;
    v15->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v22;

    uint64_t v24 = [(MPCPlaybackRequestEnvironment *)v15->_playbackRequestEnvironment _createStoreRequestContext];
    storeRequestContext = v15->_storeRequestContext;
    v15->_storeRequestContext = (ICStoreRequestContext *)v24;

    objc_storeStrong((id *)&v15->_itemProperties, a4);
    contentKeySession = v15->_contentKeySession;
    v15->_contentKeySession = 0;

    double v27 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v28 = *MEMORY[0x263F111D0];
    v29 = [MEMORY[0x263F11D78] sharedController];
    [v27 addObserver:v15 selector:sel__contentTasteControllerDidChangeNotification_ name:v28 object:v29];

    v15->_didSetupContentTasteObservation = 1;
    [v27 addObserver:v15 selector:sel__ageVerificationStateDidChangeNotification_ name:*MEMORY[0x263F88EA0] object:0];
    objc_storeStrong((id *)&v15->_identityPropertySet, a6);
  }
  return v15;
}

- (id)cloudAlbumID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  switch(v4)
  {
    case 9:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
      goto LABEL_7;
    case 6:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
      goto LABEL_7;
    case 1:
      uint64_t v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
LABEL_7:
      BOOL v6 = v5;
      id v7 = [v5 identifiers];
      int64_t v8 = [v7 personalizedStore];
      uint64_t v9 = [v8 cloudAlbumID];

      goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);

  return v9;
}

- (BOOL)shouldReportPlayEventsToStore
{
  if (self->_radioPlayback) {
    return 1;
  }
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v5 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
  switch(v5)
  {
    case 9:
      BOOL v6 = [(MPModelGenericObject *)self->_flattenedGenericObject movie];
      break;
    case 6:
      BOOL v6 = [(MPModelGenericObject *)self->_flattenedGenericObject tvEpisode];
      break;
    case 1:
      BOOL v6 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
      break;
    default:
      int64_t v8 = 0;
      uint64_t v9 = 0;
      goto LABEL_11;
  }
  id v7 = v6;
  int64_t v8 = [v6 identifiers];
  uint64_t v9 = [v7 storeAsset];

LABEL_11:
  os_unfair_lock_unlock(p_genericObjectLock);
  char v10 = [v8 personalizedStore];
  uint64_t v11 = [v10 cloudID];

  if (v11) {
    char v2 = [v9 shouldReportPlayEvents];
  }
  else {
    char v2 = [v9 endpointType] == 3;
  }

  return v2;
}

- (unint64_t)cloudID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject identifiers];
  uint64_t v5 = [v4 personalizedStore];
  unint64_t v6 = [v5 cloudID];

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (unint64_t)albumTrackNumber
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    unint64_t v5 = [v4 trackNumber];
  }
  else
  {
    unint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (unint64_t)albumTrackCount
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    unint64_t v5 = [v4 trackCount];
  }
  else
  {
    unint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (double)durationFromExternalMetadata
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  if (v4 == 9)
  {
    unint64_t v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject movie];
    goto LABEL_7;
  }
  if (v4 == 6)
  {
    unint64_t v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject tvEpisode];
    goto LABEL_7;
  }
  double v5 = 0.0;
  if (v4 == 1)
  {
    unint64_t v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
LABEL_7:
    id v7 = v6;
    [v6 duration];
    double v5 = v8;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (void)setPlayerID:(id)a3
{
}

- (void)setEventStream:(id)a3
{
}

- (id)mediaItem
{
  unint64_t v3 = [(MPCModelGenericAVItem *)self persistentID];
  if (v3)
  {
    unint64_t v4 = v3;
    double v5 = [(MPCModelGenericAVItem *)self mediaLibrary];
    unint64_t v6 = [v5 itemWithPersistentID:v4 verifyExistence:0];
  }
  else
  {
    p_genericObjectLock = &self->_genericObjectLock;
    os_unfair_lock_lock(&self->_genericObjectLock);
    unint64_t v6 = [MEMORY[0x263F11E08] itemFromModelObject:self->_metadataGenericObject];
    os_unfair_lock_unlock(p_genericObjectLock);
  }

  return v6;
}

- (MPMediaLibrary)mediaLibrary
{
  unint64_t v3 = [(MPCModelGenericAVItem *)self _storeRequestContext];
  unint64_t v4 = [v3 identity];

  mediaLibrary = self->_mediaLibrary;
  if (mediaLibrary)
  {
    unint64_t v6 = mediaLibrary;
  }
  else
  {
    unint64_t v6 = [MEMORY[0x263F11E40] deviceMediaLibraryWithUserIdentity:v4];
  }
  id v7 = v6;

  return v7;
}

- (id)_storeRequestContext
{
  storeRequestContext = self->_storeRequestContext;
  if (storeRequestContext)
  {
    unint64_t v3 = storeRequestContext;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F89360]);
    double v5 = [MEMORY[0x263F893C0] activeAccount];
    unint64_t v3 = (ICStoreRequestContext *)[v4 initWithIdentity:v5];
  }

  return v3;
}

- (id)storeFrontIdentifier
{
  char v2 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet identityProperties];
  unint64_t v3 = [v2 storefrontIdentifier];

  return v3;
}

- (int64_t)playbackMode
{
  return [(MPCModelGenericAVItem *)self isHLSAsset];
}

- (void)dealloc
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v4 = v3;
  if (self->_timedMetadataResponse) {
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x263F11B18]);
  }
  if (self->_didSetupContentTasteObservation)
  {
    uint64_t v5 = *MEMORY[0x263F111D0];
    unint64_t v6 = [MEMORY[0x263F11D78] sharedController];
    [v4 removeObserver:self name:v5 object:v6];
  }
  [v4 removeObserver:self name:*MEMORY[0x263F88EA0] object:0];
  if ([(MPCModelGenericAVItem *)self isHLSAsset])
  {
    uint64_t v7 = *MEMORY[0x263F11C40];
    double v8 = [MEMORY[0x263F12178] standardUserDefaults];
    [v4 removeObserver:self name:v7 object:v8];
  }
  if (self->_subscriptionLeaseSession)
  {
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x263F88F58]);
    if (self->_shouldAutomaticallyRefreshSubscriptionLease)
    {
      uint64_t v9 = self->_subscriptionLeaseSession;
      dispatch_time_t v10 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __32__MPCModelGenericAVItem_dealloc__block_invoke;
      block[3] = &unk_2643C5FC8;
      uint64_t v28 = v9;
      uint64_t v11 = v9;
      dispatch_after(v10, MEMORY[0x263EF83A0], block);
    }
  }
  if (self->_suzeLeaseSession)
  {
    if (self->_isAutomaticallyRefreshingSuzeLeaseSession)
    {
      self->_isAutomaticallyRefreshingSuzeLeaseSession = 0;
      [(MPCSuzeLeaseSession *)self->_suzeLeaseSession endAutomaticallyRefreshingLease];
    }
    id v12 = +[MPCSuzeLeaseSessionController sharedController];
    [v4 removeObserver:self name:@"MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification" object:v12];
    [v12 stopLeaseSession:self->_suzeLeaseSession completion:0];
  }
  if (self->_hlsDownloadURLSession && self->_hlsDownloadURLRequest)
  {
    id v13 = [(MPCModelGenericAVItem *)self eventStream];
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [v13 engineID];
      hlsDownloadURLRequest = self->_hlsDownloadURLRequest;
      *(_DWORD *)buf = 138543874;
      v30 = v15;
      __int16 v31 = 2114;
      v32 = self;
      __int16 v33 = 2114;
      __int16 v34 = hlsDownloadURLRequest;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Cancelling download request [dealloc] - request:%{public}@", buf, 0x20u);
    }
    [(ICAVAssetDownloadURLSession *)self->_hlsDownloadURLSession cancelRequest:self->_hlsDownloadURLRequest];
  }
  if (self->_tempFileURLToCleanup)
  {
    __int16 v17 = [MEMORY[0x263F08850] defaultManager];
    tempFileURLToCleanup = self->_tempFileURLToCleanup;
    id v26 = 0;
    char v19 = [v17 removeItemAtURL:tempFileURLToCleanup error:&v26];
    id v20 = v26;

    if ((v19 & 1) == 0)
    {
      uint64_t v21 = [(MPCModelGenericAVItem *)self eventStream];
      uint64_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v21 engineID];
        uint64_t v24 = self->_tempFileURLToCleanup;
        *(_DWORD *)buf = 138543874;
        v30 = v23;
        __int16 v31 = 2114;
        v32 = self;
        __int16 v33 = 2114;
        __int16 v34 = v24;
        _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to clean up downloaded asset %{public}@", buf, 0x20u);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)MPCModelGenericAVItem;
  [(MPCModelGenericAVItem *)&v25 dealloc];
}

- (BOOL)isHLSAsset
{
  return self->_hlsAsset;
}

- (void)_updateAudioFormatInfoForContentItem:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MPCModelGenericAVItem;
  [(MPCModelGenericAVItem *)&v27 _updateAudioFormatInfoForContentItem:v4];
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedGenericObject type] == 1)
  {
    uint64_t v5 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
    objc_msgSend(v4, "setSongTraits:", objc_msgSend(v5, "traits"));
  }
  os_unfair_lock_unlock(&self->_genericObjectLock);
  unint64_t v6 = [(MPCModelGenericAVItem *)self modelPlayEvent];
  uint64_t v7 = [v6 itemType];
  if (v7 == 3)
  {
    double v8 = [v6 playlist];
    if ([v8 hasLoadedValueForKey:*MEMORY[0x263F11680]])
    {
      objc_msgSend(v4, "setPlaylistTraits:", objc_msgSend(v8, "traits"));
      goto LABEL_16;
    }
    __int16 v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = self;
      __int16 v36 = 2114;
      double v37 = v8;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_FAULT, "%{public}@: Uninitialized MPModelPropertyPlaylistTraits properties - playlist=%{public}@.", buf, 0x16u);
    }

    v28[0] = @"playEvent";
    dispatch_queue_t v16 = [v6 description];
    v29[0] = v16;
    v28[1] = @"item";
    __int16 v17 = [(MPCModelGenericAVItem *)self description];
    v29[1] = v17;
    v28[2] = @"playlist";
    uint64_t v18 = [v8 description];
    v29[2] = v18;
    char v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
    v30 = v19;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];

    [MEMORY[0x263F54EC8] snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"ModelBug" context:@"playlist.traits=nil" triggerThresholdValues:&stru_26CBCA930 events:v14 completion:0];
LABEL_15:

    goto LABEL_16;
  }
  if (v7 != 1) {
    goto LABEL_17;
  }
  double v8 = [v6 album];
  if (![v8 hasLoadedValueForKey:*MEMORY[0x263F114C8]])
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = self;
      __int16 v36 = 2114;
      double v37 = v8;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_FAULT, "%{public}@: Uninitialized MPModelPropertyAlbumTraits - album=%{public}@.", buf, 0x16u);
    }

    v31[0] = @"playEvent";
    dispatch_time_t v10 = [v6 description];
    v32[0] = v10;
    v31[1] = @"item";
    uint64_t v11 = [(MPCModelGenericAVItem *)self description];
    v32[1] = v11;
    v31[2] = @"album";
    id v12 = [v8 description];
    v32[2] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
    __int16 v33 = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];

    [MEMORY[0x263F54EC8] snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"ModelBug" context:@"album.traits=nil" triggerThresholdValues:&stru_26CBCA930 events:v14 completion:0];
    goto LABEL_15;
  }
  objc_msgSend(v4, "setAlbumTraits:", objc_msgSend(v8, "traits"));
LABEL_16:

LABEL_17:
  preferredFormat = self->_preferredFormat;
  if (preferredFormat)
  {
    uint64_t v21 = [(MPCPlayerAudioFormat *)preferredFormat nowPlayingAudioFormat];
    [v4 setPreferredFormat:v21];
  }
  activeFormat = self->_activeFormat;
  if (activeFormat)
  {
    v23 = [(MPCPlayerAudioFormat *)activeFormat nowPlayingAudioFormat];
    [v4 setActiveFormat:v23];

    [v4 setActiveFormatJustification:self->_activeFormatJustification];
  }
  audioRoute = self->_audioRoute;
  if (audioRoute)
  {
    objc_super v25 = [(MPCPlayerAudioRoute *)audioRoute nowPlayingAudioRoute];
    [v4 setAudioRoute:v25];
  }
  objc_msgSend(v4, "setFormatTierPreference:", -[MPCModelGenericAVItem _audioFormatPreference](self, "_audioFormatPreference"));
  if ([(NSArray *)self->_alternateFormats count])
  {
    id v26 = [(NSArray *)self->_alternateFormats msv_map:&__block_literal_global_420];
    [v4 setAlternativeFormats:v26];
  }
}

- (unint64_t)_audioFormatPreference
{
  return [(MPCAudioAssetTypeSelector *)self->_audioAssetTypeSelector audioFormatPreference];
}

- (id)externalContentIdentifier
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject type];
  os_unfair_lock_unlock(p_genericObjectLock);
  BOOL v5 = v4 == 9 || v4 == 6;
  if (v5 && [(MPCModelGenericAVItem *)self usesBookmarking])
  {
    int64_t v6 = [(MPCModelGenericAVItem *)self storeItemInt64ID];
    if (v6
      || (uint64_t v7 = [(MPCModelGenericAVItem *)self storeSubscriptionAdamID],
          (int64_t v6 = (int64_t)v7) != 0))
    {
      double v8 = (char *)&v14 + 1;
      uint64_t quot = v6;
      do
      {
        lldiv_t v10 = lldiv(quot, 10);
        uint64_t quot = v10.quot;
        if (v10.rem >= 0) {
          LOBYTE(v11) = v10.rem;
        }
        else {
          uint64_t v11 = -v10.rem;
        }
        *(v8 - 2) = v11 + 48;
        id v12 = (const UInt8 *)(v8 - 2);
        --v8;
      }
      while (v10.quot);
      if (v6 < 0)
      {
        *(v8 - 2) = 45;
        id v12 = (const UInt8 *)(v8 - 2);
      }
      uint64_t v7 = (__CFString *)CFStringCreateWithBytes(0, v12, (char *)&v14 - (char *)v12, 0x8000100u, 0);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_audioAssetTypeSelector, 0);
  objc_storeStrong((id *)&self->_previousQueueItemID, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_availableSortedFormats, 0);
  objc_storeStrong((id *)&self->_alternateFormats, 0);
  objc_storeStrong((id *)&self->_activeFormat, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_destroyWeak((id *)&self->_eventStream);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_jingleTimedMetadata, 0);
  objc_storeStrong((id *)&self->_genericObject, 0);
  objc_storeStrong((id *)&self->_assetCacheProvider, 0);
  objc_storeStrong((id *)&self->_preferredAudioAssetTypeSelection, 0);
  objc_storeStrong((id *)&self->_audioFormatsDictionary, 0);
  objc_storeStrong((id *)&self->_leaseStatus, 0);
  objc_storeStrong((id *)&self->_deferredLeaseAcquisitionTask, 0);
  objc_storeStrong((id *)&self->_tempFileURLToCleanup, 0);
  objc_storeStrong((id *)&self->_hlsDownloadURLRequest, 0);
  objc_storeStrong((id *)&self->_hlsDownloadURLSession, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_rtcReportingServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_streamingKeyServerURL, 0);
  objc_storeStrong((id *)&self->_streamingKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_hlsStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_timedMetadataOperationQueue, 0);
  objc_storeStrong((id *)&self->_timedMetadataResponse, 0);
  objc_storeStrong((id *)&self->_timedMetadataRequest, 0);
  objc_storeStrong((id *)&self->_identityPropertiesLoader, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_metadataGenericObject, 0);
  objc_storeStrong((id *)&self->_flattenedMetadataGenericObject, 0);
  objc_storeStrong((id *)&self->_flattenedGenericObject, 0);
  objc_storeStrong((id *)&self->_currentGlobalTimedMetadataGroups, 0);
  objc_storeStrong(&self->_firstBecomeActivePlayerItemBlock, 0);
  objc_storeStrong((id *)&self->_suzeLeaseSession, 0);
  objc_storeStrong((id *)&self->_subscriptionPlaybackInformationLoadQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionPlaybackInformation, 0);
  objc_storeStrong((id *)&self->_subscriptionLeaseSession, 0);
  objc_storeStrong((id *)&self->_subscriptionLeaseSessionLoadQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (BOOL)prioritizeStartupOverQuality
{
  return self->_prioritizeStartupOverQuality;
}

- (BOOL)isDownloadedAsset
{
  return self->_downloadedAsset;
}

- (int64_t)loadedAudioAssetType
{
  return self->_loadedAudioAssetType;
}

- (void)setAudioAssetTypeSelector:(id)a3
{
}

- (MPCAudioAssetTypeSelector)audioAssetTypeSelector
{
  return self->_audioAssetTypeSelector;
}

- (void)setPreviousQueueItemID:(id)a3
{
}

- (NSString)previousQueueItemID
{
  return self->_previousQueueItemID;
}

- (MPCPlayerAudioRoute)audioRoute
{
  return self->_audioRoute;
}

- (void)setAvailableSortedFormats:(id)a3
{
}

- (NSArray)availableSortedFormats
{
  return self->_availableSortedFormats;
}

- (void)setAlternateFormats:(id)a3
{
}

- (NSArray)alternateFormats
{
  return self->_alternateFormats;
}

- (void)setActiveFormatJustification:(int64_t)a3
{
  self->_activeFormatJustification = a3;
}

- (int64_t)activeFormatJustification
{
  return self->_activeFormatJustification;
}

- (void)setActiveFormat:(id)a3
{
}

- (MPCPlayerAudioFormat)activeFormat
{
  return self->_activeFormat;
}

- (void)setPreferredFormat:(id)a3
{
}

- (MPCPlayerAudioFormat)preferredFormat
{
  return self->_preferredFormat;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);

  return (MPCPlaybackEngineEventStream *)WeakRetained;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setTrackInfo:(id)a3
{
}

- (NSDictionary)trackInfo
{
  return self->_trackInfo;
}

- (void)setStationItemLikedState:(int64_t)a3
{
  self->_stationItemLikedState = a3;
}

- (int64_t)stationItemLikedState
{
  return self->_stationItemLikedState;
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void)setSubscriptionRequired:(BOOL)a3
{
  self->_subscriptionRequired = a3;
}

- (BOOL)isSubscriptionRequired
{
  return self->_subscriptionRequired;
}

- (void)setRadioStreamPlayback:(BOOL)a3
{
  self->_radioStreamPlayback = a3;
}

- (void)setRadioPlayback:(BOOL)a3
{
  self->_radioPlayback = a3;
}

- (NSNumber)isSiriInitiated
{
  return self->_siriInitiated;
}

- (NSData)jingleTimedMetadata
{
  return self->_jingleTimedMetadata;
}

- (MPModelGenericObject)genericObject
{
  return self->_genericObject;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  self->_equivalencySourceAdamID = a3;
}

- (int64_t)equivalencySourceAdamID
{
  return self->_equivalencySourceAdamID;
}

- (MPCModelPlaybackAssetCacheProviding)assetCacheProvider
{
  return self->_assetCacheProvider;
}

- (MPCAudioAssetTypeSelection)preferredAudioAssetTypeSelection
{
  return self->_preferredAudioAssetTypeSelection;
}

- (int64_t)preferredAudioAssetType
{
  return self->_preferredAudioAssetType;
}

- (void)setAudioFormatsDictionary:(id)a3
{
}

- (NSDictionary)audioFormatsDictionary
{
  return self->_audioFormatsDictionary;
}

- (id)leaseStatus
{
  return self->_leaseStatus;
}

- (int64_t)leasePlaybackPreventionState
{
  return self->_leasePlaybackPreventionState;
}

- (void)resetPlaybackStartTimeForReuse
{
}

- (id)_chapterDataAt:(double)a3
{
  BOOL v5 = [(MPCModelGenericAVItem *)self chapters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v16 = 0;
    __int16 v17 = &v16;
    uint64_t v18 = 0x3032000000;
    char v19 = __Block_byref_object_copy__767;
    id v20 = __Block_byref_object_dispose__768;
    id v21 = 0;
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = -1;
    uint64_t v7 = [(MPCModelGenericAVItem *)self chapters];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__MPCModelGenericAVItem__chapterDataAt___block_invoke;
    v11[3] = &unk_2643BEB58;
    *(double *)&v11[6] = a3;
    void v11[4] = &v16;
    v11[5] = &v12;
    [v7 enumerateObjectsUsingBlock:v11];

    if (!v17[5] || v13[3] < 0)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v8 setObject:v17[5] forKeyedSubscript:@"ChapterDataItemKey"];
      uint64_t v9 = [NSNumber numberWithInteger:v13[3]];
      [v8 setObject:v9 forKeyedSubscript:@"ChapterDataIndexKey"];
    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __40__MPCModelGenericAVItem__chapterDataAt___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  [v12 startTime];
  if (v8 <= *(double *)(a1 + 48))
  {
    [v12 startTime];
    double v10 = v9;
    [v12 duration];
    if (v10 + v11 > *(double *)(a1 + 48))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

- (id)previousChapterBefore:(double)a3
{
  uint64_t v4 = [(MPCModelGenericAVItem *)self _chapterDataAt:a3];
  BOOL v5 = [v4 objectForKey:@"ChapterDataIndexKey"];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0 && (uint64_t v6 = [v5 integerValue], v7 = v6 - 1, v6 >= 1))
  {
    double v8 = [(MPCModelGenericAVItem *)self chapters];
    double v9 = [v8 objectAtIndexedSubscript:v7];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)nextChapterAfter:(double)a3
{
  uint64_t v4 = [(MPCModelGenericAVItem *)self _chapterDataAt:a3];
  BOOL v5 = [v4 objectForKey:@"ChapterDataIndexKey"];
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t v6 = [v5 integerValue],
        [(MPCModelGenericAVItem *)self chapters],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count] - 1,
        v7,
        v6 < v8))
  {
    double v9 = [(MPCModelGenericAVItem *)self chapters];
    double v10 = [v9 objectAtIndexedSubscript:v6 + 1];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)chapterAt:(double)a3
{
  unint64_t v3 = [(MPCModelGenericAVItem *)self _chapterDataAt:a3];
  uint64_t v4 = [v3 objectForKey:@"ChapterDataItemKey"];

  return v4;
}

- (void)setChapters:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  [(MPCModelGenericAVItem *)self willChangeValueForKey:@"chapters"];
  chapters = self->_chapters;
  self->_chapters = v4;
  unint64_t v6 = v4;

  uint64_t v7 = [(NSArray *)v6 count];
  [*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F12370]) setNumberOfChildren:v7];

  [(MPCModelGenericAVItem *)self didChangeValueForKey:@"chapters"];
}

- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6
{
  v15[1] = *MEMORY[0x263EF8340];
  if (a6)
  {
    unint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = @"keyIdentifier";
    v15[0] = a4;
    double v9 = NSDictionary;
    id v10 = a6;
    id v11 = a4;
    id v12 = [v9 dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v13 = objc_msgSend(v8, "msv_errorWithDomain:code:underlyingError:userInfo:debugDescription:", @"MPCError", 71, v10, v12, @"Failed to delivery SKD key");

    [(MPCModelGenericAVItem *)self addAdjunctError:v13];
  }
}

- (void)reevaluateType
{
  if ((unint64_t)(self->_loadedAudioAssetType - 3) > 2)
  {
    if ([(MPCModelGenericAVItem *)self isAssetLoaded])
    {
      v5.receiver = self;
      v5.super_class = (Class)MPCModelGenericAVItem;
      [(MPCModelGenericAVItem *)&v5 reevaluateType];
    }
  }
  else if ([(MPCModelGenericAVItem *)self type] != 1)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"MPCModelGenericAVItem.m" lineNumber:5302 description:@"Unexpected item type for loaded enhanced audio"];
  }
}

- (void)_removeFromDownloadCompletionPendingItems
{
  id obj = +[MPCModelGenericAVItem _downloadCompletionPendingItems];
  objc_sync_enter(obj);
  [obj removeObject:self];
  objc_sync_exit(obj);
}

- (void)_addToDownloadCompletionPendingItems
{
  id obj = +[MPCModelGenericAVItem _downloadCompletionPendingItems];
  objc_sync_enter(obj);
  [obj addObject:self];
  objc_sync_exit(obj);
}

- (void)resumeContentKeySession
{
  contentKeySession = self->_contentKeySession;
  if (contentKeySession) {
    [(ICContentKeySession *)contentKeySession resumeAutomaticKeyRenewal];
  }
}

- (void)pauseContentKeySession
{
  contentKeySession = self->_contentKeySession;
  if (contentKeySession) {
    [(ICContentKeySession *)contentKeySession pauseAutomaticKeyRenewal];
  }
}

- (id)analyticsFormatType
{
  unint64_t v3 = [(MPCModelGenericAVItem *)self activeFormat];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MPCModelGenericAVItem *)self preferredFormat];
  }
  unint64_t v6 = v5;

  unsigned int v7 = bswap32([v6 codec]);
  unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v7, BYTE1(v7), BYTE2(v7), HIBYTE(v7));
  double v9 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];

  if ([v6 bitrate] >= 1)
  {
    [NSString stringWithFormat:@"%@,%ldkbps,%ld", v10, objc_msgSend(v6, "bitrate") / 1000, (unsigned __int16)objc_msgSend(v6, "channelLayout")];
LABEL_8:
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([v6 sampleRate] >= 1)
  {
    [NSString stringWithFormat:@"%@,%ldkhz,%ld", v10, objc_msgSend(v6, "sampleRate") / 1000, objc_msgSend(v6, "bitDepth")];
    goto LABEL_8;
  }
  uint64_t v14 = &stru_26CBCA930;
  if (v10) {
    uint64_t v14 = v10;
  }
  id v11 = v14;
LABEL_9:
  id v12 = v11;

  return v12;
}

- (id)analyticsContentType
{
  unint64_t v3 = @"CRABS";
  if ([(MPCModelGenericAVItem *)self loadedAudioAssetType] >= 2
    && [(MPCModelGenericAVItem *)self isHLSAsset])
  {
    unint64_t v3 = @"HLS";
  }

  return v3;
}

- (void)_updatePreventionStatusWithLeaseSession:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self->_subscriptionLeaseRequestCount >= 1)
  {
    self->_didDeferPreventionStatusUpdate = 1;
    goto LABEL_22;
  }
  unint64_t v6 = [v4 leaseStatus];
  unsigned int v7 = [(MPCModelGenericAVItem *)self eventStream];
  unint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [v7 engineID];
    id v10 = [v5 leaseStatus];
    int v24 = 138543874;
    objc_super v25 = v9;
    __int16 v26 = 2114;
    objc_super v27 = self;
    __int16 v28 = 2114;
    int64_t v29 = (int64_t)v10;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: _updatePreventionStatusWithLeaseSession - updating prevention status - lease status: %{public}@", (uint8_t *)&v24, 0x20u);
  }
  if (([v6 hasInflightLeaseAcquisition] & 1) != 0
    || (deferredLeaseAcquisitionTask = self->_deferredLeaseAcquisitionTask) != 0
    && ![(MPCDeferrableTask *)deferredLeaseAcquisitionTask isFinished])
  {
LABEL_15:
    int64_t v13 = 0;
    goto LABEL_16;
  }
  uint64_t v12 = [v6 leaseState];
  if (v12 != 2)
  {
    uint64_t v14 = v12;
    if ([v6 shouldPlaybackRequireOnlineKeys])
    {
      if (v14)
      {
        if ([v6 hasOnlinePlaybackKeys]) {
          int64_t v13 = 0;
        }
        else {
          int64_t v13 = 3;
        }
      }
      else
      {
        int64_t v13 = 2;
      }
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int64_t v13 = 1;
LABEL_16:
  if (self->_leasePlaybackPreventionState != v13)
  {
    BOOL v15 = [(MPCModelGenericAVItem *)self shouldPreventPlayback];
    self->_int64_t leasePlaybackPreventionState = v13;
    uint64_t v16 = (ICMusicSubscriptionLeaseStatus *)[v6 copy];
    leaseStatus = self->_leaseStatus;
    self->_leaseStatus = v16;

    uint64_t v18 = [(MPCModelGenericAVItem *)self eventStream];
    char v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v18 engineID];
      int64_t leasePlaybackPreventionState = self->_leasePlaybackPreventionState;
      uint64_t v22 = self->_leaseStatus;
      int v24 = 138544130;
      objc_super v25 = v20;
      __int16 v26 = 2114;
      objc_super v27 = self;
      __int16 v28 = 2048;
      int64_t v29 = leasePlaybackPreventionState;
      __int16 v30 = 2114;
      __int16 v31 = v22;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: _updatePreventionStatusWithLeaseSession - Lease playback prevention state did change to: %li [status: %{public}@", (uint8_t *)&v24, 0x2Au);
    }
    if (v15 != [(MPCModelGenericAVItem *)self shouldPreventPlayback])
    {
      v23 = [MEMORY[0x263F08A00] defaultCenter];
      [v23 postNotificationName:*MEMORY[0x263F11148] object:self];
    }
  }

LABEL_22:
}

- (void)_updateJingleTimedMetadata
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v23 = self;
  id obj = self->_currentGlobalTimedMetadataGroups;
  uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    objc_super v27 = 0;
    uint64_t v25 = *(void *)v34;
    uint64_t v2 = *MEMORY[0x263EF9E80];
    uint64_t v3 = *MEMORY[0x263EF9DF8];
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        unint64_t v6 = objc_msgSend(v5, "items", v23);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v28 = i;
          uint64_t v9 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v30 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              uint64_t v12 = [v11 keySpace];
              int v13 = [v12 isEqualToString:v2];

              if (v13)
              {
                uint64_t v14 = [v11 key];
                int v15 = [v14 isEqual:v3];

                if (v15)
                {
                  uint64_t v16 = [v11 extraAttributes];
                  __int16 v17 = [v16 objectForKey:@"info"];
                  if ([v17 isEqual:@"com.apple.radio.ping.jingle"])
                  {
                    uint64_t v18 = [v11 dataValue];

                    objc_super v27 = (NSData *)v18;
                    goto LABEL_19;
                  }
                }
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v8) {
              continue;
            }
            break;
          }
LABEL_19:
          uint64_t i = v28;
        }
      }
      uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }
  else
  {
    objc_super v27 = 0;
  }

  char v19 = v23->_jingleTimedMetadata;
  id v20 = v27;
  if (v19 == v27) {
    goto LABEL_27;
  }
  id v21 = v19;
  char v22 = [(NSData *)v19 isEqual:v27];

  if ((v22 & 1) == 0)
  {
    objc_storeStrong((id *)&v23->_jingleTimedMetadata, v27);
    id v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 postNotificationName:@"MPCAVItemReportingJingleTimedMetadataDidChangeNotification" object:v23];
LABEL_27:
  }
}

- (void)_updateAutomaticSubscriptionLeaseRefresh
{
  if (self->_isSubscriptionPolicyContent)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke;
    v2[3] = &unk_2643BEB30;
    v2[4] = self;
    [(MPCModelGenericAVItem *)self _getSubscriptionLeasePropertiesWithCompletion:v2];
  }
}

void __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v7 = a3;
  id v5 = v4;
  id v6 = v7;
  msv_dispatch_on_main_queue();
}

void __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke_2(id *a1)
{
  [a1[4] _currentPlaybackRate];
  int v3 = v2 > 0.00000011921
    && [a1[4] isAssetLoaded]
    && [a1[5] shouldUseLease]
    && a1[6] != 0;
  id v4 = a1[4];
  if (v4[584] != v3)
  {
    v4[584] = v3;
    if ([a1[4] isAssetLoaded])
    {
      if (*((unsigned char *)a1[4] + 584))
      {
        id v5 = a1[6];
        [v5 beginAutomaticallyRefreshingLease];
      }
      else
      {
        dispatch_time_t v6 = dispatch_time(0, 2000000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke_3;
        block[3] = &unk_2643C5FC8;
        id v8 = a1[6];
        dispatch_after(v6, MEMORY[0x263EF83A0], block);
      }
    }
  }
}

uint64_t __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) endAutomaticallyRefreshingLease];
}

- (id)_storeUbiquitousIdentifier
{
  float v2 = [(MPCModelGenericAVItem *)self _modelPlaybackPosition];
  int v3 = [v2 storeUbiquitousIdentifier];

  return v3;
}

- (id)_rtcReportingServiceIdentifierWithAssetURL:(id)a3
{
  id v4 = a3;
  if (self->_radioPlayback)
  {
    if ([(MPCModelGenericAVItem *)self isHLSAsset]) {
      id v5 = @"tilt.stream-track";
    }
    else {
      id v5 = @"tilt.track";
    }
    goto LABEL_22;
  }
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v6 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
  if (v6 == 9)
  {
    uint64_t v8 = [(MPModelGenericObject *)self->_flattenedGenericObject movie];
LABEL_13:
    id v7 = (void *)v8;
    id v5 = &stru_26CBCA930;
    goto LABEL_14;
  }
  if (v6 == 6)
  {
    uint64_t v8 = [(MPModelGenericObject *)self->_flattenedGenericObject tvEpisode];
    goto LABEL_13;
  }
  id v5 = &stru_26CBCA930;
  if (v6 != 1)
  {
    uint64_t v9 = 0;
    id v10 = 0;
    goto LABEL_16;
  }
  id v7 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
  if ([v7 isArtistUploadedContent]) {
    id v5 = @"uploaded-content";
  }
LABEL_14:
  uint64_t v9 = [v7 storeAsset];
  id v10 = [v7 localFileAsset];

LABEL_16:
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if (![(__CFString *)v5 length])
  {
    if ([v9 isRedownloadable])
    {
      unint64_t v17 = [v9 endpointType] - 1;
      if (v17 < 3) {
        id v5 = off_2643BEC38[v17];
      }
    }
    else
    {
      uint64_t v18 = [v10 filePath];
      if ([v18 length])
      {
        int v19 = [v10 isNonPurgeable];

        if (v19) {
          id v5 = @"synced";
        }
      }
      else
      {
      }
    }
  }
  uint64_t v11 = [(__CFString *)v5 length];
  if (v4 && v11 && ([v4 isFileURL] & 1) == 0)
  {
    id v5 = [(__CFString *)v5 stringByAppendingString:@".cloud"];
  }

LABEL_22:
  uint64_t v12 = +[MPCRTCEventConsumer playerServiceNameWithPlayerID:self->_playerID];
  uint64_t v13 = [(__CFString *)v5 length];
  uint64_t v14 = @"unknown";
  if (v13) {
    uint64_t v14 = v5;
  }
  int v15 = [v12 stringByAppendingFormat:@".%@", v14];

  return v15;
}

- (id)_rtcReportingMediaIdentifierWithAssetLoadProperties:(id)a3
{
  id v4 = [a3 itemIdentifiers];
  id v5 = [v4 universalStore];
  uint64_t v6 = +[MPCRTCEventConsumer rtcIdentifiersFromUniversalIdentifiers:v5];

  id v7 = [(MPCModelGenericAVItem *)self _radioStation];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 type] == 8)
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v10 = [v8 identifiers];
      uint64_t v11 = [v10 radio];
      uint64_t v9 = +[MPCRTCEventConsumer rtcIdentifiersFromRadioIdentifiers:v11];
    }
    if ([v8 type] == 4)
    {
      uint64_t v12 = +[MPCRTCEventConsumer rtcIdentifiersFromUniversalIdentifiers:0];

      uint64_t v6 = (void *)v12;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v13 = +[MPCRTCEventConsumer identifierStringFromItemIdentifiers:v6 radioIdentifiers:v9];

  return v13;
}

- (void)_postInvalidationNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x263F110E8] object:self];
  [v3 postNotificationName:*MEMORY[0x263F110F8] object:self];
  [v3 postNotificationName:*MEMORY[0x263F11100] object:self];
  [v3 postNotificationName:*MEMORY[0x263F11150] object:self];
  [v3 postNotificationName:*MEMORY[0x263F11110] object:self];
  [v3 postNotificationName:*MEMORY[0x263F110F0] object:self];
  [(MPCModelGenericAVItem *)self updatePlayerItemMetadata];
}

- (void)_invalidateContentItemForTimedMetadataChangesChangingRevisionID:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(MPCModelGenericAVItem *)self queueItemID];
    [(MPCModelGenericAVItem *)self setPreviousQueueItemID:v4];

    id v5 = [(MPCModelGenericAVItem *)self contentItemID];
    uint64_t v6 = [(MPCModelGenericAVItem *)self queueSectionID];
    id v7 = MSVNanoIDCreateTaggedPointer();
    [(MPCModelGenericAVItem *)self setContentItemID:v5 queueSectionID:v6 queueItemID:v7];
  }

  [(MPCModelGenericAVItem *)self _updateContentItemIncludingPlaybackState:0];
}

- (void)_getUnverifiedSubscriptionLeaseSessionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(MPCModelGenericAVItem *)self _allowsStreamingPlayback])
  {
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__767;
    uint64_t v26 = __Block_byref_object_dispose__768;
    id v27 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    int v19 = __Block_byref_object_copy__767;
    id v20 = __Block_byref_object_dispose__768;
    id v21 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke;
    block[3] = &unk_2643BF080;
    void block[4] = self;
    block[5] = &v22;
    block[6] = &v28;
    block[7] = &v16;
    dispatch_barrier_sync(accessQueue, block);
    if (*((unsigned char *)v29 + 24))
    {
      v4[2](v4, v23[5]);
    }
    else
    {
      uint64_t v6 = [(MPCModelGenericAVItem *)self _storeRequestContext];
      id v7 = v17[5];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_2;
      v9[3] = &unk_2643BEB08;
      uint64_t v12 = &v16;
      v9[4] = self;
      uint64_t v13 = &v22;
      uint64_t v14 = &v28;
      id v10 = v6;
      uint64_t v11 = v4;
      id v8 = v6;
      dispatch_async(v7, v9);
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v4[2](v4, 0);
  }
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 552));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 537);
  float v2 = *(void **)(a1[4] + 544);
  if (!v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseSessionLoadQueue", v3);
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 544);
    *(void *)(v5 + 544) = v4;

    float v2 = *(void **)(a1[4] + 544);
  }
  id v7 = (id *)(*(void *)(a1[7] + 8) + 40);

  objc_storeStrong(v7, v2);
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  float v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseLoadCalloutQueue", v2);

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 528);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_3;
  block[3] = &unk_2643C5E20;
  void block[4] = v4;
  long long v25 = *(_OWORD *)(a1 + 64);
  dispatch_sync(v5, block);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_4;
    v21[3] = &unk_2643BEAB8;
    uint64_t v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v22 = v6;
    uint64_t v23 = v7;
    dispatch_async(v3, v21);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    id v8 = v22;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) eventStream];
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v9 engineID];
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v27 = v11;
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Loading subscription lease session...", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F891E0] sharedController];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_494;
    v17[3] = &unk_2643BEAE0;
    uint64_t v14 = *(void *)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    uint64_t v18 = v3;
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    id v19 = v15;
    uint64_t v20 = v16;
    [v13 getLeaseSessionWithRequestContext:v14 completionHandler:v17];

    id v8 = v18;
  }
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_3(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 537);
}

uint64_t __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_494(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) eventStream];
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v7 engineID];
      id v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      id v25 = v10;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Finished loading subscription lease session: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Failed to load subscription lease session with error: %{public}@", buf, 0x16u);
    }
  }

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(NSObject **)(v12 + 528);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_495;
  block[3] = &unk_2643BFDF8;
  void block[4] = v12;
  id v18 = v5;
  id v19 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  id v20 = v14;
  uint64_t v21 = v15;
  id v16 = v5;
  dispatch_barrier_async(v13, block);
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_495(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 537) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 552), *(id *)(a1 + 40));
  float v2 = *(void **)(a1 + 32);
  if (v2[69])
  {
    id v3 = [v2 eventStream];
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 engineID];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 552);
      *(_DWORD *)buf = 138543874;
      id v14 = v5;
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Posting ICMusicSubscriptionLeaseSessionLeaseStatusDidChangeNotification: %{public}@", buf, 0x20u);
    }
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:*(void *)(a1 + 32) selector:sel__subscriptionLeaseStatusDidChangeNotification_ name:*MEMORY[0x263F88F58] object:*(void *)(*(void *)(a1 + 32) + 552)];
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_498;
  v10[3] = &unk_2643C55A8;
  uint64_t v9 = *(NSObject **)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  dispatch_async(v9, v10);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
}

uint64_t __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_498(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_getSubscriptionLeasePropertiesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t, void))a3;
  if ([(MPCModelGenericAVItem *)self _allowsStreamingPlayback])
  {
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    long long v32 = __Block_byref_object_copy__767;
    long long v33 = __Block_byref_object_dispose__768;
    id v34 = 0;
    uint64_t v23 = 0;
    __int16 v24 = &v23;
    uint64_t v25 = 0x3032000000;
    __int16 v26 = __Block_byref_object_copy__767;
    id v27 = __Block_byref_object_dispose__768;
    id v28 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__767;
    uint64_t v21 = __Block_byref_object_dispose__768;
    id v22 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke;
    block[3] = &unk_2643BE9A0;
    void block[4] = self;
    void block[5] = &v29;
    block[6] = &v35;
    block[7] = &v23;
    void block[8] = &v17;
    dispatch_barrier_sync(accessQueue, block);
    if (*((unsigned char *)v36 + 24))
    {
      v4[2](v4, v30[5], v24[5], 0);
    }
    else
    {
      uint64_t v6 = [(MPCModelGenericAVItem *)self _storeRequestContext];
      uint64_t v7 = v18[5];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_2;
      v9[3] = &unk_2643BEA90;
      id v12 = &v17;
      v9[4] = self;
      uint64_t v13 = &v29;
      id v14 = &v35;
      __int16 v15 = &v23;
      id v10 = v6;
      id v11 = v4;
      id v8 = v6;
      dispatch_async(v7, v9);
    }
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v4[2](v4, 0, 0, 0);
  }
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 552));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 560);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 568));
  float v2 = *(void **)(a1[4] + 576);
  if (!v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseSessionLoadQueue", v3);
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 576);
    *(void *)(v5 + 576) = v4;

    float v2 = *(void **)(a1[4] + 576);
  }
  uint64_t v7 = (id *)(*(void *)(a1[8] + 8) + 40);

  objc_storeStrong(v7, v2);
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  float v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseLoadCalloutQueue", v2);

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 528);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_3;
  block[3] = &unk_2643BF080;
  long long v31 = *(_OWORD *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 80);
  void block[4] = v4;
  uint64_t v32 = v6;
  dispatch_sync(v5, block);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_4;
    v26[3] = &unk_2643BE9C8;
    uint64_t v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 64);
    id v27 = v7;
    uint64_t v28 = v8;
    uint64_t v29 = *(void *)(a1 + 80);
    dispatch_async(v3, v26);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v9 = v27;
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_5;
    aBlock[3] = &unk_2643BEA18;
    aBlock[4] = *(void *)(a1 + 32);
    uint64_t v23 = v3;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v24 = v10;
    uint64_t v25 = v11;
    id v12 = _Block_copy(aBlock);
    uint64_t v13 = [*(id *)(a1 + 32) eventStream];
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [v13 engineID];
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v34 = v15;
      __int16 v35 = 2114;
      uint64_t v36 = v16;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Loading subscription status...", buf, 0x16u);
    }
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_489;
    v20[3] = &unk_2643BEA68;
    v20[4] = v18;
    id v21 = v12;
    id v19 = v12;
    [v18 _getSubscriptionStatusWithStoreRequestContext:v17 completion:v20];

    uint64_t v9 = v23;
  }
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_3(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 552));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 560);
  float v2 = *(void **)(a1[4] + 568);
  id v3 = (id *)(*(void *)(a1[7] + 8) + 40);

  objc_storeStrong(v3, v2);
}

uint64_t __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), 0);
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 528);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_6;
  block[3] = &unk_2643BE9F0;
  id v17 = v9;
  uint64_t v18 = v10;
  id v19 = v8;
  id v20 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v21 = v7;
  id v22 = v12;
  uint64_t v23 = *(void *)(a1 + 56);
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  dispatch_barrier_async(v11, block);
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_489(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F12300]) initWithICSubscriptionStatus:v5];
    id v8 = [*(id *)(a1 + 32) eventStream];
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 engineID];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v24 = v10;
      __int16 v25 = 2114;
      uint64_t v26 = v11;
      __int16 v27 = 2114;
      id v28 = v5;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Finished loading subscription status: %{public}@", buf, 0x20u);
    }
    int v12 = [v7 shouldUseLease];
    id v13 = *(void **)(a1 + 32);
    if (v12)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_491;
      v20[3] = &unk_2643BEA40;
      id v22 = *(id *)(a1 + 40);
      id v21 = v7;
      [v13 _getUnverifiedSubscriptionLeaseSessionWithCompletion:v20];
    }
    else
    {
      uint64_t v16 = [*(id *)(a1 + 32) eventStream];
      id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v16 engineID];
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v24 = v18;
        __int16 v25 = 2114;
        uint64_t v26 = v19;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Skipping subscription lease load since the subscription status indicated it shouldn't be used", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v24 = v15;
      __int16 v25 = 2114;
      uint64_t v26 = 0;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Finished loading subscription status: %{public}@ with error: %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_491(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), 0);
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_6(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 560) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 568), *(id *)(a1 + 48));
  }
  float v2 = *(NSObject **)(a1 + 56);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_7;
  v3[3] = &unk_2643C3D38;
  id v7 = *(id *)(a1 + 72);
  id v4 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
}

uint64_t __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_7(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_getSubscriptionStatusWithStoreRequestContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [v5 delegatedIdentity];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 identity];
  }
  uint64_t v10 = v9;

  uint64_t v11 = +[MPCPlaybackAccountManager sharedManager];
  int v12 = [v11 accountForUserIdentity:v10];

  id v13 = [v12 subscriptionStatus];
  if (v13)
  {
    v6[2](v6, v13, 0);
  }
  else
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263F89218]) initWithStoreRequestContext:v5];
    [v14 setShouldIgnoreCache:0];
    [v14 setAllowsFallbackToExpiredStatus:1];
    [v14 setAllowsFallbackToStatusNeedingReload:1];
    id v15 = [MEMORY[0x263F89208] sharedStatusController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__MPCModelGenericAVItem__getSubscriptionStatusWithStoreRequestContext_completion___block_invoke;
    v16[3] = &unk_2643BE978;
    id v17 = v6;
    [v15 performSubscriptionStatusRequest:v14 withCompletionHandler:v16];
  }
}

void __82__MPCModelGenericAVItem__getSubscriptionStatusWithStoreRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 subscriptionStatus];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (id)_bookmarkTime
{
  float v2 = [(MPCModelGenericAVItem *)self _modelPlaybackPosition];
  [v2 bookmarkTime];
  double v4 = v3;

  if (v4 <= 0.00000011920929)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [NSNumber numberWithDouble:v4];
  }

  return v5;
}

- (void)_applyPreferredPeakBitRateToPlayerItem:(id)a3 withItemType:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F89110] sharedMonitor];
  uint64_t v8 = [v7 lastKnownNetworkType];

  id v9 = objc_opt_class();
  if (a4 != 2)
  {
    int v13 = [v9 _prefersHighQualityAudioContentForNetworkType:v8];
    if (v13) {
      double v14 = 0.0;
    }
    else {
      double v14 = 102400.0;
    }
    [v6 preferredPeakBitRate];
    if (vabdd_f64(v14, v15) <= 2.22044605e-16) {
      goto LABEL_29;
    }
    [v6 setPreferredPeakBitRate:v14];
    uint64_t v16 = [(MPCModelGenericAVItem *)self eventStream];
    id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    uint64_t v18 = [v16 engineID];
    uint64_t v19 = (void *)v18;
    id v20 = @"Unknown";
    if (v8 > 99)
    {
      if (v8 > 1000)
      {
        switch(v8)
        {
          case 1001:
            id v20 = @"Bridged WiFi";
            break;
          case 2000:
            id v20 = @"Wired Ethernet";
            break;
          case 3000:
            id v20 = @"Other";
            break;
        }
        goto LABEL_12;
      }
      if (v8 != 100)
      {
        if (v8 == 500)
        {
          id v20 = @"Bluetooth";
        }
        else if (v8 == 1000)
        {
          id v20 = @"WiFi";
        }
        goto LABEL_12;
      }
    }
    else if ((unint64_t)(v8 - 1) >= 8)
    {
LABEL_12:
      int v29 = 138544642;
      uint64_t v30 = v18;
      __int16 v31 = 2114;
      uint64_t v32 = self;
      __int16 v33 = 2048;
      double v34 = v14;
      __int16 v35 = 2114;
      uint64_t v36 = v20;
      __int16 v37 = 2048;
      uint64_t v38 = v8;
      __int16 v39 = 1024;
      int v40 = v13;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Set preferredPeakBitRate=%f lastKnownNetwork=%{public}@ (%ld) prefersHighQualityContent=%{BOOL}u", (uint8_t *)&v29, 0x3Au);

      goto LABEL_28;
    }
    id v20 = @"Cellular";
    goto LABEL_12;
  }
  int v10 = [v9 _prefersHighQualityVideoContentForNetworkType:v8];
  if (v10)
  {
    double v12 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular) {
      double v11 = 432.0;
    }
    else {
      double v11 = 576.0;
    }
    if (IsCellular) {
      double v12 = 768.0;
    }
    else {
      double v12 = 1024.0;
    }
  }
  [v6 preferredMaximumResolution];
  if (v12 != v23 || v11 != v22)
  {
    objc_msgSend(v6, "setPreferredMaximumResolution:", v12, v11);
    uint64_t v16 = [(MPCModelGenericAVItem *)self eventStream];
    id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = [v16 engineID];
      v42.width = v12;
      v42.height = v11;
      uint64_t v26 = NSStringFromCGSize(v42);
      __int16 v27 = (void *)v26;
      id v28 = @"Unknown";
      if (v8 > 99)
      {
        if (v8 > 1000)
        {
          switch(v8)
          {
            case 1001:
              id v28 = @"Bridged WiFi";
              break;
            case 2000:
              id v28 = @"Wired Ethernet";
              break;
            case 3000:
              id v28 = @"Other";
              break;
          }
          goto LABEL_27;
        }
        if (v8 != 100)
        {
          if (v8 == 500)
          {
            id v28 = @"Bluetooth";
          }
          else if (v8 == 1000)
          {
            id v28 = @"WiFi";
          }
          goto LABEL_27;
        }
      }
      else if ((unint64_t)(v8 - 1) >= 8)
      {
LABEL_27:
        int v29 = 138544642;
        uint64_t v30 = (uint64_t)v25;
        __int16 v31 = 2114;
        uint64_t v32 = self;
        __int16 v33 = 2114;
        double v34 = *(double *)&v26;
        __int16 v35 = 2114;
        uint64_t v36 = v28;
        __int16 v37 = 2048;
        uint64_t v38 = v8;
        __int16 v39 = 1024;
        int v40 = v10;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Set preferredMaximumResolution=%{public}@ lastKnownNetwork=%{public}@ (%ld) prefersHighQualityContent=%{BOOL}u", (uint8_t *)&v29, 0x3Au);

        goto LABEL_28;
      }
      id v28 = @"Cellular";
      goto LABEL_27;
    }
LABEL_28:
  }
LABEL_29:
}

- (void)_applyLoudnessInfo
{
  v31[1] = *MEMORY[0x263EF8340];
  if ([(MPCModelGenericAVItem *)self isAssetLoaded]
    && [(MPCModelGenericAVItem *)self isHLSAsset]
    && [(MPCModelGenericAVItem *)self loadedAudioAssetType] >= 3)
  {
    double v3 = [(MPCModelGenericAVItem *)self modelPlayEvent];
    uint64_t v4 = [v3 itemType];

    if (v4 != 1) {
      return;
    }
    id v5 = [(MPCModelGenericAVItem *)self eventStream];
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 engineID];
      uint64_t v8 = [(MPCModelGenericAVItem *)self playerItem];
      int v22 = 138543874;
      double v23 = v7;
      __int16 v24 = 2114;
      __int16 v25 = self;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Enabling album loudness on player item %{public}@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v30 = *MEMORY[0x263F28E60];
    v31[0] = MEMORY[0x263EFFA88];
    id v9 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    int v10 = [(MPCModelGenericAVItem *)self playerItem];
    [v10 setLoudnessInfo:v9];
  }
  else
  {
    if (![(MPCModelGenericAVItem *)self isAssetLoaded]) {
      return;
    }
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    double v11 = [(MPCModelGenericAVItem *)self playerItem];
    int v10 = [v11 mediaKind];

    if (v10) {
      [v9 setObject:v10 forKey:*MEMORY[0x263F28E68]];
    }
    [(MPCModelGenericAVItem *)self loudnessInfoVolumeNormalization];
    float v13 = v12;
    double v14 = [(MPCModelGenericAVItem *)self modelPlayEvent];
    uint64_t v15 = [v14 itemType];

    if (v15 == 1)
    {
      [v9 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F28E60]];
    }
    else if (fabsf(v13) > 0.00000011921)
    {
      *(float *)&double v16 = __exp10f(v13 / 20.0);
      id v17 = [NSNumber numberWithFloat:v16];
      [v9 setObject:v17 forKey:*MEMORY[0x263F28E70]];
    }
    uint64_t v18 = [(MPCModelGenericAVItem *)self playerItem];
    uint64_t v19 = [(MPCModelGenericAVItem *)self eventStream];
    id v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v19 engineID];
      int v22 = 138544130;
      double v23 = v21;
      __int16 v24 = 2114;
      __int16 v25 = self;
      __int16 v26 = 2114;
      id v27 = v9;
      __int16 v28 = 2114;
      int v29 = v18;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Setting loudness info %{public}@ on player item %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    [v18 setLoudnessInfo:v9];
  }
}

- (BOOL)_allowsStreamingPlayback
{
  return 1;
}

- ($C4B24A06E922887A36692F481211F72A)_timeoutValues
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  *(_OWORD *)&retstr->var0 = _MPCAssetLoadingTimeoutDefault;
  *(_OWORD *)&retstr->var2 = unk_21BEF1718;
  *(_OWORD *)&retstr->var4 = xmmword_21BEF1728;
  *(_OWORD *)&retstr->var6 = unk_21BEF1738;
  retstr->var8 = 10;
  id v5 = [MEMORY[0x263F89110] sharedMonitor];
  int v6 = [v5 isRemoteServerLikelyReachable];

  id v7 = [MEMORY[0x263F89108] currentDeviceInfo];
  int v8 = [v7 isWatch];

  if (v6)
  {
    int64_t v9 = 20;
  }
  else
  {
    if (v8) {
      int64_t v9 = 5;
    }
    else {
      int64_t v9 = 1;
    }
    retstr->var0 = v9;
    retstr->var3 = v9;
    retstr->var4 = v9;
    retstr->var6 = v9;
    retstr->var7 = v9;
    retstr->var8 = 1;
  }
  int v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138545666;
    float v13 = self;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = 10;
    __int16 v18 = 2048;
    int64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = 10;
    __int16 v22 = 2048;
    int64_t v23 = v9;
    __int16 v24 = 2048;
    int64_t v25 = v9;
    __int16 v26 = 2048;
    uint64_t v27 = 2;
    __int16 v28 = 2048;
    int64_t v29 = v9;
    __int16 v30 = 2048;
    int64_t v31 = v9;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_INFO, "[AL] - %{public}@ - Timeout values [Network likely reachable: %{BOOL}u]: Local file=%lds - subscription lease session=%lds - home sharing=%lds - cloud streaming=%lds - cloud redownload=%lds - fairplay status=%lds - fairplay lease=%lds - suze lease=%lds", (uint8_t *)&v12, 0x62u);
  }

  return result;
}

- (void)_timedMetadataResponseDidInvalidateNotification:(id)a3
{
}

uint64_t __73__MPCModelGenericAVItem__timedMetadataResponseDidInvalidateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTimedMetadataRequest];
}

- (void)_suzeLeaseSessionRenewDidFailNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"MPCSuzeLeaseControllerUserInfoKeyError"];
  int v6 = [v4 objectForKey:@"MPCSuzeLeaseControllerUserInfoKeySession"];
  id v7 = v6;
  if (v5 && v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__MPCModelGenericAVItem__suzeLeaseSessionRenewDidFailNotification___block_invoke;
    block[3] = &unk_2643C6660;
    void block[4] = self;
    id v9 = v6;
    id v10 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __67__MPCModelGenericAVItem__suzeLeaseSessionRenewDidFailNotification___block_invoke(void *a1)
{
  float v2 = (void *)a1[4];
  if (v2[76] == a1[5])
  {
    double v3 = [v2 itemError];

    if (!v3)
    {
      uint64_t v4 = (void *)a1[4];
      uint64_t v5 = a1[6];
      [v4 setItemError:v5];
    }
  }
}

- (void)_subscriptionLeaseStatusDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__MPCModelGenericAVItem__subscriptionLeaseStatusDidChangeNotification___block_invoke;
    v6[3] = &unk_2643C5EE8;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

uint64_t __71__MPCModelGenericAVItem__subscriptionLeaseStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreventionStatusWithLeaseSession:*(void *)(a1 + 40)];
}

- (void)_contentTasteControllerDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__MPCModelGenericAVItem__contentTasteControllerDidChangeNotification___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__MPCModelGenericAVItem__contentTasteControllerDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNeedsPersistedLikedStateUpdate];
}

- (void)_ageVerificationStateDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__MPCModelGenericAVItem__ageVerificationStateDidChangeNotification___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__MPCModelGenericAVItem__ageVerificationStateDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) explicitBadge];
  [*(id *)(a1 + 32) setExplicitBadge:v2];
}

- (void)_allowsHighQualityMusicStreamingOnCellularDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__MPCModelGenericAVItem__allowsHighQualityMusicStreamingOnCellularDidChangeNotification___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __89__MPCModelGenericAVItem__allowsHighQualityMusicStreamingOnCellularDidChangeNotification___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAssetLoaded])
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [v2 playerItem];
    objc_msgSend(v2, "_applyPreferredPeakBitRateToPlayerItem:withItemType:", v3, objc_msgSend(*(id *)(a1 + 32), "type"));
  }
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__MPCModelGenericAVItem_environmentMonitorDidChangeNetworkType___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__MPCModelGenericAVItem_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAssetLoaded])
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [v2 playerItem];
    objc_msgSend(v2, "_applyPreferredPeakBitRateToPlayerItem:withItemType:", v3, objc_msgSend(*(id *)(a1 + 32), "type"));
  }
}

- (void)setGenericObject:(id)a3
{
  double v11 = (MPModelGenericObject *)a3;
  os_unfair_lock_lock(&self->_genericObjectLock);
  p_genericObject = &self->_genericObject;
  int v6 = self->_genericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if (v6 != v11)
  {
    os_unfair_lock_lock(&self->_genericObjectLock);
    objc_storeStrong((id *)&self->_genericObject, a3);
    id v7 = [(MPModelGenericObject *)*p_genericObject flattenedGenericObject];
    flattenedGenericObject = self->_flattenedGenericObject;
    self->_flattenedGenericObject = v7;

    objc_storeStrong((id *)&self->_metadataGenericObject, *p_genericObject);
    id v9 = [(MPModelGenericObject *)self->_metadataGenericObject flattenedGenericObject];
    flattenedMetadataGenericObject = self->_flattenedMetadataGenericObject;
    self->_flattenedMetadataGenericObject = v9;

    os_unfair_lock_unlock(&self->_genericObjectLock);
    [(MPCModelGenericAVItem *)self _reloadTimedMetadataRequest];
    [(MPCModelGenericAVItem *)self _setNeedsPersistedLikedStateUpdate];
    [(MPCModelGenericAVItem *)self invalidateContentItemDeviceSpecificUserInfo];
    [(MPCModelGenericAVItem *)self _postInvalidationNotifications];
  }
}

- (void)nowPlayingInfoCenter:(id)a3 lyricsForContentItem:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  os_unfair_lock_lock(&self->_genericObjectLock);
  id v9 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject anyObject];
  os_unfair_lock_unlock(&self->_genericObjectLock);
  id v10 = [v8 identifier];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 length])
  {
    id v11 = v9;
    id v12 = objc_alloc_init(MEMORY[0x263F122B8]);
    [v12 setSong:v11];
    id v13 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v13 setQualityOfService:25];
    [v13 setName:@"com.apple.MediaPlaybackCore.MPCModelGenericAVItem.LyricsOperationQueue"];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    __int16 v20 = __78__MPCModelGenericAVItem_nowPlayingInfoCenter_lyricsForContentItem_completion___block_invoke;
    uint64_t v21 = &unk_2643BE950;
    id v22 = v13;
    id v23 = v10;
    id v24 = v11;
    id v25 = v7;
    id v14 = v11;
    id v15 = v13;
    __int16 v16 = (void *)[v12 newOperationWithResponseHandler:&v18];
    objc_msgSend(v15, "addOperation:", v16, v18, v19, v20, v21);
  }
  else
  {
    uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v10;
      __int16 v28 = 2114;
      int64_t v29 = v9;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "Unable to provide lyrics for contentItemID %{public}@, modelObject: %{public}@", buf, 0x16u);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:1 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v12);
  }
}

void __78__MPCModelGenericAVItem_nowPlayingInfoCenter_lyricsForContentItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6
    || ([v5 lyrics],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 text],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v18 = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "No lyrics available. Error: %{public}@, modelObject: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    id v10 = 0;
  }
  else
  {
    id v22 = @"ids";
    id v13 = [v5 identifiers];
    v23[0] = v13;
    id v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];

    id v14 = (void *)[objc_alloc(MEMORY[0x263F12130]) initWithIdentifier:*(void *)(a1 + 40) userInfo:v8];
    id v15 = objc_alloc(MEMORY[0x263F12128]);
    __int16 v16 = [v5 lyrics];
    uint64_t v17 = [v16 text];
    id v10 = (void *)[v15 initWithLyrics:v17 userProvided:0 token:v14];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_reloadTimedMetadataRequest
{
  if ([(MPCModelGenericAVItem *)self isAssetLoaded]
    && ![(MPCModelGenericAVItem *)self isAlwaysLive])
  {
    uint64_t v4 = NSNumber;
    id v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F12368]);
    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    id v3 = objc_msgSend(v4, "numberWithDouble:", fmax(CMTimeGetSeconds(&time), 0.0));
  }
  else
  {
    id v3 = 0;
  }
  os_unfair_lock_lock(&self->_genericObjectLock);
  genericObject = self->_genericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if (self->_currentGlobalTimedMetadataGroups) {
    BOOL v7 = genericObject == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    timedMetadataRequest = self->_timedMetadataRequest;
    self->_timedMetadataRequest = 0;

    timedMetadataResponse = self->_timedMetadataResponse;
    self->_timedMetadataResponse = 0;

    os_unfair_lock_lock(&self->_genericObjectLock);
    id v11 = self->_genericObject;
    __int16 v16 = self->_metadataGenericObject;
    os_unfair_lock_unlock(&self->_genericObjectLock);
    if (v16 == v11)
    {
      __int16 v16 = v11;
    }
    else
    {
      os_unfair_lock_lock(&self->_genericObjectLock);
      objc_storeStrong((id *)&self->_metadataGenericObject, self->_genericObject);
      objc_storeStrong((id *)&self->_flattenedMetadataGenericObject, self->_flattenedGenericObject);
      os_unfair_lock_unlock(&self->_genericObjectLock);
      [(MPCModelGenericAVItem *)self _invalidateContentItemForTimedMetadataChangesChangingRevisionID:1];
      [(MPCModelGenericAVItem *)self setLastMetadataChangeTime:v3];
      id v10 = [(MPCModelGenericAVItem *)self observer];
      [v10 didSignificantlyChangeItem:self];

      [(MPCModelGenericAVItem *)self _setNeedsPersistedLikedStateUpdate];
      [(MPCModelGenericAVItem *)self _postInvalidationNotifications];
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_genericObjectLock);
    id v11 = self->_genericObject;
    os_unfair_lock_unlock(&self->_genericObjectLock);
    id v12 = [MPCModelGenericAVItemTimedMetadataRequest alloc];
    currentGlobalTimedMetadataGroups = self->_currentGlobalTimedMetadataGroups;
    id v14 = [(MPCModelGenericAVItem *)self _storeRequestContext];
    id v15 = [(MPCModelGenericAVItemTimedMetadataRequest *)v12 initWithGenericObject:v11 timedMetadataGroups:currentGlobalTimedMetadataGroups storeRequestContext:v14];

    [(MPCModelGenericAVItemTimedMetadataRequest *)v15 setPreviousResponse:self->_timedMetadataResponse];
    [(MPCModelGenericAVItemTimedMetadataRequest *)v15 setItemProperties:self->_itemProperties];
    objc_storeStrong((id *)&self->_timedMetadataRequest, v15);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __52__MPCModelGenericAVItem__reloadTimedMetadataRequest__block_invoke;
    id v24 = &unk_2643BE928;
    id v25 = self;
    __int16 v16 = v15;
    __int16 v26 = v16;
    id v27 = v3;
    uint64_t v17 = (void *)[(MPModelGenericObject *)v16 newOperationWithResponseHandler:&v21];
    timedMetadataOperationQueue = self->_timedMetadataOperationQueue;
    if (!timedMetadataOperationQueue)
    {
      id v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
      __int16 v20 = self->_timedMetadataOperationQueue;
      self->_timedMetadataOperationQueue = v19;

      [(NSOperationQueue *)self->_timedMetadataOperationQueue setName:@"com.apple.MediaPlaybackCore.MPCModelGenericAVItem.timedMetadataOperationQueue", v21, v22, v23, v24, v25, v26];
      [(NSOperationQueue *)self->_timedMetadataOperationQueue setMaxConcurrentOperationCount:1];
      [(NSOperationQueue *)self->_timedMetadataOperationQueue setQualityOfService:25];
      timedMetadataOperationQueue = self->_timedMetadataOperationQueue;
    }
    -[NSOperationQueue addOperation:](timedMetadataOperationQueue, "addOperation:", v17, v21, v22, v23, v24, v25);
  }
}

void __52__MPCModelGenericAVItem__reloadTimedMetadataRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v4 = v3;
  msv_dispatch_on_main_queue();
}

void __52__MPCModelGenericAVItem__reloadTimedMetadataRequest__block_invoke_2(uint64_t a1)
{
  v34[4] = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 680) == *(void *)(a1 + 40))
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 688))
    {
      objc_msgSend(v2, "removeObserver:name:object:");
      uint64_t v4 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v4 + 688), *(id *)(a1 + 48));
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 688))
    {
      objc_msgSend(v3, "addObserver:selector:name:object:");
      uint64_t v5 = *(void *)(a1 + 32);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 792));
    id v6 = *(id *)(*(void *)(a1 + 32) + 880);
    id v7 = *(id *)(*(void *)(a1 + 32) + 656);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 792));
    id v8 = [*(id *)(a1 + 48) results];
    uint64_t v9 = [v8 firstItem];
    id v10 = (void *)v9;
    if (v9) {
      id v11 = (void *)v9;
    }
    else {
      id v11 = v6;
    }
    id v12 = v11;

    id v13 = v12;
    if (v7 == v13)
    {
    }
    else
    {
      id v14 = v7;
      char v15 = [v14 isEqual:v13];

      if ((v15 & 1) == 0)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 792));
        id v16 = [*(id *)(*(void *)(a1 + 32) + 648) identifiers];
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 656), v11);
        uint64_t v17 = [v13 flattenedGenericObject];
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = *(void **)(v18 + 648);
        *(void *)(v18 + 648) = v17;

        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 792));
        uint64_t v20 = [*(id *)(a1 + 48) isFirstResponse];
        [*(id *)(a1 + 32) _invalidateContentItemForTimedMetadataChangesChangingRevisionID:v20];
        if (v20)
        {
          [*(id *)(a1 + 32) setLastMetadataChangeTime:*(void *)(a1 + 56)];
          id v21 = [*(id *)(a1 + 32) observer];
          [v21 didSignificantlyChangeItem:*(void *)(a1 + 32)];
        }
        else
        {
          uint64_t v22 = [v13 flattenedGenericObject];
          id v23 = [v22 identifiers];

          id v21 = v23;
          if (v16 == v21)
          {
          }
          else
          {
            char v24 = [v16 isEqual:v21];

            if ((v24 & 1) == 0)
            {
              uint64_t v32 = [*(id *)(a1 + 32) eventStream];
              v33[0] = @"queue-section-id";
              int64_t v31 = [*(id *)(a1 + 32) queueSectionID];
              v34[0] = v31;
              v33[1] = @"queue-item-id";
              uint64_t v30 = [*(id *)(a1 + 32) queueItemID];
              v34[1] = v30;
              v33[2] = @"item-kind";
              uint64_t v25 = [v21 modelKind];
              __int16 v26 = (void *)v25;
              if (!v25)
              {
                uint64_t v25 = [MEMORY[0x263EFF9D0] null];
              }
              int64_t v29 = (void *)v25;
              v34[2] = v25;
              v33[3] = @"item-ids";
              id v27 = v21;
              if (!v21)
              {
                id v27 = [MEMORY[0x263EFF9D0] null];
              }
              v34[3] = v27;
              __int16 v28 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
              [v32 emitEventType:@"item-update" payload:v28];

              if (!v21) {
              if (!v26)
              }
            }
          }
        }

        [*(id *)(a1 + 32) _setNeedsPersistedLikedStateUpdate];
        [*(id *)(a1 + 32) _postInvalidationNotifications];
      }
    }
  }
}

- (void)metadataOutput:(id)a3 didOutputTimedMetadataGroups:(id)a4 fromPlayerItemTrack:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (NSArray *)a4;
  id v10 = a5;
  if (!v10)
  {
    if (!self->_didReceiveHLSTimedMetadata)
    {
      self->_didReceiveHLSTimedMetadata = 1;
      id v11 = [(MPCModelGenericAVItem *)self eventStream];
      uint64_t v18 = @"item-stream-id";
      hlsStreamIdentifier = self->_hlsStreamIdentifier;
      id v13 = hlsStreamIdentifier;
      if (!hlsStreamIdentifier)
      {
        id v13 = [MEMORY[0x263EFF9D0] null];
      }
      v19[0] = v13;
      id v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      [v11 emitEventType:@"item-hls-timed-metadata-begin" payload:v14];

      if (!hlsStreamIdentifier) {
    }
      }
    currentGlobalTimedMetadataGroups = self->_currentGlobalTimedMetadataGroups;
    if (currentGlobalTimedMetadataGroups != v9
      && ([(NSArray *)currentGlobalTimedMetadataGroups isEqual:v9] & 1) == 0)
    {
      id v16 = (NSArray *)[(NSArray *)v9 copy];
      uint64_t v17 = self->_currentGlobalTimedMetadataGroups;
      self->_currentGlobalTimedMetadataGroups = v16;

      [(MPCModelGenericAVItem *)self _reloadTimedMetadataRequest];
      [(MPCModelGenericAVItem *)self _updateJingleTimedMetadata];
    }
  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest())
  {
    BOOL radioPlayback = self->_radioPlayback;
    if ([(MPCModelGenericAVItem *)self isAssetLoaded]) {
      BOOL isiTunesStoreStream = self->_isiTunesStoreStream;
    }
    else {
      BOOL isiTunesStoreStream = 0;
    }
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__767;
    v48 = __Block_byref_object_dispose__768;
    int v11 = [(MPCModelGenericAVItem *)self isAssetLoaded];
    streamingKeyServerURL = 0;
    if (v11) {
      streamingKeyServerURL = self->_streamingKeyServerURL;
    }
    v49 = streamingKeyServerURL;
    uint64_t v38 = 0;
    __int16 v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__767;
    CGSize v42 = __Block_byref_object_dispose__768;
    if ([(MPCModelGenericAVItem *)self isAssetLoaded]) {
      streamingKeyCertificateURL = self->_streamingKeyCertificateURL;
    }
    else {
      streamingKeyCertificateURL = 0;
    }
    v43 = streamingKeyCertificateURL;
    if (v45[5])
    {
      BOOL v14 = !radioPlayback && isiTunesStoreStream;
      if (!v14 && !v39[5])
      {
LABEL_29:
        BOOL v10 = 0;
LABEL_32:
        _Block_object_dispose(&v38, 8);

        _Block_object_dispose(&v44, 8);
        goto LABEL_33;
      }
    }
    else
    {
      BOOL v10 = 0;
      if (radioPlayback || !isiTunesStoreStream) {
        goto LABEL_32;
      }
    }
    if ([(MPCModelGenericAVItem *)self isAssetLoaded])
    {
      char v15 = [(MPCModelGenericAVItem *)self _storeRequestContext];
      MPProcessInfoSystemWallClockUptime();
      uint64_t v17 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = 2;
      }
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
      aBlock[3] = &unk_2643BE8D8;
      id v19 = v15;
      id v29 = v19;
      BOOL v35 = isiTunesStoreStream;
      uint64_t v32 = &v38;
      __int16 v33 = &v44;
      v34[1] = (id)v18;
      v34[2] = 0;
      char v36 = 0;
      id v30 = v7;
      int64_t v31 = self;
      v34[3] = v17;
      objc_copyWeak(v34, &location);
      uint64_t v20 = _Block_copy(aBlock);
      id v21 = v20;
      if (radioPlayback || !isiTunesStoreStream || v39[5] && v45[5])
      {
        (*((void (**)(void *))v20 + 2))(v20);
      }
      else
      {
        uint64_t v22 = [MEMORY[0x263F893A0] sharedBagProvider];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_4;
        v24[3] = &unk_2643BE900;
        __int16 v26 = &v44;
        id v27 = &v38;
        id v25 = v21;
        [v22 getBagForRequestContext:v19 withCompletionHandler:v24];
      }
      objc_destroyWeak(v34);

      objc_destroyWeak(&location);
      BOOL v10 = 1;
      goto LABEL_32;
    }
    goto LABEL_29;
  }
  BOOL v10 = 0;
LABEL_33:

  return v10;
}

void __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF910] date];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F892E0]) initWithRequestContext:*(void *)(a1 + 32) resourceLoadingRequest:*(void *)(a1 + 40)];
  [v3 setShouldIncludeDeviceGUID:*(unsigned __int8 *)(a1 + 104)];
  [v3 setCertificateURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [v3 setKeyServerURL:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [v3 setLeaseActionType:*(void *)(a1 + 80)];
  if (*(unsigned char *)(a1 + 104)) {
    BOOL v4 = *(void *)(a1 + 32) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  [v3 setITunesStoreRequest:v4];
  if (*(void *)(a1 + 88))
  {
    objc_msgSend(v3, "setRentalID:");
    [v3 setSkippedRentalCheckout:*(unsigned char *)(a1 + 105) == 0];
  }
  uint64_t v5 = [*(id *)(a1 + 48) eventStream];
  v16[0] = @"queue-section-id";
  id v6 = [*(id *)(a1 + 48) queueSectionID];
  v17[0] = v6;
  v16[1] = @"queue-item-id";
  id v7 = [*(id *)(a1 + 48) queueItemID];
  v17[1] = v7;
  v16[2] = @"asset-skd";
  id v8 = [v3 contentURI];
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  }
  v17[2] = v9;
  BOOL v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v5 emitEventType:@"item-key-request-begin" payload:v10];

  if (!v8) {
  v12[0] = MEMORY[0x263EF8330];
  }
  v12[1] = 3221225472;
  v12[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
  v12[3] = &unk_2643BE8B0;
  void v12[4] = *(void *)(a1 + 48);
  id v11 = v2;
  id v13 = v11;
  v15[1] = *(id *)(a1 + 96);
  id v14 = *(id *)(a1 + 40);
  objc_copyWeak(v15, (id *)(a1 + 72));
  [v3 performWithResponseHandler:v12];
  objc_destroyWeak(v15);
}

uint64_t __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x263F89068];
  id v4 = a2;
  uint64_t v5 = [v4 urlForBagKey:v3];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [v4 urlForBagKey:*MEMORY[0x263F89060]];

  uint64_t v9 = *(void *)(a1[6] + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(uint64_t (**)(void))(a1[4] + 16);

  return v11();
}

void __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void v32[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) eventStream];
  v31[0] = @"queue-section-id";
  uint64_t v8 = [*(id *)(a1 + 32) queueSectionID];
  v32[0] = v8;
  v31[1] = @"queue-item-id";
  uint64_t v9 = [*(id *)(a1 + 32) queueItemID];
  v32[1] = v9;
  void v31[2] = @"key-request-error";
  BOOL v10 = v6;
  if (!v6)
  {
    BOOL v10 = [MEMORY[0x263EFF9D0] null];
  }
  v32[2] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  [v7 emitEventType:@"item-key-request-end" payload:v11];

  if (!v6) {
  id v12 = [MEMORY[0x263EFF910] date];
  }
  id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *MEMORY[0x263F11178];
  uint64_t v16 = *MEMORY[0x263F11168];
  uint64_t v17 = NSNumber;
  MPProcessInfoSystemWallClockUptime();
  id v19 = [v17 numberWithDouble:v18 - *(double *)(a1 + 64)];
  uint64_t v20 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, v15, v12, v16, v19, *MEMORY[0x263F11160], 0);

  if (v6) {
    [v20 setObject:v6 forKey:*MEMORY[0x263F11170]];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
  block[3] = &unk_2643BE888;
  id v26 = v5;
  id v27 = *(id *)(a1 + 48);
  id v28 = v6;
  id v21 = (id *)(a1 + 56);
  id v22 = v6;
  id v23 = v5;
  objc_copyWeak(&v30, v21);
  id v29 = v20;
  id v24 = v20;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v30);
}

void __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) finishAssetResourceLoadingRequest:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:*MEMORY[0x263F11140] object:WeakRetained userInfo:*(void *)(a1 + 56)];
  }
}

- (id)rtcReportingServiceIdentifier
{
  if (![(MPCModelGenericAVItem *)self didAttemptToLoadAsset]
    || (uint64_t v3 = self->_rtcReportingServiceIdentifier) == 0)
  {
    uint64_t v3 = [(MPCModelGenericAVItem *)self _rtcReportingServiceIdentifierWithAssetURL:0];
  }

  return v3;
}

- (id)mpcReporting_requestingBundleVersion
{
  return [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment requestingBundleVersion];
}

- (id)mpcReporting_requestingBundleIdentifier
{
  return [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment requestingBundleIdentifier];
}

- (id)mpcReporting_identityPropertiesLoader
{
  identityPropertiesLoader = self->_identityPropertiesLoader;
  if (!identityPropertiesLoader)
  {
    id v4 = [[MPCReportingPlaybackEnvironmentPropertiesLoader alloc] initWithPlaybackRequestEnvironment:self->_playbackRequestEnvironment];
    id v5 = self->_identityPropertiesLoader;
    self->_identityPropertiesLoader = (MPCReportingIdentityPropertiesLoading *)v4;

    identityPropertiesLoader = self->_identityPropertiesLoader;
  }

  return identityPropertiesLoader;
}

- (unint64_t)mpcReporting_itemType
{
  if ([(MPCModelGenericAVItem *)self isRadioStreamPlayback]) {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelGenericAVItem;
  return [(MPAVItem *)&v4 mpcReporting_itemType];
}

void __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) artworkCatalog];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)_keyServerAdamID
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  objc_super v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject identifiers];
  os_unfair_lock_unlock(p_genericObjectLock);
  id v5 = [v4 universalStore];
  int64_t v6 = [v5 assetAdamID];

  if (!v6)
  {
    id v7 = [v4 universalStore];
    int64_t v6 = [v7 subscriptionAdamID];

    if (!v6)
    {
      uint64_t v8 = [v4 universalStore];
      int64_t v6 = [v8 adamID];

      if (!v6)
      {
        uint64_t v9 = [v4 universalStore];
        int64_t v6 = [v9 reportingAdamID];
      }
    }
  }
  BOOL v10 = [(MPCModelGenericAVItem *)self eventStream];
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 engineID];
    int v14 = 138544130;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = v6;
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using adamID %lld for key server requests from identifier set %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  return v6;
}

- (void)_didBecomeActivePlayerItem
{
  void v12[4] = *MEMORY[0x263EF8340];
  if ([(MPCModelGenericAVItem *)self isHLSAsset]
    || [(MPCModelGenericAVItem *)self isAlwaysLive])
  {
    if (!self->_hlsStreamIdentifier)
    {
      MSVNanoIDCreateTaggedPointer();
      uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      hlsStreamIdentifier = self->_hlsStreamIdentifier;
      self->_hlsStreamIdentifier = v3;
    }
    id v5 = [(MPCModelGenericAVItem *)self eventStream];
    v11[0] = @"queue-section-id";
    int64_t v6 = [(MPCModelGenericAVItem *)self queueSectionID];
    v12[0] = v6;
    v11[1] = @"item-start-item-id";
    id v7 = [(MPCModelGenericAVItem *)self queueItemID];
    uint64_t v8 = self->_hlsStreamIdentifier;
    v12[1] = v7;
    v12[2] = v8;
    v11[2] = @"item-stream-id";
    v11[3] = @"container-indeterminate-duration";
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MPCModelGenericAVItem isAlwaysLive](self, "isAlwaysLive"));
    v12[3] = v9;
    BOOL v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    [v5 emitEventType:@"item-hls-stream-begin" payload:v10];
  }
}

- (void)_didResignActivePlayerItem
{
  v16[1] = *MEMORY[0x263EF8340];
  if ([(MPCModelGenericAVItem *)self isHLSAsset]
    || [(MPCModelGenericAVItem *)self isAlwaysLive])
  {
    uint64_t v3 = [(MPCModelGenericAVItem *)self eventStream];
    if (self->_didReceiveHLSTimedMetadata)
    {
      jingleTimedMetadata = self->_jingleTimedMetadata;
      self->_jingleTimedMetadata = 0;

      uint64_t v15 = @"item-stream-id";
      hlsStreamIdentifier = self->_hlsStreamIdentifier;
      int64_t v6 = hlsStreamIdentifier;
      if (!hlsStreamIdentifier)
      {
        int64_t v6 = [MEMORY[0x263EFF9D0] null];
      }
      v16[0] = v6;
      id v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      [v3 emitEventType:@"item-hls-timed-metadata-end" payload:v7];

      if (!hlsStreamIdentifier) {
    }
      }
    v13[0] = @"queue-section-id";
    uint64_t v8 = [(MPCModelGenericAVItem *)self queueSectionID];
    v14[0] = v8;
    v13[1] = @"item-end-item-id";
    uint64_t v9 = [(MPCModelGenericAVItem *)self queueItemID];
    v14[1] = v9;
    v13[2] = @"item-stream-id";
    BOOL v10 = self->_hlsStreamIdentifier;
    id v11 = v10;
    if (!v10)
    {
      id v11 = [MEMORY[0x263EFF9D0] null];
    }
    v14[2] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    [v3 emitEventType:@"item-hls-stream-end" payload:v12];

    if (!v10) {
  }
    }
}

- (void)_willResignActivePlayerItem
{
  v8.receiver = self;
  v8.super_class = (Class)MPCModelGenericAVItem;
  [(MPCModelGenericAVItem *)&v8 _willResignActivePlayerItem];
  suzeLeaseSession = self->_suzeLeaseSession;
  if (suzeLeaseSession)
  {
    if (self->_isAutomaticallyRefreshingSuzeLeaseSession)
    {
      self->_isAutomaticallyRefreshingSuzeLeaseSession = 0;
      [(MPCSuzeLeaseSession *)self->_suzeLeaseSession endAutomaticallyRefreshingLease];
      suzeLeaseSession = self->_suzeLeaseSession;
    }
    objc_super v4 = suzeLeaseSession;
    id v5 = +[MPCSuzeLeaseSessionController sharedController];
    int64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:@"MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification" object:v5];

    id v7 = self->_suzeLeaseSession;
    self->_suzeLeaseSession = 0;

    [v5 stopLeaseSession:v4 completion:0];
  }
}

- (void)_willBecomeActivePlayerItem
{
  v5.receiver = self;
  v5.super_class = (Class)MPCModelGenericAVItem;
  [(MPCModelGenericAVItem *)&v5 _willBecomeActivePlayerItem];
  uint64_t v3 = (void (**)(void))[self->_firstBecomeActivePlayerItemBlock copy];
  id firstBecomeActivePlayerItemBlock = self->_firstBecomeActivePlayerItemBlock;
  self->_id firstBecomeActivePlayerItemBlock = 0;

  if (v3) {
    v3[2](v3);
  }
}

- (void)_handleUpdatedLikedState:(int64_t)a3 forUserIdentity:(id)a4 completion:(id)a5
{
  id v8 = a5;
  if (a3 == 3) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = a3 == 2;
  }
  id v10 = a4;
  os_unfair_lock_lock(&self->_genericObjectLock);
  id v11 = self->_metadataGenericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  id v12 = [MEMORY[0x263F11D78] controllerWithUserIdentity:v10];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke;
  void v14[3] = &unk_2643C5830;
  id v15 = v8;
  id v13 = v8;
  [v12 setTasteType:v9 forModel:v11 withCompletionHandler:v14];
}

void __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke_2;
    v5[3] = &unk_2643C55A8;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)_currentPlaybackRateDidChange:(float)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem _currentPlaybackRateDidChange:](&v4, sel__currentPlaybackRateDidChange_);
  [(MPCModelGenericAVItem *)self _updateAutomaticSubscriptionLeaseRefresh];
}

- (BOOL)usesSubscriptionLease
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
  switch(v4)
  {
    case 9:
      objc_super v5 = [(MPModelGenericObject *)self->_flattenedGenericObject movie];
      break;
    case 6:
      objc_super v5 = [(MPModelGenericObject *)self->_flattenedGenericObject tvEpisode];
      break;
    case 1:
      objc_super v5 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
      break;
    default:
      id v7 = 0;
      goto LABEL_9;
  }
  id v6 = v5;
  id v7 = [v5 storeAsset];

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  BOOL v8 = [v7 endpointType] == 3;

  return v8;
}

- (id)storeAccountID
{
  id v3 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet delegatedIdentityProperties];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet identityProperties];
  }
  id v6 = v5;

  id v7 = [v6 DSID];

  return v7;
}

- (BOOL)shouldPreventPlayback
{
  return self->_leasePlaybackPreventionState != 0;
}

- (void)resolvePlaybackError:(id)a3 withCompletion:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MPCModelGenericAVItem *)self mediaItem];
  uint64_t v9 = [v8 mediaLibrary];
  id v10 = v9;
  if (v8 && [v9 isHomeSharingLibrary])
  {
    id v11 = [v10 errorResolverForItem:self];
    if (v11)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x263F11D00]) initWithErrorResolver:v11];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke;
      v51[3] = &unk_2643BF790;
      id v52 = v7;
      [v12 setResolutionHandler:v51];
      [v12 resolveError:v6];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    goto LABEL_10;
  }
  int64_t v13 = +[MPCModelGenericAVItem _unwrapPlaybackError:v6];
  if (!v13) {
    goto LABEL_39;
  }
  unint64_t v14 = v13;
  id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    if (v14 > 5) {
      __int16 v16 = @"Unknown";
    }
    else {
      __int16 v16 = off_2643BEC10[v14 - 1];
    }
    *(_DWORD *)buf = 138543874;
    v54 = self;
    __int16 v55 = 2114;
    v56 = (MPCModelGenericAVItem *)v16;
    __int16 v57 = 2114;
    id v58 = v6;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unwrapped playback error with type=%{public}@ error=%{public}@.", buf, 0x20u);
  }

  if (v14 != 5)
  {
    if (v14 == 1 && self->_isSubscriptionPolicyContent)
    {
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_424;
      v46[3] = &unk_2643BE810;
      v46[4] = self;
      id v47 = v7;
      [(MPCModelGenericAVItem *)self _getSubscriptionLeasePropertiesWithCompletion:v46];

      goto LABEL_40;
    }
    if (v14 == 4)
    {
      uint64_t v27 = *MEMORY[0x263F11290];
      uint64_t v28 = *MEMORY[0x263F112B0];
      id v29 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F11290], *MEMORY[0x263F112B0], 0);
      id v30 = [v8 valuesForProperties:v29];

      int64_t v31 = [v30 objectForKey:v27];
      uint64_t v32 = [v30 objectForKey:v28];
      if ([v31 length] && objc_msgSend(v32, "longLongValue"))
      {
        CGSize v42 = [(MPCModelGenericAVItem *)self eventStream];
        __int16 v33 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t loga = [v42 engineID];
          *(_DWORD *)buf = 138543618;
          v54 = (MPCModelGenericAVItem *)loga;
          __int16 v55 = 2114;
          v56 = self;
          _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Purging cached content key(s) for invalid user error.", buf, 0x16u);
        }
        v43 = (void *)[objc_alloc(MEMORY[0x263F89118]) initWithPath:v31];
        double v34 = [v43 removeAllKeys];
        if (v34)
        {
          log = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v54 = self;
            __int16 v55 = 2114;
            v56 = v34;
            _os_log_impl(&dword_21BB87000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove cached hls keys. err=%{public}@.", buf, 0x16u);
          }
        }
      }
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      goto LABEL_49;
    }
    if (v14 != 3) {
      goto LABEL_39;
    }
    os_unfair_lock_lock(&self->_genericObjectLock);
    uint64_t v25 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
    switch(v25)
    {
      case 9:
        id v26 = [(MPModelGenericObject *)self->_flattenedGenericObject movie];
        break;
      case 6:
        id v26 = [(MPModelGenericObject *)self->_flattenedGenericObject tvEpisode];
        break;
      case 1:
        id v26 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
        break;
      default:
        id v30 = 0;
        goto LABEL_45;
    }
    BOOL v35 = v26;
    id v30 = [v26 storeAsset];

LABEL_45:
    os_unfair_lock_unlock(&self->_genericObjectLock);
    uint64_t v36 = [v30 accountIdentifier];
    __int16 v37 = (void *)MEMORY[0x263F893C0];
    if (v36)
    {
      uint64_t v38 = [NSNumber numberWithUnsignedLongLong:v36];
      int64_t v31 = [v37 specificAccountWithDSID:v38];
    }
    else
    {
      int64_t v31 = [MEMORY[0x263F893C0] activeAccount];
    }
    uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F89360]) initWithIdentity:v31];
    __int16 v39 = (void *)[objc_alloc(MEMORY[0x263F890B0]) initWithRequestContext:v32];
    [v39 setReason:*MEMORY[0x263F88EA8]];
    [v39 setQualityOfService:25];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_3;
    v44[3] = &unk_2643BE838;
    v44[4] = self;
    id v45 = v7;
    [v39 performWithResponseHandler:v44];

LABEL_49:
    goto LABEL_40;
  }
  if ([(MPCModelGenericAVItem *)self isHLSAsset]
    || ![(MPCModelGenericAVItem *)self isAssetLoaded])
  {
    goto LABEL_39;
  }
  uint64_t v17 = [(MPCModelGenericAVItem *)self asset];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_39;
  }
  __int16 v18 = [(MPCModelGenericAVItem *)self asset];
  int64_t v19 = [v18 URL];
  int v20 = [v19 isFileURL];

  if (!v20)
  {
LABEL_39:
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_40;
  }
  id v21 = [(MPCModelGenericAVItem *)self asset];
  uint64_t v22 = [v21 URL];

  assetCacheProvider = self->_assetCacheProvider;
  genericObject = self->_genericObject;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_423;
  v48[3] = &unk_2643C59E0;
  v48[4] = self;
  id v49 = v22;
  id v50 = v7;
  id v11 = v22;
  [(MPCModelPlaybackAssetCacheProviding *)assetCacheProvider clearPlaybackAssetCacheFileAssetForGenericObject:genericObject withCompletionHandler:v48];

LABEL_10:
LABEL_40:
}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 2) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2 * (a2 == 1);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, v3, 0);
  }
  return result;
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_423(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      id v20 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to clear file asset error=%{public}@.", buf, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = a1[5];
    id v16 = 0;
    int v8 = [v6 removeItemAtURL:v7 error:&v16];
    id v9 = v16;

    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = a1[4];
        int64_t v13 = (void *)a1[5];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v12;
        __int16 v19 = 2114;
        id v20 = v13;
        _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cleared cached asset from the library and removed local file at %{public}@.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = a1[4];
      id v15 = (void *)a1[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v15;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove unauthorized content at %{public}@ error=%{public}@.", buf, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_424(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  int v9 = [a3 shouldUseLease];
  if (v7 && v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F891E8]);
    id v11 = [v7 requestContext];
    uint64_t v12 = (void *)[v10 initWithRequestContext:v11];

    [v12 setShouldPreventLeaseAcquisition:1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2;
    v18[3] = &unk_2643C14F8;
    int64_t v13 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v20 = v13;
    id v19 = v7;
    id v14 = (id)[v19 performPlaybackRequest:v12 completionHandler:v18];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_432;
    block[3] = &unk_2643C55A8;
    id v17 = *(id *)(a1 + 40);
    id v16 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);

    uint64_t v12 = v17;
  }
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_4;
  v11[3] = &unk_2643C3D38;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v3 = *(void **)(a1 + 40);
      int v11 = 138543618;
      id v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Finished authorize machine request for error resolution with error: %{public}@.", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 40) eventStream];
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v2 engineID];
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Finished authorize machine request successfully.", (uint8_t *)&v11, 0x16u);
    }
  }

  if (*(void *)(a1 + 48)) {
    BOOL v8 = *(void *)(a1 + 32) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v9);
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F087E8];
  id v8 = a3;
  uint64_t v9 = [v7 errorForICError:a4 response:a2];
  objc_msgSend(a1[4], "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v8, 4, @"Resolving error", objc_msgSend(a1[4], "isStartItem"));

  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Subscription lease request failed [error during resolution] - error=%{public}@.", buf, 0x16u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_428;
    block[3] = &unk_2643C55A8;
    id v12 = &v25;
    id v25 = a1[6];
    id v24 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
    __int16 v13 = v24;
  }
  else
  {
    uint64_t v14 = [a1[4] eventStream];
    uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 engineID];
      id v17 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      id v29 = v17;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Finished sending subscription lease request for error resolution", buf, 0x16u);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_429;
    v20[3] = &unk_2643C5620;
    id v12 = (id *)v21;
    id v18 = a1[5];
    id v19 = a1[4];
    v21[0] = v18;
    v21[1] = v19;
    id v22 = a1[6];
    dispatch_async(MEMORY[0x263EF83A0], v20);
    __int16 v13 = v22;
  }
}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_432(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_428(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_429(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_430;
  v3[3] = &unk_2643BE7E8;
  v1 = (void *)a1[4];
  uint64_t v2 = (void *)a1[6];
  void v3[4] = a1[5];
  id v4 = v2;
  [v1 reloadFairPlayKeyStatusWithCompletionHandler:v3];
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_430(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v17 = v8;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Finished reloading FairPlayKey status - error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) eventStream];
    uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 engineID];
      id v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Finished reloading FairPlayKey status", buf, 0x16u);
    }
  }

  id v15 = *(id *)(a1 + 40);
  uint64_t v14 = v5;
  id v12 = v6;
  id v13 = v5;
  msv_dispatch_on_main_queue();
}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_431(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 32) hasOnlinePlaybackKeys]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 32) hasOfflinePlaybackKeys];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

- (BOOL)requiresLoadedAssetForAirPlayProperties
{
  return 1;
}

- (BOOL)allowsExternalPlayback
{
  return 1;
}

- (BOOL)allowsAirPlayFromCloud
{
  return self->_allowsAirPlayFromCloud;
}

- (BOOL)canUseLoadedAsset
{
  uint64_t v3 = [(MPCModelGenericAVItem *)self itemError];

  if (v3) {
    return 0;
  }
  if (![(MPCModelGenericAVItem *)self isExplicitTrack]) {
    return 1;
  }
  id v5 = +[MPCContentAgeRequirementManager sharedManager];
  char v6 = [v5 isItemAuthorized:self];

  return v6;
}

uint64_t __62__MPCModelGenericAVItem__updateAudioFormatInfoForContentItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 nowPlayingAudioFormat];
}

- (void)_updateContentItemIncludingPlaybackState:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MPCModelGenericAVItem;
  [(MPCModelGenericAVItem *)&v16 _updateContentItemIncludingPlaybackState:a3];
  id v4 = [(MPCModelGenericAVItem *)self contentItem];
  id v5 = [v4 _mediaRemoteContentItem];

  char v6 = [(MPCModelGenericAVItem *)self queueSectionID];
  uint64_t v7 = [(MPCModelGenericAVItem *)self queueItemID];
  id v8 = [v6 stringByAppendingString:v7];

  id v9 = [v5 queueIdentifier];
  if (v9 == v8)
  {

    id v13 = v8;
    goto LABEL_5;
  }
  id v10 = v9;
  char v11 = [v9 isEqual:v8];

  if ((v11 & 1) == 0)
  {
    [v5 setQueueIdentifier:v8];
    id v12 = [(MPCModelGenericAVItem *)self contentItem];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__MPCModelGenericAVItem__updateContentItemIncludingPlaybackState___block_invoke;
    void v14[3] = &unk_2643BE7A0;
    id v15 = v8;
    [v12 _postItemChangedNotificationWithDeltaBlock:v14];

    id v13 = v15;
LABEL_5:
  }
}

uint64_t __66__MPCModelGenericAVItem__updateContentItemIncludingPlaybackState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setQueueIdentifier:*(void *)(a1 + 32)];
}

- (float)userRating
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  float v4 = 0.0;
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    id v5 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    [v5 userRating];
    float v4 = v6;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v4;
}

- (BOOL)useEmbeddedChapterData
{
  return 0;
}

- (id)urlTimeMarkers
{
  return 0;
}

- (void)setupWithPlaybackInfo
{
  v17[1] = *MEMORY[0x263EF8340];
  if ([(MPCModelGenericAVItem *)self isAssetLoaded])
  {
    if (*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F12360]))
    {
      v13.receiver = self;
      v13.super_class = (Class)MPCModelGenericAVItem;
      [(MPCModelGenericAVItem *)&v13 setupWithPlaybackInfo];
      return;
    }
    id v9 = (void *)MEMORY[0x263F54EC8];
    uint64_t v10 = *MEMORY[0x263F54E80];
    char v11 = [(MPCModelGenericAVItem *)self description];
    uint64_t v14 = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [v9 snapshotWithDomain:v10 type:@"Bug" subType:@"AssetLoadingBug" context:@"setupWithPlaybackInfo._asset==nil" triggerThresholdValues:&stru_26CBCA930 events:v12 completion:0];

    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v16 = self;
      id v8 = "%{public}@: setupWithPlaybackInfo called without an asset loaded and isAssetLoaded is TRUE";
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F54EC8];
    uint64_t v4 = *MEMORY[0x263F54E80];
    id v5 = [(MPCModelGenericAVItem *)self description];
    v17[0] = v5;
    float v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [v3 snapshotWithDomain:v4 type:@"Bug" subType:@"AssetLoadingBug" context:@"setupWithPlaybackInfo.isAssetLoaded==NO" triggerThresholdValues:&stru_26CBCA930 events:v6 completion:0];

    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v16 = self;
      id v8 = "%{public}@: setupWithPlaybackInfo called without an asset loaded";
LABEL_8:
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_FAULT, v8, buf, 0xCu);
    }
  }
}

- (BOOL)supportsLikedState
{
  return 1;
}

- (int64_t)stationProviderID
{
  uint64_t v2 = [(NSDictionary *)self->_trackInfo objectForKey:@"stream-provider-id"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)stationStringID
{
  uint64_t v2 = [(MPCModelGenericAVItem *)self _radioStation];
  int64_t v3 = [v2 identifiers];
  uint64_t v4 = [v3 radio];
  id v5 = [v4 stationStringID];

  return v5;
}

- (id)stationName
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__767;
  id v15 = __Block_byref_object_dispose__768;
  id v16 = 0;
  uint64_t v2 = [(MPCModelGenericAVItem *)self _radioStation];
  int64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x263F11F78];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__MPCModelGenericAVItem_stationName__block_invoke;
    v8[3] = &unk_2643C67A0;
    uint64_t v10 = &v11;
    id v9 = v2;
    [v4 performWithoutEnforcement:v8];
  }
  id v5 = (__CFString *)v12[5];
  if (!v5) {
    id v5 = &stru_26CBCA930;
  }
  float v6 = v5;

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __36__MPCModelGenericAVItem_stationName__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)stationHash
{
  uint64_t v2 = [(MPCModelGenericAVItem *)self _radioStation];
  uint64_t v3 = [v2 identifiers];
  uint64_t v4 = [v3 radio];
  id v5 = [v4 stationHash];

  return v5;
}

- (int64_t)stationID
{
  uint64_t v2 = [(MPCModelGenericAVItem *)self _radioStation];
  uint64_t v3 = [v2 identifiers];
  uint64_t v4 = [v3 radio];
  int64_t v5 = [v4 stationID];

  return v5;
}

- (void)setRating:(float)a3
{
  if ([(MPCModelGenericAVItem *)self supportsRating])
  {
    int64_t v5 = [(MPCModelGenericAVItem *)self mediaItem];
    *(float *)&double v6 = a3 * 5.0;
    uint64_t v7 = [NSNumber numberWithFloat:v6];
    [v5 setValue:v7 forProperty:*MEMORY[0x263F113A0] withCompletionBlock:0];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:*MEMORY[0x263F11138] object:self userInfo:0];
  }
}

- (void)_prepareLeaseWithShouldRequireLeaseAcquisition:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke;
  v8[3] = &unk_2643BE778;
  BOOL v10 = a3;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(MPCModelGenericAVItem *)self _getSubscriptionLeasePropertiesWithCompletion:v8];
}

void __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if ([a3 shouldUseLease])
  {
    id v22 = v7;
    id v23 = *(id *)(a1 + 40);
    msv_dispatch_on_main_queue();

    id v9 = v22;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v10 = [*(id *)(a1 + 32) eventStream];
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      uint64_t v13 = [v10 engineID];
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v25 = v13;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Failed to get lease status error=%{public}@", buf, 0x20u);
    }
    id v15 = *(void **)(a1 + 40);
    if (v15)
    {
      id v21 = v15;
      id v20 = v8;
      msv_dispatch_on_main_queue();

      id v9 = v21;
      goto LABEL_12;
    }
  }
  else
  {
    if (v12)
    {
      id v16 = [v10 engineID];
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v25 = v16;
      __int16 v26 = 2114;
      uint64_t v27 = v17;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Early completion [Subscription lease not required]", buf, 0x16u);
    }
    __int16 v18 = *(void **)(a1 + 40);
    if (v18)
    {
      id v19 = v18;
      msv_dispatch_on_main_queue();
      id v9 = v19;
      goto LABEL_12;
    }
  }
LABEL_13:
}

void __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  ++*(void *)(*(void *)(a1 + 32) + 592);
  uint64_t v2 = [*(id *)(a1 + 32) eventStream];
  uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 engineID];
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v15 = v4;
    __int16 v16 = 2114;
    uint64_t v17 = v5;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Sending subscription lease request", buf, 0x16u);
  }
  id v6 = objc_alloc(MEMORY[0x263F891E8]);
  id v7 = [*(id *)(a1 + 40) requestContext];
  id v8 = (void *)[v6 initWithRequestContext:v7];

  [v8 setShouldRequireLeaseAcquisition:*(unsigned __int8 *)(a1 + 56)];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_365;
  v11[3] = &unk_2643C14F8;
  id v9 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v13 = *(id *)(a1 + 48);
  id v10 = (id)[v12 performPlaybackRequest:v8 completionHandler:v11];
}

uint64_t __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_370(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

uint64_t __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_371(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_365(id *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = (void *)MEMORY[0x263F087E8];
  id v9 = a3;
  id v10 = [v8 errorForICError:a4 response:v7];
  if ([v10 code] == -7600)
  {
    uint64_t v11 = [a1[4] eventStream];
    id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (!v10)
  {
    uint64_t v11 = [a1[4] eventStream];
    id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      __int16 v16 = [v11 engineID];
      id v17 = a1[4];
      uint64_t v18 = [a1[5] leaseStatus];
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v16;
      __int16 v27 = 2114;
      id v28 = v17;
      __int16 v29 = 2114;
      id v30 = v7;
      __int16 v31 = 2114;
      uint64_t v32 = v18;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Finished subscription lease request for rate preparation with response: %{public}@ - status: %{public}@", buf, 0x2Au);
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v13 = a1[4];
    uint64_t v14 = [a1[5] leaseStatus];
    id v15 = objc_msgSend(v10, "msv_description");
    *(_DWORD *)buf = 138544130;
    __int16 v26 = v13;
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2114;
    id v30 = v14;
    __int16 v31 = 2114;
    uint64_t v32 = v15;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[LeaseRatePreparation] - %{public}@: Finished subscription lease request for rate preparation with response: %{public}@ - status: %{public}@ error=%{public}@", buf, 0x2Au);
  }
LABEL_10:

  id v24 = a1[6];
  id v21 = v7;
  id v22 = v10;
  id v23 = a1[5];
  id v19 = v10;
  id v20 = v7;
  msv_dispatch_on_main_queue();
  [a1[4] _emitNetworkOperationWithPerformanceMetrics:v9 operationType:4 reason:@"Prepare for rate" blocksPlayback:a1[6] != 0];
}

unsigned char *__90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_366(void *a1)
{
  --*(void *)(a1[4] + 592);
  uint64_t v2 = a1[8];
  if (v2)
  {
    if (a1[5]) {
      BOOL v3 = a1[6] == 0;
    }
    else {
      BOOL v3 = 0;
    }
    uint64_t v4 = v3;
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
  }
  uint64_t result = (unsigned char *)a1[4];
  if (result[600])
  {
    uint64_t v6 = a1[7];
    return (unsigned char *)[result _updatePreventionStatusWithLeaseSession:v6];
  }
  return result;
}

- (void)prepareForRate:(float)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(MPCModelGenericAVItem *)self eventStream];
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 engineID];
    *(_DWORD *)buf = 138543874;
    id v25 = v9;
    __int16 v26 = 2114;
    __int16 v27 = self;
    __int16 v28 = 2048;
    double v29 = a3;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Preparing for rate: %f.", buf, 0x20u);
  }
  float v10 = fabsf(a3);
  BOOL lastPreparedForNonZeroRate = self->_lastPreparedForNonZeroRate;
  self->_BOOL lastPreparedForNonZeroRate = v10 > 0.00000011921;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke;
  aBlock[3] = &unk_2643BE728;
  void aBlock[4] = self;
  BOOL v23 = v10 > 0.00000011921;
  id v12 = v6;
  id v21 = v12;
  float v22 = a3;
  id v13 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  if (v10 <= 0.00000011921)
  {
    deferredLeaseAcquisitionTask = self->_deferredLeaseAcquisitionTask;
    self->_deferredLeaseAcquisitionTask = 0;

LABEL_11:
    v13[2](v13, 1, 0);
    goto LABEL_12;
  }
  if (lastPreparedForNonZeroRate
    || ![(MPCModelGenericAVItem *)self isAssetLoaded]
    || !self->_isSubscriptionPolicyContent)
  {
    goto LABEL_11;
  }
  uint64_t v14 = [(MPCModelGenericAVItem *)self eventStream];
  id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = [v14 engineID];
    *(_DWORD *)buf = 138543618;
    id v25 = v16;
    __int16 v26 = 2114;
    __int16 v27 = self;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Getting subscription lease session", buf, 0x16u);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_355;
  v18[3] = &unk_2643BEA40;
  v18[4] = self;
  id v19 = v13;
  [(MPCModelGenericAVItem *)self _getUnverifiedSubscriptionLeaseSessionWithCompletion:v18];

LABEL_12:
}

void __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5
    || (a2 & 1) != 0
    || ([*(id *)(a1 + 32) itemError],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    if (!a2) {
      goto LABEL_10;
    }
  }
  else
  {
    [*(id *)(a1 + 32) setItemError:v5];
    if (!a2) {
      goto LABEL_10;
    }
  }
  if (*(unsigned char *)(a1 + 52))
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      id v8 = *(void **)(*(void *)(a1 + 32) + 768);
      if (v8)
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        id v15[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2;
        v15[3] = &unk_2643C54B8;
        id v16 = v7;
        [v8 waitForKeyRenewalsWithCompletionHandler:v15];

        goto LABEL_12;
      }
    }
  }
LABEL_10:
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
LABEL_12:
  float v10 = [*(id *)(a1 + 32) eventStream];
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 engineID];
    uint64_t v13 = *(void *)(a1 + 32);
    double v14 = *(float *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 2048;
    double v22 = v14;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Finished preparing for rate: %f.", buf, 0x20u);
  }
}

void __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_355(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 leaseStatus];
    id v6 = *(unsigned __int8 **)(a1 + 32);
    int v7 = v6[585];
    if ([v6 isDownloadedAsset]) {
      int v8 = [v5 hasOfflinePlaybackKeys];
    }
    else {
      int v8 = 0;
    }
    if (v7) {
      int v13 = v8 ^ 1;
    }
    else {
      int v13 = 0;
    }
    if ([v5 shouldPlaybackRequireOnlineKeys]) {
      int v14 = [v5 hasOnlinePlaybackKeys] ^ 1;
    }
    else {
      int v14 = 0;
    }
    if ([v5 hasOnlinePlaybackKeys]) {
      int v15 = 0;
    }
    else {
      int v15 = [v5 hasOfflinePlaybackKeys] ^ 1;
    }
    if ((v13 & (v14 | v15)) == 1)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = *(void **)(v16 + 808);
      *(void *)(v16 + 808) = 0;

      [*(id *)(a1 + 32) _prepareLeaseWithShouldRequireLeaseAcquisition:0 completionHandler:*(void *)(a1 + 40)];
      goto LABEL_29;
    }
    int v36 = v13;
    if (v8) {
      goto LABEL_20;
    }
    __int16 v27 = [v4 leaseExpirationDate];
    [v27 timeIntervalSinceNow];
    if (v28 <= 60.0)
    {
    }
    else
    {
      char v29 = [*(id *)(a1 + 32) isHLSAsset];

      if ((v29 & 1) == 0)
      {
LABEL_20:
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        uint64_t v18 = NSString;
        __int16 v19 = [*(id *)(a1 + 32) contentItemID];
        uint64_t v20 = [v18 stringWithFormat:@"leaseAcquisition:%@", v19];

        __int16 v21 = [MPCNonZeroEffectiveRateTask alloc];
        double v22 = [*(id *)(a1 + 32) playerItem];
        id v23 = MEMORY[0x263EF83A0];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2_360;
        v39[3] = &unk_2643C3A78;
        objc_copyWeak(&v40, (id *)buf);
        uint64_t v24 = [(MPCNonZeroEffectiveRateTask *)v21 initWithPlayerItem:v22 identifier:v20 timeout:MEMORY[0x263EF83A0] queue:v39 block:15.0];
        uint64_t v25 = *(void *)(a1 + 32);
        __int16 v26 = *(void **)(v25 + 808);
        *(void *)(v25 + 808) = v24;

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
LABEL_26:
        uint64_t v32 = [*(id *)(a1 + 32) eventStream];
        uint64_t v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          double v34 = [v32 engineID];
          uint64_t v35 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544642;
          CGSize v42 = v34;
          __int16 v43 = 2114;
          uint64_t v44 = v35;
          __int16 v45 = 1024;
          int v46 = v36;
          __int16 v47 = 1024;
          int v48 = v8;
          __int16 v49 = 1024;
          int v50 = v14;
          __int16 v51 = 1024;
          int v52 = v15;
          _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Early completion [Playback keys not required] - someKeysAreRequired:%{BOOL}u - isDownloadedAndHasOfflineKeys: %{BOOL}u - requiresOnlineKeys: %{BOOL}u - hasNeitherOnlineNorOfflineKeys: %{BOOL}u", buf, 0x2Eu);
        }
        id v38 = *(id *)(a1 + 40);
        msv_dispatch_on_main_queue();

        goto LABEL_29;
      }
    }
    uint64_t v30 = *(void *)(a1 + 32);
    __int16 v31 = *(void **)(v30 + 808);
    *(void *)(v30 + 808) = 0;

    [*(id *)(a1 + 32) _prepareLeaseWithShouldRequireLeaseAcquisition:1 completionHandler:0];
    goto LABEL_26;
  }
  uint64_t v9 = [*(id *)(a1 + 32) eventStream];
  float v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 engineID];
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    CGSize v42 = v11;
    __int16 v43 = 2114;
    uint64_t v44 = v12;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Early completion [No subscription lease session available]", buf, 0x16u);
  }
  id v37 = *(id *)(a1 + 40);
  msv_dispatch_on_main_queue();
  id v5 = v37;
LABEL_29:
}

void __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2_360(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _prepareLeaseWithShouldRequireLeaseAcquisition:1 completionHandler:0];
  }
}

uint64_t __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_362(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_363(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2()
{
  return msv_dispatch_on_main_queue();
}

uint64_t __44__MPCModelGenericAVItem_prefersSeekOverSkip__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) type];
  if (result == 4)
  {
    uint64_t result = [*(id *)(a1 + 32) subtype];
    BOOL v3 = result == 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)playbackError
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)MPCModelGenericAVItem;
  BOOL v3 = [(MPCModelGenericAVItem *)&v23 playbackError];
  if ([(MPCModelGenericAVItem *)self isAssetLoaded])
  {
    uint64_t v4 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08570], -1009);

    if (v4)
    {
      id v5 = [MEMORY[0x263F89110] sharedMonitor];
      uint64_t v6 = [v5 networkType];

      int v7 = [(MPCModelGenericAVItem *)self eventStream];
      int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v7 engineID];
        BOOL isMusicCellularStreamingAllowed = self->_isMusicCellularStreamingAllowed;
        *(_DWORD *)buf = 138544130;
        __int16 v27 = v9;
        __int16 v28 = 2114;
        char v29 = self;
        __int16 v30 = 2048;
        uint64_t v31 = v6;
        __int16 v32 = 1024;
        BOOL v33 = isMusicCellularStreamingAllowed;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Player item has not connected to internet error, current network type is %li, cellular allowed is %{BOOL}u", buf, 0x26u);
      }
      if (self->_isMusicCellularStreamingAllowed || !ICEnvironmentNetworkTypeIsCellular())
      {
        uint64_t v11 = [(MPCModelGenericAVItem *)self eventStream];
        uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v11 engineID];
          *(_DWORD *)buf = 138543874;
          __int16 v27 = v16;
          __int16 v28 = 2114;
          char v29 = self;
          __int16 v30 = 2114;
          uint64_t v31 = (uint64_t)v3;
          _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Transforming error network unavailable instead of original: %{public}@", buf, 0x20u);
        }
        int v14 = @"Network Unavailable";
        uint64_t v15 = 11;
      }
      else
      {
        uint64_t v11 = [(MPCModelGenericAVItem *)self eventStream];
        uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [v11 engineID];
          *(_DWORD *)buf = 138543874;
          __int16 v27 = v13;
          __int16 v28 = 2114;
          char v29 = self;
          __int16 v30 = 2114;
          uint64_t v31 = (uint64_t)v3;
          _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Transforming error to cellular restricted error instead of original: %{public}@", buf, 0x20u);
        }
        int v14 = @"Cellular Restricted";
        uint64_t v15 = 10;
      }

      v24[0] = @"ICEnvironmentNetworkType";
      id v17 = [NSNumber numberWithInteger:v6];
      v24[1] = @"isMusicCellularStreamingAllowed";
      v25[0] = v17;
      uint64_t v18 = [NSNumber numberWithBool:self->_isMusicCellularStreamingAllowed];
      v25[1] = v18;
      __int16 v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      uint64_t v20 = objc_msgSend(v3, "msv_errorByWrappingWithDomain:code:userInfo:debugDescription:", @"MPCError", v15, v19, @"playback request failed with reason: %@", v14);

      BOOL v3 = (void *)v20;
    }
  }
  id v21 = v3;

  return v21;
}

- (void)notePlaybackFinishedByHittingEnd
{
  v3.receiver = self;
  v3.super_class = (Class)MPCModelGenericAVItem;
  [(MPCModelGenericAVItem *)&v3 notePlaybackFinishedByHittingEnd];
  if (self->_hlsDownloadURLRequest) {
    [(MPCModelGenericAVItem *)self _addToDownloadCompletionPendingItems];
  }
}

- (id)personID
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject identifiers];
  id v5 = [v4 personalizedStore];
  uint64_t v6 = [v5 personID];

  os_unfair_lock_unlock(p_genericObjectLock);

  return v6;
}

- (void)_emitNetworkOperationWithPerformanceMetrics:(id)a3 operationType:(int64_t)a4 reason:(id)a5 blocksPlayback:(BOOL)a6
{
  BOOL v6 = a6;
  v19[6] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  if ([v10 isNotEmpty])
  {
    uint64_t v12 = [(MPCModelGenericAVItem *)self eventStream];
    v18[0] = @"queue-section-id";
    int v13 = [(MPCModelGenericAVItem *)self queueSectionID];
    v19[0] = v13;
    v18[1] = @"queue-item-id";
    int v14 = [(MPCModelGenericAVItem *)self queueItemID];
    v19[1] = v14;
    v18[2] = @"network-operation-type";
    uint64_t v15 = [NSNumber numberWithInteger:a4];
    void v19[2] = v15;
    v19[3] = v11;
    v18[3] = @"network-operation-reason";
    v18[4] = @"blocks-playback";
    uint64_t v16 = [NSNumber numberWithBool:v6];
    void v18[5] = @"network-metrics";
    v19[4] = v16;
    v19[5] = v10;
    id v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:6];
    [v12 emitEventType:@"network-operation" payload:v17];
  }
}

- (void)_emitAudioAssetTypeSelection:(id)a3 assetLoadInfo:(id)a4
{
  void v21[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MPCModelGenericAVItem *)self eventStream];
  v20[0] = @"queue-section-id";
  uint64_t v9 = [(MPCModelGenericAVItem *)self queueSectionID];
  v21[0] = v9;
  v20[1] = @"queue-item-id";
  id v10 = [(MPCModelGenericAVItem *)self queueItemID];
  v21[1] = v10;
  void v21[2] = v7;
  v20[2] = @"asset-load-info";
  v20[3] = @"item-audio-asset-type-selection-metadata";
  id v17 = v7;
  v18[0] = @"audio-asset-type-selection-explanation";
  id v11 = [v6 explanation];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }
  v18[1] = @"audio-asset-type-selection-justification";
  v19[0] = v12;
  int v13 = [v6 justification];
  int v14 = v13;
  if (!v13)
  {
    int v14 = [MEMORY[0x263EFF9D0] null];
  }
  v19[1] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v21[3] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  [v8 emitEventType:@"asset-selection" payload:v16];

  if (!v13) {
  if (!v11)
  }
}

- (void)_emitAudioFormatChangeEvent
{
  v23[3] = *MEMORY[0x263EF8340];
  __int16 v19 = [(MPCModelGenericAVItem *)self eventStream];
  v22[0] = @"queue-section-id";
  uint64_t v18 = [(MPCModelGenericAVItem *)self queueSectionID];
  v23[0] = v18;
  v22[1] = @"queue-item-id";
  id v17 = [(MPCModelGenericAVItem *)self queueItemID];
  v23[1] = v17;
  v22[2] = @"item-audio-format-metadata";
  v20[0] = @"active-format";
  uint64_t v3 = [(MPCModelGenericAVItem *)self activeFormat];
  uint64_t v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];
  }
  v21[0] = v3;
  v20[1] = @"active-format-justification";
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[MPCModelGenericAVItem activeFormatJustification](self, "activeFormatJustification", v3));
  v21[1] = v5;
  v20[2] = @"target-format";
  id v6 = [(MPCModelGenericAVItem *)self preferredFormat];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  void v21[2] = v7;
  v20[3] = @"preferred-tiers";
  int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPCModelGenericAVItem _audioFormatPreference](self, "_audioFormatPreference"));
  v21[3] = v8;
  void v20[4] = @"alternate-formats";
  uint64_t v9 = [(MPCModelGenericAVItem *)self alternateFormats];
  id v10 = (void *)v9;
  uint64_t v11 = MEMORY[0x263EFFA68];
  if (v9) {
    uint64_t v11 = v9;
  }
  void v21[4] = v11;
  void v20[5] = @"route";
  uint64_t v12 = [(MPCModelGenericAVItem *)self audioRoute];
  int v13 = v12;
  if (!v12)
  {
    int v13 = [MEMORY[0x263EFF9D0] null];
  }
  void v21[5] = v13;
  int v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
  void v23[2] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  [v19 emitEventType:@"audio-format-changed" payload:v15];

  if (!v12) {
  if (!v6)
  }

  if (!v4) {
}
  }

- (void)_updateActiveFormatJustification:(int64_t)a3
{
  id v5 = [(MPCModelGenericAVItem *)self activeFormat];
  id v6 = [(MPCModelGenericAVItem *)self preferredFormat];
  if (v5 == v6)
  {

    int64_t v9 = 100;
  }
  else
  {
    id v7 = v6;
    int v8 = [v5 isEqual:v6];

    if (v8) {
      int64_t v9 = 100;
    }
    else {
      int64_t v9 = a3;
    }
  }

  [(MPCModelGenericAVItem *)self setActiveFormatJustification:v9];
}

- (void)configureAVPlayerItemWithAudioFormat:(id)a3 forceSpatial:(BOOL)a4
{
  id v11 = a3;
  if ([(MPCModelGenericAVItem *)self isAssetLoaded])
  {
    id v5 = [(MPCModelGenericAVItem *)self playerItem];
    id v6 = [(MPCModelGenericAVItem *)self audioAssetTypeSelector];
    uint64_t v7 = [v6 spatialPreference];
    int v8 = [(MPCModelGenericAVItem *)self audioAssetTypeSelector];
    uint64_t v9 = [v8 spatialIsAlwaysOn];
    id v10 = [(MPCModelGenericAVItem *)self audioAssetTypeSelector];
    objc_msgSend(v5, "mpc_setupForHLSPlaybackWithPreferredFormat:spatialPreference:forceSpatial:maxResolution:isDownloadedAsset:", v11, v7, v9, objc_msgSend(v10, "maxResolution"), -[MPCModelGenericAVItem isDownloadedAsset](self, "isDownloadedAsset"));
  }
}

- (void)setAudioRoute:(id)a3
{
  int v8 = (MPCPlayerAudioRoute *)a3;
  id v5 = self->_audioRoute;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(MPCPlayerAudioRoute *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_audioRoute, a3);
      [(MPCModelGenericAVItem *)self invalidateContentItemAudioFormatInfo];
    }
  }
}

- (BOOL)updateActiveFormat:(id)a3 justification:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v7 = (MPCPlayerAudioFormat *)a3;
  if (!v7) {
    goto LABEL_8;
  }
  int v8 = self->_activeFormat;
  if (v8 == v7)
  {

    goto LABEL_8;
  }
  uint64_t v9 = v8;
  BOOL v10 = [(MPCPlayerAudioFormat *)v7 isEqual:v8];

  if (v10)
  {
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  id v11 = [(MPCModelGenericAVItem *)self eventStream];
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v11 engineID];
    activeFormat = self->_activeFormat;
    int v17 = 138544386;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    double v22 = activeFormat;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: [AF] - Updating active audio format: %{public}@ -> %{public}@ - Justification: %ld", (uint8_t *)&v17, 0x34u);
  }
  objc_storeStrong((id *)&self->_activeFormat, a3);
  [(MPCModelGenericAVItem *)self _updateActiveFormatJustification:a4];
  [(MPCModelGenericAVItem *)self _emitAudioFormatChangeEvent];
  [(MPCModelGenericAVItem *)self invalidateContentItemAudioFormatInfo];
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (BOOL)updatePreferredFormat:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = (MPCPlayerAudioFormat *)a3;
  id v6 = self->_preferredFormat;
  if (v6 == v5)
  {

    goto LABEL_7;
  }
  BOOL v7 = v6;
  BOOL v8 = [(MPCPlayerAudioFormat *)v5 isEqual:v6];

  if (v8)
  {
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = [(MPCModelGenericAVItem *)self eventStream];
  BOOL v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 engineID];
    preferredFormat = self->_preferredFormat;
    int v15 = 138544130;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = preferredFormat;
    __int16 v21 = 2114;
    double v22 = v5;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: [AF] - Updating preferred audio format: %{public}@ -> %{public}@", (uint8_t *)&v15, 0x2Au);
  }
  objc_storeStrong((id *)&self->_preferredFormat, a3);
  [(MPCModelGenericAVItem *)self _emitAudioFormatChangeEvent];
  [(MPCModelGenericAVItem *)self invalidateContentItemAudioFormatInfo];
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)updateAudioFormatsDictionary:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  id v5 = self->_audioFormatsDictionary;
  if (v5 == v4)
  {

    goto LABEL_5;
  }
  id v6 = v5;
  char v7 = [(NSDictionary *)v4 isEqual:v5];

  if (v7)
  {
LABEL_5:
    BOOL v13 = 0;
    goto LABEL_6;
  }
  [(MPCModelGenericAVItem *)self setAudioFormatsDictionary:v4];
  BOOL v8 = [(MPCModelGenericAVItem *)self audioFormatsDictionary];
  uint64_t v9 = [v8 allValues];
  BOOL v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_333];
  [(MPCModelGenericAVItem *)self setAvailableSortedFormats:v10];

  id v11 = [(MPCModelGenericAVItem *)self availableSortedFormats];
  alternateFormats = self->_alternateFormats;
  self->_alternateFormats = v11;

  [(MPCModelGenericAVItem *)self invalidateContentItemAudioFormatInfo];
  BOOL v13 = 1;
LABEL_6:

  return v13;
}

uint64_t __54__MPCModelGenericAVItem_updateAudioFormatsDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 tier];
  if (v6 <= [v5 tier])
  {
    uint64_t v8 = [v4 tier];
    if (v8 >= [v5 tier])
    {
      uint64_t v9 = [v4 tier];
      if (v9 != [v5 tier]) {
        goto LABEL_10;
      }
      uint64_t v10 = [v4 tier];
      uint64_t v11 = [v4 bitrate];
      uint64_t v12 = [v5 bitrate];
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v13 = [v4 bitDepth];
        uint64_t v11 = [v4 sampleRate] * v13;
        uint64_t v14 = [v5 bitDepth];
        uint64_t v12 = [v5 sampleRate] * v14;
      }
      if (v11 > v12) {
        goto LABEL_2;
      }
      if (v11 >= v12)
      {
LABEL_10:
        uint64_t v7 = 0;
        goto LABEL_11;
      }
    }
    uint64_t v7 = 1;
    goto LABEL_11;
  }
LABEL_2:
  uint64_t v7 = -1;
LABEL_11:

  return v7;
}

- (id)audioFormatForStableVariantID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MPCModelGenericAVItem *)self audioFormatsDictionary];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_linkAssetIfNeededAtURL:(id)a3 toDestinationURL:(id)a4 shareCacheURL:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 isEqual:v9])
  {
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    [v12 removeItemAtURL:v9 error:0];
    id v25 = 0;
    int v14 = [v12 linkItemAtURL:v8 toURL:v9 error:&v25];
    id v11 = v25;
    int v15 = [(MPCModelGenericAVItem *)self eventStream];
    uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    __int16 v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v15 engineID];
        *(_DWORD *)buf = 138544130;
        uint64_t v27 = v18;
        __int16 v28 = 2114;
        char v29 = self;
        __int16 v30 = 2114;
        id v31 = v8;
        __int16 v32 = 2114;
        id v33 = v9;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset downloaded to %{public}@ and linked to destination URL: %{public}@", buf, 0x2Au);
      }
      if (!v10 || ([v8 isEqual:v10] & 1) != 0) {
        goto LABEL_9;
      }
      [v12 removeItemAtURL:v10 error:0];
      id v24 = v11;
      char v22 = [v12 linkItemAtURL:v8 toURL:v10 error:&v24];
      id v20 = v24;

      if (v22)
      {
        LOBYTE(v14) = 1;
        goto LABEL_14;
      }
      int v15 = [(MPCModelGenericAVItem *)self eventStream];
      __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [v15 engineID];
        *(_DWORD *)buf = 138544386;
        uint64_t v27 = v23;
        __int16 v28 = 2114;
        char v29 = self;
        __int16 v30 = 2114;
        id v31 = v8;
        __int16 v32 = 2114;
        id v33 = v10;
        __int16 v34 = 2114;
        id v35 = v20;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Asset downloaded to %{public}@ but failed to link to shared cache URL: %{public}@ error: %{public}@", buf, 0x34u);
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [v15 engineID];
        *(_DWORD *)buf = 138544386;
        uint64_t v27 = v19;
        __int16 v28 = 2114;
        char v29 = self;
        __int16 v30 = 2114;
        id v31 = v8;
        __int16 v32 = 2114;
        id v33 = v9;
        __int16 v34 = 2114;
        id v35 = v11;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Asset downloaded to %{public}@ but failed to link to destination URL: %{public}@ error: %{public}@", buf, 0x34u);
      }
      id v20 = v11;
    }

LABEL_14:
    id v11 = v20;
    goto LABEL_15;
  }
  id v11 = [(MPCModelGenericAVItem *)self eventStream];
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v11 engineID];
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    char v29 = self;
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset downloaded to destination URL: %{public}@", buf, 0x20u);
  }
LABEL_9:
  LOBYTE(v14) = 1;
LABEL_15:

  return v14;
}

- (void)_checkDownloadErrorAndValidityOfDownloadedHLSAsset:(id)a3 downloadLocationURL:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  BOOL v27 = v8 == 0;
  if (v8)
  {
    id v11 = [v8 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F88F00]];

    if (v12)
    {
      uint64_t v13 = [v8 code];
      if ((unint64_t)(v13 + 7004) < 2 || v13 == -7100) {
        *((unsigned char *)v25 + 24) = 1;
      }
    }
  }
  if (*((unsigned char *)v25 + 24))
  {
    objc_initWeak((id *)location, self);
    int v14 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v9 options:0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __107__MPCModelGenericAVItem__checkDownloadErrorAndValidityOfDownloadedHLSAsset_downloadLocationURL_completion___block_invoke;
    v19[3] = &unk_2643BE6E0;
    objc_copyWeak(&v23, (id *)location);
    id v21 = v10;
    id v15 = v14;
    id v20 = v15;
    char v22 = &v24;
    [v15 loadValuesAsynchronouslyForKeys:&unk_26CC194C0 completionHandler:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v16 = [(MPCModelGenericAVItem *)self eventStream];
    __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v16 engineID];
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v18;
      __int16 v29 = 2114;
      __int16 v30 = self;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Clearing cached asset file [fatal download error]. Error=%{public}@", location, 0x20u);
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  _Block_object_dispose(&v24, 8);
}

void __107__MPCModelGenericAVItem__checkDownloadErrorAndValidityOfDownloadedHLSAsset_downloadLocationURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v11 = 0;
    uint64_t v4 = [v3 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:&v11];
    id v5 = v11;
    uint64_t v6 = v5;
    if (v4 == 3 || v5 != 0)
    {
      id v8 = [WeakRetained eventStream];
      id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v8 engineID];
        *(_DWORD *)buf = 138543874;
        uint64_t v13 = v10;
        __int16 v14 = 2114;
        id v15 = WeakRetained;
        __int16 v16 = 2114;
        __int16 v17 = v6;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Clearing cached asset [asset is corrupted]. Error=%{public}@", buf, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_downloadHLSAsset:(id)a3 destinationURL:(id)a4 sharedCacheURL:(id)a5 assetLoadProperties:(id)a6 loadResult:(id)a7 storeRequestContext:(id)a8 urlBag:(id)a9 fileUpgradeRecommendation:(int64_t)a10
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v39 = a4;
  id v40 = a5;
  id v17 = a6;
  id v38 = a7;
  id v43 = a8;
  id v37 = a9;
  uint64_t v18 = (void *)MEMORY[0x263F089E0];
  __int16 v45 = v16;
  __int16 v19 = [v16 URL];
  uint64_t v44 = [v18 requestWithURL:v19];

  [v44 setTimeoutInterval:3600.0];
  id v20 = (ICURLRequest *)[objc_alloc(MEMORY[0x263F893B0]) initWithURLRequest:v44 requestContext:v43];
  hlsDownloadURLRequest = self->_hlsDownloadURLRequest;
  self->_hlsDownloadURLRequest = v20;

  CGSize v42 = [(MPCModelGenericAVItem *)self _hlsDownloadOptionsDictionary:v17];
  char v22 = [v16 downloadDestinationURL];
  objc_initWeak(&location, self);
  id v23 = objc_alloc(MEMORY[0x263F54ED0]);
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke;
  v63[3] = &unk_2643C5FF0;
  uint64_t v36 = &v64;
  objc_copyWeak(&v64, &location);
  uint64_t v24 = (void *)[v23 initWithDeallocHandler:v63];
  id v25 = [(MPCModelGenericAVItem *)self eventStream];
  uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v27 = objc_msgSend(v25, "engineID", &v64);
    *(_DWORD *)buf = 138543874;
    v67 = v27;
    __int16 v68 = 2114;
    v69 = self;
    __int16 v70 = 2114;
    v71 = v22;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Asset download starting. url:%{public}@", buf, 0x20u);
  }
  objc_storeStrong((id *)&self->_tempFileURLToCleanup, v22);
  hlsDownloadURLSession = self->_hlsDownloadURLSession;
  __int16 v29 = self->_hlsDownloadURLRequest;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_315;
  v53[3] = &unk_2643BE6B8;
  id v30 = v24;
  id v54 = v30;
  BOOL v62 = a10 != 2;
  id v41 = v17;
  id v55 = v41;
  id v31 = v22;
  id v56 = v31;
  objc_copyWeak(v61, &location);
  v61[1] = (id)a10;
  id v32 = v39;
  id v57 = v32;
  id v33 = v40;
  id v58 = v33;
  id v34 = v38;
  id v59 = v34;
  id v35 = v37;
  id v60 = v35;
  [(ICAVAssetDownloadURLSession *)hlsDownloadURLSession enqueueAggregateAssetDownloadRequest:v29 toDestination:v31 withAVURLAsset:v45 options:v42 completionHandler:v53];
  if (a10 == 1 && [v31 isEqual:v32])
  {
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_324;
    v46[3] = &unk_2643C01E0;
    id v47 = v45;
    objc_copyWeak(&v52, &location);
    id v48 = v41;
    id v49 = v34;
    id v50 = v35;
    id v51 = v32;
    [v47 loadValuesAsynchronouslyForKeys:&unk_26CC194A8 completionHandler:v46];

    objc_destroyWeak(&v52);
  }

  objc_destroyWeak(v61);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeFromDownloadCompletionPendingItems];
}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_315(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [*(id *)(a1 + 32) disarm];
  if (*(unsigned char *)(a1 + 104))
  {
    id v5 = [*(id *)(a1 + 40) assetCacheProvider];
    [v5 didCacheNewAssetToDestinationURL:*(void *)(a1 + 48)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained eventStream];
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 engineID];
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v33 = v10;
      __int16 v34 = 2114;
      id v35 = v7;
      __int16 v36 = 2114;
      uint64_t v37 = v11;
      __int16 v38 = 2114;
      id v39 = v4;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Asset download complete. url:%{public}@ err=%{public}@", buf, 0x2Au);
    }
    int v12 = (void *)v7[98];
    v7[98] = 0;

    uint64_t v13 = (void *)v7[97];
    v7[97] = 0;

    [v7 _removeFromDownloadCompletionPendingItems];
    uint64_t v14 = *(void *)(a1 + 48);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_316;
    v21[3] = &unk_2643BE690;
    id v15 = (id *)&v22;
    id v16 = v7;
    char v22 = v16;
    id v23 = *(id *)(a1 + 48);
    id v24 = *(id *)(a1 + 56);
    id v25 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 96);
    id v26 = v17;
    uint64_t v29 = v18;
    id v27 = *(id *)(a1 + 72);
    id v28 = *(id *)(a1 + 80);
    [v16 _checkDownloadErrorAndValidityOfDownloadedHLSAsset:v4 downloadLocationURL:v14 completion:v21];

    __int16 v19 = v23;
    goto LABEL_7;
  }
  if (*(void *)(a1 + 96) == 1 && [*(id *)(a1 + 48) isEqual:*(void *)(a1 + 56)])
  {
    __int16 v19 = [*(id *)(a1 + 40) assetCacheProvider];
    id v20 = [*(id *)(a1 + 40) genericObject];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_2;
    v30[3] = &unk_2643C30F8;
    id v15 = &v31;
    id v31 = *(id *)(a1 + 48);
    [v19 clearPlaybackAssetCacheFileAssetForGenericObject:v20 withCompletionHandler:v30];

LABEL_7:
  }
}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_324(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 duration];
    if (v7 >= 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      id v4 = WeakRetained;
      if (WeakRetained)
      {
        id v5 = (id)[WeakRetained _createOrUpdateDatabaseEntry:*(void *)(a1 + 40) loadResult:*(void *)(a1 + 48) urlBag:*(void *)(a1 + 56) destinationURL:*(void *)(a1 + 64) purgeable:1];
        if ([*(id *)(a1 + 64) isEqual:v4[100]])
        {
          uint64_t v6 = (void *)v4[100];
          v4[100] = 0;
        }
      }
    }
  }
}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v3;
      uint64_t v6 = "[AL] - NIL: [Asset caching: HLS] Asset download cancelled - Failed to clear cache properties. err=%{public}@";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_21BB87000, v7, v8, v6, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    int v10 = 138543362;
    id v11 = v9;
    uint64_t v6 = "[AL] - NIL: [Asset caching: HLS] Asset download cancelled - Cleared cache properties. url:%{public}@";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }
}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_316(uint64_t a1, int a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a2
    && [*(id *)(a1 + 32) _linkAssetIfNeededAtURL:*(void *)(a1 + 40) toDestinationURL:*(void *)(a1 + 48) shareCacheURL:*(void *)(a1 + 56)])
  {
    if ([*(id *)(a1 + 48) isEqual:*(void *)(*(void *)(a1 + 32) + 800)])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 800);
      *(void *)(v3 + 800) = 0;
    }
    id v5 = [*(id *)(a1 + 64) fileAsset];
    uint64_t v6 = [v5 filePath];

    uint64_t v7 = [*(id *)(a1 + 48) path];
    if (([v7 isEqual:v6] & 1) == 0) {
      id v8 = (id)[*(id *)(a1 + 32) _createOrUpdateDatabaseEntry:*(void *)(a1 + 64) loadResult:*(void *)(a1 + 72) urlBag:*(void *)(a1 + 80) destinationURL:*(void *)(a1 + 48) purgeable:*(void *)(a1 + 88) != 2];
    }
    if (![v6 length] || (objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0) {
      goto LABEL_17;
    }
    id v9 = [NSURL fileURLWithPath:v6];
    int v10 = [MEMORY[0x263F08850] defaultManager];
    id v27 = 0;
    int v11 = [v10 removeItemAtURL:v9 error:&v27];
    id v12 = v27;

    uint64_t v13 = [*(id *)(a1 + 32) eventStream];
    uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 engineID];
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v29 = v16;
        __int16 v30 = 2114;
        uint64_t v31 = v17;
        __int16 v32 = 2114;
        id v33 = v9;
        uint64_t v18 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Removed previous file at URL: %{public}@";
        __int16 v19 = v15;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        uint32_t v21 = 32;
LABEL_15:
        _os_log_impl(&dword_21BB87000, v19, v20, v18, buf, v21);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v13 engineID];
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v16;
      __int16 v30 = 2114;
      uint64_t v31 = v24;
      __int16 v32 = 2114;
      id v33 = v9;
      __int16 v34 = 2114;
      id v35 = v12;
      uint64_t v18 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to remove previous file at URL: %{public}@ error: %{public}@.";
      __int16 v19 = v15;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 42;
      goto LABEL_15;
    }

LABEL_17:
    goto LABEL_18;
  }
  char v22 = [*(id *)(a1 + 64) assetCacheProvider];
  id v23 = [*(id *)(a1 + 64) genericObject];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  void v25[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_317;
  v25[3] = &unk_2643C30F8;
  id v26 = *(id *)(a1 + 32);
  [v22 clearPlaybackAssetCacheFileAssetForGenericObject:v23 withCompletionHandler:v25];

  uint64_t v6 = v26;
LABEL_18:
}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_317(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) eventStream];
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [v4 engineID];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      id v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to clear cache properties. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (id)_createOrUpdateDatabaseEntry:(id)a3 loadResult:(id)a4 urlBag:(id)a5 destinationURL:(id)a6 purgeable:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v34 = a5;
  id v36 = a6;
  unint64_t v14 = [v12 preferredAudioAssetType] - 3;
  if (v14 > 2) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = qword_21BEF1750[v14];
  }
  uint64_t v35 = [v13 assetQualityType];
  uint64_t v16 = [v13 assetProtectionType];
  uint64_t v17 = [v13 streamingKeyCertificateURL];
  uint64_t v18 = [v13 streamingKeyServerURL];
  if (!v18)
  {
    __int16 v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"MPCModelGenericAVItem.m" lineNumber:2440 description:@"Unexpected nil keyServerURL"];
  }
  __int16 v38 = v12;
  if (!v17)
  {
    id v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"MPCModelGenericAVItem.m" lineNumber:2441 description:@"Unexpected nil keyCertificateURL"];
  }
  id v19 = objc_alloc(MEMORY[0x263F11EC8]);
  os_log_type_t v20 = self;
  id v21 = objc_alloc(MEMORY[0x263F11DB0]);
  char v22 = [MEMORY[0x263F11ED0] identityKind];
  id v23 = (void *)[v21 initWithSource:@"ModelGenericAVItem" modelKind:v22 block:&__block_literal_global_311];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_2;
  v42[3] = &unk_2643BE640;
  v42[4] = v20;
  uint64_t v47 = v15;
  id v24 = v36;
  id v43 = v24;
  uint64_t v48 = v35;
  uint64_t v49 = v16;
  BOOL v50 = a7;
  id v25 = v18;
  id v44 = v25;
  id v26 = v13;
  id v45 = v26;
  id v27 = v17;
  id v46 = v27;
  id v28 = (void *)[v19 initWithIdentifiers:v23 block:v42];

  objc_initWeak(&location, v20);
  uint64_t v29 = [v38 assetCacheProvider];
  __int16 v30 = [v38 genericObject];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_312;
  v39[3] = &unk_2643BE668;
  objc_copyWeak(&v40, &location);
  [v29 setPlaybackAssetCacheFileAsset:v28 forGenericObject:v30 withCompletionHandler:v39];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v28;
}

void __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 eventStream];
  uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_19;
  }
  uint64_t v7 = [v5 engineID];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 72);
  __int16 v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:6];
  if (v9)
  {
    id v13 = [NSString stringWithFormat:@"adm"];
    [v10 addObject:v13];

    if ((v9 & 2) == 0)
    {
LABEL_4:
      if ((v9 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_4;
  }
  unint64_t v14 = [NSString stringWithFormat:@"lossless"];
  [v10 addObject:v14];

  if ((v9 & 4) == 0)
  {
LABEL_5:
    if ((v9 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v15 = [NSString stringWithFormat:@"high-res lossless"];
  [v10 addObject:v15];

  if ((v9 & 8) == 0)
  {
LABEL_6:
    if ((v9 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    uint64_t v17 = [NSString stringWithFormat:@"atmos"];
    [v10 addObject:v17];

    if ((v9 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  uint64_t v16 = [NSString stringWithFormat:@"spatial"];
  [v10 addObject:v16];

  if ((v9 & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((v9 & 0x20) != 0)
  {
LABEL_8:
    uint64_t v11 = [NSString stringWithFormat:@"surround"];
    [v10 addObject:v11];
  }
LABEL_9:
  if ([v10 count])
  {
    id v12 = [v10 componentsJoinedByString:@", "];
  }
  else
  {
    id v12 = @"None";
  }

  int v22 = 138543874;
  id v23 = v7;
  __int16 v24 = 2114;
  uint64_t v25 = v8;
  __int16 v26 = 2114;
  id v27 = v12;
  _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Setting cache properties of HLS asset with traits: %{public}@", (uint8_t *)&v22, 0x20u);

LABEL_19:
  uint64_t v18 = [*(id *)(a1 + 40) relativePath];
  [v4 setFilePath:v18];

  [v4 setQualityType:*(void *)(a1 + 80)];
  [v4 setNonPurgeable:*(unsigned char *)(a1 + 96) == 0];
  [v4 setProtectionType:*(void *)(a1 + 88)];
  [v4 setTraits:*(void *)(a1 + 72)];
  id v19 = [*(id *)(a1 + 48) absoluteString];
  [v4 setHLSKeyServerURL:v19];

  os_log_type_t v20 = [*(id *)(a1 + 56) keyServerProtocolType];
  [v4 setHLSKeyServerProtocol:v20];

  id v21 = [*(id *)(a1 + 64) absoluteString];
  [v4 setHLSKeyCertificateURL:v21];
}

void __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_312(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained eventStream];
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [v6 engineID];
        int v14 = 138543874;
        uint64_t v15 = v9;
        __int16 v16 = 2114;
        uint64_t v17 = v5;
        __int16 v18 = 2114;
        id v19 = v3;
        __int16 v10 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to update cache provider properties for HLS as"
              "set. err=%{public}@";
        uint64_t v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        uint32_t v13 = 32;
LABEL_7:
        _os_log_impl(&dword_21BB87000, v11, v12, v10, (uint8_t *)&v14, v13);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 engineID];
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      __int16 v10 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Succeeded to update cache provider properties for HLS asset";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
      goto LABEL_7;
    }
  }
}

- (id)_hlsDownloadOptionsDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
  uint64_t v6 = [MEMORY[0x263F12178] standardUserDefaults];
  BOOL v7 = [v6 preferredMusicLowBandwidthResolution] > 0;

  uint64_t v8 = [NSNumber numberWithBool:v7];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263EF94F8]];

  uint64_t v9 = [MEMORY[0x263F12178] standardUserDefaults];
  if ([(MPCModelGenericAVItem *)self _prefersHighQualityContent]) {
    uint64_t v10 = [v9 preferredMusicHighBandwidthResolution];
  }
  else {
    uint64_t v10 = [v9 preferredMusicLowBandwidthResolution];
  }
  uint64_t v11 = v10;
  uint64_t v12 = [v4 preferredAudioAssetType];
  if ((unint64_t)(v12 - 4) < 2)
  {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EF9528]];
    uint32_t v13 = [NSNumber numberWithInteger:v11];
    int v14 = (void *)MEMORY[0x263EF9508];
    goto LABEL_9;
  }
  if (v12 == 3)
  {
    uint64_t v15 = *MEMORY[0x263EF9510];
    uint64_t v16 = MEMORY[0x263EFFA88];
    goto LABEL_11;
  }
  if (v12 == 2)
  {
    uint32_t v13 = [NSNumber numberWithInteger:1000 * v11];
    int v14 = (void *)MEMORY[0x263EF9518];
LABEL_9:
    [v5 setObject:v13 forKeyedSubscript:*v14];

    uint64_t v15 = *MEMORY[0x263EF9510];
    uint64_t v16 = MEMORY[0x263EFFA80];
LABEL_11:
    [v5 setObject:v16 forKeyedSubscript:v15];
    goto LABEL_12;
  }
  id v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [v4 preferredAudioAssetType];
    if ((unint64_t)(v20 - 1) > 4) {
      id v21 = @"Unspecified";
    }
    else {
      id v21 = off_2643BEBE8[v20 - 1];
    }
    int v22 = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    uint64_t v25 = v21;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: HLS] Attempting to cache asset of type %{public}@ using HLS caching logic", (uint8_t *)&v22, 0x16u);
  }

LABEL_12:
  uint64_t v17 = (void *)[v5 copy];

  return v17;
}

- (void)_getHLSServerDataForLoadResults:(id)a3 bag:(id)a4 keyCertificateURL:(id *)a5 keyServerURL:(id *)a6 keyServerAdamID:(id *)a7 keyServerProtocolType:(int64_t *)a8
{
  id v33 = a3;
  id v14 = a4;
  uint64_t v15 = [v14 enhancedAudioConfiguration];
  id v16 = [v33 keyServerProtocolType];
  id v17 = (id)*MEMORY[0x263F11C90];
  if (v16 == v17)
  {
  }
  else
  {
    __int16 v18 = v17;
    int v19 = [v16 isEqual:v17];

    if (!v19)
    {
      uint64_t v20 = [v14 urlForBagKey:*MEMORY[0x263F89060]];
      int64_t v21 = 0;
LABEL_12:
      *a5 = v20;
      goto LABEL_13;
    }
  }
  int v22 = [v15 certificateURL];

  if (v22)
  {
    uint64_t v20 = [v15 certificateURL];
LABEL_11:
    int64_t v21 = 1;
    goto LABEL_12;
  }
  uint64_t v23 = *MEMORY[0x263F89060];
  __int16 v24 = [v14 urlForBagKey:*MEMORY[0x263F89060]];

  if (v24)
  {
    uint64_t v20 = [v14 urlForBagKey:v23];
    goto LABEL_11;
  }
  uint64_t v25 = [v33 streamingKeyCertificateURL];

  if (v25)
  {
    uint64_t v20 = [v33 streamingKeyCertificateURL];
    goto LABEL_11;
  }
  int64_t v21 = 1;
LABEL_13:
  uint64_t v26 = [v33 streamingKeyServerURL];
  id v27 = v26;
  if (v26)
  {
    *a6 = v26;
  }
  else
  {
    uint64_t v28 = [v15 keyServerURL];
    uint64_t v29 = v28;
    if (v28)
    {
      *a6 = v28;
    }
    else
    {
      id v30 = [v14 urlForBagKey:*MEMORY[0x263F89068]];
      *a6 = v30;
    }
  }

  uint64_t v31 = [v33 streamingKeyAdamID];
  if ([v31 longLongValue]) {
    [v33 streamingKeyAdamID];
  }
  else {
    objc_msgSend(NSNumber, "numberWithLongLong:", -[MPCModelGenericAVItem _keyServerAdamID](self, "_keyServerAdamID"));
  }
  id v32 = objc_claimAutoreleasedReturnValue();
  *a7 = v32;

  *a8 = v21;
}

- (void)_downloadHLSAssetWhilePlaying:(id)a3 assetLoadProperties:(id)a4 assetLoadResult:(id)a5 destinationURL:(id)a6 sharedCacheURL:(id)a7 storeRequestContext:(id)a8 urlBag:(id)a9 fileUpgradeRecommendation:(int64_t)a10
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  int v22 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v23 = [v22 preferredMusicLowBandwidthResolution];

  __int16 v24 = [MEMORY[0x263F089D8] stringWithString:@"com.apple.MediaPlayer.MPCModelGenericAVItem.streaming_playback."];
  uint64_t v25 = v24;
  BOOL v26 = v23 > 0;
  if (v23 <= 0) {
    [v24 appendString:@"wifi."];
  }
  [v25 appendString:@"av"];
  id v27 = [MEMORY[0x263F893B8] sharedSessionManager];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __174__MPCModelGenericAVItem__downloadHLSAssetWhilePlaying_assetLoadProperties_assetLoadResult_destinationURL_sharedCacheURL_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke;
  v34[3] = &unk_2643BE618;
  id v28 = v25;
  id v35 = v28;
  BOOL v36 = v26;
  uint64_t v29 = [v27 sessionWithIdentifier:v28 creationBlock:v34];
  hlsDownloadURLSession = self->_hlsDownloadURLSession;
  self->_hlsDownloadURLSession = v29;

  if (self->_hlsDownloadURLSession)
  {
    uint64_t v31 = v33;
    [(MPCModelGenericAVItem *)self _downloadHLSAsset:v33 destinationURL:v18 sharedCacheURL:v19 assetLoadProperties:v16 loadResult:v17 storeRequestContext:v20 urlBag:v21 fileUpgradeRecommendation:a10];
  }
  else
  {
    id v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v31 = v33;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v38 = self;
      _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: HLS] Failed to create download url session for HLS asset", buf, 0xCu);
    }
  }
}

id __174__MPCModelGenericAVItem__downloadHLSAssetWhilePlaying_assetLoadProperties_assetLoadResult_destinationURL_sharedCacheURL_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08C00] backgroundSessionConfigurationWithIdentifier:*(void *)(a1 + 32)];
  [v2 setAllowsCellularAccess:*(unsigned __int8 *)(a1 + 40)];
  [v2 setDiscretionary:0];
  [v2 setHTTPCookieAcceptPolicy:1];
  [v2 setHTTPShouldSetCookies:0];
  [v2 setHTTPShouldUsePipelining:1];
  [v2 setRequestCachePolicy:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F89098]) initWithConfiguration:v2];

  return v3;
}

- (void)_prepareAssetForHLSPlayback:(id)a3 loadResult:(id)a4 destinationURL:(id)a5 storeRequestContext:(id)a6 urlBag:(id)a7 identityProperties:(id)a8 isStoreKeyServer:(BOOL)a9
{
  v99[3] = *MEMORY[0x263EF8340];
  id v89 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = [v14 source];
  uint64_t v19 = v18;
  v88 = v15;
  if (v15 || v18 == 1)
  {
    id v21 = [v14 assetURL];
    if ([v21 isFileURL])
    {
      id v22 = [v14 assetURL];
    }
    else
    {
      id v22 = v15;
    }
    uint64_t v23 = v22;

    if (v23)
    {
      id v24 = objc_alloc(MEMORY[0x263F89118]);
      uint64_t v25 = [v23 path];
      uint64_t v26 = [v24 initWithPath:v25];

      id v20 = (id)v26;
    }
    else
    {
      id v20 = objc_alloc_init(MEMORY[0x263F891B0]);
    }
  }
  else
  {
    id v20 = 0;
  }
  id v27 = [v14 keyServerProtocolType];
  id v28 = v27;
  if (v27 == (void *)*MEMORY[0x263F11C90]) {
    unsigned int v29 = 1;
  }
  else {
    unsigned int v29 = objc_msgSend(v27, "isEqual:");
  }

  id v30 = [v14 streamingKeyCertificateURL];
  uint64_t v31 = [v14 streamingKeyServerURL];
  id v32 = [v14 streamingKeyAdamID];
  v87 = v32;
  if (v31 && v30)
  {
    v86 = v17;
    uint64_t v33 = v29;
    id v34 = v32;
    id v84 = v20;
    id v85 = v16;
    if (![v32 longLongValue])
    {
      uint64_t v79 = v33;
      v80 = v31;
      v81 = v30;
      id v35 = [(MPCModelGenericAVItem *)self eventStream];
      BOOL v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [v35 engineID];
        *(_DWORD *)buf = 138543874;
        v92 = v37;
        __int16 v93 = 2114;
        v94 = self;
        __int16 v95 = 2114;
        *(void *)v96 = v14;
        _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Unexpected nil keyServerAdamID found in HLS loadResult: %{public}@", buf, 0x20u);
      }
      __int16 v38 = (void *)MEMORY[0x263F54EC8];
      uint64_t v39 = *MEMORY[0x263F54E80];
      id v40 = [(MPCModelGenericAVItem *)self description];
      v99[0] = v40;
      id v41 = [v14 description];
      v99[1] = v41;
      CGSize v42 = [v89 URL];
      id v43 = [v42 description];
      v99[2] = v43;
      id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:3];
      [v38 snapshotWithDomain:v39 type:@"Bug" subType:@"KeyServerBug" context:@"keyServerAdamID==nil" triggerThresholdValues:0 events:v44 completion:0];

      id v20 = v84;
      id v16 = v85;
      uint64_t v31 = v80;
      id v30 = v81;
      id v34 = v87;
      uint64_t v33 = v79;
    }
    id v45 = (ICContentKeySession *)[objc_alloc(MEMORY[0x263F890E8]) initWithRequestContext:v16 keyStore:v20 delegate:self];
    contentKeySession = self->_contentKeySession;
    self->_contentKeySession = v45;

    [(ICContentKeySession *)self->_contentKeySession setAdamID:v34];
    [(ICContentKeySession *)self->_contentKeySession setKeyServerURL:v31];
    [(ICContentKeySession *)self->_contentKeySession setKeyCertificateURL:v30];
    if (a9) {
      uint64_t v47 = v33;
    }
    else {
      uint64_t v47 = 0;
    }
    [(ICContentKeySession *)self->_contentKeySession setKeyServerProtocolType:v47];
    [(ICContentKeySession *)self->_contentKeySession setAllowFallbackToStreamingKeys:1];
    [(ICContentKeySession *)self->_contentKeySession setIsStoreKeyServer:a9];
    if (v19 != 1)
    {
      int IsWatch = MSVDeviceIsWatch();
      if (!v88 || !v33) {
        goto LABEL_48;
      }
      BOOL v83 = a9;
LABEL_40:
      if ((IsWatch & 1) == 0)
      {
        v82 = v30;
        v67 = [MEMORY[0x263F891D8] sharedController];
        __int16 v68 = [v86 DSID];
        id v90 = 0;
        v69 = objc_msgSend(v67, "getKeyStatusForAccountUniqueIdentifier:error:", objc_msgSend(v68, "longLongValue"), &v90);
        id v70 = v90;

        if (v70)
        {
          v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v70, "msv_description");
            uint64_t v72 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = self;
            __int16 v93 = 2114;
            v94 = v72;
            _os_log_impl(&dword_21BB87000, v71, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Failed to fetch FairPlayKeyStatus for offline key determination error=%{public}@", buf, 0x16u);
          }
        }
        if ([v69 hasOfflinePlaybackKeys] && v83)
        {
          [(ICContentKeySession *)self->_contentKeySession setRequestOfflineKeys:1];
        }
        else
        {
          v76 = [(MPCModelGenericAVItem *)self eventStream];
          v77 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            v78 = [v76 engineID];
            *(_DWORD *)buf = 138543618;
            v92 = v78;
            __int16 v93 = 2114;
            v94 = self;
            _os_log_impl(&dword_21BB87000, v77, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Not requesting offline keys because Fairplay does not have offline subscription keys", buf, 0x16u);
          }
        }
        id v30 = v82;
LABEL_54:

        [(ICContentKeySession *)self->_contentKeySession addAsset:v89 shouldPreloadKeys:1 waitForKeyIdentifiers:0];
        id v16 = v85;
        id v17 = v86;
        id v20 = v84;
        goto LABEL_55;
      }
LABEL_48:
      id v70 = [(MPCModelGenericAVItem *)self eventStream];
      v69 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v73 = [v70 engineID];
        uint64_t v74 = v33;
        v75 = (void *)v73;
        *(_DWORD *)buf = 138544386;
        v92 = (MPCModelGenericAVItem *)v73;
        __int16 v93 = 2114;
        v94 = self;
        __int16 v95 = 1024;
        *(_DWORD *)v96 = v88 != 0;
        *(_WORD *)&v96[4] = 2048;
        *(void *)&v96[6] = v74;
        __int16 v97 = 1024;
        int v98 = IsWatch ^ 1;
        _os_log_impl(&dword_21BB87000, v69, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Not requesting offline keys because its not supported. assetCanBeCached=%{BOOL}u, keyServerProtocolType=%ld, deviceSupportsOfflineHLS=%{BOOL}u", buf, 0x2Cu);
      }
      goto LABEL_54;
    }
    BOOL v83 = a9;
    id v48 = [v14 streamingKeyCertificateURL];
    uint64_t v49 = v30;
    BOOL v50 = v30;
    if (v30 != v48)
    {
      id v51 = v48;
      uint64_t v52 = v33;
      char v53 = [v30 isEqual:v48];

      if (v53)
      {
        uint64_t v33 = v52;
LABEL_38:

LABEL_39:
        int IsWatch = MSVDeviceIsWatch();
        if (!v33) {
          goto LABEL_48;
        }
        goto LABEL_40;
      }
      BOOL v62 = [MEMORY[0x263F89110] sharedMonitor];
      int v63 = [v62 isRemoteServerLikelyReachable];

      uint64_t v33 = v52;
      if (!v63) {
        goto LABEL_39;
      }
      id v64 = [(MPCModelGenericAVItem *)self eventStream];
      v65 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = [v64 engineID];
        *(_DWORD *)buf = 138543618;
        v92 = v66;
        __int16 v93 = 2114;
        v94 = self;
        _os_log_impl(&dword_21BB87000, v65, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Forcing a refresh of the hls keys due to a certificate mismatch", buf, 0x16u);

        uint64_t v33 = v52;
      }

      [(ICContentKeySession *)self->_contentKeySession setBypassCache:1];
      BOOL v50 = [(MPCModelGenericAVItem *)self mediaItem];
      uint64_t v49 = [v30 absoluteString];
      [v50 setValue:v49 forProperty:*MEMORY[0x263F112B8]];
    }

    id v51 = v50;
    goto LABEL_38;
  }
  id v54 = [(MPCModelGenericAVItem *)self eventStream];
  id v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v56 = [v54 engineID];
    id v57 = self;
    id v58 = v31;
    id v59 = v30;
    id v60 = (void *)v56;
    *(_DWORD *)buf = 138543618;
    v92 = (MPCModelGenericAVItem *)v56;
    __int16 v93 = 2114;
    v94 = v57;
    _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: HLS content without proper URLs: not setting-up a content key session", buf, 0x16u);

    id v30 = v59;
    uint64_t v31 = v58;
  }

LABEL_55:
}

- (BOOL)_isAssetLoadResultValidForPlayback:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 hasValidAsset])
  {
LABEL_12:
    BOOL v9 = 0;
    goto LABEL_13;
  }
  if ([v5 isHLSAsset])
  {
    if ([v5 audioAssetType] >= 2)
    {
      uint64_t v6 = [v5 streamingKeyServerURL];
      if (!v6
        || (BOOL v7 = (void *)v6,
            [v5 streamingKeyCertificateURL],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            v8,
            v7,
            !v8))
      {
        id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v11 = [v5 streamingKeyServerURL];

        if (!v11) {
          [v10 addObject:@"key server URL"];
        }
        uint64_t v12 = [v5 streamingKeyCertificateURL];

        if (!v12) {
          [v10 addObject:@"key certificate URL"];
        }
        uint32_t v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v19 = *MEMORY[0x263F08320];
        id v14 = NSString;
        id v15 = [v10 componentsJoinedByString:@" - "];
        id v16 = [v14 stringWithFormat:@"Missing key URLs: %@", v15];
        v20[0] = v16;
        id v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
        *a4 = [v13 errorWithDomain:@"MPCError" code:65 userInfo:v17];

        goto LABEL_12;
      }
    }
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (id)_decorateAssetLoadResult:(id)a3 withURLBag:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7 || ([v6 isHLSAsset] & 1) == 0 && objc_msgSend(v6, "audioAssetType") <= 1)
  {
    id v14 = v6;
    goto LABEL_32;
  }
  id v38 = 0;
  uint64_t v39 = 0;
  id v36 = 0;
  id v37 = 0;
  [(MPCModelGenericAVItem *)self _getHLSServerDataForLoadResults:v6 bag:v7 keyCertificateURL:&v38 keyServerURL:&v37 keyServerAdamID:&v36 keyServerProtocolType:&v39];
  id v8 = v38;
  BOOL v9 = v37;
  id v10 = v36;
  id v11 = [v6 streamingKeyCertificateURL];
  uint64_t v12 = v11;
  if (v11 == v8)
  {
  }
  else
  {
    int v13 = [v11 isEqual:v8];

    if (!v13) {
      goto LABEL_12;
    }
  }
  id v15 = [v6 streamingKeyServerURL];
  os_log_t v16 = v15;
  if (v15 == v9)
  {
  }
  else
  {
    char v17 = [v15 isEqual:v9];

    if ((v17 & 1) == 0)
    {

LABEL_12:
      goto LABEL_16;
    }
  }
  id v18 = [v6 streamingKeyAdamID];
  if (v18 == v10)
  {

LABEL_30:
    goto LABEL_31;
  }
  uint64_t v19 = v18;
  char v20 = [v18 isEqual:v10];

  if ((v20 & 1) == 0)
  {
LABEL_16:
    id v21 = [(MPCModelGenericAVItem *)self eventStream];
    id v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v21 engineID];
      *(_DWORD *)buf = 138543874;
      id v41 = v23;
      __int16 v42 = 2114;
      id v43 = self;
      __int16 v44 = 2114;
      id v45 = v6;
      _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Non-decorated asset load results for HLS playback: %{public}@", buf, 0x20u);
    }
    uint64_t v24 = [v6 streamingKeyCertificateURL];
    uint64_t v25 = (void *)v24;
    if (v24) {
      id v26 = (id)v24;
    }
    else {
      id v26 = v8;
    }
    [v6 setStreamingKeyCertificateURL:v26];

    uint64_t v27 = [v6 streamingKeyServerURL];
    id v28 = (void *)v27;
    if (v27) {
      id v29 = (id)v27;
    }
    else {
      id v29 = v9;
    }
    [v6 setStreamingKeyServerURL:v29];

    uint64_t v30 = [v6 streamingKeyAdamID];
    uint64_t v31 = (void *)v30;
    if (v30) {
      id v32 = (id)v30;
    }
    else {
      id v32 = v10;
    }
    [v6 setStreamingKeyAdamID:v32];

    uint64_t v12 = [(MPCModelGenericAVItem *)self eventStream];
    os_log_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [v12 engineID];
      *(_DWORD *)buf = 138543874;
      id v41 = v33;
      __int16 v42 = 2114;
      id v43 = self;
      __int16 v44 = 2114;
      id v45 = v6;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Decorated asset load results for HLS playback: %{public}@", buf, 0x20u);
    }
    goto LABEL_30;
  }
LABEL_31:
  id v34 = v6;

LABEL_32:

  return v6;
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  uint64_t v645 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F54ED0]);
  v614[0] = MEMORY[0x263EF8330];
  v614[1] = 3221225472;
  v614[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke;
  v614[3] = &unk_2643C55A8;
  id v9 = v7;
  id v615 = v9;
  v614[4] = self;
  id v10 = (void *)[v8 initWithDeallocHandler:v614];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2;
  aBlock[3] = &unk_2643BE410;
  id v11 = v6;
  id v611 = v11;
  id v12 = v10;
  id v612 = v12;
  id v13 = v9;
  id v613 = v13;
  id v14 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  id v15 = [(MPCModelGenericAVItem *)self eventStream];
  os_log_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    char v17 = [v15 engineID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Starting asset load...", buf, 0x16u);
  }
  v499 = +[MPCAVItemTrace traceIntervalWithName:@"MPTRACE_PLAYBACK_STORE_ITEM_ASSET_LOAD" item:self beginEvent:731643968 endEvent:731643972];
  id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_signpost_id_t spid = os_signpost_id_make_with_pointer(v18, self);

  uint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  char v20 = v19;
  unint64_t v495 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAsset", "", buf, 2u);
  }

  v500 = [MEMORY[0x263EFF9A0] dictionary];
  id v21 = +[MPCContentAgeRequirementManager sharedManager];
  char v22 = [v21 isItemAuthorized:self shouldAskForAuthorization:1];

  if (v22)
  {
    uint64_t v604 = 0;
    v605 = &v604;
    uint64_t v606 = 0x3032000000;
    v607 = __Block_byref_object_copy__767;
    v608 = __Block_byref_object_dispose__768;
    id v609 = 0;
    uint64_t v23 = [MEMORY[0x263EFF980] array];
    v601[0] = MEMORY[0x263EF8330];
    v601[1] = 3221225472;
    v601[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_82;
    v601[3] = &unk_2643C33C0;
    v603 = &v604;
    id v496 = v23;
    id v602 = v496;
    v493 = _Block_copy(v601);
    uint64_t v24 = [MEMORY[0x263F12178] standardUserDefaults];
    v498 = [v24 delayAssetLoadDuration];

    if (v498)
    {
      uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        [v498 doubleValue];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Delaying asset load: %g", buf, 0x16u);
      }

      [v498 doubleValue];
      usleep((v27 * 1000000.0));
    }
    v494 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet identityProperties];
    id v600 = 0;
    v497 = [(MPCModelGenericAVItem *)self _delegatedUserIdentityProperties:&v600];
    id v28 = v600;
    v488 = v28;
    if (v28)
    {
      [(MPCModelGenericAVItem *)self setItemError:v28];
      id v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [(MPCModelGenericAVItem *)self itemError];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Returning asset load early with error: %{public}@", buf, 0x16u);
      }
      goto LABEL_490;
    }
    BOOL v479 = [(MPCModelGenericAVItem *)self _allowsStreamingPlayback];
    uint64_t v599 = 0;
    long long v598 = 0u;
    long long v597 = 0u;
    long long v596 = 0u;
    long long v595 = 0u;
    [(MPCModelGenericAVItem *)self _timeoutValues];
    v487 = [(MPCModelGenericAVItem *)self _storeRequestContext];
    v484 = [(MPCModelGenericAVItem *)self _iTunesStorePurchasedMediaKind];
    v485 = [(MPCModelGenericAVItem *)self _loudnessInfoMediaKind];
    [(MPCModelGenericAVItem *)self _volumeAdjustment];
    int v34 = v33;
    BOOL v475 = self->_radioPlayback && self->_subscriptionRequired || v497;
    uint64_t v589 = 0;
    v590 = &v589;
    uint64_t v591 = 0x3032000000;
    v592 = __Block_byref_object_copy__767;
    v593 = __Block_byref_object_dispose__768;
    id v594 = 0;
    dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
    id v36 = [MEMORY[0x263F893A0] sharedBagProvider];
    v585[0] = MEMORY[0x263EF8330];
    v585[1] = 3221225472;
    v585[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_85;
    v585[3] = &unk_2643BE438;
    v585[4] = self;
    id v482 = v496;
    id v586 = v482;
    v588 = &v589;
    dispatch_semaphore_t dsema = v35;
    dispatch_semaphore_t v587 = dsema;
    [v36 getBagAndURLMetricsForRequestContext:v487 forceRefetch:0 withCompletionHandler:v585];

    dispatch_time_t v37 = dispatch_time(0, 1000000000 * v599);
    if (dispatch_semaphore_wait(dsema, v37))
    {
      id v38 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Timed out loading url bag");
      [v482 addObject:v38];

      uint64_t v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_ERROR, "[AL][Bag Loading] - %{public}@: loadAssetAndPlayerItem - Timed out loading url bag.", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v39 = [(MPCModelGenericAVItem *)self eventStream];
      id v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = [v39 engineID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Bag Loading] - %{public}@: loadAssetAndPlayerItem - Finished loading url bag.", buf, 0x16u);
      }
    }

    if (v14[2](v14, 1106))
    {
LABEL_489:

      _Block_object_dispose(&v589, 8);
LABEL_490:

      _Block_object_dispose(&v604, 8);
      goto LABEL_491;
    }
    uint64_t v579 = 0;
    v580 = &v579;
    uint64_t v581 = 0x3032000000;
    v582 = __Block_byref_object_copy__767;
    v583 = __Block_byref_object_dispose__768;
    id v584 = 0;
    uint64_t v573 = 0;
    v574 = &v573;
    uint64_t v575 = 0x3032000000;
    v576 = __Block_byref_object_copy__767;
    v577 = __Block_byref_object_dispose__768;
    id v578 = 0;
    v571[0] = 0;
    v571[1] = v571;
    v571[2] = 0x2020000000;
    char v572 = 0;
    uint64_t v565 = 0;
    v566 = &v565;
    uint64_t v567 = 0x3032000000;
    v568 = __Block_byref_object_copy__767;
    v569 = __Block_byref_object_dispose__768;
    id v570 = 0;
    v559[0] = MEMORY[0x263EF8330];
    v559[1] = 3221225472;
    v559[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_93;
    v559[3] = &unk_2643BE488;
    v559[5] = v571;
    v559[4] = self;
    uint64_t v564 = v599;
    long long v562 = v597;
    long long v563 = v598;
    long long v560 = v595;
    long long v561 = v596;
    v559[6] = &v565;
    v559[7] = &v579;
    v559[9] = spid;
    v559[8] = &v573;
    v478 = (void (**)(void))_Block_copy(v559);
    if (v14[2](v14, 1148))
    {
LABEL_488:

      _Block_object_dispose(&v565, 8);
      _Block_object_dispose(v571, 8);
      _Block_object_dispose(&v573, 8);

      _Block_object_dispose(&v579, 8);
      goto LABEL_489;
    }
    id v42 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v42 setMaxConcurrentOperationCount:1];
    [v42 setName:@"com.apple.MediaPlayer.MPCModelGenericAVItem.assetLoadOperationQueue"];
    [v42 setQualityOfService:25];
    [(MPCModelGenericAVItem *)self _assetLoadPropertiesWithUserIdentityProperties:v494 delegatedUserIdentityProperties:v497 subscriptionPlaybackInfo:v580[5]];
    v481 = v467 = v42;
    id v43 = [v481 storeAsset];
    uint64_t v465 = [v43 endpointType];

    __int16 v44 = [(MPCModelGenericAVItem *)self eventStream];
    id v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = [v44 engineID];
      if ([v481 prefersVideoContent]) {
        uint64_t v47 = @"video";
      }
      else {
        uint64_t v47 = @"audio";
      }
      unint64_t v48 = [v481 preferredAudioAssetType] - 1;
      if (v48 > 4) {
        uint64_t v49 = @"Unspecified";
      }
      else {
        uint64_t v49 = off_2643BEBE8[v48];
      }
      unint64_t v50 = [v481 HLSContentPolicy];
      if (v50 > 3) {
        id v51 = @"Unspecified";
      }
      else {
        id v51 = off_2643BEBC8[v50];
      }
      *(_DWORD *)buf = 138545155;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v635 = (uint64_t (*)(uint64_t, uint64_t))v47;
      *(_WORD *)v636 = 2113;
      *(void *)&v636[2] = v49;
      *(_WORD *)&v636[10] = 1024;
      *(_DWORD *)&v636[12] = v497 != 0;
      *(_WORD *)&v636[16] = 1024;
      *(_DWORD *)&v636[18] = v479;
      *(_WORD *)v637 = 2114;
      *(void *)&v637[2] = v51;
      LOWORD(v638) = 1024;
      *(_DWORD *)((char *)&v638 + 2) = v465;
      _os_log_impl(&dword_21BB87000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset is %{public}@ - Preferred audio: %{private}@, isDelegatedPlayback=%{BOOL}u, allowsStreamingPlayback=%{BOOL}u, HLSContentPolicy=%{public}@}, endpointType=%d", buf, 0x46u);
    }
    uint64_t v52 = [MPCAssetLoadPropertiesLocalFileEvaluator alloc];
    char v53 = [(MPCModelGenericAVItem *)self audioAssetTypeSelector];
    id v54 = [v53 playbackEngine];
    v468 = [(MPCAssetLoadPropertiesLocalFileEvaluator *)v52 initWithPlaybackEngine:v54];

    id v55 = [MEMORY[0x263F12178] standardUserDefaults];
    LODWORD(v54) = [v55 disableAssetCaching];
    uint64_t v56 = [MEMORY[0x263F12178] standardUserDefaults];
    v477 = [(MPCAssetLoadPropertiesLocalFileEvaluator *)v468 evaluateAssetLoadProperties:v481 allowingCachedAssets:v54 ^ 1 defaults:v56];

    if ([v477 status] == 1
      && (![v477 fileMatchesRequiredQuality] || objc_msgSend(v477, "recommendation") == 2))
    {
      *((void *)&v596 + 1) = 5;
      id v57 = [(MPCModelGenericAVItem *)self eventStream];
      id v58 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        id v59 = [(MPCModelGenericAVItemLocalFileLoadOperation *)v57 engineID];
        *(_DWORD *)buf = 138545666;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        v635 = (uint64_t (*)(uint64_t, uint64_t))*((void *)&v595 + 1);
        *(_WORD *)v636 = 2048;
        *(void *)&v636[2] = v595;
        *(_WORD *)&v636[10] = 2048;
        *(void *)&v636[12] = v596;
        *(_WORD *)&v636[20] = 2048;
        *(void *)v637 = *((void *)&v596 + 1);
        *(_WORD *)&v637[8] = 2048;
        uint64_t v638 = v597;
        __int16 v639 = 2048;
        uint64_t v640 = *((void *)&v597 + 1);
        __int16 v641 = 2048;
        uint64_t v642 = v598;
        __int16 v643 = 2048;
        uint64_t v644 = *((void *)&v598 + 1);
        _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@ - Overriding timeout values for cloud streaming [Bypassing local file and attempting streaming]: Local file=%lds - subscription lease session=%lds - home sharing=%lds - cloud streaming=%lds - cloud redownload=%lds - fairplay status=%lds - fairplay lease=%lds - suze lease=%lds", buf, 0x66u);
      }
      v469 = 0;
      int v60 = 1;
LABEL_66:

LABEL_67:
      if (v14[2](v14, 1235)) {
        goto LABEL_487;
      }
      if (v497 || (([v469 hasValidAsset] | !v479) & 1) != 0)
      {
LABEL_86:
        if (v14[2](v14, 1270)) {
          goto LABEL_487;
        }
        if (([v469 hasValidAsset] & 1) == 0
          && ([v481 isRadioPlayback] & v479) == 1)
        {
          v86 = _MPCLogCategoryAnalytics();
          v87 = v86;
          if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21BB87000, v87, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetAssetInfoCacheRequest", "", buf, 2u);
          }

          id v88 = objc_alloc_init(MEMORY[0x263F12268]);
          objc_msgSend(v88, "setAccountID:", objc_msgSend(v481, "accountID"));
          objc_msgSend(v88, "setDelegatedAccountID:", objc_msgSend(v481, "delegatedAccountID"));
          [v88 setRequestType:3];
          id v89 = [v481 itemIdentifiers];
          id v90 = [v89 universalStore];
          objc_msgSend(v88, "setStoreRadioAdamID:", objc_msgSend(v90, "adamID"));

          v91 = [MEMORY[0x263F12260] sharedCache];
          v92 = [v91 cachedResponseForRequest:v88];
          id v452 = v91;
          v454 = v92;
          if (v92)
          {
            id v550 = 0;
            __int16 v93 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v92 assetLoadProperties:v481 source:3 error:&v550];
            id v94 = v550;
            id v95 = v93;

            v92 = (uint64_t (*)(uint64_t, uint64_t))v95;
          }
          else
          {
            id v94 = 0;
          }
          v463 = v92;
          id obj = v94;
          if ([v92 hasValidAsset])
          {
            v450 = v463;

            (*((void (**)(void *, void))v493 + 2))(v493, 0);
            v96 = [(MPCModelGenericAVItem *)self eventStream];
            __int16 v97 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
            {
              int v98 = [v96 engineID];
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v98;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = self;
              *(_WORD *)&buf[22] = 2114;
              v635 = v454;
              _os_log_impl(&dword_21BB87000, v97, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using existing Radio cached playback response: %{public}@", buf, 0x20u);
            }
            v469 = v450;
          }
          else
          {
            v99 = [(MPCModelGenericAVItem *)self eventStream];
            v100 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
            {
              v101 = [v99 engineID];
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v101;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = self;
              _os_log_impl(&dword_21BB87000, v100, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: No cached Radio playback response found.", buf, 0x16u);
            }
            if (obj) {
              (*((void (**)(void))v493 + 2))();
            }
          }
          v102 = _MPCLogCategoryAnalytics();
          v103 = v102;
          if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v102))
          {
            int v104 = [(MPCModelGenericAVItem *)self isStartItem];
            *(_DWORD *)buf = 67240192;
            *(_DWORD *)&uint8_t buf[4] = v104;
            _os_signpost_emit_with_name_impl(&dword_21BB87000, v103, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetAssetInfoCacheRequest", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", buf, 8u);
          }
        }
        if (([v469 hasValidAsset] | !v479)) {
          goto LABEL_158;
        }
        v105 = [(MPCModelGenericAVItem *)self eventStream];
        v106 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          v107 = [v105 engineID];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v107;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = self;
          _os_log_impl(&dword_21BB87000, v106, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: No local file of appropriate quality, using cloud streaming.", buf, 0x16u);
        }
        if (v465 == 3 || v497 != 0)
        {
          v478[2]();
          v109 = [v481 storeAsset];
          int v110 = [v109 isSubscriptionRequired];

          int v111 = [(id)v580[5] hasPlaybackCapability];
          if ((v110 ^ 1 | v111))
          {
            v112 = _MPCLogCategoryAnalytics();
            v113 = v112;
            if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v113, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetSubscriptionAssetLoadOperation", "", buf, 2u);
            }

            v114 = objc_alloc_init(MPCModelGenericAVItemSubscriptionAssetLoadOperation);
            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setAssetLoadProperties:v481];
            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setRequestContext:v487];
            unsigned int v115 = (v111 | v110) & ~[(id)v580[5] shouldUseAccountLessStreaming];
            if (v115) {
              uint64_t v116 = 1;
            }
            else {
              uint64_t v116 = 2;
            }
            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setOperationType:v116];
            if (v115) {
              [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setSubscriptionLeaseSession:v566[5]];
            }
            dispatch_semaphore_t v117 = dispatch_semaphore_create(0);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v635 = __Block_byref_object_copy__767;
            *(void *)v636 = __Block_byref_object_dispose__768;
            *(void *)&v636[8] = 0;
            *(void *)v631 = 0;
            *(void *)&v631[8] = v631;
            *(void *)&v631[16] = 0x3032000000;
            v632 = __Block_byref_object_copy__767;
            *(void *)&long long v633 = __Block_byref_object_dispose__768;
            *((void *)&v633 + 1) = 0;
            v546[0] = MEMORY[0x263EF8330];
            v546[1] = 3221225472;
            v546[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_128;
            v546[3] = &unk_2643BE4D8;
            v549 = v631;
            v548 = buf;
            v546[4] = self;
            v118 = v117;
            v547 = v118;
            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setResponseHandler:v546];
            [v467 addOperation:v114];
            dispatch_time_t v119 = dispatch_time(0, 1000000000 * *((void *)&v596 + 1));
            if (dispatch_semaphore_wait(v118, v119))
            {
              [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 cancel];
              v120 = _MPCLogCategoryPlayback();
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v625 = 138543618;
                *(void *)&v625[4] = self;
                *(_WORD *)&v625[12] = 2048;
                *(void *)&v625[14] = *((void *)&v596 + 1);
                _os_log_impl(&dword_21BB87000, v120, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load subscription asset [request aborted after %lds].", v625, 0x16u);
              }

              v121 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Timed out while attempting to load subscription asset");
              (*((void (**)(void *, void *))v493 + 2))(v493, v121);

              if (v60) {
                [v467 setMaxConcurrentOperationCount:2];
              }
            }
            else
            {
              id v137 = *(id *)(*(void *)&buf[8] + 40);

              (*((void (**)(void *, void))v493 + 2))(v493, *(void *)(*(void *)&v631[8] + 40));
              v469 = v137;
            }
            v138 = _MPCLogCategoryAnalytics();
            v139 = v138;
            if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v138))
            {
              int v140 = [(MPCModelGenericAVItem *)self isStartItem];
              *(_DWORD *)v625 = 67240192;
              *(_DWORD *)&v625[4] = v140;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v139, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetSubscriptionAssetLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v625, 8u);
            }

            _Block_object_dispose(v631, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_157;
          }
          if (v574[5])
          {
            (*((void (**)(void))v493 + 2))();
            _MPCLogCategoryPlayback();
            v114 = (MPCModelGenericAVItemSubscriptionAssetLoadOperation *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v114->super.super.super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = self;
              v129 = "[AL] - %{public}@: Subscription is required, and we failed to load the subscription status.";
LABEL_145:
              p_super = &v114->super.super.super;
              uint32_t v131 = 12;
              goto LABEL_146;
            }
          }
          else
          {
            v132 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 17, @"Missing subscription for playback");
            (*((void (**)(void *, void *))v493 + 2))(v493, v132);

            _MPCLogCategoryPlayback();
            v114 = (MPCModelGenericAVItemSubscriptionAssetLoadOperation *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v114->super.super.super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = self;
              v129 = "[AL] - %{public}@: Subscription is required, and the user does not have subscription playback capab"
                     "ility, setting error to subscription required.";
              goto LABEL_145;
            }
          }
        }
        else
        {
          if ((unint64_t)(v465 - 1) <= 1)
          {
            v122 = _MPCLogCategoryAnalytics();
            v123 = v122;
            if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v123, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetMediaRedownloadOperation", "", buf, 2u);
            }

            v114 = objc_alloc_init(MPCModelGenericAVItemMediaRedownloadOperation);
            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setAssetLoadProperties:v481];
            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setRequestContext:v487];
            dispatch_semaphore_t v124 = dispatch_semaphore_create(0);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v635 = __Block_byref_object_copy__767;
            *(void *)v636 = __Block_byref_object_dispose__768;
            *(void *)&v636[8] = 0;
            *(void *)v631 = 0;
            *(void *)&v631[8] = v631;
            *(void *)&v631[16] = 0x3032000000;
            v632 = __Block_byref_object_copy__767;
            *(void *)&long long v633 = __Block_byref_object_dispose__768;
            *((void *)&v633 + 1) = 0;
            v542[0] = MEMORY[0x263EF8330];
            v542[1] = 3221225472;
            v542[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_134;
            v542[3] = &unk_2643BE4D8;
            v545 = v631;
            v544 = buf;
            v542[4] = self;
            v125 = v124;
            v543 = v125;
            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 setResponseHandler:v542];
            [v467 addOperation:v114];
            dispatch_time_t v126 = dispatch_time(0, 1000000000 * v597);
            if (dispatch_semaphore_wait(v125, v126))
            {
              [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v114 cancel];
              v127 = _MPCLogCategoryPlayback();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v625 = 138543618;
                *(void *)&v625[4] = self;
                *(_WORD *)&v625[12] = 2048;
                *(void *)&v625[14] = v597;
                _os_log_impl(&dword_21BB87000, v127, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load media redownload asset [request aborted after %lds].", v625, 0x16u);
              }

              v128 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Timed out while attempting to load media redownload asset");
              (*((void (**)(void *, void *))v493 + 2))(v493, v128);
            }
            else
            {
              id v133 = *(id *)(*(void *)&buf[8] + 40);

              (*((void (**)(void *, void))v493 + 2))(v493, *(void *)(*(void *)&v631[8] + 40));
              v469 = v133;
            }
            v134 = _MPCLogCategoryAnalytics();
            v135 = v134;
            if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
            {
              int v136 = [(MPCModelGenericAVItem *)self isStartItem];
              *(_DWORD *)v625 = 67240192;
              *(_DWORD *)&v625[4] = v136;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v135, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetMediaRedownloadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v625, 8u);
            }

            _Block_object_dispose(v631, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_157;
          }
          _MPCLogCategoryPlayback();
          v114 = (MPCModelGenericAVItemSubscriptionAssetLoadOperation *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v114->super.super.super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v465;
            v129 = "[AL] - %{public}@: No valid endpoint type (%ld), skipping streaming redownload.";
            p_super = &v114->super.super.super;
            uint32_t v131 = 22;
LABEL_146:
            _os_log_impl(&dword_21BB87000, p_super, OS_LOG_TYPE_ERROR, v129, buf, v131);
          }
        }
LABEL_157:

LABEL_158:
        if ((v14[2](v14, 1408) & 1) == 0)
        {
          if ([v469 hasValidAsset])
          {
            id v141 = v469;
          }
          else
          {
            v142 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = self;
              _os_log_impl(&dword_21BB87000, v142, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Attempting to load lower quality local file", buf, 0xCu);
            }

            v143 = _MPCLogCategoryAnalytics();
            v144 = v143;
            if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v143))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v144, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLowQualityFileLoadOperation", "", buf, 2u);
            }

            v145 = [[MPCModelGenericAVItemLocalFileLoadOperation alloc] initWithEvaluation:v477 properties:v481];
            [(MPCModelGenericAVItemLocalFileLoadOperation *)v145 setRequirePreferredAssetQuality:0];
            dispatch_semaphore_t v146 = dispatch_semaphore_create(0);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v635 = __Block_byref_object_copy__767;
            *(void *)v636 = __Block_byref_object_dispose__768;
            *(void *)&v636[8] = 0;
            *(void *)v631 = 0;
            *(void *)&v631[8] = v631;
            *(void *)&v631[16] = 0x3032000000;
            v632 = __Block_byref_object_copy__767;
            *(void *)&long long v633 = __Block_byref_object_dispose__768;
            *((void *)&v633 + 1) = 0;
            v538[0] = MEMORY[0x263EF8330];
            v538[1] = 3221225472;
            v538[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_138;
            v538[3] = &unk_2643BE4B0;
            v540 = buf;
            v541 = v631;
            v147 = v146;
            v539 = v147;
            [(MPCModelGenericAVItemLocalFileLoadOperation *)v145 setResponseHandler:v538];
            [v467 addOperation:v145];
            dispatch_time_t v148 = dispatch_time(0, 1000000000 * *((void *)&v595 + 1));
            if (dispatch_semaphore_wait(v147, v148))
            {
              [(MPAsyncOperation *)v145 cancel];
              v149 = _MPCLogCategoryPlayback();
              if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v625 = 138543618;
                *(void *)&v625[4] = self;
                *(_WORD *)&v625[12] = 2048;
                *(void *)&v625[14] = *((void *)&v595 + 1);
                _os_log_impl(&dword_21BB87000, v149, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load low quality local file [request aborted after %lds].", v625, 0x16u);
              }

              if (!v605[5])
              {
                v150 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Timed out while attempting to load low quality local file");
                (*((void (**)(void *, void *))v493 + 2))(v493, v150);
              }
              id v141 = v469;
            }
            else
            {
              id v141 = *(id *)(*(void *)&buf[8] + 40);

              if (([v141 hasValidAsset] & 1) == 0 && !v605[5]) {
                (*((void (**)(void *, void))v493 + 2))(v493, *(void *)(*(void *)&v631[8] + 40));
              }
            }
            v151 = _MPCLogCategoryAnalytics();
            v152 = v151;
            if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v151))
            {
              int v153 = [(MPCModelGenericAVItem *)self isStartItem];
              *(_DWORD *)v625 = 67240192;
              *(_DWORD *)&v625[4] = v153;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v152, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLowQualityFileLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v625, 8u);
            }

            _Block_object_dispose(v631, 8);
            _Block_object_dispose(buf, 8);
          }
          if (v14[2](v14, 1444))
          {
            v469 = v141;
            goto LABEL_487;
          }
          v469 = [(MPCModelGenericAVItem *)self _decorateAssetLoadResult:v141 withURLBag:v590[5]];

          id v537 = 0;
          BOOL v154 = [(MPCModelGenericAVItem *)self _isAssetLoadResultValidForPlayback:v469 error:&v537];
          id v155 = v537;
          v156 = v155;
          if (!v154)
          {
            if (v155) {
              (*((void (**)(void *, id))v493 + 2))(v493, v155);
            }

            goto LABEL_459;
          }
          v157 = [(MPCModelGenericAVItem *)self eventStream];
          v451 = v156;
          v158 = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
          {
            v159 = [v157 engineID];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v159;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2114;
            v635 = (uint64_t (*)(uint64_t, uint64_t))v469;
            _os_log_impl(&dword_21BB87000, v158, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Ready to process asset load result: %{public}@", buf, 0x20u);
          }
          int v160 = [v469 isHLSAsset];
          v161 = @"CRABS";
          if (v160) {
            v161 = @"HLS";
          }
          v453 = v161;
          if (v475)
          {
            int v162 = 1;
          }
          else
          {
            BOOL v163 = [v469 assetProtectionType] == 2 || v465 == 3;
            int v162 = v163;
          }
          BOOL v448 = v162;
          id v480 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          char IsAudioAccessory = MSVDeviceIsAudioAccessory();
          if ((v465 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
            char v165 = IsAudioAccessory;
          }
          else {
            char v165 = 1;
          }
          if ((v165 & 1) == 0) {
            [v480 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFA240]];
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v635 = __Block_byref_object_copy__767;
          *(void *)v636 = __Block_byref_object_dispose__768;
          *(void *)&v636[8] = [v469 purchaseBundleDictionary];
          uint64_t v166 = *(void *)(*(void *)&buf[8] + 40);
          if (v166) {
            [v480 setObject:v166 forKey:*MEMORY[0x263EFA298]];
          }
          uint64_t v167 = [v469 protectedContentSupportStorageFileURL];
          if (v167) {
            [v480 setObject:v167 forKey:*MEMORY[0x263EFA290]];
          }
          v449 = (void *)v167;
          int v464 = [v469 isHLSAsset];
          self->_hlsAsset = v464;
          int v445 = [v469 isCloudStreamingAsset];
          if (!v445)
          {
            if (!*(void *)(*(void *)&buf[8] + 40))
            {
LABEL_226:
              v476 = 0;
              goto LABEL_262;
            }
LABEL_222:
            char v180 = [v469 isHomeSharingAsset];
            if (v497) {
              char v181 = 1;
            }
            else {
              char v181 = v180;
            }
            if (v181) {
              goto LABEL_226;
            }
            if (v465 == 1)
            {
              v187 = [v481 itemIdentifiers];
              v188 = [v187 universalStore];
              uint64_t v189 = [v188 purchasedAdamID];

              if (v189)
              {
                v185 = [NSNumber numberWithLongLong:v189];
                v186 = @"purchaseHistory";
LABEL_233:
                if (v185)
                {
                  v476 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:6];
                  [v476 setObject:v185 forKey:*MEMORY[0x263EFA2E8]];
                  [v476 setObject:v186 forKey:*MEMORY[0x263EFA300]];
                  v190 = [v481 storeAsset];
                  v191 = [v190 redownloadParameters];

                  if (v191) {
                    [v476 setObject:v191 forKey:*MEMORY[0x263EFA2D8]];
                  }
                  if (v484) {
                    [v476 setObject:v484 forKey:*MEMORY[0x263EFA2F8]];
                  }
                  v192 = [v487 userAgent];
                  if (v192) {
                    [v476 setObject:v192 forKey:*MEMORY[0x263EFA308]];
                  }
                  v193 = [v481 storeAsset];
                  uint64_t v194 = [v193 accountIdentifier];

                  if (v194) {
                    [NSNumber numberWithUnsignedLongLong:v194];
                  }
                  else {
                  id v195 = [v494 DSID];
                  }

                  if (v195) {
                    [v476 setObject:v195 forKey:*MEMORY[0x263EFA2D0]];
                  }

                  goto LABEL_248;
                }
LABEL_243:
                v476 = 0;
LABEL_248:
                if (v464)
                {
                  v196 = [v469 alternateHLSPlaylistURL];
                  v197 = v196;
                  if (v196)
                  {
                    id v198 = v196;
                  }
                  else
                  {
                    id v198 = [v469 assetURL];
                  }
                  v199 = [v198 absoluteString];
                  if ([v199 length])
                  {
                    v200 = v476;
                    if (!v476) {
                      v200 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
                    }
                    v476 = v200;
                    [v200 setObject:v199 forKey:*MEMORY[0x263EFA2E0]];
                  }
                }
                if (v476)
                {
                  v201 = [(MPCModelGenericAVItem *)self eventStream];
                  v202 = _MPCLogCategoryPlayback();
                  if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
                  {
                    v203 = [v201 engineID];
                    *(_DWORD *)v631 = 138543874;
                    *(void *)&v631[4] = v203;
                    *(_WORD *)&v631[12] = 2114;
                    *(void *)&v631[14] = self;
                    *(_WORD *)&v631[22] = 2114;
                    v632 = (uint64_t (*)(uint64_t, uint64_t))v476;
                    _os_log_impl(&dword_21BB87000, v202, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using iTunes Store Content Info: %{public}@", v631, 0x20u);
                  }
                  [v480 setObject:v476 forKey:*MEMORY[0x263EFA2F0]];
                }

LABEL_262:
                if (v464) {
                  goto LABEL_288;
                }
                v204 = [(MPCModelGenericAVItem *)self eventStream];
                v205 = _MPCLogCategoryPlayback();
                if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
                {
                  v206 = [v204 engineID];
                  *(_DWORD *)v631 = 138543618;
                  *(void *)&v631[4] = v206;
                  *(_WORD *)&v631[12] = 2114;
                  *(void *)&v631[14] = self;
                  _os_log_impl(&dword_21BB87000, v205, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Non HLS Asset - Reloading playback keys if required", v631, 0x16u);
                }
                if (self->_radioPlayback && !self->_subscriptionRequired)
                {
                  v219 = [(MPCModelGenericAVItem *)self eventStream];
                  v220 = _MPCLogCategoryPlayback();
                  if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
                  {
                    v222 = [v219 engineID];
                    *(_DWORD *)v631 = 138543618;
                    *(void *)&v631[4] = v222;
                    *(_WORD *)&v631[12] = 2114;
                    *(void *)&v631[14] = self;
                    _os_log_impl(&dword_21BB87000, v220, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Radio station does not require a subscription, skipping subscription key check.", v631, 0x16u);
                  }
                }
                else
                {
                  uint64_t v207 = [v469 assetProtectionType];
                  if (v207 == 2)
                  {
                    if (v448)
                    {
                      v478[2]();
                      if (v566[5])
                      {
                        v208 = [(MPCModelGenericAVItem *)self eventStream];
                        v209 = _MPCLogCategoryPlayback();
                        if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                        {
                          v210 = [v208 engineID];
                          *(_DWORD *)v631 = 138543618;
                          *(void *)&v631[4] = v210;
                          *(_WORD *)&v631[12] = 2114;
                          *(void *)&v631[14] = self;
                          _os_log_impl(&dword_21BB87000, v209, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Reloading FairPlay key status to ensure the latest value is known...", v631, 0x16u);
                        }
                        v211 = _MPCLogCategoryAnalytics();
                        v212 = v211;
                        if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v211))
                        {
                          uint64_t v213 = [(__CFString *)v453 UTF8String];
                          *(_DWORD *)v631 = 136446210;
                          *(void *)&v631[4] = v213;
                          _os_signpost_emit_with_name_impl(&dword_21BB87000, v212, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLoadFairPlayKeyStatus", "contentType=%{public, signpost.telemetry:string1, name=contentType}s", v631, 0xCu);
                        }

                        *(void *)v631 = 0;
                        *(void *)&v631[8] = v631;
                        *(void *)&v631[16] = 0x3032000000;
                        v632 = __Block_byref_object_copy__767;
                        *(void *)&long long v633 = __Block_byref_object_dispose__768;
                        *((void *)&v633 + 1) = 0;
                        dispatch_semaphore_t v214 = dispatch_semaphore_create(0);
                        v215 = (void *)v566[5];
                        v534[0] = MEMORY[0x263EF8330];
                        v534[1] = 3221225472;
                        v534[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_163;
                        v534[3] = &unk_2643BE500;
                        v534[4] = self;
                        v536 = v631;
                        v216 = v214;
                        v535 = v216;
                        [v215 reloadFairPlayKeyStatusWithCompletionHandler:v534];
                        dispatch_time_t v217 = dispatch_time(0, 1000000000 * *((void *)&v597 + 1));
                        obja = v216;
                        if (dispatch_semaphore_wait(v216, v217))
                        {
                          v218 = _MPCLogCategoryPlayback();
                          if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v625 = 138543618;
                            *(void *)&v625[4] = self;
                            *(_WORD *)&v625[12] = 2048;
                            *(void *)&v625[14] = *((void *)&v597 + 1);
                            _os_log_impl(&dword_21BB87000, v218, OS_LOG_TYPE_ERROR, "[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Timed out reloading FairPlay key status; using the last known status [request aborted after %lds].",
                              v625,
                              0x16u);
                          }

                          id v471 = [(id)v566[5] leaseStatus];
                        }
                        else
                        {
                          id v471 = *(id *)(*(void *)&v631[8] + 40);
                        }
                        v406 = _MPCLogCategoryAnalytics();
                        v407 = v406;
                        if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v406))
                        {
                          int v408 = [(MPCModelGenericAVItem *)self isStartItem];
                          *(_DWORD *)v625 = 67240192;
                          *(_DWORD *)&v625[4] = v408;
                          _os_signpost_emit_with_name_impl(&dword_21BB87000, v407, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLoadFairPlayKeyStatus", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v625, 8u);
                        }

                        v409 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v471, "hasOnlinePlaybackKeys"));
                        [v500 setObject:v409 forKeyedSubscript:@"item-asset-has-online-keys"];

                        v410 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v471, "hasOfflinePlaybackKeys"));
                        [v500 setObject:v410 forKeyedSubscript:@"item-asset-has-offline-keys"];

                        if (([v471 hasOnlinePlaybackKeys] & 1) != 0
                          || ([v469 onlineSubscriptionKeysRequired] & 1) == 0
                          && [v471 hasOfflinePlaybackKeys])
                        {
                          v411 = [(MPCModelGenericAVItem *)self eventStream];
                          v412 = _MPCLogCategoryPlayback();
                          if (os_log_type_enabled(v412, OS_LOG_TYPE_DEFAULT))
                          {
                            v413 = [v411 engineID];
                            *(_DWORD *)v625 = 138543874;
                            *(void *)&v625[4] = v413;
                            *(_WORD *)&v625[12] = 2114;
                            *(void *)&v625[14] = self;
                            *(_WORD *)&v625[22] = 2114;
                            v626 = (uint64_t (*)(uint64_t, uint64_t))v471;
                            _os_log_impl(&dword_21BB87000, v412, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Already have playback keys from lease status: %{public}@, no need to do another request.", v625, 0x20u);
                          }
                          int v414 = 1;
                        }
                        else
                        {
                          if ([v469 onlineSubscriptionKeysRequired])
                          {
                            v415 = [(MPCModelGenericAVItem *)self eventStream];
                            v416 = _MPCLogCategoryPlayback();
                            if (os_log_type_enabled(v416, OS_LOG_TYPE_DEFAULT))
                            {
                              v417 = [v415 engineID];
                              *(_DWORD *)v625 = 138543618;
                              *(void *)&v625[4] = v417;
                              *(_WORD *)&v625[12] = 2114;
                              *(void *)&v625[14] = self;
                              _os_log_impl(&dword_21BB87000, v416, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Requesting playback keys because the asset requires online keys", v625, 0x16u);
                            }
                          }
                          else
                          {
                            v415 = [(MPCModelGenericAVItem *)self eventStream];
                            v416 = _MPCLogCategoryPlayback();
                            if (os_log_type_enabled(v416, OS_LOG_TYPE_DEFAULT))
                            {
                              v418 = [v415 engineID];
                              *(_DWORD *)v625 = 138543874;
                              *(void *)&v625[4] = v418;
                              *(_WORD *)&v625[12] = 2114;
                              *(void *)&v625[14] = self;
                              *(_WORD *)&v625[22] = 2114;
                              v626 = (uint64_t (*)(uint64_t, uint64_t))v471;
                              _os_log_impl(&dword_21BB87000, v416, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Requesting playback keys because the lease status indicates none available: %{public}@", v625, 0x20u);
                            }
                          }

                          dispatch_semaphore_t v419 = dispatch_semaphore_create(0);
                          id v420 = objc_alloc(MEMORY[0x263F891E8]);
                          v421 = [(id)v566[5] requestContext];
                          v412 = [v420 initWithRequestContext:v421];

                          v422 = _MPCLogCategoryAnalytics();
                          v423 = v422;
                          if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v422))
                          {
                            uint64_t v424 = [(__CFString *)v453 UTF8String];
                            *(_DWORD *)v625 = 136446210;
                            *(void *)&v625[4] = v424;
                            _os_signpost_emit_with_name_impl(&dword_21BB87000, v423, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLeaseSessionPlaybackRequest", "contentType=%{public, signpost.telemetry:string1, name=contentType}s", v625, 0xCu);
                          }

                          *(void *)v625 = 0;
                          *(void *)&v625[8] = v625;
                          *(void *)&v625[16] = 0x3032000000;
                          v626 = __Block_byref_object_copy__767;
                          v627 = __Block_byref_object_dispose__768;
                          id v628 = 0;
                          v425 = (void *)v566[5];
                          v531[0] = MEMORY[0x263EF8330];
                          v531[1] = 3221225472;
                          v531[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_166;
                          v531[3] = &unk_2643BE528;
                          v531[4] = self;
                          v533 = v625;
                          v411 = v419;
                          v532 = v411;
                          id v426 = (id)[v425 performPlaybackRequest:v412 completionHandler:v531];
                          dispatch_time_t v427 = dispatch_time(0, 1000000000 * v598);
                          if (dispatch_semaphore_wait(v411, v427))
                          {
                            v428 = [(MPCModelGenericAVItem *)self eventStream];
                            v429 = _MPCLogCategoryPlayback();
                            if (os_log_type_enabled(v429, OS_LOG_TYPE_DEFAULT))
                            {
                              v430 = [v428 engineID];
                              *(_DWORD *)v619 = 138543874;
                              v620 = v430;
                              __int16 v621 = 2114;
                              v622 = self;
                              __int16 v623 = 2048;
                              id v624 = (id)v598;
                              _os_log_impl(&dword_21BB87000, v429, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Timed out while attempting to acquire lease for playback keys [request aborted after %lds].", v619, 0x20u);
                            }
                            uint64_t v431 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Subscription lease request timed out");
                            v432 = *(void **)(*(void *)&v625[8] + 40);
                            *(void *)(*(void *)&v625[8] + 40) = v431;
                          }
                          v433 = _MPCLogCategoryAnalytics();
                          v434 = v433;
                          if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v433))
                          {
                            int v435 = [(MPCModelGenericAVItem *)self isStartItem];
                            *(_DWORD *)v619 = 67240192;
                            LODWORD(v620) = v435;
                            _os_signpost_emit_with_name_impl(&dword_21BB87000, v434, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLeaseSessionPlaybackRequest", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v619, 8u);
                          }

                          if (*(void *)(*(void *)&v625[8] + 40))
                          {
                            (*((void (**)(void))v493 + 2))();
                            int v414 = 0;
                          }
                          else
                          {
                            int v414 = 1;
                          }

                          _Block_object_dispose(v625, 8);
                        }

                        _Block_object_dispose(v631, 8);
                        if (!v414)
                        {
                          int v226 = 2;
                          int v225 = 1;
LABEL_457:

                          _Block_object_dispose(buf, 8);
                          if ((v226 | 2) != 2) {
                            goto LABEL_487;
                          }
                          if (!v225)
                          {
LABEL_477:
                            if ([v12 disarm])
                            {
                              uint64_t v390 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F12368]);
                              v391 = [(MPCModelGenericAVItem *)self itemError];
                              (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, v390, v391);
                            }
                            v392 = [(MPCModelGenericAVItem *)self itemError];
                            uint64_t v393 = objc_msgSend(v392, "msv_analyticSignature");
                            v394 = (void *)v393;
                            v395 = @"OK";
                            if (v393) {
                              v395 = (__CFString *)v393;
                            }
                            v396 = v395;

                            v397 = _MPCLogCategoryAnalytics();
                            v398 = v397;
                            if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v397))
                            {
                              id v399 = [(MPCModelGenericAVItem *)self analyticsContentType];
                              uint64_t v400 = [v399 UTF8String];
                              uint64_t v401 = [(__CFString *)v396 UTF8String];
                              int v402 = [(MPCModelGenericAVItem *)self isStartItem];
                              *(_DWORD *)buf = 136446722;
                              *(void *)&uint8_t buf[4] = v400;
                              *(_WORD *)&buf[12] = 2082;
                              *(void *)&buf[14] = v401;
                              *(_WORD *)&buf[22] = 1026;
                              LODWORD(v635) = v402;
                              _os_signpost_emit_with_name_impl(&dword_21BB87000, v398, OS_SIGNPOST_INTERVAL_END, spid, "LoadAsset", " enableTelemetry=YES contentType=%{public, signpost.telemetry:string1, name=contentType}s result=%{public, signpost.telemetry:string2, name=result}s isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", buf, 0x1Cu);
                            }
                            [v499 endInterval];
                            v403 = [(MPCModelGenericAVItem *)self eventStream];
                            v404 = _MPCLogCategoryPlayback();
                            if (os_log_type_enabled(v404, OS_LOG_TYPE_DEFAULT))
                            {
                              v405 = [v403 engineID];
                              *(_DWORD *)buf = 138543618;
                              *(void *)&uint8_t buf[4] = v405;
                              *(_WORD *)&buf[12] = 2114;
                              *(void *)&buf[14] = self;
                              _os_log_impl(&dword_21BB87000, v404, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset load finished.", buf, 0x16u);
                            }
                            goto LABEL_487;
                          }
LABEL_459:
                          v370 = (uint64_t (*)(uint64_t, uint64_t))(id)v605[5];
                          if (v370)
                          {
                            v371 = v370;
                            v372 = [(MPCModelGenericAVItem *)self eventStream];
                            v373 = _MPCLogCategoryPlayback();
                            if (os_log_type_enabled(v373, OS_LOG_TYPE_ERROR))
                            {
                              v374 = [v372 engineID];
                              *(_DWORD *)buf = 138543874;
                              *(void *)&uint8_t buf[4] = v374;
                              *(_WORD *)&buf[12] = 2114;
                              *(void *)&buf[14] = self;
                              *(_WORD *)&buf[22] = 2114;
                              v635 = v371;
                              _os_log_impl(&dword_21BB87000, v373, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Asset loading failed with error: %{public}@", buf, 0x20u);
                            }
                            v375 = v371;
                            uint64_t v376 = *MEMORY[0x263F08608];
                            v491 = v375;
                            do
                            {
                              v377 = [v375 userInfo];
                              v378 = [v377 objectForKey:@"MPCErrorUserInfoKeyStoreDialogDictionary"];

                              v379 = [v375 userInfo];
                              v380 = [v379 objectForKey:v376];

                              if (!v380) {
                                break;
                              }
                              v375 = v380;
                            }
                            while (!v378);

                            uint64_t v381 = (uint64_t)v491;
                            if ([v378 count])
                            {
                              v382 = [v491 userInfo];
                              id v383 = (id)[v382 mutableCopy];

                              if (!v383) {
                                id v383 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                              }
                              [v383 setObject:v378 forKey:*MEMORY[0x263F11180]];
                              v384 = (void *)MEMORY[0x263F087E8];
                              v385 = [v491 domain];
                              uint64_t v381 = objc_msgSend(v384, "errorWithDomain:code:userInfo:", v385, objc_msgSend(v491, "code"), v383);
                            }
                            [(MPCModelGenericAVItem *)self setItemError:v381];
                            long long v504 = 0u;
                            long long v505 = 0u;
                            long long v502 = 0u;
                            long long v503 = 0u;
                            id v386 = v482;
                            uint64_t v387 = [v386 countByEnumeratingWithState:&v502 objects:v616 count:16];
                            v492 = (void *)v381;
                            if (v387)
                            {
                              uint64_t v388 = *(void *)v503;
                              do
                              {
                                for (uint64_t i = 0; i != v387; ++i)
                                {
                                  if (*(void *)v503 != v388) {
                                    objc_enumerationMutation(v386);
                                  }
                                  [(MPCModelGenericAVItem *)self addAdjunctError:*(void *)(*((void *)&v502 + 1) + 8 * i)];
                                }
                                uint64_t v387 = [v386 countByEnumeratingWithState:&v502 objects:v616 count:16];
                              }
                              while (v387);
                            }
                          }
                          goto LABEL_477;
                        }
LABEL_288:
                        if (v14[2](v14, 1709))
                        {
                          int v225 = 0;
                          int v226 = 1;
                          goto LABEL_457;
                        }
                        if ([v469 hasValidAsset]
                          && ([v469 isDownloadedAsset] & 1) == 0)
                        {
                          v227 = [MEMORY[0x263F12178] standardUserDefaults];
                          v228 = [v227 rewrittenAssetInfo];

                          if (v228)
                          {
                            v229 = [v228 objectForKeyedSubscript:@"assetType"];
                            uint64_t v230 = [v469 audioAssetType];
                            if (v230 == [v229 integerValue])
                            {
                              v472 = [v228 objectForKeyedSubscript:@"assetURL"];
                              id objb = [v228 objectForKeyedSubscript:@"keyCertURL"];
                              v455 = [v228 objectForKeyedSubscript:@"keyServerURL"];
                              v231 = [v228 objectForKeyedSubscript:@"isStoreKeyServer"];
                              char v439 = [v231 BOOLValue];

                              v232 = [(MPCModelGenericAVItem *)self eventStream];
                              v233 = _MPCLogCategoryPlayback();
                              if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
                              {
                                v234 = [v232 engineID];
                                *(_DWORD *)v631 = 138544130;
                                *(void *)&v631[4] = v234;
                                *(_WORD *)&v631[12] = 2114;
                                *(void *)&v631[14] = self;
                                *(_WORD *)&v631[22] = 2114;
                                v632 = (uint64_t (*)(uint64_t, uint64_t))v469;
                                LOWORD(v633) = 2114;
                                *(void *)((char *)&v633 + 2) = v228;
                                _os_log_impl(&dword_21BB87000, v233, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Original asset %{public}@ is rewritten by defaults with %{public}@", v631, 0x2Au);
                              }
                              if (v472)
                              {
                                v235 = [NSURL URLWithString:v472];
                                [v469 setAssetURL:v235];
                              }
                              if (objb)
                              {
                                v236 = [NSURL URLWithString:objb];
                                [v469 setStreamingKeyCertificateURL:v236];
                              }
                              if (v455)
                              {
                                v237 = [NSURL URLWithString:v455];
                                [v469 setStreamingKeyServerURL:v237];
                              }
                            }
                            else
                            {
                              char v439 = 1;
                            }
                          }
                          else
                          {
                            char v439 = 1;
                          }
                        }
                        else
                        {
                          char v439 = 1;
                        }
                        v483 = [v469 assetURL];
                        v473 = (void *)[v469 assetQualityType];
                        v438 = (void *)[v469 assetProtectionType];
                        if (v497)
                        {
                          BOOL v238 = 0;
                          int v239 = 0;
                        }
                        else
                        {
                          if ([v469 allowsAssetCaching]
                            && ([v483 isFileURL] & 1) == 0
                            && ([v477 recommendation] == 1 || objc_msgSend(v477, "recommendation") == 3))
                          {
                            v284 = [v481 assetCacheProvider];
                            int v239 = [v284 isUnderDailyCacheAssetDownloadLimit];

                            if ((v239 & v464) == 1)
                            {
                              v285 = [MEMORY[0x263F12178] standardUserDefaults];
                              int v286 = [v285 disableHLSAssetCaching];

                              int v239 = v286 ^ 1;
                            }
                          }
                          else
                          {
                            int v239 = 0;
                          }
                          if (([v483 isFileURL] & 1) != 0 || objc_msgSend(v477, "recommendation") != 2)
                          {
                            BOOL v238 = 0;
                          }
                          else
                          {
                            v240 = [v481 assetCacheProvider];
                            BOOL v238 = v240 != 0;
                          }
                        }
                        int v441 = v239;
                        if ((v239 & 1) != 0 || v238)
                        {
                          v241 = [MEMORY[0x263F08C38] UUID];
                          v242 = [v241 UUIDString];
                          v243 = [v242 lowercaseString];

                          v244 = [v481 assetCacheProvider];
                          id v530 = 0;
                          id v529 = 0;
                          v245 = [v469 assetPathExtension];
                          [v244 getPlaybackAssetDestinationURL:&v530 sharedCacheURL:0 purgeable:!v238 purchaseBundleDestinationURL:&v529 assetQualityType:v473 fileName:v243 pathExtension:v245];
                          v456 = (uint64_t (*)(uint64_t, uint64_t))v530;
                          id v444 = v529;

                          if (!v456)
                          {
                            v436 = [MEMORY[0x263F08690] currentHandler];
                            [v436 handleFailureInMethod:a2 object:self file:@"MPCModelGenericAVItem.m" lineNumber:1778 description:@"Asset download destination URL can't be nil"];
                          }
                          objc_msgSend(v480, "setObject:forKey:");
                        }
                        else
                        {
                          if (([v483 isFileURL] & 1) == 0 && (objc_msgSend(v469, "isHLSAsset") & 1) == 0) {
                            [v480 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFA2C8]];
                          }
                          v456 = 0;
                          id v444 = 0;
                        }
                        v246 = [MEMORY[0x263F12178] standardUserDefaults];
                        uint64_t v247 = [v246 preferredMusicLowBandwidthResolution];
                        BOOL v442 = v247 > 0;

                        char v248 = [v483 isFileURL];
                        if (v247 > 0) {
                          char v249 = 1;
                        }
                        else {
                          char v249 = v248;
                        }
                        if ((v249 & 1) == 0) {
                          [v480 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263EFA1D0]];
                        }
                        id v490 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                        v250 = [(MPCModelGenericAVItem *)self _rtcReportingServiceIdentifierWithAssetURL:v483];
                        if (v250)
                        {
                          objc_storeStrong((id *)&self->_rtcReportingServiceIdentifier, v250);
                          [v490 setObject:v250 forKey:*MEMORY[0x263EFA200]];
                        }
                        v443 = v250;
                        v447 = [(MPCModelGenericAVItem *)self _rtcReportingMediaIdentifierWithAssetLoadProperties:v481];
                        [v490 setObject:v447 forKey:*MEMORY[0x263EFA1F0]];
                        [v490 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFA208]];
                        v251 = [v481 storefrontID];
                        BOOL v252 = v251 == 0;

                        if (!v252)
                        {
                          v253 = [v481 storefrontID];
                          [v490 setObject:v253 forKey:@"StorefrontID"];
                        }
                        [v480 setObject:v490 forKey:*MEMORY[0x263EFA1F8]];
                        [v480 setObject:&unk_26CC18C18 forKeyedSubscript:*MEMORY[0x263EFA2B8]];
                        objc = [MEMORY[0x263EFA8D0] URLAssetWithURL:v483 options:v480];
                        v254 = [(MPCModelGenericAVItem *)self eventStream];
                        v255 = _MPCLogCategoryPlayback();
                        if (os_log_type_enabled(v255, OS_LOG_TYPE_DEFAULT))
                        {
                          v256 = [v254 engineID];
                          *(_DWORD *)v631 = 138544130;
                          *(void *)&v631[4] = v256;
                          *(_WORD *)&v631[12] = 2114;
                          *(void *)&v631[14] = self;
                          *(_WORD *)&v631[22] = 2114;
                          v632 = objc;
                          LOWORD(v633) = 2114;
                          *(void *)((char *)&v633 + 2) = v480;
                          _os_log_impl(&dword_21BB87000, v255, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: AVURLAsset %{public}@ - options: %{public}@", v631, 0x2Au);
                        }
                        if (!objc) {
                          goto LABEL_456;
                        }
                        v257 = +[MPCPlaybackPerformanceController sharedController];
                        [v257 markCDNConnectionWarmed];

                        if (([v483 isFileURL] & 1) == 0)
                        {
                          v258 = (void *)v590[5];
                          if (v258) {
                            objc_msgSend(objc, "setIsExternalContent:", objc_msgSend(v258, "isTrustedHostForURL:", v483) ^ 1);
                          }
                        }
                        if ([v469 isHLSAsset])
                        {
                          if (![v469 isHLSAsset]) {
                            goto LABEL_389;
                          }
                          LOBYTE(v437) = v439;
                          [(MPCModelGenericAVItem *)self _prepareAssetForHLSPlayback:objc loadResult:v469 destinationURL:v456 storeRequestContext:v487 urlBag:v590[5] identityProperties:v494 isStoreKeyServer:v437];
                          if (v441)
                          {
                            if (!v456) {
                              goto LABEL_389;
                            }
                          }
                          else
                          {
                            if (v456) {
                              BOOL v287 = v238;
                            }
                            else {
                              BOOL v287 = 0;
                            }
                            if (!v287) {
                              goto LABEL_389;
                            }
                          }
                          v288 = [(MPCModelGenericAVItem *)self eventStream];
                          v289 = _MPCLogCategoryPlayback();
                          if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
                          {
                            v290 = [v288 engineID];
                            *(_DWORD *)v631 = 138543874;
                            *(void *)&v631[4] = v290;
                            *(_WORD *)&v631[12] = 2114;
                            *(void *)&v631[14] = self;
                            *(_WORD *)&v631[22] = 2114;
                            v632 = v456;
                            _os_log_impl(&dword_21BB87000, v289, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Initiating download to destination file %{public}@", v631, 0x20u);
                          }
                          v291 = _MPCLogCategoryAnalytics();
                          v292 = v291;
                          if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v291))
                          {
                            *(_WORD *)v631 = 0;
                            _os_signpost_emit_with_name_impl(&dword_21BB87000, v292, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetHLSAssetDownload", "", v631, 2u);
                          }

                          -[MPCModelGenericAVItem _downloadHLSAssetWhilePlaying:assetLoadProperties:assetLoadResult:destinationURL:sharedCacheURL:storeRequestContext:urlBag:fileUpgradeRecommendation:](self, "_downloadHLSAssetWhilePlaying:assetLoadProperties:assetLoadResult:destinationURL:sharedCacheURL:storeRequestContext:urlBag:fileUpgradeRecommendation:", objc, v481, v469, v456, 0, v487, v590[5], [v477 recommendation]);
                          v293 = _MPCLogCategoryAnalytics();
                          v294 = v293;
                          if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v293))
                          {
                            int v295 = [(MPCModelGenericAVItem *)self isStartItem];
                            *(_DWORD *)v631 = 67240192;
                            *(_DWORD *)&v631[4] = v295;
                            _os_signpost_emit_with_name_impl(&dword_21BB87000, v294, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetHLSAssetDownload", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v631, 8u);
                          }
                        }
                        else
                        {
                          v259 = [(MPCModelGenericAVItem *)self eventStream];
                          v260 = _MPCLogCategoryPlayback();
                          if (os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
                          {
                            v261 = [v259 engineID];
                            *(_DWORD *)v631 = 138543618;
                            *(void *)&v631[4] = v261;
                            *(_WORD *)&v631[12] = 2114;
                            *(void *)&v631[14] = self;
                            _os_log_impl(&dword_21BB87000, v260, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Initiating full online key retrieval [Non HLS Asset]", v631, 0x16u);
                          }
                          uint64_t v262 = [v480 objectForKey:*MEMORY[0x263EFA298]];
                          v263 = *(void **)(*(void *)&buf[8] + 40);
                          *(void *)(*(void *)&buf[8] + 40) = v262;

                          *(void *)v631 = 0;
                          *(void *)&v631[8] = v631;
                          *(void *)&v631[16] = 0x3032000000;
                          v632 = __Block_byref_object_copy__767;
                          *(void *)&long long v633 = __Block_byref_object_dispose__768;
                          *((void *)&v633 + 1) = 0;
                          *(void *)v625 = 0;
                          *(void *)&v625[8] = v625;
                          *(void *)&v625[16] = 0x3032000000;
                          v626 = __Block_byref_object_copy__767;
                          v627 = __Block_byref_object_dispose__768;
                          id v628 = 0;
                          int v440 = [v469 onlineSubscriptionKeysRequired];
                          v264 = [(MPCModelGenericAVItem *)self eventStream];
                          v265 = _MPCLogCategoryPlayback_Oversize();
                          if (os_log_type_enabled(v265, OS_LOG_TYPE_DEFAULT))
                          {
                            v266 = [v264 engineID];
                            MPCPlaybackEngineEventPayloadJSONFromPayload(*(void **)(*(void *)&buf[8] + 40));
                            id v267 = (id)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v619 = 138543874;
                            v620 = v266;
                            __int16 v621 = 2114;
                            v622 = self;
                            __int16 v623 = 2114;
                            id v624 = v267;
                            _os_log_impl(&dword_21BB87000, v265, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using purchase bundle: %{public}@", v619, 0x20u);
                          }
                          if (v456) {
                            dispatch_group_t v268 = dispatch_group_create();
                          }
                          else {
                            dispatch_group_t v268 = 0;
                          }
                          v269 = v456;
                          if (v440)
                          {
                            v270 = [(MPCModelGenericAVItem *)self eventStream];
                            v271 = _MPCLogCategoryPlayback();
                            if (os_log_type_enabled(v271, OS_LOG_TYPE_DEFAULT))
                            {
                              v272 = [v270 engineID];
                              *(_DWORD *)v619 = 138543618;
                              v620 = v272;
                              __int16 v621 = 2114;
                              v622 = self;
                              _os_log_impl(&dword_21BB87000, v271, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Attempting to load full subscription asset [first asset requires online keys]", v619, 0x16u);
                            }
                            [v481 setFollowUp:1];
                            v273 = objc_alloc_init(MPCModelGenericAVItemSubscriptionAssetLoadOperation);
                            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v273 setAssetLoadProperties:v481];
                            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v273 setRequestContext:v487];
                            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v273 setOperationType:1];
                            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v273 setSubscriptionLeaseSession:v566[5]];
                            v524[0] = MEMORY[0x263EF8330];
                            v524[1] = 3221225472;
                            v524[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_207;
                            v524[3] = &unk_2643BE550;
                            v527 = v625;
                            v526 = v631;
                            v524[4] = self;
                            BOOL v528 = v456 != 0;
                            v274 = v268;
                            v525 = v274;
                            [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v273 setResponseHandler:v524];
                            if (v456) {
                              dispatch_group_enter(v274);
                            }
                            [v467 addOperation:v273];

                            v269 = v456;
                          }
                          BOOL v163 = v269 == 0;
                          int v275 = v441;
                          if (v163) {
                            int v275 = 0;
                          }
                          if (v275 == 1)
                          {
                            v276 = _MPCLogCategoryPlayback();
                            if (os_log_type_enabled(v276, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v619 = 138543362;
                              v620 = self;
                              _os_log_impl(&dword_21BB87000, v276, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching: CRABS] Initiating caching", v619, 0xCu);
                            }

                            v277 = _MPCLogCategoryAnalytics();
                            v278 = v277;
                            if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v277))
                            {
                              *(_WORD *)v619 = 0;
                              _os_signpost_emit_with_name_impl(&dword_21BB87000, v278, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetCRABSAssetDownload", "", v619, 2u);
                            }

                            v279 = [objc downloadDestinationURL];
                            objc_initWeak((id *)v619, self);
                            v511[0] = MEMORY[0x263EF8330];
                            v511[1] = 3221225472;
                            v511[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_211;
                            v511[3] = &unk_2643BE5C8;
                            objc_copyWeak(v522, (id *)v619);
                            id v512 = v481;
                            id v280 = v279;
                            id v513 = v280;
                            v514 = v456;
                            id v515 = 0;
                            char v523 = v440;
                            id v516 = v444;
                            v517 = v268;
                            v519 = v625;
                            v520 = v631;
                            id v518 = v483;
                            v521 = buf;
                            v522[1] = v473;
                            v522[2] = v438;
                            objc_msgSend(objc, "mpc_addDownloadCompletionHandler:", v511);
                            v281 = _MPCLogCategoryAnalytics();
                            v282 = v281;
                            if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v281))
                            {
                              int v283 = [(MPCModelGenericAVItem *)self isStartItem];
                              *(_DWORD *)v617 = 67240192;
                              int v618 = v283;
                              _os_signpost_emit_with_name_impl(&dword_21BB87000, v282, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetCRABSAssetDownload", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v617, 8u);
                            }

                            objc_destroyWeak(v522);
                            objc_destroyWeak((id *)v619);
                          }
                          _Block_object_dispose(v625, 8);

                          _Block_object_dispose(v631, 8);
                        }
LABEL_389:
                        v296 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F12360]);
                        objc_storeStrong(v296, objc);
                        v297 = _MPCLogCategoryAnalytics();
                        v298 = v297;
                        if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v297))
                        {
                          uint64_t v299 = [(__CFString *)v453 UTF8String];
                          *(_DWORD *)v631 = 136446210;
                          *(void *)&v631[4] = v299;
                          _os_signpost_emit_with_name_impl(&dword_21BB87000, v298, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetCreateAVPlayerItem", "contentType=%{public, signpost.telemetry:string1, name=contentType}s", v631, 0xCu);
                        }

                        v474 = [MEMORY[0x263EFA800] playerItemWithAsset:*v296];
                        LODWORD(v300) = v34;
                        [v474 setVolumeAdjustment:v300];
                        if (v485) {
                          [v474 setMediaKind:v485];
                        }
                        [v474 setAudioTimePitchAlgorithm:*MEMORY[0x263EF95E0]];
                        if (v445 && ([v481 prefersVideoContent] & 1) == 0) {
                          [v474 setPlaybackLikelyToKeepUpTrigger:1];
                        }
                        if (v464)
                        {
                          v301 = [MEMORY[0x263F89110] sharedMonitor];
                          [v301 registerObserver:self];

                          v302 = [MEMORY[0x263F08A00] defaultCenter];
                          v303 = [MEMORY[0x263F12178] standardUserDefaults];
                          [v302 addObserver:self selector:sel__allowsHighQualityMusicStreamingOnCellularDidChangeNotification_ name:*MEMORY[0x263F11C40] object:v303];

                          if ([v481 prefersVideoContent]) {
                            uint64_t v304 = 2;
                          }
                          else {
                            uint64_t v304 = 1;
                          }
                          [(MPCModelGenericAVItem *)self _applyPreferredPeakBitRateToPlayerItem:v474 withItemType:v304];
                        }
                        if ([v481 prefersVideoContent]
                          && [v469 isHLSAsset])
                        {
                          [v474 setAllowedAudioSpatializationFormats:7];
                        }
                        int v305 = [(MPCModelGenericAVItem *)self isStartItem];
                        v306 = @"FollowingItem";
                        if (v305) {
                          v306 = @"StartItem";
                        }
                        v307 = v306;
                        v308 = [(MPCModelGenericAVItem *)self isSiriInitiated];
                        int v309 = [v308 BOOLValue];

                        if (v309)
                        {
                          uint64_t v310 = [(__CFString *)v307 stringByAppendingString:@"-Siri"];

                          id v311 = (id)v310;
                        }
                        else
                        {
                          id v311 = v307;
                        }
                        v446 = v311;
                        objc_msgSend(v474, "setReportingCategory:");
                        [(MPCModelGenericAVItem *)self setPlayerItem:v474];
                        v312 = [v469 willBecomeActivePlayerItemHandler];
                        id firstBecomeActivePlayerItemBlock = self->_firstBecomeActivePlayerItemBlock;
                        self->_id firstBecomeActivePlayerItemBlock = v312;

                        v314 = [v469 alternateHLSKeyCertificateURL];
                        v315 = v314;
                        if (!v314)
                        {
                          v315 = [v469 streamingKeyCertificateURL];
                        }
                        objc_storeStrong((id *)&self->_streamingKeyCertificateURL, v315);
                        if (!v314) {

                        }
                        v316 = [v469 alternateHLSKeyServerURL];
                        v317 = v316;
                        if (!v316)
                        {
                          v317 = [v469 streamingKeyServerURL];
                        }
                        objc_storeStrong((id *)&self->_streamingKeyServerURL, v317);
                        if (!v316) {

                        }
                        self->_BOOL isiTunesStoreStream = [v469 isiTunesStoreStream];
                        v318 = [v481 audioAssetTypeSelection];
                        preferredAudioAssetTypeSelection = self->_preferredAudioAssetTypeSelection;
                        self->_preferredAudioAssetTypeSelection = v318;

                        self->_preferredAudioAssetType = [v481 preferredAudioAssetType];
                        self->_loadedAudioAssetType = [v469 audioAssetType];
                        self->_downloadedAsset = [v469 isDownloadedAsset];
                        if (v476) {
                          BOOL v320 = 1;
                        }
                        else {
                          BOOL v320 = [(MPCModelGenericAVItem *)self isHLSAsset];
                        }
                        self->_allowsAirPlayFromCloud = v320;
                        self->_BOOL isMusicCellularStreamingAllowed = v442;
                        self->_isSubscriptionPolicyContent = v448;
                        v321 = [NSNumber numberWithInteger:v465];
                        [v500 setObject:v321 forKeyedSubscript:@"item-asset-endpoint-type"];

                        v322 = [NSNumber numberWithBool:v497 != 0];
                        [v500 setObject:v322 forKeyedSubscript:@"item-asset-is-delegated-playback"];

                        v323 = [NSNumber numberWithBool:v448];
                        [v500 setObject:v323 forKeyedSubscript:@"item-asset-is-subscription-content"];

                        v324 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v469, "source"));
                        [v500 setObject:v324 forKeyedSubscript:@"item-asset-source"];

                        v325 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v469, "assetProtectionType"));
                        [v500 setObject:v325 forKeyedSubscript:@"item-asset-protection-type"];

                        [v500 setObject:v483 forKeyedSubscript:@"item-asset-url"];
                        v326 = [v469 assetURL];
                        int v327 = [v326 isFileURL];

                        if (v327)
                        {
                          v328 = NSNumber;
                          if ([v469 isDownloadedAsset]) {
                            uint64_t v329 = 3;
                          }
                          else {
                            uint64_t v329 = 1;
                          }
                          v330 = [v328 numberWithInteger:v329];
                          [v500 setObject:v330 forKeyedSubscript:@"item-asset-location"];

                          id v331 = [v469 assetURL];
                          v332 = [MEMORY[0x263F08850] defaultManager];
                          v333 = [v331 path];
                          v334 = [v332 attributesOfItemAtPath:v333 error:0];

                          v335 = [v334 fileModificationDate];
                          v336 = v335;
                          if (v335)
                          {
                            id v337 = v335;
                          }
                          else
                          {
                            id v337 = [v334 fileCreationDate];
                          }
                          if (v337)
                          {
                            v338 = NSNumber;
                            [v337 timeIntervalSinceNow];
                            v340 = [v338 numberWithDouble:-v339];
                            [v500 setObject:v340 forKeyedSubscript:@"item-asset-cache-age"];
                          }
                        }
                        else
                        {
                          [v500 setObject:&unk_26CC18C30 forKeyedSubscript:@"item-asset-location"];
                        }
                        v341 = objc_msgSend(v474, "mpc_playerItemIdentifier");
                        [v500 setObject:v341 forKeyedSubscript:@"player-item-identifier"];

                        v342 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v469, "audioAssetType"));
                        [v500 setObject:v342 forKeyedSubscript:@"item-asset-type"];

                        v343 = +[MPCPlaybackPerformanceController sharedController];
                        v344 = [v343 experimentID];
                        [v500 setObject:v344 forKeyedSubscript:@"experiment-id"];

                        v345 = [v343 treatmentID];
                        [v500 setObject:v345 forKeyedSubscript:@"experiment-treatment-id"];

                        v346 = [v343 deploymentID];
                        [v500 setObject:v346 forKeyedSubscript:@"experiment-deployment-id"];

                        [(MPCModelGenericAVItem *)self _emitAudioAssetTypeSelection:self->_preferredAudioAssetTypeSelection assetLoadInfo:v500];
                        v347 = _MPCLogCategoryAnalytics();
                        v348 = v347;
                        if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v347))
                        {
                          int v349 = [(MPCModelGenericAVItem *)self isStartItem];
                          *(_DWORD *)v631 = 67240192;
                          *(_DWORD *)&v631[4] = v349;
                          _os_signpost_emit_with_name_impl(&dword_21BB87000, v348, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetCreateAVPlayerItem", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v631, 8u);
                        }

                        v350 = [v469 suzeLeaseID];
                        if (!v350) {
                          goto LABEL_455;
                        }
                        v351 = [(MPCModelGenericAVItem *)self eventStream];
                        v352 = _MPCLogCategoryPlayback();
                        if (os_log_type_enabled(v352, OS_LOG_TYPE_DEFAULT))
                        {
                          v353 = [v351 engineID];
                          *(_DWORD *)v631 = 138543618;
                          *(void *)&v631[4] = v353;
                          *(_WORD *)&v631[12] = 2114;
                          *(void *)&v631[14] = self;
                          _os_log_impl(&dword_21BB87000, v352, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Starting Suze lease session...", v631, 0x16u);
                        }
                        v354 = _MPCLogCategoryAnalytics();
                        v355 = v354;
                        if (v495 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v354))
                        {
                          *(_WORD *)v631 = 0;
                          _os_signpost_emit_with_name_impl(&dword_21BB87000, v355, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetSuzeLeaseSession", "", v631, 2u);
                        }

                        *(void *)v631 = 0;
                        *(void *)&v631[8] = v631;
                        *(void *)&v631[16] = 0x3032000000;
                        v632 = __Block_byref_object_copy__767;
                        *(void *)&long long v633 = __Block_byref_object_dispose__768;
                        *((void *)&v633 + 1) = 0;
                        *(void *)v625 = 0;
                        *(void *)&v625[8] = v625;
                        *(void *)&v625[16] = 0x3032000000;
                        v626 = __Block_byref_object_copy__767;
                        v627 = __Block_byref_object_dispose__768;
                        id v628 = 0;
                        dispatch_semaphore_t v356 = dispatch_semaphore_create(0);
                        v466 = objc_msgSend(objc_alloc(MEMORY[0x263F89388]), "initWithRequestContext:leaseID:mediaType:", v487, v350, -[MPCModelGenericAVItem _suzeLeaseMediaType](self, "_suzeLeaseMediaType"));
                        v357 = +[MPCSuzeLeaseSessionController sharedController];
                        v507[0] = MEMORY[0x263EF8330];
                        v507[1] = 3221225472;
                        v507[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_255;
                        v507[3] = &unk_2643BE5F0;
                        v510 = v631;
                        v509 = v625;
                        v507[4] = self;
                        v358 = v356;
                        v508 = v358;
                        [v357 startLeaseSessionWithConfiguration:v466 completion:v507];
                        dispatch_time_t v359 = dispatch_time(0, 1000000000 * *((void *)&v598 + 1));
                        if (dispatch_semaphore_wait(v358, v359))
                        {
                          v360 = _MPCLogCategoryPlayback();
                          if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
                          {
                            v361 = *(MPCModelGenericAVItem **)(*(void *)&v631[8] + 40);
                            *(_DWORD *)v619 = 138543874;
                            v620 = self;
                            __int16 v621 = 2114;
                            v622 = v361;
                            __int16 v623 = 2048;
                            id v624 = (id)*((void *)&v598 + 1);
                            _os_log_impl(&dword_21BB87000, v360, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out creating Suze lease session: %{public}@ [request aborted after %lds].", v619, 0x20u);
                          }
                        }
                        else
                        {
                          v362 = *(void **)(*(void *)&v625[8] + 40);
                          if (v362)
                          {
                            objc_storeStrong((id *)&self->_suzeLeaseSession, v362);
                            v363 = [MEMORY[0x263F08A00] defaultCenter];
                            [v363 addObserver:self selector:sel__suzeLeaseSessionRenewDidFailNotification_ name:@"MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification" object:v357];

                            v364 = MEMORY[0x263EF83A0];
                            id v365 = MEMORY[0x263EF83A0];
                            block[0] = MEMORY[0x263EF8330];
                            block[1] = 3221225472;
                            block[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_259;
                            block[3] = &unk_2643C5FC8;
                            void block[4] = self;
                            dispatch_async(v364, block);

                            goto LABEL_451;
                          }
                          v360 = _MPCLogCategoryPlayback();
                          if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
                          {
                            v366 = *(MPCModelGenericAVItem **)(*(void *)&v631[8] + 40);
                            *(_DWORD *)v619 = 138543618;
                            v620 = self;
                            __int16 v621 = 2114;
                            v622 = v366;
                            _os_log_impl(&dword_21BB87000, v360, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Failed to create suze lease with error: %{public}@.", v619, 0x16u);
                          }
                        }

LABEL_451:
                        v367 = _MPCLogCategoryAnalytics();
                        v368 = v367;
                        if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v367))
                        {
                          int v369 = [(MPCModelGenericAVItem *)self isStartItem];
                          *(_DWORD *)v619 = 67240192;
                          LODWORD(v620) = v369;
                          _os_signpost_emit_with_name_impl(&dword_21BB87000, v368, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetSuzeLeaseSession", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v619, 8u);
                        }

                        _Block_object_dispose(v625, 8);
                        _Block_object_dispose(v631, 8);

LABEL_455:
LABEL_456:

                        int v225 = 0;
                        int v226 = 0;
                        goto LABEL_457;
                      }
                      v219 = [(MPCModelGenericAVItem *)self eventStream];
                      v220 = _MPCLogCategoryPlayback();
                      if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
                      {
                        v224 = [v219 engineID];
                        *(_DWORD *)v631 = 138543618;
                        *(void *)&v631[4] = v224;
                        *(_WORD *)&v631[12] = 2114;
                        *(void *)&v631[14] = self;
                        _os_log_impl(&dword_21BB87000, v220, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Lease session invalid, skipping key loading.", v631, 0x16u);
                      }
                    }
                    else
                    {
                      v219 = [(MPCModelGenericAVItem *)self eventStream];
                      v220 = _MPCLogCategoryPlayback();
                      if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
                      {
                        v223 = [v219 engineID];
                        *(_DWORD *)v631 = 138543618;
                        *(void *)&v631[4] = v223;
                        *(_WORD *)&v631[12] = 2114;
                        *(void *)&v631[14] = self;
                        _os_log_impl(&dword_21BB87000, v220, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Not subscription content, skipping playback key check.", v631, 0x16u);
                      }
                    }
                  }
                  else
                  {
                    v219 = [(MPCModelGenericAVItem *)self eventStream];
                    v220 = _MPCLogCategoryPlayback();
                    if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
                    {
                      v221 = [v219 engineID];
                      *(_DWORD *)v631 = 138543874;
                      *(void *)&v631[4] = v221;
                      *(_WORD *)&v631[12] = 2114;
                      *(void *)&v631[14] = self;
                      *(_WORD *)&v631[22] = 2048;
                      v632 = (uint64_t (*)(uint64_t, uint64_t))v207;
                      _os_log_impl(&dword_21BB87000, v220, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Protection type is %li, skipping subscription key check.", v631, 0x20u);
                    }
                  }
                }

                goto LABEL_288;
              }
            }
            else if (v465 == 2)
            {
              v182 = [v481 itemIdentifiers];
              v183 = [v182 personalizedStore];
              uint64_t v184 = [v183 cloudID];

              if (v184)
              {
                v185 = [NSNumber numberWithUnsignedLongLong:v184];
                v186 = @"match";
                goto LABEL_233;
              }
            }
            v185 = 0;
            goto LABEL_243;
          }
          v168 = [v487 userAgent];
          if (v168)
          {
            v169 = (void *)v590[5];
            v170 = [v469 assetURL];
            LOBYTE(v169) = [v169 isTrustedHostForURL:v170];

            if (v169) {
              goto LABEL_210;
            }
            id v171 = objc_alloc(MEMORY[0x263F892D0]);
            v172 = [v487 clientInfo];
            v173 = (void *)[v171 initWithClientInfo:v172];
            uint64_t v174 = [v173 userAgent];

            v168 = (void *)v174;
            if (v174)
            {
LABEL_210:
              uint64_t v629 = *MEMORY[0x263F88F28];
              v630 = v168;
              v175 = [NSDictionary dictionaryWithObjects:&v630 forKeys:&v629 count:1];
              [v480 setObject:v175 forKey:*MEMORY[0x263EFA250]];
            }
          }
          if (v464)
          {
            v176 = (void *)MEMORY[0x263EFA260];
          }
          else
          {
            if (self->_radioStreamPlayback) {
              goto LABEL_221;
            }
            if (CFPreferencesGetAppBooleanValue(@"DisableOptimizeAccessForLinearMoviePlayback", @"com.apple.mobileipod", 0))
            {
              v177 = [(MPCModelGenericAVItem *)self eventStream];
              v178 = _MPCLogCategoryPlayback();
              if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
              {
                v179 = [v177 engineID];
                *(_DWORD *)v631 = 138543618;
                *(void *)&v631[4] = v179;
                *(_WORD *)&v631[12] = 2114;
                *(void *)&v631[14] = self;
                _os_log_impl(&dword_21BB87000, v178, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: not enabling AVURLAssetOptimizeAccessForLinearMoviePlaybackKey because its disabled in settings", v631, 0x16u);
              }
              goto LABEL_221;
            }
            v176 = (void *)MEMORY[0x263EFA270];
          }
          [v480 setObject:MEMORY[0x263EFFA88] forKey:*v176];
LABEL_221:

          goto LABEL_222;
        }
LABEL_487:

        goto LABEL_488;
      }
      uint64_t v73 = _MPCLogCategoryAnalytics();
      uint64_t v74 = v73;
      if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v74, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetHomeSharingLoadOperation", "", buf, 2u);
      }

      v75 = objc_alloc_init(MPCModelGenericAVItemHomeSharingLoadOperation);
      [(MPCModelGenericAVItemHomeSharingLoadOperation *)v75 setAssetLoadProperties:v481];
      dispatch_semaphore_t v76 = dispatch_semaphore_create(0);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v635 = __Block_byref_object_copy__767;
      *(void *)v636 = __Block_byref_object_dispose__768;
      *(void *)&v636[8] = 0;
      *(void *)v631 = 0;
      *(void *)&v631[8] = v631;
      *(void *)&v631[16] = 0x3032000000;
      v632 = __Block_byref_object_copy__767;
      *(void *)&long long v633 = __Block_byref_object_dispose__768;
      *((void *)&v633 + 1) = 0;
      v551[0] = MEMORY[0x263EF8330];
      v551[1] = 3221225472;
      v551[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_117;
      v551[3] = &unk_2643BE4B0;
      v553 = buf;
      v554 = v631;
      v77 = v76;
      v552 = v77;
      [(MPCModelGenericAVItemHomeSharingLoadOperation *)v75 setResponseHandler:v551];
      [v467 addOperation:v75];
      dispatch_time_t v78 = dispatch_time(0, 1000000000 * v596);
      if (dispatch_semaphore_wait(v77, v78))
      {
        [(MPAsyncOperation *)v75 cancel];
        uint64_t v79 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v625 = 138543618;
          *(void *)&v625[4] = self;
          *(_WORD *)&v625[12] = 2048;
          *(void *)&v625[14] = v596;
          _os_log_impl(&dword_21BB87000, v79, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load home sharing asset [request aborted after %lds].", v625, 0x16u);
        }

        v80 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Timed out while attempting to load home sharing asset");
        (*((void (**)(void *, void *))v493 + 2))(v493, v80);
      }
      else
      {
        id v462 = *(id *)(*(void *)&buf[8] + 40);

        (*((void (**)(void *, void))v493 + 2))(v493, *(void *)(*(void *)&v631[8] + 40));
        if (!v462)
        {
          v469 = 0;
LABEL_82:
          BOOL v83 = _MPCLogCategoryAnalytics();
          id v84 = v83;
          if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
          {
            int v85 = [(MPCModelGenericAVItem *)self isStartItem];
            *(_DWORD *)v625 = 67240192;
            *(_DWORD *)&v625[4] = v85;
            _os_signpost_emit_with_name_impl(&dword_21BB87000, v84, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetHomeSharingLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v625, 8u);
          }

          _Block_object_dispose(v631, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_86;
        }
        v80 = [(MPCModelGenericAVItem *)self eventStream];
        v81 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v82 = [v80 engineID];
          *(_DWORD *)v625 = 138543618;
          *(void *)&v625[4] = v82;
          *(_WORD *)&v625[12] = 2114;
          *(void *)&v625[14] = self;
          v470 = (void *)v82;
          _os_log_impl(&dword_21BB87000, v81, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using home sharing asset.", v625, 0x16u);
        }
        v469 = v462;
      }

      goto LABEL_82;
    }
    if (v497)
    {
      int v60 = 0;
      v469 = 0;
      goto LABEL_67;
    }
    v61 = _MPCLogCategoryAnalytics();
    BOOL v62 = v61;
    if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v62, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLocalFileLoadOperation", "", buf, 2u);
    }

    id v57 = [[MPCModelGenericAVItemLocalFileLoadOperation alloc] initWithEvaluation:v477 properties:v481];
    [(MPCModelGenericAVItemLocalFileLoadOperation *)v57 setRequirePreferredAssetQuality:1];
    dispatch_semaphore_t v63 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v635 = __Block_byref_object_copy__767;
    *(void *)v636 = __Block_byref_object_dispose__768;
    *(void *)&v636[8] = 0;
    *(void *)v631 = 0;
    *(void *)&v631[8] = v631;
    *(void *)&v631[16] = 0x3032000000;
    v632 = __Block_byref_object_copy__767;
    *(void *)&long long v633 = __Block_byref_object_dispose__768;
    *((void *)&v633 + 1) = 0;
    v555[0] = MEMORY[0x263EF8330];
    v555[1] = 3221225472;
    v555[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_111;
    v555[3] = &unk_2643BE4B0;
    v557 = buf;
    v558 = v631;
    id v58 = v63;
    v556 = v58;
    [(MPCModelGenericAVItemLocalFileLoadOperation *)v57 setResponseHandler:v555];
    [v467 addOperation:v57];
    dispatch_time_t v64 = dispatch_time(0, 1000000000 * *((void *)&v595 + 1));
    if (dispatch_semaphore_wait(v58, v64))
    {
      [(MPAsyncOperation *)v57 cancel];
      v65 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v625 = 138543618;
        *(void *)&v625[4] = self;
        *(_WORD *)&v625[12] = 2048;
        *(void *)&v625[14] = *((void *)&v595 + 1);
        _os_log_impl(&dword_21BB87000, v65, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load local file of specified quality [request aborted after %lds].", v625, 0x16u);
      }

      v66 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Timed out while attempting to load local file of specified quality");
      (*((void (**)(void *, void *))v493 + 2))(v493, v66);
      v469 = 0;
    }
    else
    {
      id v67 = *(id *)(*(void *)&buf[8] + 40);
      (*((void (**)(void *, void))v493 + 2))(v493, *(void *)(*(void *)&v631[8] + 40));
      v469 = v67;
      if (!v67)
      {
        v469 = 0;
LABEL_62:
        id v70 = _MPCLogCategoryAnalytics();
        v71 = v70;
        if (v495 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
        {
          int v72 = [(MPCModelGenericAVItem *)self isStartItem];
          *(_DWORD *)v625 = 67240192;
          *(_DWORD *)&v625[4] = v72;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v71, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLocalFileLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v625, 8u);
        }

        _Block_object_dispose(v631, 8);
        _Block_object_dispose(buf, 8);

        int v60 = 0;
        goto LABEL_66;
      }
      v66 = [(MPCModelGenericAVItem *)self eventStream];
      __int16 v68 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v461 = [v66 engineID];
        v69 = [v67 assetURL];
        *(_DWORD *)v625 = 138543874;
        *(void *)&v625[4] = v461;
        *(_WORD *)&v625[12] = 2114;
        *(void *)&v625[14] = self;
        *(_WORD *)&v625[22] = 2114;
        v626 = v69;
        _os_log_impl(&dword_21BB87000, v68, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using local file asset at path: %{public}@.", v625, 0x20u);
      }
    }

    goto LABEL_62;
  }
  uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    id v32 = [(MPCModelGenericAVItem *)self itemError];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v32;
    _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Returning asset load early with error: %{public}@", buf, 0x16u);
  }
LABEL_491:
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v1 = *(char **)(a1 + 32);
  uint64_t v2 = *(void *)(v3 + 8);
  uint64_t v4 = *(void *)&v1[*MEMORY[0x263F12368]];
  id v5 = [v1 itemError];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

uint64_t __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) disarm];
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      id v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 28, @"Asset load task cancelled at line %ld", a2);
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);

      return 1;
    }
  }
  return result;
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(id *)(*(void *)(v4 + 8) + 40);
  if (v5) {
    BOOL v6 = v5 == v3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", @"MPCError", 24);

    uint64_t v4 = *(void *)(a1 + 40);
    if (!v7)
    {
      [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(v4 + 8) + 40)];
      uint64_t v4 = *(void *)(a1 + 40);
    }
  }
  uint64_t v8 = *(void *)(v4 + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_85(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[AL][Bag Loading] - %{public}@: Failed to load the bag. err=%{public}@.", (uint8_t *)&v15, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v9];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v8, 0, @"Loading asset", objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_93(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  BOOL v2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;
  id v3 = [*(id *)(a1 + 32) eventStream];
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      id v8 = [v3 engineID];
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Loading subscription lease properties.", buf, 0x16u);
    }
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    uint64_t v11 = v10;
    os_signpost_id_t v12 = *(void *)(a1 + 72);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LoadAssetGetSubscriptionLeaseProperties", "", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v56 = __Block_byref_object_copy__767;
    id v57 = __Block_byref_object_dispose__768;
    id v58 = 0;
    uint64_t v43 = 0;
    __int16 v44 = &v43;
    uint64_t v45 = 0x3032000000;
    uint64_t v46 = __Block_byref_object_copy__767;
    uint64_t v47 = __Block_byref_object_dispose__768;
    id v48 = 0;
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000;
    id v40 = __Block_byref_object_copy__767;
    id v41 = __Block_byref_object_dispose__768;
    id v42 = 0;
    id v14 = *(void **)(a1 + 32);
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_94;
    id v32 = &unk_2643BE460;
    int v34 = &v43;
    dispatch_semaphore_t v35 = buf;
    id v36 = &v37;
    id v3 = v13;
    int v33 = v3;
    [v14 _getSubscriptionLeasePropertiesWithCompletion:&v29];
    dispatch_time_t v15 = dispatch_time(0, 1000000000 * *(void *)(a1 + 80));
    if (dispatch_semaphore_wait(v3, v15))
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Timed out loading subscription lease properties", v29, v30, v31, v32);
      uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        char v20 = *(void **)(a1 + 32);
        *(_DWORD *)uint64_t v49 = 138543362;
        unint64_t v50 = v20;
        _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_ERROR, "[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Timed out loading subscription lease properties.", v49, 0xCu);
      }
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), (id)v44[5]);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)&buf[8] + 40));
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), (id)v38[5]);
      uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "eventStream", v29, v30, v31, v32);
      id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        char v22 = [v19 engineID];
        uint64_t v23 = *(void *)(a1 + 32);
        uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)uint64_t v49 = 138543874;
        unint64_t v50 = v22;
        __int16 v51 = 2114;
        uint64_t v52 = v23;
        __int16 v53 = 2114;
        uint64_t v54 = v24;
        _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished loading subscription lease properties error=%{public}@.", v49, 0x20u);
      }
    }

    uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    uint64_t v26 = v25;
    os_signpost_id_t v27 = *(void *)(a1 + 72);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      int v28 = [*(id *)(a1 + 32) isStartItem];
      *(_DWORD *)uint64_t v49 = 67240192;
      LODWORD(v50) = v28;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v26, OS_SIGNPOST_INTERVAL_END, v27, "LoadAssetGetSubscriptionLeaseProperties", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v49, 8u);
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v5)
    {
      BOOL v6 = [v3 engineID];
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Subscription lease properties already loaded.", buf, 0x16u);
    }
  }
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_128(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v15 = v7;
  id v11 = a3;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_semaphore_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v11, 2, @"Loading asset", objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_134(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v15 = v7;
  id v11 = a3;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_semaphore_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v11, 3, @"Loading asset", objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished reload of FairPlay key status: %{public}@ with error: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) eventStream];
    uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 engineID];
      id v11 = *(void **)(a1 + 32);
      int v15 = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v11;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished reload of FairPlay key status: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v5;
  id v14 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_166(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  objc_msgSend(v7, "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v9, 4, @"Loading asset", objc_msgSend(v7, "isStartItem"));

  uint64_t v11 = [MEMORY[0x263F087E8] errorForICError:v8 response:v10];

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = [*(id *)(a1 + 32) eventStream];
  int v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v14 engineID];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = 138543874;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    __int16 v24 = 2114;
    uint64_t v25 = v18;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished subscription lease request for playback keys with error: %{public}@.", (uint8_t *)&v20, 0x20u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_207(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v10 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Full subscription asset loading completed [first asset requires online keys]", (uint8_t *)&v13, 0xCu);
  }

  [*(id *)(a1 + 32) _emitNetworkOperationWithPerformanceMetrics:v10 operationType:2 reason:@"Loading full subscription asset [first asset requires online keys]" blocksPlayback:0];
  if (*(unsigned char *)(a1 + 64)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_211(uint64_t a1, int a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  uint64_t v7 = [*(id *)(a1 + 32) assetCacheProvider];
  [v7 didCacheNewAssetToDestinationURL:*(void *)(a1 + 40)];

  if (!a2
    || ![WeakRetained _linkAssetIfNeededAtURL:*(void *)(a1 + 40) toDestinationURL:*(void *)(a1 + 48) shareCacheURL:*(void *)(a1 + 56)])
  {
    uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v35 = WeakRetained;
      __int16 v36 = 2114;
      id v37 = v5;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: CRABS] Asset download completed with error: %{public}@", buf, 0x16u);
    }
    char v17 = 0;
    goto LABEL_15;
  }
  id v8 = [WeakRetained eventStream];
  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 engineID];
    *(_DWORD *)buf = 138543618;
    id v35 = v10;
    __int16 v36 = 2114;
    id v37 = WeakRetained;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Asset download completed successfully.", buf, 0x16u);
  }
  if (*(unsigned char *)(a1 + 136) && *(void *)(a1 + 64))
  {
    uint64_t v11 = [WeakRetained eventStream];
    uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v11 engineID];
      uint64_t v14 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      id v35 = v13;
      __int16 v36 = 2114;
      id v37 = WeakRetained;
      __int16 v38 = 2114;
      uint64_t v39 = v14;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Writing placeholder purchase bundle at path: %{public}@", buf, 0x20u);
    }
    uint64_t v15 = [MEMORY[0x263F08AC0] dataWithPropertyList:&unk_26CC193E0 format:200 options:0 error:0];
    uint64_t v16 = v15;
    if (v15) {
      [v15 writeToURL:*(void *)(a1 + 64) options:0 error:0];
    }
    char v17 = 1;
LABEL_15:

    goto LABEL_16;
  }
  char v17 = 1;
LABEL_16:
  if (_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueueOnceToken != -1) {
    dispatch_once(&_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueueOnceToken, &__block_literal_global_910);
  }
  uint64_t v18 = _MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_219;
  void v22[3] = &unk_2643BE5A0;
  char v32 = v17;
  char v33 = *(unsigned char *)(a1 + 136);
  long long v29 = *(_OWORD *)(a1 + 88);
  __int16 v19 = *(NSObject **)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  uint64_t v30 = *(void *)(a1 + 104);
  id v23 = v20;
  id v24 = WeakRetained;
  id v25 = *(id *)(a1 + 64);
  id v26 = *(id *)(a1 + 48);
  long long v31 = *(_OWORD *)(a1 + 120);
  id v27 = *(id *)(a1 + 32);
  id v28 = *(id *)(a1 + 40);
  id v21 = WeakRetained;
  dispatch_group_notify(v19, v18, v22);
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_255(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v15 = v7;
  id v11 = a3;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v11, 5, @"Loading asset", objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_259(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 616) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 608) beginAutomaticallyRefreshingLease];
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_219(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 120))
  {
    if (!*(unsigned char *)(a1 + 121))
    {
LABEL_29:
      if (!*(void *)(a1 + 48) || !*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
      {
        char v54 = 0;
LABEL_42:
        id v59 = objc_alloc(MEMORY[0x263F11EC8]);
        id v60 = objc_alloc(MEMORY[0x263F11DB0]);
        v61 = [MEMORY[0x263F11ED0] identityKind];
        BOOL v62 = (void *)[v60 initWithSource:@"ModelGenericAVItem" modelKind:v61 block:&__block_literal_global_235];
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_236;
        v69[3] = &unk_2643BE578;
        id v70 = *(id *)(a1 + 56);
        long long v72 = *(_OWORD *)(a1 + 104);
        char v73 = v54;
        id v71 = *(id *)(a1 + 48);
        dispatch_semaphore_t v63 = (void *)[v59 initWithIdentifiers:v62 block:v69];

        dispatch_suspend((dispatch_object_t)_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue);
        dispatch_time_t v64 = [*(id *)(a1 + 64) assetCacheProvider];
        v65 = [*(id *)(a1 + 64) genericObject];
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_3;
        v67[3] = &unk_2643C30F8;
        id v68 = *(id *)(a1 + 40);
        [v64 setPlaybackAssetCacheFileAsset:v63 forGenericObject:v65 withCompletionHandler:v67];

        id v10 = v70;
        goto LABEL_43;
      }
      __int16 v44 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v45 = [*(id *)(a1 + 56) path];
      int v46 = [v44 fileExistsAtPath:v45];

      uint64_t v47 = [*(id *)(a1 + 40) eventStream];
      id v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
      if (v46)
      {
        if (v49)
        {
          unint64_t v50 = [v47 engineID];
          __int16 v51 = *(__CFString **)(a1 + 40);
          uint64_t v52 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v75 = v50;
          __int16 v76 = 2114;
          v77 = v51;
          __int16 v78 = 2114;
          uint64_t v79 = v52;
          _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Writing purchase bundle at path: %{public}@", buf, 0x20u);
        }
        __int16 v53 = [MEMORY[0x263F08AC0] dataWithPropertyList:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) format:200 options:0 error:0];
        uint64_t v47 = v53;
        if (v53)
        {
          char v54 = [v53 writeToURL:*(void *)(a1 + 48) options:0 error:0];
LABEL_41:

          goto LABEL_42;
        }
      }
      else
      {
        if (v49)
        {
          id v55 = [v47 engineID];
          id v57 = *(NSObject **)(a1 + 48);
          uint64_t v56 = *(void **)(a1 + 56);
          id v58 = *(__CFString **)(a1 + 40);
          *(_DWORD *)buf = 138544130;
          v75 = v55;
          __int16 v76 = 2114;
          v77 = v58;
          __int16 v78 = 2114;
          uint64_t v79 = v56;
          __int16 v80 = 2114;
          v81 = v57;
          _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Not writing purchase bundle [asset no longer on disk] assetPath = %{public}@ purchaseBundlePath = %{public}@", buf, 0x2Au);
        }
      }
      char v54 = 0;
      goto LABEL_41;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      uint64_t v2 = *(void *)(*(void *)(a1 + 96) + 8);
      id v3 = *(void **)(v2 + 40);
      *(void *)(v2 + 40) = 0;

      uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = *(NSObject **)(a1 + 40);
        id v6 = *(__CFString **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v75 = v5;
        __int16 v76 = 2114;
        v77 = v6;
        _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: CRABS] Failed to load full subscription asset: %{public}@.", buf, 0x16u);
      }
      goto LABEL_28;
    }
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) assetURL];
    uint64_t v18 = [v4 host];
    __int16 v19 = [*(id *)(a1 + 32) host];
    int v20 = [v18 isEqual:v19];

    id v21 = [v4 path];
    __int16 v22 = [*(id *)(a1 + 32) path];
    int v23 = [v21 isEqual:v22];

    if (v20) {
      BOOL v24 = v23 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    if (v24)
    {
      uint64_t v25 = *(void *)(*(void *)(a1 + 96) + 8);
      id v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = 0;

      long long v31 = [*(id *)(a1 + 32) host];
      char v32 = [v4 host];
      if (v23)
      {
        id v27 = @"host mismatch";
      }
      else
      {
        uint64_t v41 = [*(id *)(a1 + 32) path];

        uint64_t v42 = [v4 path];

        id v27 = @"path mismatch";
        char v32 = v42;
        long long v31 = (void *)v41;
      }
      int v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      uint64_t v43 = *(NSObject **)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v75 = v43;
      __int16 v76 = 2114;
      v77 = v27;
      __int16 v78 = 2114;
      uint64_t v79 = v31;
      __int16 v80 = 2114;
      v81 = v32;
      id v37 = "[AL] - %{public}@: [Asset caching: CRABS] Ignoring full subscription asset purchase bundle [%{public}@] expe"
            "cted=%{public}@ loaded=%{public}@";
      __int16 v38 = v34;
      os_log_type_t v39 = OS_LOG_TYPE_ERROR;
      uint32_t v40 = 42;
    }
    else
    {
      uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) purchaseBundleDictionary];
      uint64_t v29 = *(void *)(*(void *)(a1 + 96) + 8);
      uint64_t v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      long long v31 = [*(id *)(a1 + 40) eventStream];
      char v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v34 = [v31 engineID];
      id v35 = *(__CFString **)(a1 + 40);
      __int16 v36 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v75 = v34;
      __int16 v76 = 2114;
      v77 = v35;
      __int16 v78 = 2112;
      uint64_t v79 = v36;
      id v37 = "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Loaded full subscription asset, updated purchaseBundle = %@";
      __int16 v38 = v32;
      os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
      uint32_t v40 = 32;
    }
    _os_log_impl(&dword_21BB87000, v38, v39, v37, buf, v40);
LABEL_26:

LABEL_27:
LABEL_28:

    goto LABEL_29;
  }
  id v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = *(void *)(a1 + 72);
  id v66 = 0;
  int v9 = [v7 removeItemAtURL:v8 error:&v66];
  id v10 = v66;

  if (v9)
  {
    id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(NSObject **)(a1 + 40);
      int v13 = *(__CFString **)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      v75 = v12;
      __int16 v76 = 2114;
      v77 = v13;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: CRABS] Removed incomplete download at URL: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) eventStream];
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v11 engineID];
      uint64_t v16 = *(__CFString **)(a1 + 40);
      char v17 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138544130;
      v75 = v15;
      __int16 v76 = 2114;
      v77 = v16;
      __int16 v78 = 2114;
      uint64_t v79 = v17;
      __int16 v80 = 2114;
      v81 = v10;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Failed to remove incomplete downloaded file at URL: %{public}@ error: %{public}@.", buf, 0x2Au);
    }
  }

LABEL_43:
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_236(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) relativePath];
  [v5 setFilePath:v3];

  [v5 setQualityType:*(void *)(a1 + 48)];
  [v5 setNonPurgeable:0];
  [v5 setProtectionType:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v4 = [*(id *)(a1 + 40) relativePath];
    [v5 setPurchaseBundleFilePath:v4];
  }
  else
  {
    [v5 setPurchaseBundleFilePath:0];
  }
  [v5 setTraits:0];
  [v5 setHLSKeyServerURL:&stru_26CBCA930];
  [v5 setHLSKeyServerProtocol:&stru_26CBCA930];
  [v5 setHLSKeyCertificateURL:&stru_26CBCA930];
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v3;
      id v7 = "[AL] - %{public}@: [Asset caching: CRABS] Error caching file asset: %{public}@.";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_21BB87000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v11;
    id v7 = "[AL] - %{public}@: [Asset caching: CRABS] Finished caching file asset.";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  dispatch_resume((dispatch_object_t)_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue);
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_217()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.sCompletionSerialQueue", v2);
  v1 = (void *)_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue;
  _MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue = (uint64_t)v0;
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_94(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v18 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (float)_volumeAdjustment
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  float v4 = 1.0;
  if ([(MPModelGenericObject *)self->_flattenedGenericObject type] == 1)
  {
    id v5 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
    [v5 volumeAdjustment];
    float v4 = v6;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v4;
}

- (id)_loudnessInfoMediaKind
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
  switch(v4)
  {
    case 9:
      id v9 = (id *)MEMORY[0x263F28E88];
LABEL_9:
      id v8 = *v9;
      break;
    case 6:
      id v9 = (id *)MEMORY[0x263F28EA8];
      goto LABEL_9;
    case 1:
      id v5 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
      int v6 = [v5 hasVideo];
      id v7 = (id *)MEMORY[0x263F28E90];
      if (v6) {
        id v7 = (id *)MEMORY[0x263F28E98];
      }
      id v8 = *v7;

      break;
    default:
      id v8 = 0;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);

  return v8;
}

- (MPGaplessInfo)gaplessInfo
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
    id v5 = [v4 gaplessInfo];
  }
  else
  {
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);

  return (MPGaplessInfo *)v5;
}

- (id)_iTunesStorePurchasedMediaKind
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
  switch(v4)
  {
    case 9:
      uint64_t v10 = @"movie";
      break;
    case 6:
      uint64_t v10 = @"tvshow";
      break;
    case 1:
      id v5 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
      int v6 = [v5 isArtistUploadedContent];
      int v7 = [v5 hasVideo];
      id v8 = @"uploadedaudio";
      if (v7) {
        id v8 = @"uploadedvideo";
      }
      id v9 = @"musicvideo";
      if (!v7) {
        id v9 = @"music";
      }
      if (v6) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = v9;
      }

      break;
    default:
      uint64_t v10 = 0;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v10;
}

- (int64_t)_suzeLeaseMediaType
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v4 = [(MPModelGenericObject *)self->_flattenedGenericObject type];
  switch(v4)
  {
    case 9:
      int64_t v7 = 2;
      break;
    case 6:
      int64_t v7 = 7;
      break;
    case 1:
      id v5 = [(MPModelGenericObject *)self->_flattenedGenericObject song];
      int v6 = [v5 hasVideo];

      if (v6) {
        int64_t v7 = 6;
      }
      else {
        int64_t v7 = 1;
      }
      break;
    default:
      int64_t v7 = 1;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (id)_assetLoadPropertiesWithUserIdentityProperties:(id)a3 delegatedUserIdentityProperties:(id)a4 subscriptionPlaybackInfo:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = self->_assetCacheProvider;
  BOOL radioPlayback = self->_radioPlayback;
  id v10 = a3;
  os_unfair_lock_lock(&self->_genericObjectLock);
  uint64_t v11 = self->_genericObject;
  uint64_t v12 = self->_flattenedGenericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  BOOL v42 = [(MPCModelGenericAVItem *)self hasVideo];
  uint64_t v13 = [(MPCModelGenericAVItem *)self audioAssetTypeSelector];
  id v14 = [v13 preferredAudioAssetTypeForItem:self];

  uint64_t v15 = [(MPModelGenericObject *)v12 type];
  uint32_t v40 = v10;
  uint64_t v41 = v12;
  BOOL v39 = radioPlayback;
  switch(v15)
  {
    case 9:
      int v23 = [(MPModelGenericObject *)v12 movie];
LABEL_14:
      uint64_t v16 = v23;
      uint64_t v43 = [v23 localFileAsset];
      uint64_t v17 = [v16 storeAsset];
      uint64_t v45 = [v16 identifiers];
      int v46 = 0;
      uint64_t v18 = 0;
      uint64_t v22 = 0;
LABEL_15:
      __int16 v44 = (void *)v17;

      goto LABEL_17;
    case 6:
      int v23 = [(MPModelGenericObject *)v12 tvEpisode];
      goto LABEL_14;
    case 1:
      uint64_t v16 = [(MPModelGenericObject *)v12 song];
      int v46 = [v16 homeSharingAsset];
      uint64_t v43 = [v16 localFileAsset];
      uint64_t v17 = [v16 storeAsset];
      uint64_t v45 = [v16 identifiers];
      uint64_t v18 = [v14 type];
      char v19 = MSVDeviceIsAudioAccessory() & v42;
      uint64_t v20 = 3;
      if (v18 != 1) {
        uint64_t v20 = v18 == 0;
      }
      if ((unint64_t)(v18 - 2) >= 4) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 2;
      }
      if (v19) {
        uint64_t v22 = 3;
      }
      else {
        uint64_t v22 = v21;
      }
      goto LABEL_15;
  }
  uint64_t v18 = 0;
  uint64_t v22 = 0;
  __int16 v44 = 0;
  uint64_t v45 = 0;
  uint64_t v43 = 0;
  int v46 = 0;
LABEL_17:
  BOOL v24 = [(MPCModelGenericAVItem *)self eventStream];
  uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v11;
    __int16 v38 = v8;
    id v26 = [v24 engineID];
    __int16 v36 = v14;
    id v27 = v7;
    if ((unint64_t)(v18 - 1) > 4) {
      uint64_t v28 = @"Unspecified";
    }
    else {
      uint64_t v28 = off_2643BEBE8[v18 - 1];
    }
    uint64_t v29 = off_2643BEBC8[v22];
    uint64_t v30 = [(MPCModelGenericAVItem *)self audioAssetTypeSelector];
    *(_DWORD *)buf = 138544898;
    id v48 = v26;
    __int16 v49 = 2114;
    unint64_t v50 = self;
    __int16 v51 = 2114;
    uint64_t v52 = v28;
    __int16 v53 = 2114;
    char v54 = v29;
    __int16 v55 = 2114;
    uint64_t v56 = v30;
    __int16 v57 = 2114;
    id v58 = v43;
    __int16 v59 = 2114;
    id v60 = v44;
    _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] Creating assetLoadProperties - %{public}@: Preferred audio: %{public}@ - HLSContentPolicy: %{public}@ - Selector: %{public}@, fileAsset=%{public}@, storeAsset=%{public}@", buf, 0x48u);

    id v7 = v27;
    uint64_t v11 = v37;
    id v8 = v38;
    id v14 = v36;
  }

  long long v31 = objc_alloc_init(MPCModelGenericAVItemAssetLoadProperties);
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setPreferredAudioAssetType:v18];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setAudioAssetTypeSelection:v14];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setHLSContentPolicy:v22];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setPrefersVideoContent:v42];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setAssetCacheProvider:v8];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setFileAsset:v43];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setGenericObject:v11];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setItemIdentifiers:v45];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setPrefersHighQualityContent:[(MPCModelGenericAVItem *)self _prefersHighQualityContent]];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setRadioPlayback:v39];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setStoreAsset:v44];
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setHomeSharingAsset:v46];
  char v32 = [v40 DSID];
  -[MPCModelGenericAVItemAssetLoadProperties setAccountID:](v31, "setAccountID:", [v32 unsignedLongLongValue]);

  char v33 = [v40 storefrontIdentifier];

  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setStorefrontID:v33];
  if (v7)
  {
    int v34 = [v7 DSID];
    -[MPCModelGenericAVItemAssetLoadProperties setDelegatedAccountID:](v31, "setDelegatedAccountID:", [v34 unsignedLongLongValue]);
  }
  [(MPCModelGenericAVItemAssetLoadProperties *)v31 setSupportsVocalAttenuation:[(MPCModelGenericAVItem *)self supportsVocalAttenuation]];

  return v31;
}

- (int64_t)playerItemType
{
  return 0;
}

- (BOOL)_prefersHighQualityContent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F89110] sharedMonitor];
  uint64_t v4 = [v3 networkType];

  id v5 = [MEMORY[0x263F89110] sharedMonitor];
  uint64_t v6 = [v5 lastKnownNetworkType];

  LODWORD(v5) = [(MPCModelGenericAVItem *)self hasVideo];
  id v7 = objc_opt_class();
  if (v5) {
    int v8 = [v7 _prefersHighQualityVideoContentForNetworkType:v6];
  }
  else {
    int v8 = [v7 _prefersHighQualityAudioContentForNetworkType:v6];
  }
  BOOL v9 = v8;
  id v10 = [(MPCModelGenericAVItem *)self eventStream];
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 engineID];
    int v15 = 138544386;
    uint64_t v13 = @" not";
    uint64_t v16 = v12;
    if (v9) {
      uint64_t v13 = &stru_26CBCA930;
    }
    __int16 v17 = 2114;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    BOOL v24 = v13;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Based on network type of %li and last known network type of %li, we are%{public}@ preferring high quality content.", (uint8_t *)&v15, 0x34u);
  }
  return v9;
}

- (id)_delegatedUserIdentityProperties:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = [(MPCModelGenericAVItem *)self _storeRequestContext];
  uint64_t v6 = [v5 delegatedIdentity];

  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet delegatedIdentityProperties];
  int v8 = [v7 DSID];
  uint64_t v9 = [v8 unsignedLongLongValue];

  if (v9)
  {
    if ([v7 isDelegated]) {
      goto LABEL_6;
    }

LABEL_5:
    id v7 = 0;
LABEL_6:
    id v10 = 0;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = self;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Missing DSID in delegated identity properties - skipping playback", buf, 0xCu);
  }

  id v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 16, @"%@: Missing DSID in delegated identity properties - skipping playback", self);
  if (a3) {
LABEL_7:
  }
    *a3 = v10;
LABEL_8:

  return v7;
}

- (ICUserIdentity)playbackRequestUserIdentity
{
  return [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  uint64_t v4 = (MPCModelGenericAVItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && ([(MPCModelGenericAVItem *)self itemError],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      uint64_t v9 = [(MPCModelGenericAVItem *)self queueIdentifier];
      uint64_t v10 = [(MPCModelGenericAVItem *)v4 queueIdentifier];
      uint64_t v11 = (void *)v10;
      char v7 = 0;
      if (v9 && v10) {
        char v7 = [v9 isEqualToString:v10];
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isStreamable
{
  return 1;
}

uint64_t __37__MPCModelGenericAVItem_isAlwaysLive__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) type];
  if (result == 4)
  {
    uint64_t result = [*(id *)(a1 + 32) subtype];
    BOOL v3 = result == 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)copyrightText
{
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
  {
    uint64_t v4 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
    uint64_t v5 = [v4 copyrightText];
  }
  else
  {
    uint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);

  return v5;
}

- (id)chapterTimeMarkers
{
  return 0;
}

- (id)artworkTimeMarkers
{
  return 0;
}

- (void)applyVolumeNormalizationWithSoundCheckEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MPCModelGenericAVItem *)self isAssetLoaded]
    || ![(MPCModelGenericAVItem *)self isHLSAsset]
    || [(MPCModelGenericAVItem *)self loadedAudioAssetType] <= 2)
  {
    os_unfair_lock_lock(&self->_genericObjectLock);
    float v5 = 0.0;
    if ([(MPModelGenericObject *)self->_flattenedMetadataGenericObject type] == 1)
    {
      uint64_t v6 = [(MPModelGenericObject *)self->_flattenedMetadataGenericObject song];
      [v6 volumeNormalization];
      float v5 = v7;
    }
    os_unfair_lock_unlock(&self->_genericObjectLock);
    if (v3) {
      *(float *)&double v8 = v5;
    }
    else {
      *(float *)&double v8 = 0.0;
    }
    [(MPCModelGenericAVItem *)self setSoundCheckVolumeNormalization:v8];
    *(float *)&double v9 = v5;
    [(MPCModelGenericAVItem *)self setLoudnessInfoVolumeNormalization:v9];
  }
}

- (BOOL)allowsEQ
{
  return 1;
}

uint64_t __32__MPCModelGenericAVItem_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endAutomaticallyRefreshingLease];
}

+ (BOOL)automaticallyNotifiesObserversOfChapters
{
  return 0;
}

+ (id)_downloadCompletionPendingItems
{
  if (_downloadCompletionPendingItems_onceToken != -1) {
    dispatch_once(&_downloadCompletionPendingItems_onceToken, &__block_literal_global_542);
  }
  uint64_t v2 = (void *)_downloadCompletionPendingItems_items;

  return v2;
}

void __56__MPCModelGenericAVItem__downloadCompletionPendingItems__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v1 = (void *)_downloadCompletionPendingItems_items;
  _downloadCompletionPendingItems_items = v0;
}

+ (id)_utilitySerialQueue
{
  if (_utilitySerialQueue_onceToken != -1) {
    dispatch_once(&_utilitySerialQueue_onceToken, &__block_literal_global_479);
  }
  uint64_t v2 = (void *)_utilitySerialQueue_utilitySerialQueue;

  return v2;
}

uint64_t __44__MPCModelGenericAVItem__utilitySerialQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  v1 = (void *)_utilitySerialQueue_utilitySerialQueue;
  _utilitySerialQueue_utilitySerialQueue = (uint64_t)v0;

  [(id)_utilitySerialQueue_utilitySerialQueue setMaxConcurrentOperationCount:1];
  [(id)_utilitySerialQueue_utilitySerialQueue setQualityOfService:17];
  uint64_t v2 = (void *)_utilitySerialQueue_utilitySerialQueue;

  return [v2 setName:@"com.apple.MediaPlaybackCore.MPCModelGenericAVItem.utilitySerialQueue"];
}

+ (BOOL)_prefersHighQualityVideoContentForNetworkType:(int64_t)a3
{
  if (ICEnvironmentNetworkTypeIsBluetooth()) {
    return 0;
  }
  if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0 || ICEnvironmentNetworkTypeIsWired())
  {
    float v5 = [MEMORY[0x263F12178] standardUserDefaults];
    uint64_t v6 = [v5 preferredVideoHighBandwidthResolution];
LABEL_6:
    BOOL v4 = v6 == 1000000;

    return v4;
  }
  double v8 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v9 = [v8 preferredVideoLowBandwidthResolution];

  BOOL v4 = 0;
  if (a3 >= 3 && v9 >= 1)
  {
    uint64_t v10 = [MEMORY[0x263F89110] sharedMonitor];
    int v11 = [v10 isCurrentNetworkLinkExpensive];

    if (!v11) {
      return 1;
    }
    float v5 = [MEMORY[0x263F12178] standardUserDefaults];
    uint64_t v6 = [v5 preferredVideoLowBandwidthResolution];
    goto LABEL_6;
  }
  return v4;
}

+ (BOOL)_prefersHighQualityAudioContentForNetworkType:(int64_t)a3
{
  if (CFPreferencesGetAppBooleanValue(@"AlwaysUse64kbpsQuality", @"com.apple.mobileipod", 0)) {
    return 0;
  }
  if (!CFPreferencesGetAppBooleanValue(@"AlwaysUse256kbpsQuality", @"com.apple.mobileipod", 0))
  {
    if ((ICEnvironmentNetworkTypeIsBluetooth() & 1) == 0)
    {
      if (ICEnvironmentNetworkTypeIsWired()) {
        return 1;
      }
      if (ICEnvironmentNetworkTypeIsWiFi())
      {
        float v5 = [MEMORY[0x263F89110] sharedMonitor];
        char v6 = [v5 isNetworkConstrained];

        if ((v6 & 1) == 0) {
          return 1;
        }
      }
      else
      {
        float v7 = [MEMORY[0x263F12178] standardUserDefaults];
        if ([v7 preferredMusicLowBandwidthResolution] >= 256)
        {

          if (a3 <= 2) {
            return 0;
          }
        }
        else
        {
          double v8 = [MEMORY[0x263F89110] sharedMonitor];
          char v9 = [v8 isCurrentNetworkLinkExpensive];

          if (a3 < 3 || (v9 & 1) != 0) {
            return 0;
          }
        }
        uint64_t v10 = [MEMORY[0x263F89110] sharedMonitor];
        int v11 = [v10 isNetworkConstrained];

        if (!v11) {
          return 1;
        }
      }
    }
    return 0;
  }
  return 1;
}

+ (int64_t)_unwrapPlaybackError:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F08410]);
  uint64_t v5 = [v4 code];

  if ((unint64_t)(v5 + 49999) >> 6 <= 0x7C)
  {
    if ((unint64_t)(v5 + 42597) < 0xE)
    {
      int64_t v6 = *((void *)&unk_21BEF1768 + v5 + 42597);
      goto LABEL_16;
    }
LABEL_15:
    int64_t v6 = 3;
    goto LABEL_16;
  }
  float v7 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:", *MEMORY[0x263EF98B0]);
  uint64_t v8 = [v7 code];

  if (v8 == -11835)
  {
    int64_t v6 = 5;
    goto LABEL_16;
  }
  char v9 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:", @"CoreMediaErrorDomain");
  int64_t v6 = [v9 code];

  if (v6 <= -42813)
  {
    if (v6 == -42829)
    {
      int64_t v6 = 1;
      goto LABEL_16;
    }
    if (v6 == -42828 || v6 == -42814)
    {
      int64_t v6 = 2;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v6 == -42812) {
    goto LABEL_15;
  }
  if (v6 == -42004)
  {
    int64_t v6 = 4;
    goto LABEL_16;
  }
  if (v6) {
LABEL_14:
  }
    int64_t v6 = 0;
LABEL_16:

  return v6;
}

@end