@interface MPNowPlayingContentItem
+ (BOOL)shouldPushArtworkData;
- (BOOL)hasArtwork;
- (BOOL)hasDescription;
- (BOOL)hasLanguageOptions;
- (BOOL)hasLyrics;
- (BOOL)hasTranscriptAlignments;
- (BOOL)isAdvertisement;
- (BOOL)isAlwaysLiveItem;
- (BOOL)isInTransition;
- (BOOL)isLoading;
- (BOOL)isSharableItem;
- (BOOL)isSteerable;
- (MPNowPlayingContentItemArtworkDataSource)artworkDataSource;
- (MPNowPlayingInfoAudioFormat)activeFormat;
- (MPNowPlayingInfoAudioFormat)preferredFormat;
- (MPNowPlayingInfoAudioRoute)audioRoute;
- (MPNowPlayingInfoLyricsItem)lyrics;
- (NSArray)alternativeFormats;
- (NSArray)artworkURLTemplates;
- (NSArray)availableLanguageOptions;
- (NSArray)currentLanguageOptions;
- (NSArray)sections;
- (NSArray)supportedRemoteArtworkFormats;
- (NSArray)transcriptAlignments;
- (NSDate)releaseDate;
- (NSDictionary)auxiliaryNowPlayingInfo;
- (NSDictionary)collectionInfo;
- (NSDictionary)deviceSpecificUserInfo;
- (NSDictionary)nowPlayingInfo;
- (NSDictionary)remoteArtworks;
- (NSDictionary)userInfo;
- (NSString)albumArtistName;
- (NSString)albumName;
- (NSString)albumYear;
- (NSString)artworkIdentifier;
- (NSString)artworkURL;
- (NSString)associatedParticipantIdentifier;
- (NSString)collectionIdentifier;
- (NSString)composerName;
- (NSString)directorName;
- (NSString)durationStringLocalizationKey;
- (NSString)externalContentIdentifier;
- (NSString)genreName;
- (NSString)info;
- (NSString)localizedContentRating;
- (NSString)localizedDurationString;
- (NSString)profileIdentifier;
- (NSString)radioStationName;
- (NSString)radioStationStringIdentifier;
- (NSString)seriesName;
- (NSString)serviceIdentifier;
- (NSString)trackArtistName;
- (double)calculatedElapsedTime;
- (double)duration;
- (double)elapsedTime;
- (double)elapsedTimeTimestamp;
- (double)startTime;
- (float)defaultPlaybackRate;
- (float)playbackRate;
- (id)copyWithNewIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)activeFormatJustification;
- (int64_t)discNumber;
- (int64_t)editingStyleFlags;
- (int64_t)episodeNumber;
- (int64_t)episodeType;
- (int64_t)legacyUniqueID;
- (int64_t)lyricsAdamID;
- (int64_t)numberOfChildren;
- (int64_t)playCount;
- (int64_t)playlistType;
- (int64_t)radioStationType;
- (int64_t)reportingAdamID;
- (int64_t)seasonNumber;
- (int64_t)storeAlbumArtistID;
- (int64_t)storeAlbumID;
- (int64_t)storeArtistID;
- (int64_t)storeID;
- (int64_t)storeSubscriptionID;
- (int64_t)totalDiscCount;
- (int64_t)totalTrackCount;
- (int64_t)trackNumber;
- (unint64_t)albumTraits;
- (unint64_t)formatTierPreference;
- (unint64_t)mediaType;
- (unint64_t)playlistTraits;
- (unint64_t)songTraits;
- (void)_mergeContentItem:(id)a3;
- (void)invalidateArtwork;
- (void)invalidateDescription;
- (void)invalidateLanguageOptions;
- (void)invalidateLyrics;
- (void)invalidateSections;
- (void)invalidateTranscriptAlignments;
- (void)setActiveFormat:(id)a3;
- (void)setActiveFormatJustification:(int64_t)a3;
- (void)setAdvertisement:(BOOL)a3;
- (void)setAlbumArtistName:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setAlbumTraits:(unint64_t)a3;
- (void)setAlbumYear:(id)a3;
- (void)setAlternativeFormats:(id)a3;
- (void)setAlwaysLiveItem:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkDataSource:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setArtworkURLTemplates:(id)a3;
- (void)setAssociatedParticipantIdentifier:(id)a3;
- (void)setAudioRoute:(id)a3;
- (void)setAvailableLanguageOptions:(id)a3;
- (void)setCollectionIdentifier:(id)a3;
- (void)setCollectionInfo:(id)a3;
- (void)setComposerName:(id)a3;
- (void)setCurrentLanguageOptions:(id)a3;
- (void)setDefaultPlaybackRate:(float)a3;
- (void)setDeviceSpecificUserInfo:(id)a3;
- (void)setDirectorName:(id)a3;
- (void)setDiscNumber:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setDurationStringLocalizationKey:(id)a3;
- (void)setEditingStyleFlags:(int64_t)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 playbackRate:(float)a4;
- (void)setEpisodeNumber:(int64_t)a3;
- (void)setEpisodeType:(int64_t)a3;
- (void)setExternalContentIdentifier:(id)a3;
- (void)setFormatTierPreference:(unint64_t)a3;
- (void)setGenreName:(id)a3;
- (void)setHasArtwork:(BOOL)a3;
- (void)setHasDescription:(BOOL)a3;
- (void)setHasLanguageOptions:(BOOL)a3;
- (void)setHasLyrics:(BOOL)a3;
- (void)setHasTranscriptAlignments:(BOOL)a3;
- (void)setInTransition:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setLegacyUniqueID:(int64_t)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLocalizedContentRating:(id)a3;
- (void)setLocalizedDurationString:(id)a3;
- (void)setLyrics:(id)a3;
- (void)setLyricsAdamID:(int64_t)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setNumberOfChildren:(int64_t)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlaylistTraits:(unint64_t)a3;
- (void)setPlaylistType:(int64_t)a3;
- (void)setPreferredFormat:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRadioStationStringIdentifier:(id)a3;
- (void)setRadioStationType:(int64_t)a3;
- (void)setReleaseDate:(id)a3;
- (void)setRemoteArtworks:(id)a3;
- (void)setReportingAdamID:(int64_t)a3;
- (void)setSeasonNumber:(int64_t)a3;
- (void)setSections:(id)a3;
- (void)setSeriesName:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSharableItem:(BOOL)a3;
- (void)setSongTraits:(unint64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setSteerable:(BOOL)a3;
- (void)setStoreAlbumArtistID:(int64_t)a3;
- (void)setStoreAlbumID:(int64_t)a3;
- (void)setStoreArtistID:(int64_t)a3;
- (void)setStoreID:(int64_t)a3;
- (void)setStoreSubscriptionID:(int64_t)a3;
- (void)setSupportedRemoteArtworkFormats:(id)a3;
- (void)setTotalDiscCount:(int64_t)a3;
- (void)setTotalTrackCount:(int64_t)a3;
- (void)setTrackArtistName:(id)a3;
- (void)setTrackNumber:(int64_t)a3;
- (void)setTranscriptAlignments:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MPNowPlayingContentItem

uint64_t __45__MPNowPlayingContentItem_setNowPlayingInfo___block_invoke()
{
  return MRContentItemSetNowPlayingInfo();
}

- (double)elapsedTimeTimestamp
{
  [(MPContentItem *)self _mediaRemoteContentItem];

  MRContentItemGetElapsedTimeTimestamp();
  return result;
}

- (NSDictionary)auxiliaryNowPlayingInfo
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  v2 = (void *)MRContentItemCopyAuxiliaryNowPlayingInfo();

  return (NSDictionary *)v2;
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self associatedParticipantIdentifier];
  if (v5 == v4)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      v8 = self;
      objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem"), "setAssociatedParticipantIdentifier:", v4);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __62__MPNowPlayingContentItem_setAssociatedParticipantIdentifier___block_invoke;
      v9[3] = &unk_1E57F7278;
      id v10 = v4;
      [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
    }
  }
}

- (NSString)associatedParticipantIdentifier
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)[v2 associatedParticipantIdentifier];
}

- (NSString)collectionIdentifier
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DE78](v2);
}

- (void)setAlbumYear:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self albumYear];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetAlbumYear();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__MPNowPlayingContentItem_setAlbumYear___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (NSString)albumYear
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  v2 = (void *)MRContentItemCopyAlbumYear();

  return (NSString *)v2;
}

