@interface AWDProactiveActionData
- (AWDProactiveAppPredictionSubscores)subscores;
- (BOOL)engagedAction;
- (BOOL)futureMedia;
- (BOOL)hasActionKey;
- (BOOL)hasCacheRank;
- (BOOL)hasEngaged;
- (BOOL)hasEngagedAction;
- (BOOL)hasFutureMedia;
- (BOOL)hasHeuristicName;
- (BOOL)hasScore;
- (BOOL)hasSessionId;
- (BOOL)hasShown;
- (BOOL)hasSubscores;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shown;
- (NSString)actionKey;
- (NSString)engaged;
- (NSString)heuristicName;
- (NSString)sessionId;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cacheRank;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionKey:(id)a3;
- (void)setCacheRank:(int)a3;
- (void)setEngaged:(id)a3;
- (void)setEngagedAction:(BOOL)a3;
- (void)setFutureMedia:(BOOL)a3;
- (void)setHasCacheRank:(BOOL)a3;
- (void)setHasEngagedAction:(BOOL)a3;
- (void)setHasFutureMedia:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasShown:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeuristicName:(id)a3;
- (void)setScore:(double)a3;
- (void)setSessionId:(id)a3;
- (void)setShown:(BOOL)a3;
- (void)setSubscores:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveActionData

- (void)setTimestamp:(unint64_t)a3
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

- (BOOL)hasActionKey
{
  return self->_actionKey != 0;
}

- (void)setCacheRank:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cacheRank = a3;
}

- (void)setHasCacheRank:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCacheRank
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEngagedAction:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_engagedAction = a3;
}

- (void)setHasEngagedAction:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEngagedAction
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFutureMedia:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_futureMedia = a3;
}

- (void)setHasFutureMedia:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFutureMedia
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShown:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_shown = a3;
}

- (void)setHasShown:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasShown
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasSubscores
{
  return self->_subscores != 0;
}

- (BOOL)hasHeuristicName
{
  return self->_heuristicName != 0;
}

- (BOOL)hasEngaged
{
  return self->_engaged != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveActionData;
  v4 = [(AWDProactiveActionData *)&v8 description];
  v5 = [(AWDProactiveActionData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  actionKey = self->_actionKey;
  if (actionKey) {
    [v3 setObject:actionKey forKey:@"actionKey"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_cacheRank];
    [v3 setObject:v14 forKey:@"cacheRank"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  v15 = [NSNumber numberWithBool:self->_engagedAction];
  [v3 setObject:v15 forKey:@"engagedAction"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v16 = [NSNumber numberWithBool:self->_futureMedia];
  [v3 setObject:v16 forKey:@"futureMedia"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  v17 = [NSNumber numberWithDouble:self->_score];
  [v3 setObject:v17 forKey:@"score"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    v7 = [NSNumber numberWithBool:self->_shown];
    [v3 setObject:v7 forKey:@"shown"];
  }
LABEL_11:
  subscores = self->_subscores;
  if (subscores)
  {
    v9 = [(AWDProactiveAppPredictionSubscores *)subscores dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"subscores"];
  }
  heuristicName = self->_heuristicName;
  if (heuristicName) {
    [v3 setObject:heuristicName forKey:@"heuristicName"];
  }
  engaged = self->_engaged;
  if (engaged) {
    [v3 setObject:engaged forKey:@"engaged"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveActionDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_actionKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_11:
  if (self->_subscores)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_heuristicName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_engaged)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  id v6 = v4;
  if (self->_actionKey)
  {
    objc_msgSend(v4, "setActionKey:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_cacheRank;
    *((unsigned char *)v4 + 76) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 72) = self->_engagedAction;
  *((unsigned char *)v4 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)v4 + 73) = self->_futureMedia;
  *((unsigned char *)v4 + 76) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  v4[1] = *(void *)&self->_score;
  *((unsigned char *)v4 + 76) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 74) = self->_shown;
    *((unsigned char *)v4 + 76) |= 0x20u;
  }
LABEL_11:
  if (self->_subscores)
  {
    objc_msgSend(v6, "setSubscores:");
    id v4 = v6;
  }
  if (self->_heuristicName)
  {
    objc_msgSend(v6, "setHeuristicName:");
    id v4 = v6;
  }
  if (self->_engaged)
  {
    objc_msgSend(v6, "setEngaged:");
    id v4 = v6;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v6, "setSessionId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_actionKey copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_cacheRank;
    *(unsigned char *)(v6 + 76) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 72) = self->_engagedAction;
  *(unsigned char *)(v6 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(double *)(v6 + 8) = self->_score;
    *(unsigned char *)(v6 + 76) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(unsigned char *)(v6 + 73) = self->_futureMedia;
  *(unsigned char *)(v6 + 76) |= 0x10u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 74) = self->_shown;
    *(unsigned char *)(v6 + 76) |= 0x20u;
  }
LABEL_9:
  id v10 = [(AWDProactiveAppPredictionSubscores *)self->_subscores copyWithZone:a3];
  v11 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_heuristicName copyWithZone:a3];
  v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_engaged copyWithZone:a3];
  v15 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v14;

  uint64_t v16 = [(NSString *)self->_sessionId copyWithZone:a3];
  v17 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_52;
  }
  actionKey = self->_actionKey;
  if ((unint64_t)actionKey | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](actionKey, "isEqual:")) {
      goto LABEL_52;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_cacheRank != *((_DWORD *)v4 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_engagedAction)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) == 0) {
      goto LABEL_52;
    }
    if (self->_futureMedia)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x20) != 0)
    {
      if (self->_shown)
      {
        if (!*((unsigned char *)v4 + 74)) {
          goto LABEL_52;
        }
        goto LABEL_44;
      }
      if (!*((unsigned char *)v4 + 74)) {
        goto LABEL_44;
      }
    }
