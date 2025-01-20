@interface BMPBNowPlayingEvent
+ (Class)outputDevicesType;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasAlbum;
- (BOOL)hasArtist;
- (BOOL)hasBundleId;
- (BOOL)hasDuration;
- (BOOL)hasElapsed;
- (BOOL)hasGenre;
- (BOOL)hasGroupIdentifier;
- (BOOL)hasITunesAlbumIdentifier;
- (BOOL)hasITunesArtistIdentifier;
- (BOOL)hasITunesStoreIdentifier;
- (BOOL)hasITunesSubscriptionIdentifier;
- (BOOL)hasIsAirPlayVideo;
- (BOOL)hasIsRemoteControl;
- (BOOL)hasItemMediaSubtype;
- (BOOL)hasItemMediaType;
- (BOOL)hasMediaType;
- (BOOL)hasPlaybackState;
- (BOOL)hasTitle;
- (BOOL)hasUniqueId;
- (BOOL)isAirPlayVideo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoteControl;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)outputDevices;
- (NSString)album;
- (NSString)artist;
- (NSString)bundleId;
- (NSString)genre;
- (NSString)groupIdentifier;
- (NSString)iTunesAlbumIdentifier;
- (NSString)iTunesArtistIdentifier;
- (NSString)iTunesStoreIdentifier;
- (NSString)iTunesSubscriptionIdentifier;
- (NSString)mediaType;
- (NSString)title;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemMediaSubtypeAsString:(int)a3;
- (id)itemMediaTypeAsString:(int)a3;
- (id)outputDevicesAtIndex:(unint64_t)a3;
- (id)playbackStateAsString:(int)a3;
- (int)StringAsItemMediaSubtype:(id)a3;
- (int)StringAsItemMediaType:(id)a3;
- (int)StringAsPlaybackState:(id)a3;
- (int)itemMediaSubtype;
- (int)itemMediaType;
- (int)playbackState;
- (unint64_t)hash;
- (unint64_t)outputDevicesCount;
- (unsigned)duration;
- (unsigned)elapsed;
- (void)addOutputDevices:(id)a3;
- (void)clearOutputDevices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setElapsed:(unsigned int)a3;
- (void)setGenre:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasElapsed:(BOOL)a3;
- (void)setHasIsAirPlayVideo:(BOOL)a3;
- (void)setHasIsRemoteControl:(BOOL)a3;
- (void)setHasItemMediaSubtype:(BOOL)a3;
- (void)setHasItemMediaType:(BOOL)a3;
- (void)setHasPlaybackState:(BOOL)a3;
- (void)setITunesAlbumIdentifier:(id)a3;
- (void)setITunesArtistIdentifier:(id)a3;
- (void)setITunesStoreIdentifier:(id)a3;
- (void)setITunesSubscriptionIdentifier:(id)a3;
- (void)setIsAirPlayVideo:(BOOL)a3;
- (void)setIsRemoteControl:(BOOL)a3;
- (void)setItemMediaSubtype:(int)a3;
- (void)setItemMediaType:(int)a3;
- (void)setMediaType:(id)a3;
- (void)setOutputDevices:(id)a3;
- (void)setPlaybackState:(int)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBNowPlayingEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)playbackState
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_playbackState;
  }
  else {
    return 0;
  }
}

- (void)setPlaybackState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPlaybackState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)playbackStateAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D71F8 + a3);
  }

  return v3;
}

- (int)StringAsPlaybackState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Playing"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Paused"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Stopped"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Interrupted"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Seeking"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setElapsed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_elapsed = a3;
}

- (void)setHasElapsed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasElapsed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasMediaType
{
  return self->_mediaType != 0;
}

- (BOOL)hasITunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier != 0;
}

- (BOOL)hasITunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier != 0;
}

- (void)setIsAirPlayVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isAirPlayVideo = a3;
}

- (void)setHasIsAirPlayVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsAirPlayVideo
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)clearOutputDevices
{
}

