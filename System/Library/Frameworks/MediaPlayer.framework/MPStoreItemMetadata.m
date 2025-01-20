@interface MPStoreItemMetadata
+ (BOOL)supportsSecureCoding;
+ (id)artworkRequestTokenForStorePlatformArtworkValue:(id)a3;
+ (id)storeServerCalendar;
- (BOOL)hasArtistBiography;
- (BOOL)hasCredits;
- (BOOL)hasLyrics;
- (BOOL)hasMetadataForRequestReason:(unint64_t)a3;
- (BOOL)hasSocialPosts;
- (BOOL)hasSubscriptionOffer;
- (BOOL)hasTimeSyncedLyrics;
- (BOOL)isBeats1;
- (BOOL)isChart;
- (BOOL)isCollaborative;
- (BOOL)isCompilation;
- (BOOL)isExpired;
- (BOOL)isExplicitContent;
- (BOOL)isLive;
- (BOOL)isMasteredForiTunes;
- (BOOL)isOnboardedPerson;
- (BOOL)isPreorder;
- (BOOL)isPrivatePerson;
- (BOOL)isStoreRedownloadable;
- (BOOL)isVerifiedPerson;
- (BOOL)radioStationIsSubscriptionOnly;
- (BOOL)shouldReportPlayEvents;
- (BOOL)showComposer;
- (BOOL)supportsSing;
- (BOOL)supportsVocalAttenuation;
- (MPStoreArtworkRequestToken)artworkRequestToken;
- (MPStoreArtworkRequestToken)latestAlbumArtworkRequestToken;
- (MPStoreItemMetadata)initWithCoder:(id)a3;
- (MPStoreItemMetadata)initWithDownloadAssetDictionary:(id)a3;
- (MPStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3;
- (MPStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3 parentStoreItemMetadata:(id)a4;
- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3;
- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 expirationDate:(id)a4;
- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4;
- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4 expirationDate:(id)a5;
- (MPStoreItemMetadata)metadataWithChildStorePlatformDictionaries:(id)a3;
- (MPStoreItemMetadata)metadataWithParentMetadata:(id)a3;
- (MPStoreItemMetadata)parentStoreItemMetadata;
- (NSArray)artworkTrackIDs;
- (NSArray)audioTraits;
- (NSArray)childStoreItemMetadatas;
- (NSArray)childrenStoreIDs;
- (NSArray)formerStoreAdamIDs;
- (NSArray)genreNames;
- (NSArray)movieClips;
- (NSArray)offers;
- (NSArray)playlistIdentifiers;
- (NSArray)radioStationEvents;
- (NSDate)endingAirDate;
- (NSDate)expirationDate;
- (NSDate)lastModifiedDate;
- (NSDate)releaseDate;
- (NSDate)startingAirDate;
- (NSDictionary)effectiveStorePlatformDictionary;
- (NSDictionary)importableStorePlatformDictionary;
- (NSNumber)popularity;
- (NSNumber)shouldBookmarkPlayPosition;
- (NSString)artistName;
- (NSString)artistUploadedContentType;
- (NSString)cacheableItemIdentifier;
- (NSString)cloudAlbumID;
- (NSString)cloudUniversalLibraryID;
- (NSString)collectionName;
- (NSString)composerName;
- (NSString)copyrightText;
- (NSString)curatorHandle;
- (NSString)curatorName;
- (NSString)descriptionText;
- (NSString)editorNotes;
- (NSString)handle;
- (NSString)iTunesBrandType;
- (NSString)itemKind;
- (NSString)movementName;
- (NSString)name;
- (NSString)nameRaw;
- (NSString)personalMixSortKey;
- (NSString)playlistType;
- (NSString)radioStationProviderName;
- (NSString)radioStationSubtype;
- (NSString)shortDescriptionText;
- (NSString)shortEditorNotes;
- (NSString)shortName;
- (NSString)versionHash;
- (NSString)videoSubtype;
- (NSString)workName;
- (NSURL)URL;
- (NSURL)classicalURL;
- (NSURL)shortURL;
- (double)duration;
- (id)_fetchValueFromStoreMusicAPIDictionary:(id)a3;
- (id)_musicAPIDateFormatter;
- (id)_storePlatformLastModifiedDateFormatter;
- (id)_storePlatformReleaseDateFormatter;
- (id)artistStoreID;
- (id)artworkRequestTokenForEditorialArtworkKind:(id)a3;
- (id)artworkRequestTokenForScreenshotArtwork;
- (id)artworkRequestTokenForStoreMusicAPIDictionary;
- (id)artworkRequestTokenForStorePlatformDictionary:(id)a3;
- (id)artworkRequestTokenForUberArtworkKind:(id)a3;
- (id)avatarArtworkRequestToken;
- (id)brickEditorialArtworkRequestToken;
- (id)childStorePlatformDictionaryForArtworkTrackID:(id)a3;
- (id)childStorePlatformDictionaryForStoreID:(id)a3;
- (id)collectionStoreID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)curatorID;
- (id)description;
- (id)descriptionTextWithStyle:(id)a3;
- (id)editorNotesWithStyle:(id)a3;
- (id)flowcaseEditorialArtworkRequestToken;
- (id)metadataByAppendingMetadata:(id)a3;
- (id)movieArtworkRequestToken;
- (id)socialProfileID;
- (id)stationGlyphRequestTokenForStoreMusicAPIDictionary;
- (id)stationGlyphRequestTokenForStorePlatformDictionary:(id)a3;
- (id)storeID;
- (id)tvEpisodeArtworkRequestToken;
- (id)tvShowArtworkRequestToken;
- (int64_t)discCount;
- (int64_t)discNumber;
- (int64_t)episodeCount;
- (int64_t)explicitRating;
- (int64_t)movementCount;
- (int64_t)movementNumber;
- (int64_t)movieClipsCount;
- (int64_t)purchasedAdamID;
- (int64_t)radioStationTypeID;
- (int64_t)seasonNumber;
- (int64_t)subscriptionAdamID;
- (int64_t)trackCount;
- (int64_t)trackNumber;
- (unint64_t)cloudID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPStoreItemMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentStoreItemMetadata, 0);
  objc_storeStrong((id *)&self->_storePlatformDictionary, 0);
  objc_storeStrong((id *)&self->_overrideChildStorePlatformDictionaries, 0);
  objc_storeStrong((id *)&self->_hasSubscriptionOffer, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_storeMusicAPIDictionary, 0);
  objc_storeStrong((id *)&self->_downloadMetadataDictionary, 0);

  objc_storeStrong((id *)&self->_downloadAssetDictionary, 0);
}

- (MPStoreItemMetadata)parentStoreItemMetadata
{
  return self->_parentStoreItemMetadata;
}

- (id)_fetchValueFromStoreMusicAPIDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_storeMusicAPIDictionary valueForKeyPath:v4];
  if (!v5)
  {
    v6 = [(NSDictionary *)self->_storeMusicAPIDictionary objectForKey:@"attributes"];
    if (!_NSIsNSDictionary()
      || ([v6 valueForKeyPath:v4], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v7 = [(NSDictionary *)self->_storeMusicAPIDictionary objectForKey:@"relationships"];
      if (_NSIsNSDictionary())
      {
        v5 = [v7 valueForKeyPath:v4];
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (id)_storePlatformLastModifiedDateFormatter
{
  if (_storePlatformLastModifiedDateFormatter_sOnceToken != -1) {
    dispatch_once(&_storePlatformLastModifiedDateFormatter_sOnceToken, &__block_literal_global_589);
  }
  v2 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;

  return v2;
}

void __62__MPStoreItemMetadata__storePlatformLastModifiedDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  _storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter = (uint64_t)v0;

  [(id)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v2 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];

  [(id)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter setLenient:1];
  v6 = (void *)_storePlatformLastModifiedDateFormatter_sStorePlatformLastModifiedDateFormatter;
  id v7 = +[MPStoreItemMetadata storeServerCalendar];
  [v6 setCalendar:v7];
}

- (id)_musicAPIDateFormatter
{
  if (_musicAPIDateFormatter_sOnceToken != -1) {
    dispatch_once(&_musicAPIDateFormatter_sOnceToken, &__block_literal_global_586);
  }
  v2 = (void *)_musicAPIDateFormatter_sMusicAPIDateFormatter;

  return v2;
}

void __45__MPStoreItemMetadata__musicAPIDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_musicAPIDateFormatter_sMusicAPIDateFormatter;
  _musicAPIDateFormatter_sMusicAPIDateFormatter = v0;
}

- (id)_storePlatformReleaseDateFormatter
{
  if (_storePlatformReleaseDateFormatter_sOnceToken != -1) {
    dispatch_once(&_storePlatformReleaseDateFormatter_sOnceToken, &__block_literal_global_576);
  }
  v2 = (void *)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;

  return v2;
}

void __57__MPStoreItemMetadata__storePlatformReleaseDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter;
  _storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter = (uint64_t)v0;

  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter setLocale:v2];
  [(id)_storePlatformReleaseDateFormatter_sStorePlatformReleaseDateFormatter setDateFormat:@"YYYY-MM-dd"];
}

