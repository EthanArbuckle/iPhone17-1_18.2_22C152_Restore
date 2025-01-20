@interface MPMediaItem
+ (BOOL)_isValidItemProperty:(id)a3;
+ (BOOL)canFilterByProperty:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSString)persistentIDPropertyForGroupingType:(MPMediaGrouping)groupingType;
+ (NSString)titlePropertyForGroupingType:(MPMediaGrouping)groupingType;
+ (id)MPSD_mediaItemPropertiesForDownloadability;
+ (id)ULIDPropertyForGroupingType:(int64_t)a3;
+ (id)artworkCatalogCacheProperties;
+ (id)dynamicProperties;
+ (id)fallbackTitlePropertyForGroupingType:(int64_t)a3;
+ (id)itemFromModelObject:(id)a3;
+ (id)itemFromSong:(id)a3;
+ (id)screenshotArtworkCatalogCacheProperties;
+ (void)_createFilterableDictionary;
- (BOOL)MPSD_isDownloadInProgress;
- (BOOL)existsInLibrary;
- (BOOL)hasBeenPlayed;
- (BOOL)hasProtectedAsset;
- (BOOL)isCloudItem;
- (BOOL)isCompilation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitItem;
- (BOOL)isITunesU;
- (BOOL)isPreorder;
- (BOOL)isRental;
- (BOOL)isUsableAsRepresentativeItem;
- (BOOL)rememberBookmarkTime;
- (MPMediaEntityPersistentID)albumArtistPersistentID;
- (MPMediaEntityPersistentID)albumPersistentID;
- (MPMediaEntityPersistentID)artistPersistentID;
- (MPMediaEntityPersistentID)composerPersistentID;
- (MPMediaEntityPersistentID)genrePersistentID;
- (MPMediaEntityPersistentID)podcastPersistentID;
- (MPMediaItem)initWithCoder:(id)a3;
- (MPMediaItem)initWithMultiverseIdentifier:(id)a3 library:(id)a4;
- (MPMediaItem)initWithPersistentID:(unint64_t)a3;
- (MPMediaItemArtwork)artwork;
- (MPMediaType)mediaType;
- (NSArray)chapters;
- (NSDate)dateAccessed;
- (NSDate)dateAdded;
- (NSDate)dateDownloaded;
- (NSDate)lastPlayedDate;
- (NSDate)lastSkippedDate;
- (NSDate)releaseDate;
- (NSString)albumArtist;
- (NSString)albumTitle;
- (NSString)artist;
- (NSString)comments;
- (NSString)composer;
- (NSString)effectiveAlbumArtist;
- (NSString)genre;
- (NSString)lyrics;
- (NSString)playbackStoreID;
- (NSString)podcastTitle;
- (NSString)title;
- (NSString)userGrouping;
- (NSTimeInterval)bookmarkTime;
- (NSTimeInterval)playbackDuration;
- (NSUInteger)albumTrackCount;
- (NSUInteger)albumTrackNumber;
- (NSUInteger)beatsPerMinute;
- (NSUInteger)discCount;
- (NSUInteger)discNumber;
- (NSUInteger)playCount;
- (NSUInteger)rating;
- (NSUInteger)skipCount;
- (NSURL)assetURL;
- (double)effectiveStopTime;
- (double)startTime;
- (double)stopTime;
- (id)_artworkCatalogWithArtworkType:(int64_t)a3;
- (id)artworkCatalog;
- (id)chapterOfType:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)chapterOfType:(int64_t)a3 atTime:(double)a4;
- (id)chaptersOfType:(int64_t)a3;
- (id)multiverseIdentifier;
- (id)predicateForProperty:(id)a3;
- (id)screenshotArtworkCatalog;
- (id)valueForProperty:(id)a3;
- (id)valuesForProperties:(id)a3;
- (unint64_t)countOfChaptersOfType:(int64_t)a3;
- (unint64_t)hash;
- (unint64_t)playCountSinceSync;
- (unint64_t)skipCountSinceSync;
- (unint64_t)year;
- (void)clearLocationProperties;
- (void)encodeWithCoder:(id)a3;
- (void)gaplessHeuristicInfo:(unsigned int *)a3 durationInSamples:(unint64_t *)a4 lastPacketsResync:(unint64_t *)a5 encodingDelay:(unsigned int *)a6 encodingDrain:(unsigned int *)a7;
- (void)populateLocationPropertiesWithPath:(id)a3;
- (void)populateLocationPropertiesWithPath:(id)a3 assetProtectionType:(int64_t)a4;
- (void)populateLocationPropertiesWithPath:(id)a3 assetProtectionType:(int64_t)a4 completionBlock:(id)a5;
- (void)setDateAccessed:(id)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setLastSkippedDate:(id)a3;
- (void)setPlayCount:(unint64_t)a3;
- (void)setPlayCountSinceSync:(unint64_t)a3;
- (void)setRating:(unint64_t)a3;
- (void)setSkipCount:(unint64_t)a3;
- (void)setSkipCountSinceSync:(unint64_t)a3;
@end

@implementation MPMediaItem

- (id)artworkCatalog
{
  return [(MPMediaItem *)self _artworkCatalogWithArtworkType:1];
}

+ (BOOL)canFilterByProperty:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary_14707;
  if (!__filterableDictionary_14707)
  {
    [a1 _createFilterableDictionary];
    CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary_14707;
  }
  if (CFDictionaryGetValue(v5, (const void *)[v4 hash]))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___MPMediaItem;
    unsigned __int8 v6 = objc_msgSendSuper2(&v8, sel_canFilterByProperty_, v4);
  }

  return v6;
}

