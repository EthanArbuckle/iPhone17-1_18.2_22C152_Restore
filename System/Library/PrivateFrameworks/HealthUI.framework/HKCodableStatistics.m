@interface HKCodableStatistics
- (BOOL)hasAverageQuantity;
- (BOOL)hasBaselineRelativeValueState;
- (BOOL)hasDataCount;
- (BOOL)hasDataType;
- (BOOL)hasDurationQuantity;
- (BOOL)hasEndDate;
- (BOOL)hasMaxQuantity;
- (BOOL)hasMetadata;
- (BOOL)hasMinQuantity;
- (BOOL)hasMostRecentQuantity;
- (BOOL)hasStartDate;
- (BOOL)hasStatisticsInterval;
- (BOOL)hasSumQuantity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateComponents)statisticsInterval;
- (HKCodableMetadataDictionary)metadata;
- (HKCodableQuantity)averageQuantity;
- (HKCodableQuantity)durationQuantity;
- (HKCodableQuantity)maxQuantity;
- (HKCodableQuantity)minQuantity;
- (HKCodableQuantity)mostRecentQuantity;
- (HKCodableQuantity)sumQuantity;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)baselineRelativeValueState;
- (int64_t)dataCount;
- (int64_t)dataType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverageQuantity:(id)a3;
- (void)setBaselineRelativeValueState:(int64_t)a3;
- (void)setDataCount:(int64_t)a3;
- (void)setDataType:(int64_t)a3;
- (void)setDurationQuantity:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setHasBaselineRelativeValueState:(BOOL)a3;
- (void)setHasDataCount:(BOOL)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setMaxQuantity:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMinQuantity:(id)a3;
- (void)setMostRecentQuantity:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setStatisticsInterval:(id)a3;
- (void)setSumQuantity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableStatistics

- (void)setDataType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDataType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasAverageQuantity
{
  return self->_averageQuantity != 0;
}

- (BOOL)hasMinQuantity
{
  return self->_minQuantity != 0;
}

- (BOOL)hasMaxQuantity
{
  return self->_maxQuantity != 0;
}

- (BOOL)hasMostRecentQuantity
{
  return self->_mostRecentQuantity != 0;
}

- (BOOL)hasSumQuantity
{
  return self->_sumQuantity != 0;
}

- (BOOL)hasDurationQuantity
{
  return self->_durationQuantity != 0;
}

- (void)setDataCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dataCount = a3;
}

- (void)setHasDataCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasStatisticsInterval
{
  return self->_statisticsInterval != 0;
}

- (void)setBaselineRelativeValueState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_baselineRelativeValueState = a3;
}

