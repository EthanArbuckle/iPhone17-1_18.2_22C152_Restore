@interface MPAVItem
+ (BOOL)isPlaceholder;
+ (id)URLFromPath:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_playerItemDurationIfAvailable;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime;
- (AVAsset)asset;
- (AVPlayerItem)playerItem;
- (AVPlayerItemAccessLog)accessLog;
- (BOOL)_shouldPublishArtworkURL;
- (BOOL)allowsAirPlayFromCloud;
- (BOOL)allowsEQ;
- (BOOL)allowsExternalPlayback;
- (BOOL)canReusePlayerItem;
- (BOOL)canUseLoadedAsset;
- (BOOL)didAttemptToLoadAsset;
- (BOOL)didReachEnd;
- (BOOL)displayableTextLoaded;
- (BOOL)durationIsValid;
- (BOOL)hasExternalDisplay;
- (BOOL)hasFinishedDownloading;
- (BOOL)hasPerformedErrorResolution;
- (BOOL)hasProtectedContent;
- (BOOL)hasStoreLyrics;
- (BOOL)hasTimeSyncedLyrics;
- (BOOL)isActiveItem;
- (BOOL)isAlwaysLive;
- (BOOL)isArtistUploadedContent;
- (BOOL)isAssetLoaded;
- (BOOL)isAssetURLValid;
- (BOOL)isAutoPlayItem;
- (BOOL)isConfiguredForVocalAttenuation;
- (BOOL)isExplicitTrack;
- (BOOL)isHostingSharedSession;
- (BOOL)isInOverlappedTransition;
- (BOOL)isInTransition;
- (BOOL)isLikedStateEnabled;
- (BOOL)isPlaceholder;
- (BOOL)isPreloadedAsset;
- (BOOL)isRadioItem;
- (BOOL)isSharedListeningItem;
- (BOOL)isStartItem;
- (BOOL)isStreamable;
- (BOOL)isSupportedDefaultPlaybackSpeed:(int64_t)a3;
- (BOOL)isValidPlayerSubstituteForItem:(id)a3;
- (BOOL)mediaItemNeedsLoading;
- (BOOL)prefersSeekOverSkip;
- (BOOL)requiresLoadedAssetForAirPlayProperties;
- (BOOL)shouldPreventPlayback;
- (BOOL)shouldShowComposer;
- (BOOL)stationAllowsItemLiking;
- (BOOL)supportsFastForward;
- (BOOL)supportsLikedState;
- (BOOL)supportsRateChange;
- (BOOL)supportsRating;
- (BOOL)supportsRewind;
- (BOOL)supportsVocalAttenuation;
- (BOOL)useEmbeddedChapterData;
- (BOOL)usesBookmarking;
- (BOOL)usesSubscriptionLease;
- (CGSize)naturalSize;
- (CGSize)presentationSize;
- (ICMusicSubscriptionLeaseStatus)leaseStatus;
- (MPAVItem)init;
- (MPAVItem)initWithAsset:(id)a3;
- (MPAVItem)initWithPlayerItem:(id)a3;
- (MPAVItem)initWithURL:(id)a3;
- (MPAVItem)initWithURL:(id)a3 options:(id)a4;
- (MPAVItemObserver)observer;
- (MPMediaItem)mediaItem;
- (MPModelGenericObject)modelGenericObject;
- (MPModelPlayEvent)modelPlayEvent;
- (MPNowPlayingContentItem)contentItem;
- (MPQueueFeeder)feeder;
- (NSArray)adjunctErrors;
- (NSArray)artworkTimeMarkers;
- (NSArray)chapterTimeMarkers;
- (NSArray)closedCaptionTimeMarkers;
- (NSArray)timedMetadataIfAvailable;
- (NSArray)urlTimeMarkers;
- (NSDate)releaseDate;
- (NSDictionary)playbackInfo;
- (NSError)itemError;
- (NSError)playbackError;
- (NSNumber)bookmarkTime;
- (NSNumber)initialPlaybackStartTime;
- (NSNumber)initialPlaybackStartTimeOverride;
- (NSNumber)lastMetadataChangeTime;
- (NSNumber)playbackInfoStartTime;
- (NSNumber)storeAccountID;
- (NSString)album;
- (NSString)albumArtist;
- (NSString)artist;
- (NSString)associatedParticipantIdentifier;
- (NSString)cloudAlbumID;
- (NSString)cloudUniversalLibraryID;
- (NSString)composer;
- (NSString)containerUniqueID;
- (NSString)contentItemID;
- (NSString)copyrightText;
- (NSString)databaseID;
- (NSString)explicitBadge;
- (NSString)externalContentIdentifier;
- (NSString)genre;
- (NSString)itemDescription;
- (NSString)libraryLyrics;
- (NSString)lyrics;
- (NSString)mainTitle;
- (NSString)personID;
- (NSString)queueIdentifier;
- (NSString)queueItemID;
- (NSString)queueSectionID;
- (NSString)rtcReportingServiceIdentifier;
- (NSString)stationHash;
- (NSString)stationName;
- (NSString)stationStringID;
- (NSString)storeFrontIdentifier;
- (NSString)storeItemID;
- (OpaqueCMTimebase)timebase;
- (double)_durationFromExternalMetadataIfAvailable;
- (double)_expectedStartTimeWithPlaybackInfo:(id)a3;
- (double)_expectedStopTimeWithPlaybackInfo:(id)a3;
- (double)_playableDurationForLoadedTimeRanges:(id)a3;
- (double)currentTimeDisplayOverride;
- (double)durationFromExternalMetadata;
- (double)durationIfAvailable;
- (double)durationInSeconds;
- (double)lastPlayPerformanceTime;
- (double)overlappedTransitionDuration;
- (double)playableDuration;
- (double)playableDurationIfAvailable;
- (double)timeOfSeekableEnd;
- (double)timeOfSeekableStart;
- (float)_currentPlaybackRate;
- (float)defaultPlaybackRate;
- (float)loudnessInfoVolumeNormalization;
- (float)soundCheckVolumeNormalization;
- (float)userRating;
- (id)_contentItemDeviceSpecificUserInfo;
- (id)_contentItemUserInfo;
- (id)_imageChapterTrackIDsForAsset:(id)a3;
- (id)_initialPlaybackStartTimeForPlaybackInfo:(id)a3;
- (id)_seekableTimeRanges;
- (id)analyticsContentType;
- (id)analyticsFormatType;
- (id)artworkCatalogBlock;
- (id)artworkCatalogForPlaybackTime:(double)a3;
- (id)description;
- (id)path;
- (id)url;
- (int)subtitleTrackID;
- (int64_t)_persistedLikedState;
- (int64_t)albumStoreID;
- (int64_t)albumYear;
- (int64_t)artistStoreID;
- (int64_t)customAVEQPreset;
- (int64_t)explicitContentState;
- (int64_t)lastChangeDirection;
- (int64_t)leasePlaybackPreventionState;
- (int64_t)likedState;
- (int64_t)lyricsAdamID;
- (int64_t)nowPlayingInfoQueueCount;
- (int64_t)nowPlayingInfoQueueIndex;
- (int64_t)playbackMode;
- (int64_t)reportingAdamID;
- (int64_t)stationID;
- (int64_t)stationProviderID;
- (int64_t)status;
- (int64_t)storeAlbumArtistID;
- (int64_t)storeItemInt64ID;
- (int64_t)storePurchasedAdamID;
- (int64_t)storeSubscriptionAdamID;
- (int64_t)type;
- (unint64_t)albumArtistPersistentID;
- (unint64_t)albumPersistentID;
- (unint64_t)albumTrackCount;
- (unint64_t)albumTrackNumber;
- (unint64_t)artistPersistentID;
- (unint64_t)cloudID;
- (unint64_t)composerPersistentID;
- (unint64_t)discCount;
- (unint64_t)discNumber;
- (unint64_t)genrePersistentID;
- (unint64_t)mediaType;
- (unint64_t)persistentID;
- (void)_addObservationsForAVPlayerItem:(id)a3;
- (void)_clearAssetNow;
- (void)_copyPlayerItem;
- (void)_internalLikedStateDidChangeNotification:(id)a3;
- (void)_itemAttributeAvailableKey:(id)a3;
- (void)_likedStateDidChange;
- (void)_loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4;
- (void)_loadAssetProperties;
- (void)_performContentItemUpdate:(id)a3 debounceWithIdentifier:(id)a4;
- (void)_pickupContentItemFrom:(id)a3;
- (void)_removeObservationsForAVPlayerItem:(id)a3;
- (void)_setCurrentPlaybackRate:(float)a3;
- (void)_setNeedsPersistedLikedStateUpdate;
- (void)_updateContentItem;
- (void)_updateContentItemIncludingPlaybackState:(BOOL)a3;
- (void)_updateDurationSnapshotWithElapsedTime:(double)a3 playbackRate:(float)a4;
- (void)_updateHasFinishedDownloading;
- (void)_updateSoundCheckVolumeNormalizationForPlayerItem;
- (void)_willBecomeActivePlayerItem;
- (void)_willResignActivePlayerItem;
- (void)addAdjunctError:(id)a3;
- (void)clearAdjunctErrors;
- (void)dealloc;
- (void)disableItemReuse;
- (void)invalidateContentItemAudioFormatInfo;
- (void)invalidateContentItemDeviceSpecificUserInfo;
- (void)invalidateContentItemUserInfo;
- (void)notePlaybackFinishedByHittingEnd;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForRate:(float)a3 completionHandler:(id)a4;
- (void)reevaluateHasProtectedContent;
- (void)reevaluateType;
- (void)replacePlayerItemWithPlayerItem:(id)a3;
- (void)resolvePlaybackError:(id)a3 withCompletion:(id)a4;
- (void)setActiveItem:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setAssociatedParticipantIdentifier:(id)a3;
- (void)setAutoPlayItem:(BOOL)a3;
- (void)setClosedCaptionTimeMarkers:(id)a3;
- (void)setConfiguredForVocalAttenuation:(BOOL)a3;
- (void)setContentItemID:(id)a3 queueSectionID:(id)a4 queueItemID:(id)a5;
- (void)setDefaultPlaybackRate:(float)a3;
- (void)setExplicitBadge:(id)a3;
- (void)setExplicitContentState:(int64_t)a3;
- (void)setExternalDisplay:(BOOL)a3;
- (void)setFeeder:(id)a3;
- (void)setHasPerformedErrorResolution:(BOOL)a3;
- (void)setInOverlappedTransition:(BOOL)a3;
- (void)setInitialPlaybackStartTimeOverride:(id)a3;
- (void)setIsAssetLoaded:(BOOL)a3;
- (void)setIsHostingSharedSession:(BOOL)a3;
- (void)setIsStartItem:(BOOL)a3;
- (void)setItemError:(id)a3;
- (void)setLastChangeDirection:(int64_t)a3;
- (void)setLastMetadataChangeTime:(id)a3;
- (void)setLastPlayPerformanceTime:(double)a3;
- (void)setLikedState:(int64_t)a3;
- (void)setLikedState:(int64_t)a3 forUserIdentity:(id)a4;
- (void)setLoudnessInfoVolumeNormalization:(float)a3;
- (void)setModelPlayEvent:(id)a3;
- (void)setNowPlayingInfoQueueCount:(int64_t)a3;
- (void)setNowPlayingInfoQueueIndex:(int64_t)a3;
- (void)setObserver:(id)a3;
- (void)setOverlappedTransitionDuration:(double)a3;
- (void)setPlaybackInfo:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setSharedListeningItem:(BOOL)a3;
- (void)setSoundCheckVolumeNormalization:(float)a3;
- (void)setupEQPresetWithDefaultPreset:(int64_t)a3;
- (void)setupWithPlaybackInfo;
@end

@implementation MPAVItem

- (int64_t)type
{
  return self->_type;
}

- (NSString)queueSectionID
{
  return self->_queueSectionID;
}

- (void)setLastChangeDirection:(int64_t)a3
{
  if (self->_lastChangeDirection != a3)
  {
    self->_lastChangeDirection = a3;
    [(MPAVItem *)self invalidateContentItemUserInfo];
  }
}

- (BOOL)isInOverlappedTransition
{
  return self->_inOverlappedTransition;
}