+ (NSString)persistentIDPropertyForGroupingType:(MPMediaGrouping)groupingType
{
  switch(groupingType)
  {
    case 1:
    case 10:
    case 11:
    case 12:
    case 13:
    case 17:
      v3 = @"albumPID";
      break;
    case 2:
    case 8:
      v3 = @"artistPID";
      break;
    case 3:
    case 14:
    case 18:
      v3 = @"albumArtistPID";
      break;
    case 4:
    case 15:
    case 19:
    case 21:
      v3 = @"composerPID";
      break;
    case 5:
    case 16:
    case 20:
      v3 = @"genrePID";
      break;
    case 6:
      v3 = @"playlistPersistentID";
      id v4 = @"playlistPersistentID";
      break;
    case 7:
      v3 = @"podcastPID";
      break;
    case 9:
      v3 = @"seasonNumber";
      break;
    default:
      v3 = @"persistentID";
      break;
  }

  return (NSString *)v3;
}

+ (void)_createFilterableDictionary
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  if (!__filterableDictionary_14707)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v4 = 0u;
    long long v5 = 0u;
    keys[0] = (void *)[@"persistentID" hash];
    keys[1] = (void *)[@"globalID" hash];
    keys[2] = (void *)[@"mediaType" hash];
    keys[3] = (void *)[@"title" hash];
    keys[4] = (void *)[@"albumTitle" hash];
    keys[5] = (void *)[@"artist" hash];
    keys[6] = (void *)[@"albumArtist" hash];
    keys[7] = (void *)[@"genre" hash];
    keys[8] = (void *)[@"composer" hash];
    keys[9] = (void *)[@"playbackDuration" hash];
    keys[10] = (void *)[@"albumTrackNumber" hash];
    keys[11] = (void *)[@"albumTrackCount" hash];
    keys[12] = (void *)[@"chosenByAutoFill" hash];
    keys[13] = (void *)[@"discNumber" hash];
    keys[14] = (void *)[@"discCount" hash];
    keys[15] = (void *)[@"artwork" hash];
    keys[16] = (void *)[@"lyrics" hash];
    keys[17] = (void *)[@"isCompilation" hash];
    keys[18] = (void *)[@"year" hash];
    keys[19] = (void *)[@"releaseDate" hash];
    keys[20] = (void *)[@"beatsPerMinute" hash];
    keys[21] = (void *)[@"comments" hash];
    keys[22] = (void *)[@"storeItemAdamID" hash];
    keys[23] = (void *)[@"storeAccountID" hash];
    keys[24] = (void *)[@"storeDownloaderAccountID" hash];
    keys[25] = (void *)[@"storeFamilyAccountID" hash];
    keys[26] = (void *)[@"storePlaylistAdamID" hash];
    keys[27] = (void *)[@"storeArtistAdamID" hash];
    keys[28] = (void *)[@"storeAlbumArtistAdamID" hash];
    keys[29] = (void *)[@"storeComposerAdamID" hash];
    keys[30] = (void *)[@"storeGenreAdamID" hash];
    keys[31] = (void *)[@"storeRentalID" hash];
    keys[32] = (void *)[@"isRental" hash];
    keys[33] = (void *)[@"isITunesU" hash];
    keys[34] = (void *)[@"isAudible" hash];
    keys[35] = (void *)[@"isMusicVideo" hash];
    keys[36] = (void *)[@"isHD" hash];
    keys[37] = (void *)[@"contentRating" hash];
    keys[38] = (void *)[@"copyright" hash];
    keys[39] = (void *)[@"includeInShuffle" hash];
    keys[40] = (void *)[@"descriptionInfo" hash];
    keys[41] = (void *)[@"shortDescriptionInfo" hash];
    keys[42] = (void *)[@"movieInfo" hash];
    keys[43] = (void *)[@"podcastTitle" hash];
    *(void *)&long long v4 = [@"seriesName" hash];
    *((void *)&v4 + 1) = [@"seasonNumber" hash];
    *(void *)&long long v5 = [@"seasonName" hash];
    *((void *)&v5 + 1) = [@"episodeNumber" hash];
    *(void *)&long long v6 = [@"showSortType" hash];
    *((void *)&v6 + 1) = [@"episodeType" hash];
    *(void *)&long long v7 = [@"episodeTypeDisplayName" hash];
    *((void *)&v7 + 1) = [@"episodeSubSortOrder" hash];
    *(void *)&long long v8 = [@"isMusicShow" hash];
    *((void *)&v8 + 1) = [@"collectionDescription" hash];
    *(void *)&long long v9 = [@"playCount" hash];
    *((void *)&v9 + 1) = [@"skipCount" hash];
    *(void *)&long long v10 = [@"rating" hash];
    *((void *)&v10 + 1) = [@"lastPlayedDate" hash];
    *(void *)&long long v11 = [@"userGrouping" hash];
    *((void *)&v11 + 1) = [@"sortTitle" hash];
    *(void *)&long long v12 = [@"sortArtist" hash];
    *((void *)&v12 + 1) = [@"sortAlbumTitle" hash];
    *(void *)&long long v13 = [@"sortAlbumArtist" hash];
    *((void *)&v13 + 1) = [@"sortComposer" hash];
    uint64_t v14 = [@"filePath" hash];
    uint64_t v15 = [@"locationFileName" hash];
    uint64_t v16 = [@"assetURL" hash];
    uint64_t v17 = [@"hasAvailableItemArtwork" hash];
    uint64_t v18 = [@"chapters" hash];
    uint64_t v19 = [@"chapterArtworkTimes" hash];
    uint64_t v20 = [@"hasBeenPlayed" hash];
    uint64_t v21 = [@"bookmarkTime" hash];
    uint64_t v22 = [@"rememberBookmarkTime" hash];
    uint64_t v23 = [@"isDemoRental" hash];
    uint64_t v24 = [@"rentalDuration" hash];
    uint64_t v25 = [@"rentalPlaybackDuration" hash];
    uint64_t v26 = [@"rentalPlaybackStartTime" hash];
    uint64_t v27 = [@"rentalStartTime" hash];
    uint64_t v28 = [@"rentalExpirationDate" hash];
    uint64_t v29 = [@"rentalWindowEndDate" hash];
    uint64_t v30 = [@"artistPID" hash];
    uint64_t v31 = [@"albumArtistPID" hash];
    uint64_t v32 = [@"albumPID" hash];
    uint64_t v33 = [@"composerPID" hash];
    uint64_t v34 = [@"genrePID" hash];
    uint64_t v35 = [@"podcastPID" hash];
    uint64_t v36 = [@"isOTAPurchased" hash];
    uint64_t v37 = [@"isStreamingQuality" hash];
    uint64_t v38 = [@"isTemporaryCloudDownload" hash];
    uint64_t v39 = [@"startTime" hash];
    uint64_t v40 = [@"stopTime" hash];
    uint64_t v41 = [@"durationInSamples" hash];
    uint64_t v42 = [@"gaplessHeuristicInfo" hash];
    uint64_t v43 = [@"gaplessEncodingDelay" hash];
    uint64_t v44 = [@"gaplessEncodingDrain" hash];
    uint64_t v45 = [@"gaplessLastFrameResync" hash];
    uint64_t v46 = [@"volumeNormalization" hash];
    uint64_t v47 = [@"volumeAdjustment" hash];
    uint64_t v48 = [@"fileSize" hash];
    uint64_t v49 = [@"podcastURL" hash];
    uint64_t v50 = [@"podcastGUID" hash];
    uint64_t v51 = [@"eqPreset" hash];
    uint64_t v52 = [@"audioTrackID" hash];
    uint64_t v53 = [@"hasAlternateAudio" hash];
    uint64_t v54 = [@"hasSubtitles" hash];
    uint64_t v55 = [@"needsRestore" hash];
    uint64_t v56 = [@"storeCloudStatus" hash];
    uint64_t v57 = [@"storeRedownloadParameters" hash];
    uint64_t v58 = [@"downloadIdentifier" hash];
    uint64_t v59 = [@"storeSagaID" hash];
    uint64_t v60 = [@"storeBookmarkIdentifier" hash];
    uint64_t v61 = [@"storeBookmarkTimestamp" hash];
    uint64_t v62 = [@"storeBookmarkEntityRevision" hash];
    uint64_t v63 = [@"isCloudItem" hash];
    uint64_t v64 = [@"dateAccessed" hash];
    uint64_t v65 = [@"isStoreRedownloadable" hash];
    uint64_t v66 = [@"likedState" hash];
    uint64_t v67 = [@"purchaseHistoryID" hash];
    uint64_t v68 = [@"isHidden" hash];
    uint64_t v69 = [@"isLocal" hash];
    uint64_t v70 = [@"isPendingSync" hash];
    uint64_t v71 = [@"isDeprotected" hash];
    uint64_t v72 = [@"dateAdded" hash];
    uint64_t v73 = [@"storeDatePurchased" hash];
    uint64_t v74 = [@"isPlayable" hash];
    uint64_t v75 = [@"isMatchAudio" hash];
    uint64_t v76 = [@"isNonLibraryOwnedSubscriptionContent" hash];
    uint64_t v77 = [@"significantAmountHasBeenPlayed" hash];
    uint64_t v78 = [@"albumKeepLocal" hash];
    uint64_t v79 = [@"artistKeepLocal" hash];
    uint64_t v80 = [@"albumArtistKeepLocal" hash];
    uint64_t v81 = [@"genreKeepLocal" hash];
    uint64_t v82 = [@"storeExtrasURL" hash];
    uint64_t v83 = [@"storeNeedsReporting" hash];
    uint64_t v84 = [@"subscriptionStoreItemAdamID" hash];
    uint64_t v85 = [@"storePlaybackEndpointType" hash];
    uint64_t v86 = [@"storeAssetProtectionType" hash];
    uint64_t v87 = [@"radioStationID" hash];
    uint64_t v88 = [@"advertisementUniqueID" hash];
    uint64_t v89 = [@"advertisementType" hash];
    uint64_t v90 = [@"isArtistUploadedContent" hash];
    uint64_t v91 = [@"cloudIsInMyLibrary" hash];
    uint64_t v92 = [@"cloudUniversalLibraryID" hash];
    uint64_t v93 = [@"albumArtistCloudUniversalLibraryID" hash];
    uint64_t v94 = [@"syncID" hash];
    uint64_t v95 = [@"entityRevision" hash];
    uint64_t v96 = [@"hasNonPurgeableAsset" hash];
    uint64_t v97 = [@"remoteLocationId" hash];
    uint64_t v98 = [@"isInMyLibrary" hash];
    uint64_t v99 = [@"storeCloudAssetAvailable" hash];
    uint64_t v100 = [@"hasProtectedAsset" hash];
    uint64_t v101 = [@"hasAppleMusicDRM" hash];
    uint64_t v102 = [@"isExplicit" hash];
    uint64_t v103 = [@"classicalWork" hash];
    uint64_t v104 = [@"classicalMovement" hash];
    uint64_t v105 = [@"classicalMovementCount" hash];
    uint64_t v106 = [@"classicalMovementNumber" hash];
    uint64_t v107 = [@"hasHLSVideo" hash];
    uint64_t v108 = [@"storeCloudAlbumID" hash];
    uint64_t v109 = [@"storeLyricsAvailable" hash];
    uint64_t v110 = [@"timeSyncedLyricsAvailable" hash];
    uint64_t v111 = [@"audioTrackLocale" hash];
    uint64_t v112 = [@"isPremium" hash];
    uint64_t v113 = [@"colorCapability" hash];
    uint64_t v114 = [@"hlsColorCapability" hash];
    uint64_t v115 = [@"videoQuality" hash];
    uint64_t v116 = [@"hlsVideoQuality" hash];
    uint64_t v117 = [@"hlsPlaylistURL" hash];
    uint64_t v118 = [@"audioCapability" hash];
    uint64_t v119 = [@"hlsAudioCapability" hash];
    uint64_t v120 = [@"containerItemPID" hash];
    uint64_t v121 = [@"dateDownloaded" hash];
    uint64_t v122 = [@"bitRate" hash];
    uint64_t v123 = [@"needsRestore" hash];
    uint64_t v124 = [@"isLocal" hash];
    uint64_t v125 = [@"keepLocalStatus" hash];
    uint64_t v126 = [@"keepLocalStatusReason" hash];
    uint64_t v127 = [@"keepLocalConstraints" hash];
    uint64_t v128 = [@"isPreorder" hash];
    uint64_t v129 = [@"hlsAssetTraits" hash];
    uint64_t v130 = [@"hlsKeyServerURL" hash];
    uint64_t v131 = [@"hlsKeyServerProtocol" hash];
    uint64_t v132 = [@"hlsKeyCertificateURL" hash];
    uint64_t v133 = [@"reportingStoreItemAdamID" hash];
    uint64_t v134 = [@"assetStoreItemAdamID" hash];
    uint64_t v135 = [@"booklets" hash];
    uint64_t v136 = [@"assetStoreExtendedPlaybackAttribute" hash];
    uint64_t v137 = [@"storeExtendedLyricsAttribute" hash];
    uint64_t v138 = [@"storeCanonicalID" hash];
    uint64_t v139 = [@"tvSeasonStoreCanonicalID" hash];
    uint64_t v140 = [@"tvShowStoreCanonicalID" hash];
    memcpy(__dst, &unk_19568A380, sizeof(__dst));
    __filterableDictionary_14707 = (uint64_t)CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, __dst, 191, 0, 0);
  }
}

