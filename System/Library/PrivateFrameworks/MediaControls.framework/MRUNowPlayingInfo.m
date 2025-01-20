@interface MRUNowPlayingInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaying;
- (BOOL)showPlaceholder;
- (MRUNowPlayingInfo)initWithIdentifier:(id)a3 title:(id)a4 artist:(id)a5 album:(id)a6 radio:(id)a7 composer:(id)a8 attribution:(id)a9 placeholder:(id)a10 showPlaceholder:(BOOL)a11 isPlaying:(BOOL)a12 adamID:(id)a13 internationalStandardRecordingCode:(id)a14;
- (MRUNowPlayingInfo)initWithMPCResponse:(id)a3 placeholder:(id)a4;
- (MRUNowPlayingInfo)initWithMRResponse:(id)a3 placeholder:(id)a4;
- (NSNumber)adamID;
- (NSString)album;
- (NSString)artist;
- (NSString)attribution;
- (NSString)composer;
- (NSString)identifier;
- (NSString)internationalStandardRecordingCode;
- (NSString)placeholder;
- (NSString)radio;
- (NSString)title;
- (id)description;
- (id)stringForComponents:(unint64_t)a3;
- (id)stringForComponents:(unint64_t)a3 separator:(id)a4;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setComposer:(id)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setRadio:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MRUNowPlayingInfo

- (MRUNowPlayingInfo)initWithMPCResponse:(id)a3 placeholder:(id)a4
{
  id v5 = a3;
  id v48 = a4;
  v6 = [v5 tracklist];
  v7 = [v6 playingItem];

  v8 = [v7 metadataObject];
  v9 = [v8 song];

  v10 = [v5 tracklist];
  v11 = [v10 items];
  v12 = [v11 firstSection];
  v13 = [v12 metadataObject];

  if ([v13 type] == 13)
  {
    v14 = [v13 radioStation];
  }
  else
  {
    v14 = 0;
  }
  v15 = NSNumber;
  v16 = [v7 metadataObject];
  v17 = [v16 identifiers];
  v18 = [v17 universalStore];
  v45 = objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v18, "adamID"));

  v19 = [v9 identifiers];
  v44 = [v19 vendorID];

  v20 = [v9 title];
  if ([v20 length] && objc_msgSend(v9, "isExplicitSong"))
  {
    v21 = [v7 explicitBadge];
    v22 = v21;
    if (!v21)
    {
      v22 = +[MRUStringsProvider explicitBadge];
    }
    uint64_t v23 = [v20 stringByAppendingFormat:@" %@", v22];

    if (!v21) {
    v20 = (void *)v23;
    }
  }
  if ([v9 shouldShowComposer]
    && ([v9 composer],
        v24 = objc_claimAutoreleasedReturnValue(),
        [v24 name],
        v25 = objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v25))
  {
    v26 = [v9 composer];
    v27 = [v26 name];
    v37 = +[MRUStringsProvider composedBy:v27];
  }
  else
  {
    v37 = 0;
  }
  v49 = v13;
  v42 = v5;
  v43 = v20;
  char v28 = [v5 state] == 2 || objc_msgSend(v5, "state") == 5;
  char v29 = (v7 == 0) & ~v28;
  v38 = [v7 contentItemIdentifier];
  v39 = [v9 artist];
  v30 = [v39 name];
  v31 = [v9 album];
  v32 = [v31 title];
  [v14 name];
  v33 = v41 = v7;
  [v14 attributionLabel];
  v34 = v40 = v14;
  BYTE1(v36) = v28;
  LOBYTE(v36) = v29;
  v47 = -[MRUNowPlayingInfo initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:](self, "initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:", v38, v43, v30, v32, v33, v37, v34, v48, v36, v45, v44);

  return v47;
}