- (MPStoreItemMetadata)metadataWithParentMetadata:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(MPStoreItemMetadata *)self copy];
  id v7 = (void *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 72), a3);
  }

  return (MPStoreItemMetadata *)v7;
}

- (MPStoreItemMetadata)metadataWithChildStorePlatformDictionaries:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(MPStoreItemMetadata *)self copy];
  id v7 = (void *)v6;
  if (v6)
  {
    *(unsigned char *)(v6 + 40) = 1;
    objc_storeStrong((id *)(v6 + 56), a3);
  }

  return (MPStoreItemMetadata *)v7;
}

- (id)metadataByAppendingMetadata:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (v4)
  {
    uint64_t v6 = (MPStoreItemMetadata *)v4;
    id v7 = v6;
    if (v5->_downloadAssetDictionary && !v6->_downloadAssetDictionary)
    {

      v8 = v5;
    }
    else
    {
      v8 = v6;
      id v7 = v5;
    }
    parentStoreItemMetadata = v8->_parentStoreItemMetadata;
    if (!parentStoreItemMetadata) {
      parentStoreItemMetadata = v7->_parentStoreItemMetadata;
    }
    v10 = parentStoreItemMetadata;
    v11 = v8;
    if (v8->_hasOverrideChildStorePlatformDictionaries || (v11 = v7, v7->_hasOverrideChildStorePlatformDictionaries))
    {
      v12 = v11->_overrideChildStorePlatformDictionaries;
      char v13 = 1;
    }
    else
    {
      char v13 = 0;
      v12 = 0;
    }
    v14 = v7->_storePlatformDictionary;
    storePlatformDictionary = v8->_storePlatformDictionary;
    v29 = v10;
    if (v14)
    {
      v16 = v14;
      if (storePlatformDictionary)
      {
        v17 = (NSDictionary *)[(NSDictionary *)v14 mutableCopy];

        [(NSDictionary *)v17 addEntriesFromDictionary:v8->_storePlatformDictionary];
        v16 = v17;
      }
    }
    else
    {
      v16 = storePlatformDictionary;
    }
    v18 = v7->_downloadAssetDictionary;
    downloadAssetDictionary = v8->_downloadAssetDictionary;
    if (v18)
    {
      v20 = v18;
      if (downloadAssetDictionary)
      {
        v21 = (NSDictionary *)[(NSDictionary *)v18 mutableCopy];

        [(NSDictionary *)v21 addEntriesFromDictionary:v8->_downloadAssetDictionary];
        v20 = v21;
      }
    }
    else
    {
      v20 = downloadAssetDictionary;
    }
    uint64_t v22 = [objc_alloc((Class)objc_opt_class()) initWithDownloadAssetDictionary:v20];
    id v5 = (MPStoreItemMetadata *)v22;
    if (v22)
    {
      *(unsigned char *)(v22 + 40) = v13;
      objc_storeStrong((id *)(v22 + 56), v12);
      objc_storeStrong((id *)&v5->_parentStoreItemMetadata, parentStoreItemMetadata);
      objc_storeStrong((id *)&v5->_storePlatformDictionary, v16);
      v23 = v8->_expirationDate;
      v24 = v7->_expirationDate;
      v25 = v24;
      if (v23 && v24)
      {
        v26 = [(NSDate *)v23 earlierDate:v24];
      }
      else if (v23)
      {
        v26 = v23;
      }
      else
      {
        v26 = v24;
      }
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = v26;
    }
  }

  return v5;
}

- (id)brickEditorialArtworkRequestToken
{
  v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"subscriptionCover"];
  if (!v3)
  {
    v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"subscriptionHero"];
  }
  [v3 setCropStyle:*MEMORY[0x1E4FB8470]];

  return v3;
}

- (id)flowcaseEditorialArtworkRequestToken
{
  v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"subscriptionHero"];
  if (!v3)
  {
    v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"subscriptionCover"];
    if (!v3)
    {
      v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForUberArtworkKind:@"masterArt"];
    }
  }
  [v3 setCropStyle:*MEMORY[0x1E4FB8478]];

  return v3;
}

- (id)movieArtworkRequestToken
{
  v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"subscriptionCover"];
  if (!v3)
  {
    v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"fullscreenBackground"];
  }
  [v3 setCropStyle:*MEMORY[0x1E4FB8478]];

  return v3;
}

- (id)tvShowArtworkRequestToken
{
  v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"browseCover"];
  if (!v3)
  {
    v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForEditorialArtworkKind:@"subscriptionCover"];
  }
  [v3 setCropStyle:*MEMORY[0x1E4FB8478]];

  return v3;
}

- (id)tvEpisodeArtworkRequestToken
{
  id v2 = [(MPStoreItemMetadata *)self artworkRequestTokenForScreenshotArtwork];
  [v2 setCropStyle:*MEMORY[0x1E4FB8478]];

  return v2;
}

- (id)editorNotesWithStyle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v9 = 0;
    goto LABEL_20;
  }
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    uint64_t v6 = [(NSDictionary *)storePlatformDictionary objectForKey:@"itunesNotes"];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"editorialNotes"];
    }
    v10 = v8;

    if (_NSIsNSDictionary())
    {
      id v9 = [v10 objectForKey:v4];
      int v11 = _NSIsNSString();

      if (v11)
      {
        if (v9) {
          goto LABEL_20;
        }
        goto LABEL_13;
      }
      v10 = v9;
    }
  }
LABEL_13:
  v12 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"editorialNotes"];
  if (_NSIsNSDictionary())
  {
    char v13 = [v12 objectForKey:v4];
    if (_NSIsNSString()) {
      id v9 = v13;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
    char v13 = v12;
  }

LABEL_20:

  return v9;
}

- (NSString)shortDescriptionText
{
  id v2 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"shortDescription"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (id)descriptionTextWithStyle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_19;
  }
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    uint64_t v6 = [(NSDictionary *)storePlatformDictionary objectForKey:@"description"];
    if (_NSIsNSDictionary())
    {
      id v7 = [v6 objectForKey:v4];
      if (_NSIsNSString())
      {
        id v8 = v7;

        if (v8) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_10:
  id v9 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"description"];
  if (_NSIsNSDictionary())
  {
    id v10 = [v9 objectForKey:v4];
    if (_NSIsNSString()) {
      id v8 = v10;
    }
    else {
      id v8 = 0;
    }
  }
  else if (_NSIsNSString())
  {
    id v10 = v9;
    id v8 = v10;
  }
  else
  {
    id v8 = 0;
    id v10 = v9;
  }

LABEL_19:

  return v8;
}

- (id)childStorePlatformDictionaryForStoreID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  if (!self->_hasOverrideChildStorePlatformDictionaries)
  {
    uint64_t v5 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"children"];
    if (_NSIsNSDictionary())
    {
      uint64_t v12 = [(id)v5 objectForKey:v4];
      if (_NSIsNSDictionary()) {
        goto LABEL_19;
      }
    }
    uint64_t v12 = 0;
LABEL_19:
    if (!(v5 | v12))
    {
      id v11 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"relationships.tracks.data"];
      if (_NSIsNSArray())
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = v11;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"id", (void)v18);
              if ([v17 isEqual:v4] && _NSIsNSDictionary())
              {
                uint64_t v12 = v16;

                goto LABEL_37;
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_37:

        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v5 = 0;
        uint64_t v12 = 0;
      }