- (BOOL)isRental
{
  if (isRental___onceToken != -1) {
    dispatch_once(&isRental___onceToken, &__block_literal_global_693);
  }
  if (isRental___alwaysReturnNO) {
    return 0;
  }
  long long v4 = [(MPMediaItem *)self valueForProperty:@"isRental"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSTimeInterval)playbackDuration
{
  v2 = [(MPMediaItem *)self valueForProperty:@"playbackDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(MPMediaEntity *)self persistentID])
  {
    MPMediaEntityPersistentID v5 = [(MPMediaEntity *)self persistentID];
    unsigned __int8 v6 = v5 == [v4 persistentID];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPMediaItem;
    unsigned __int8 v6 = [(MPMediaEntity *)&v8 isEqual:v4];
  }

  return v6;
}

- (id)_artworkCatalogWithArtworkType:(int64_t)a3
{
  __int16 v22 = 0;
  if (a3 == 1)
  {
    MPMediaEntityPersistentID v5 = _MPMediaItemPropertyFetchableArtworkSource;
    unsigned __int8 v6 = @"fetchableItemArtworkToken";
    long long v7 = @"availableItemArtworkToken";
  }
  else
  {
    if (a3 != 2)
    {
      objc_super v8 = 0;
      long long v10 = 0;
      long long v9 = 0;
      goto LABEL_11;
    }
    MPMediaEntityPersistentID v5 = &_MPMediaItemPropertyFetchableScreenshotSource;
    unsigned __int8 v6 = @"fetchableItemScreenshotToken";
    long long v7 = @"availableItemScreenshotToken";
  }
  objc_super v8 = [(MPMediaEntity *)self cachedValueForProperty:v7 isCached:(char *)&v22 + 1];
  long long v9 = [(MPMediaEntity *)self cachedValueForProperty:v6 isCached:&v22];
  long long v10 = [(MPMediaEntity *)self cachedValueForProperty:*v5 isCached:0];
  if (HIBYTE(v22) && (_BYTE)v22 && ![v8 length] && !objc_msgSend(v9, "length"))
  {
    long long v11 = 0;
    goto LABEL_14;
  }
LABEL_11:
  long long v12 = [MPMediaLibraryArtworkRequest alloc];
  long long v13 = [(MPMediaEntity *)self mediaLibrary];
  uint64_t v14 = [(MPMediaLibraryArtworkRequest *)v12 initWithLibrary:v13 identifier:[(MPMediaEntity *)self persistentID] entityType:0 artworkType:a3];

  [(MPMediaLibraryArtworkRequest *)v14 setAvailableArtworkToken:v8];
  [(MPMediaLibraryArtworkRequest *)v14 setFetchableArtworkToken:v9];
  [(MPMediaLibraryArtworkRequest *)v14 setFetchableArtworkSource:v10];
  uint64_t v15 = [MPArtworkCatalog alloc];
  uint64_t v16 = [(MPMediaEntity *)self mediaLibrary];
  uint64_t v17 = [v16 artworkDataSource];
  uint64_t v18 = [(MPArtworkCatalog *)v15 initWithToken:v14 dataSource:v17];

  uint64_t v19 = [(MPMediaEntity *)self mediaLibrary];
  uint64_t v20 = [v19 artworkDataSource];
  LODWORD(v17) = [v20 areRepresentationsAvailableForCatalog:v18];

  long long v11 = 0;
  if (v17) {
    long long v11 = v18;
  }

LABEL_14:

  return v11;
}

- (MPMediaType)mediaType
{
  v2 = [(MPMediaItem *)self valueForProperty:@"mediaType"];
  MPMediaType v3 = [v2 integerValue];

  return v3;
}

- (NSString)genre
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"genre"];
}