- (MRUNowPlayingInfo)initWithMRResponse:(id)a3 placeholder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 playbackQueue];
  v9 = [v8 contentItems];
  v10 = [v9 firstObject];

  v11 = [v10 metadata];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "iTunesStoreIdentifier"));
  uint64_t v13 = [v11 internationalStandardRecordingCode];
  v14 = [v11 title];
  if ([v14 length] && objc_msgSend(v11, "isExplicitItem"))
  {
    v15 = +[MRUStringsProvider explicitBadge];
    uint64_t v16 = [v14 stringByAppendingFormat:@" %@", v15];

    v14 = (void *)v16;
  }
  char v29 = self;
  v31 = v7;
  v27 = (void *)v13;
  char v28 = (void *)v12;
  BOOL v17 = [v6 playbackState] == 1 || objc_msgSend(v6, "playbackState") == 5;
  if (v11) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = !v17;
  }
  v19 = [v10 identifier];
  v20 = [v11 trackArtistName];
  v21 = [v11 albumName];
  [v11 radioStationName];
  v22 = v26 = v10;
  uint64_t v23 = [v11 composer];
  BYTE1(v25) = v17;
  LOBYTE(v25) = v18;
  v30 = -[MRUNowPlayingInfo initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:](v29, "initWithIdentifier:title:artist:album:radio:composer:attribution:placeholder:showPlaceholder:isPlaying:adamID:internationalStandardRecordingCode:", v19, v14, v20, v21, v22, v23, 0, v31, v25, v28, v27);

  return v30;
}

- (MRUNowPlayingInfo)initWithIdentifier:(id)a3 title:(id)a4 artist:(id)a5 album:(id)a6 radio:(id)a7 composer:(id)a8 attribution:(id)a9 placeholder:(id)a10 showPlaceholder:(BOOL)a11 isPlaying:(BOOL)a12 adamID:(id)a13 internationalStandardRecordingCode:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v47 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a13;
  id v27 = a14;
  v48.receiver = self;
  v48.super_class = (Class)MRUNowPlayingInfo;
  char v28 = [(MRUNowPlayingInfo *)&v48 init];
  if (v28)
  {
    uint64_t v29 = [v19 copy];
    identifier = v28->_identifier;
    v28->_identifier = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    title = v28->_title;
    v28->_title = (NSString *)v31;

    uint64_t v33 = [v47 copy];
    artist = v28->_artist;
    v28->_artist = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    album = v28->_album;
    v28->_album = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    radio = v28->_radio;
    v28->_radio = (NSString *)v37;

    uint64_t v39 = [v23 copy];
    composer = v28->_composer;
    v28->_composer = (NSString *)v39;

    uint64_t v41 = [v24 copy];
    attribution = v28->_attribution;
    v28->_attribution = (NSString *)v41;

    uint64_t v43 = [v25 copy];
    placeholder = v28->_placeholder;
    v28->_placeholder = (NSString *)v43;

    v28->_showPlaceholder = a11;
    v28->_isPlaying = a12;
    objc_storeStrong((id *)&v28->_adamID, a13);
    objc_storeStrong((id *)&v28->_internationalStandardRecordingCode, a14);
  }

  return v28;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = @"Yes";
  if (self->_showPlaceholder) {
    id v6 = @"Yes";
  }
  else {
    id v6 = @"No";
  }
  if (!self->_isPlaying) {
    id v5 = @"No";
  }
  return (id)[v3 stringWithFormat:@"%@ title: %@ | artist: %@ | album: %@ | radio: %@ | composer: %@ | placeholder: %@ - %@ | playing: %@ | adamID: %@ | ISRC: %@", v4, *(_OWORD *)&self->_title, *(_OWORD *)&self->_album, self->_composer, self->_placeholder, v6, v5, self->_adamID, self->_internationalStandardRecordingCode];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRUNowPlayingInfo *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(MRUNowPlayingInfo *)v5 identifier];
      id v7 = v6;
      if (v6 == self->_identifier) {
        char v8 = 1;
      }
      else {
        char v8 = -[NSString isEqual:](v6, "isEqual:");
      }

      v10 = [(MRUNowPlayingInfo *)v5 title];
      v11 = v10;
      if (v10 == self->_title) {
        char v12 = 1;
      }
      else {
        char v12 = -[NSString isEqual:](v10, "isEqual:");
      }
      char v13 = v8 & v12;

      v14 = [(MRUNowPlayingInfo *)v5 artist];
      v15 = v14;
      if (v14 == self->_artist) {
        char v16 = 1;
      }
      else {
        char v16 = -[NSString isEqual:](v14, "isEqual:");
      }
      char v17 = v13 & v16;

      BOOL v18 = [(MRUNowPlayingInfo *)v5 album];
      id v19 = v18;
      if (v18 == self->_album) {
        char v20 = 1;
      }
      else {
        char v20 = -[NSString isEqual:](v18, "isEqual:");
      }
      char v21 = v17 & v20;

      id v22 = [(MRUNowPlayingInfo *)v5 radio];
      id v23 = v22;
      if (v22 == self->_radio) {
        char v24 = 1;
      }
      else {
        char v24 = -[NSString isEqual:](v22, "isEqual:");
      }
      char v25 = v21 & v24;

      id v26 = [(MRUNowPlayingInfo *)v5 composer];
      id v27 = v26;
      if (v26 == self->_composer) {
        char v28 = 1;
      }
      else {
        char v28 = -[NSString isEqual:](v26, "isEqual:");
      }
      char v29 = v25 & v28;

      v30 = [(MRUNowPlayingInfo *)v5 attribution];
      uint64_t v31 = v30;
      if (v30 == self->_attribution) {
        char v32 = 1;
      }
      else {
        char v32 = -[NSString isEqual:](v30, "isEqual:");
      }
      char v33 = v29 & v32;

      v34 = [(MRUNowPlayingInfo *)v5 placeholder];
      uint64_t v35 = v34;
      if (v34 == self->_placeholder) {
        char v36 = 1;
      }
      else {
        char v36 = -[NSString isEqual:](v34, "isEqual:");
      }
      char v37 = v33 & v36;

      if (self->_showPlaceholder == [(MRUNowPlayingInfo *)v5 showPlaceholder]) {
        char v38 = v37;
      }
      else {
        char v38 = 0;
      }
      if (self->_isPlaying == [(MRUNowPlayingInfo *)v5 isPlaying]) {
        char v39 = v38;
      }
      else {
        char v39 = 0;
      }
      v40 = [(MRUNowPlayingInfo *)v5 internationalStandardRecordingCode];
      uint64_t v41 = v40;
      if (v40 == self->_internationalStandardRecordingCode) {
        char v42 = 1;
      }
      else {
        char v42 = -[NSString isEqual:](v40, "isEqual:");
      }
      char v43 = v39 & v42;

      v44 = [(MRUNowPlayingInfo *)v5 adamID];
      v45 = v44;
      if (v44 == self->_adamID) {
        char v46 = 1;
      }
      else {
        char v46 = -[NSNumber isEqual:](v44, "isEqual:");
      }
      char v9 = v43 & v46;
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)stringForComponents:(unint64_t)a3
{
  return [(MRUNowPlayingInfo *)self stringForComponents:a3 separator:@" — "];
}

