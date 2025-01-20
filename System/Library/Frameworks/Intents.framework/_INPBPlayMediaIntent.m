@interface _INPBPlayMediaIntent
+ (BOOL)supportsSecureCoding;
+ (Class)alternativeResultsType;
+ (Class)audioSearchResultsType;
+ (Class)bucketType;
+ (Class)hashedRouteUIDsType;
+ (Class)mediaItemsType;
- (BOOL)hasAudiobookAuthor;
- (BOOL)hasAudiobookTitle;
- (BOOL)hasExpirationDate;
- (BOOL)hasIntentMetadata;
- (BOOL)hasMediaContainer;
- (BOOL)hasMediaSearch;
- (BOOL)hasMediaUserContext;
- (BOOL)hasMusicArtistName;
- (BOOL)hasParsecCategory;
- (BOOL)hasPlayShuffled;
- (BOOL)hasPlaybackQueueLocation;
- (BOOL)hasPlaybackRepeatMode;
- (BOOL)hasPlaybackSpeed;
- (BOOL)hasPlaylistTitle;
- (BOOL)hasPrivatePlayMediaIntentData;
- (BOOL)hasProxiedBundleIdentifier;
- (BOOL)hasRecoID;
- (BOOL)hasResumePlayback;
- (BOOL)hasShowTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)playShuffled;
- (BOOL)readFrom:(id)a3;
- (BOOL)resumePlayback;
- (NSArray)alternativeResults;
- (NSArray)audioSearchResults;
- (NSArray)buckets;
- (NSArray)hashedRouteUIDs;
- (NSArray)mediaItems;
- (NSString)proxiedBundleIdentifier;
- (NSString)recoID;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBMediaItemValue)mediaContainer;
- (_INPBMediaSearch)mediaSearch;
- (_INPBPlayMediaIntent)initWithCoder:(id)a3;
- (_INPBPrivatePlayMediaIntentData)privatePlayMediaIntentData;
- (_INPBString)audiobookAuthor;
- (_INPBString)audiobookTitle;
- (_INPBString)mediaUserContext;
- (_INPBString)musicArtistName;
- (_INPBString)playlistTitle;
- (_INPBString)showTitle;
- (_INPBTimestamp)expirationDate;
- (double)playbackSpeed;
- (id)alternativeResultsAtIndex:(unint64_t)a3;
- (id)audioSearchResultsAtIndex:(unint64_t)a3;
- (id)bucketAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)hashedRouteUIDsAtIndex:(unint64_t)a3;
- (id)mediaItemsAtIndex:(unint64_t)a3;
- (id)parsecCategoryAsString:(int)a3;
- (id)playbackQueueLocationAsString:(int)a3;
- (id)playbackRepeatModeAsString:(int)a3;
- (int)StringAsParsecCategory:(id)a3;
- (int)StringAsPlaybackQueueLocation:(id)a3;
- (int)StringAsPlaybackRepeatMode:(id)a3;
- (int)parsecCategory;
- (int)playbackQueueLocation;
- (int)playbackRepeatMode;
- (unint64_t)alternativeResultsCount;
- (unint64_t)audioSearchResultsCount;
- (unint64_t)bucketsCount;
- (unint64_t)hash;
- (unint64_t)hashedRouteUIDsCount;
- (unint64_t)mediaItemsCount;
- (void)addAlternativeResults:(id)a3;
- (void)addAudioSearchResults:(id)a3;
- (void)addBucket:(id)a3;
- (void)addHashedRouteUIDs:(id)a3;
- (void)addMediaItems:(id)a3;
- (void)clearAlternativeResults;
- (void)clearAudioSearchResults;
- (void)clearBuckets;
- (void)clearHashedRouteUIDs;
- (void)clearMediaItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternativeResults:(id)a3;
- (void)setAudioSearchResults:(id)a3;
- (void)setAudiobookAuthor:(id)a3;
- (void)setAudiobookTitle:(id)a3;
- (void)setBuckets:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHasParsecCategory:(BOOL)a3;
- (void)setHasPlayShuffled:(BOOL)a3;
- (void)setHasPlaybackQueueLocation:(BOOL)a3;
- (void)setHasPlaybackRepeatMode:(BOOL)a3;
- (void)setHasPlaybackSpeed:(BOOL)a3;
- (void)setHasResumePlayback:(BOOL)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMediaContainer:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaSearch:(id)a3;
- (void)setMediaUserContext:(id)a3;
- (void)setMusicArtistName:(id)a3;
- (void)setParsecCategory:(int)a3;
- (void)setPlayShuffled:(BOOL)a3;
- (void)setPlaybackQueueLocation:(int)a3;
- (void)setPlaybackRepeatMode:(int)a3;
- (void)setPlaybackSpeed:(double)a3;
- (void)setPlaylistTitle:(id)a3;
- (void)setPrivatePlayMediaIntentData:(id)a3;
- (void)setProxiedBundleIdentifier:(id)a3;
- (void)setRecoID:(id)a3;
- (void)setResumePlayback:(BOOL)a3;
- (void)setShowTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPlayMediaIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_recoID, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_privatePlayMediaIntentData, 0);
  objc_storeStrong((id *)&self->_playlistTitle, 0);
  objc_storeStrong((id *)&self->_musicArtistName, 0);
  objc_storeStrong((id *)&self->_mediaUserContext, 0);
  objc_storeStrong((id *)&self->_mediaSearch, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_mediaContainer, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_hashedRouteUIDs, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_audiobookTitle, 0);
  objc_storeStrong((id *)&self->_audiobookAuthor, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);

  objc_storeStrong((id *)&self->_alternativeResults, 0);
}