- (NSString)title
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"title"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __23__MPMediaItem_isRental__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  isRental___alwaysReturnNO = [v2 isEqualToString:@"com.apple.Music"];
  if (isRental___alwaysReturnNO) {
    char v1 = 1;
  }
  else {
    char v1 = [v2 isEqualToString:@"com.apple.LegacyMusic"];
  }
  isRental___alwaysReturnNO = v1;
}

- (id)screenshotArtworkCatalog
{
  return [(MPMediaItem *)self _artworkCatalogWithArtworkType:2];
}

+ (id)screenshotArtworkCatalogCacheProperties
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"availableItemScreenshotToken", @"fetchableItemScreenshotToken", @"fetchableItemScreenshotSource", @"mediaType", 0);
}

+ (id)artworkCatalogCacheProperties
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"availableItemArtworkToken", @"fetchableItemArtworkToken", @"fetchableItemArtworkSource", @"mediaType", 0);
}

- (BOOL)isPreorder
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"isPreorder"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSDate)dateDownloaded
{
  return (NSDate *)[(MPMediaItem *)self valueForProperty:@"dateDownloaded"];
}

- (BOOL)isUsableAsRepresentativeItem
{
  return 1;
}

- (void)gaplessHeuristicInfo:(unsigned int *)a3 durationInSamples:(unint64_t *)a4 lastPacketsResync:(unint64_t *)a5 encodingDelay:(unsigned int *)a6 encodingDrain:(unsigned int *)a7
{
  if (!a7 || !a3 || !a4 || !a5 || !a6)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MPMediaItem.m" lineNumber:1343 description:@"invalid parameter"];
  }
  if (gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____once != -1) {
    dispatch_once(&gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____once, &__block_literal_global_705);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__MPMediaItem_gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain___block_invoke_2;
  v15[3] = &__block_descriptor_72_e25_v32__0__NSString_8_16_B24l;
  v15[4] = a3;
  v15[5] = a4;
  v15[6] = a6;
  v15[7] = a7;
  v15[8] = a5;
  [(MPMediaEntity *)self enumerateValuesForProperties:gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____properties usingBlock:v15];
}

