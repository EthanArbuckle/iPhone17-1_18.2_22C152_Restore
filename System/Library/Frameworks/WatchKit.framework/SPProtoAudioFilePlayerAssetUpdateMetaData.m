@interface SPProtoAudioFilePlayerAssetUpdateMetaData
- (BOOL)hasAlbumTitle;
- (BOOL)hasArtist;
- (BOOL)hasDuration;
- (BOOL)hasSandboxExtensionToken;
- (BOOL)hasTitle;
- (BOOL)hasURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)albumTitle;
- (NSString)artist;
- (NSString)identifier;
- (NSString)sandboxExtensionToken;
- (NSString)title;
- (NSString)uRL;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sockPuppetMessage;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setArtist:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFilePlayerAssetUpdateMetaData

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasAlbumTitle
{
  return self->_albumTitle != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasSandboxExtensionToken
{
  return self->_sandboxExtensionToken != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFilePlayerAssetUpdateMetaData;
  v4 = [(SPProtoAudioFilePlayerAssetUpdateMetaData *)&v8 description];
  v5 = [(SPProtoAudioFilePlayerAssetUpdateMetaData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  uRL = self->_uRL;
  if (uRL) {
    [v4 setObject:uRL forKey:@"URL"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_duration];
    [v4 setObject:v7 forKey:@"duration"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  albumTitle = self->_albumTitle;
  if (albumTitle) {
    [v4 setObject:albumTitle forKey:@"albumTitle"];
  }
  artist = self->_artist;
  if (artist) {
    [v4 setObject:artist forKey:@"artist"];
  }
  sandboxExtensionToken = self->_sandboxExtensionToken;
  if (sandboxExtensionToken) {
    [v4 setObject:sandboxExtensionToken forKey:@"sandboxExtensionToken"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerAssetUpdateMetaDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteStringField();
  if (self->_uRL) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  v4 = v5;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_albumTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_artist)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sandboxExtensionToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setIdentifier:self->_identifier];
  if (self->_uRL) {
    objc_msgSend(v5, "setURL:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v5 + 1) = *(void *)&self->_duration;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_albumTitle)
  {
    objc_msgSend(v5, "setAlbumTitle:");
    v4 = v5;
  }
  if (self->_artist)
  {
    objc_msgSend(v5, "setArtist:");
    v4 = v5;
  }
  if (self->_sandboxExtensionToken)
  {
    objc_msgSend(v5, "setSandboxExtensionToken:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_uRL copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_title copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_albumTitle copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_artist copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = [(NSString *)self->_sandboxExtensionToken copyWithZone:a3];
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_19;
  }
  albumTitle = self->_albumTitle;
  if ((unint64_t)albumTitle | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](albumTitle, "isEqual:")) {
      goto LABEL_19;
    }
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](artist, "isEqual:")) {
      goto LABEL_19;
    }
  }
  sandboxExtensionToken = self->_sandboxExtensionToken;
  if ((unint64_t)sandboxExtensionToken | *((void *)v4 + 5)) {
    char v11 = -[NSString isEqual:](sandboxExtensionToken, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_uRL hash];
  if (*(unsigned char *)&self->_has)
  {
    double duration = self->_duration;
    double v7 = -duration;
    if (duration >= 0.0) {
      double v7 = self->_duration;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_title hash];
  NSUInteger v11 = [(NSString *)self->_albumTitle hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_artist hash];
  return v10 ^ v12 ^ [(NSString *)self->_sandboxExtensionToken hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setURL:](self, "setURL:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[8])
  {
    self->_double duration = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setTitle:](self, "setTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setAlbumTitle:](self, "setAlbumTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setArtist:](self, "setArtist:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData setSandboxExtensionToken:](self, "setSandboxExtensionToken:");
    NSUInteger v4 = v5;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_albumTitle, 0);
}

- (id)sockPuppetMessage
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFilePlayerAsset);
  [(SPProtoAudioFilePlayerAsset *)v3 setUpsertWithMetaData:self];
  NSUInteger v4 = [(SPProtoAudioFilePlayerAsset *)v3 sockPuppetMessage];

  return v4;
}

@end