LABEL_52:
    char v11 = 0;
    goto LABEL_53;
  }
  if ((*((unsigned char *)v4 + 76) & 0x20) != 0) {
    goto LABEL_52;
  }
LABEL_44:
  subscores = self->_subscores;
  if ((unint64_t)subscores | *((void *)v4 + 8)
    && !-[AWDProactiveAppPredictionSubscores isEqual:](subscores, "isEqual:"))
  {
    goto LABEL_52;
  }
  heuristicName = self->_heuristicName;
  if ((unint64_t)heuristicName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](heuristicName, "isEqual:")) {
      goto LABEL_52;
    }
  }
  engaged = self->_engaged;
  if ((unint64_t)engaged | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](engaged, "isEqual:")) {
      goto LABEL_52;
    }
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 7)) {
    char v11 = -[NSString isEqual:](sessionId, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_53:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_actionKey hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_cacheRank;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_engagedAction;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
LABEL_14:
      uint64_t v8 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_8;
      }
LABEL_15:
      unint64_t v13 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_futureMedia;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  double score = self->_score;
  double v10 = -score;
  if (score >= 0.0) {
    double v10 = self->_score;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_18:
  if ((has & 0x20) != 0) {
    uint64_t v14 = 2654435761 * self->_shown;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ [(AWDProactiveAppPredictionSubscores *)self->_subscores hash];
  NSUInteger v16 = [(NSString *)self->_heuristicName hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_engaged hash];
  return v15 ^ v17 ^ [(NSString *)self->_sessionId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    self->_timestamp = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  v9 = v4;
  if (v4[3])
  {
    -[AWDProactiveActionData setActionKey:](self, "setActionKey:");
    uint64_t v5 = v9;
  }
  char v6 = *((unsigned char *)v5 + 76);
  if ((v6 & 4) != 0)
  {
    self->_cacheRank = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v5 + 76);
    if ((v6 & 8) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v5 + 76) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_engagedAction = *((unsigned char *)v5 + 72);
  *(unsigned char *)&self->_has |= 8u;
  char v6 = *((unsigned char *)v5 + 76);
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_futureMedia = *((unsigned char *)v5 + 73);
  *(unsigned char *)&self->_has |= 0x10u;
  char v6 = *((unsigned char *)v5 + 76);
  if ((v6 & 1) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  self->_double score = (double)v5[1];
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v5 + 76) & 0x20) != 0)
  {
LABEL_10:
    self->_shown = *((unsigned char *)v5 + 74);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_11:
  subscores = self->_subscores;
  uint64_t v8 = v5[8];
  if (subscores)
  {
    if (!v8) {
      goto LABEL_22;
    }
    -[AWDProactiveAppPredictionSubscores mergeFrom:](subscores, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_22;
    }
    -[AWDProactiveActionData setSubscores:](self, "setSubscores:");
  }
  uint64_t v5 = v9;
LABEL_22:
  if (v5[6])
  {
    -[AWDProactiveActionData setHeuristicName:](self, "setHeuristicName:");
    uint64_t v5 = v9;
  }
  if (v5[5])
  {
    -[AWDProactiveActionData setEngaged:](self, "setEngaged:");
    uint64_t v5 = v9;
  }
  if (v5[7]) {
    -[AWDProactiveActionData setSessionId:](self, "setSessionId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void)setActionKey:(id)a3
{
}

- (int)cacheRank
{
  return self->_cacheRank;
}

- (BOOL)engagedAction
{
  return self->_engagedAction;
}

- (BOOL)futureMedia
{
  return self->_futureMedia;
}

- (double)score
{
  return self->_score;
}

- (BOOL)shown
{
  return self->_shown;
}

- (AWDProactiveAppPredictionSubscores)subscores
{
  return self->_subscores;
}

- (void)setSubscores:(id)a3
{
}

- (NSString)heuristicName
{
  return self->_heuristicName;
}

- (void)setHeuristicName:(id)a3
{
}

- (NSString)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscores, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_heuristicName, 0);
  objc_storeStrong((id *)&self->_engaged, 0);
  objc_storeStrong((id *)&self->_actionKey, 0);
}

@end