void __100__MPMediaItem_gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 isEqualToString:@"gaplessHeuristicInfo"])
  {
    int v6 = [v5 unsignedIntValue];
    long long v7 = (_DWORD *)a1[4];
LABEL_10:
    *long long v7 = v6;
    goto LABEL_11;
  }
  if ([v10 isEqualToString:@"durationInSamples"])
  {
    uint64_t v8 = [v5 unsignedLongLongValue];
    long long v9 = (uint64_t *)a1[5];
LABEL_5:
    *long long v9 = v8;
    goto LABEL_11;
  }
  if ([v10 isEqualToString:@"gaplessEncodingDelay"])
  {
    int v6 = [v5 unsignedIntValue];
    long long v7 = (_DWORD *)a1[6];
    goto LABEL_10;
  }
  if ([v10 isEqualToString:@"gaplessEncodingDrain"])
  {
    int v6 = [v5 unsignedIntValue];
    long long v7 = (_DWORD *)a1[7];
    goto LABEL_10;
  }
  if ([v10 isEqualToString:@"gaplessLastFrameResync"])
  {
    uint64_t v8 = [v5 unsignedLongLongValue];
    long long v9 = (uint64_t *)a1[8];
    goto LABEL_5;
  }
LABEL_11:
}

void __100__MPMediaItem_gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"gaplessHeuristicInfo", @"durationInSamples", @"gaplessEncodingDelay", @"gaplessEncodingDrain", @"gaplessLastFrameResync", 0);
  char v1 = (void *)gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____properties;
  gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____properties = v0;
}

- (unint64_t)countOfChaptersOfType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [(MPMediaItem *)self valueForProperty:@"chapters"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) chapterType] == a3) {
          ++v7;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)chapterOfType:(int64_t)a3 atTime:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(MPMediaItem *)self chaptersOfType:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "playbackTime", (void)v15);
        if (v10 <= a4)
        {
          [v9 playbackTime];
          double v12 = v11;
          [v9 playbackDuration];
          if (v12 + v13 > a4)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)chapterOfType:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(MPMediaItem *)self valueForProperty:@"chapters"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "chapterType", (void)v15) == a3)
        {
          if (v9 == a4)
          {
            id v13 = v12;
            goto LABEL_13;
          }
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (id)chaptersOfType:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(MPMediaItem *)self valueForProperty:@"chapters"];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "chapterType", (void)v15) == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    double v12 = v5;
  }
  else {
    double v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (NSString)userGrouping
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"userGrouping"];
}

- (NSString)lyrics
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"lyrics"];
}

- (BOOL)isExplicitItem
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"isExplicit"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSUInteger)discCount
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"discCount"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSUInteger)discNumber
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"discNumber"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSUInteger)albumTrackNumber
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"albumTrackNumber"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)rememberBookmarkTime
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"rememberBookmarkTime"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)playbackStoreID
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"playbackStoreID"];
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(MPMediaItem *)self setValue:v4 forProperty:@"hasBeenPlayed" withCompletionBlock:0];
}