- (void)addOutputDevices:(id)a3
{
  id v4 = a3;
  outputDevices = self->_outputDevices;
  id v8 = v4;
  if (!outputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_outputDevices;
    self->_outputDevices = v6;

    id v4 = v8;
    outputDevices = self->_outputDevices;
  }
  [(NSMutableArray *)outputDevices addObject:v4];
}

- (unint64_t)outputDevicesCount
{
  return [(NSMutableArray *)self->_outputDevices count];
}

- (id)outputDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_outputDevices objectAtIndex:a3];
}

+ (Class)outputDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasITunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier != 0;
}

- (BOOL)hasITunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier != 0;
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (void)setIsRemoteControl:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isRemoteControl = a3;
}

- (void)setHasIsRemoteControl:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsRemoteControl
{
  return *(unsigned char *)&self->_has >> 7;
}

- (int)itemMediaType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_itemMediaType;
  }
  else {
    return 0;
  }
}

- (void)setItemMediaType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_itemMediaType = a3;
}

- (void)setHasItemMediaType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasItemMediaType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)itemMediaTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D7228 + a3);
  }

  return v3;
}

- (int)StringAsItemMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)itemMediaSubtype
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_itemMediaSubtype;
  }
  else {
    return 0;
  }
}

- (void)setItemMediaSubtype:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_itemMediaSubtype = a3;
}

- (void)setHasItemMediaSubtype:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasItemMediaSubtype
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)itemMediaSubtypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D7240 + a3);
  }

  return v3;
}

- (int)StringAsItemMediaSubtype:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Music"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TVShow"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Movie"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Podcast"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Audiobook"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ITunesU"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HomeMedia"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBNowPlayingEvent;
  int v4 = [(BMPBNowPlayingEvent *)&v8 description];
  v5 = [(BMPBNowPlayingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v7 forKey:@"absoluteTimestamp"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t playbackState = self->_playbackState;
    if (playbackState >= 6)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_playbackState);
    }
    else
    {
      v9 = *(&off_1E55D71F8 + playbackState);
    }
    [v4 setObject:v9 forKey:@"playbackState"];
  }
  album = self->_album;
  if (album) {
    [v4 setObject:album forKey:@"album"];
  }
  artist = self->_artist;
  if (artist) {
    [v4 setObject:artist forKey:@"artist"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_duration];
    [v4 setObject:v12 forKey:@"duration"];
  }
  genre = self->_genre;
  if (genre) {
    [v4 setObject:genre forKey:@"genre"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:self->_elapsed];
    [v4 setObject:v15 forKey:@"elapsed"];
  }
  mediaType = self->_mediaType;
  if (mediaType) {
    [v4 setObject:mediaType forKey:@"mediaType"];
  }
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  if (iTunesStoreIdentifier) {
    [v4 setObject:iTunesStoreIdentifier forKey:@"iTunesStoreIdentifier"];
  }
  iTunesSubscriptionIdentifier = self->_iTunesSubscriptionIdentifier;
  if (iTunesSubscriptionIdentifier) {
    [v4 setObject:iTunesSubscriptionIdentifier forKey:@"iTunesSubscriptionIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_isAirPlayVideo];
    [v4 setObject:v19 forKey:@"isAirPlayVideo"];
  }
  if ([(NSMutableArray *)self->_outputDevices count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_outputDevices, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v21 = self->_outputDevices;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"outputDevices"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v4 setObject:bundleId forKey:@"bundleId"];
  }
  iTunesArtistIdentifier = self->_iTunesArtistIdentifier;
  if (iTunesArtistIdentifier) {
    [v4 setObject:iTunesArtistIdentifier forKey:@"iTunesArtistIdentifier"];
  }
  iTunesAlbumIdentifier = self->_iTunesAlbumIdentifier;
  if (iTunesAlbumIdentifier) {
    [v4 setObject:iTunesAlbumIdentifier forKey:@"iTunesAlbumIdentifier"];
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier) {
    [v4 setObject:groupIdentifier forKey:@"groupIdentifier"];
  }
  $56AC58F426FB8D41CCD147728CED693B v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v31 & 0x10) == 0) {
      goto LABEL_49;
    }