- (id)_contentItemDeviceSpecificUserInfo
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  if ([(MPAVItem *)self persistentID] != -1 && [(MPAVItem *)self persistentID])
  {
    *((unsigned char *)v59 + 24) = 1;
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPAVItem persistentID](self, "persistentID"));
    [v3 setObject:v4 forKeyedSubscript:@"pid"];
  }
  if ([(MPAVItem *)self cloudID])
  {
    *((unsigned char *)v55 + 24) = 1;
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPAVItem cloudID](self, "cloudID"));
    [v3 setObject:v5 forKeyedSubscript:@"clid"];
  }
  v6 = [(MPAVItem *)self cloudAlbumID];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    *((unsigned char *)v55 + 24) = 1;
    v8 = [(MPAVItem *)self cloudAlbumID];
    [v3 setObject:v8 forKeyedSubscript:@"claid"];
  }
  v9 = [(MPAVItem *)self cloudUniversalLibraryID];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [(MPAVItem *)self cloudUniversalLibraryID];
    [v3 setObject:v11 forKeyedSubscript:@"ulid"];
  }
  if ([(MPAVItem *)self albumPersistentID] != -1
    && [(MPAVItem *)self albumPersistentID])
  {
    *((unsigned char *)v59 + 24) = 1;
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPAVItem albumPersistentID](self, "albumPersistentID"));
    [v3 setObject:v12 forKeyedSubscript:@"apid"];
  }
  if ([(MPAVItem *)self albumArtistPersistentID] != -1
    && [(MPAVItem *)self albumArtistPersistentID])
  {
    *((unsigned char *)v59 + 24) = 1;
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPAVItem albumArtistPersistentID](self, "albumArtistPersistentID"));
    [v3 setObject:v13 forKeyedSubscript:@"aarpid"];
  }
  if ([(MPAVItem *)self artistPersistentID] != -1
    && [(MPAVItem *)self artistPersistentID])
  {
    *((unsigned char *)v59 + 24) = 1;
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPAVItem artistPersistentID](self, "artistPersistentID"));
    [v3 setObject:v14 forKeyedSubscript:@"arpid"];
  }
  if ([(MPAVItem *)self genrePersistentID] != -1
    && [(MPAVItem *)self genrePersistentID])
  {
    *((unsigned char *)v59 + 24) = 1;
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPAVItem genrePersistentID](self, "genrePersistentID"));
    [v3 setObject:v15 forKeyedSubscript:@"gpid"];
  }
  if ([(MPAVItem *)self composerPersistentID] != -1
    && [(MPAVItem *)self composerPersistentID])
  {
    *((unsigned char *)v59 + 24) = 1;
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPAVItem composerPersistentID](self, "composerPersistentID"));
    [v3 setObject:v16 forKeyedSubscript:@"cpid"];
  }
  if ([(MPAVItem *)self storePurchasedAdamID])
  {
    v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MPAVItem storePurchasedAdamID](self, "storePurchasedAdamID"));
    [v3 setObject:v17 forKeyedSubscript:@"purID"];
  }
  v18 = [(MPAVItem *)self libraryLyrics];

  if (v18) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hsLibLy"];
  }
  v19 = [(MPAVItem *)self modelGenericObject];
  uint64_t v20 = [v19 type];

  if (v20 == 5)
  {
    v21 = [(MPAVItem *)self modelGenericObject];
    v22 = [v21 identifiers];
    v23 = [v22 library];
    uint64_t v24 = [v23 persistentID];

    if (v24)
    {
      *((unsigned char *)v59 + 24) = 1;
      v25 = [NSNumber numberWithLongLong:v24];
      [v3 setObject:v25 forKeyedSubscript:@"peid"];
    }
  }
  v26 = [(MPAVItem *)self libraryLyrics];
  v27 = [v26 dataUsingEncoding:4];

  if (v27)
  {
    v28 = MSVGzipCompressData();
    [v3 setObject:v28 forKeyedSubscript:@"lrcsGzpData"];
  }
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"supART"];
  v29 = [(MPAVItem *)self modelPlayEvent];
  v30 = [(MPAVItem *)self modelGenericObject];
  v31 = [v30 flattenedGenericObject];
  v32 = [v31 anyObject];

  if ([v29 itemType] == 3)
  {
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    v48 = __46__MPAVItem__contentItemDeviceSpecificUserInfo__block_invoke;
    v49 = &unk_1E57F2870;
    id v50 = v29;
    id v51 = v3;
    v52 = &v58;
    v53 = &v54;
    +[MPModelObject performWithoutEnforcement:&v46];
  }
  if (*((unsigned char *)v59 + 24))
  {
    v33 = [(MPAVItem *)self databaseID];
    [v3 setObject:v33 forKeyedSubscript:@"did"];
  }
  if (*((unsigned char *)v55 + 24))
  {
    v34 = [(MPAVItem *)self personID];
    [v3 setObject:v34 forKeyedSubscript:@"prid"];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v32 isDisliked]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isDisliked"];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v32 isFavorite]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isFav"];
  }
  if (objc_opt_respondsToSelector())
  {
    if ([v32 isLibraryAdded])
    {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"libAdded"];
      if ([v29 itemType] == 1) {
        [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"colLibAdded"];
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v32, "keepLocalEnableState"));
    [v3 setObject:v35 forKeyedSubscript:@"klEnable"];
  }
  if (objc_opt_respondsToSelector())
  {
    v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v32, "keepLocalManagedStatus"));
    [v3 setObject:v36 forKeyedSubscript:@"klStatus"];
  }
  if (objc_opt_respondsToSelector())
  {
    v37 = [v32 localFileAsset];
    if ([v37 isNonPurgeable]) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"nonPurge"];
    }
    v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "protectionType", v46, v47, v48, v49));
    [v3 setObject:v38 forKeyedSubscript:@"procType"];
  }
  if (objc_opt_respondsToSelector())
  {
    v39 = [v32 storeAsset];
    v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v39, "endpointType"));
    [v3 setObject:v40 forKeyedSubscript:@"endpt"];
  }
  if (objc_opt_respondsToSelector())
  {
    [v32 userRating];
    if (v41 > 0.00000011921)
    {
      v42 = objc_msgSend(NSNumber, "numberWithFloat:");
      [v3 setObject:v42 forKeyedSubscript:@"rating"];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v43 = [v32 playbackPosition];
    if ([v43 shouldRememberBookmarkTime]) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"rembok"];
    }
  }
  id v44 = v3;

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v44;
}

- (MPModelGenericObject)modelGenericObject
{
  return self->_modelGenericObject;
}

- (NSString)libraryLyrics
{
  return 0;
}

- (unint64_t)persistentID
{
  return -1;
}

- (int64_t)storePurchasedAdamID
{
  return 0;
}

- (unint64_t)genrePersistentID
{
  return -1;
}

- (unint64_t)composerPersistentID
{
  return -1;
}

- (NSString)cloudUniversalLibraryID
{
  return 0;
}

- (unint64_t)cloudID
{
  return 0;
}

- (NSString)cloudAlbumID
{
  return 0;
}

- (unint64_t)artistPersistentID
{
  return -1;
}

- (unint64_t)albumPersistentID
{
  return -1;
}

- (unint64_t)albumArtistPersistentID
{
  return -1;
}

- (MPAVItem)init
{
  return [(MPAVItem *)self initWithAsset:0];
}

- (MPAVItem)initWithAsset:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F16620], "playerItemWithAsset:");
  }
  else
  {
    v4 = 0;
  }
  v5 = [(MPAVItem *)self initWithPlayerItem:v4];

  return v5;
}

- (MPAVItem)initWithPlayerItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPAVItem;
  v5 = [(MPAVItem *)&v20 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVItem.assetQueue", 0);
    assetQueue = v6->_assetQueue;
    v6->_assetQueue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      uint64_t v9 = [v4 asset];
      asset = v6->_asset;
      v6->_asset = (AVAsset *)v9;

      [(MPAVItem *)v6 setPlayerItem:v4];
      v6->_isAssetLoaded = 1;
      v6->_isPreloadedAsset = 1;
      v6->_didAttemptToLoadAsset = 1;
      [(MPAVItem *)v6 _loadAssetProperties];
      v11 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        avPlayerItem = v6->_avPlayerItem;
        *(_DWORD *)buf = 138543362;
        v22 = avPlayerItem;
        _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "    AVPlayerItem: %{public}@", buf, 0xCu);
      }
    }
    v6->_defaultPlaybackRate = 1.0;
    *(int64x2_t *)&v6->_cachedDuration = vdupq_n_s64(0x7FF8000000000000uLL);
    *((unsigned char *)v6 + 108) = *((unsigned char *)v6 + 108) & 0xFC | 2;
    v6->_likedState = 0;
    v6->_type = 0;
    v6->_nowPlayingInfoQueueIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    contentItemID = v6->_contentItemID;
    v6->_contentItemID = (NSString *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    pendingContentItemUpdates = v6->_pendingContentItemUpdates;
    v6->_pendingContentItemUpdates = (NSMutableSet *)v16;

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v6 selector:sel__internalLikedStateDidChangeNotification_ name:@"_MPAVItemInternalLikedStateDidChangeNotification" object:0];
  }
  return v6;
}

- (BOOL)isPlaceholder
{
  v2 = objc_opt_class();

  return [v2 isPlaceholder];
}

- (void)setPlaybackInfo:(id)a3
{
}

- (void)setIsHostingSharedSession:(BOOL)a3
{
  self->_isHostingSharedSession = a3;
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
}

- (NSString)queueItemID
{
  return self->_queueItemID;
}

- (BOOL)isRadioItem
{
  return 0;
}

- (void)setQueueIdentifier:(id)a3
{
}

- (void)setObserver:(id)a3
{
}

- (void)setModelPlayEvent:(id)a3
{
}

- (BOOL)supportsRateChange
{
  return 1;
}

- (BOOL)stationAllowsItemLiking
{
  return 0;
}

- (NSNumber)lastMetadataChangeTime
{
  return self->_lastMetadataChangeTime;
}

- (BOOL)isStartItem
{
  return self->_isStartItem;
}

- (void)setAutoPlayItem:(BOOL)a3
{
  if (self->_autoPlayItem != a3)
  {
    self->_autoPlayItem = a3;
    [(MPAVItem *)self invalidateContentItemUserInfo];
  }
}

- (BOOL)usesBookmarking
{
  return 0;
}

- (void)setIsStartItem:(BOOL)a3
{
  self->_isStartItem = a3;
}

- (void)setInitialPlaybackStartTimeOverride:(id)a3
{
}

- (BOOL)prefersSeekOverSkip
{
  return self->_prefersSeekOverSkip;
}

- (BOOL)didReachEnd
{
  return self->_didReachEnd;
}