- (BOOL)hasBeenPlayed
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"hasBeenPlayed"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setLastSkippedDate:(id)a3
{
}

- (NSDate)lastSkippedDate
{
  return (NSDate *)[(MPMediaItem *)self valueForProperty:@"lastSkippedDate"];
}

- (void)setSkipCountSinceSync:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(MPMediaItem *)self setValue:v4 forProperty:@"skipCountSinceSync" withCompletionBlock:0];
}

- (unint64_t)skipCountSinceSync
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"skipCountSinceSync"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setSkipCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(MPMediaItem *)self setValue:v4 forProperty:@"skipCount" withCompletionBlock:0];
}

- (NSUInteger)skipCount
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"skipCount"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setDateAccessed:(id)a3
{
}

- (NSDate)dateAccessed
{
  return (NSDate *)[(MPMediaItem *)self valueForProperty:@"dateAccessed"];
}

- (void)setLastPlayedDate:(id)a3
{
}

- (NSDate)lastPlayedDate
{
  return (NSDate *)[(MPMediaItem *)self valueForProperty:@"lastPlayedDate"];
}

- (void)setPlayCountSinceSync:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(MPMediaItem *)self setValue:v4 forProperty:@"playCountSinceSync" withCompletionBlock:0];
}

- (unint64_t)playCountSinceSync
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"playCountSinceSync"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setPlayCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(MPMediaItem *)self setValue:v4 forProperty:@"playCount" withCompletionBlock:0];
}

- (NSUInteger)playCount
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"playCount"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (id)predicateForProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaItem *)self valueForProperty:v4];
  id v6 = +[MPMediaPropertyPredicate predicateWithValue:v5 forProperty:v4];

  return v6;
}

- (unint64_t)year
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"year"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSDate)releaseDate
{
  return (NSDate *)[(MPMediaItem *)self valueForProperty:@"releaseDate"];
}

- (void)setRating:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(MPMediaItem *)self setValue:v4 forProperty:@"rating" withCompletionBlock:0];
}

- (NSUInteger)rating
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"rating"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (MPMediaEntityPersistentID)podcastPersistentID
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"podcastPID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (NSString)podcastTitle
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"podcastTitle"];
}

- (double)effectiveStopTime
{
  [(MPMediaItem *)self stopTime];
  if (result == 0.0)
  {
    [(MPMediaItem *)self playbackDuration];
  }
  return result;
}

- (double)stopTime
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"stopTime"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)startTime
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"startTime"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)hasProtectedAsset
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"hasProtectedAsset"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isCloudItem
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"isCloudItem"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isCompilation
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"isCompilation"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isITunesU
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"isITunesU"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (MPMediaEntityPersistentID)genrePersistentID
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"genrePID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (MPMediaEntityPersistentID)composerPersistentID
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"composerPID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (NSString)composer
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"composer"];
}

- (NSString)comments
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"comments"];
}

- (NSDate)dateAdded
{
  return (NSDate *)[(MPMediaItem *)self valueForProperty:@"dateAdded"];
}

- (NSTimeInterval)bookmarkTime
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"bookmarkTime"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSUInteger)beatsPerMinute
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"beatsPerMinute"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSURL)assetURL
{
  return (NSURL *)[(MPMediaItem *)self valueForProperty:@"assetURL"];
}

- (MPMediaItemArtwork)artwork
{
  return (MPMediaItemArtwork *)[(MPMediaItem *)self valueForProperty:@"artwork"];
}

- (MPMediaEntityPersistentID)artistPersistentID
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"artistPID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (NSString)artist
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"artist"];
}

- (NSUInteger)albumTrackCount
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"albumTrackCount"];
  NSUInteger v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSString)albumTitle
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"albumTitle"];
}

- (MPMediaEntityPersistentID)albumArtistPersistentID
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"albumArtistPID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (MPMediaEntityPersistentID)albumPersistentID
{
  id v2 = [(MPMediaItem *)self valueForProperty:@"albumPID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (NSString)effectiveAlbumArtist
{
  MPMediaEntityPersistentID v3 = [(MPMediaItem *)self valueForProperty:@"albumArtist"];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MPMediaItem *)self valueForProperty:@"artist"];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)albumArtist
{
  return (NSString *)[(MPMediaItem *)self valueForProperty:@"albumArtist"];
}

- (NSArray)chapters
{
  return (NSArray *)[(MPMediaItem *)self valueForProperty:@"chapters"];
}

- (id)multiverseIdentifier
{
  MPMediaEntityPersistentID v3 = [(MPMediaEntity *)self mediaLibrary];
  double v4 = objc_msgSend(v3, "multiverseIdentifierForTrackWithPersistentID:", -[MPMediaEntity persistentID](self, "persistentID"));

  return v4;
}

- (void)clearLocationProperties
{
  MPMediaEntityPersistentID v3 = [(MPMediaEntity *)self mediaLibrary];
  [v3 clearLocationPropertiesOfItem:self];

  [(MPMediaEntity *)self invalidateCachedProperties];
}

- (void)populateLocationPropertiesWithPath:(id)a3 assetProtectionType:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MPMediaEntity *)self mediaLibrary];
  [v10 populateLocationPropertiesOfItem:self withPath:v9 assetProtectionType:a4 completionBlock:v8];

  [(MPMediaEntity *)self invalidateCachedProperties];
}

- (void)populateLocationPropertiesWithPath:(id)a3 assetProtectionType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(MPMediaEntity *)self mediaLibrary];
  [v7 populateLocationPropertiesOfItem:self withPath:v6 assetProtectionType:a4];

  [(MPMediaEntity *)self invalidateCachedProperties];
}