LABEL_14:
    }
    goto LABEL_20;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_overrideChildStorePlatformDictionaries;
  uint64_t v6 = [(id)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t j = 0; j != v7; ++j)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation((id)v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        id v11 = [v10 objectForKey:@"id"];
        if ([v11 isEqual:v4])
        {
          uint64_t v12 = v10;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [(id)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_20:

LABEL_21:

  return (id)v12;
}

- (id)childStorePlatformDictionaryForArtworkTrackID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"artworkTracks"];
    if (_NSIsNSDictionary())
    {
      uint64_t v6 = [v5 objectForKey:v4];
      if (_NSIsNSDictionary())
      {
LABEL_6:

        goto LABEL_8;
      }
    }
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

- (id)stationGlyphRequestTokenForStorePlatformDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"stationGlyph"];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() artworkRequestTokenForStorePlatformArtworkValue:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)stationGlyphRequestTokenForStoreMusicAPIDictionary
{
  id v2 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"stationGlyph"];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() artworkRequestTokenForStorePlatformArtworkValue:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)artworkRequestTokenForStorePlatformDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"artwork"];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() artworkRequestTokenForStorePlatformArtworkValue:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)artworkRequestTokenForStoreMusicAPIDictionary
{
  id v2 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"artwork"];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() artworkRequestTokenForStorePlatformArtworkValue:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)avatarArtworkRequestToken
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"avatarArtwork"];
  if (v3
    || ([(NSDictionary *)self->_storePlatformDictionary objectForKey:@"artwork"],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(id)objc_opt_class() artworkRequestTokenForStorePlatformArtworkValue:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)artworkRequestTokenForUberArtworkKind:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"uber"];
    if (_NSIsNSDictionary())
    {
      uint64_t v6 = [v5 objectForKey:v4];
      if (_NSIsNSDictionary())
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB8728]) initWithArtworkResponseDictionary:v6];
        if (v7)
        {
          uint64_t v8 = +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:v7];
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)artworkRequestTokenForScreenshotArtwork
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"screenshots"];
  if (_NSIsNSDictionary())
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB8728]) initWithArtworkResponseDictionary:v2];
    if (v3)
    {
      id v4 = +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:v3];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)artworkRequestTokenForEditorialArtworkKind:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"editorialArtwork"];
    if (_NSIsNSDictionary())
    {
      uint64_t v6 = [v5 objectForKey:v4];
      if (_NSIsNSDictionary())
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB8728]) initWithArtworkResponseDictionary:v6];
        if (v7)
        {
          uint64_t v8 = +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:v7];
          [v8 setSourceEditorialArtworkKind:v4];
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)supportsSing
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"supportsSing"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v2 = 0;
  }
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSURL)classicalURL
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"classicalUrl"];
  if (_NSIsNSString())
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSArray)radioStationEvents
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = objc_opt_new();
  long long v19 = [(MPStoreItemMetadata *)self _musicAPIDateFormatter];
  id v4 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"relationships"];
  if (_NSIsNSDictionary())
  {
    uint64_t v5 = [v4 objectForKey:@"events"];
    if (_NSIsNSDictionary())
    {
      uint64_t v6 = [v5 objectForKey:@"data"];
      if (_NSIsNSArray())
      {
        v17 = v4;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        obuint64_t j = v6;
        uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              id v11 = v3;
              if (*(void *)v23 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              char v13 = [MPRadioStationEvent alloc];
              v20[0] = MEMORY[0x1E4F143A8];
              v20[1] = 3221225472;
              v20[2] = __41__MPStoreItemMetadata_radioStationEvents__block_invoke;
              v20[3] = &unk_1E57EE1C8;
              v20[4] = v12;
              id v21 = v19;
              uint64_t v14 = [(MPRadioStationEvent *)v13 initWithBlock:v20];
              char v3 = v11;
              [v11 addObject:v14];
            }
            uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v8);
        }

        id v15 = (id)[v3 copy];
        id v4 = v17;
      }
      else
      {
        id v15 = v3;
      }
    }
    else
    {
      id v15 = v3;
    }
  }
  else
  {
    id v15 = v3;
  }

  return (NSArray *)v15;
}

void __41__MPStoreItemMetadata_radioStationEvents__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  char v3 = [*(id *)(a1 + 32) objectForKey:@"attributes"];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"title"];
    [v13 setTitle:v4];

    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v3 objectForKey:@"startTime"];
    uint64_t v7 = [v5 dateFromString:v6];
    [v13 setStartTime:v7];

    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v3 objectForKey:@"endTime"];
    id v10 = [v8 dateFromString:v9];
    [v13 setEndTime:v10];

    id v11 = [v3 objectForKey:@"description"];
    if (_NSIsNSDictionary())
    {
      uint64_t v12 = [v11 objectForKey:@"standard"];
      [v13 setDescriptionText:v12];
    }
  }
}

- (NSDate)endingAirDate
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"airTime"];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"end"];
    uint64_t v5 = [(MPStoreItemMetadata *)self _storePlatformLastModifiedDateFormatter];
    uint64_t v6 = [v5 dateFromString:v4];

    uint64_t v7 = v4;
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v7 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"airTime.end"];

  if (_NSIsNSString())
  {
    uint64_t v8 = [(MPStoreItemMetadata *)self _musicAPIDateFormatter];
    uint64_t v6 = [v8 dateFromString:v7];

    if (!v6)
    {
      uint64_t v9 = [(MPStoreItemMetadata *)self _storePlatformReleaseDateFormatter];
      uint64_t v6 = [v9 dateFromString:v7];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_9:

  return (NSDate *)v6;
}

- (NSDate)startingAirDate
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"airTime"];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"start"];
    uint64_t v5 = [(MPStoreItemMetadata *)self _storePlatformLastModifiedDateFormatter];
    uint64_t v6 = [v5 dateFromString:v4];

    uint64_t v7 = v4;
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v7 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"airTime.start"];

  if (_NSIsNSString())
  {
    uint64_t v8 = [(MPStoreItemMetadata *)self _musicAPIDateFormatter];
    uint64_t v6 = [v8 dateFromString:v7];

    if (!v6)
    {
      uint64_t v9 = [(MPStoreItemMetadata *)self _storePlatformReleaseDateFormatter];
      uint64_t v6 = [v9 dateFromString:v7];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_9:

  return (NSDate *)v6;
}

- (BOOL)isLive
{
  id v2 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"isLive"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

    id v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)radioStationProviderName
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"stationProviderName"];
  if ((_NSIsNSString() & 1) == 0)
  {

    id v2 = 0;
  }

  return (NSString *)v2;
}

- (BOOL)isChart
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isChart"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

    id v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)radioStationSubtype
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"streamingRadioSubType"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_storeMusicAPIDictionary objectForKey:@"streamingRadioSubType"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    char v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)radioStationIsSubscriptionOnly
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isForAppleMusicSubscribersOnly"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v2 = 0;
  }
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)radioStationTypeID
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"radioStationTypeId"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v2 = 0;
  }
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)isOnboardedPerson
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isOnboarded"];
  if (v2 && _NSIsNSNumber()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)isVerifiedPerson
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isVerified"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

    id v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPrivatePerson
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isPrivate"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

    id v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)nameRaw
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"nameRaw"];
  if ((_NSIsNSString() & 1) == 0)
  {

    id v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)handle
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"handle"];
  if ((_NSIsNSString() & 1) == 0)
  {

    id v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)workName
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"workName"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"work"];
    if (!v3)
    {
      char v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"workName"];
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    char v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)videoSubtype
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"videoSubType"];
  if (!v3)
  {
    char v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"videoSubType"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    char v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)versionHash
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"versionHash"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSURL)URL
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"url"];
  if (!v3)
  {
    id v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"url"];
  }
  if (_NSIsNSString() && [v3 length])
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSURL)shortURL
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"shortUrl"];
  if (_NSIsNSString() && [v2 length])
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSURL *)v3;
}

- (int64_t)seasonNumber
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"seasonNumber"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"seasonNumber"];

    if (objc_opt_respondsToSelector())
    {
      id v3 = v4;
    }
    else
    {

      id v3 = 0;
    }
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (int64_t)episodeCount
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"episodeCount"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"episodeCount"];

    if (objc_opt_respondsToSelector())
    {
      id v3 = v4;
    }
    else
    {

      id v3 = 0;
    }
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (int64_t)trackNumber
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"trackNumber"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"trackNumber"];

    id v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v5 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"trackNumber"];

    id v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v3 = 0;
  }
  int64_t v6 = [v3 integerValue];

  return v6;
}

- (int64_t)trackCount
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"trackCount"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"trackCount"];

    if (objc_opt_respondsToSelector())
    {
      id v3 = v4;
    }
    else
    {
      uint64_t v5 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"children"];
      if (_NSIsNSDictionary())
      {
        id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v6 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"trackCount"];

    id v3 = (void *)v6;
  }
  int64_t v7 = [v3 integerValue];

  return v7;
}

- (int64_t)subscriptionAdamID
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"subscribedAdamID"];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = [v3 longLongValue];
  }
  else if ([(MPStoreItemMetadata *)self hasSubscriptionOffer])
  {
    uint64_t v5 = [(MPStoreItemMetadata *)self storeID];
    int64_t v4 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v5);
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)purchasedAdamID
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"purchasedAdamId"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)socialProfileID
{
  return [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"socialProfileId"];
}

- (NSArray)formerStoreAdamIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"formerIds"];
  if (_NSIsNSArray())
  {
    int64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v13 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            if (_NSIsNSNumber())
            {
              id v10 = v9;
            }
            else
            {
              objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
              id v10 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v11 = v10;
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    id v2 = v13;
  }
  else
  {
    int64_t v3 = 0;
  }

  return (NSArray *)v3;
}

- (id)storeID
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"id"];
  if (!v3)
  {
    int64_t v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"itemId"];
    if (!v3)
    {
      int64_t v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"id"];
      if (!v3)
      {
        id v4 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"playParams"];
        if (_NSIsNSDictionary())
        {
          int64_t v3 = [v4 objectForKey:@"id"];
        }
        else
        {
          int64_t v3 = 0;
        }
      }
    }
  }

  return v3;
}

- (NSString)cloudUniversalLibraryID
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"libraryTrackId"];
  if (_NSIsNSString()) {
    goto LABEL_5;
  }
  id v4 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"libraryPlaylistId"];

  if (_NSIsNSString())
  {
    int64_t v3 = v4;
LABEL_5:
    id v5 = v3;
    int64_t v3 = v5;
    goto LABEL_6;
  }
  int64_t v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"id"];

  if (_NSIsNSString()) {
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_6:

  return (NSString *)v5;
}

- (BOOL)showComposer
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"showComposer"];
  if (!v3)
  {
    int64_t v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"showComposer"];
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    int64_t v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldReportPlayEvents
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"shouldReportPlayEvents"];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 BOOLValue];
  }
  else
  {
    id v5 = [(MPStoreItemMetadata *)self itemKind];
    if (MPStoreItemMetadataItemKindIsArtistUploadedContent(v5)) {
      char v4 = 1;
    }
    else {
      char v4 = [(MPStoreItemMetadata *)self hasSubscriptionOffer];
    }
  }
  return v4;
}