- (_INPBString)showTitle
{
  return self->_showTitle;
}

- (BOOL)resumePlayback
{
  return self->_resumePlayback;
}

- (NSString)recoID
{
  return self->_recoID;
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (_INPBPrivatePlayMediaIntentData)privatePlayMediaIntentData
{
  return self->_privatePlayMediaIntentData;
}

- (_INPBString)playlistTitle
{
  return self->_playlistTitle;
}

- (double)playbackSpeed
{
  return self->_playbackSpeed;
}

- (int)playbackRepeatMode
{
  return self->_playbackRepeatMode;
}

- (int)playbackQueueLocation
{
  return self->_playbackQueueLocation;
}

- (BOOL)playShuffled
{
  return self->_playShuffled;
}

- (int)parsecCategory
{
  return self->_parsecCategory;
}

- (_INPBString)musicArtistName
{
  return self->_musicArtistName;
}

- (_INPBString)mediaUserContext
{
  return self->_mediaUserContext;
}

- (_INPBMediaSearch)mediaSearch
{
  return self->_mediaSearch;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (_INPBMediaItemValue)mediaContainer
{
  return self->_mediaContainer;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)hashedRouteUIDs
{
  return self->_hashedRouteUIDs;
}

- (_INPBTimestamp)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (_INPBString)audiobookTitle
{
  return self->_audiobookTitle;
}

- (_INPBString)audiobookAuthor
{
  return self->_audiobookAuthor;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (NSArray)alternativeResults
{
  return self->_alternativeResults;
}

- (id)dictionaryRepresentation
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alternativeResults count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v5 = self->_alternativeResults;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v92 objects:v100 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v93 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v92 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v92 objects:v100 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"alternativeResults"];
  }
  if ([(NSArray *)self->_audioSearchResults count])
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v12 = self->_audioSearchResults;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v88 objects:v99 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v89;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v89 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v88 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v88 objects:v99 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"audioSearchResults"];
  }
  v18 = [(_INPBPlayMediaIntent *)self audiobookAuthor];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"audiobookAuthor"];

  v20 = [(_INPBPlayMediaIntent *)self audiobookTitle];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"audiobookTitle"];

  if ([(NSArray *)self->_buckets count])
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v23 = self->_buckets;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v84 objects:v98 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v85;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v85 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v84 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v84 objects:v98 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"bucket"];
  }
  v29 = [(_INPBPlayMediaIntent *)self expirationDate];
  v30 = [v29 dictionaryRepresentation];
  [v3 setObject:v30 forKeyedSubscript:@"expirationDate"];

  if ([(NSArray *)self->_hashedRouteUIDs count])
  {
    v31 = [MEMORY[0x1E4F1CA48] array];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v32 = self->_hashedRouteUIDs;
    uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v80 objects:v97 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v81;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v81 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v80 + 1) + 8 * m) dictionaryRepresentation];
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v80 objects:v97 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKeyedSubscript:@"hashedRouteUIDs"];
  }
  v38 = [(_INPBPlayMediaIntent *)self intentMetadata];
  v39 = [v38 dictionaryRepresentation];
  [v3 setObject:v39 forKeyedSubscript:@"intentMetadata"];

  v40 = [(_INPBPlayMediaIntent *)self mediaContainer];
  v41 = [v40 dictionaryRepresentation];
  [v3 setObject:v41 forKeyedSubscript:@"mediaContainer"];

  if ([(NSArray *)self->_mediaItems count])
  {
    v42 = [MEMORY[0x1E4F1CA48] array];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v43 = self->_mediaItems;
    uint64_t v44 = [(NSArray *)v43 countByEnumeratingWithState:&v76 objects:v96 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v77;
      do
      {
        for (uint64_t n = 0; n != v45; ++n)
        {
          if (*(void *)v77 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = [*(id *)(*((void *)&v76 + 1) + 8 * n) dictionaryRepresentation];
          [v42 addObject:v48];
        }
        uint64_t v45 = [(NSArray *)v43 countByEnumeratingWithState:&v76 objects:v96 count:16];
      }
      while (v45);
    }

    [v3 setObject:v42 forKeyedSubscript:@"mediaItems"];
  }
  v49 = [(_INPBPlayMediaIntent *)self mediaSearch];
  v50 = [v49 dictionaryRepresentation];
  [v3 setObject:v50 forKeyedSubscript:@"mediaSearch"];

  v51 = [(_INPBPlayMediaIntent *)self mediaUserContext];
  v52 = [v51 dictionaryRepresentation];
  [v3 setObject:v52 forKeyedSubscript:@"mediaUserContext"];

  v53 = [(_INPBPlayMediaIntent *)self musicArtistName];
  v54 = [v53 dictionaryRepresentation];
  [v3 setObject:v54 forKeyedSubscript:@"musicArtistName"];

  if ([(_INPBPlayMediaIntent *)self hasParsecCategory])
  {
    uint64_t v55 = [(_INPBPlayMediaIntent *)self parsecCategory];
    if (v55 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v55);
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = off_1E551A868[v55];
    }
    [v3 setObject:v56 forKeyedSubscript:@"parsecCategory"];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlayShuffled])
  {
    v57 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPlayMediaIntent playShuffled](self, "playShuffled"));
    [v3 setObject:v57 forKeyedSubscript:@"playShuffled"];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackQueueLocation])
  {
    uint64_t v58 = [(_INPBPlayMediaIntent *)self playbackQueueLocation];
    if (v58 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v58);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E551A8B0[v58];
    }
    [v3 setObject:v59 forKeyedSubscript:@"playbackQueueLocation"];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackRepeatMode])
  {
    uint64_t v60 = [(_INPBPlayMediaIntent *)self playbackRepeatMode];
    if (v60 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v60);
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = off_1E551A8D0[v60];
    }
    [v3 setObject:v61 forKeyedSubscript:@"playbackRepeatMode"];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackSpeed])
  {
    v62 = NSNumber;
    [(_INPBPlayMediaIntent *)self playbackSpeed];
    v63 = objc_msgSend(v62, "numberWithDouble:");
    [v3 setObject:v63 forKeyedSubscript:@"playbackSpeed"];
  }
  v64 = [(_INPBPlayMediaIntent *)self playlistTitle];
  v65 = [v64 dictionaryRepresentation];
  [v3 setObject:v65 forKeyedSubscript:@"playlistTitle"];

  v66 = [(_INPBPlayMediaIntent *)self privatePlayMediaIntentData];
  v67 = [v66 dictionaryRepresentation];
  [v3 setObject:v67 forKeyedSubscript:@"privatePlayMediaIntentData"];

  if (self->_proxiedBundleIdentifier)
  {
    v68 = [(_INPBPlayMediaIntent *)self proxiedBundleIdentifier];
    v69 = (void *)[v68 copy];
    [v3 setObject:v69 forKeyedSubscript:@"proxiedBundleIdentifier"];
  }
  if (self->_recoID)
  {
    v70 = [(_INPBPlayMediaIntent *)self recoID];
    v71 = (void *)[v70 copy];
    [v3 setObject:v71 forKeyedSubscript:@"recoID"];
  }
  if ([(_INPBPlayMediaIntent *)self hasResumePlayback])
  {
    v72 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPlayMediaIntent resumePlayback](self, "resumePlayback"));
    [v3 setObject:v72 forKeyedSubscript:@"resumePlayback"];
  }
  v73 = [(_INPBPlayMediaIntent *)self showTitle];
  v74 = [v73 dictionaryRepresentation];
  [v3 setObject:v74 forKeyedSubscript:@"showTitle"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_alternativeResults hash];
  uint64_t v4 = [(NSArray *)self->_audioSearchResults hash];
  unint64_t v5 = [(_INPBString *)self->_audiobookAuthor hash];
  unint64_t v6 = [(_INPBString *)self->_audiobookTitle hash];
  uint64_t v7 = [(NSArray *)self->_buckets hash];
  unint64_t v8 = [(_INPBTimestamp *)self->_expirationDate hash];
  uint64_t v9 = [(NSArray *)self->_hashedRouteUIDs hash];
  unint64_t v10 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v31 = [(_INPBMediaItemValue *)self->_mediaContainer hash];
  uint64_t v30 = [(NSArray *)self->_mediaItems hash];
  unint64_t v29 = [(_INPBMediaSearch *)self->_mediaSearch hash];
  unint64_t v28 = [(_INPBString *)self->_mediaUserContext hash];
  unint64_t v27 = [(_INPBString *)self->_musicArtistName hash];
  if ([(_INPBPlayMediaIntent *)self hasParsecCategory]) {
    uint64_t v26 = 2654435761 * self->_parsecCategory;
  }
  else {
    uint64_t v26 = 0;
  }
  if ([(_INPBPlayMediaIntent *)self hasPlayShuffled]) {
    uint64_t v25 = 2654435761 * self->_playShuffled;
  }
  else {
    uint64_t v25 = 0;
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackQueueLocation]) {
    uint64_t v24 = 2654435761 * self->_playbackQueueLocation;
  }
  else {
    uint64_t v24 = 0;
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackRepeatMode]) {
    uint64_t v23 = 2654435761 * self->_playbackRepeatMode;
  }
  else {
    uint64_t v23 = 0;
  }
  unint64_t v34 = v8;
  uint64_t v35 = v7;
  unint64_t v32 = v10;
  uint64_t v33 = v9;
  if ([(_INPBPlayMediaIntent *)self hasPlaybackSpeed])
  {
    double playbackSpeed = self->_playbackSpeed;
    double v12 = -playbackSpeed;
    if (playbackSpeed >= 0.0) {
      double v12 = self->_playbackSpeed;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    uint64_t v16 = v3;
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v15 += (unint64_t)v14;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    uint64_t v16 = v3;
    unint64_t v15 = 0;
  }
  unint64_t v17 = [(_INPBString *)self->_playlistTitle hash];
  unint64_t v18 = [(_INPBPrivatePlayMediaIntentData *)self->_privatePlayMediaIntentData hash];
  NSUInteger v19 = [(NSString *)self->_proxiedBundleIdentifier hash];
  NSUInteger v20 = [(NSString *)self->_recoID hash];
  if ([(_INPBPlayMediaIntent *)self hasResumePlayback]) {
    uint64_t v21 = 2654435761 * self->_resumePlayback;
  }
  else {
    uint64_t v21 = 0;
  }
  return v4 ^ v16 ^ v5 ^ v6 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(_INPBString *)self->_showTitle hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_116;
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self alternativeResults];
  unint64_t v6 = [v4 alternativeResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v7 = [(_INPBPlayMediaIntent *)self alternativeResults];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBPlayMediaIntent *)self alternativeResults];
    unint64_t v10 = [v4 alternativeResults];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self audioSearchResults];
  unint64_t v6 = [v4 audioSearchResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v12 = [(_INPBPlayMediaIntent *)self audioSearchResults];
  if (v12)
  {
    long double v13 = (void *)v12;
    double v14 = [(_INPBPlayMediaIntent *)self audioSearchResults];
    unint64_t v15 = [v4 audioSearchResults];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self audiobookAuthor];
  unint64_t v6 = [v4 audiobookAuthor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v17 = [(_INPBPlayMediaIntent *)self audiobookAuthor];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    NSUInteger v19 = [(_INPBPlayMediaIntent *)self audiobookAuthor];
    NSUInteger v20 = [v4 audiobookAuthor];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self audiobookTitle];
  unint64_t v6 = [v4 audiobookTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v22 = [(_INPBPlayMediaIntent *)self audiobookTitle];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_INPBPlayMediaIntent *)self audiobookTitle];
    uint64_t v25 = [v4 audiobookTitle];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self buckets];
  unint64_t v6 = [v4 buckets];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v27 = [(_INPBPlayMediaIntent *)self buckets];
  if (v27)
  {
    unint64_t v28 = (void *)v27;
    unint64_t v29 = [(_INPBPlayMediaIntent *)self buckets];
    uint64_t v30 = [v4 buckets];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self expirationDate];
  unint64_t v6 = [v4 expirationDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v32 = [(_INPBPlayMediaIntent *)self expirationDate];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    unint64_t v34 = [(_INPBPlayMediaIntent *)self expirationDate];
    uint64_t v35 = [v4 expirationDate];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self hashedRouteUIDs];
  unint64_t v6 = [v4 hashedRouteUIDs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v37 = [(_INPBPlayMediaIntent *)self hashedRouteUIDs];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBPlayMediaIntent *)self hashedRouteUIDs];
    v40 = [v4 hashedRouteUIDs];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v42 = [(_INPBPlayMediaIntent *)self intentMetadata];
  if (v42)
  {
    v43 = (void *)v42;
    uint64_t v44 = [(_INPBPlayMediaIntent *)self intentMetadata];
    uint64_t v45 = [v4 intentMetadata];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self mediaContainer];
  unint64_t v6 = [v4 mediaContainer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v47 = [(_INPBPlayMediaIntent *)self mediaContainer];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_INPBPlayMediaIntent *)self mediaContainer];
    v50 = [v4 mediaContainer];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self mediaItems];
  unint64_t v6 = [v4 mediaItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v52 = [(_INPBPlayMediaIntent *)self mediaItems];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBPlayMediaIntent *)self mediaItems];
    uint64_t v55 = [v4 mediaItems];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self mediaSearch];
  unint64_t v6 = [v4 mediaSearch];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v57 = [(_INPBPlayMediaIntent *)self mediaSearch];
  if (v57)
  {
    uint64_t v58 = (void *)v57;
    v59 = [(_INPBPlayMediaIntent *)self mediaSearch];
    uint64_t v60 = [v4 mediaSearch];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self mediaUserContext];
  unint64_t v6 = [v4 mediaUserContext];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v62 = [(_INPBPlayMediaIntent *)self mediaUserContext];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [(_INPBPlayMediaIntent *)self mediaUserContext];
    v65 = [v4 mediaUserContext];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self musicArtistName];
  unint64_t v6 = [v4 musicArtistName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v67 = [(_INPBPlayMediaIntent *)self musicArtistName];
  if (v67)
  {
    v68 = (void *)v67;
    v69 = [(_INPBPlayMediaIntent *)self musicArtistName];
    v70 = [v4 musicArtistName];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  int v72 = [(_INPBPlayMediaIntent *)self hasParsecCategory];
  if (v72 != [v4 hasParsecCategory]) {
    goto LABEL_116;
  }
  if ([(_INPBPlayMediaIntent *)self hasParsecCategory])
  {
    if ([v4 hasParsecCategory])
    {
      int parsecCategory = self->_parsecCategory;
      if (parsecCategory != [v4 parsecCategory]) {
        goto LABEL_116;
      }
    }
  }
  int v74 = [(_INPBPlayMediaIntent *)self hasPlayShuffled];
  if (v74 != [v4 hasPlayShuffled]) {
    goto LABEL_116;
  }
  if ([(_INPBPlayMediaIntent *)self hasPlayShuffled])
  {
    if ([v4 hasPlayShuffled])
    {
      int playShuffled = self->_playShuffled;
      if (playShuffled != [v4 playShuffled]) {
        goto LABEL_116;
      }
    }
  }
  int v76 = [(_INPBPlayMediaIntent *)self hasPlaybackQueueLocation];
  if (v76 != [v4 hasPlaybackQueueLocation]) {
    goto LABEL_116;
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackQueueLocation])
  {
    if ([v4 hasPlaybackQueueLocation])
    {
      playbackQueueLocatiouint64_t n = self->_playbackQueueLocation;
      if (playbackQueueLocation != [v4 playbackQueueLocation]) {
        goto LABEL_116;
      }
    }
  }
  int v78 = [(_INPBPlayMediaIntent *)self hasPlaybackRepeatMode];
  if (v78 != [v4 hasPlaybackRepeatMode]) {
    goto LABEL_116;
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackRepeatMode])
  {
    if ([v4 hasPlaybackRepeatMode])
    {
      int playbackRepeatMode = self->_playbackRepeatMode;
      if (playbackRepeatMode != [v4 playbackRepeatMode]) {
        goto LABEL_116;
      }
    }
  }
  int v80 = [(_INPBPlayMediaIntent *)self hasPlaybackSpeed];
  if (v80 != [v4 hasPlaybackSpeed]) {
    goto LABEL_116;
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackSpeed])
  {
    if ([v4 hasPlaybackSpeed])
    {
      double playbackSpeed = self->_playbackSpeed;
      [v4 playbackSpeed];
      if (playbackSpeed != v82) {
        goto LABEL_116;
      }
    }
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self playlistTitle];
  unint64_t v6 = [v4 playlistTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v83 = [(_INPBPlayMediaIntent *)self playlistTitle];
  if (v83)
  {
    long long v84 = (void *)v83;
    long long v85 = [(_INPBPlayMediaIntent *)self playlistTitle];
    long long v86 = [v4 playlistTitle];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self privatePlayMediaIntentData];
  unint64_t v6 = [v4 privatePlayMediaIntentData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v88 = [(_INPBPlayMediaIntent *)self privatePlayMediaIntentData];
  if (v88)
  {
    long long v89 = (void *)v88;
    long long v90 = [(_INPBPlayMediaIntent *)self privatePlayMediaIntentData];
    long long v91 = [v4 privatePlayMediaIntentData];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self proxiedBundleIdentifier];
  unint64_t v6 = [v4 proxiedBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v93 = [(_INPBPlayMediaIntent *)self proxiedBundleIdentifier];
  if (v93)
  {
    long long v94 = (void *)v93;
    long long v95 = [(_INPBPlayMediaIntent *)self proxiedBundleIdentifier];
    v96 = [v4 proxiedBundleIdentifier];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self recoID];
  unint64_t v6 = [v4 recoID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_115;
  }
  uint64_t v98 = [(_INPBPlayMediaIntent *)self recoID];
  if (v98)
  {
    v99 = (void *)v98;
    v100 = [(_INPBPlayMediaIntent *)self recoID];
    uint64_t v101 = [v4 recoID];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_116;
    }
  }
  else
  {
  }
  int v103 = [(_INPBPlayMediaIntent *)self hasResumePlayback];
  if (v103 != [v4 hasResumePlayback]) {
    goto LABEL_116;
  }
  if ([(_INPBPlayMediaIntent *)self hasResumePlayback])
  {
    if ([v4 hasResumePlayback])
    {
      resumePlaybacuint64_t k = self->_resumePlayback;
      if (resumePlayback != [v4 resumePlayback]) {
        goto LABEL_116;
      }
    }
  }
  unint64_t v5 = [(_INPBPlayMediaIntent *)self showTitle];
  unint64_t v6 = [v4 showTitle];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v105 = [(_INPBPlayMediaIntent *)self showTitle];
    if (!v105)
    {

LABEL_119:
      BOOL v110 = 1;
      goto LABEL_117;
    }
    v106 = (void *)v105;
    v107 = [(_INPBPlayMediaIntent *)self showTitle];
    v108 = [v4 showTitle];
    char v109 = [v107 isEqual:v108];

    if (v109) {
      goto LABEL_119;
    }
  }
  else
  {
LABEL_115:
  }
LABEL_116:
  BOOL v110 = 0;
LABEL_117:

  return v110;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBPlayMediaIntent allocWithZone:](_INPBPlayMediaIntent, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSArray *)self->_alternativeResults copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setAlternativeResults:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_audioSearchResults copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setAudioSearchResults:v7];

  id v8 = [(_INPBString *)self->_audiobookAuthor copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setAudiobookAuthor:v8];

  id v9 = [(_INPBString *)self->_audiobookTitle copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setAudiobookTitle:v9];

  unint64_t v10 = (void *)[(NSArray *)self->_buckets copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setBuckets:v10];

  id v11 = [(_INPBTimestamp *)self->_expirationDate copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setExpirationDate:v11];

  uint64_t v12 = (void *)[(NSArray *)self->_hashedRouteUIDs copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setHashedRouteUIDs:v12];

  id v13 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setIntentMetadata:v13];

  id v14 = [(_INPBMediaItemValue *)self->_mediaContainer copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setMediaContainer:v14];

  unint64_t v15 = (void *)[(NSArray *)self->_mediaItems copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setMediaItems:v15];

  id v16 = [(_INPBMediaSearch *)self->_mediaSearch copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setMediaSearch:v16];

  id v17 = [(_INPBString *)self->_mediaUserContext copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setMediaUserContext:v17];

  id v18 = [(_INPBString *)self->_musicArtistName copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setMusicArtistName:v18];

  if ([(_INPBPlayMediaIntent *)self hasParsecCategory]) {
    [(_INPBPlayMediaIntent *)v5 setParsecCategory:[(_INPBPlayMediaIntent *)self parsecCategory]];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlayShuffled]) {
    [(_INPBPlayMediaIntent *)v5 setPlayShuffled:[(_INPBPlayMediaIntent *)self playShuffled]];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackQueueLocation]) {
    [(_INPBPlayMediaIntent *)v5 setPlaybackQueueLocation:[(_INPBPlayMediaIntent *)self playbackQueueLocation]];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackRepeatMode]) {
    [(_INPBPlayMediaIntent *)v5 setPlaybackRepeatMode:[(_INPBPlayMediaIntent *)self playbackRepeatMode]];
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackSpeed])
  {
    [(_INPBPlayMediaIntent *)self playbackSpeed];
    -[_INPBPlayMediaIntent setPlaybackSpeed:](v5, "setPlaybackSpeed:");
  }
  id v19 = [(_INPBString *)self->_playlistTitle copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setPlaylistTitle:v19];

  id v20 = [(_INPBPrivatePlayMediaIntentData *)self->_privatePlayMediaIntentData copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setPrivatePlayMediaIntentData:v20];

  int v21 = (void *)[(NSString *)self->_proxiedBundleIdentifier copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setProxiedBundleIdentifier:v21];

  uint64_t v22 = (void *)[(NSString *)self->_recoID copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setRecoID:v22];

  if ([(_INPBPlayMediaIntent *)self hasResumePlayback]) {
    [(_INPBPlayMediaIntent *)v5 setResumePlayback:[(_INPBPlayMediaIntent *)self resumePlayback]];
  }
  id v23 = [(_INPBString *)self->_showTitle copyWithZone:a3];
  [(_INPBPlayMediaIntent *)v5 setShowTitle:v23];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPlayMediaIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPlayMediaIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPlayMediaIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPlayMediaIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPlayMediaIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  unint64_t v5 = self->_alternativeResults;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v71;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v71 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v7);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  unint64_t v10 = self->_audioSearchResults;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v67;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v12);
  }

  unint64_t v15 = [(_INPBPlayMediaIntent *)self audiobookAuthor];

  if (v15)
  {
    id v16 = [(_INPBPlayMediaIntent *)self audiobookAuthor];
    PBDataWriterWriteSubmessage();
  }
  id v17 = [(_INPBPlayMediaIntent *)self audiobookTitle];

  if (v17)
  {
    id v18 = [(_INPBPlayMediaIntent *)self audiobookTitle];
    PBDataWriterWriteSubmessage();
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v19 = self->_buckets;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v63;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v63 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v62 objects:v76 count:16];
    }
    while (v21);
  }

  uint64_t v24 = [(_INPBPlayMediaIntent *)self expirationDate];

  if (v24)
  {
    uint64_t v25 = [(_INPBPlayMediaIntent *)self expirationDate];
    PBDataWriterWriteSubmessage();
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  int v26 = self->_hashedRouteUIDs;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v58 objects:v75 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v58 objects:v75 count:16];
    }
    while (v28);
  }

  int v31 = [(_INPBPlayMediaIntent *)self intentMetadata];

  if (v31)
  {
    uint64_t v32 = [(_INPBPlayMediaIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v33 = [(_INPBPlayMediaIntent *)self mediaContainer];

  if (v33)
  {
    unint64_t v34 = [(_INPBPlayMediaIntent *)self mediaContainer];
    PBDataWriterWriteSubmessage();
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v35 = self->_mediaItems;
  uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v54 objects:v74 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v55;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v54 objects:v74 count:16];
    }
    while (v37);
  }

  v40 = [(_INPBPlayMediaIntent *)self mediaSearch];

  if (v40)
  {
    int v41 = [(_INPBPlayMediaIntent *)self mediaSearch];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v42 = [(_INPBPlayMediaIntent *)self mediaUserContext];

  if (v42)
  {
    v43 = [(_INPBPlayMediaIntent *)self mediaUserContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v44 = [(_INPBPlayMediaIntent *)self musicArtistName];

  if (v44)
  {
    uint64_t v45 = [(_INPBPlayMediaIntent *)self musicArtistName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPlayMediaIntent *)self hasParsecCategory]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPlayMediaIntent *)self hasPlayShuffled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackQueueLocation]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackRepeatMode]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPlayMediaIntent *)self hasPlaybackSpeed]) {
    PBDataWriterWriteDoubleField();
  }
  int v46 = [(_INPBPlayMediaIntent *)self playlistTitle];

  if (v46)
  {
    uint64_t v47 = [(_INPBPlayMediaIntent *)self playlistTitle];
    PBDataWriterWriteSubmessage();
  }
  v48 = [(_INPBPlayMediaIntent *)self privatePlayMediaIntentData];

  if (v48)
  {
    v49 = [(_INPBPlayMediaIntent *)self privatePlayMediaIntentData];
    PBDataWriterWriteSubmessage();
  }
  v50 = [(_INPBPlayMediaIntent *)self proxiedBundleIdentifier];

  if (v50) {
    PBDataWriterWriteStringField();
  }
  int v51 = [(_INPBPlayMediaIntent *)self recoID];

  if (v51) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBPlayMediaIntent *)self hasResumePlayback]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v52 = [(_INPBPlayMediaIntent *)self showTitle];

  if (v52)
  {
    v53 = [(_INPBPlayMediaIntent *)self showTitle];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlayMediaIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasShowTitle
{
  return self->_showTitle != 0;
}

- (void)setShowTitle:(id)a3
{
}

- (void)setHasResumePlayback:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasResumePlayback
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setResumePlayback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_resumePlaybacuint64_t k = a3;
}