LABEL_52:
    uint64_t itemMediaType = self->_itemMediaType;
    if (itemMediaType >= 3)
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_itemMediaType);
    }
    else
    {
      v34 = *(&off_1E55D7228 + itemMediaType);
    }
    [v4 setObject:v34 forKey:@"itemMediaType"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_60;
    }
    goto LABEL_56;
  }
  v32 = [NSNumber numberWithBool:self->_isRemoteControl];
  [v4 setObject:v32 forKey:@"isRemoteControl"];

  *(unsigned char *)&$56AC58F426FB8D41CCD147728CED693B v31 = self->_has;
  if ((*(unsigned char *)&v31 & 0x10) != 0) {
    goto LABEL_52;
  }
LABEL_49:
  if ((*(unsigned char *)&v31 & 8) != 0)
  {
LABEL_56:
    uint64_t itemMediaSubtype = self->_itemMediaSubtype;
    if (itemMediaSubtype >= 8)
    {
      v36 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_itemMediaSubtype);
    }
    else
    {
      v36 = *(&off_1E55D7240 + itemMediaSubtype);
    }
    [v4 setObject:v36 forKey:@"itemMediaSubtype"];
  }
LABEL_60:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNowPlayingEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_album) {
    PBDataWriterWriteStringField();
  }
  if (self->_artist) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_genre) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_mediaType) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesStoreIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesSubscriptionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_outputDevices;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesArtistIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesAlbumIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupIdentifier) {
    PBDataWriterWriteStringField();
  }
  $56AC58F426FB8D41CCD147728CED693B v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v11 & 0x10) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  PBDataWriterWriteBOOLField();
  *(unsigned char *)&$56AC58F426FB8D41CCD147728CED693B v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
LABEL_44:
    PBDataWriterWriteInt32Field();
    *(unsigned char *)&$56AC58F426FB8D41CCD147728CED693B v11 = self->_has;
  }
LABEL_45:
  if ((*(unsigned char *)&v11 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  long long v12 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v12;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    v4[148] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_playbackState;
    v4[148] |= 0x20u;
  }
  if (self->_album)
  {
    objc_msgSend(v12, "setAlbum:");
    id v4 = v12;
  }
  if (self->_artist)
  {
    objc_msgSend(v12, "setArtist:");
    id v4 = v12;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_duration;
    v4[148] |= 2u;
  }
  if (self->_genre)
  {
    objc_msgSend(v12, "setGenre:");
    id v4 = v12;
  }
  if (self->_title)
  {
    objc_msgSend(v12, "setTitle:");
    id v4 = v12;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_elapsed;
    v4[148] |= 4u;
  }
  if (self->_mediaType) {
    objc_msgSend(v12, "setMediaType:");
  }
  if (self->_iTunesStoreIdentifier) {
    objc_msgSend(v12, "setITunesStoreIdentifier:");
  }
  if (self->_iTunesSubscriptionIdentifier) {
    objc_msgSend(v12, "setITunesSubscriptionIdentifier:");
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v12[144] = self->_isAirPlayVideo;
    v12[148] |= 0x40u;
  }
  if ([(BMPBNowPlayingEvent *)self outputDevicesCount])
  {
    [v12 clearOutputDevices];
    unint64_t v6 = [(BMPBNowPlayingEvent *)self outputDevicesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(BMPBNowPlayingEvent *)self outputDevicesAtIndex:i];
        [v12 addOutputDevices:v9];
      }
    }
  }
  if (self->_bundleId) {
    objc_msgSend(v12, "setBundleId:");
  }
  v10 = v12;
  if (self->_iTunesArtistIdentifier)
  {
    objc_msgSend(v12, "setITunesArtistIdentifier:");
    v10 = v12;
  }
  if (self->_iTunesAlbumIdentifier)
  {
    objc_msgSend(v12, "setITunesAlbumIdentifier:");
    v10 = v12;
  }
  if (self->_groupIdentifier)
  {
    objc_msgSend(v12, "setGroupIdentifier:");
    v10 = v12;
  }
  $56AC58F426FB8D41CCD147728CED693B v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v11 & 0x10) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  v10[145] = self->_isRemoteControl;
  v10[148] |= 0x80u;
  *(unsigned char *)&$56AC58F426FB8D41CCD147728CED693B v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
