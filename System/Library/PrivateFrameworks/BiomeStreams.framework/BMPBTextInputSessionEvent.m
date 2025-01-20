@interface BMPBTextInputSessionEvent
- (BOOL)hasBundleID;
- (BOOL)hasDuration;
- (BOOL)hasSessionID;
- (BOOL)hasSessionType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (NSString)sessionID;
- (double)duration;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sessionTypeAsString:(int)a3;
- (int)StringAsSessionType:(id)a3;
- (int)sessionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasSessionType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionType:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBTextInputSessionEvent

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

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (int)sessionType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_sessionType;
  }
  else {
    return 0;
  }
}

- (void)setSessionType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)sessionTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D6990[a3];
  }

  return v3;
}

- (int)StringAsSessionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Keyboard"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ThirdPartyKeyboard"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Pencil"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Dictation"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBTextInputSessionEvent;
  int v4 = [(BMPBTextInputSessionEvent *)&v8 description];
  v5 = [(BMPBTextInputSessionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v5 forKey:@"duration"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v6 forKey:@"timestamp"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t sessionType = self->_sessionType;
    if (sessionType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sessionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E55D6990[sessionType];
    }
    [v3 setObject:v9 forKey:@"sessionType"];
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBTextInputSessionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_duration;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  id v6 = v4;
  if (self->_bundleID)
  {
    objc_msgSend(v4, "setBundleID:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_sessionType;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  if (self->_sessionID)
  {
    objc_msgSend(v6, "setSessionID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_sessionType;
    *(unsigned char *)(v6 + 44) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_sessionID copyWithZone:a3];
  v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_22;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
    {
LABEL_22:
      char v8 = 0;
      goto LABEL_23;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_sessionType != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](sessionID, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double duration = self->_duration;
    double v6 = -duration;
    if (duration >= 0.0) {
      double v6 = self->_duration;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v11 = -timestamp;
    if (timestamp >= 0.0) {
      double v11 = self->_timestamp;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_bundleID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_sessionType;
  }
  else {
    uint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v15 ^ v14 ^ [(NSString *)self->_sessionID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_double duration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_double timestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[BMPBTextInputSessionEvent setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    self->_uint64_t sessionType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBTextInputSessionEvent setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }
}

- (double)duration
{
  return self->_duration;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end