- (void)setAlbumName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self albumName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetAlbumName();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__MPNowPlayingContentItem_setAlbumName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (NSString)albumName
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DE48](v2);
}

- (void)setAlwaysLiveItem:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self isAlwaysLiveItem] != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata"), id v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasAlwaysLive"), v5, (v6 & 1) == 0))
  {
    int v7 = self;
    [(MPContentItem *)v7 _mediaRemoteContentItem];
    MRContentItemSetIsAlwaysLive();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__MPNowPlayingContentItem_setAlwaysLiveItem___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v9 = a3;
    [(MPContentItem *)v7 _postItemChangedNotificationWithDeltaBlock:v8];
  }
}

- (BOOL)isAlwaysLiveItem
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF68](v2);
}

- (void)setAlbumArtistName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self albumArtistName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetAlbumArtistName();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__MPNowPlayingContentItem_setAlbumArtistName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (NSString)albumArtistName
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DE40](v2);
}

- (MPNowPlayingInfoAudioRoute)audioRoute
{
  v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  v3 = [v2 audioRoute];

  id v4 = v3;
  id v5 = [[MPNowPlayingInfoAudioRoute alloc] initWithMediaRemoteAudioRoute:v4];

  return v5;
}

- (int64_t)activeFormatJustification
{
  v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  uint64_t v3 = [v2 activeFormatJustification];

  if (v3 == 1000) {
    int64_t v4 = 1000;
  }
  else {
    int64_t v4 = 0;
  }
  if (v3 == 501) {
    int64_t v4 = 501;
  }
  if (v3 == 500) {
    int64_t v4 = 500;
  }
  if (v3 == 101) {
    int64_t v5 = 101;
  }
  else {
    int64_t v5 = 0;
  }
  if (v3 == 100) {
    int64_t v5 = 100;
  }
  if (v3 == 1) {
    int64_t v5 = 1;
  }
  if (v3 <= 499) {
    return v5;
  }
  else {
    return v4;
  }
}

- (NSArray)alternativeFormats
{
  v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  uint64_t v3 = [v2 alternativeFormats];

  int64_t v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_207);

  return (NSArray *)v4;
}

- (MPNowPlayingInfoAudioFormat)preferredFormat
{
  v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  uint64_t v3 = [v2 preferredFormat];

  id v4 = v3;
  int64_t v5 = [[MPNowPlayingInfoAudioFormat alloc] initWithMediaRemoteAudioFormat:v4];

  return v5;
}

- (MPNowPlayingInfoAudioFormat)activeFormat
{
  v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  uint64_t v3 = [v2 activeFormat];

  id v4 = v3;
  int64_t v5 = [[MPNowPlayingInfoAudioFormat alloc] initWithMediaRemoteAudioFormat:v4];

  return v5;
}

- (unint64_t)formatTierPreference
{
  v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  char v3 = [v2 formatTierPreference];

  return v3 & 0x1F;
}

- (unint64_t)songTraits
{
  v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  char v3 = [v2 songTraits];

  return v3 & 0x3F;
}

- (NSDictionary)collectionInfo
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  v2 = (void *)MRContentItemCopyCollectionInfo();
  char v3 = MPMediaRemoteCollectionInfoToNowPlaying(v2);

  return (NSDictionary *)v3;
}

- (unint64_t)mediaType
{
  v2 = self;
  [(MPContentItem *)v2 _mediaRemoteContentItem];
  uint64_t MediaType = MRContentItemGetMediaType();
  [(MPContentItem *)v2 _mediaRemoteContentItem];
  uint64_t v4 = MRContentItemGetMediaSubType() - 1;
  unint64_t result = 512;
  switch(v4)
  {
    case 0:
      if (MediaType == 1) {
        return 1;
      }
      else {
        return (unint64_t)(MediaType == 2) << 11;
      }
    case 1:
      return result;
    case 2:
      return 256;
    case 3:
      unint64_t v6 = (unint64_t)(MediaType == 2) << 10;
      BOOL v7 = MediaType == 1;
      unint64_t v8 = 2;
      goto LABEL_9;
    case 4:
      return 4;
    case 5:
      unint64_t v6 = (unint64_t)(MediaType == 2) << 12;
      BOOL v7 = MediaType == 1;
      unint64_t v8 = 8;
LABEL_9:
      if (v7) {
        return v8;
      }
      else {
        return v6;
      }
    case 6:
      if (MediaType != 2) {
        goto LABEL_14;
      }
      unint64_t result = 0x2000;
      break;
    default:
LABEL_14:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (NSDictionary)userInfo
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  v2 = (void *)MRContentItemCopyUserInfo();

  return (NSDictionary *)v2;
}

- (NSDictionary)deviceSpecificUserInfo
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  v2 = (void *)MRContentItemCopyDeviceSpecificUserInfo();

  return (NSDictionary *)v2;
}

- (int64_t)storeSubscriptionID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF48](v2);
}

- (int64_t)storeID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF40](v2);
}

- (int64_t)reportingAdamID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412E030](v2);
}

- (int64_t)lyricsAdamID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DFC8](v2);
}

- (NSDictionary)nowPlayingInfo
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  v2 = (void *)MRContentItemCopyNowPlayingInfo();

  return (NSDictionary *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDataSource, 0);

  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

- (NSString)localizedDurationString
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DFB8](v2);
}

- (void)setUserInfo:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self userInfo];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    unint64_t v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetUserInfo();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__MPNowPlayingContentItem_setUserInfo___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (void)setTrackNumber:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self trackNumber] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetTrackNumber();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__MPNowPlayingContentItem_setTrackNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (int64_t)trackNumber
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412E088](v2);
}

- (void)setTrackArtistName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self trackArtistName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    unint64_t v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetTrackArtistName();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__MPNowPlayingContentItem_setTrackArtistName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (NSString)trackArtistName
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E080](v2);
}

- (void)setTotalTrackCount:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self totalTrackCount] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetTotalTrackCount();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__MPNowPlayingContentItem_setTotalTrackCount___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (int64_t)totalTrackCount
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412E078](v2);
}

- (void)setTotalDiscCount:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self totalDiscCount] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetTotalDiscCount();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__MPNowPlayingContentItem_setTotalDiscCount___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (int64_t)totalDiscCount
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412E070](v2);
}

- (void)setStoreSubscriptionID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self storeSubscriptionID] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetITunesStoreSubscriptionIdentifier();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__MPNowPlayingContentItem_setStoreSubscriptionID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setStoreID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self storeID] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetITunesStoreIdentifier();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__MPNowPlayingContentItem_setStoreID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setStoreArtistID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self storeArtistID] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetITunesStoreArtistIdentifier();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__MPNowPlayingContentItem_setStoreArtistID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (int64_t)storeArtistID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF38](v2);
}

- (void)setStoreAlbumID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self storeAlbumID] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetITunesStoreAlbumIdentifier();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setStoreAlbumID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (int64_t)storeAlbumID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF30](v2);
}

- (void)setStoreAlbumArtistID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self storeAlbumArtistID] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetITunesStoreAlbumArtistIdentifier();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__MPNowPlayingContentItem_setStoreAlbumArtistID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (int64_t)storeAlbumArtistID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF28](v2);
}

- (void)setStartTime:(double)a3
{
  [(MPNowPlayingContentItem *)self startTime];
  double v6 = -v5;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  if (v6 > 2.22044605e-16) {
    goto LABEL_7;
  }
  double v7 = -a3;
  if (a3 >= 0.0) {
    double v7 = a3;
  }
  if (v7 > 2.22044605e-16)
  {
LABEL_7:
    double v8 = v5 - a3;
    if (v8 < 0.0) {
      double v8 = -v8;
    }
    if (v8 > 2.22044605e-16)
    {
      BOOL v9 = self;
      [(MPContentItem *)v9 _mediaRemoteContentItem];
      MRContentItemSetStartTime();
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__MPNowPlayingContentItem_setStartTime___block_invoke;
      v10[3] = &__block_descriptor_40_e9_v16__0_v8l;
      *(double *)&v10[4] = a3;
      [(MPContentItem *)v9 _postItemChangedNotificationWithDeltaBlock:v10];
    }
  }
}