- (void)_updateContentItemIncludingPlaybackState:(BOOL)a3
{
  BOOL v3 = a3;
  v66[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(MPAVItem *)self persistentID];
  int64_t v6 = v5;
  if (v5 == -1)
  {
    int64_t v6 = [(MPAVItem *)self storeSubscriptionAdamID];
    if (!v6) {
      goto LABEL_5;
    }
  }
  else if (!v5)
  {
LABEL_5:
    int64_t v6 = [(MPAVItem *)self storeItemInt64ID];
    if (!v6) {
      goto LABEL_7;
    }
  }
  [(MPNowPlayingContentItem *)self->_contentItem setLegacyUniqueID:v6];
LABEL_7:
  if (v3)
  {
    [(MPContentItem *)self->_contentItem setPlayable:1];
    memset(&v63, 0, sizeof(v63));
    [(MPAVItem *)self _playerItemDurationIfAvailable];
    double Seconds = 0.0;
    if ((unsigned __int128)0 >> 96 == 1)
    {
      CMTime time = v63;
      double Seconds = CMTimeGetSeconds(&time);
    }
    [(MPNowPlayingContentItem *)self->_contentItem setDuration:Seconds];
    [(MPAVItem *)self defaultPlaybackRate];
    -[MPNowPlayingContentItem setDefaultPlaybackRate:](self->_contentItem, "setDefaultPlaybackRate:");
    v8 = [(MPAVItem *)self initialPlaybackStartTime];
    [v8 doubleValue];
    -[MPNowPlayingContentItem setElapsedTime:](self->_contentItem, "setElapsedTime:");

    [(MPNowPlayingContentItem *)self->_contentItem setPlaybackRate:0.0];
    BOOL v9 = [(MPAVItem *)self isAssetLoaded];
    double v10 = 0.0;
    if (v9) {
      [(MPAVItem *)self timeOfSeekableStart];
    }
    [(MPNowPlayingContentItem *)self->_contentItem setStartTime:v10];
  }
  [(MPNowPlayingContentItem *)self->_contentItem setInTransition:[(MPAVItem *)self isInTransition]];
  [(MPNowPlayingContentItem *)self->_contentItem setStoreID:[(MPAVItem *)self storeItemInt64ID]];
  [(MPNowPlayingContentItem *)self->_contentItem setStoreAlbumID:[(MPAVItem *)self albumStoreID]];
  [(MPNowPlayingContentItem *)self->_contentItem setStoreAlbumArtistID:[(MPAVItem *)self storeAlbumArtistID]];
  [(MPNowPlayingContentItem *)self->_contentItem setStoreArtistID:[(MPAVItem *)self artistStoreID]];
  [(MPNowPlayingContentItem *)self->_contentItem setStoreSubscriptionID:[(MPAVItem *)self storeSubscriptionAdamID]];
  [(MPNowPlayingContentItem *)self->_contentItem setReportingAdamID:[(MPAVItem *)self reportingAdamID]];
  [(MPNowPlayingContentItem *)self->_contentItem setLyricsAdamID:[(MPAVItem *)self lyricsAdamID]];
  v11 = [(MPAVItem *)self mainTitle];
  [(MPContentItem *)self->_contentItem setTitle:v11];

  uint64_t v12 = [(MPAVItem *)self album];
  v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_1EE680640;
  }
  [(MPNowPlayingContentItem *)self->_contentItem setAlbumName:v14];

  int64_t quot = [(MPAVItem *)self albumYear];
  int64_t v16 = quot;
  v17 = v65;
  do
  {
    ldiv_t v18 = ldiv(quot, 10);
    int64_t quot = v18.quot;
    if (v18.rem >= 0) {
      LOBYTE(v19) = v18.rem;
    }
    else {
      uint64_t v19 = -v18.rem;
    }
    *(v17 - 2) = v19 + 48;
    objc_super v20 = v17 - 2;
    --v17;
  }
  while (v18.quot);
  if (v16 < 0)
  {
    *(v17 - 2) = 45;
    objc_super v20 = v17 - 2;
  }
  v21 = (__CFString *)CFStringCreateWithBytes(0, v20, &v64 - (char *)v20, 0x8000100u, 0);
  p_contentItem = &self->_contentItem;
  [(MPNowPlayingContentItem *)self->_contentItem setAlbumYear:v21];

  uint64_t v23 = [(MPAVItem *)self releaseDate];
  [(MPNowPlayingContentItem *)self->_contentItem setReleaseDate:v23];

  uint64_t v24 = [(MPAVItem *)self artist];
  v25 = (void *)v24;
  if (v24) {
    v26 = (__CFString *)v24;
  }
  else {
    v26 = &stru_1EE680640;
  }
  [(MPNowPlayingContentItem *)*p_contentItem setTrackArtistName:v26];

  uint64_t v27 = [(MPAVItem *)self albumArtist];
  v28 = (void *)v27;
  if (v27) {
    v29 = (__CFString *)v27;
  }
  else {
    v29 = &stru_1EE680640;
  }
  [(MPNowPlayingContentItem *)*p_contentItem setAlbumArtistName:v29];

  uint64_t v30 = [(MPAVItem *)self composer];
  v31 = (void *)v30;
  if (v30) {
    v32 = (__CFString *)v30;
  }
  else {
    v32 = &stru_1EE680640;
  }
  [(MPNowPlayingContentItem *)*p_contentItem setComposerName:v32];

  uint64_t v33 = [(MPAVItem *)self genre];
  v34 = (void *)v33;
  if (v33) {
    v35 = (__CFString *)v33;
  }
  else {
    v35 = &stru_1EE680640;
  }
  [(MPNowPlayingContentItem *)*p_contentItem setGenreName:v35];

  [(MPNowPlayingContentItem *)*p_contentItem setDiscNumber:[(MPAVItem *)self discNumber]];
  [(MPNowPlayingContentItem *)*p_contentItem setTotalDiscCount:[(MPAVItem *)self discCount]];
  [(MPNowPlayingContentItem *)*p_contentItem setTrackNumber:[(MPAVItem *)self albumTrackNumber]];
  [(MPNowPlayingContentItem *)*p_contentItem setTotalTrackCount:[(MPAVItem *)self albumTrackCount]];
  [(MPNowPlayingContentItem *)*p_contentItem setMediaType:[(MPAVItem *)self mediaType]];
  v36 = [(MPAVItem *)self externalContentIdentifier];
  [(MPNowPlayingContentItem *)*p_contentItem setExternalContentIdentifier:v36];

  [(MPContentItem *)*p_contentItem setExplicitContent:[(MPAVItem *)self isExplicitTrack]];
  [(MPNowPlayingContentItem *)*p_contentItem setAlwaysLiveItem:[(MPAVItem *)self isAlwaysLive]];
  v37 = [(MPAVItem *)self modelPlayEvent];
  if ([v37 itemType] == 4)
  {
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke;
    v59[3] = &unk_1E57F9F98;
    id v60 = v37;
    char v61 = self;
    +[MPModelObject performWithoutEnforcement:v59];
  }
  else
  {
    [(MPNowPlayingContentItem *)self->_contentItem setRadioStationName:0];
    [(MPNowPlayingContentItem *)self->_contentItem setRadioStationStringIdentifier:0];
  }
  v38 = [v37 contentItemCollectionInfo];
  v39 = &self->_contentItem;
  [(MPNowPlayingContentItem *)self->_contentItem setCollectionInfo:v38];

  if ([(id)objc_opt_class() isPlaceholder]) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = 3;
  }
  -[MPNowPlayingContentItem setLoading:](self->_contentItem, "setLoading:");
  if ([(MPAVItem *)self isAlwaysLive]) {
    uint64_t v41 = v40 & 2;
  }
  else {
    uint64_t v41 = v40;
  }
  [(MPNowPlayingContentItem *)*v39 setEditingStyleFlags:v41];
  v42 = [(MPAVItem *)self artworkCatalogForPlaybackTime:0.0];
  v43 = *v39;
  if (v42)
  {
    [(MPNowPlayingContentItem *)v43 setHasArtwork:1];
    id v44 = [v42 visualIdenticalityIdentifier];
    if (objc_opt_respondsToSelector())
    {
      v45 = [v44 stringRepresentation];
      if ([v45 length]) {
        [(MPNowPlayingContentItem *)self->_contentItem setArtworkIdentifier:v45];
      }
    }
    if ([v42 hasExportableArtworkProperties])
    {
      v66[0] = @"MRContentItemArtworkFormatStandard";
      uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
      [(MPNowPlayingContentItem *)self->_contentItem setSupportedRemoteArtworkFormats:v46];
    }
    if ([(MPAVItem *)self _shouldPublishArtworkURL])
    {
      int64_t v47 = self->_exportableArtworkRevision + 1;
      self->_exportableArtworkRevision = v47;
      v63.value = 0;
      *(void *)&v63.timescale = &v63;
      v63.epoch = 0x2020000000;
      char v64 = 1;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2;
      v58[3] = &unk_1E57EDFE0;
      v58[5] = &v63;
      v58[6] = v47;
      v58[4] = self;
      [v42 requestExportableArtworkPropertiesWithCompletion:v58];
      *(unsigned char *)(*(void *)&v63.timescale + 24) = 0;
      _Block_object_dispose(&v63, 8);
    }
  }
  else
  {
    [(MPNowPlayingContentItem *)v43 setHasArtwork:0];
    [(MPNowPlayingContentItem *)self->_contentItem setArtworkIdentifier:0];
  }
  v48 = [(MPAVItem *)self libraryLyrics];

  if (v48)
  {
    v49 = [MPNowPlayingInfoLyricsItem alloc];
    id v50 = [(MPAVItem *)self libraryLyrics];
    id v51 = [(MPNowPlayingInfoLyricsItem *)v49 initWithLyrics:v50 userProvided:1];
    [(MPNowPlayingContentItem *)self->_contentItem setLyrics:v51];

    BOOL v52 = 0;
  }
  else
  {
    [(MPNowPlayingContentItem *)self->_contentItem setLyrics:0];
    BOOL v52 = [(MPAVItem *)self hasStoreLyrics];
  }
  v53 = &self->_contentItem;
  [(MPNowPlayingContentItem *)self->_contentItem setHasLyrics:v52];
  uint64_t v54 = [(MPAVItem *)self itemDescription];
  [(MPNowPlayingContentItem *)self->_contentItem setHasDescription:v54 != 0];

  v55 = [(MPAVItem *)self associatedParticipantIdentifier];
  [(MPNowPlayingContentItem *)self->_contentItem setAssociatedParticipantIdentifier:v55];

  [(MPAVItem *)self _updateAudioFormatInfoForContentItem:self->_contentItem];
  uint64_t v56 = [(MPAVItem *)self _contentItemUserInfo];
  [(MPNowPlayingContentItem *)self->_contentItem setUserInfo:v56];

  char v57 = [(MPAVItem *)self _contentItemDeviceSpecificUserInfo];
  [(MPNowPlayingContentItem *)*v53 setDeviceSpecificUserInfo:v57];
}

- (NSNumber)initialPlaybackStartTime
{
  BOOL v3 = [(MPAVItem *)self initialPlaybackStartTimeOverride];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MPAVItem *)self playbackInfoStartTime];
  }
  int64_t v6 = v5;

  return (NSNumber *)v6;
}

- (NSNumber)initialPlaybackStartTimeOverride
{
  return self->_initialPlaybackStartTimeOverride;
}

- (id)artworkCatalogForPlaybackTime:(double)a3
{
  uint64_t v4 = [(MPAVItem *)self artworkCatalogBlock];
  id v5 = (void *)v4;
  if (v4)
  {
    int64_t v6 = (*(void (**)(uint64_t, double))(v4 + 16))(v4, a3);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSNumber)playbackInfoStartTime
{
  BOOL v3 = [(MPAVItem *)self playbackInfo];
  uint64_t v4 = [(MPAVItem *)self _initialPlaybackStartTimeForPlaybackInfo:v3];

  return (NSNumber *)v4;
}

- (NSDictionary)playbackInfo
{
  return self->_playbackInfo;
}

- (id)_initialPlaybackStartTimeForPlaybackInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"MPAVItemPlaybackProperties_NextPlayStartTime"];
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  v8 = [v3 objectForKey:@"MPAVItemPlaybackProperties_StartTime"];

  if (v8)
  {
    [v8 doubleValue];
  }
  else
  {
    double v9 = 0.0;
    if (!v5) {
      goto LABEL_10;
    }
  }
  if (v7 >= v9) {
    double v9 = v7;
  }
  id v5 = [NSNumber numberWithDouble:v9];
LABEL_10:

  return v5;
}

- (unint64_t)mediaType
{
  return 0;
}

- (id)_contentItemUserInfo
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__1212;
  id v51 = __Block_byref_object_dispose__1213;
  id v52 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v4 = [(MPAVItem *)self modelPlayEvent];
  if ([v4 itemType] == 4)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __32__MPAVItem__contentItemUserInfo__block_invoke;
    v32[3] = &unk_1E57F9A58;
    id v33 = v4;
    v36 = &v47;
    v37 = &v43;
    v38 = &v39;
    id v34 = v3;
    v35 = self;
    +[MPModelObject performWithoutEnforcement:v32];
  }
  if ([v4 itemType] == 3)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __32__MPAVItem__contentItemUserInfo__block_invoke_2;
    v29[3] = &unk_1E57F9F98;
    id v30 = v4;
    id v31 = v3;
    +[MPModelObject performWithoutEnforcement:v29];
  }
  if (v44[3])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v5 forKeyedSubscript:@"raTy"];
  }
  if (v40[3])
  {
    double v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v6 forKeyedSubscript:@"raSty"];
  }
  uint64_t v7 = v48[5];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"raAttrLbl"];
  }
  if ([(id)objc_opt_class() isPlaceholder]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"phold"];
  }
  if ([(MPAVItem *)self _shouldPublishArtworkURL]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"supART"];
  }
  if ([(MPAVItem *)self isAssetLoaded])
  {
    v8 = NSNumber;
    [(MPAVItem *)self timeOfSeekableEnd];
    double v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"endT"];
  }
  if ([(MPAVItem *)self shouldShowComposer]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"shComp"];
  }
  if ([(MPAVItem *)self hasStoreLyrics]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hsStLy"];
  }
  if ([(MPAVItem *)self hasTimeSyncedLyrics]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hsTSL"];
  }
  double v10 = [(MPAVItem *)self containerUniqueID];
  if ([v10 length]) {
    [v3 setObject:v10 forKeyedSubscript:@"cntrUID"];
  }
  v11 = [(MPAVItem *)self storeFrontIdentifier];
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"sfid"];
  }
  uint64_t v12 = [(MPAVItem *)self modelGenericObject];
  v13 = [v12 flattenedGenericObject];
  uint64_t v14 = [v13 anyObject];

  if (objc_opt_respondsToSelector())
  {
    v15 = [v14 storeAsset];
    if ([v15 isRedownloadable]) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"rdwn"];
    }
    if ([v15 isSubscriptionRequired]) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"subReq"];
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 isLibraryAddEligible]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"libEligible"];
  }
  int64_t v16 = [(MPAVItem *)self explicitBadge];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    ldiv_t v18 = [(MPAVItem *)self explicitBadge];
    [v3 setObject:v18 forKeyedSubscript:@"ex"];
  }
  uint64_t v19 = +[MPPlaybackUserDefaults standardUserDefaults];
  int v20 = [v19 includeContentItemDebugFields];

  if (v20)
  {
    v21 = NSString;
    v22 = [(MPAVItem *)self storeAccountID];
    uint64_t v23 = [v21 stringWithFormat:@"INTERNALONLY-%@", v22];
    [v3 setObject:v23 forKeyedSubscript:@"acid"];
  }
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[MPAVItem lastChangeDirection](self, "lastChangeDirection"));
  [v3 setObject:v24 forKeyedSubscript:@"lcd"];

  if ([(MPAVItem *)self isAutoPlayItem]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"aPly"];
  }
  if ([(MPAVItem *)self isSharedListeningItem])
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"shLis"];
    v25 = [NSNumber numberWithInteger:self->_explicitContentState];
    [v3 setObject:v25 forKeyedSubscript:@"eConSt"];
  }
  if ([(MPAVItem *)self isArtistUploadedContent]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"arUp"];
  }
  if (MSVDeviceOSIsInternalInstall() && self->_lastPlayPerformanceTime > 0.0)
  {
    v26 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v26 forKeyedSubscript:@"mpp"];
  }
  id v27 = v3;

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v27;
}

