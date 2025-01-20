@interface ETPVideo
- (BOOL)hasIntroMessageData;
- (BOOL)hasMediaType;
- (BOOL)hasPlayingMessagesData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)introMessageData;
- (NSData)playingMessagesData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mediaTypeAsString:(int)a3;
- (int)StringAsMediaType:(id)a3;
- (int)mediaType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setIntroMessageData:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setPlayingMessagesData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ETPVideo

- (BOOL)hasIntroMessageData
{
  return self->_introMessageData != 0;
}

- (BOOL)hasPlayingMessagesData
{
  return self->_playingMessagesData != 0;
}

- (int)mediaType
{
  if (*(unsigned char *)&self->_has) {
    return self->_mediaType;
  }
  else {
    return 1;
  }
}

- (void)setMediaType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMediaType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"Video";
  }
  else if (a3 == 2)
  {
    v4 = @"Photo";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsMediaType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Video"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Photo"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ETPVideo;
  int v4 = [(ETPVideo *)&v8 description];
  v5 = [(ETPVideo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  introMessageData = self->_introMessageData;
  if (introMessageData) {
    [v3 setObject:introMessageData forKey:@"introMessageData"];
  }
  playingMessagesData = self->_playingMessagesData;
  if (playingMessagesData) {
    [v4 setObject:playingMessagesData forKey:@"playingMessagesData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int mediaType = self->_mediaType;
    if (mediaType == 1)
    {
      objc_super v8 = @"Video";
    }
    else if (mediaType == 2)
    {
      objc_super v8 = @"Photo";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v8 forKey:@"mediaType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ETPVideoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_introMessageData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_playingMessagesData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_introMessageData copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSData *)self->_playingMessagesData copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_mediaType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  introMessageData = self->_introMessageData;
  if ((unint64_t)introMessageData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](introMessageData, "isEqual:")) {
      goto LABEL_10;
    }
  }
  playingMessagesData = self->_playingMessagesData;
  if ((unint64_t)playingMessagesData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](playingMessagesData, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_mediaType == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_introMessageData hash];
  uint64_t v4 = [(NSData *)self->_playingMessagesData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ETPVideo setIntroMessageData:](self, "setIntroMessageData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ETPVideo setPlayingMessagesData:](self, "setPlayingMessagesData:");
    uint64_t v4 = v5;
  }
  if (v4[8])
  {
    self->_int mediaType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)introMessageData
{
  return self->_introMessageData;
}

- (void)setIntroMessageData:(id)a3
{
}

- (NSData)playingMessagesData
{
  return self->_playingMessagesData;
}

- (void)setPlayingMessagesData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingMessagesData, 0);

  objc_storeStrong((id *)&self->_introMessageData, 0);
}

@end