- (NSNumber)shouldBookmarkPlayPosition
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"shouldBookmarkPlayPosition"];
  if (objc_opt_respondsToSelector())
  {
    int64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "BOOLValue"));
  }
  else
  {
    int64_t v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSString)shortName
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"shortName"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSDate)lastModifiedDate
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"lastModifiedDate"];
  if (!_NSIsNSString()
    || ([(MPStoreItemMetadata *)self _storePlatformLastModifiedDateFormatter],
        char v4 = objc_claimAutoreleasedReturnValue(),
        [v4 dateFromString:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    uint64_t v6 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"lastModifiedDate"];
    if (_NSIsNSString())
    {
      uint64_t v7 = [(MPStoreItemMetadata *)self _musicAPIDateFormatter];
      id v5 = [v7 dateFromString:v6];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSDate *)v5;
}

- (NSDate)releaseDate
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"releaseDate"];
  if (_NSIsNSString()
    && ([(MPStoreItemMetadata *)self _storePlatformReleaseDateFormatter],
        char v4 = objc_claimAutoreleasedReturnValue(),
        [v4 dateFromString:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    uint64_t v6 = v3;
  }
  else
  {
    uint64_t v6 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"releaseDate"];

    if (_NSIsNSString())
    {
      uint64_t v7 = [(MPStoreItemMetadata *)self _musicAPIDateFormatter];
      id v5 = [v7 dateFromString:v6];

      if (!v5)
      {
        uint64_t v8 = [(MPStoreItemMetadata *)self _storePlatformReleaseDateFormatter];
        id v5 = [v8 dateFromString:v6];
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSDate *)v5;
}

- (NSNumber)popularity
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"popularity"];
  if ((_NSIsNSNumber() & 1) != 0
    || !v3
    && ([(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"meta.popularity"], id v3 = objc_claimAutoreleasedReturnValue(), _NSIsNSNumber()))
  {
    id v4 = v3;
    id v3 = v4;
  }
  else
  {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSArray)playlistIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"playlistIds"];
  if (_NSIsNSArray())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = v2;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if (_NSIsNSString()) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSArray)offers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"offers"];
  if (!v3)
  {
    id v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"offers"];
  }
  if (_NSIsNSArray())
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            long long v11 = [MPStoreItemOffer alloc];
            long long v12 = -[MPStoreItemOffer initWithLookupDictionary:](v11, "initWithLookupDictionary:", v10, (void)v14);
            if (v12) {
              [v4 addObject:v12];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSString)name
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"name"];
  if (!v3)
  {
    id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"title"];
    if (!v3)
    {
      id v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"itemName"];
      if (!v3)
      {
        id v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"name"];
      }
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)movieClips
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"movieClips"];
  if (_NSIsNSArray())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            uint64_t v10 = [MPStoreItemMovieClip alloc];
            long long v11 = -[MPStoreItemMovieClip initWithLookupDictionary:](v10, "initWithLookupDictionary:", v9, (void)v13);
            if (v11)
            {
              if (!v6) {
                uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
              }
              [v6 addObject:v11];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

- (int64_t)movieClipsCount
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"movieClips"];
  if (_NSIsNSArray()) {
    int64_t v3 = [v2 count];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)movementNumber
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"movementNumber"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"movementNumber"];

    int64_t v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v5 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"movementNumber"];

    int64_t v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    int64_t v3 = 0;
  }
  int64_t v6 = [v3 integerValue];

  return v6;
}

- (NSString)movementName
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"movementName"];
  if (!v3)
  {
    int64_t v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"movementName"];
    if (!v3)
    {
      int64_t v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"movementName"];
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    int64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)movementCount
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"movementCount"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"movementCount"];

    int64_t v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v5 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"movementCount"];

    int64_t v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    int64_t v3 = 0;
  }
  int64_t v6 = [v3 integerValue];

  return v6;
}

- (MPStoreArtworkRequestToken)latestAlbumArtworkRequestToken
{
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    int64_t v3 = [(NSDictionary *)storePlatformDictionary objectForKey:@"latestAlbumArtwork"];
    if (v3)
    {
      uint64_t v4 = [(id)objc_opt_class() artworkRequestTokenForStorePlatformArtworkValue:v3];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (MPStoreArtworkRequestToken *)v4;
}

- (NSString)iTunesBrandType
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"iTunesBrandType"];
  if ((_NSIsNSString() & 1) == 0)
  {

    id v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)personalMixSortKey
{
  int64_t v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"personalMixSortKey"];
  if (!v3)
  {
    int64_t v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"personalMixSortKey"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    int64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)isCollaborative
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"hasCollaboration"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

    id v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)playlistType
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"playlistType"];
  if (!v3)
  {
    char v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"playlistType"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    char v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)itemKind
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"kind"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"kind"];
    if ([v3 isEqualToString:@"music-video"])
    {
      uint64_t v4 = @"musicVideo";
    }
    else
    {
      if (v3) {
        goto LABEL_11;
      }
      char v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"playParams"];
      if (!_NSIsNSDictionary()
        || ([v3 objectForKey:@"kind"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v5 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"kind"];
        if (!v5)
        {
          uint64_t v5 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"type"];
        }
      }
      uint64_t v4 = (__CFString *)v5;
    }

    char v3 = v4;
  }
LABEL_11:
  if ((_NSIsNSString() & 1) == 0)
  {

    char v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)supportsVocalAttenuation
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isVocalAttenuationAllowed"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"isVocalAttenuationAllowed"];

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      char v5 = 0;
      goto LABEL_7;
    }
    char v3 = v4;
  }
  char v5 = [v3 BOOLValue];
LABEL_7:

  return v5;
}

- (NSArray)audioTraits
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"audioTraits"];
  if (!v3)
  {
    char v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"audioTraits"];
  }

  return (NSArray *)v3;
}

- (BOOL)isStoreRedownloadable
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isAvailable"];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 BOOLValue];
  }
  else
  {
    char v5 = [(MPStoreItemMetadata *)self itemKind];
    if (MPStoreItemMetadataItemKindIsArtistUploadedContent(v5)) {
      char v4 = 1;
    }
    else {
      char v4 = [(MPStoreItemMetadata *)self hasSubscriptionOffer];
    }
  }
  return v4;
}

- (BOOL)isPreorder
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isPreorder"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"isPreorder"];
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isMasteredForiTunes
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isMasteredForItunes"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"isMasteredForItunes"];
    if (!v3)
    {
      char v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"isMasteredForItunes"];
    }
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isCompilation
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isCompilation"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"isCompilation"];
  }
  if ((_NSIsNSNumber() & 1) == 0)
  {

    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)explicitRating
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"contentRatingsBySystem"];
  if (_NSIsNSDictionary())
  {
    char v3 = [v2 allValues];
    char v4 = [v3 firstObject];

    if (_NSIsNSDictionary())
    {
      char v5 = [v4 objectForKey:@"value"];
      if (objc_opt_respondsToSelector()) {
        int64_t v6 = [v5 integerValue];
      }
      else {
        int64_t v6 = 100;
      }
    }
    else
    {
      int64_t v6 = 100;
    }
  }
  else
  {
    int64_t v6 = 100;
  }

  return v6;
}

- (BOOL)isExplicitContent
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"contentRatingsBySystem"];
  if (_NSIsNSDictionary())
  {
    char v4 = [v3 allValues];
    char v5 = [v4 firstObject];

    if (_NSIsNSDictionary())
    {
      int64_t v6 = [v5 objectForKey:@"value"];
      BOOL v7 = (objc_opt_respondsToSelector() & 1) != 0 && [v6 integerValue] > 499;
    }
    else
    {
      BOOL v7 = 0;
    }

    LOBYTE(v9) = v7;
  }
  else
  {
    uint64_t v8 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"explicit"];
    if (objc_opt_respondsToSelector()) {
      int v9 = [v8 BOOLValue];
    }
    else {
      int v9 = 0;
    }
    if (self->_storeMusicAPIDictionary)
    {
      uint64_t v10 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"contentRating"];
      if (_NSIsNSString()) {
        v9 |= [v10 isEqualToString:@"explicit"];
      }
    }
  }

  return v9;
}

- (NSArray)genreNames
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"genreNames"];
  if (_NSIsNSArray())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!_NSIsNSString())
          {

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  if (v3) {
    goto LABEL_53;
  }
LABEL_14:
  int v9 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"genres"];
  if (_NSIsNSArray())
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v3 = 0;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          if (_NSIsNSDictionary())
          {
            long long v16 = [v15 objectForKey:@"name"];
            if (_NSIsNSString())
            {
              if (!v3) {
                id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v3 addObject:v16];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v12);

      if (v3) {
        goto LABEL_53;
      }
      goto LABEL_32;
    }
  }