- (double)startTime
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  MEMORY[0x1F412E058](v2);
  return result;
}

- (void)setReportingAdamID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self reportingAdamID] != a3)
  {
    double v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetReportingAdamID();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__MPNowPlayingContentItem_setReportingAdamID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setReleaseDate:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self releaseDate];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetReleaseDate();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__MPNowPlayingContentItem_setReleaseDate___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (void)setRadioStationStringIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self radioStationStringIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetRadioStationString();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__MPNowPlayingContentItem_setRadioStationStringIdentifier___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (void)setRadioStationName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self radioStationName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetRadioStationName();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__MPNowPlayingContentItem_setRadioStationName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (void)setPlaybackRate:(float)a3
{
  [(MPNowPlayingContentItem *)self playbackRate];
  float v6 = v5 - a3;
  if (v6 < 0.0) {
    float v6 = -v6;
  }
  if (v6 > 0.00000011921
    || ([(MPContentItem *)self _mediaRemoteContentItem],
        (MRContentItemHasPlaybackRate() & 1) == 0))
  {
    int v7 = self;
    [(MPContentItem *)v7 _mediaRemoteContentItem];
    MRContentItemSetPlaybackRate();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__MPNowPlayingContentItem_setPlaybackRate___block_invoke;
    v8[3] = &__block_descriptor_36_e9_v16__0_v8l;
    float v9 = a3;
    [(MPContentItem *)v7 _postItemChangedNotificationWithDeltaBlock:v8];
  }
}

- (float)playbackRate
{
  [(MPContentItem *)self _mediaRemoteContentItem];

  MRContentItemGetPlaybackRate();
  return result;
}

- (void)setMediaType:(unint64_t)a3
{
  if ([(MPNowPlayingContentItem *)self mediaType] != a3)
  {
    if ((_BYTE)a3) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2 * ((a3 & 0xFF00) != 0);
    }
    uint64_t v6 = 1;
    if ((uint64_t)a3 <= 511)
    {
      switch(a3)
      {
        case 1uLL:
          goto LABEL_21;
        case 2uLL:
          goto LABEL_15;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_20;
        case 4uLL:
          uint64_t v6 = 5;
          break;
        case 8uLL:
          goto LABEL_16;
        default:
          if (a3 != 256) {
            goto LABEL_20;
          }
          uint64_t v6 = 3;
          break;
      }
      goto LABEL_21;
    }
    if ((uint64_t)a3 <= 2047)
    {
      if (a3 == 512)
      {
        uint64_t v6 = 2;
        goto LABEL_21;
      }
      if (a3 == 1024)
      {
LABEL_15:
        uint64_t v6 = 4;
        goto LABEL_21;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x800uLL:
LABEL_21:
          int v7 = self;
          [(MPContentItem *)v7 _mediaRemoteContentItem];
          MRContentItemSetMediaType();
          double v8 = v7;
          [(MPContentItem *)v8 _mediaRemoteContentItem];
          MRContentItemSetMediaSubType();
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __40__MPNowPlayingContentItem_setMediaType___block_invoke;
          v9[3] = &__block_descriptor_48_e9_v16__0_v8l;
          void v9[4] = v5;
          v9[5] = v6;
          [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
          return;
        case 0x1000uLL:
LABEL_16:
          uint64_t v6 = 6;
          goto LABEL_21;
        case 0x2000uLL:
          uint64_t v6 = 7;
          goto LABEL_21;
      }
    }
LABEL_20:
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    goto LABEL_21;
  }
}

- (void)setLyricsAdamID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self lyricsAdamID] != a3)
  {
    uint64_t v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetLyricsAdamID();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setLyricsAdamID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setLyrics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPNowPlayingContentItem *)self lyrics];
  uint64_t v6 = self;
  [(MPContentItem *)v6 _mediaRemoteContentItem];
  [v4 mediaRemoteLyricsItem];
  MRContentItemSetLyrics();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__MPNowPlayingContentItem_setLyrics___block_invoke_2;
  v8[3] = &unk_1E57F7278;
  id v9 = v4;
  id v7 = v4;
  [(MPContentItem *)v6 _postItemChangedNotificationWithDeltaBlock:v8];
}

- (MPNowPlayingInfoLyricsItem)lyrics
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  v2 = [[MPNowPlayingInfoLyricsItem alloc] initWithMediaRemoteLyricsItem:MRContentItemGetLyrics()];

  return v2;
}

- (void)setLoading:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self isLoading] != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata"), uint64_t v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasLoading"), v5, (v6 & 1) == 0))
  {
    id v7 = self;
    [(MPContentItem *)v7 _mediaRemoteContentItem];
    MRContentItemSetIsLoading();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__MPNowPlayingContentItem_setLoading___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v9 = a3;
    [(MPContentItem *)v7 _postItemChangedNotificationWithDeltaBlock:v8];
  }
}

- (BOOL)isLoading
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF88](v2);
}

- (void)setInTransition:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self isInTransition] != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata"), uint64_t v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasInTransition"), v5, (v6 & 1) == 0))
  {
    id v7 = self;
    [(MPContentItem *)v7 _mediaRemoteContentItem];
    MRContentItemSetIsInTransition();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__MPNowPlayingContentItem_setInTransition___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v9 = a3;
    [(MPContentItem *)v7 _postItemChangedNotificationWithDeltaBlock:v8];
  }
}

- (BOOL)isInTransition
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF80](v2);
}

- (void)setHasLyrics:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self hasLyrics] != a3)
  {
    uint64_t v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetHasLyrics();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__MPNowPlayingContentItem_setHasLyrics___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setHasDescription:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self hasDescription] != a3)
  {
    uint64_t v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetHasInfo();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__MPNowPlayingContentItem_setHasDescription___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setHasArtwork:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self hasArtwork] != a3)
  {
    uint64_t v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetHasArtworkData();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__MPNowPlayingContentItem_setHasArtwork___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setGenreName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self genreName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetGenre();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__MPNowPlayingContentItem_setGenreName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (void)setExternalContentIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self externalContentIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetContentIdentifier();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__MPNowPlayingContentItem_setExternalContentIdentifier___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (void)setElapsedTime:(double)a3
{
  [(MPNowPlayingContentItem *)self elapsedTime];
  double v6 = v5 - a3;
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 2.22044605e-16
    || (int v7 = self,
        [(MPContentItem *)v7 _mediaRemoteContentItem],
        !MRContentItemGetHasElapsedTime())
    || !v7->_didSetElapsedTime)
  {
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetElapsedTime();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__MPNowPlayingContentItem_setElapsedTime___block_invoke;
    v10[3] = &__block_descriptor_40_e9_v16__0_v8l;
    *(double *)&v10[4] = a3;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v10];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MPNowPlayingContentItem_setElapsedTime___block_invoke_2;
  v9[3] = &unk_1E57F7278;
  void v9[4] = self;
  [(MPContentItem *)self _postItemChangedNotificationWithDeltaBlock:v9];
}

- (double)elapsedTime
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  MEMORY[0x1F412DEC8](v2);
  return result;
}

- (void)setEditingStyleFlags:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self editingStyleFlags] != a3)
  {
    double v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetEditingStyleFlags();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__MPNowPlayingContentItem_setEditingStyleFlags___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setDuration:(double)a3
{
  [(MPNowPlayingContentItem *)self duration];
  double v6 = -v5;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  if (v6 > 2.22044605e-16) {
    goto LABEL_7;
  }
  double v7 = -a3;
  if (a3 >= 0.0) {
    double v7 = a3;
  }
  if (v7 > 2.22044605e-16)
  {
LABEL_7:
    double v8 = v5 - a3;
    if (v8 < 0.0) {
      double v8 = -v8;
    }
    if (v8 > 2.22044605e-16)
    {
      BOOL v9 = self;
      [(MPContentItem *)v9 _mediaRemoteContentItem];
      MRContentItemSetDuration();
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __39__MPNowPlayingContentItem_setDuration___block_invoke;
      v10[3] = &__block_descriptor_40_e9_v16__0_v8l;
      *(double *)&v10[4] = a3;
      [(MPContentItem *)v9 _postItemChangedNotificationWithDeltaBlock:v10];
    }
  }
}

- (double)duration
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  MEMORY[0x1F412DEB0](v2);
  return result;
}