- (BOOL)hasRecoID
{
  return self->_recoID != 0;
}

- (void)setRecoID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  recoID = self->_recoID;
  self->_recoID = v4;

  MEMORY[0x1F41817F8](v4, recoID);
}

- (BOOL)hasProxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier != 0;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  proxiedBundleIdentifier = self->_proxiedBundleIdentifier;
  self->_proxiedBundleIdentifier = v4;

  MEMORY[0x1F41817F8](v4, proxiedBundleIdentifier);
}

- (BOOL)hasPrivatePlayMediaIntentData
{
  return self->_privatePlayMediaIntentData != 0;
}

- (void)setPrivatePlayMediaIntentData:(id)a3
{
}

- (BOOL)hasPlaylistTitle
{
  return self->_playlistTitle != 0;
}

- (void)setPlaylistTitle:(id)a3
{
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPlaybackSpeed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPlaybackSpeed:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_double playbackSpeed = a3;
}

- (int)StringAsPlaybackRepeatMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ONE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)playbackRepeatModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A8D0[a3];
  }

  return v3;
}

- (void)setHasPlaybackRepeatMode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPlaybackRepeatMode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPlaybackRepeatMode:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int playbackRepeatMode = a3;
  }
}

- (int)StringAsPlaybackQueueLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PLAYBACK_QUEUE_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NEXT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LATER"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)playbackQueueLocationAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A8B0[a3];
  }

  return v3;
}