- (BOOL)isAssetLoaded
{
  return self->_assetLoaded;
}

- (MPModelPlayEvent)modelPlayEvent
{
  return self->_modelPlayEvent;
}

+ (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)_shouldPublishArtworkURL
{
  if ((MSVDeviceIsAudioAccessory() & 1) == 0 && !MSVDeviceIsAppleTV()) {
    return 0;
  }
  id v3 = [(MPAVItem *)self artworkCatalogForPlaybackTime:0.0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)lastChangeDirection
{
  return self->_lastChangeDirection;
}

- (BOOL)isSharedListeningItem
{
  return self->_sharedListeningItem;
}

- (BOOL)isAutoPlayItem
{
  return self->_autoPlayItem;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSString)itemDescription
{
  return 0;
}

- (BOOL)isInTransition
{
  return 0;
}

- (unint64_t)discNumber
{
  return 0;
}

- (unint64_t)discCount
{
  return 0;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (BOOL)isAlwaysLive
{
  return 0;
}

- (BOOL)hasStoreLyrics
{
  return 0;
}

- (NSString)explicitBadge
{
  return self->_explicitBadge;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (int64_t)storeAlbumArtistID
{
  return 0;
}

- (BOOL)shouldShowComposer
{
  return 0;
}

- (int64_t)reportingAdamID
{
  return 0;
}

- (int64_t)lyricsAdamID
{
  return 0;
}

- (BOOL)isArtistUploadedContent
{
  return 0;
}

- (BOOL)hasTimeSyncedLyrics
{
  return 0;
}

- (NSString)genre
{
  return 0;
}

- (NSString)externalContentIdentifier
{
  return self->_externalContentIdentifier;
}

- (NSString)containerUniqueID
{
  return 0;
}

- (NSString)composer
{
  return 0;
}

- (int64_t)artistStoreID
{
  return 0;
}

- (int64_t)albumYear
{
  return 0;
}

- (unint64_t)albumTrackNumber
{
  return 0;
}

- (unint64_t)albumTrackCount
{
  return 0;
}

- (int64_t)albumStoreID
{
  return self->_albumStoreID;
}

- (NSString)albumArtist
{
  return 0;
}

- (double)_expectedStopTimeWithPlaybackInfo:(id)a3
{
  BOOL v4 = [a3 objectForKey:@"MPAVItemPlaybackProperties_EndTime"];
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
  }
  else
  {
    memset(&v9[1], 0, sizeof(CMTime));
    [(MPAVItem *)self _playerItemDurationIfAvailable];
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v9[0] = v9[1];
      double Seconds = CMTimeGetSeconds(v9);
    }
    else
    {
      [(MPAVItem *)self durationFromExternalMetadata];
    }
  }
  double v7 = Seconds;

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_playerItemDurationIfAvailable
{
  if (BYTE6(self[4].var3))
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var3;
    int64_t v4 = *(void *)&self[6].var1;
LABEL_5:
    retstr->var3 = v4;
    return self;
  }
  self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _durationFromExternalMetadataIfAvailable];
  if (v5 < -2.22044605e-16)
  {
    uint64_t v6 = MEMORY[0x1E4F1F9F0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F0];
    int64_t v4 = *(void *)(v6 + 16);
    goto LABEL_5;
  }

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v5, 1000);
}

- (double)_durationFromExternalMetadataIfAvailable
{
  [(MPAVItem *)self durationFromExternalMetadata];
  if (result < 0.00000011920929) {
    return NAN;
  }
  return result;
}

- (int64_t)likedState
{
  int64_t result = self->_likedState;
  if (!result)
  {
    int64_t result = [(MPAVItem *)self _persistedLikedState];
    self->_likedState = result;
  }
  return result;
}

- (MPNowPlayingContentItem)contentItem
{
  contentItem = self->_contentItem;
  if (!contentItem)
  {
    int64_t v4 = [MPNowPlayingContentItem alloc];
    double v5 = [(MPAVItem *)self contentItemID];
    uint64_t v6 = [(MPContentItem *)v4 initWithIdentifier:v5];
    double v7 = self->_contentItem;
    self->_contentItem = v6;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    CMTime v9[2] = __23__MPAVItem_contentItem__block_invoke;
    v9[3] = &unk_1E57F9EA8;
    v9[4] = self;
    +[MPContentItem performSuppressingChangeNotifications:v9];
    [(MPContentItem *)self->_contentItem postChangeNotificationImmediately:0];
    contentItem = self->_contentItem;
  }

  return contentItem;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(MPAVItem *)self contentItemID];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> (%@)", v4, self, v5];

  return v6;
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

uint64_t __23__MPAVItem_contentItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentItem];
}

- (void)_updateContentItem
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueItemID, 0);
  objc_storeStrong((id *)&self->_queueSectionID, 0);
  objc_storeStrong((id *)&self->_contentItemID, 0);
  objc_storeStrong((id *)&self->_leaseStatus, 0);
  objc_storeStrong((id *)&self->_storeAccountID, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackInfo, 0);
  objc_storeStrong((id *)&self->_rtcReportingServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_lastMetadataChangeTime, 0);
  objc_storeStrong((id *)&self->_initialPlaybackStartTimeOverride, 0);
  objc_storeStrong((id *)&self->_modelPlayEvent, 0);
  objc_storeStrong((id *)&self->_modelGenericObject, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_explicitBadge, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_externalContentIdentifier, 0);
  objc_storeStrong((id *)&self->_copyrightText, 0);
  objc_storeStrong((id *)&self->_closedCaptionTimeMarkers, 0);
  objc_storeStrong((id *)&self->_urlTimeMarkers, 0);
  objc_storeStrong((id *)&self->_artworkTimeMarkers, 0);
  objc_storeStrong((id *)&self->_chapterTimeMarkers, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_itemError, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_pendingContentItemUpdates, 0);
  objc_storeStrong((id *)&self->_adjunctErrors, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_cachedSeekableTimeRanges, 0);
  objc_destroyWeak((id *)&self->_feeder);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setFeeder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_feeder, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setContentItemID:(id)a3 queueSectionID:(id)a4 queueItemID:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  contentItemID = self->_contentItemID;
  id v10 = a5;
  if (![(NSString *)contentItemID isEqualToString:v18])
  {
    v11 = (NSString *)[v18 copy];
    uint64_t v12 = self->_contentItemID;
    self->_contentItemID = v11;

    contentItem = self->_contentItem;
    self->_contentItem = 0;
  }
  uint64_t v14 = (NSString *)[v8 copy];
  queueSectionID = self->_queueSectionID;
  self->_queueSectionID = v14;

  int64_t v16 = (NSString *)[v10 copy];
  queueItemID = self->_queueItemID;
  self->_queueItemID = v16;
}

- (BOOL)supportsRewind
{
  if (![(MPAVItem *)self isAssetLoaded]) {
    return 1;
  }
  id v3 = [(MPAVItem *)self playerItem];
  char v4 = [v3 canPlayFastReverse];

  return v4;
}

- (double)durationIfAvailable
{
  [(MPAVItem *)self playbackMode];
  if (self->_cachedDuration >= 0.00000011920929) {
    return self->_cachedDuration;
  }

  [(MPAVItem *)self _durationFromExternalMetadataIfAvailable];
  return result;
}

- (int64_t)playbackMode
{
  return self->_playbackMode;
}

- (double)_expectedStartTimeWithPlaybackInfo:(id)a3
{
  id v3 = [a3 objectForKey:@"MPAVItemPlaybackProperties_StartTime"];
  char v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)supportsFastForward
{
  if ([(MPAVItem *)self isAssetLoaded])
  {
    id v3 = [(MPAVItem *)self playerItem];
    char v4 = [v3 canPlayFastForward];

    return v4;
  }
  else
  {
    return [(MPAVItem *)self isAlwaysLive];
  }
}

- (void)dealloc
{
  [(MPMediaLibraryPrivacyContext *)self->_privacyContext endAccessInterval];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_MPAVItemInternalLikedStateDidChangeNotification" object:0];
  [(MPAVItem *)self _removeObservationsForAVPlayerItem:self->_avPlayerItem];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];

  v4.receiver = self;
  v4.super_class = (Class)MPAVItem;
  [(MPAVItem *)&v4 dealloc];
}

- (void)_removeObservationsForAVPlayerItem:(id)a3
{
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"duration" context:@"MPAVItemDurationObservationContext"];
  [v5 removeObserver:self forKeyPath:@"loadedTimeRanges" context:@"MPAVItemLoadedTimeRangesObservationContext"];
  [v5 removeObserver:self forKeyPath:@"timebase" context:@"MPAVItemTimebaseObservationContext"];
  if (self->_metadataOutput)
  {
    objc_msgSend(v5, "removeOutput:");
    metadataOutput = self->_metadataOutput;
    self->_metadataOutput = 0;
  }
}

- (void)setLastPlayPerformanceTime:(double)a3
{
  self->_lastPlayPerformanceTime = a3;
  if (MSVDeviceOSIsInternalInstall())
  {
    [(MPAVItem *)self invalidateContentItemUserInfo];
  }
}

void __61__MPAVItem__performContentItemUpdate_debounceWithIdentifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 112));
    [*(id *)(*(void *)(a1 + 40) + 192) removeObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 112));
  }
  v2 = (MPNowPlayingContentItem *)*(id *)(*(void *)(a1 + 40) + 96);
  if (!v2)
  {
    id v3 = [MPNowPlayingContentItem alloc];
    objc_super v4 = [*(id *)(a1 + 40) contentItemID];
    id v5 = [(MPContentItem *)v3 initWithIdentifier:v4];

    v2 = v5;
  }
  double v6 = v2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __41__MPAVItem_invalidateContentItemUserInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _contentItemUserInfo];
  [v3 setUserInfo:v4];
}

- (void)invalidateContentItemUserInfo
{
  if (self->_contentItem)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __41__MPAVItem_invalidateContentItemUserInfo__block_invoke;
    v2[3] = &unk_1E57EE030;
    v2[4] = self;
    [(MPAVItem *)self _performContentItemUpdate:v2 debounceWithIdentifier:@"userInfo"];
  }
}

- (void)_performContentItemUpdate:(id)a3 debounceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_5;
  }
  os_unfair_lock_lock(&self->_lock);
  if (([(NSMutableSet *)self->_pendingContentItemUpdates containsObject:v7] & 1) == 0)
  {
    [(NSMutableSet *)self->_pendingContentItemUpdates addObject:v7];
    os_unfair_lock_unlock(&self->_lock);
LABEL_5:
    id v8 = v7;
    id v9 = v6;
    msv_dispatch_on_main_queue();

    goto LABEL_6;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_6:
}

- (void)setConfiguredForVocalAttenuation:(BOOL)a3
{
  self->_configuredForVocalAttenuation = a3;
}

- (BOOL)isConfiguredForVocalAttenuation
{
  return self->_configuredForVocalAttenuation;
}

- (int64_t)explicitContentState
{
  return self->_explicitContentState;
}

- (void)setOverlappedTransitionDuration:(double)a3
{
  self->_overlappedTransitionDuration = a3;
}

- (double)overlappedTransitionDuration
{
  return self->_overlappedTransitionDuration;
}

- (void)setInOverlappedTransition:(BOOL)a3
{
  self->_inOverlappedTransition = a3;
}

- (ICMusicSubscriptionLeaseStatus)leaseStatus
{
  return self->_leaseStatus;
}

