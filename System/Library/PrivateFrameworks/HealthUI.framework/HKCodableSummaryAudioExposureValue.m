@interface HKCodableSummaryAudioExposureValue
- (BOOL)hasDaysAggregated;
- (BOOL)hasLastUpdatedDateData;
- (BOOL)hasLeqQuantity;
- (BOOL)hasSecondsListened;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)leqQuantity;
- (double)lastUpdatedDateData;
- (double)secondsListened;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)daysAggregated;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDaysAggregated:(int64_t)a3;
- (void)setHasDaysAggregated:(BOOL)a3;
- (void)setHasLastUpdatedDateData:(BOOL)a3;
- (void)setHasSecondsListened:(BOOL)a3;
- (void)setLastUpdatedDateData:(double)a3;
- (void)setLeqQuantity:(id)a3;
- (void)setSecondsListened:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryAudioExposureValue

- (BOOL)hasLeqQuantity
{
  return self->_leqQuantity != 0;
}

- (void)setSecondsListened:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_secondsListened = a3;
}

- (void)setHasSecondsListened:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecondsListened
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDaysAggregated:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_daysAggregated = a3;
}

- (void)setHasDaysAggregated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDaysAggregated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLastUpdatedDateData:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastUpdatedDateData = a3;
}

- (void)setHasLastUpdatedDateData:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastUpdatedDateData
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryAudioExposureValue;
  v4 = [(HKCodableSummaryAudioExposureValue *)&v8 description];
  v5 = [(HKCodableSummaryAudioExposureValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  leqQuantity = self->_leqQuantity;
  if (leqQuantity)
  {
    v5 = [(HKCodableQuantity *)leqQuantity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"leqQuantity"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_secondsListened];
    [v3 setObject:v9 forKey:@"secondsListened"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithLongLong:self->_daysAggregated];
  [v3 setObject:v10 forKey:@"daysAggregated"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithDouble:self->_lastUpdatedDateData];
    [v3 setObject:v7 forKey:@"lastUpdatedDateData"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryAudioExposureValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_leqQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_leqQuantity)
  {
    id v6 = v4;
    objc_msgSend(v4, "setLeqQuantity:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_secondsListened;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = self->_daysAggregated;
  *((unsigned char *)v4 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((void *)v4 + 2) = *(void *)&self->_lastUpdatedDateData;
    *((unsigned char *)v4 + 40) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_leqQuantity copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 8) = self->_daysAggregated;
    *(unsigned char *)(v5 + 40) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_secondsListened;
  *(unsigned char *)(v5 + 40) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_lastUpdatedDateData;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  leqQuantity = self->_leqQuantity;
  if ((unint64_t)leqQuantity | *((void *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](leqQuantity, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_secondsListened != *((double *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_daysAggregated != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_lastUpdatedDateData != *((double *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_leqQuantity hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double secondsListened = self->_secondsListened;
    double v7 = -secondsListened;
    if (secondsListened >= 0.0) {
      double v7 = self->_secondsListened;
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
  if (has)
  {
    uint64_t v10 = 2654435761 * self->_daysAggregated;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v15 = 0;
    return v5 ^ v3 ^ v10 ^ v15;
  }
  uint64_t v10 = 0;
  if ((has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double lastUpdatedDateData = self->_lastUpdatedDateData;
  double v12 = -lastUpdatedDateData;
  if (lastUpdatedDateData >= 0.0) {
    double v12 = self->_lastUpdatedDateData;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  leqQuantity = self->_leqQuantity;
  uint64_t v6 = *((void *)v4 + 4);
  if (leqQuantity)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    leqQuantity = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](leqQuantity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    leqQuantity = (HKCodableQuantity *)-[HKCodableSummaryAudioExposureValue setLeqQuantity:](self, "setLeqQuantity:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if ((v7 & 4) != 0)
  {
    self->_double secondsListened = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_daysAggregated = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_10:
    self->_double lastUpdatedDateData = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
  MEMORY[0x1F41817F8](leqQuantity, v4);
}

- (HKCodableQuantity)leqQuantity
{
  return self->_leqQuantity;
}

- (void)setLeqQuantity:(id)a3
{
}

- (double)secondsListened
{
  return self->_secondsListened;
}

- (int64_t)daysAggregated
{
  return self->_daysAggregated;
}

- (double)lastUpdatedDateData
{
  return self->_lastUpdatedDateData;
}

- (void).cxx_destruct
{
}

@end