- (void)setDiscNumber:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self discNumber] != a3)
  {
    double v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetDiscNumber();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__MPNowPlayingContentItem_setDiscNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (void)setDeviceSpecificUserInfo:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self deviceSpecificUserInfo];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetDeviceSpecificUserInfo();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__MPNowPlayingContentItem_setDeviceSpecificUserInfo___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (void)setDefaultPlaybackRate:(float)a3
{
  [(MPNowPlayingContentItem *)self defaultPlaybackRate];
  float v6 = -v5;
  if (v5 >= 0.0) {
    float v6 = v5;
  }
  if (v6 > 0.00000011921) {
    goto LABEL_7;
  }
  float v7 = -a3;
  if (a3 >= 0.0) {
    float v7 = a3;
  }
  if (v7 > 0.00000011921)
  {
LABEL_7:
    float v8 = v5 - a3;
    if (v8 < 0.0) {
      float v8 = -v8;
    }
    if (v8 > 0.00000011921)
    {
      BOOL v9 = self;
      [(MPContentItem *)v9 _mediaRemoteContentItem];
      MRContentItemSetDefaultPlaybackRate();
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__MPNowPlayingContentItem_setDefaultPlaybackRate___block_invoke;
      v10[3] = &__block_descriptor_36_e9_v16__0_v8l;
      float v11 = a3;
      [(MPContentItem *)v9 _postItemChangedNotificationWithDeltaBlock:v10];
    }
  }
}

- (float)defaultPlaybackRate
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  MEMORY[0x1F412DE98](v2);
  return result;
}

- (void)setComposerName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self composerName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    float v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetComposer();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__MPNowPlayingContentItem_setComposerName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (NSString)composerName
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DE80](v2);
}

- (void)setCollectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self collectionInfo];
  unint64_t v6 = self;
  [(MPContentItem *)v6 _mediaRemoteContentItem];
  MPNowPlayingCollectionInfoToMediaRemote(v4);
  MRContentItemSetCollectionInfo();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MPNowPlayingContentItem_setCollectionInfo___block_invoke_2;
  v8[3] = &unk_1E57F7278;
  id v9 = v4;
  id v7 = v4;
  [(MPContentItem *)v6 _postItemChangedNotificationWithDeltaBlock:v8];
}

- (void)setArtworkIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self artworkIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    float v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetArtworkIdentifier();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__MPNowPlayingContentItem_setArtworkIdentifier___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (NSDate)releaseDate
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSDate *)MEMORY[0x1F412E028](v2);
}

- (NSString)radioStationStringIdentifier
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E018](v2);
}

- (NSString)radioStationName
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E010](v2);
}

- (BOOL)hasLyrics
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF10](v2);
}

- (BOOL)hasDescription
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF00](v2);
}

- (BOOL)hasArtwork
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DEF0](v2);
}

- (NSString)genreName
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DEE8](v2);
}

- (NSString)externalContentIdentifier
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DE88](v2);
}

- (int64_t)editingStyleFlags
{
  return MRContentItemGetEditingStyleFlags() & 3;
}

- (int64_t)discNumber
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DEA8](v2);
}

- (NSString)artworkIdentifier
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DE50](v2);
}

- (void)_mergeContentItem:(id)a3
{
  unint64_t v4 = self;
  id v5 = a3;
  [(MPContentItem *)v4 _mediaRemoteContentItem];
  id v6 = v5;
  [v6 _mediaRemoteContentItem];

  MRContentItemMerge();
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v3 = (const void *)MEMORY[0x19971A190]([(MPContentItem *)self _mediaRemoteContentItem]);
  unint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithMediaRemoteContentItem:v3];
  CFRelease(v3);
  return v4;
}

- (NSArray)currentLanguageOptions
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  CFArrayRef CurrentLanguageOptions = (const __CFArray *)MRContentItemGetCurrentLanguageOptions();
  if (CurrentLanguageOptions)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CFIndex Count = CFArrayGetCount(CurrentLanguageOptions);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        int v7 = [[MPNowPlayingInfoLanguageOption alloc] initWithMRLanguageOption:CFArrayGetValueAtIndex(CurrentLanguageOptions, i)];
        [v3 addObject:v7];
      }
    }
    CFArrayRef CurrentLanguageOptions = (const __CFArray *)[v3 copy];
  }

  return (NSArray *)CurrentLanguageOptions;
}

- (NSArray)availableLanguageOptions
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  CFArrayRef AvailableLanguageOptions = (const __CFArray *)MRContentItemGetAvailableLanguageOptions();
  if (AvailableLanguageOptions)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CFIndex Count = CFArrayGetCount(AvailableLanguageOptions);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        int v7 = [[MPNowPlayingInfoLanguageOptionGroup alloc] initWithMRLanguageOptionGroup:CFArrayGetValueAtIndex(AvailableLanguageOptions, i)];
        [v3 addObject:v7];
      }
    }
    CFArrayRef AvailableLanguageOptions = (const __CFArray *)[v3 copy];
  }

  return (NSArray *)AvailableLanguageOptions;
}

- (void)setLegacyUniqueID:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self legacyUniqueID] != a3)
  {
    CFIndex v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetLegacyUniqueIdentifier();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__MPNowPlayingContentItem_setLegacyUniqueID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (int64_t)legacyUniqueID
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DFA8](v2);
}

- (void)setNowPlayingInfo:(id)a3
{
  CFIndex v5 = self->_nowPlayingInfo;
  id v6 = self;
  id v7 = a3;
  [(MPContentItem *)v6 _mediaRemoteContentItem];
  MRContentItemSetNowPlayingInfo();

  float v8 = v6;
  [(MPContentItem *)v8 _mediaRemoteContentItem];
  id v9 = (NSDictionary *)MRContentItemCopyAuxiliaryNowPlayingInfo();
  if (![(NSDictionary *)v5 isEqualToDictionary:v9])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__MPNowPlayingContentItem_setNowPlayingInfo___block_invoke;
    v11[3] = &unk_1E57F7278;
    v12 = v9;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v11];
  }
  nowPlayingInfo = self->_nowPlayingInfo;
  self->_nowPlayingInfo = v9;
}

- (void)setSongTraits:(unint64_t)a3
{
  if ([(MPNowPlayingContentItem *)self songTraits] != a3)
  {
    CFIndex v5 = self;
    id v6 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    [v6 setSongTraits:a3 & 0x3F];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__MPNowPlayingContentItem_setSongTraits___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v7];
  }
}

- (void)setFormatTierPreference:(unint64_t)a3
{
  if ([(MPNowPlayingContentItem *)self formatTierPreference] != a3)
  {
    CFIndex v5 = self;
    id v6 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    [v6 setFormatTierPreference:a3 & 0x1F];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__MPNowPlayingContentItem_setFormatTierPreference___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v7];
  }
}

- (void)setArtworkDataSource:(id)a3
{
}

- (MPNowPlayingContentItemArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (void)setSharableItem:(BOOL)a3
{
  self->_sharableItem = a3;
}

- (BOOL)isSharableItem
{
  return self->_sharableItem;
}

- (void)setAlternativeFormats:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self alternativeFormats];
  id v6 = v5;
  if (v5 == v4)
  {
  }
  else
  {
    char v7 = [v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      float v8 = self;
      id v9 = [(MPContentItem *)v8 _mediaRemoteContentItem];
      objc_msgSend(v4, "msv_map:", &__block_literal_global_217_41788);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      float v11 = [v9 metadata];
      [v11 setAlternativeFormats:v10];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_4;
      v12[3] = &unk_1E57F7278;
      id v13 = v4;
      [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v12];
    }
  }
}

void __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "msv_map:", &__block_literal_global_223_41790);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [a2 metadata];
  [v3 setAlternativeFormats:v4];
}

uint64_t __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 mediaRemoteAudioFormat];
}

uint64_t __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 mediaRemoteAudioFormat];
}

MPNowPlayingInfoAudioFormat *__45__MPNowPlayingContentItem_alternativeFormats__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MPNowPlayingInfoAudioFormat alloc] initWithMediaRemoteAudioFormat:v2];

  return v3;
}

