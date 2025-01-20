@interface AWDProactiveAppData
- (AWDProactiveAppPredictionSubscores)subscores;
- (BOOL)engagedApp;
- (BOOL)hasBundleId;
- (BOOL)hasEngagedApp;
- (BOOL)hasScore;
- (BOOL)hasSessionId;
- (BOOL)hasSubscores;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)sessionId;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setEngagedApp:(BOOL)a3;
- (void)setHasEngagedApp:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setSessionId:(id)a3;
- (void)setSubscores:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveAppData

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

- (void)setEngagedApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_engagedApp = a3;
}

- (void)setHasEngagedApp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEngagedApp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (BOOL)hasSubscores
{
  return self->_subscores != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveAppData;
  v4 = [(AWDProactiveAppData *)&v8 description];
  v5 = [(AWDProactiveAppData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v12 = [NSNumber numberWithBool:self->_engagedApp];
  [v3 setObject:v12 forKey:@"engagedApp"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_score];
    [v3 setObject:v5 forKey:@"score"];
  }
LABEL_5:
  subscores = self->_subscores;
  if (subscores)
  {
    v7 = [(AWDProactiveAppPredictionSubscores *)subscores dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"subscores"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_subscores)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 48) = self->_engagedApp;
  *((unsigned char *)v4 + 52) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[1] = *(void *)&self->_score;
    *((unsigned char *)v4 + 52) |= 1u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_subscores)
  {
    objc_msgSend(v4, "setSubscores:");
    id v4 = v6;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v6, "setSessionId:");
    id v4 = v6;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v6, "setBundleId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 48) = self->_engagedApp;
    *(unsigned char *)(v5 + 52) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_timestamp;
  *(unsigned char *)(v5 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
LABEL_5:
  id v8 = [(AWDProactiveAppPredictionSubscores *)self->_subscores copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  uint64_t v10 = [(NSString *)self->_sessionId copyWithZone:a3];
  v11 = (void *)v6[4];
  v6[4] = v10;

  uint64_t v12 = [(NSString *)self->_bundleId copyWithZone:a3];
  v13 = (void *)v6[3];
  v6[3] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) != 0)
    {
      if (self->_engagedApp)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_26;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_15;
      }
    }
LABEL_26:
    char v8 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0) {
    goto LABEL_26;
  }
LABEL_15:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_26;
  }
  subscores = self->_subscores;
  if ((unint64_t)subscores | *((void *)v4 + 5)
    && !-[AWDProactiveAppPredictionSubscores isEqual:](subscores, "isEqual:"))
  {
    goto LABEL_26;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:")) {
      goto LABEL_26;
    }
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](bundleId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    goto LABEL_13;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_engagedApp;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double score = self->_score;
  double v6 = -score;
  if (score >= 0.0) {
    double v6 = self->_score;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  unint64_t v10 = v4 ^ v3 ^ v9 ^ [(AWDProactiveAppPredictionSubscores *)self->_subscores hash];
  NSUInteger v11 = [(NSString *)self->_sessionId hash];
  return v10 ^ v11 ^ [(NSString *)self->_bundleId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 52);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 52);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_engagedApp = *((unsigned char *)v4 + 48);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 52))
  {
LABEL_4:
    self->_double score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  subscores = self->_subscores;
  uint64_t v8 = v5[5];
  unint64_t v9 = v5;
  if (subscores)
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[AWDProactiveAppPredictionSubscores mergeFrom:](subscores, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[AWDProactiveAppData setSubscores:](self, "setSubscores:");
  }
  uint64_t v5 = v9;
LABEL_14:
  if (v5[4])
  {
    -[AWDProactiveAppData setSessionId:](self, "setSessionId:");
    uint64_t v5 = v9;
  }
  if (v5[3]) {
    -[AWDProactiveAppData setBundleId:](self, "setBundleId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)engagedApp
{
  return self->_engagedApp;
}

- (double)score
{
  return self->_score;
}

- (AWDProactiveAppPredictionSubscores)subscores
{
  return self->_subscores;
}

- (void)setSubscores:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscores, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end