- (void)populateLocationPropertiesWithPath:(id)a3
{
}

- (BOOL)existsInLibrary
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"MPMediaItem.m", 482, @"Subclass %@ must implement -%@ defined in %@.", v8, v9, @"[MPMediaItem class]" object file lineNumber description];
  }
  return 1;
}

- (id)valuesForProperties:(id)a3
{
  uint64_t v5 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"MPMediaItem.m", 471, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"[MPMediaItem class]" object file lineNumber description];
  }
  return 0;
}

- (id)valueForProperty:(id)a3
{
  id v5 = a3;
  int v6 = [(id)objc_opt_class() _isValidItemProperty:v5];

  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() instanceMethodForSelector:a2];
    if (v7 == [(id)objc_opt_class() instanceMethodForSelector:a2])
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      double v12 = NSStringFromSelector(a2);
      [v9 handleFailureInMethod:a2, self, @"MPMediaItem.m", 466, @"Subclass %@ must implement -%@ defined in %@.", v11, v12, @"[MPMediaItem class]" object file lineNumber description];
    }
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    int v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"MPMediaItem.m", 442, @"Subclass %@ must implement -%@ defined in %@.", v7, v8, @"[MPMediaItem class]" object file lineNumber description];
  }
}

- (MPMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MPMediaLibrary defaultMediaLibrary];
  int v6 = [v5 decodeItemWithCoder:v4];

  return v6;
}

- (unint64_t)hash
{
  MPMediaEntityPersistentID v2 = [(MPMediaEntity *)self persistentID];
  return v2 ^ HIDWORD(v2);
}

- (MPMediaItem)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasSagaId] && objc_msgSend(v5, "sagaId"))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "sagaId"));
    id v8 = +[MPMediaPropertyPredicate predicateWithValue:v7 forProperty:@"storeSagaID"];

    id v9 = [MPMediaQuery alloc];
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    double v11 = [(MPMediaQuery *)v9 initWithFilterPredicates:v10 library:v6];

    double v12 = [(MPMediaQuery *)v11 items];
    if ([v12 count])
    {
LABEL_8:
      long long v18 = [v12 firstObject];

      uint64_t v19 = v18;
      uint64_t v20 = v19;
      goto LABEL_30;
    }
  }
  if ([v5 hasCloudUniversalLibraryId])
  {
    id v13 = [v5 cloudUniversalLibraryId];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      long long v15 = [v5 cloudUniversalLibraryId];
      id v8 = +[MPMediaPropertyPredicate predicateWithValue:v15 forProperty:@"cloudUniversalLibraryID"];

      long long v16 = [MPMediaQuery alloc];
      long long v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
      double v11 = [(MPMediaQuery *)v16 initWithFilterPredicates:v17 library:v6];

      double v12 = [(MPMediaQuery *)v11 items];
      if ([v12 count]) {
        goto LABEL_8;
      }
    }
  }
  if ([v5 hasStoreId] && objc_msgSend(v5, "storeId"))
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "storeId"));
    __int16 v22 = +[MPMediaPropertyPredicate predicateWithValue:v21 forProperty:@"storeItemAdamID"];
    v57[0] = v22;
    id v23 = v5;
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "storeId"));
    uint64_t v25 = +[MPMediaPropertyPredicate predicateWithValue:v24 forProperty:@"subscriptionStoreItemAdamID"];
    v57[1] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    uint64_t v27 = +[MPMediaCompoundPredicate predicateMatchingPredicates:v26];

    uint64_t v28 = [MPMediaQuery alloc];
    uint64_t v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v27];
    uint64_t v30 = [(MPMediaQuery *)v28 initWithFilterPredicates:v29 library:v6];

    uint64_t v31 = [(MPMediaQuery *)v30 items];
    if ([v31 count])
    {
      uint64_t v32 = [v31 firstObject];

      uint64_t v19 = v32;
      uint64_t v20 = v19;
      id v5 = v23;
      goto LABEL_30;
    }

    id v5 = v23;
  }
  id v50 = v6;
  uint64_t v33 = [v50 uniqueIdentifier];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v34 = [v5 libraryIdentifiers];
  uint64_t v20 = (MPMediaItem *)[v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v20)
  {
    id v47 = v6;
    id v48 = v5;
    uint64_t v35 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v20; uint64_t i = (MPMediaItem *)((char *)i + 1))
      {
        if (*(void *)v53 != v35) {
          objc_enumerationMutation(v34);
        }
        uint64_t v37 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v51 = 0;
        uint64_t v51 = [v37 libraryId];
        uint64_t v38 = [v37 libraryName];
        if ([v38 length] && objc_msgSend(v38, "isEqualToString:", v33))
        {
          uint64_t v39 = +[MPMediaPersistentIDsPredicate predicateWithPersistentIDs:&v51 count:8 shouldContain:1];
          uint64_t v40 = [MPMediaQuery alloc];
          uint64_t v41 = [MEMORY[0x1E4F1CAD0] setWithObject:v39];
          uint64_t v42 = [(MPMediaQuery *)v40 initWithFilterPredicates:v41 library:v50];

          [(MPMediaQuery *)v42 setShouldIncludeNonLibraryEntities:1];
          uint64_t v43 = [(MPMediaQuery *)v42 items];
          if ([v43 count])
          {
            uint64_t v44 = [v43 firstObject];

            uint64_t v45 = v44;
            uint64_t v19 = v45;

            uint64_t v20 = v45;
            id v6 = v47;
            id v5 = v48;
            goto LABEL_29;
          }
        }
      }
      uint64_t v20 = (MPMediaItem *)[v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v20) {
        continue;
      }
      break;
    }
    id v6 = v47;
    id v5 = v48;
  }
  uint64_t v19 = self;