LABEL_41:
    *((_DWORD *)v10 + 25) = self->_itemMediaType;
    v10[148] |= 0x10u;
    *(unsigned char *)&$56AC58F426FB8D41CCD147728CED693B v11 = self->_has;
  }
LABEL_42:
  if ((*(unsigned char *)&v11 & 8) != 0)
  {
    *((_DWORD *)v10 + 24) = self->_itemMediaSubtype;
    v10[148] |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 148) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_playbackState;
    *(unsigned char *)(v5 + 148) |= 0x20u;
  }
  uint64_t v9 = [(NSString *)self->_album copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_artist copyWithZone:a3];
  long long v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_duration;
    *(unsigned char *)(v5 + 148) |= 2u;
  }
  uint64_t v13 = [(NSString *)self->_genre copyWithZone:a3];
  long long v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_title copyWithZone:a3];
  v16 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v15;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_elapsed;
    *(unsigned char *)(v5 + 148) |= 4u;
  }
  uint64_t v17 = [(NSString *)self->_mediaType copyWithZone:a3];
  v18 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v17;

  uint64_t v19 = [(NSString *)self->_iTunesStoreIdentifier copyWithZone:a3];
  v20 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v19;

  uint64_t v21 = [(NSString *)self->_iTunesSubscriptionIdentifier copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v21;

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 144) = self->_isAirPlayVideo;
    *(unsigned char *)(v5 + 148) |= 0x40u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v23 = self->_outputDevices;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "copyWithZone:", a3, (void)v39);
        [(id)v5 addOutputDevices:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v25);
  }

  uint64_t v29 = [(NSString *)self->_bundleId copyWithZone:a3];
  v30 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v29;

  uint64_t v31 = [(NSString *)self->_iTunesArtistIdentifier copyWithZone:a3];
  v32 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v31;

  uint64_t v33 = [(NSString *)self->_iTunesAlbumIdentifier copyWithZone:a3];
  v34 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v33;

  uint64_t v35 = [(NSString *)self->_groupIdentifier copyWithZone:a3];
  v36 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v35;

  $56AC58F426FB8D41CCD147728CED693B v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v37 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  *(unsigned char *)(v5 + 145) = self->_isRemoteControl;
  *(unsigned char *)(v5 + 148) |= 0x80u;
  *(unsigned char *)&$56AC58F426FB8D41CCD147728CED693B v37 = self->_has;
  if ((*(unsigned char *)&v37 & 0x10) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 100) = self->_itemMediaType;
    *(unsigned char *)(v5 + 148) |= 0x10u;
    *(unsigned char *)&$56AC58F426FB8D41CCD147728CED693B v37 = self->_has;
  }