LABEL_32:
  long long v17 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"genre"];
  if (_NSIsNSString())
  {
    v39 = v17;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];

    if (v3) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  uint64_t v18 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"genreNames"];
  if (_NSIsNSArray())
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      id v3 = 0;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8 * k);
          if (_NSIsNSString())
          {
            if (!v3) {
              id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            objc_msgSend(v3, "addObject:", v24, (void)v26);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

LABEL_53:

  return (NSArray *)v3;
}

- (BOOL)hasSubscriptionOffer
{
  hasSubscriptionOffer = self->_hasSubscriptionOffer;
  if (!hasSubscriptionOffer)
  {
    id v4 = NSNumber;
    uint64_t v5 = [(MPStoreItemMetadata *)self offers];
    uint64_t v6 = MPStoreItemMetadataSubscriptionOfferInOffers(v5);
    [v4 numberWithInt:v6 != 0];
    uint64_t v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = self->_hasSubscriptionOffer;
    self->_hasSubscriptionOffer = v7;

    hasSubscriptionOffer = self->_hasSubscriptionOffer;
  }

  return [(NSNumber *)hasSubscriptionOffer BOOLValue];
}

- (BOOL)hasSocialPosts
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"hasSocialPosts"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasTimeSyncedLyrics
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"hasTimeSyncedLyrics"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasLyrics
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"hasLyrics"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasCredits
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"hasCredits"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasArtistBiography
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"hasArtistBio"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSDictionary)importableStorePlatformDictionary
{
  if (self->_storeMusicAPIDictionary)
  {
    id v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v5 = [(MPStoreItemMetadata *)self effectiveStorePlatformDictionary];
    id v2 = v5;
    if (self->_parentStoreItemMetadata)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"artwork"];

      if (!v6)
      {
        uint64_t v7 = [(MPStoreItemMetadata *)self->_parentStoreItemMetadata effectiveStorePlatformDictionary];
        uint64_t v8 = [v7 objectForKeyedSubscript:@"artwork"];
        if (v8)
        {
          int v9 = (void *)[v2 mutableCopy];
          [v9 setObject:v8 forKeyedSubscript:@"artwork"];
          uint64_t v10 = [v9 copy];

          id v2 = (void *)v10;
        }
      }
    }
  }

  return (NSDictionary *)v2;
}