- (void)setAudioRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self audioRoute];
  id v6 = v5;
  if (v5 == v4)
  {
  }
  else
  {
    char v7 = [v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      float v8 = self;
      id v9 = [(MPContentItem *)v8 _mediaRemoteContentItem];
      id v10 = [v4 mediaRemoteAudioRoute];
      float v11 = [v9 metadata];
      [v11 setAudioRoute:v10];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __41__MPNowPlayingContentItem_setAudioRoute___block_invoke_3;
      v12[3] = &unk_1E57F7278;
      id v13 = v4;
      [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v12];
    }
  }
}

void __41__MPNowPlayingContentItem_setAudioRoute___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) mediaRemoteAudioRoute];
  id v3 = [a2 metadata];
  [v3 setAudioRoute:v4];
}

void __51__MPNowPlayingContentItem_setFormatTierPreference___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32) & 0x1FLL;
  id v3 = [a2 metadata];
  [v3 setFormatTierPreference:v2];
}

- (void)setActiveFormatJustification:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self activeFormatJustification] != a3)
  {
    id v5 = self;
    id v6 = [(MPContentItem *)v5 _mediaRemoteContentItem];
    if (a3 == 1000) {
      uint64_t v7 = 1000;
    }
    else {
      uint64_t v7 = 0;
    }
    if (a3 == 501) {
      uint64_t v7 = 501;
    }
    if (a3 == 500) {
      uint64_t v7 = 500;
    }
    if (a3 == 101) {
      uint64_t v8 = 101;
    }
    else {
      uint64_t v8 = 0;
    }
    if (a3 == 100) {
      uint64_t v8 = 100;
    }
    if (a3 == 1) {
      uint64_t v8 = 1;
    }
    if (a3 <= 499) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    id v10 = [v6 metadata];
    [v10 setActiveFormatJustification:v9];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__MPNowPlayingContentItem_setActiveFormatJustification___block_invoke_3;
    v11[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v11[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v11];
  }
}

void __56__MPNowPlayingContentItem_setActiveFormatJustification___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == 1000) {
    uint64_t v3 = 1000;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v2 == 501) {
    uint64_t v3 = 501;
  }
  if (v2 == 500) {
    uint64_t v3 = 500;
  }
  if (v2 == 101) {
    uint64_t v4 = 101;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v2 == 100) {
    uint64_t v4 = 100;
  }
  if (v2 == 1) {
    uint64_t v4 = 1;
  }
  if (v2 <= 499) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v3;
  }
  id v6 = [a2 metadata];
  [v6 setActiveFormatJustification:v5];
}

- (void)setActiveFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self activeFormat];
  id v6 = v5;
  if (v5 == v4)
  {
  }
  else
  {
    char v7 = [v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = self;
      uint64_t v9 = [(MPContentItem *)v8 _mediaRemoteContentItem];
      id v10 = [v4 mediaRemoteAudioFormat];
      float v11 = [v9 metadata];
      [v11 setActiveFormat:v10];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__MPNowPlayingContentItem_setActiveFormat___block_invoke_3;
      v12[3] = &unk_1E57F7278;
      id v13 = v4;
      [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v12];
    }
  }
}

void __43__MPNowPlayingContentItem_setActiveFormat___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) mediaRemoteAudioFormat];
  uint64_t v3 = [a2 metadata];
  [v3 setActiveFormat:v4];
}

- (void)setPreferredFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self preferredFormat];
  id v6 = v5;
  if (v5 == v4)
  {
  }
  else
  {
    char v7 = [v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = self;
      uint64_t v9 = [(MPContentItem *)v8 _mediaRemoteContentItem];
      id v10 = [v4 mediaRemoteAudioFormat];
      float v11 = [v9 metadata];
      [v11 setPreferredFormat:v10];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__MPNowPlayingContentItem_setPreferredFormat___block_invoke_3;
      v12[3] = &unk_1E57F7278;
      id v13 = v4;
      [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v12];
    }
  }
}

void __46__MPNowPlayingContentItem_setPreferredFormat___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) mediaRemoteAudioFormat];
  uint64_t v3 = [a2 metadata];
  [v3 setPreferredFormat:v4];
}

- (void)setPlaylistTraits:(unint64_t)a3
{
  if ([(MPNowPlayingContentItem *)self playlistTraits] != a3)
  {
    id v5 = self;
    id v6 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    [v6 setPlaylistTraits:a3 & 0x138];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MPNowPlayingContentItem_setPlaylistTraits___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v7];
  }
}

void __45__MPNowPlayingContentItem_setPlaylistTraits___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32) & 0x138;
  id v3 = [a2 metadata];
  [v3 setPlaylistTraits:v2];
}

- (unint64_t)playlistTraits
{
  uint64_t v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  __int16 v3 = [v2 playlistTraits];

  return v3 & 0x138;
}

- (void)setAlbumTraits:(unint64_t)a3
{
  if ([(MPNowPlayingContentItem *)self albumTraits] != a3)
  {
    id v5 = self;
    id v6 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    [v6 setAlbumTraits:a3 & 0x3F];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__MPNowPlayingContentItem_setAlbumTraits___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v7];
  }
}

void __42__MPNowPlayingContentItem_setAlbumTraits___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32) & 0x3FLL;
  id v3 = [a2 metadata];
  [v3 setAlbumTraits:v2];
}

- (unint64_t)albumTraits
{
  uint64_t v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata");
  char v3 = [v2 albumTraits];

  return v3 & 0x3F;
}

void __41__MPNowPlayingContentItem_setSongTraits___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32) & 0x3FLL;
  id v3 = [a2 metadata];
  [v3 setSongTraits:v2];
}

- (void)invalidateArtwork
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MPContentItem *)self identifier];
  v11[0] = v3;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeArtwork();
  id v5 = [(MPContentItem *)self identifier];
  id v6 = (const void *)MRContentItemCreate();

  char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = @"_MPContentItemDidChangeUserInfoKeyDeltaRequest";
  v9[1] = @"_MPContentItemDidChangeUserInfoKeyDeltaItem";
  v10[0] = v4;
  v10[1] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v7 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v8];

  CFRelease(v4);
  CFRelease(v6);
}

- (void)setArtwork:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPNowPlayingContentItem;
  -[MPContentItem setArtwork:](&v5, sel_setArtwork_);
  [(MPNowPlayingContentItem *)self setHasArtwork:a3 != 0];
}

uint64_t __41__MPNowPlayingContentItem_setHasArtwork___block_invoke()
{
  return MRContentItemSetHasArtworkData();
}

- (void)invalidateLyrics
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MPContentItem *)self identifier];
  v11[0] = v3;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeLyrics();
  objc_super v5 = [(MPContentItem *)self identifier];
  id v6 = (const void *)MRContentItemCreate();

  char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = @"_MPContentItemDidChangeUserInfoKeyDeltaRequest";
  v9[1] = @"_MPContentItemDidChangeUserInfoKeyDeltaItem";
  v10[0] = v4;
  v10[1] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v7 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v8];

  CFRelease(v4);
  CFRelease(v6);
}

uint64_t __37__MPNowPlayingContentItem_setLyrics___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) mediaRemoteLyricsItem];

  return MRContentItemSetLyrics();
}

uint64_t __40__MPNowPlayingContentItem_setHasLyrics___block_invoke()
{
  return MRContentItemSetHasLyrics();
}

- (void)invalidateDescription
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MPContentItem *)self identifier];
  v11[0] = v3;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeInfo();
  objc_super v5 = [(MPContentItem *)self identifier];
  id v6 = (const void *)MRContentItemCreate();

  char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = @"_MPContentItemDidChangeUserInfoKeyDeltaRequest";
  v9[1] = @"_MPContentItemDidChangeUserInfoKeyDeltaItem";
  v10[0] = v4;
  v10[1] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v7 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v8];

  CFRelease(v4);
  CFRelease(v6);
}

uint64_t __45__MPNowPlayingContentItem_setHasDescription___block_invoke()
{
  return MRContentItemSetHasInfo();
}

- (void)setSections:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MPNowPlayingContentItem *)self sections];
  id v6 = self;
  [(MPContentItem *)v6 _mediaRemoteContentItem];
  id v7 = v4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13++), "_mediaRemoteContentItem"));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  MRContentItemSetSections();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__MPNowPlayingContentItem_setSections___block_invoke_2;
  v15[3] = &unk_1E57F7278;
  id v16 = v9;
  id v14 = v9;
  [(MPContentItem *)v6 _postItemChangedNotificationWithDeltaBlock:v15];
}

