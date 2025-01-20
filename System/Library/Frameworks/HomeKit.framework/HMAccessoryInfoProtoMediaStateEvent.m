@interface HMAccessoryInfoProtoMediaStateEvent
- (BOOL)hasMediaIdentifier;
- (BOOL)hasPlaybackState;
- (BOOL)hasRepeatState;
- (BOOL)hasShuffleState;
- (BOOL)hasVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)mediaIdentifier;
- (double)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)playbackState;
- (int64_t)repeatState;
- (int64_t)shuffleState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPlaybackState:(BOOL)a3;
- (void)setHasRepeatState:(BOOL)a3;
- (void)setHasShuffleState:(BOOL)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setMediaIdentifier:(id)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setRepeatState:(int64_t)a3;
- (void)setShuffleState:(int64_t)a3;
- (void)setVolume:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoMediaStateEvent

- (void).cxx_destruct
{
}

- (void)setMediaIdentifier:(id)a3
{
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (double)volume
{
  return self->_volume;
}

- (int64_t)repeatState
{
  return self->_repeatState;
}

- (int64_t)shuffleState
{
  return self->_shuffleState;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_playbackState = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_shuffleState = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  self->_repeatState = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_5:
    self->_volume = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((void *)v4 + 5))
  {
    id v6 = v4;
    -[HMAccessoryInfoProtoMediaStateEvent setMediaIdentifier:](self, "setMediaIdentifier:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_playbackState;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_shuffleState;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v10 ^ [(NSString *)self->_mediaIdentifier hash];
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_repeatState;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double volume = self->_volume;
  double v7 = -volume;
  if (volume >= 0.0) {
    double v7 = self->_volume;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ [(NSString *)self->_mediaIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_playbackState != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_shuffleState != *((void *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_repeatState != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_volume != *((double *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  mediaIdentifier = self->_mediaIdentifier;
  if ((unint64_t)mediaIdentifier | *((void *)v4 + 5)) {
    char v6 = -[NSString isEqual:](mediaIdentifier, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_playbackState;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 16) = self->_repeatState;
      *(unsigned char *)(v5 + 48) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_shuffleState;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(double *)(v5 + 32) = self->_volume;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_mediaIdentifier copyWithZone:a3];
  double v9 = (void *)v6[5];
  v6[5] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_playbackState;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_shuffleState;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v4[2] = self->_repeatState;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v4[4] = *(void *)&self->_volume;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_6:
  if (self->_mediaIdentifier)
  {
    char v6 = v4;
    objc_msgSend(v4, "setMediaIdentifier:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_6:
  if (self->_mediaIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoMediaStateEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = [NSNumber numberWithLongLong:self->_playbackState];
    [v3 setObject:v8 forKey:@"playbackState"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  double v9 = [NSNumber numberWithLongLong:self->_shuffleState];
  [v3 setObject:v9 forKey:@"shuffleState"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  unint64_t v10 = [NSNumber numberWithLongLong:self->_repeatState];
  [v3 setObject:v10 forKey:@"repeatState"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = [NSNumber numberWithDouble:self->_volume];
    [v3 setObject:v5 forKey:@"volume"];
  }
LABEL_6:
  mediaIdentifier = self->_mediaIdentifier;
  if (mediaIdentifier) {
    [v3 setObject:mediaIdentifier forKey:@"mediaIdentifier"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoMediaStateEvent;
  id v4 = [(HMAccessoryInfoProtoMediaStateEvent *)&v8 description];
  uint64_t v5 = [(HMAccessoryInfoProtoMediaStateEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMediaIdentifier
{
  return self->_mediaIdentifier != 0;
}

- (BOOL)hasVolume
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasVolume:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setVolume:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double volume = a3;
}

- (BOOL)hasRepeatState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRepeatState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRepeatState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_repeatState = a3;
}

- (BOOL)hasShuffleState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasShuffleState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setShuffleState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_shuffleState = a3;
}

- (BOOL)hasPlaybackState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPlaybackState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playbackState = a3;
}

@end