- (void)setHasPlaybackQueueLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPlaybackQueueLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPlaybackQueueLocation:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_playbackQueueLocatiouint64_t n = a3;
  }
}

- (void)setHasPlayShuffled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlayShuffled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPlayShuffled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int playShuffled = a3;
}

- (int)StringAsParsecCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MOVIE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEB_VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MUSIC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PODCAST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"APP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BOOK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)parsecCategoryAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A868[a3];
  }

  return v3;
}

- (void)setHasParsecCategory:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParsecCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setParsecCategory:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int parsecCategory = a3;
  }
}

- (BOOL)hasMusicArtistName
{
  return self->_musicArtistName != 0;
}

- (void)setMusicArtistName:(id)a3
{
}

- (BOOL)hasMediaUserContext
{
  return self->_mediaUserContext != 0;
}

- (void)setMediaUserContext:(id)a3
{
}

- (BOOL)hasMediaSearch
{
  return self->_mediaSearch != 0;
}

- (void)setMediaSearch:(id)a3
{
}

- (id)mediaItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_mediaItems objectAtIndexedSubscript:a3];
}

- (unint64_t)mediaItemsCount
{
  return [(NSArray *)self->_mediaItems count];
}

- (void)addMediaItems:(id)a3
{
  id v4 = a3;
  mediaItems = self->_mediaItems;
  id v8 = v4;
  if (!mediaItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_mediaItems;
    self->_mediaItems = v6;

    id v4 = v8;
    mediaItems = self->_mediaItems;
  }
  [(NSArray *)mediaItems addObject:v4];
}