- (NSDictionary)effectiveStorePlatformDictionary
{
  v168[1] = *MEMORY[0x1E4F143B8];
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    char v3 = storePlatformDictionary;
    goto LABEL_176;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  uint64_t v6 = [(MPStoreItemMetadata *)self artworkRequestToken];
  uint64_t v7 = [v6 imageArtworkInfo];
  uint64_t v8 = [v7 responseDictionary];

  if (_NSIsNSDictionary()) {
    [v5 setObject:v8 forKey:@"artwork"];
  }
  uint64_t v9 = [(MPStoreItemMetadata *)self artistName];
  if (v9) {
    [v5 setObject:v9 forKey:@"artistName"];
  }
  uint64_t v10 = [(MPStoreItemMetadata *)self artistStoreID];
  if (v10) {
    [v5 setObject:v10 forKey:@"artistId"];
  }
  uint64_t v11 = [(MPStoreItemMetadata *)self artistUploadedContentType];
  if (v11) {
    [v5 setObject:v11 forKey:@"aucType"];
  }
  uint64_t v12 = [(MPStoreItemMetadata *)self artworkTrackIDs];
  if (v12) {
    [v5 setObject:v12 forKey:@"artworkTrackIds"];
  }
  uint64_t v13 = [(MPStoreItemMetadata *)self audioTraits];
  if (v13) {
    [v5 setObject:v13 forKey:@"audioTraits"];
  }
  uint64_t v14 = [(MPStoreItemMetadata *)self childrenStoreIDs];
  if (v14) {
    [v5 setObject:v14 forKey:@"childrenIds"];
  }
  v145 = v5;
  uint64_t v15 = [(MPStoreItemMetadata *)self collectionName];
  if (v15) {
    [v145 setObject:v15 forKey:@"collectionName"];
  }
  v132 = (void *)v14;
  v133 = (void *)v13;
  v134 = (void *)v12;
  uint64_t v16 = [(MPStoreItemMetadata *)self collectionStoreID];
  if (v16) {
    [v145 setObject:v16 forKey:@"collectionId"];
  }
  v130 = (void *)v16;
  uint64_t v17 = [(MPStoreItemMetadata *)self composerName];
  v129 = (void *)v17;
  if (v17)
  {
    v167 = @"name";
    v168[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:&v167 count:1];
    [v145 setObject:v18 forKey:@"composer"];
  }
  uint64_t v19 = [(MPStoreItemMetadata *)self copyrightText];
  if (v19) {
    [v145 setObject:v19 forKey:@"copyright"];
  }
  uint64_t v20 = [(MPStoreItemMetadata *)self curatorID];
  if (v20) {
    [v145 setObject:v20 forKey:@"curatorId"];
  }
  v127 = (void *)v20;
  uint64_t v21 = [(MPStoreItemMetadata *)self curatorName];
  if (v21) {
    [v145 setObject:v21 forKey:@"curatorName"];
  }
  v126 = (void *)v21;
  [(MPStoreItemMetadata *)self curatorHandle];
  uint64_t v22 = v138 = (void *)v8;
  if (v22) {
    [v145 setObject:v22 forKey:@"username"];
  }
  uint64_t v23 = [(MPStoreItemMetadata *)self descriptionTextWithStyle:@"short"];
  uint64_t v24 = [(MPStoreItemMetadata *)self descriptionTextWithStyle:@"standard"];
  v144 = (void *)v23;
  uint64_t v25 = v23 | v24;
  long long v26 = (void *)v24;
  v128 = (void *)v19;
  if (v25)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = v27;
    if (v144) {
      [v27 setObject:v144 forKey:@"short"];
    }
    if (v26) {
      [v28 setObject:v26 forKey:@"standard"];
    }
    [v145 setObject:v28 forKey:@"description"];
  }
  int64_t v29 = [(MPStoreItemMetadata *)self discCount];
  if (v29)
  {
    long long v30 = [NSNumber numberWithInteger:v29];
    [v145 setObject:v30 forKey:@"discCount"];
  }
  int64_t v31 = [(MPStoreItemMetadata *)self discNumber];
  if (v31)
  {
    long long v32 = [NSNumber numberWithInteger:v31];
    [v145 setObject:v32 forKey:@"discNumber"];
  }
  uint64_t v33 = [(MPStoreItemMetadata *)self editorNotesWithStyle:@"short"];
  uint64_t v139 = [(MPStoreItemMetadata *)self editorNotesWithStyle:@"standard"];
  v143 = (void *)v33;
  if (v33 | v139)
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v35 = v34;
    if (v143) {
      [v34 setObject:v143 forKey:@"short"];
    }
    if (v139) {
      [v35 setObject:v139 forKey:@"standard"];
    }
    [v145 setObject:v35 forKey:@"itunesNotes"];
  }
  if ([(MPStoreItemMetadata *)self hasArtistBiography]) {
    [v145 setObject:MEMORY[0x1E4F1CC38] forKey:@"hasArtistBio"];
  }
  if ([(MPStoreItemMetadata *)self hasLyrics]) {
    [v145 setObject:MEMORY[0x1E4F1CC38] forKey:@"hasLyrics"];
  }
  if ([(MPStoreItemMetadata *)self hasTimeSyncedLyrics]) {
    [v145 setObject:MEMORY[0x1E4F1CC38] forKey:@"hasTimeSyncedLyrics"];
  }
  v135 = (void *)v11;
  v136 = (void *)v10;
  v137 = (void *)v9;
  if ([(MPStoreItemMetadata *)self hasSocialPosts]) {
    [v145 setObject:MEMORY[0x1E4F1CC38] forKey:@"hasSocialPosts"];
  }
  v142 = [(MPStoreItemMetadata *)self genreNames];
  v131 = (void *)v15;
  long long v36 = v145;
  v124 = v26;
  v125 = (void *)v22;
  if ([v142 count])
  {
    [v145 setObject:v142 forKey:@"genreNames"];
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v37 = v142;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v154 objects:v166 count:16];
    if (!v38)
    {
      v40 = v37;
      goto LABEL_68;
    }
    uint64_t v39 = v38;
    v40 = 0;
    uint64_t v41 = *(void *)v155;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v155 != v41) {
          objc_enumerationMutation(v37);
        }
        uint64_t v43 = *(void *)(*((void *)&v154 + 1) + 8 * i);
        v164 = @"name";
        uint64_t v165 = v43;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
        if (!v40) {
          v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v37, "count"));
        }
        [v40 addObject:v44];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v154 objects:v166 count:16];
    }
    while (v39);

    long long v36 = v145;
    if (v40)
    {
      [v145 setObject:v40 forKey:@"genres"];
LABEL_68:
    }
  }
  if ([(MPStoreItemMetadata *)self isBeats1]) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"isBeats1"];
  }
  int64_t v45 = [(MPStoreItemMetadata *)self explicitRating];
  if (v45) {
    goto LABEL_74;
  }
  if ([(MPStoreItemMetadata *)self isExplicitContent])
  {
    int64_t v45 = 500;
LABEL_74:
    v162 = @"riaa";
    v160 = @"value";
    v46 = [NSNumber numberWithInteger:v45];
    v161 = v46;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
    v163 = v47;
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
    [v36 setObject:v48 forKey:@"contentRatingsBySystem"];
  }
  if ([(MPStoreItemMetadata *)self isCompilation]) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"isCompilation"];
  }
  if ([(MPStoreItemMetadata *)self isMasteredForiTunes]) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"isMasteredForItunes"];
  }
  if ([(MPStoreItemMetadata *)self isPreorder]) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"isPreorder"];
  }
  uint64_t v49 = [(MPStoreItemMetadata *)self itemKind];
  if (v49) {
    [v36 setObject:v49 forKey:@"kind"];
  }
  uint64_t v50 = [(MPStoreItemMetadata *)self playlistType];
  if (v50) {
    [v36 setObject:v50 forKey:@"playlistType"];
  }
  uint64_t v51 = [(MPStoreItemMetadata *)self personalMixSortKey];
  if (v51) {
    [v36 setObject:v51 forKey:@"personalMixSortKey"];
  }
  uint64_t v52 = [(MPStoreItemMetadata *)self movementName];
  if (v52) {
    [v36 setObject:v52 forKey:@"movementName"];
  }
  int64_t v53 = [(MPStoreItemMetadata *)self movementCount];
  if (v53)
  {
    v54 = [NSNumber numberWithInteger:v53];
    [v36 setObject:v54 forKey:@"movementCount"];
  }
  int64_t v55 = [(MPStoreItemMetadata *)self movementNumber];
  if (v55)
  {
    v56 = [NSNumber numberWithInteger:v55];
    [v36 setObject:v56 forKey:@"movementNumber"];
  }
  v141 = [(MPStoreItemMetadata *)self movieClips];
  v122 = (void *)v50;
  v123 = (void *)v49;
  v120 = (void *)v52;
  v121 = (void *)v51;
  if ([v141 count])
  {
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id v58 = v141;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v150 objects:v159 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v151;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v151 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = [*(id *)(*((void *)&v150 + 1) + 8 * j) lookupDictionary];
          [v57 addObject:v63];
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v150 objects:v159 count:16];
      }
      while (v60);
    }

    [v36 setObject:v57 forKey:@"movieClips"];
  }
  uint64_t v64 = [(MPStoreItemMetadata *)self name];
  if (v64) {
    [v36 setObject:v64 forKey:@"name"];
  }
  v140 = [(MPStoreItemMetadata *)self offers];
  v119 = (void *)v64;
  if ([v140 count])
  {
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    id v66 = v140;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v146 objects:v158 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v147;
      do
      {
        for (uint64_t k = 0; k != v68; ++k)
        {
          if (*(void *)v147 != v69) {
            objc_enumerationMutation(v66);
          }
          v71 = [*(id *)(*((void *)&v146 + 1) + 8 * k) lookupDictionary];
          if (v71) {
            [v65 addObject:v71];
          }
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v146 objects:v158 count:16];
      }
      while (v68);
    }

    [v36 setObject:v65 forKey:@"offers"];
  }
  uint64_t v72 = [(MPStoreItemMetadata *)self playlistIdentifiers];
  if (v72) {
    [v36 setObject:v72 forKey:@"playlistIds"];
  }
  uint64_t v73 = [(MPStoreItemMetadata *)self popularity];
  if (v73) {
    [v36 setObject:v73 forKey:@"popularity"];
  }
  uint64_t v74 = [(MPStoreItemMetadata *)self releaseDate];
  if (v74)
  {
    v75 = [(MPStoreItemMetadata *)self _storePlatformReleaseDateFormatter];
    v76 = [v75 stringFromDate:v74];
    if (v76) {
      [v36 setObject:v76 forKey:@"releaseDate"];
    }
  }
  uint64_t v77 = [(MPStoreItemMetadata *)self lastModifiedDate];
  if (v77)
  {
    v78 = [(MPStoreItemMetadata *)self _storePlatformLastModifiedDateFormatter];
    v79 = [v78 stringFromDate:v77];
    if (v79) {
      [v36 setObject:v79 forKey:@"lastModifiedDate"];
    }
  }
  v112 = (void *)v73;
  uint64_t v80 = [(MPStoreItemMetadata *)self shortName];
  if (v80) {
    [v36 setObject:v80 forKey:@"shortName"];
  }
  v81 = [(MPStoreItemMetadata *)self shouldBookmarkPlayPosition];
  if (v81) {
    [v36 setObject:v81 forKey:@"shouldBookmarkPlayPosition"];
  }
  if ([(MPStoreItemMetadata *)self showComposer])
  {
    v82 = [NSNumber numberWithBool:1];
    [v36 setObject:v82 forKey:@"showComposer"];
  }
  uint64_t v83 = [(MPStoreItemMetadata *)self storeID];
  if (v83) {
    [v36 setObject:v83 forKey:@"id"];
  }
  uint64_t v84 = [(MPStoreItemMetadata *)self socialProfileID];
  if (v84) {
    [v36 setObject:v84 forKey:@"socialProfileId"];
  }
  v113 = (void *)v84;
  int64_t v85 = [(MPStoreItemMetadata *)self trackCount];
  v114 = (void *)v83;
  if (v85)
  {
    v86 = [NSNumber numberWithInteger:v85];
    [v36 setObject:v86 forKey:@"trackCount"];
  }
  int64_t v87 = [(MPStoreItemMetadata *)self trackNumber];
  if (v87)
  {
    v88 = [NSNumber numberWithInteger:v87];
    [v36 setObject:v88 forKey:@"trackNumber"];
  }
  int64_t v89 = [(MPStoreItemMetadata *)self seasonNumber];
  if (v89)
  {
    v90 = [NSNumber numberWithInteger:v89];
    [v36 setObject:v90 forKey:@"seasonNumber"];
  }
  int64_t v91 = [(MPStoreItemMetadata *)self episodeCount];
  if (v91)
  {
    v92 = [NSNumber numberWithInteger:v91];
    [v36 setObject:v92 forKey:@"episodeCount"];
  }
  uint64_t v93 = [(MPStoreItemMetadata *)self versionHash];
  if (v93) {
    [v36 setObject:v93 forKey:@"versionHash"];
  }
  v117 = (void *)v74;
  uint64_t v94 = [(MPStoreItemMetadata *)self workName];
  if (v94) {
    [v36 setObject:v94 forKey:@"workName"];
  }
  v116 = (void *)v77;
  v95 = [(MPStoreItemMetadata *)self iTunesBrandType];
  if (v95) {
    [v36 setObject:v95 forKey:@"iTunesBrandType"];
  }
  uint64_t v96 = [(MPStoreItemMetadata *)self handle];
  if (v96) {
    [v36 setObject:v96 forKey:@"handle"];
  }
  uint64_t v97 = [(MPStoreItemMetadata *)self nameRaw];
  if (v97) {
    [v36 setObject:v97 forKey:@"nameRaw"];
  }
  if ([(MPStoreItemMetadata *)self isPrivatePerson]) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"isPrivate"];
  }
  if ([(MPStoreItemMetadata *)self isVerifiedPerson]) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"isVerified"];
  }
  v111 = (void *)v93;
  if ([(MPStoreItemMetadata *)self isOnboardedPerson]) {
    [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"isOnboarded"];
  }
  v115 = (void *)v80;
  v98 = [(MPStoreItemMetadata *)self shortURL];
  v99 = [v98 absoluteString];

  if (v99) {
    [v145 setObject:v99 forKey:@"shortUrl"];
  }
  v100 = [(MPStoreItemMetadata *)self URL];
  v101 = [v100 absoluteString];

  if (v101) {
    [v145 setObject:v101 forKey:@"url"];
  }
  v118 = (void *)v72;
  v102 = [(MPStoreItemMetadata *)self videoSubtype];
  if (v102) {
    [v145 setObject:v102 forKey:@"videoSubType"];
  }
  v110 = (void *)v97;
  int64_t v103 = [(MPStoreItemMetadata *)self radioStationTypeID];
  if (v103)
  {
    v104 = [NSNumber numberWithInteger:v103];
    [v145 setObject:v104 forKey:@"radioStationTypeId"];
  }
  v105 = (void *)v96;
  v106 = [(MPStoreItemMetadata *)self radioStationSubtype];
  if (v106) {
    [v145 setObject:v106 forKey:@"streamingRadioSubType"];
  }
  v107 = (void *)v94;
  if ([(MPStoreItemMetadata *)self isChart]) {
    [v145 setObject:MEMORY[0x1E4F1CC38] forKey:@"isChart"];
  }
  v108 = [(MPStoreItemMetadata *)self radioStationProviderName];
  if (v108) {
    [v145 setObject:v108 forKey:@"stationProviderName"];
  }
  char v3 = v145;

LABEL_176:

  return v3;
}