- (int64_t)leasePlaybackPreventionState
{
  return self->_leasePlaybackPreventionState;
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (void)setExternalDisplay:(BOOL)a3
{
  self->_externalDisplay = a3;
}

- (BOOL)hasExternalDisplay
{
  return self->_externalDisplay;
}

- (void)setActiveItem:(BOOL)a3
{
  self->_activeItem = a3;
}

- (BOOL)isActiveItem
{
  return self->_activeItem;
}

- (void)setHasPerformedErrorResolution:(BOOL)a3
{
  self->_hasPerformedErrorResolution = a3;
}

- (BOOL)hasPerformedErrorResolution
{
  return self->_hasPerformedErrorResolution;
}

- (BOOL)hasFinishedDownloading
{
  return self->_hasFinishedDownloading;
}

- (BOOL)requiresLoadedAssetForAirPlayProperties
{
  return self->_requiresLoadedAssetForAirPlayProperties;
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (BOOL)allowsAirPlayFromCloud
{
  return self->_allowsAirPlayFromCloud;
}

- (NSString)rtcReportingServiceIdentifier
{
  return self->_rtcReportingServiceIdentifier;
}

- (void)setLastMetadataChangeTime:(id)a3
{
}

- (BOOL)isHostingSharedSession
{
  return self->_isHostingSharedSession;
}

- (BOOL)shouldPreventPlayback
{
  return self->_shouldPreventPlayback;
}

- (void)setNowPlayingInfoQueueCount:(int64_t)a3
{
  self->_nowPlayingInfoQueueCount = a3;
}

- (int64_t)nowPlayingInfoQueueCount
{
  return self->_nowPlayingInfoQueueCount;
}

- (void)setNowPlayingInfoQueueIndex:(int64_t)a3
{
  self->_nowPlayingInfoQueueIndex = a3;
}

- (int64_t)nowPlayingInfoQueueIndex
{
  return self->_nowPlayingInfoQueueIndex;
}

- (BOOL)hasProtectedContent
{
  return self->_hasProtectedContent;
}

- (void)setLoudnessInfoVolumeNormalization:(float)a3
{
  self->_loudnessInfoVolumeNormalization = a3;
}

- (float)loudnessInfoVolumeNormalization
{
  return self->_loudnessInfoVolumeNormalization;
}

- (BOOL)mediaItemNeedsLoading
{
  return self->_mediaItemNeedsLoading;
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (double)lastPlayPerformanceTime
{
  return self->_lastPlayPerformanceTime;
}

- (int64_t)storeItemInt64ID
{
  return self->_storeItemInt64ID;
}

- (BOOL)supportsLikedState
{
  return self->_supportsLikedState;
}

- (BOOL)isLikedStateEnabled
{
  return self->_likedStateEnabled;
}

- (NSString)copyrightText
{
  return self->_copyrightText;
}

- (BOOL)useEmbeddedChapterData
{
  return self->_useEmbeddedChapterData;
}

- (void)setClosedCaptionTimeMarkers:(id)a3
{
}

- (NSArray)closedCaptionTimeMarkers
{
  return self->_closedCaptionTimeMarkers;
}

- (NSArray)urlTimeMarkers
{
  return self->_urlTimeMarkers;
}

- (NSArray)artworkTimeMarkers
{
  return self->_artworkTimeMarkers;
}

- (NSArray)chapterTimeMarkers
{
  return self->_chapterTimeMarkers;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (void)setItemError:(id)a3
{
}

- (NSError)itemError
{
  return self->_itemError;
}

- (BOOL)canReusePlayerItem
{
  return self->_canReusePlayerItem;
}

- (BOOL)didAttemptToLoadAsset
{
  return self->_didAttemptToLoadAsset;
}

- (MPAVItemObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MPAVItemObserver *)WeakRetained;
}

- (float)soundCheckVolumeNormalization
{
  return self->_soundCheckVolumeNormalization;
}

- (BOOL)isPreloadedAsset
{
  return self->_isPreloadedAsset;
}

- (void)setIsAssetLoaded:(BOOL)a3
{
  self->_isAssetLoaded = a3;
}

- (void)setDefaultPlaybackRate:(float)a3
{
  self->_defaultPlaybackRate = a3;
}

- (float)_currentPlaybackRate
{
  return self->_currentPlaybackRate;
}

- (void)clearAdjunctErrors
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  adjunctErrors = self->_adjunctErrors;
  self->_adjunctErrors = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)addAdjunctError:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPAVItem.m" lineNumber:1987 description:@"Error must be nonnil"];
  }
  os_unfair_lock_lock(&self->_lock);
  adjunctErrors = self->_adjunctErrors;
  if (adjunctErrors)
  {
    [(NSMutableArray *)adjunctErrors addObject:v9];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
    id v7 = self->_adjunctErrors;
    self->_adjunctErrors = v6;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)adjunctErrors
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableArray *)self->_adjunctErrors copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (BOOL)supportsVocalAttenuation
{
  return 0;
}

- (id)analyticsFormatType
{
  return &stru_1EE680640;
}

- (id)analyticsContentType
{
  return @"unknown";
}

- (void)_willResignActivePlayerItem
{
  self->_activeItem = 0;
}

- (void)_willBecomeActivePlayerItem
{
  self->_canReusePlayerItem = 0;
  self->_activeItem = 1;
}

- (void)_updateHasFinishedDownloading
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_hasFinishedDownloading && [(MPAVItem *)self isAssetLoaded])
  {
    id v3 = [(MPAVItem *)self playerItem];
    id v4 = [v3 asset];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v4 URL],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isFileURL],
          v5,
          v6))
    {
      self->_hasFinishedDownloading = 1;
    }
    else
    {
      long long v10 = 0uLL;
      uint64_t v11 = 0;
      if (v3) {
        [v3 duration];
      }
      if (!self->_hasFinishedDownloading) {
        goto LABEL_10;
      }
    }
    id v7 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v8, v9[0]);
    [v7 postNotificationName:@"MPAVItemHasFinishedDownloadingDidChangeNotification" object:self];

LABEL_10:
  }
}

- (void)resolvePlaybackError:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(MPAVItem *)self feeder];
  id v9 = [v8 errorResolverForItem:self];
  if (v9)
  {
    long long v10 = [[MPAVErrorResolverBlockHandler alloc] initWithErrorResolver:v9];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__MPAVItem_resolvePlaybackError_withCompletion___block_invoke;
    v11[3] = &unk_1E57F74E8;
    id v12 = v7;
    [(MPAVErrorResolverBlockHandler *)v10 setResolutionHandler:v11];
    [(MPAVErrorResolverBlockHandler *)v10 resolveError:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

uint64_t __48__MPAVItem_resolvePlaybackError_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
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

- (void)replacePlayerItemWithPlayerItem:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"MPAVItemPlayerItemWillChangeNotification" object:self];

  assetQueue = self->_assetQueue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __44__MPAVItem_replacePlayerItemWithPlayerItem___block_invoke;
  id v12 = &unk_1E57F9F98;
  v13 = self;
  id v14 = v4;
  id v7 = v4;
  dispatch_sync(assetQueue, &v9);
  long long v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v9, v10, v11, v12, v13);
  [v8 postNotificationName:@"MPAVItemPlayerItemDidChangeNotification" object:self];

  [(MPAVItem *)self _updateSoundCheckVolumeNormalizationForPlayerItem];
  [(MPAVItem *)self updatePlayerItemMetadata];
}

uint64_t __44__MPAVItem_replacePlayerItemWithPlayerItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlayerItem:*(void *)(a1 + 40)];
}

- (void)reevaluateType
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPAVItem *)self asset];
  id v4 = [(MPAVItem *)self _imageChapterTrackIDsForAsset:v3];

  if ([(MPAVItem *)self isAssetLoaded])
  {
    id v5 = [(MPAVItem *)self playerItem];
    int v6 = [v5 hasVideo];

    if (v6)
    {
      id v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t type = self->_type;
        if (type >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown - %ld", self->_type);
          uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v9 = off_1E57EE078[type];
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v9;
        __int16 v40 = 2114;
        uint64_t v41 = @"Video";
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Updating item type [hasVideo]: %{public}@ -> %{public}@", buf, 0x16u);
      }
      int64_t v10 = 2;
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v11 = [(MPAVItem *)self playerItem];
      id v7 = [v11 tracks];

      uint64_t v12 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        int64_t v10 = 0;
        uint64_t v14 = *(void *)v34;
        uint64_t v31 = *MEMORY[0x1E4F15C18];
        uint64_t v32 = *MEMORY[0x1E4F15BA8];
        uint64_t v29 = *MEMORY[0x1E4F15C00];
        uint64_t v30 = *MEMORY[0x1E4F15BF0];
        uint64_t v28 = *MEMORY[0x1E4F15BC8];
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v7);
            }
            int64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v17 = [v16 assetTrack];
            if ([v16 isEnabled])
            {
              id v18 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(v17, "trackID"));
              char v19 = [v4 containsObject:v18];

              if ((v19 & 1) == 0)
              {
                int v20 = v4;
                v21 = [v17 mediaType];
                if ([v21 isEqualToString:v32])
                {
                  if (v10 <= 0)
                  {
                    v22 = os_log_create("com.apple.amp.mediaplayer", "Playback");
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      unint64_t v23 = self->_type;
                      if (v23 >= 3)
                      {
                        objc_msgSend(NSString, "stringWithFormat:", @"Unknown - %ld", self->_type);
                        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        uint64_t v24 = off_1E57EE078[v23];
                      }
                      *(_DWORD *)buf = 138543618;
                      uint64_t v39 = v24;
                      __int16 v40 = 2114;
                      uint64_t v41 = @"Audio";
                      _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_DEFAULT, "Updating item type [tracks]: %{public}@ -> %{public}@", buf, 0x16u);
                    }
                  }
                  int64_t v10 = 1;
                }
                else if (([v21 isEqualToString:v31] & 1) != 0 {
                       || ([v21 isEqualToString:v30] & 1) != 0
                }
                       || ([v21 isEqualToString:v29] & 1) != 0
                       || [v21 isEqualToString:v28])
                {
                  v25 = os_log_create("com.apple.amp.mediaplayer", "Playback");
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    unint64_t v26 = self->_type;
                    if (v26 >= 3)
                    {
                      objc_msgSend(NSString, "stringWithFormat:", @"Unknown - %ld", self->_type);
                      id v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      id v27 = off_1E57EE078[v26];
                    }
                    *(_DWORD *)buf = 138543618;
                    uint64_t v39 = v27;
                    __int16 v40 = 2114;
                    uint64_t v41 = @"Video";
                    _os_log_impl(&dword_1952E8000, v25, OS_LOG_TYPE_DEFAULT, "Updating item type [tracks]: %{public}@ -> %{public}@", buf, 0x16u);
                  }
                  int64_t v10 = 2;
                  id v4 = v20;
                  goto LABEL_42;
                }

                id v4 = v20;
              }
            }
          }
          uint64_t v13 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      else
      {
        int64_t v10 = 0;
      }
    }
LABEL_42:
  }
  else
  {
    int64_t v10 = 0;
  }
  [(MPAVItem *)self willChangeValueForKey:@"type"];
  self->_unint64_t type = v10;
  [(MPAVItem *)self didChangeValueForKey:@"type"];
}

- (void)reevaluateHasProtectedContent
{
  if (!self->_hasLoadedHasProtectedContent && [(MPAVItem *)self isAssetLoaded])
  {
    uint64_t v3 = [(MPAVItem *)self playerItem];
    uint64_t v4 = [v3 status];

    if (v4 == 1)
    {
      self->_hasLoadedHasProtectedContent = 1;
      self->_hasProtectedContent = [(AVAsset *)self->_asset hasProtectedContent];
    }
  }
}

- (void)invalidateContentItemAudioFormatInfo
{
  if (self->_contentItem)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __48__MPAVItem_invalidateContentItemAudioFormatInfo__block_invoke;
    v2[3] = &unk_1E57EE030;
    v2[4] = self;
    [(MPAVItem *)self _performContentItemUpdate:v2 debounceWithIdentifier:@"audioFormatInfo"];
  }
}

uint64_t __48__MPAVItem_invalidateContentItemAudioFormatInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateAudioFormatInfoForContentItem:a2];
}

- (void)invalidateContentItemDeviceSpecificUserInfo
{
  if (self->_contentItem)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __55__MPAVItem_invalidateContentItemDeviceSpecificUserInfo__block_invoke;
    v2[3] = &unk_1E57EE030;
    v2[4] = self;
    [(MPAVItem *)self _performContentItemUpdate:v2 debounceWithIdentifier:@"deviceSpecificUserInfo"];
  }
}

void __55__MPAVItem_invalidateContentItemDeviceSpecificUserInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _contentItemDeviceSpecificUserInfo];
  [v3 setDeviceSpecificUserInfo:v4];
}

- (void)setExplicitContentState:(int64_t)a3
{
  if (self->_explicitContentState != a3)
  {
    self->_explicitContentState = a3;
    [(MPAVItem *)self invalidateContentItemUserInfo];
  }
}

- (void)setSharedListeningItem:(BOOL)a3
{
  if (self->_sharedListeningItem != a3)
  {
    self->_sharedListeningItem = a3;
    [(MPAVItem *)self invalidateContentItemUserInfo];
  }
}

