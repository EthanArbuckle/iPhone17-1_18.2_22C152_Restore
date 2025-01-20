@interface CLPLocationConsumptionScoreInfo
- (BOOL)hasClientKey;
- (BOOL)hasScore;
- (BOOL)hasStartTime;
- (BOOL)hasStopTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientKey;
- (double)startTime;
- (double)stopTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)score;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientKey:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasStopTime:(BOOL)a3;
- (void)setScore:(int)a3;
- (void)setStartTime:(double)a3;
- (void)setStopTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLocationConsumptionScoreInfo

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStopTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_stopTime = a3;
}

- (void)setHasStopTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStopTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientKey
{
  return self->_clientKey != 0;
}

- (void)setScore:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLocationConsumptionScoreInfo;
  v4 = [(CLPLocationConsumptionScoreInfo *)&v8 description];
  v5 = [(CLPLocationConsumptionScoreInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_startTime];
    [v3 setObject:v5 forKey:@"startTime"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_stopTime];
    [v3 setObject:v6 forKey:@"stopTime"];
  }
  clientKey = self->_clientKey;
  if (clientKey) {
    [v3 setObject:clientKey forKey:@"clientKey"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_score];
    [v3 setObject:v8 forKey:@"score"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationConsumptionScoreInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_clientKey) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_startTime;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_stopTime;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  if (self->_clientKey)
  {
    v6 = v4;
    objc_msgSend(v4, "setClientKey:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_score;
    *((unsigned char *)v4 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_startTime;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_stopTime;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_clientKey copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_score;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_startTime != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_stopTime != *((double *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  clientKey = self->_clientKey;
  if ((unint64_t)clientKey | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientKey, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_score != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
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
    double stopTime = self->_stopTime;
    double v11 = -stopTime;
    if (stopTime >= 0.0) {
      double v11 = self->_stopTime;
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
  NSUInteger v14 = [(NSString *)self->_clientKey hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_score;
  }
  else {
    uint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v15 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_double startTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_double stopTime = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[CLPLocationConsumptionScoreInfo setClientKey:](self, "setClientKey:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    self->_score = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (double)stopTime
{
  return self->_stopTime;
}

- (NSString)clientKey
{
  return self->_clientKey;
}

- (void)setClientKey:(id)a3
{
}

- (int)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end