- (NSString)shortEditorNotes
{
  char v3 = [(MPStoreItemMetadata *)self editorNotesWithStyle:@"short"];
  if (![v3 length])
  {
    uint64_t v4 = [(MPStoreItemMetadata *)self editorNotesWithStyle:@"standard"];

    char v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (BOOL)isExpired
{
  id v2 = [(MPStoreItemMetadata *)self expirationDate];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    BOOL v4 = [v2 compare:v3] == -1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSDate)expirationDate
{
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    id v3 = expirationDate;
  }
  else
  {
    id v3 = [(MPStoreItemMetadata *)self->_parentStoreItemMetadata expirationDate];
  }

  return v3;
}

- (NSString)editorNotes
{
  id v3 = [(MPStoreItemMetadata *)self editorNotesWithStyle:@"standard"];
  if (![v3 length])
  {
    uint64_t v4 = [(MPStoreItemMetadata *)self editorNotesWithStyle:@"short"];

    id v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (double)duration
{
  id v2 = self;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  storePlatformDictionary = self->_storePlatformDictionary;
  if (storePlatformDictionary)
  {
    uint64_t v4 = [(NSDictionary *)storePlatformDictionary objectForKey:@"durationInMillis"];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      [(MPStoreItemMetadata *)v2 offers];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (!v5) {
        goto LABEL_26;
      }
      uint64_t v6 = v5;
      uint64_t v22 = sel_doubleValue;
      uint64_t v23 = v2;
      uint64_t v24 = v4;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v31;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "assets", v22, v23, v24);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                [*(id *)(*((void *)&v26 + 1) + 8 * j) duration];
                if (v16 <= 2.22044605e-16) {
                  double v16 = -0.0;
                }
                else {
                  ++v7;
                }
                double v9 = v9 + v16;
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v6);
      id v2 = v23;
      uint64_t v4 = v24;
      if (v7)
      {
        double v17 = v9 / (double)v7;
      }
      else
      {
LABEL_26:
        uint64_t v19 = [(NSDictionary *)v2->_storePlatformDictionary objectForKey:@"duration"];
        double v17 = 0.0;
        if (objc_opt_respondsToSelector())
        {
          [v19 doubleValue];
          double v17 = v20;
        }
      }
      goto LABEL_30;
    }
LABEL_25:
    [v4 doubleValue];
    double v17 = v18 / 1000.0;
    goto LABEL_30;
  }
  uint64_t v4 = [(NSDictionary *)v2->_downloadMetadataDictionary objectForKey:@"duration"];
  if (!v4)
  {
    uint64_t v4 = [(MPStoreItemMetadata *)v2 _fetchValueFromStoreMusicAPIDictionary:@"durationInMillis"];
  }
  double v17 = 0.0;
  if (objc_opt_respondsToSelector()) {
    goto LABEL_25;
  }
LABEL_30:

  return v17;
}

- (int64_t)discNumber
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"discNumber"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"discNumber"];

    id v3 = (void *)v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v5 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"discNumber"];

    id v3 = (void *)v5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v3 = 0;
  }
  int64_t v6 = [v3 integerValue];

  return v6;
}

- (int64_t)discCount
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"discCount"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"discCount"];

    if (objc_opt_respondsToSelector())
    {
      id v3 = v4;
    }
    else
    {

      id v3 = 0;
    }
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (NSString)descriptionText
{
  id v3 = [(MPStoreItemMetadata *)self descriptionTextWithStyle:@"standard"];
  if (![v3 length])
  {
    uint64_t v4 = [(MPStoreItemMetadata *)self descriptionTextWithStyle:@"short"];

    id v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (id)curatorID
{
  return [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"curatorId"];
}

- (NSString)curatorHandle
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"username"];
  if (!v3)
  {
    id v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"curatorSocialHandle"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)curatorName
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"curatorName"];
  if (!v3)
  {
    id v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"curatorName"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)copyrightText
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"copyright"];
  if ((_NSIsNSString() & 1) == 0)
  {
    uint64_t v4 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"copyright"];

    id v3 = (void *)v4;
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)composerName
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"composer"];
  if (_NSIsNSDictionary())
  {
    uint64_t v4 = [v3 objectForKey:@"name"];
    if (_NSIsNSString())
    {
      if (v4) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v4 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"composerName"];
LABEL_7:

  return (NSString *)v4;
}

- (id)collectionStoreID
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"collectionId"];
  if (!v3)
  {
    id v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"playlistId"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    id v3 = 0;
  }

  return v3;
}

- (NSString)collectionName
{
  id v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"collectionName"];
  if (!v3)
  {
    id v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"playlistName"];
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    id v3 = 0;
  }

  return (NSString *)v3;
}

- (unint64_t)cloudID
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"sagaId"];
  if (objc_opt_respondsToSelector()) {
    unint64_t v3 = [v2 longLongValue];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (NSString)cloudAlbumID
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"libraryAlbumId"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)childStoreItemMetadatas
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(MPStoreItemMetadata *)self childrenStoreIDs];
  uint64_t v4 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"relationships.tracks.data"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = -[MPStoreItemMetadata childStorePlatformDictionaryForStoreID:](self, "childStorePlatformDictionaryForStoreID:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v11)
        {
          uint64_t v12 = [MPStoreItemMetadata alloc];
          if (v4) {
            uint64_t v13 = [(MPStoreItemMetadata *)v12 initWithStoreMusicAPIDictionary:v11 parentStoreItemMetadata:self];
          }
          else {
            uint64_t v13 = [(MPStoreItemMetadata *)v12 initWithStorePlatformDictionary:v11 parentStoreItemMetadata:self];
          }
          uint64_t v14 = (void *)v13;
          if (v13)
          {
            if (!v8) {
              uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
            }
            [v8 addObject:v14];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSArray *)v8;
}

- (NSArray)childrenStoreIDs
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_hasOverrideChildStorePlatformDictionaries)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v3 = self->_overrideChildStorePlatformDictionaries;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKey:@"id"];
          if (v9)
          {
            if (!v6) {
              id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v6 addObject:v9];
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v5);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"childrenIds"];
    if (_NSIsNSArray())
    {
      if (v6) {
        goto LABEL_30;
      }
    }
    else
    {
    }
    id v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"relationships.tracks.data"];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v3, "count"));
    if (_NSIsNSArray())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v11 = v3;
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "objectForKeyedSubscript:", @"id", (void)v18);
            [v10 addObject:v16];
          }
          uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v13);
      }
    }
    id v6 = (id)objc_msgSend(v10, "copy", (void)v18);
  }
LABEL_30:

  return (NSArray *)v6;
}

- (BOOL)isBeats1
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"isBeats1"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSArray)artworkTrackIDs
{
  id v2 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"artworkTrackIds"];
  if ((_NSIsNSArray() & 1) == 0)
  {

    id v2 = 0;
  }

  return (NSArray *)v2;
}

- (MPStoreArtworkRequestToken)artworkRequestToken
{
  if (self->_storePlatformDictionary)
  {
    char v3 = -[MPStoreItemMetadata artworkRequestTokenForStorePlatformDictionary:](self, "artworkRequestTokenForStorePlatformDictionary:");
    if (v3) {
      goto LABEL_11;
    }
  }
  char v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForStorePlatformDictionary:self->_downloadAssetDictionary];
  if (v3) {
    goto LABEL_11;
  }
  uint64_t v4 = [(NSDictionary *)self->_downloadAssetDictionary objectForKey:@"artworkURL"];
  if (_NSIsNSString()
    && ([MEMORY[0x1E4F1CB10] URLWithString:v4], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB8728]) initWithArtworkURL:v5];
    char v3 = +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:v7];

    if (v3) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  char v3 = [(MPStoreItemMetadata *)self artworkRequestTokenForStoreMusicAPIDictionary];
  if (!v3)
  {
    char v3 = [(MPStoreItemMetadata *)self->_parentStoreItemMetadata artworkRequestToken];
  }
LABEL_11:

  return (MPStoreArtworkRequestToken *)v3;
}

- (NSString)artistUploadedContentType
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"aucType"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"aucType"];
  }

  return (NSString *)v3;
}

- (id)artistStoreID
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"artistId"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"artistId"];
  }

  return v3;
}

- (NSString)artistName
{
  char v3 = [(NSDictionary *)self->_storePlatformDictionary objectForKey:@"artistName"];
  if (!v3)
  {
    char v3 = [(NSDictionary *)self->_downloadMetadataDictionary objectForKey:@"artistName"];
    if (!v3)
    {
      char v3 = [(MPStoreItemMetadata *)self _fetchValueFromStoreMusicAPIDictionary:@"artistName"];
    }
  }
  if ((_NSIsNSString() & 1) == 0)
  {

    char v3 = 0;
  }

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_downloadAssetDictionary);
    objc_storeStrong((id *)(v5 + 16), self->_downloadMetadataDictionary);
    objc_storeStrong((id *)(v5 + 24), self->_storeMusicAPIDictionary);
    objc_storeStrong((id *)(v5 + 32), self->_expirationDate);
    *(unsigned char *)(v5 + 40) = self->_hasOverrideChildStorePlatformDictionaries;
    objc_storeStrong((id *)(v5 + 56), self->_overrideChildStorePlatformDictionaries);
    objc_storeStrong((id *)(v5 + 72), self->_parentStoreItemMetadata);
    objc_storeStrong((id *)(v5 + 64), self->_storePlatformDictionary);
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  downloadAssetDictionary = self->_downloadAssetDictionary;
  id v5 = a3;
  [v5 encodeObject:downloadAssetDictionary forKey:@"MPStoreItemMetadataDownloadAssetDictionary"];
  [v5 encodeObject:self->_storeMusicAPIDictionary forKey:@"MPStoreItemMetadataMusicAPIDictionary"];
  [v5 encodeObject:self->_expirationDate forKey:@"MPStoreItemMetadataExpirationDate"];
  [v5 encodeBool:self->_hasOverrideChildStorePlatformDictionaries forKey:@"MPStoreItemMetadataHasOverrideChildStorePlatformDictionaries"];
  [v5 encodeObject:self->_overrideChildStorePlatformDictionaries forKey:@"MPStoreItemMetadataOverrideChildStorePlatformDictionaries"];
  [v5 encodeObject:self->_parentStoreItemMetadata forKey:@"MPStoreItemMetadataParentStoreItemMetadata"];
  [v5 encodeObject:self->_storePlatformDictionary forKey:@"MPStoreItemMetadataStorePlatformDictionary"];
}