- (void)_setNeedsPersistedLikedStateUpdate
{
  int64_t likedState = self->_likedState;
  self->_int64_t likedState = 0;
  if (likedState)
  {
    int64_t v4 = [(MPAVItem *)self likedState];
    if (likedState != v4)
    {
      self->_int64_t likedState = v4;
      [(MPAVItem *)self _likedStateDidChange];
    }
  }
}

- (void)_setCurrentPlaybackRate:(float)a3
{
  if (vabds_f32(self->_currentPlaybackRate, a3) > 0.00000011921)
  {
    self->_currentPlaybackRate = a3;
    -[MPAVItem _currentPlaybackRateDidChange:](self, "_currentPlaybackRateDidChange:");
  }
}

- (int64_t)_persistedLikedState
{
  return 0;
}

- (void)_updateDurationSnapshotWithElapsedTime:(double)a3 playbackRate:(float)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__MPAVItem__updateDurationSnapshotWithElapsedTime_playbackRate___block_invoke;
  v4[3] = &unk_1E57EE008;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  float v5 = a4;
  [(MPAVItem *)self _performContentItemUpdate:v4 debounceWithIdentifier:@"durationSnapshot"];
}

void __64__MPAVItem__updateDurationSnapshotWithElapsedTime_playbackRate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(v6, "setInTransition:", objc_msgSend(*(id *)(a1 + 32), "isInTransition"));
  objc_msgSend(v6, "setAlwaysLiveItem:", objc_msgSend(*(id *)(a1 + 32), "isAlwaysLive"));
  LODWORD(v3) = *(_DWORD *)(a1 + 48);
  [v6 setElapsedTime:*(double *)(a1 + 40) playbackRate:v3];
  [*(id *)(a1 + 32) defaultPlaybackRate];
  objc_msgSend(v6, "setDefaultPlaybackRate:");
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 202))
  {
    if ([*(id *)(v4 + 24) isPlaybackBufferFull]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) isPlaybackLikelyToKeepUp] ^ 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  [v6 setLoading:v5];
}

- (void)setupWithPlaybackInfo
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ([(MPAVItem *)self isAssetLoaded])
  {
    double v3 = [(MPAVItem *)self playerItem];
    uint64_t v4 = [(MPAVItem *)self playbackInfo];
    uint64_t v5 = [(MPAVItem *)self initialPlaybackStartTimeOverride];
    id v6 = v5;
    if (v5)
    {
      [v5 doubleValue];
      Float64 v8 = v7;
    }
    else
    {
      uint64_t v9 = [(MPAVItem *)self _initialPlaybackStartTimeForPlaybackInfo:v4];
      [v9 doubleValue];
      Float64 v8 = v10;
    }
    long long v48 = 0uLL;
    uint64_t v49 = 0;
    if (v3) {
      [v3 currentTime];
    }
    uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(MPAVItem *)self initialPlaybackStartTimeOverride];
      LODWORD(buf.value) = 138543874;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2048;
      *(Float64 *)((char *)&buf.flags + 2) = v8;
      HIWORD(buf.epoch) = 1024;
      BOOL v51 = v12 != 0;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Seeking to start time: %f [override: %{BOOL}u]", (uint8_t *)&buf, 0x1Cu);
    }
    CMTimeMakeWithSeconds(&v47, v8, 10000);
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime v46 = buf;
    [v3 seekToTime:&v47 toleranceBefore:&buf toleranceAfter:&v46 completionHandler:0];
    uint64_t v13 = [v4 objectForKey:@"MPAVItemPlaybackProperties_EndTime"];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 doubleValue];
      Float64 v16 = v15;
      uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
        LOWORD(buf.flags) = 2048;
        *(Float64 *)((char *)&buf.flags + 2) = v16;
        _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting forward playback end time to: %f", (uint8_t *)&buf, 0x16u);
      }

      CMTimeMakeWithSeconds(&v45, v16, 10000);
      CMTime v44 = v45;
      [v3 setForwardPlaybackEndTime:&v44];
    }
    id v18 = [v4 objectForKey:@"MPAVItemPlaybackProperties_AudibleDRMGroupID"];

    if (v18)
    {
      char v19 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v18;
        _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting Audible DRM info: %{public}@", (uint8_t *)&buf, 0x16u);
      }

      int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v18 forKey:@"AudibleDRMInfoGroupID"];
      [v3 _setAudibleDRMInfo:v20];
    }
    uint64_t v21 = [v4 objectForKey:@"AVItemPlaybackProperties_RampInDuration"];

    if (v21) {
      id v22 = (id)v21;
    }
    unint64_t v23 = [v4 objectForKey:@"MPAVItemPlaybackProperties_RampInDuration"];

    if (v23)
    {
      id v24 = v23;

      uint64_t v21 = (uint64_t)v24;
    }
    uint64_t v25 = [v4 objectForKey:@"AVItemPlaybackProperties_RampOutDuration"];

    if (v25) {
      id v26 = (id)v25;
    }
    id v27 = [v4 objectForKey:@"MPAVItemPlaybackProperties_RampOutDuration"];

    if (v27)
    {
      id v28 = v27;

      BOOL v29 = v21 != 0;
      BOOL v30 = 1;
      uint64_t v25 = (uint64_t)v28;
    }
    else
    {
      BOOL v29 = v21 != 0;
      BOOL v30 = v25 != 0;
      if (!(v21 | v25))
      {
        uint64_t v25 = 0;
LABEL_35:
        if ((*((unsigned char *)self + 108) & 4) == 0)
        {
          objc_initWeak((id *)&buf, self);
          long long v34 = [(MPAVItem *)self asset];
          long long v35 = [v4 objectForKey:@"MPAVItemPlaybackProperties_LookForLyrics"];
          int v36 = [v35 BOOLValue];

          if (v36)
          {
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __33__MPAVItem_setupWithPlaybackInfo__block_invoke;
            v41[3] = &unk_1E57EF050;
            objc_copyWeak(&v43, (id *)&buf);
            id v42 = v34;
            [v42 loadValuesAsynchronouslyForKeys:&unk_1EE6ED5B0 completionHandler:v41];

            objc_destroyWeak(&v43);
          }
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __33__MPAVItem_setupWithPlaybackInfo__block_invoke_3;
          v38[3] = &unk_1E57EF050;
          objc_copyWeak(&v40, (id *)&buf);
          id v37 = v34;
          id v39 = v37;
          [v37 loadValuesAsynchronouslyForKeys:&unk_1EE6ED5C8 completionHandler:v38];
          *((unsigned char *)self + 108) |= 4u;

          objc_destroyWeak(&v40);
          objc_destroyWeak((id *)&buf);
        }

        goto LABEL_40;
      }
    }
    uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v32 = v31;
    if (v29) {
      [v31 setObject:v21 forKey:@"RampInOutInfoInDuration"];
    }
    if (v30) {
      [v32 setObject:v25 forKey:@"RampInOutInfoOutDuration"];
    }
    long long v33 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138543618;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2114;
      *(void *)((char *)&buf.flags + 2) = v27;
      _os_log_impl(&dword_1952E8000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting ramp in/out info: %{public}@", (uint8_t *)&buf, 0x16u);
    }

    [v3 _setRampInOutInfo:v32];
    goto LABEL_35;
  }
  double v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    LODWORD(buf.value) = 138543362;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_FAULT, "%{public}@: setupPlaybackInfo called without an asset loaded", (uint8_t *)&buf, 0xCu);
  }
LABEL_40:
}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v3, (id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  msv_dispatch_on_main_queue();

  objc_destroyWeak(&v3);
}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&v3, (id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  msv_dispatch_on_main_queue();

  objc_destroyWeak(&v3);
}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isAssetLoaded]
    && [*(id *)(a1 + 32) statusOfValueForKey:@"duration" error:0] == 2)
  {
    [WeakRetained _itemAttributeAvailableKey:@"duration"];
  }
}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isAssetLoaded]
    && [*(id *)(a1 + 32) statusOfValueForKey:@"lyrics" error:0] == 2)
  {
    [WeakRetained _itemAttributeAvailableKey:@"lyrics"];
  }
}

- (void)setupEQPresetWithDefaultPreset:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(MPAVItem *)self isAssetLoaded])
  {
    int64_t v5 = [(MPAVItem *)self customAVEQPreset];
    if (!v5)
    {
      if ([(MPAVItem *)self allowsEQ]) {
        int64_t v5 = a3;
      }
      else {
        int64_t v5 = 0;
      }
    }
    id v6 = [(MPAVItem *)self playerItem];
    [v6 _setEQPreset:v5];

    double v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      Float64 v8 = [(MPAVItem *)self playerItem];
      int v9 = 138543618;
      double v10 = v8;
      __int16 v11 = 1024;
      int v12 = v5;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Setting item %{public}@ EQ to %d", (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    double v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 138543362;
      double v10 = self;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_FAULT, "%{public}@: setupEQPresetWithDefaultPreset called without an asset loaded", (uint8_t *)&v9, 0xCu);
    }
  }
}

void __46__MPAVItem__contentItemDeviceSpecificUserInfo__block_invoke(uint64_t a1)
{
  id v16 = [*(id *)(a1 + 32) playlist];
  if ([v16 isLibraryAdded]) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"colLibAdded"];
  }
  id v2 = [v16 identifiers];
  id v3 = [v2 library];
  uint64_t v4 = [v3 persistentID];

  if (v4)
  {
    int64_t v5 = NSNumber;
    id v6 = [v16 identifiers];
    double v7 = [v6 library];
    Float64 v8 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:@"ppid"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  int v9 = [v16 identifiers];
  double v10 = [v9 personalizedStore];
  uint64_t v11 = [v10 cloudID];

  if (v11)
  {
    int v12 = NSNumber;
    uint64_t v13 = [v16 identifiers];
    uint64_t v14 = [v13 personalizedStore];
    double v15 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v14, "cloudID"));
    [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:@"pclid"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __32__MPAVItem__contentItemUserInfo__block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) radioStation];
  uint64_t v2 = [v9 attributionLabel];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v9 type];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v9 subtype];
  int64_t v5 = [v9 providerUniversalLink];
  id v6 = [v5 absoluteString];
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"raPUL"];

  double v7 = [v9 providerBundleIdentifier];
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"raBID"];

  Float64 v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "stationProviderID"));
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:@"raPrID"];
}

void __32__MPAVItem__contentItemUserInfo__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) playlist];
  if ([v3 isCollaborative]) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"piclb"];
  }
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "collaboratorStatus"));
  [*(id *)(a1 + 40) setObject:v2 forKeyedSubscript:@"pclbStatus"];
}

void __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) radioStation];
  uint64_t v2 = [v6 name];
  [*(id *)(*(void *)(a1 + 40) + 96) setRadioStationName:v2];

  id v3 = [v6 identifiers];
  uint64_t v4 = [v3 radio];
  int64_t v5 = [v4 stationStringID];

  [*(id *)(*(void *)(a1 + 40) + 96) setRadioStationStringIdentifier:v5];
}

void __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed to get exportable URL with error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_257;
    v15[3] = &unk_1E57EDFB8;
    uint64_t v8 = a1[4];
    uint64_t v17 = a1[6];
    v15[4] = v8;
    id v9 = v5;
    id v16 = v9;
    double v10 = (void (**)(void, void))MEMORY[0x19971E0F0](v15);
    uint64_t v11 = v10;
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      ((void (**)(void, id))v10)[2](v10, v9);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2_259;
      block[3] = &unk_1E57F9140;
      uint64_t v14 = v10;
      id v13 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_257(uint64_t a1)
{
  if (*(void *)(a1 + 48) == *(void *)(*(void *)(a1 + 32) + 160))
  {
    uint64_t v2 = [*(id *)(a1 + 40) resolvedURLString];
    uint64_t v3 = [v2 length];

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 40) resolvedURLString];
      [*(id *)(*(void *)(a1 + 32) + 96) setArtworkURL:v4];
    }
    id v5 = [*(id *)(a1 + 40) artworkTemplateItems];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) artworkTemplateItems];
      [*(id *)(*(void *)(a1 + 32) + 96) setArtworkURLTemplates:v7];
    }
  }
}

uint64_t __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2_259(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_pickupContentItemFrom:(id)a3
{
  uint64_t v11 = (id *)a3;
  id v5 = [(MPAVItem *)self contentItemID];
  uint64_t v6 = [v11 contentItemID];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [v11 contentItemID];
    double v10 = [(MPAVItem *)self contentItemID];
    [v8 handleFailureInMethod:a2, self, @"MPAVItem.m", 1145, @"fromItem contentItemID %@ does not match this item %@", v9, v10 object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_contentItem, v11[12]);
}

- (void)_clearAssetNow
{
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__MPAVItem__clearAssetNow__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_sync(assetQueue, block);
}

uint64_t __26__MPAVItem__clearAssetNow__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = 0;

    uint64_t result = [*(id *)(v2 + 32) setPlayerItem:0];
    *(unsigned char *)(*(void *)(v2 + 32) + 202) = 0;
    *(unsigned char *)(*(void *)(v2 + 32) + 32) = 0;
  }
  return result;
}