- (void)clearMediaItems
{
}

- (void)setMediaItems:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  mediaItems = self->_mediaItems;
  self->_mediaItems = v4;

  MEMORY[0x1F41817F8](v4, mediaItems);
}

- (BOOL)hasMediaContainer
{
  return self->_mediaContainer != 0;
}

- (void)setMediaContainer:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)hashedRouteUIDsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_hashedRouteUIDs objectAtIndexedSubscript:a3];
}

- (unint64_t)hashedRouteUIDsCount
{
  return [(NSArray *)self->_hashedRouteUIDs count];
}

- (void)addHashedRouteUIDs:(id)a3
{
  id v4 = a3;
  hashedRouteUIDs = self->_hashedRouteUIDs;
  id v8 = v4;
  if (!hashedRouteUIDs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_hashedRouteUIDs;
    self->_hashedRouteUIDs = v6;

    id v4 = v8;
    hashedRouteUIDs = self->_hashedRouteUIDs;
  }
  [(NSArray *)hashedRouteUIDs addObject:v4];
}

- (void)clearHashedRouteUIDs
{
}

- (void)setHashedRouteUIDs:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  hashedRouteUIDs = self->_hashedRouteUIDs;
  self->_hashedRouteUIDs = v4;

  MEMORY[0x1F41817F8](v4, hashedRouteUIDs);
}

