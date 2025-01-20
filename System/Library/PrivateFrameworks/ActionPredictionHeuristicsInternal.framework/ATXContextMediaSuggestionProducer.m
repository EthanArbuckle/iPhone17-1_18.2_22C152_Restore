@interface ATXContextMediaSuggestionProducer
- (ATXContextMediaSuggestionProducer)initWithMediaRemoteContentItem:(id)a3 destDisplayName:(id)a4 expirationDate:(id)a5;
- (id)suggestionForAlbumWithReason:(unint64_t)a3 score:(double)a4;
- (id)suggestionForArtistWithReason:(unint64_t)a3 score:(double)a4;
- (id)suggestionForTrackWithReason:(unint64_t)a3 score:(double)a4;
- (uint64_t)_localizedReason;
@end

@implementation ATXContextMediaSuggestionProducer

- (ATXContextMediaSuggestionProducer)initWithMediaRemoteContentItem:(id)a3 destDisplayName:(id)a4 expirationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ATXContextMediaSuggestionProducer;
  v11 = [(ATXContextMediaSuggestionProducer *)&v23 init];
  if (v11)
  {
    v12 = [v8 metadata];
    v11->_mediaType = [v12 mediaType];
    v11->_mediaSubType = [v12 mediaSubType];
    uint64_t v13 = [v12 title];
    trackName = v11->_trackName;
    v11->_trackName = (NSString *)v13;

    if ([v12 hasITunesStoreIdentifier]) {
      uint64_t v15 = [v12 iTunesStoreIdentifier];
    }
    else {
      uint64_t v15 = 0;
    }
    v11->_trackAdamId = v15;
    uint64_t v16 = [v12 trackArtistName];
    artistName = v11->_artistName;
    v11->_artistName = (NSString *)v16;

    if ([v12 hasITunesStoreArtistIdentifier]) {
      uint64_t v18 = [v12 iTunesStoreArtistIdentifier];
    }
    else {
      uint64_t v18 = 0;
    }
    v11->_artistAdamId = v18;
    uint64_t v19 = [v12 albumName];
    albumName = v11->_albumName;
    v11->_albumName = (NSString *)v19;

    if ([v12 hasITunesStoreAlbumIdentifier]) {
      uint64_t v21 = [v12 iTunesStoreAlbumIdentifier];
    }
    else {
      uint64_t v21 = 0;
    }
    v11->_albumAdamId = v21;
    objc_storeStrong((id *)&v11->_destDisplayName, a4);
    objc_storeStrong((id *)&v11->_expirationDate, a5);
  }
  return v11;
}

- (uint64_t)_localizedReason
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1[10];
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = v3;
    if (v2)
    {
      v5 = [v3 localizedStringForKey:@"NOW_PLAYING_DEST" value:&stru_1F2719D20 table:0];

      _PASValidatedFormat(v5, v6, v7, v8, v9, v10, v11, v12, v1[10]);
      v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      v4 = v5;
    }
    else
    {
      v1 = [v3 localizedStringForKey:@"NOW_PLAYING_NO_DEST" value:&stru_1F2719D20 table:0];
    }
  }

  return v1;
}

- (id)suggestionForTrackWithReason:(unint64_t)a3 score:(double)a4
{
  trackName = self->_trackName;
  if (trackName
    && (int64_t trackAdamId = self->_trackAdamId) != 0
    && self->_mediaType == 2
    && ((int64_t mediaSubType = self->_mediaSubType, (unint64_t)(mediaSubType - 3) >= 2)
      ? (BOOL v8 = mediaSubType == 1)
      : (BOOL v8 = 1),
        !v8))
  {
    if (mediaSubType == 2) {
      uint64_t v13 = 9;
    }
    else {
      uint64_t v13 = 2;
    }
    v14 = -[ATXContextMediaSuggestionProducer _localizedReason]((uint64_t *)self);
    uint64_t v9 = +[ATXContextHeuristicSuggestionProducer mediaWithName:trackName type:v13 adamIdentifier:trackAdamId predictionReasons:a3 localizedReason:v14 score:self->_expirationDate expirationDate:a4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)suggestionForArtistWithReason:(unint64_t)a3 score:(double)a4
{
  artistName = self->_artistName;
  if (!artistName) {
    goto LABEL_10;
  }
  int64_t artistAdamId = self->_artistAdamId;
  if (!artistAdamId) {
    goto LABEL_10;
  }
  int64_t mediaType = self->_mediaType;
  if (mediaType != 1)
  {
    if (mediaType == 2 && self->_mediaSubType == 1) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  int64_t mediaSubType = self->_mediaSubType;
  if (mediaSubType == 1)
  {
LABEL_14:
    uint64_t v11 = 6;
    goto LABEL_15;
  }
  if (mediaSubType != 5)
  {
LABEL_10:
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = 15;
LABEL_15:
  v14 = -[ATXContextMediaSuggestionProducer _localizedReason]((uint64_t *)self);
  uint64_t v12 = +[ATXContextHeuristicSuggestionProducer mediaWithName:artistName type:v11 adamIdentifier:artistAdamId predictionReasons:a3 localizedReason:v14 score:self->_expirationDate expirationDate:a4];

LABEL_11:

  return v12;
}

- (id)suggestionForAlbumWithReason:(unint64_t)a3 score:(double)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_destDisplayName, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);

  objc_storeStrong((id *)&self->_trackName, 0);
}

@end