- (void)setHasBaselineRelativeValueState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBaselineRelativeValueState
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableStatistics;
  v4 = [(HKCodableStatistics *)&v8 description];
  v5 = [(HKCodableStatistics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v25 = [NSNumber numberWithLongLong:self->_dataType];
    [v3 setObject:v25 forKey:@"dataType"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v26 = [NSNumber numberWithDouble:self->_startDate];
  [v3 setObject:v26 forKey:@"startDate"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_endDate];
    [v3 setObject:v5 forKey:@"endDate"];
  }
LABEL_5:
  averageQuantity = self->_averageQuantity;
  if (averageQuantity)
  {
    v7 = [(HKCodableQuantity *)averageQuantity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"averageQuantity"];
  }
  minQuantity = self->_minQuantity;
  if (minQuantity)
  {
    v9 = [(HKCodableQuantity *)minQuantity dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"minQuantity"];
  }
  maxQuantity = self->_maxQuantity;
  if (maxQuantity)
  {
    v11 = [(HKCodableQuantity *)maxQuantity dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"maxQuantity"];
  }
  mostRecentQuantity = self->_mostRecentQuantity;
  if (mostRecentQuantity)
  {
    v13 = [(HKCodableQuantity *)mostRecentQuantity dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"mostRecentQuantity"];
  }
  sumQuantity = self->_sumQuantity;
  if (sumQuantity)
  {
    v15 = [(HKCodableQuantity *)sumQuantity dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"sumQuantity"];
  }
  durationQuantity = self->_durationQuantity;
  if (durationQuantity)
  {
    v17 = [(HKCodableQuantity *)durationQuantity dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"durationQuantity"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v18 = [NSNumber numberWithLongLong:self->_dataCount];
    [v3 setObject:v18 forKey:@"dataCount"];
  }
  statisticsInterval = self->_statisticsInterval;
  if (statisticsInterval)
  {
    v20 = [(HKCodableDateComponents *)statisticsInterval dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"statisticsInterval"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v21 = [NSNumber numberWithLongLong:self->_baselineRelativeValueState];
    [v3 setObject:v21 forKey:@"baselineRelativeValueState"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v23 = [(HKCodableMetadataDictionary *)metadata dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"metadata"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_averageQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_minQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_maxQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_mostRecentQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sumQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_durationQuantity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_statisticsInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_dataType;
    *((unsigned char *)v4 + 112) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(void *)&self->_startDate;
  *((unsigned char *)v4 + 112) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4[4] = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 112) |= 8u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_averageQuantity)
  {
    objc_msgSend(v4, "setAverageQuantity:");
    id v4 = v6;
  }
  if (self->_minQuantity)
  {
    objc_msgSend(v6, "setMinQuantity:");
    id v4 = v6;
  }
  if (self->_maxQuantity)
  {
    objc_msgSend(v6, "setMaxQuantity:");
    id v4 = v6;
  }
  if (self->_mostRecentQuantity)
  {
    objc_msgSend(v6, "setMostRecentQuantity:");
    id v4 = v6;
  }
  if (self->_sumQuantity)
  {
    objc_msgSend(v6, "setSumQuantity:");
    id v4 = v6;
  }
  if (self->_durationQuantity)
  {
    objc_msgSend(v6, "setDurationQuantity:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_dataCount;
    *((unsigned char *)v4 + 112) |= 2u;
  }
  if (self->_statisticsInterval)
  {
    objc_msgSend(v6, "setStatisticsInterval:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_baselineRelativeValueState;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_dataType;
    *(unsigned char *)(v5 + 112) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 40) = self->_startDate;
  *(unsigned char *)(v5 + 112) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(double *)(v5 + 32) = self->_endDate;
    *(unsigned char *)(v5 + 112) |= 8u;
  }
LABEL_5:
  id v8 = [(HKCodableQuantity *)self->_averageQuantity copyWithZone:a3];
  v9 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v8;

  id v10 = [(HKCodableQuantity *)self->_minQuantity copyWithZone:a3];
  v11 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v10;

  id v12 = [(HKCodableQuantity *)self->_maxQuantity copyWithZone:a3];
  v13 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v12;

  id v14 = [(HKCodableQuantity *)self->_mostRecentQuantity copyWithZone:a3];
  v15 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v14;

  id v16 = [(HKCodableQuantity *)self->_sumQuantity copyWithZone:a3];
  v17 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v16;

  id v18 = [(HKCodableQuantity *)self->_durationQuantity copyWithZone:a3];
  v19 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v18;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_dataCount;
    *(unsigned char *)(v6 + 112) |= 2u;
  }
  id v20 = [(HKCodableDateComponents *)self->_statisticsInterval copyWithZone:a3];
  v21 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v20;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_baselineRelativeValueState;
    *(unsigned char *)(v6 + 112) |= 1u;
  }
  id v22 = [(HKCodableMetadataDictionary *)self->_metadata copyWithZone:a3];
  v23 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 4) == 0 || self->_dataType != *((void *)v4 + 3)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x10) == 0 || self->_startDate != *((double *)v4 + 5)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 8) == 0 || self->_endDate != *((double *)v4 + 4)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 8) != 0)
  {
    goto LABEL_44;
  }
  averageQuantity = self->_averageQuantity;
  if ((unint64_t)averageQuantity | *((void *)v4 + 6)
    && !-[HKCodableQuantity isEqual:](averageQuantity, "isEqual:"))
  {
    goto LABEL_44;
  }
  minQuantity = self->_minQuantity;
  if ((unint64_t)minQuantity | *((void *)v4 + 10))
  {
    if (!-[HKCodableQuantity isEqual:](minQuantity, "isEqual:")) {
      goto LABEL_44;
    }
  }
  maxQuantity = self->_maxQuantity;
  if ((unint64_t)maxQuantity | *((void *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](maxQuantity, "isEqual:")) {
      goto LABEL_44;
    }
  }
  mostRecentQuantity = self->_mostRecentQuantity;
  if ((unint64_t)mostRecentQuantity | *((void *)v4 + 11))
  {
    if (!-[HKCodableQuantity isEqual:](mostRecentQuantity, "isEqual:")) {
      goto LABEL_44;
    }
  }
  sumQuantity = self->_sumQuantity;
  if ((unint64_t)sumQuantity | *((void *)v4 + 13))
  {
    if (!-[HKCodableQuantity isEqual:](sumQuantity, "isEqual:")) {
      goto LABEL_44;
    }
  }
  durationQuantity = self->_durationQuantity;
  if ((unint64_t)durationQuantity | *((void *)v4 + 7))
  {
    if (!-[HKCodableQuantity isEqual:](durationQuantity, "isEqual:")) {
      goto LABEL_44;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0 || self->_dataCount != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    goto LABEL_44;
  }
  statisticsInterval = self->_statisticsInterval;
  if ((unint64_t)statisticsInterval | *((void *)v4 + 12))
  {
    if (!-[HKCodableDateComponents isEqual:](statisticsInterval, "isEqual:"))
    {
LABEL_44:
      char v14 = 0;
      goto LABEL_45;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_baselineRelativeValueState != *((void *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
    goto LABEL_44;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 9)) {
    char v14 = -[HKCodableMetadataDictionary isEqual:](metadata, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_45:

  return v14;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v25 = 2654435761 * self->_dataType;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v25 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double startDate = self->_startDate;
  double v5 = -startDate;
  if (startDate >= 0.0) {
    double v5 = self->_startDate;
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
LABEL_11:
  unint64_t v24 = v8;
  if ((has & 8) != 0)
  {
    double endDate = self->_endDate;
    double v11 = -endDate;
    if (endDate >= 0.0) {
      double v11 = self->_endDate;
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
  unint64_t v23 = [(HKCodableQuantity *)self->_averageQuantity hash];
  unint64_t v14 = [(HKCodableQuantity *)self->_minQuantity hash];
  unint64_t v15 = [(HKCodableQuantity *)self->_maxQuantity hash];
  unint64_t v16 = [(HKCodableQuantity *)self->_mostRecentQuantity hash];
  unint64_t v17 = [(HKCodableQuantity *)self->_sumQuantity hash];
  unint64_t v18 = [(HKCodableQuantity *)self->_durationQuantity hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v19 = 2654435761 * self->_dataCount;
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v20 = [(HKCodableDateComponents *)self->_statisticsInterval hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v21 = 2654435761 * self->_baselineRelativeValueState;
  }
  else {
    uint64_t v21 = 0;
  }
  return v24 ^ v25 ^ v9 ^ v23 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(HKCodableMetadataDictionary *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  char v6 = *((unsigned char *)v4 + 112);
  if ((v6 & 4) != 0)
  {
    self->_dataType = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 112);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double startDate = *((double *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 112) & 8) != 0)
  {
LABEL_4:
    self->_double endDate = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_5:
  averageQuantity = self->_averageQuantity;
  uint64_t v8 = v5[6];
  unint64_t v23 = v5;
  if (averageQuantity)
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[HKCodableQuantity mergeFrom:](averageQuantity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[HKCodableStatistics setAverageQuantity:](self, "setAverageQuantity:");
  }
  double v5 = v23;
LABEL_14:
  minQuantity = self->_minQuantity;
  uint64_t v10 = v5[10];
  if (minQuantity)
  {
    if (!v10) {
      goto LABEL_20;
    }
    -[HKCodableQuantity mergeFrom:](minQuantity, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_20;
    }
    -[HKCodableStatistics setMinQuantity:](self, "setMinQuantity:");
  }
  double v5 = v23;
LABEL_20:
  maxQuantity = self->_maxQuantity;
  uint64_t v12 = v5[8];
  if (maxQuantity)
  {
    if (!v12) {
      goto LABEL_26;
    }
    -[HKCodableQuantity mergeFrom:](maxQuantity, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_26;
    }
    -[HKCodableStatistics setMaxQuantity:](self, "setMaxQuantity:");
  }
  double v5 = v23;
LABEL_26:
  mostRecentQuantity = self->_mostRecentQuantity;
  uint64_t v14 = v5[11];
  if (mostRecentQuantity)
  {
    if (!v14) {
      goto LABEL_32;
    }
    -[HKCodableQuantity mergeFrom:](mostRecentQuantity, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_32;
    }
    -[HKCodableStatistics setMostRecentQuantity:](self, "setMostRecentQuantity:");
  }
  double v5 = v23;
LABEL_32:
  sumQuantity = self->_sumQuantity;
  uint64_t v16 = v5[13];
  if (sumQuantity)
  {
    if (!v16) {
      goto LABEL_38;
    }
    -[HKCodableQuantity mergeFrom:](sumQuantity, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_38;
    }
    -[HKCodableStatistics setSumQuantity:](self, "setSumQuantity:");
  }
  double v5 = v23;
LABEL_38:
  durationQuantity = self->_durationQuantity;
  uint64_t v18 = v5[7];
  if (durationQuantity)
  {
    if (!v18) {
      goto LABEL_44;
    }
    -[HKCodableQuantity mergeFrom:](durationQuantity, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_44;
    }
    -[HKCodableStatistics setDurationQuantity:](self, "setDurationQuantity:");
  }
  double v5 = v23;
LABEL_44:
  if ((v5[14] & 2) != 0)
  {
    self->_dataCount = v5[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  statisticsInterval = self->_statisticsInterval;
  uint64_t v20 = v5[12];
  if (statisticsInterval)
  {
    if (!v20) {
      goto LABEL_52;
    }
    -[HKCodableDateComponents mergeFrom:](statisticsInterval, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_52;
    }
    -[HKCodableStatistics setStatisticsInterval:](self, "setStatisticsInterval:");
  }
  double v5 = v23;
LABEL_52:
  if (v5[14])
  {
    self->_baselineRelativeValueState = v5[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  metadata = self->_metadata;
  uint64_t v22 = v5[9];
  if (metadata)
  {
    if (!v22) {
      goto LABEL_60;
    }
    metadata = (HKCodableMetadataDictionary *)-[HKCodableMetadataDictionary mergeFrom:](metadata, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_60;
    }
    metadata = (HKCodableMetadataDictionary *)-[HKCodableStatistics setMetadata:](self, "setMetadata:");
  }
  double v5 = v23;
LABEL_60:
  MEMORY[0x1F41817F8](metadata, v5);
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableQuantity)averageQuantity
{
  return self->_averageQuantity;
}

- (void)setAverageQuantity:(id)a3
{
}

- (HKCodableQuantity)minQuantity
{
  return self->_minQuantity;
}

- (void)setMinQuantity:(id)a3
{
}

- (HKCodableQuantity)maxQuantity
{
  return self->_maxQuantity;
}

- (void)setMaxQuantity:(id)a3
{
}

- (HKCodableQuantity)mostRecentQuantity
{
  return self->_mostRecentQuantity;
}

- (void)setMostRecentQuantity:(id)a3
{
}

- (HKCodableQuantity)sumQuantity
{
  return self->_sumQuantity;
}

- (void)setSumQuantity:(id)a3
{
}

- (HKCodableQuantity)durationQuantity
{
  return self->_durationQuantity;
}

- (void)setDurationQuantity:(id)a3
{
}

- (int64_t)dataCount
{
  return self->_dataCount;
}

- (HKCodableDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
}

- (int64_t)baselineRelativeValueState
{
  return self->_baselineRelativeValueState;
}

- (HKCodableMetadataDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sumQuantity, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_minQuantity, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_maxQuantity, 0);
  objc_storeStrong((id *)&self->_durationQuantity, 0);
  objc_storeStrong((id *)&self->_averageQuantity, 0);
}

@end