- (BOOL)hasExpirationDate
{
  return self->_expirationDate != 0;
}

- (void)setExpirationDate:(id)a3
{
}

- (id)bucketAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_buckets objectAtIndexedSubscript:a3];
}

- (unint64_t)bucketsCount
{
  return [(NSArray *)self->_buckets count];
}

- (void)addBucket:(id)a3
{
  id v4 = a3;
  buckets = self->_buckets;
  id v8 = v4;
  if (!buckets)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_buckets;
    self->_buckets = v6;

    id v4 = v8;
    buckets = self->_buckets;
  }
  [(NSArray *)buckets addObject:v4];
}

- (void)clearBuckets
{
}

- (void)setBuckets:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  buckets = self->_buckets;
  self->_buckets = v4;

  MEMORY[0x1F41817F8](v4, buckets);
}

- (BOOL)hasAudiobookTitle
{
  return self->_audiobookTitle != 0;
}

- (void)setAudiobookTitle:(id)a3
{
}

- (BOOL)hasAudiobookAuthor
{
  return self->_audiobookAuthor != 0;
}

- (void)setAudiobookAuthor:(id)a3
{
}

- (id)audioSearchResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_audioSearchResults objectAtIndexedSubscript:a3];
}

- (unint64_t)audioSearchResultsCount
{
  return [(NSArray *)self->_audioSearchResults count];
}