uint64_t __39__MPNowPlayingContentItem_setSections___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v10 + 1) + 8 * v7);
        objc_msgSend(v2, "addObject:", objc_msgSend(v8, "_mediaRemoteContentItem", (void)v10));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return MRContentItemSetSections();
}

- (NSArray)sections
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  id v2 = (id)MRContentItemGetSections();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v2 count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v2 objectAtIndexedSubscript:v4];

      id v6 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:v5];
      [v3 addObject:v6];

      ++v4;
    }
    while (v4 < [v2 count]);
  }

  return (NSArray *)v3;
}

- (void)invalidateSections
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MPContentItem *)self identifier];
  v11[0] = v3;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  unint64_t v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeSections();
  uint64_t v5 = [(MPContentItem *)self identifier];
  id v6 = (const void *)MRContentItemCreate();

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = @"_MPContentItemDidChangeUserInfoKeyDeltaRequest";
  v9[1] = @"_MPContentItemDidChangeUserInfoKeyDeltaItem";
  v10[0] = v4;
  v10[1] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v7 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v8];

  CFRelease(v4);
  CFRelease(v6);
}

- (void)invalidateLanguageOptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MPContentItem *)self identifier];
  v11[0] = v3;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  unint64_t v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeLanguageOptions();
  uint64_t v5 = [(MPContentItem *)self identifier];
  id v6 = (const void *)MRContentItemCreate();

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = @"_MPContentItemDidChangeUserInfoKeyDeltaRequest";
  v9[1] = @"_MPContentItemDidChangeUserInfoKeyDeltaItem";
  v10[0] = v4;
  v10[1] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v7 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v8];

  CFRelease(v4);
  CFRelease(v6);
}

- (void)setCurrentLanguageOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MPNowPlayingContentItem *)self currentLanguageOptions];
  id v6 = self;
  [(MPContentItem *)v6 _mediaRemoteContentItem];
  id v7 = v4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13++), "mrLanguageOption"));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v14 = (void *)[v8 copy];
  id v15 = v14;
  MRContentItemSetCurrentLanguageOptions();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__MPNowPlayingContentItem_setCurrentLanguageOptions___block_invoke_2;
  v17[3] = &unk_1E57F7278;
  id v18 = v9;
  id v16 = v9;
  [(MPContentItem *)v6 _postItemChangedNotificationWithDeltaBlock:v17];
}

uint64_t __53__MPNowPlayingContentItem_setCurrentLanguageOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7++), "mrLanguageOption", (void)v11));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v8 = (void *)[v2 copy];
  id v9 = v8;

  return MRContentItemSetCurrentLanguageOptions();
}

- (void)setAvailableLanguageOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MPNowPlayingContentItem *)self availableLanguageOptions];
  uint64_t v6 = self;
  [(MPContentItem *)v6 _mediaRemoteContentItem];
  id v7 = v4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13++), "mrLanguageOptionGroup"));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  long long v14 = (void *)[v8 copy];
  id v15 = v14;
  MRContentItemSetAvailableLanguageOptions();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__MPNowPlayingContentItem_setAvailableLanguageOptions___block_invoke_2;
  v17[3] = &unk_1E57F7278;
  id v18 = v9;
  id v16 = v9;
  [(MPContentItem *)v6 _postItemChangedNotificationWithDeltaBlock:v17];
}

uint64_t __55__MPNowPlayingContentItem_setAvailableLanguageOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7++), "mrLanguageOptionGroup", (void)v11));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v8 = (void *)[v2 copy];
  id v9 = v8;

  return MRContentItemSetAvailableLanguageOptions();
}

- (void)setHasLanguageOptions:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self hasLanguageOptions] != a3)
  {
    uint64_t v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetHasLanguageOptions();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__MPNowPlayingContentItem_setHasLanguageOptions___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __49__MPNowPlayingContentItem_setHasLanguageOptions___block_invoke()
{
  return MRContentItemSetHasLanguageOptions();
}

- (BOOL)hasLanguageOptions
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF08](v2);
}

- (void)invalidateTranscriptAlignments
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MPContentItem *)self identifier];
  v11[0] = v3;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v4 = (void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  [v4 setIncludeAlignments:1];
  uint64_t v5 = [(MPContentItem *)self identifier];
  uint64_t v6 = (const void *)MRContentItemCreate();

  BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = @"_MPContentItemDidChangeUserInfoKeyDeltaRequest";
  v9[1] = @"_MPContentItemDidChangeUserInfoKeyDeltaItem";
  v10[0] = v4;
  v10[1] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v7 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v8];

  CFRelease(v4);
  CFRelease(v6);
}

- (void)setTranscriptAlignments:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPNowPlayingContentItem *)self transcriptAlignments];
  uint64_t v6 = self;
  [(MPContentItem *)v6 _mediaRemoteContentItem];
  objc_msgSend(v4, "msv_map:", &__block_literal_global_52);
  MRContentItemSetTranscriptAlignments();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_3;
  v8[3] = &unk_1E57F7278;
  id v9 = v4;
  id v7 = v4;
  [(MPContentItem *)v6 _postItemChangedNotificationWithDeltaBlock:v8];
}

uint64_t __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "msv_map:", &__block_literal_global_56_41809);

  return MRContentItemSetTranscriptAlignments();
}

uint64_t __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 mrTranscriptAlignment];
}

uint64_t __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 mrTranscriptAlignment];
}

- (NSArray)transcriptAlignments
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  CFArrayRef TranscriptAlignments = (const __CFArray *)MRContentItemGetTranscriptAlignments();
  if (TranscriptAlignments)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CFIndex Count = CFArrayGetCount(TranscriptAlignments);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        id v7 = CFArrayGetValueAtIndex(TranscriptAlignments, i);
        if (v7)
        {
          id v8 = [[MPNowPlayingInfoTranscriptAlignment alloc] initWithMRTranscriptAlignment:v7];
          [v3 addObject:v8];
        }
      }
    }
    CFArrayRef TranscriptAlignments = (const __CFArray *)[v3 copy];
  }

  return (NSArray *)TranscriptAlignments;
}

- (void)setHasTranscriptAlignments:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self hasTranscriptAlignments] != a3)
  {
    CFIndex v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetHasTranscriptAlignments();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__MPNowPlayingContentItem_setHasTranscriptAlignments___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __54__MPNowPlayingContentItem_setHasTranscriptAlignments___block_invoke()
{
  return MRContentItemSetHasTranscriptAlignments();
}

- (BOOL)hasTranscriptAlignments
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF20](v2);
}

- (void)setElapsedTime:(double)a3 playbackRate:(float)a4
{
  int v7 = _AXSHapticMusicEnabled();
  [(MPNowPlayingContentItem *)self playbackRate];
  float v9 = v8 - a4;
  if (v9 >= 0.0) {
    float v10 = v9;
  }
  else {
    float v10 = -v9;
  }
  [(MPNowPlayingContentItem *)self calculatedElapsedTime];
  if (v10 > 2.2204e-16) {
    goto LABEL_9;
  }
  double v12 = v11 - a3;
  if (v12 < 0.0) {
    double v12 = -v12;
  }
  if (v12 > dbl_195689880[v7 == 0] || !self->_didSetElapsedTime)
  {
LABEL_9:
    [(MPNowPlayingContentItem *)self setElapsedTime:a3];
    *(float *)&double v13 = a4;
    [(MPNowPlayingContentItem *)self setPlaybackRate:v13];
    self->_didSetElapsedTime = 1;
  }
}

- (double)calculatedElapsedTime
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(MPNowPlayingContentItem *)self elapsedTime];
  double v6 = v5;
  [(MPNowPlayingContentItem *)self elapsedTimeTimestamp];
  double v8 = v4 - v7;
  [(MPNowPlayingContentItem *)self playbackRate];
  double v10 = v6 + v8 * v9;
  [(MPNowPlayingContentItem *)self duration];
  if (v10 < result) {
    return v10;
  }
  return result;
}

uint64_t __40__MPNowPlayingContentItem_setMediaType___block_invoke()
{
  MRContentItemSetMediaType();

  return MRContentItemSetMediaSubType();
}