LABEL_21:
  if ((*(unsigned char *)&v37 & 8) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_itemMediaSubtype;
    *(unsigned char *)(v5 + 148) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_73;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 148) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_73;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x20) == 0 || self->_playbackState != *((_DWORD *)v4 + 30)) {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 0x20) != 0)
  {
    goto LABEL_73;
  }
  album = self->_album;
  if ((unint64_t)album | *((void *)v4 + 2) && !-[NSString isEqual:](album, "isEqual:")) {
    goto LABEL_73;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](artist, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 10)) {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 2) != 0)
  {
    goto LABEL_73;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((void *)v4 + 6) && !-[NSString isEqual:](genre, "isEqual:")) {
    goto LABEL_73;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 4) == 0 || self->_elapsed != *((_DWORD *)v4 + 11)) {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 4) != 0)
  {
    goto LABEL_73;
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((void *)v4 + 13) && !-[NSString isEqual:](mediaType, "isEqual:")) {
    goto LABEL_73;
  }
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  if ((unint64_t)iTunesStoreIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](iTunesStoreIdentifier, "isEqual:")) {
      goto LABEL_73;
    }
  }
  iTunesSubscriptionIdentifier = self->_iTunesSubscriptionIdentifier;
  if ((unint64_t)iTunesSubscriptionIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](iTunesSubscriptionIdentifier, "isEqual:")) {
      goto LABEL_73;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x40) == 0) {
      goto LABEL_73;
    }
    if (self->_isAirPlayVideo)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 0x40) != 0)
  {
    goto LABEL_73;
  }
  outputDevices = self->_outputDevices;
  if ((unint64_t)outputDevices | *((void *)v4 + 14)
    && !-[NSMutableArray isEqual:](outputDevices, "isEqual:"))
  {
    goto LABEL_73;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_73;
    }
  }
  iTunesArtistIdentifier = self->_iTunesArtistIdentifier;
  if ((unint64_t)iTunesArtistIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](iTunesArtistIdentifier, "isEqual:")) {
      goto LABEL_73;
    }
  }
  iTunesAlbumIdentifier = self->_iTunesAlbumIdentifier;
  if ((unint64_t)iTunesAlbumIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](iTunesAlbumIdentifier, "isEqual:")) {
      goto LABEL_73;
    }
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:")) {
      goto LABEL_73;
    }
  }
  $56AC58F426FB8D41CCD147728CED693B has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x80) == 0) {
      goto LABEL_58;
    }
LABEL_73:
    BOOL v19 = 0;
    goto LABEL_74;
  }
  if ((*((unsigned char *)v4 + 148) & 0x80) == 0) {
    goto LABEL_73;
  }
  if (self->_isRemoteControl)
  {
    if (!*((unsigned char *)v4 + 145)) {
      goto LABEL_73;
    }
  }
  else if (*((unsigned char *)v4 + 145))
  {
    goto LABEL_73;
  }
LABEL_58:
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x10) == 0 || self->_itemMediaType != *((_DWORD *)v4 + 25)) {
      goto LABEL_73;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 0x10) != 0)
  {
    goto LABEL_73;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 8) == 0 || self->_itemMediaSubtype != *((_DWORD *)v4 + 24)) {
      goto LABEL_73;
    }
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = (*((unsigned char *)v4 + 148) & 8) == 0;
  }
LABEL_74:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v30 = [(NSString *)self->_uniqueId hash];
  char has = (char)self->_has;
  if (has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v8 += (unint64_t)v7;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
    unint64_t v29 = v8;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v29 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v28 = 2654435761 * self->_playbackState;
      goto LABEL_12;
    }
  }
  uint64_t v28 = 0;