- (void)_copyPlayerItem
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetQueue);
  if (![(MPAVItem *)self isAssetLoaded])
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"MPAVItem.m" lineNumber:1128 description:@"Asset must be already loaded to copy player item"];
  }
  id v5 = [(AVPlayerItem *)self->_avPlayerItem copy];
  [(MPAVItem *)self setPlayerItem:v5];
}

- (void)_updateSoundCheckVolumeNormalizationForPlayerItem
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(MPAVItem *)self isAssetLoaded])
  {
    float v3 = fabsf(self->_soundCheckVolumeNormalization);
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3 <= 0.00000011921)
    {
      if (v5)
      {
        double soundCheckVolumeNormalization = self->_soundCheckVolumeNormalization;
        double v10 = [(MPAVItem *)self playerItem];
        int v11 = 138543874;
        int v12 = self;
        __int16 v13 = 2048;
        double v14 = soundCheckVolumeNormalization;
        __int16 v15 = 2114;
        id v16 = v10;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring volume normalization %f on %{public}@", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      if (v5)
      {
        double v6 = self->_soundCheckVolumeNormalization;
        char v7 = [(MPAVItem *)self playerItem];
        int v11 = 138543874;
        int v12 = self;
        __int16 v13 = 2048;
        double v14 = v6;
        __int16 v15 = 2114;
        id v16 = v7;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting volume normalization to %f on %{public}@", (uint8_t *)&v11, 0x20u);
      }
      *(float *)&double v8 = self->_soundCheckVolumeNormalization;
      [(AVPlayerItem *)self->_avPlayerItem setSoundCheckVolumeNormalization:v8];
    }
  }
}

- (void)_loadAssetProperties
{
  asset = self->_asset;
  if (asset) {
    [(AVAsset *)asset loadValuesAsynchronouslyForKeys:&unk_1EE6ED598 completionHandler:0];
  }
}

- (double)_playableDurationForLoadedTimeRanges:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    memset(&v11, 0, sizeof(v11));
    BOOL v5 = [v4 objectAtIndex:0];
    double v6 = v5;
    if (v5) {
      [v5 CMTimeRangeValue];
    }
    else {
      memset(&v11, 0, sizeof(v11));
    }

    CMTimeRange v9 = v11;
    CMTimeRangeGetEnd(&time, &v9);
    Float64 Seconds = CMTimeGetSeconds(&time);
    self->_cachedPlayableDuration = Seconds;
  }
  else
  {
    self->_cachedPlayableDuration = NAN;
    Float64 Seconds = NAN;
  }

  return Seconds;
}

- (id)_seekableTimeRanges
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  if ([(MPAVItem *)self isAssetLoaded] && v4 - self->_seekableTimeRangesCacheTime > 0.2)
  {
    BOOL v5 = [(MPAVItem *)self playerItem];
    double v6 = [v5 seekableTimeRanges];
    char v7 = (NSArray *)[v6 copy];
    cachedSeekableTimeRanges = self->_cachedSeekableTimeRanges;
    self->_cachedSeekableTimeRanges = v7;

    self->_seekableTimeRangesCacheTime = v4;
  }
  CMTimeRange v9 = self->_cachedSeekableTimeRanges;

  return v9;
}

- (void)_likedStateDidChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_MPAVItemInternalLikedStateDidChangeNotification" object:self];
  [v3 postNotificationName:@"MPAVItemLikedStateDidChangeNotification" object:self];
}

- (void)_addObservationsForAVPlayerItem:(id)a3
{
  id v6 = a3;
  [v6 addObserver:self forKeyPath:@"duration" options:3 context:@"MPAVItemDurationObservationContext"];
  [v6 addObserver:self forKeyPath:@"loadedTimeRanges" options:3 context:@"MPAVItemLoadedTimeRangesObservationContext"];
  [v6 addObserver:self forKeyPath:@"timebase" options:7 context:@"MPAVItemTimebaseObservationContext"];
  if ([(MPAVItem *)self conformsToProtocol:&unk_1EE78DE08])
  {
    double v4 = (AVPlayerItemMetadataOutput *)[objc_alloc(MEMORY[0x1E4F16638]) initWithIdentifiers:0];
    metadataOutput = self->_metadataOutput;
    self->_metadataOutput = v4;

    [(AVPlayerItemMetadataOutput *)self->_metadataOutput setDelegate:self queue:MEMORY[0x1E4F14428]];
    [v6 addOutput:self->_metadataOutput];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = v12;
  if (a6 == @"MPAVItemLoadedTimeRangesObservationContext")
  {
    double v14 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
    [(MPAVItem *)self _playableDurationForLoadedTimeRanges:v14];

    [(MPAVItem *)self _updateHasFinishedDownloading];
  }
  else if (a6 == @"MPAVItemDurationObservationContext")
  {
    __int16 v15 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
    id v16 = v15;
    if (v15)
    {
      [v15 CMTimeValue];
    }
    else
    {
      long long v26 = 0uLL;
      int64_t v27 = 0;
    }
    *(_OWORD *)&self->_playerItemDuration.value = v26;
    self->_playerItemDuration.epoch = v27;

    self->_hasValidPlayerItemDuration = 1;
    [(MPAVItem *)self _updateHasFinishedDownloading];
    long long v26 = 0uLL;
    int64_t v27 = 0;
    [(MPAVItem *)self _playerItemDurationIfAvailable];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v23[3] = &__block_descriptor_56_e33_v16__0__MPNowPlayingContentItem_8l;
    long long v24 = v26;
    int64_t v25 = v27;
    [(MPAVItem *)self _performContentItemUpdate:v23 debounceWithIdentifier:@"duration"];
  }
  else if (a6 == @"MPAVItemTimebaseObservationContext")
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    uint64_t v21 = &unk_1E57F9EA8;
    id v22 = self;
    msv_dispatch_on_main_queue();
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MPAVItem;
    [(MPAVItem *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Seconds = 0.0;
  if ((*(_DWORD *)(a1 + 44) & 0x1D) == 1)
  {
    CMTime v5 = *(CMTime *)(a1 + 32);
    double Seconds = CMTimeGetSeconds(&v5);
  }
  [v3 setDuration:Seconds];
}

void __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPAVItemTimebaseDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_itemAttributeAvailableKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"lyrics"])
  {
    CMTime v5 = [(MPAVItem *)self asset];
    id v6 = [v5 lyrics];

    *((unsigned char *)self + 108) |= 8u;
    if (v6)
    {
      char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"MPAVItemDisplayableTextAvailableNotification" object:self userInfo:0];
    }
LABEL_9:

    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"duration"])
  {
    double v8 = [(MPAVItem *)self asset];
    CMTimeRange v9 = v8;
    if (v8) {
      [v8 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    self->_cachedDuration = CMTimeGetSeconds(&time);

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MPAVItemDurationAvailableNotification" object:self];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_internalLikedStateDidChangeNotification:(id)a3
{
  id v4 = [a3 object];
  if (v4 != self)
  {
    char v7 = v4;
    int v5 = [(MPAVItem *)self isEqual:v4];
    id v4 = v7;
    if (v5)
    {
      int64_t v6 = [(MPAVItem *)v7 likedState];
      id v4 = v7;
      self->_int64_t likedState = v6;
    }
  }
}

- (double)timeOfSeekableEnd
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(MPAVItem *)self _seekableTimeRanges];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        memset(&v13, 0, sizeof(v13));
        if (v8) {
          [v8 CMTimeRangeValue];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        CMTimeRangeGetEnd(&v13, &range);
        if ((v13.flags & 0x1D) == 1)
        {
          CMTime v11 = v13;
          double Seconds = CMTimeGetSeconds(&v11);

          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  double Seconds = self->_cachedDuration;
LABEL_14:

  return Seconds;
}

- (double)timeOfSeekableStart
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [(MPAVItem *)self _seekableTimeRanges];
  memset(v7, 0, sizeof(v7));
  if ([v2 countByEnumeratingWithState:v7 objects:v8 count:16])
  {
    if (**((void **)&v7[0] + 1)) {
      [**((id **)&v7[0] + 1) CMTimeRangeValue];
    }
    else {
      memset(&v5, 0, sizeof(v5));
    }
    CMTime time = v5;
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    double Seconds = 0.0;
  }

  return Seconds;
}

- (OpaqueCMTimebase)timebase
{
  if (![(MPAVItem *)self isAssetLoaded]) {
    return 0;
  }
  id v3 = [(MPAVItem *)self playerItem];
  uint64_t v4 = (OpaqueCMTimebase *)[v3 timebase];

  return v4;
}

- (double)playableDurationIfAvailable
{
  return self->_cachedPlayableDuration;
}

- (double)playableDuration
{
  return self->_cachedPlayableDuration;
}

- (BOOL)durationIsValid
{
  return 1;
}

- (double)durationFromExternalMetadata
{
  return NAN;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  uint64_t v4 = [(MPAVItem *)self asset];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 duration];
    uint64_t v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (NSString)personID
{
  return 0;
}

- (NSString)databaseID
{
  return 0;
}

- (float)userRating
{
  return 0.0;
}

- (id)_imageChapterTrackIDsForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVAsset *)self->_asset statusOfValueForKey:@"trackReferences" error:0];
  uint64_t v6 = 0;
  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    char v7 = [v4 trackReferences];
    double v8 = [v7 objectForKey:*MEMORY[0x1E4F15620]];
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v9 = *MEMORY[0x1E4F15C18];
      unint64_t v10 = 1;
      do
      {
        CMTime v11 = [v8 objectAtIndex:v10];
        id v12 = objc_msgSend(v4, "trackWithTrackID:", objc_msgSend(v11, "intValue"));
        CMTime v13 = [v12 mediaType];
        int v14 = [v13 isEqualToString:v9];

        if (v14) {
          [v6 addObject:v11];
        }

        v10 += 2;
      }
      while (v10 < [v8 count]);
    }
  }

  return v6;
}

- (int64_t)stationProviderID
{
  return 0;
}

- (NSString)stationStringID
{
  return (NSString *)&stru_1EE680640;
}

- (NSString)stationName
{
  return (NSString *)&stru_1EE680640;
}

- (NSString)stationHash
{
  return (NSString *)&stru_1EE680640;
}

- (int64_t)stationID
{
  return 0;
}

- (NSArray)timedMetadataIfAvailable
{
  return 0;
}

- (BOOL)supportsRating
{
  id v3 = [(MPAVItem *)self mediaItem];
  id v4 = [v3 objectForKeyedSubscript:@"isInMyLibrary"];
  char v5 = [v4 BOOLValue];

  uint64_t v6 = [(MPAVItem *)self mediaItem];
  char v7 = [v6 objectForKeyedSubscript:@"storeSagaID"];
  uint64_t v8 = [v7 longLongValue];

  uint64_t v9 = [(MPAVItem *)self mediaItem];
  unint64_t v10 = [v9 mediaLibrary];

  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v5;
  }
  return v10 && v11;
}

- (NSString)storeItemID
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t quot = [(MPAVItem *)self storeItemInt64ID];
  if (quot)
  {
    id v3 = quot;
    id v4 = (char *)&v9 + 1;
    do
    {
      lldiv_t v5 = lldiv((uint64_t)quot, 10);
      int64_t quot = (__CFString *)v5.quot;
      if (v5.rem >= 0) {
        LOBYTE(v6) = v5.rem;
      }
      else {
        uint64_t v6 = -v5.rem;
      }
      *(v4 - 2) = v6 + 48;
      char v7 = (const UInt8 *)(v4 - 2);
      --v4;
    }
    while (v5.quot);
    if (((unint64_t)v3 & 0x8000000000000000) != 0)
    {
      *(v4 - 2) = 45;
      char v7 = (const UInt8 *)(v4 - 2);
    }
    int64_t quot = (__CFString *)CFStringCreateWithBytes(0, v7, (char *)&v9 - (char *)v7, 0x8000100u, 0);
  }

  return (NSString *)quot;
}

- (void)setSoundCheckVolumeNormalization:(float)a3
{
  if (self->_soundCheckVolumeNormalization != a3)
  {
    self->_double soundCheckVolumeNormalization = a3;
    [(MPAVItem *)self _updateSoundCheckVolumeNormalizationForPlayerItem];
  }
}

- (void)setLikedState:(int64_t)a3 forUserIdentity:(id)a4
{
  id v6 = a4;
  if ([(MPAVItem *)self likedState] != a3)
  {
    self->_int64_t likedState = a3;
    [(MPAVItem *)self _likedStateDidChange];
    [(MPAVItem *)self _handleUpdatedLikedState:a3 forUserIdentity:v6 completion:&__block_literal_global_1237];
  }
}