uint64_t __45__MPNowPlayingContentItem_setCollectionInfo___block_invoke_2(uint64_t a1)
{
  MPNowPlayingCollectionInfoToMediaRemote(*(void **)(a1 + 32));

  return MRContentItemSetCollectionInfo();
}

uint64_t __43__MPNowPlayingContentItem_setPlaybackRate___block_invoke()
{
  return MRContentItemSetPlaybackRate();
}

uint64_t __42__MPNowPlayingContentItem_setElapsedTime___block_invoke()
{
  return MRContentItemSetElapsedTime();
}

uint64_t __42__MPNowPlayingContentItem_setElapsedTime___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _mediaRemoteContentItem];
  MRContentItemGetElapsedTimeTimestamp();

  return MEMORY[0x1F412E168](a2);
}

uint64_t __48__MPNowPlayingContentItem_setEditingStyleFlags___block_invoke_2()
{
  return MRContentItemSetEditingStyleFlags();
}

- (void)setEpisodeType:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self episodeType] != a3)
  {
    double v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetEpisodeType();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__MPNowPlayingContentItem_setEpisodeType___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __42__MPNowPlayingContentItem_setEpisodeType___block_invoke_2()
{
  return MRContentItemSetEpisodeType();
}

- (int64_t)episodeType
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  int64_t result = MRContentItemGetEpisodeType();
  if ((unint64_t)(result - 1) >= 6) {
    return 0;
  }
  return result;
}

- (void)setRadioStationType:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self radioStationType] != a3)
  {
    double v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetRadioStationType();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__MPNowPlayingContentItem_setRadioStationType___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __47__MPNowPlayingContentItem_setRadioStationType___block_invoke_2()
{
  return MRContentItemSetRadioStationType();
}

- (int64_t)radioStationType
{
  return MRContentItemGetRadioStationType() == 1;
}

- (void)setPlaylistType:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self playlistType] != a3)
  {
    double v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetPlaylistType();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setPlaylistType___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __43__MPNowPlayingContentItem_setPlaylistType___block_invoke_2()
{
  return MRContentItemSetPlaylistType();
}

- (int64_t)playlistType
{
  [(MPContentItem *)self _mediaRemoteContentItem];
  int64_t result = MRContentItemGetPlaylistType();
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

- (void)setRemoteArtworks:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self remoteArtworks];
  if (v5 == v4)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      double v8 = objc_msgSend(v4, "msv_mapValues:", &__block_literal_global_6_41815);
      float v9 = self;
      objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v9, "_mediaRemoteContentItem"), "setRemoteArtworks:", v8);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __45__MPNowPlayingContentItem_setRemoteArtworks___block_invoke_2;
      v11[3] = &unk_1E57F7278;
      id v12 = v8;
      id v10 = v8;
      [(MPContentItem *)v9 _postItemChangedNotificationWithDeltaBlock:v11];
    }
  }
}

uint64_t __45__MPNowPlayingContentItem_setRemoteArtworks___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setRemoteArtworks:*(void *)(a1 + 32)];
}

uint64_t __45__MPNowPlayingContentItem_setRemoteArtworks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 mediaRemoteRemoteArtwork];
}

- (NSDictionary)remoteArtworks
{
  id v2 = objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "remoteArtworks");
  double v3 = objc_msgSend(v2, "msv_mapValues:", &__block_literal_global_41818);

  return (NSDictionary *)v3;
}

MPNowPlayingContentItemRemoteArtwork *__41__MPNowPlayingContentItem_remoteArtworks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [[MPNowPlayingContentItemRemoteArtwork alloc] initWithMediaRemoteRemoteArtwork:v3];

  return v4;
}

- (void)setSupportedRemoteArtworkFormats:(id)a3
{
  id v4 = a3;
  id v5 = [(MPNowPlayingContentItem *)self supportedRemoteArtworkFormats];
  if (v5 == v4)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      double v8 = self;
      objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem"), "setAvailableRemoteArtworkFormats:", v4);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __60__MPNowPlayingContentItem_setSupportedRemoteArtworkFormats___block_invoke;
      v9[3] = &unk_1E57F7278;
      id v10 = v4;
      [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
    }
  }
}

uint64_t __60__MPNowPlayingContentItem_setSupportedRemoteArtworkFormats___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAvailableRemoteArtworkFormats:*(void *)(a1 + 32)];
}

- (NSArray)supportedRemoteArtworkFormats
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSArray *)[v2 availableRemoteArtworkFormats];
}

uint64_t __62__MPNowPlayingContentItem_setAssociatedParticipantIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAssociatedParticipantIdentifier:*(void *)(a1 + 32)];
}

uint64_t __49__MPNowPlayingContentItem_setStoreAlbumArtistID___block_invoke()
{
  return MRContentItemSetITunesStoreAlbumArtistIdentifier();
}

uint64_t __43__MPNowPlayingContentItem_setLyricsAdamID___block_invoke()
{
  return MRContentItemSetLyricsAdamID();
}

uint64_t __46__MPNowPlayingContentItem_setReportingAdamID___block_invoke()
{
  return MRContentItemSetReportingAdamID();
}

uint64_t __45__MPNowPlayingContentItem_setLegacyUniqueID___block_invoke()
{
  return MRContentItemSetLegacyUniqueIdentifier();
}

uint64_t __50__MPNowPlayingContentItem_setStoreSubscriptionID___block_invoke()
{
  return MRContentItemSetITunesStoreSubscriptionIdentifier();
}

uint64_t __38__MPNowPlayingContentItem_setStoreID___block_invoke()
{
  return MRContentItemSetITunesStoreIdentifier();
}

uint64_t __44__MPNowPlayingContentItem_setStoreArtistID___block_invoke()
{
  return MRContentItemSetITunesStoreArtistIdentifier();
}

uint64_t __43__MPNowPlayingContentItem_setStoreAlbumID___block_invoke()
{
  return MRContentItemSetITunesStoreAlbumIdentifier();
}

- (void)setNumberOfChildren:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self numberOfChildren] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetNumberOfSections();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__MPNowPlayingContentItem_setNumberOfChildren___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
  [(MPNowPlayingContentItem *)self invalidateSections];
}

uint64_t __47__MPNowPlayingContentItem_setNumberOfChildren___block_invoke()
{
  return MRContentItemSetNumberOfSections();
}

- (int64_t)numberOfChildren
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DFE0](v2);
}

uint64_t __43__MPNowPlayingContentItem_setInTransition___block_invoke()
{
  return MRContentItemSetIsInTransition();
}

uint64_t __38__MPNowPlayingContentItem_setLoading___block_invoke()
{
  return MRContentItemSetIsLoading();
}

- (void)setSteerable:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self isSteerable] != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata"), id v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasSteerable"), v5, (v6 & 1) == 0))
  {
    char v7 = self;
    [(MPContentItem *)v7 _mediaRemoteContentItem];
    MRContentItemSetIsSteerable();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__MPNowPlayingContentItem_setSteerable___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v9 = a3;
    [(MPContentItem *)v7 _postItemChangedNotificationWithDeltaBlock:v8];
  }
}

uint64_t __40__MPNowPlayingContentItem_setSteerable___block_invoke()
{
  return MRContentItemSetIsSteerable();
}

- (BOOL)isSteerable
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF98](v2);
}

- (void)setAdvertisement:(BOOL)a3
{
  if ([(MPNowPlayingContentItem *)self isAdvertisement] != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](self, "_mediaRemoteContentItem"), "metadata"), id v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasAdvertisement"), v5, (v6 & 1) == 0))
  {
    char v7 = self;
    [(MPContentItem *)v7 _mediaRemoteContentItem];
    MRContentItemSetIsAdvertisement();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__MPNowPlayingContentItem_setAdvertisement___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v9 = a3;
    [(MPContentItem *)v7 _postItemChangedNotificationWithDeltaBlock:v8];
  }
}

uint64_t __44__MPNowPlayingContentItem_setAdvertisement___block_invoke()
{
  return MRContentItemSetIsAdvertisement();
}

- (BOOL)isAdvertisement
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF60](v2);
}

uint64_t __45__MPNowPlayingContentItem_setAlwaysLiveItem___block_invoke()
{
  return MRContentItemSetIsAlwaysLive();
}

- (void)setServiceIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self serviceIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetServiceIdentifier();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __48__MPNowPlayingContentItem_setServiceIdentifier___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __48__MPNowPlayingContentItem_setServiceIdentifier___block_invoke()
{
  return MRContentItemSetServiceIdentifier();
}