LABEL_12:
  NSUInteger v27 = [(NSString *)self->_album hash];
  NSUInteger v26 = [(NSString *)self->_artist hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v25 = 2654435761 * self->_duration;
  }
  else {
    uint64_t v25 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_genre hash];
  NSUInteger v23 = [(NSString *)self->_title hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v22 = 2654435761 * self->_elapsed;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_mediaType hash];
  NSUInteger v9 = [(NSString *)self->_iTunesStoreIdentifier hash];
  NSUInteger v10 = [(NSString *)self->_iTunesSubscriptionIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v11 = 2654435761 * self->_isAirPlayVideo;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [(NSMutableArray *)self->_outputDevices hash];
  NSUInteger v13 = [(NSString *)self->_bundleId hash];
  NSUInteger v14 = [(NSString *)self->_iTunesArtistIdentifier hash];
  NSUInteger v15 = [(NSString *)self->_iTunesAlbumIdentifier hash];
  NSUInteger v16 = [(NSString *)self->_groupIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v18 = 2654435761 * self->_itemMediaType;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_24;
    }
LABEL_27:
    uint64_t v19 = 0;
    return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  uint64_t v17 = 2654435761 * self->_isRemoteControl;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v19 = 2654435761 * self->_itemMediaSubtype;
  return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (*((void *)v4 + 17)) {
    -[BMPBNowPlayingEvent setUniqueId:](self, "setUniqueId:");
  }
  char v5 = v4[148];
  if (v5)
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = v4[148];
  }
  if ((v5 & 0x20) != 0)
  {
    self->_uint64_t playbackState = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 2)) {
    -[BMPBNowPlayingEvent setAlbum:](self, "setAlbum:");
  }
  if (*((void *)v4 + 3)) {
    -[BMPBNowPlayingEvent setArtist:](self, "setArtist:");
  }
  if ((v4[148] & 2) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 6)) {
    -[BMPBNowPlayingEvent setGenre:](self, "setGenre:");
  }
  if (*((void *)v4 + 16)) {
    -[BMPBNowPlayingEvent setTitle:](self, "setTitle:");
  }
  if ((v4[148] & 4) != 0)
  {
    self->_elapsed = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 13)) {
    -[BMPBNowPlayingEvent setMediaType:](self, "setMediaType:");
  }
  if (*((void *)v4 + 10)) {
    -[BMPBNowPlayingEvent setITunesStoreIdentifier:](self, "setITunesStoreIdentifier:");
  }
  if (*((void *)v4 + 11)) {
    -[BMPBNowPlayingEvent setITunesSubscriptionIdentifier:](self, "setITunesSubscriptionIdentifier:");
  }
  if ((v4[148] & 0x40) != 0)
  {
    self->_isAirPlayVideo = v4[144];
    *(unsigned char *)&self->_has |= 0x40u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 14);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BMPBNowPlayingEvent addOutputDevices:](self, "addOutputDevices:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 4)) {
    -[BMPBNowPlayingEvent setBundleId:](self, "setBundleId:");
  }
  if (*((void *)v4 + 9)) {
    -[BMPBNowPlayingEvent setITunesArtistIdentifier:](self, "setITunesArtistIdentifier:");
  }
  if (*((void *)v4 + 8)) {
    -[BMPBNowPlayingEvent setITunesAlbumIdentifier:](self, "setITunesAlbumIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[BMPBNowPlayingEvent setGroupIdentifier:](self, "setGroupIdentifier:");
  }
  int v11 = v4[148];
  if ((v11 & 0x80000000) == 0)
  {
    if ((v11 & 0x10) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  self->_isRemoteControl = v4[145];
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v11) = v4[148];
  if ((v11 & 0x10) != 0)
  {
LABEL_44:
    self->_uint64_t itemMediaType = *((_DWORD *)v4 + 25);
    *(unsigned char *)&self->_has |= 0x10u;
    LOBYTE(v11) = v4[148];
  }
LABEL_45:
  if ((v11 & 8) != 0)
  {
    self->_uint64_t itemMediaSubtype = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unsigned)elapsed
{
  return self->_elapsed;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void)setITunesStoreIdentifier:(id)a3
{
}

- (NSString)iTunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier;
}

- (void)setITunesSubscriptionIdentifier:(id)a3
{
}

- (BOOL)isAirPlayVideo
{
  return self->_isAirPlayVideo;
}

- (NSMutableArray)outputDevices
{
  return self->_outputDevices;
}

- (void)setOutputDevices:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)iTunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier;
}

- (void)setITunesArtistIdentifier:(id)a3
{
}

- (NSString)iTunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier;
}

- (void)setITunesAlbumIdentifier:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_iTunesSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesArtistIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesAlbumIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

@end