- (MPStoreItemMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MPStoreItemMetadata;
  id v5 = [(MPStoreItemMetadata *)&v31 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"MPStoreItemMetadataDownloadAssetDictionary"];
    downloadAssetDictionary = v5->_downloadAssetDictionary;
    v5->_downloadAssetDictionary = (NSDictionary *)v14;

    if ((_NSIsNSDictionary() & 1) == 0)
    {
      long long v16 = v5->_downloadAssetDictionary;
      v5->_downloadAssetDictionary = 0;
    }
    long long v17 = [(NSDictionary *)v5->_downloadAssetDictionary objectForKey:@"metadata"];
    if (_NSIsNSDictionary()) {
      objc_storeStrong((id *)&v5->_downloadMetadataDictionary, v17);
    }
    uint64_t v18 = [v4 decodeObjectOfClasses:v13 forKey:@"MPStoreItemMetadataMusicAPIDictionary"];
    storeMusicAPIDictionary = v5->_storeMusicAPIDictionary;
    v5->_storeMusicAPIDictionary = (NSDictionary *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPStoreItemMetadataExpirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v20;

    v5->_hasOverrideChildStorePlatformDictionaries = [v4 decodeBoolForKey:@"MPStoreItemMetadataHasOverrideChildStorePlatformDictionaries"];
    uint64_t v22 = [v4 decodeObjectOfClasses:v13 forKey:@"MPStoreItemMetadataOverrideChildStorePlatformDictionaries"];
    overrideChildStorePlatformDictionaries = v5->_overrideChildStorePlatformDictionaries;
    v5->_overrideChildStorePlatformDictionaries = (NSArray *)v22;

    if ((_NSIsNSArray() & 1) == 0)
    {
      long long v24 = v5->_overrideChildStorePlatformDictionaries;
      v5->_overrideChildStorePlatformDictionaries = 0;
    }
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPStoreItemMetadataParentStoreItemMetadata"];
    parentStoreItemMetadata = v5->_parentStoreItemMetadata;
    v5->_parentStoreItemMetadata = (MPStoreItemMetadata *)v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v13 forKey:@"MPStoreItemMetadataStorePlatformDictionary"];
    storePlatformDictionary = v5->_storePlatformDictionary;
    v5->_storePlatformDictionary = (NSDictionary *)v27;

    if ((_NSIsNSDictionary() & 1) == 0)
    {
      long long v29 = v5->_storePlatformDictionary;
      v5->_storePlatformDictionary = 0;
    }
  }

  return v5;
}

- (id)description
{
  char v3 = [(MPStoreItemMetadata *)self offers];
  id v4 = MPStoreItemMetadataSubscriptionOfferInOffers(v3);

  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [(MPStoreItemMetadata *)self storeID];
  uint64_t v9 = [(MPStoreItemMetadata *)self name];
  uint64_t v10 = [v5 stringWithFormat:@"<%@:%p storeID=%@ name=%@ subscriptionOffer=%@>", v7, self, v8, v9, v4];

  return v10;
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4 expirationDate:(id)a5
{
  id v9 = a4;
  uint64_t v10 = [(MPStoreItemMetadata *)self initWithStorePlatformDictionary:a3 expirationDate:a5];
  uint64_t v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_parentStoreItemMetadata, a4);
  }

  return v11;
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4
{
  return [(MPStoreItemMetadata *)self initWithStorePlatformDictionary:a3 parentStoreItemMetadata:a4 expirationDate:0];
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPStoreItemMetadata;
  uint64_t v8 = [(MPStoreItemMetadata *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v9;

    uint64_t v11 = [v6 copy];
    storePlatformDictionary = v8->_storePlatformDictionary;
    v8->_storePlatformDictionary = (NSDictionary *)v11;
  }
  return v8;
}

- (MPStoreItemMetadata)initWithStorePlatformDictionary:(id)a3
{
  return [(MPStoreItemMetadata *)self initWithStorePlatformDictionary:a3 expirationDate:0];
}

- (MPStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3 parentStoreItemMetadata:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(MPStoreItemMetadata *)self initWithStoreMusicAPIDictionary:a3];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_parentStoreItemMetadata, a4);
  }

  return v9;
}

- (MPStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreItemMetadata;
  id v5 = [(MPStoreItemMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    storeMusicAPIDictionary = v5->_storeMusicAPIDictionary;
    v5->_storeMusicAPIDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (MPStoreItemMetadata)initWithDownloadAssetDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemMetadata;
  id v5 = [(MPStoreItemMetadata *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    downloadAssetDictionary = v5->_downloadAssetDictionary;
    v5->_downloadAssetDictionary = (NSDictionary *)v6;

    uint64_t v8 = [v4 objectForKey:@"metadata"];
    if (_NSIsNSDictionary()) {
      objc_storeStrong((id *)&v5->_downloadMetadataDictionary, v8);
    }
  }
  return v5;
}

+ (id)storeServerCalendar
{
  if (storeServerCalendar_sOnceToken != -1) {
    dispatch_once(&storeServerCalendar_sOnceToken, &__block_literal_global_2009);
  }
  id v2 = (void *)storeServerCalendar_sGMTCalendar;

  return v2;
}

void __42__MPStoreItemMetadata_storeServerCalendar__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)storeServerCalendar_sGMTCalendar;
  storeServerCalendar_sGMTCalendar = v1;

  char v3 = (void *)storeServerCalendar_sGMTCalendar;
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];
}

+ (id)artworkRequestTokenForStorePlatformArtworkValue:(id)a3
{
  id v3 = a3;
  if (_NSIsNSArray())
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB8728]) initWithArtworkResponseArray:v3];
  }
  else
  {
    if (!_NSIsNSDictionary())
    {
      id v5 = 0;
      goto LABEL_8;
    }
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB8728]) initWithArtworkResponseDictionary:v3];
  }
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:v4];
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasMetadataForRequestReason:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      uint64_t v4 = [(MPStoreItemMetadata *)self childrenStoreIDs];
      if (v4)
      {
        id v5 = [(MPStoreItemMetadata *)self childrenStoreIDs];
        BOOL v8 = [v5 count] != 0;
LABEL_29:

        goto LABEL_30;
      }
LABEL_24:
      BOOL v8 = 0;
LABEL_30:

      return v8;
    }
    if (a3 == 1)
    {
      uint64_t v4 = [(MPStoreItemMetadata *)self artworkRequestToken];
      if (v4)
      {
        id v5 = [(MPStoreItemMetadata *)self name];
        if (v5)
        {
          uint64_t v6 = [(MPStoreItemMetadata *)self offers];
          if (v6)
          {
            id v7 = [(MPStoreItemMetadata *)self URL];
            BOOL v8 = v7 != 0;
          }
          else
          {
            BOOL v8 = 0;
          }
        }
        else
        {
          BOOL v8 = 0;
        }
        goto LABEL_29;
      }
      goto LABEL_24;
    }
    return 1;
  }
  uint64_t v9 = [(MPStoreItemMetadata *)self artworkRequestToken];
  if (!v9) {
    return 0;
  }
  objc_super v10 = (void *)v9;
  uint64_t v11 = [(MPStoreItemMetadata *)self name];

  if (!v11) {
    return 0;
  }
  uint64_t v12 = [(MPStoreItemMetadata *)self itemKind];
  BOOL IsContainerKind = MPStoreItemMetadataItemKindIsContainerKind(v12);

  if (!IsContainerKind) {
    return 1;
  }
  objc_super v14 = [(MPStoreItemMetadata *)self childrenStoreIDs];
  if ([v14 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = -[MPStoreItemMetadata childStorePlatformDictionaryForStoreID:](self, "childStorePlatformDictionaryForStoreID:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);

          if (!v20)
          {
            int v21 = 0;
            goto LABEL_33;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    int v21 = 1;
LABEL_33:
  }
  else
  {
    int v21 = 0;
  }

  return v21 != 0;
}

- (NSString)cacheableItemIdentifier
{
  id v3 = [(MPStoreItemMetadata *)self cloudUniversalLibraryID];
  uint64_t v4 = MPStoreItemMetadataStringNormalizeStoreIDValue(v3);

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [(MPStoreItemMetadata *)self storeID];
    id v7 = MPStoreItemMetadataStringNormalizeStoreIDValue(v6);

    if (v7)
    {
      id v5 = v7;
    }
    else
    {
      BOOL v8 = [(MPStoreItemMetadata *)self socialProfileID];
      MPStoreItemMetadataStringNormalizeStoreIDValue(v8);
      id v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5) {
        id v9 = v5;
      }
    }
  }

  return (NSString *)v5;
}

@end