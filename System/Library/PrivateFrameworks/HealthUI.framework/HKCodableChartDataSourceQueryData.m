@interface HKCodableChartDataSourceQueryData
- (BOOL)hasEndDate;
- (BOOL)hasFirstWeekday;
- (BOOL)hasQueryDataObject;
- (BOOL)hasStartDate;
- (BOOL)hasStatisticsInterval;
- (BOOL)hasTimeZoneName;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateComponents)statisticsInterval;
- (NSData)queryDataObject;
- (NSString)timeZoneName;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)firstWeekday;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setFirstWeekday:(int64_t)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasFirstWeekday:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setQueryDataObject:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setStatisticsInterval:(id)a3;
- (void)setTimeZoneName:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableChartDataSourceQueryData

- (void)setQueryDataObject:(id)a3
{
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startDate = a3;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_queryDataObject, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_queryDataObject)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_statisticsInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (BOOL)hasQueryDataObject
{
  return self->_queryDataObject != 0;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStatisticsInterval
{
  return self->_statisticsInterval != 0;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6D57CC8[a3];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"quantity"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"distribution"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"sampleTypeCount"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"bloodPressure"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"insulin"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"handwashing"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"horizontalTimePeriod"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"timePeriodSeries"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"sample"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"sleep"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"activitySummary"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"notification"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"cardioFitness"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"electrocardiogram"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"stateOfMind"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setFirstWeekday:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_firstWeekday = a3;
}

- (void)setHasFirstWeekday:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstWeekday
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableChartDataSourceQueryData;
  int v4 = [(HKCodableChartDataSourceQueryData *)&v8 description];
  v5 = [(HKCodableChartDataSourceQueryData *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  timeZoneName = self->_timeZoneName;
  if (timeZoneName) {
    [v3 setObject:timeZoneName forKey:@"timeZoneName"];
  }
  queryDataObject = self->_queryDataObject;
  if (queryDataObject) {
    [v4 setObject:queryDataObject forKey:@"queryDataObject"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_startDate];
    [v4 setObject:v8 forKey:@"startDate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_endDate];
    [v4 setObject:v9 forKey:@"endDate"];
  }
  statisticsInterval = self->_statisticsInterval;
  if (statisticsInterval)
  {
    v11 = [(HKCodableDateComponents *)statisticsInterval dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"statisticsInterval"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E6D57CC8[type];
    }
    [v4 setObject:v14 forKey:@"type"];

    char v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    v15 = [NSNumber numberWithLongLong:self->_firstWeekday];
    [v4 setObject:v15 forKey:@"firstWeekday"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartDataSourceQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_timeZoneName)
  {
    objc_msgSend(v4, "setTimeZoneName:");
    id v4 = v7;
  }
  if (self->_queryDataObject)
  {
    objc_msgSend(v7, "setQueryDataObject:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 60) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if (self->_statisticsInterval)
  {
    objc_msgSend(v7, "setStatisticsInterval:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((unsigned char *)v4 + 60) |= 8u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((void *)v4 + 2) = self->_firstWeekday;
    *((unsigned char *)v4 + 60) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_timeZoneName copyWithZone:a3];
  id v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSData *)self->_queryDataObject copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_startDate;
    *(unsigned char *)(v5 + 60) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_endDate;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v11 = [(HKCodableDateComponents *)self->_statisticsInterval copyWithZone:a3];
  char v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char v13 = (char)self->_has;
  if ((v13 & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 60) |= 8u;
    char v13 = (char)self->_has;
  }
  if ((v13 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_firstWeekday;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  queryDataObject = self->_queryDataObject;
  if ((unint64_t)queryDataObject | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](queryDataObject, "isEqual:")) {
      goto LABEL_28;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_startDate != *((double *)v4 + 3)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_endDate != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  statisticsInterval = self->_statisticsInterval;
  if ((unint64_t)statisticsInterval | *((void *)v4 + 5))
  {
    if (!-[HKCodableDateComponents isEqual:](statisticsInterval, "isEqual:"))
    {
LABEL_28:
      BOOL v9 = 0;
      goto LABEL_29;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_28;
  }
  BOOL v9 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_firstWeekday != *((void *)v4 + 2)) {
      goto LABEL_28;
    }
    BOOL v9 = 1;
  }
LABEL_29:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_timeZoneName hash];
  uint64_t v4 = [(NSData *)self->_queryDataObject hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double startDate = self->_startDate;
    double v8 = -startDate;
    if (startDate >= 0.0) {
      double v8 = self->_startDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (has)
  {
    double endDate = self->_endDate;
    double v13 = -endDate;
    if (endDate >= 0.0) {
      double v13 = self->_endDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t v16 = [(HKCodableDateComponents *)self->_statisticsInterval hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v17 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v18 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18;
  }
  uint64_t v17 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v18 = 2654435761 * self->_firstWeekday;
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 6))
  {
    -[HKCodableChartDataSourceQueryData setTimeZoneName:](self, "setTimeZoneName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 4))
  {
    -[HKCodableChartDataSourceQueryData setQueryDataObject:](self, "setQueryDataObject:");
    id v4 = v9;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_double startDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 60);
  }
  if (v5)
  {
    self->_double endDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  statisticsInterval = self->_statisticsInterval;
  uint64_t v7 = *((void *)v4 + 5);
  if (statisticsInterval)
  {
    if (!v7) {
      goto LABEL_15;
    }
    statisticsInterval = (HKCodableDateComponents *)-[HKCodableDateComponents mergeFrom:](statisticsInterval, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    statisticsInterval = (HKCodableDateComponents *)-[HKCodableChartDataSourceQueryData setStatisticsInterval:](self, "setStatisticsInterval:");
  }
  id v4 = v9;
LABEL_15:
  char v8 = *((unsigned char *)v4 + 60);
  if ((v8 & 8) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 8u;
    char v8 = *((unsigned char *)v4 + 60);
  }
  if ((v8 & 2) != 0)
  {
    self->_firstWeekday = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8](statisticsInterval, v4);
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
}

- (NSData)queryDataObject
{
  return self->_queryDataObject;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
}

- (int64_t)firstWeekday
{
  return self->_firstWeekday;
}

@end