- (id)stringForComponents:(unint64_t)a3 separator:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ((v4 & 1) != 0 && [(NSString *)self->_title length]) {
    [v7 addObject:self->_title];
  }
  if ((v4 & 2) != 0 && [(NSString *)self->_artist length]) {
    [v7 addObject:self->_artist];
  }
  if ((v4 & 4) != 0 && [(NSString *)self->_album length]) {
    [v7 addObject:self->_album];
  }
  if ((v4 & 8) == 0 || ![(NSString *)self->_radio length])
  {
LABEL_16:
    if ((v4 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if ((~v4 & 0x3ALL) != 0)
  {
LABEL_15:
    [v7 addObject:self->_radio];
    goto LABEL_16;
  }
  title = self->_title;
  char v9 = self->_radio;
  if (title != v9)
  {
    v10 = v9;
    v11 = title;
    char v12 = [(NSString *)v11 isEqual:v10];

    if (v12) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  if ((v4 & 0x10) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  if ([(NSString *)self->_composer length]) {
    [v7 addObject:self->_composer];
  }
LABEL_19:
  if ((v4 & 0x20) != 0 && [(NSString *)self->_attribution length]) {
    [v7 addObject:self->_attribution];
  }
  if ((v4 & 0x40) != 0) {
    [v7 firstObject];
  }
  else {
  char v13 = [v7 componentsJoinedByString:v6];
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSString)internationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)radio
{
  return self->_radio;
}

- (void)setRadio:(id)a3
{
}

- (NSString)composer
{
  return self->_composer;
}

- (void)setComposer:(id)a3
{
}

- (NSString)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_radio, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_internationalStandardRecordingCode, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end