- (void)setLikedState:(int64_t)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime
{
  uint64_t result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(MPAVItem *)self isAssetLoaded];
  if (result)
  {
    id v6 = [(MPAVItem *)self playerItem];
    if (v6)
    {
      uint64_t v8 = v6;
      [v6 forwardPlaybackEndTime];
      id v6 = v8;
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v7 + 16);
  }
  return result;
}

- (CGSize)presentationSize
{
  if ([(MPAVItem *)self isAssetLoaded])
  {
    id v3 = [(MPAVItem *)self playerItem];
    [v3 presentationSize];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0x7FF8000000000000;
    uint64_t v5 = 0x7FF8000000000000;
  }
  double v8 = *(double *)&v5;
  double v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)prepareForRate:(float)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, float))a4 + 2))(a4, a3);
  }
}

- (CGSize)naturalSize
{
  if ([(MPAVItem *)self isAssetLoaded] && [(MPAVItem *)self status] == 1)
  {
    id v3 = [(MPAVItem *)self playerItem];
    [v3 presentationSize];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0x7FF8000000000000;
    uint64_t v5 = 0x7FF8000000000000;
  }
  double v8 = *(double *)&v5;
  double v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSString)mainTitle
{
  return 0;
}

- (BOOL)allowsEQ
{
  return [(MPAVItem *)self type] != 2;
}

- (int64_t)customAVEQPreset
{
  return 0;
}

- (BOOL)isStreamable
{
  int v2 = *((unsigned char *)self + 108) & 3;
  if (v2 == 2)
  {
    uint64_t v4 = [(MPAVItem *)self path];
    if ([v4 compare:@"https://", 1, 0, objc_msgSend(@"https://", "length") options range])
    {
      uint64_t v5 = [(MPAVItem *)self path];
      if ([v5 compare:@"http://", 1, 0, objc_msgSend(@"http://", "length") options range])
      {
        uint64_t v6 = [(MPAVItem *)self path];
        uint64_t v7 = [v6 compare:@"home-sharing://", 1, 0, objc_msgSend(@"home-sharing://", "length") options range];

        if (v7)
        {
          char v8 = *((unsigned char *)self + 108) & 0xFC;
LABEL_9:
          *((unsigned char *)self + 108) = v8;
          int v2 = v8 & 3;
          return v2 != 0;
        }
LABEL_8:
        char v8 = *((unsigned char *)self + 108) & 0xFC | 1;
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  return v2 != 0;
}

- (NSString)lyrics
{
  if ((*((unsigned char *)self + 108) & 8) != 0 && [(MPAVItem *)self isAssetLoaded])
  {
    id v3 = [(MPAVItem *)self asset];
    uint64_t v4 = [v3 lyrics];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (MPQueueFeeder)feeder
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feeder);
  os_unfair_lock_unlock(p_lock);

  return (MPQueueFeeder *)WeakRetained;
}

- (BOOL)displayableTextLoaded
{
  if ((*((unsigned char *)self + 108) & 8) != 0) {
    return 1;
  }
  int v2 = [(MPAVItem *)self displayableText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)usesSubscriptionLease
{
  return 0;
}

- (double)currentTimeDisplayOverride
{
  return 0.0;
}

- (void)setExplicitBadge:(id)a3
{
  char v8 = (NSString *)a3;
  uint64_t v4 = self->_explicitBadge;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      explicitBadge = self->_explicitBadge;
      self->_explicitBadge = v6;

      [(MPAVItem *)self invalidateContentItemUserInfo];
    }
  }
}

- (BOOL)isExplicitTrack
{
  return 0;
}

- (BOOL)isAssetURLValid
{
  return 1;
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  return self == a3;
}

- (NSString)artist
{
  return 0;
}

- (NSString)album
{
  return 0;
}

- (AVPlayerItemAccessLog)accessLog
{
  if ([(MPAVItem *)self isAssetLoaded])
  {
    BOOL v3 = [(MPAVItem *)self playerItem];
    uint64_t v4 = [v3 accessLog];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (AVPlayerItemAccessLog *)v4;
}

- (id)url
{
  if ([(MPAVItem *)self isAssetLoaded]
    && ([(MPAVItem *)self asset],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    char v5 = [(MPAVItem *)self asset];
    uint64_t v6 = [v5 URL];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)path
{
  if ([(MPAVItem *)self isAssetLoaded]
    && ([(MPAVItem *)self asset],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    char v5 = [(MPAVItem *)self asset];
    uint64_t v6 = [v5 URL];
    uint64_t v7 = [v6 absoluteString];
  }
  else
  {
    uint64_t v7 = &stru_1EE680640;
  }

  return v7;
}

- (double)durationInSeconds
{
  if (self->_cachedDuration < 0.00000011920929 && [(MPAVItem *)self isAssetLoaded])
  {
    BOOL v3 = [(MPAVItem *)self asset];
    uint64_t v4 = v3;
    if (v3) {
      [v3 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    self->_cachedDuration = CMTimeGetSeconds(&time);
  }
  return self->_cachedDuration;
}

- (int)subtitleTrackID
{
  return 0;
}

- (NSNumber)bookmarkTime
{
  int v2 = [(MPAVItem *)self mediaItem];
  BOOL v3 = v2;
  if (v2 && [v2 rememberBookmarkTime])
  {
    uint64_t v4 = NSNumber;
    [v3 bookmarkTime];
    char v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    char v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSError)playbackError
{
  if ([(MPAVItem *)self isAssetLoaded])
  {
    BOOL v3 = [(MPAVItem *)self playerItem];
    uint64_t v4 = [v3 error];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSError *)v4;
}

- (int64_t)status
{
  return [(AVPlayerItem *)self->_avPlayerItem status];
}

- (void)setAsset:(id)a3
{
}

- (void)setPlayerItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v5 = (AVPlayerItem *)a3;
  if (self->_avPlayerItem != v5)
  {
    -[MPAVItem _removeObservationsForAVPlayerItem:](self, "_removeObservationsForAVPlayerItem:");
    objc_storeStrong((id *)&self->_avPlayerItem, a3);
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      avPlayerItem = self->_avPlayerItem;
      *(_DWORD *)CMTime buf = 138543618;
      unint64_t v10 = self;
      __int16 v11 = 2114;
      id v12 = avPlayerItem;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "MP->AV Asset Log Mapping: %{public}@ -> %{public}@", buf, 0x16u);
    }

    self->_canReusePlayerItem = 1;
    self->_hasValidPlayerItemDuration = 0;
    [(MPAVItem *)self _addObservationsForAVPlayerItem:self->_avPlayerItem];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__MPAVItem_setPlayerItem___block_invoke;
    block[3] = &unk_1E57F9EA8;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __26__MPAVItem_setPlayerItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHasFinishedDownloading];
}

- (AVPlayerItem)playerItem
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__1212;
  char v8 = __Block_byref_object_dispose__1213;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVPlayerItem *)v2;
}

void __22__MPAVItem_playerItem__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "MPAVItem playerItem property is being used without prior loadAssetAndPlayerItem %{public}@", buf, 0xCu);
    }

    uint64_t v4 = (void *)MEMORY[0x1E4F77950];
    uint64_t v5 = *MEMORY[0x1E4F778C8];
    uint64_t v6 = NSString;
    uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    char v8 = [v6 stringWithFormat:@"%@", v7];
    unint64_t v10 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [v4 snapshotWithDomain:v5 type:@"Bug" subType:@"MPAVItem" context:@"PlayerItem is nil" triggerThresholdValues:0 events:v9 completion:0];
  }
}

- (AVAsset)asset
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__1212;
  char v8 = __Block_byref_object_dispose__1213;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVAsset *)v2;
}

void __17__MPAVItem_asset__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "MPAVItem asset property is being used without prior loadAssetAndPlayerItem %{public}@", buf, 0xCu);
    }

    uint64_t v4 = (void *)MEMORY[0x1E4F77950];
    uint64_t v5 = *MEMORY[0x1E4F778C8];
    uint64_t v6 = NSString;
    uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    char v8 = [v6 stringWithFormat:@"%@", v7];
    unint64_t v10 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [v4 snapshotWithDomain:v5 type:@"Bug" subType:@"MPAVItem" context:@"Asset is nil" triggerThresholdValues:0 events:v9 completion:0];
  }
}

- (void)notePlaybackFinishedByHittingEnd
{
  self->_didReachEnd = 1;
}

- (void)_loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  qos_class_t v8 = qos_class_self();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke;
  v18[3] = &unk_1E57EDF28;
  qos_class_t v20 = v8;
  id v19 = v7;
  id v9 = v7;
  unint64_t v10 = (void *)MEMORY[0x19971E0F0](v18);
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_3;
  block[3] = &unk_1E57F8408;
  id v16 = v6;
  id v17 = v10;
  void block[4] = self;
  id v12 = v6;
  id v13 = v10;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8, 0, block);
  dispatch_async(assetQueue, v14);
}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(*(unsigned int *)(a1 + 40), 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_2;
  block[3] = &unk_1E57F8408;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) clearAdjunctErrors];
  double v2 = MPProcessInfoSystemWallClockUptime();
  *(unsigned char *)(*(void *)(a1 + 32) + 202) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 32)) {
    goto LABEL_7;
  }
  id v8 = *(id *)(v3 + 24);
  if (!v8
    || ![*(id *)(a1 + 32) canUseLoadedAsset]
    || ([v8 error], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v5 = (void *)v4, v6 = [v8 status], v5, v6 == 2))
  {

    uint64_t v3 = *(void *)(a1 + 32);
LABEL_7:
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_4;
    v10[3] = &unk_1E57EDF50;
    v10[4] = v3;
    double v12 = v2;
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [(id)v3 loadAssetAndPlayerItemWithTask:v7 completion:v10];

    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "canReusePlayerItem", v8) & 1) == 0) {
    [*(id *)(a1 + 32) _copyPlayerItem];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v8;
  id v7 = v5;
  msv_dispatch_async_on_queue();
}

uint64_t __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_5(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    uint64_t v3 = v2[3];
    [v2 setIsAssetLoaded:v3 != 0];
    if (v3)
    {
      [*(id *)(a1 + 32) _loadAssetProperties];
      uint64_t v4 = +[MPMediaLibraryPrivacyContext contextForDefaultClient];
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 168);
      *(void *)(v5 + 168) = v4;

      [*(id *)(*(void *)(a1 + 32) + 168) beginAccessInterval];
    }
  }
  else
  {
    [v2 setIsAssetLoaded:0];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_6;
  v8[3] = &unk_1E57F8328;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = *(void *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], v8);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_6(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) updatePlayerItemMetadata];
  [*(id *)(a1 + 32) _updateSoundCheckVolumeNormalizationForPlayerItem];
  double v2 = MPProcessInfoSystemWallClockUptime();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = @"MPAVItemUserInfoKeyLoadDuration";
  uint64_t v5 = [NSNumber numberWithDouble:v2 - *(double *)(a1 + 40)];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 postNotificationName:@"MPAVItemAssetIsLoadedNotification" object:v4 userInfo:v6];
}

uint64_t __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)disableItemReuse
{
  self->_canReusePlayerItem = 0;
}

- (BOOL)canUseLoadedAsset
{
  return 1;
}

- (MPAVItem)initWithURL:(id)a3 options:(id)a4
{
  uint64_t v5 = [MEMORY[0x1E4F166C8] URLAssetWithURL:a3 options:a4];
  id v6 = [(MPAVItem *)self initWithAsset:v5];

  return v6;
}

- (MPAVItem)initWithURL:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F166C8] URLAssetWithURL:a3 options:0];
  uint64_t v5 = [(MPAVItem *)self initWithAsset:v4];

  return v5;
}

- (BOOL)isSupportedDefaultPlaybackSpeed:(int64_t)a3
{
  return a3 == 0;
}

+ (id)URLFromPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3 relativeToURL:0];
    uint64_t v5 = [v4 scheme];

    if (v5)
    {
      id v6 = v4;
    }
    else
    {
      id v7 = [v3 stringByRemovingPercentEncoding];
      id v8 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      id v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

      id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9 relativeToURL:0];

      id v11 = [v10 scheme];

      if (!v11)
      {
        uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];

        id v10 = (void *)v12;
      }
      id v6 = v10;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)artworkCatalogBlock
{
  double v2 = [(MPAVItem *)self mediaItem];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MPAVItem_MPArtworkCatalog__artworkCatalogBlock__block_invoke;
  v6[3] = &unk_1E57EE460;
  id v7 = v2;
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x19971E0F0](v6);

  return v4;
}

id __49__MPAVItem_MPArtworkCatalog__artworkCatalogBlock__block_invoke(uint64_t a1, double a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) chapters];
  uint64_t v5 = [v4 count];

  if (!v5
    || ([*(id *)(a1 + 32) chapterOfType:2 atTime:a2],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 artworkCatalog],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id v7 = [*(id *)(a1 + 32) artworkCatalog];
  }

  return v7;
}

@end