LABEL_29:

LABEL_30:
  return v20;
}

- (MPMediaItem)initWithPersistentID:(unint64_t)a3
{
  id v5 = +[MPMediaLibrary defaultMediaLibrary];
  id v6 = [v5 itemWithPersistentID:a3];

  return v6;
}

+ (BOOL)_isValidItemProperty:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary_14707;
  if (!__filterableDictionary_14707)
  {
    [a1 _createFilterableDictionary];
    CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary_14707;
  }
  BOOL v6 = CFDictionaryContainsKey(v5, (const void *)[v4 hash]) != 0;

  return v6;
}

+ (id)dynamicProperties
{
  if (dynamicProperties_sOnce != -1) {
    dispatch_once(&dynamicProperties_sOnce, &__block_literal_global_14709);
  }
  MPMediaEntityPersistentID v2 = (void *)dynamicProperties_sProperties;

  return v2;
}

void __32__MPMediaItem_dynamicProperties__block_invoke()
{
  v2[10] = *MEMORY[0x1E4F143B8];
  v2[0] = @"bookmarkTime";
  v2[1] = @"hasBeenPlayed";
  v2[2] = @"lastPlayedDate";
  v2[3] = @"lastSkippedDate";
  v2[4] = @"playCount";
  v2[5] = @"playCountSinceSync";
  v2[6] = @"rating";
  v2[7] = @"skipCount";
  v2[8] = @"skipCountSinceSync";
  v2[9] = @"dateAccessed";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:10];
  char v1 = (void *)dynamicProperties_sProperties;
  dynamicProperties_sProperties = v0;
}

+ (id)fallbackTitlePropertyForGroupingType:(int64_t)a3
{
  if (a3 == 8) {
    return @"artist";
  }
  else {
    return @"title";
  }
}

+ (NSString)titlePropertyForGroupingType:(MPMediaGrouping)groupingType
{
  if ((unint64_t)(groupingType - 1) > 0x14) {
    return (NSString *)@"title";
  }
  else {
    return &off_1E57F0248[groupingType - 1]->isa;
  }
}

+ (id)ULIDPropertyForGroupingType:(int64_t)a3
{
  MPMediaEntityPersistentID v3 = @"cloudUniversalLibraryID";
  switch(a3)
  {
    case 1:
    case 10:
    case 11:
    case 12:
    case 13:
    case 17:
      MPMediaEntityPersistentID v3 = @"storeCloudAlbumID";
      break;
    case 3:
      MPMediaEntityPersistentID v3 = @"albumArtistCloudUniversalLibraryID";
      break;
    case 6:
      MPMediaEntityPersistentID v3 = @"cloudPlaylistUniversalLibraryID";
      CFDictionaryRef v5 = @"cloudPlaylistUniversalLibraryID";
      break;
    case 7:
      MPMediaEntityPersistentID v3 = @"podcastPID";
      break;
    default:
      break;
  }

  return v3;
}

+ (id)itemFromSong:(id)a3
{
  MPMediaEntityPersistentID v3 = +[MPModelGenericObject genericObjectWithModelObject:a3];
  id v4 = +[MPMediaItem itemFromModelObject:v3];

  return v4;
}

+ (id)itemFromModelObject:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    CFDictionaryRef v5 = [v3 identifiers];
    BOOL v6 = [v5 library];
    uint64_t v7 = [v6 persistentID];

    if (!v7) {
      goto LABEL_8;
    }
    id v8 = [v4 identifiers];
    id v9 = [v8 library];
    uint64_t v10 = [v9 databaseID];
    double v11 = +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:v10];
    double v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[MPMediaLibrary deviceMediaLibrary];
    }
    long long v15 = v13;

    uint64_t v14 = [v15 itemWithPersistentID:v7];

    if (!v14) {
LABEL_8:
    }
      uint64_t v14 = [[MPModelObjectMediaItem alloc] initWithModelObject:v4];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)MPSD_isDownloadInProgress
{
  id v3 = objc_msgSend((id)objc_opt_class(), "MPSD_mediaItemPropertiesForDownloadability");
  id v4 = [(MPMediaItem *)self valuesForProperties:v3];
  CFDictionaryRef v5 = +[MPStoreDownloadManager sharedManager];
  BOOL v6 = [v5 downloadForMediaItem:self];

  if (v6)
  {
    int v7 = [v6 isFinished] ^ 1;
  }
  else
  {
    id v8 = [v4 objectForKey:@"isPendingSync"];
    LOBYTE(v7) = [v8 BOOLValue];
  }
  return v7;
}

+ (id)MPSD_mediaItemPropertiesForDownloadability
{
  if (MPSD_mediaItemPropertiesForDownloadability_onceToken != -1) {
    dispatch_once(&MPSD_mediaItemPropertiesForDownloadability_onceToken, &__block_literal_global_56458);
  }
  MPMediaEntityPersistentID v2 = (void *)MPSD_mediaItemPropertiesForDownloadability_sMediaItemPropertiesForDownloadability;

  return v2;
}

void __83__MPMediaItem_MPStoreDownloadAdditions__MPSD_mediaItemPropertiesForDownloadability__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"isLocal", @"isPendingSync", @"isTemporaryCloudDownload", @"isStoreRedownloadable", @"storeItemAdamID", 0);
  char v1 = (void *)MPSD_mediaItemPropertiesForDownloadability_sMediaItemPropertiesForDownloadability;
  MPSD_mediaItemPropertiesForDownloadability_sMediaItemPropertiesForDownloadability = v0;
}

@end