- (NSString)serviceIdentifier
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E050](v2);
}

uint64_t __56__MPNowPlayingContentItem_setExternalContentIdentifier___block_invoke()
{
  return MRContentItemSetContentIdentifier();
}

uint64_t __59__MPNowPlayingContentItem_setRadioStationStringIdentifier___block_invoke()
{
  return MRContentItemSetRadioStationString();
}

uint64_t __40__MPNowPlayingContentItem_setGenreName___block_invoke()
{
  return MRContentItemSetGenre();
}

uint64_t __43__MPNowPlayingContentItem_setComposerName___block_invoke()
{
  return MRContentItemSetComposer();
}

uint64_t __42__MPNowPlayingContentItem_setTrackNumber___block_invoke()
{
  return MRContentItemSetTrackNumber();
}

uint64_t __46__MPNowPlayingContentItem_setTotalTrackCount___block_invoke()
{
  return MRContentItemSetTotalTrackCount();
}

uint64_t __45__MPNowPlayingContentItem_setTotalDiscCount___block_invoke()
{
  return MRContentItemSetTotalDiscCount();
}

- (void)setSeasonNumber:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self seasonNumber] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetSeasonNumber();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setSeasonNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __43__MPNowPlayingContentItem_setSeasonNumber___block_invoke()
{
  return MRContentItemSetSeasonNumber();
}

- (int64_t)seasonNumber
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412E038](v2);
}

- (void)setPlayCount:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self playCount] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetPlayCount();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__MPNowPlayingContentItem_setPlayCount___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __40__MPNowPlayingContentItem_setPlayCount___block_invoke()
{
  return MRContentItemSetPlayCount();
}

- (int64_t)playCount
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DFE8](v2);
}

- (void)setEpisodeNumber:(int64_t)a3
{
  if ([(MPNowPlayingContentItem *)self episodeNumber] != a3)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetEpisodeNumber();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__MPNowPlayingContentItem_setEpisodeNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    void v6[4] = a3;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __44__MPNowPlayingContentItem_setEpisodeNumber___block_invoke()
{
  return MRContentItemSetEpisodeNumber();
}

- (int64_t)episodeNumber
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DED8](v2);
}

uint64_t __41__MPNowPlayingContentItem_setDiscNumber___block_invoke()
{
  return MRContentItemSetDiscNumber();
}

uint64_t __50__MPNowPlayingContentItem_setDefaultPlaybackRate___block_invoke()
{
  return MRContentItemSetDefaultPlaybackRate();
}

uint64_t __40__MPNowPlayingContentItem_setStartTime___block_invoke()
{
  return MRContentItemSetStartTime();
}

uint64_t __39__MPNowPlayingContentItem_setDuration___block_invoke()
{
  return MRContentItemSetDuration();
}

- (void)setDurationStringLocalizationKey:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self durationStringLocalizationKey];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetDurationStringLocalizationKey();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __60__MPNowPlayingContentItem_setDurationStringLocalizationKey___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __60__MPNowPlayingContentItem_setDurationStringLocalizationKey___block_invoke()
{
  return MRContentItemSetDurationStringLocalizationKey();
}

- (NSString)durationStringLocalizationKey
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DEB8](v2);
}

- (void)setLocalizedDurationString:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self localizedDurationString];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetLocalizedDurationString();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __54__MPNowPlayingContentItem_setLocalizedDurationString___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __54__MPNowPlayingContentItem_setLocalizedDurationString___block_invoke()
{
  return MRContentItemSetLocalizedDurationString();
}

uint64_t __48__MPNowPlayingContentItem_setArtworkIdentifier___block_invoke()
{
  return MRContentItemSetArtworkIdentifier();
}

- (void)setArtworkURLTemplates:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self artworkURLTemplates];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetArtworkURLTemplates();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __50__MPNowPlayingContentItem_setArtworkURLTemplates___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __50__MPNowPlayingContentItem_setArtworkURLTemplates___block_invoke()
{
  return MRContentItemSetArtworkURLTemplates();
}

- (NSArray)artworkURLTemplates
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSArray *)MEMORY[0x1F412DE60](v2);
}

- (void)setArtworkURL:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self artworkURL];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetArtworkURL();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __41__MPNowPlayingContentItem_setArtworkURL___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __41__MPNowPlayingContentItem_setArtworkURL___block_invoke()
{
  return MRContentItemSetArtworkURL();
}

- (NSString)artworkURL
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DE58](v2);
}

uint64_t __46__MPNowPlayingContentItem_setTrackArtistName___block_invoke()
{
  return MRContentItemSetTrackArtistName();
}

- (void)setSeriesName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self seriesName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetSeriesName();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __41__MPNowPlayingContentItem_setSeriesName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __41__MPNowPlayingContentItem_setSeriesName___block_invoke()
{
  return MRContentItemSetSeriesName();
}

- (NSString)seriesName
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E048](v2);
}

uint64_t __47__MPNowPlayingContentItem_setRadioStationName___block_invoke()
{
  return MRContentItemSetRadioStationName();
}

- (void)setProfileIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self profileIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetProfileIdentifier();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __48__MPNowPlayingContentItem_setProfileIdentifier___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __48__MPNowPlayingContentItem_setProfileIdentifier___block_invoke()
{
  return MRContentItemSetProfileIdentifier();
}

- (NSString)profileIdentifier
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E008](v2);
}

- (void)setLocalizedContentRating:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self localizedContentRating];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetLocalizedContentRating();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __53__MPNowPlayingContentItem_setLocalizedContentRating___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __53__MPNowPlayingContentItem_setLocalizedContentRating___block_invoke()
{
  return MRContentItemSetLocalizedContentRating();
}

- (NSString)localizedContentRating
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DFB0](v2);
}

- (void)setInfo:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self info];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetInfo();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __35__MPNowPlayingContentItem_setInfo___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __35__MPNowPlayingContentItem_setInfo___block_invoke()
{
  return MRContentItemSetInfo();
}

- (NSString)info
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DF58](v2);
}

- (void)setDirectorName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self directorName];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetDirectorName();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __43__MPNowPlayingContentItem_setDirectorName___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __43__MPNowPlayingContentItem_setDirectorName___block_invoke()
{
  return MRContentItemSetDirectorName();
}

- (NSString)directorName
{
  id v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412DEA0](v2);
}

- (void)setCollectionIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(MPNowPlayingContentItem *)self collectionIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {
  }
  else
  {
    int v7 = [v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!(v4 | v6))
  {
LABEL_6:
    double v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetCollectionIdentifier();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __51__MPNowPlayingContentItem_setCollectionIdentifier___block_invoke;
    v9[3] = &unk_1E57F7278;
    id v10 = (id)v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __51__MPNowPlayingContentItem_setCollectionIdentifier___block_invoke()
{
  return MRContentItemSetCollectionIdentifier();
}

uint64_t __40__MPNowPlayingContentItem_setAlbumYear___block_invoke()
{
  return MRContentItemSetAlbumYear();
}

uint64_t __40__MPNowPlayingContentItem_setAlbumName___block_invoke()
{
  return MRContentItemSetAlbumName();
}

uint64_t __46__MPNowPlayingContentItem_setAlbumArtistName___block_invoke()
{
  return MRContentItemSetAlbumArtistName();
}

uint64_t __39__MPNowPlayingContentItem_setUserInfo___block_invoke()
{
  return MRContentItemSetUserInfo();
}

uint64_t __53__MPNowPlayingContentItem_setDeviceSpecificUserInfo___block_invoke()
{
  return MRContentItemSetDeviceSpecificUserInfo();
}

uint64_t __42__MPNowPlayingContentItem_setReleaseDate___block_invoke()
{
  return MRContentItemSetReleaseDate();
}

- (id)copyWithNewIdentifier:(id)a3
{
  unint64_t v4 = self;
  id v5 = a3;
  [(MPContentItem *)v4 _mediaRemoteContentItem];
  unint64_t v6 = (const void *)MRContentItemCopyWithIdentifier();

  int v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithMediaRemoteContentItem:v6];
  CFRelease(v6);
  return v7;
}

+ (BOOL)shouldPushArtworkData
{
  return 0;
}

@end