- (void)addAudioSearchResults:(id)a3
{
  id v4 = a3;
  audioSearchResults = self->_audioSearchResults;
  id v8 = v4;
  if (!audioSearchResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_audioSearchResults;
    self->_audioSearchResults = v6;

    id v4 = v8;
    audioSearchResults = self->_audioSearchResults;
  }
  [(NSArray *)audioSearchResults addObject:v4];
}

- (void)clearAudioSearchResults
{
}

- (void)setAudioSearchResults:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  audioSearchResults = self->_audioSearchResults;
  self->_audioSearchResults = v4;

  MEMORY[0x1F41817F8](v4, audioSearchResults);
}

- (id)alternativeResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alternativeResults objectAtIndexedSubscript:a3];
}

- (unint64_t)alternativeResultsCount
{
  return [(NSArray *)self->_alternativeResults count];
}

- (void)addAlternativeResults:(id)a3
{
  id v4 = a3;
  alternativeResults = self->_alternativeResults;
  id v8 = v4;
  if (!alternativeResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alternativeResults;
    self->_alternativeResults = v6;

    id v4 = v8;
    alternativeResults = self->_alternativeResults;
  }
  [(NSArray *)alternativeResults addObject:v4];
}

- (void)clearAlternativeResults
{
}

- (void)setAlternativeResults:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  alternativeResults = self->_alternativeResults;
  self->_alternativeResults = v4;

  MEMORY[0x1F41817F8](v4, alternativeResults);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)mediaItemsType
{
  return (Class)objc_opt_class();
}

+ (Class)hashedRouteUIDsType
{
  return (Class)objc_opt_class();
}

+ (Class)bucketType
{
  return (Class)objc_opt_class();
}

+ (Class)audioSearchResultsType
{
  return (Class)objc_opt_class();
}

+ (Class)alternativeResultsType
{
  return (Class)objc_opt_class();
}

@end