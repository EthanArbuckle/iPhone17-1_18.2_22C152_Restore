@interface HKCodableChartSharableModel
- (BOOL)hasDayData;
- (BOOL)hasDayDateInterval;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)hasMonthData;
- (BOOL)hasMonthDateInterval;
- (BOOL)hasSixMonthData;
- (BOOL)hasSixMonthDateInterval;
- (BOOL)hasWeekData;
- (BOOL)hasWeekDateInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableChartDataSourceQueryData)dayData;
- (HKCodableChartDataSourceQueryData)monthData;
- (HKCodableChartDataSourceQueryData)sixMonthData;
- (HKCodableChartDataSourceQueryData)weekData;
- (HKCodableDateInterval)dayDateInterval;
- (HKCodableDateInterval)monthDateInterval;
- (HKCodableDateInterval)sixMonthDateInterval;
- (HKCodableDateInterval)weekDateInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDayData:(id)a3;
- (void)setDayDateInterval:(id)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setMonthData:(id)a3;
- (void)setMonthDateInterval:(id)a3;
- (void)setSixMonthData:(id)a3;
- (void)setSixMonthDateInterval:(id)a3;
- (void)setWeekData:(id)a3;
- (void)setWeekDateInterval:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableChartSharableModel

- (BOOL)hasMonthData
{
  return self->_monthData != 0;
}

- (BOOL)hasMonthDateInterval
{
  return self->_monthDateInterval != 0;
}

- (BOOL)hasSixMonthData
{
  return self->_sixMonthData != 0;
}

- (BOOL)hasSixMonthDateInterval
{
  return self->_sixMonthDateInterval != 0;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasWeekData
{
  return self->_weekData != 0;
}

- (BOOL)hasWeekDateInterval
{
  return self->_weekDateInterval != 0;
}

- (BOOL)hasDayData
{
  return self->_dayData != 0;
}

- (BOOL)hasDayDateInterval
{
  return self->_dayDateInterval != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableChartSharableModel;
  v4 = [(HKCodableChartSharableModel *)&v8 description];
  v5 = [(HKCodableChartSharableModel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  monthData = self->_monthData;
  if (monthData)
  {
    v5 = [(HKCodableChartDataSourceQueryData *)monthData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"monthData"];
  }
  monthDateInterval = self->_monthDateInterval;
  if (monthDateInterval)
  {
    v7 = [(HKCodableDateInterval *)monthDateInterval dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"monthDateInterval"];
  }
  sixMonthData = self->_sixMonthData;
  if (sixMonthData)
  {
    v9 = [(HKCodableChartDataSourceQueryData *)sixMonthData dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"sixMonthData"];
  }
  sixMonthDateInterval = self->_sixMonthDateInterval;
  if (sixMonthDateInterval)
  {
    v11 = [(HKCodableDateInterval *)sixMonthDateInterval dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"sixMonthDateInterval"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
    [v3 setObject:v13 forKey:@"latestSupportedVersion"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v3 setObject:v14 forKey:@"minimumSupportedVersion"];
  }
  weekData = self->_weekData;
  if (weekData)
  {
    v16 = [(HKCodableChartDataSourceQueryData *)weekData dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"weekData"];
  }
  weekDateInterval = self->_weekDateInterval;
  if (weekDateInterval)
  {
    v18 = [(HKCodableDateInterval *)weekDateInterval dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"weekDateInterval"];
  }
  dayData = self->_dayData;
  if (dayData)
  {
    v20 = [(HKCodableChartDataSourceQueryData *)dayData dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"dayData"];
  }
  dayDateInterval = self->_dayDateInterval;
  if (dayDateInterval)
  {
    v22 = [(HKCodableDateInterval *)dayDateInterval dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"dayDateInterval"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartSharableModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_monthData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_monthDateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sixMonthData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sixMonthDateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_weekData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_weekDateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dayData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dayDateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_monthData)
  {
    objc_msgSend(v4, "setMonthData:");
    id v4 = v6;
  }
  if (self->_monthDateInterval)
  {
    objc_msgSend(v6, "setMonthDateInterval:");
    id v4 = v6;
  }
  if (self->_sixMonthData)
  {
    objc_msgSend(v6, "setSixMonthData:");
    id v4 = v6;
  }
  if (self->_sixMonthDateInterval)
  {
    objc_msgSend(v6, "setSixMonthDateInterval:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_latestSupportedVersion;
    *((unsigned char *)v4 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_minimumSupportedVersion;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  if (self->_weekData)
  {
    objc_msgSend(v6, "setWeekData:");
    id v4 = v6;
  }
  if (self->_weekDateInterval)
  {
    objc_msgSend(v6, "setWeekDateInterval:");
    id v4 = v6;
  }
  if (self->_dayData)
  {
    objc_msgSend(v6, "setDayData:");
    id v4 = v6;
  }
  if (self->_dayDateInterval)
  {
    objc_msgSend(v6, "setDayDateInterval:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableChartDataSourceQueryData *)self->_monthData copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(HKCodableDateInterval *)self->_monthDateInterval copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(HKCodableChartDataSourceQueryData *)self->_sixMonthData copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  id v12 = [(HKCodableDateInterval *)self->_sixMonthDateInterval copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_latestSupportedVersion;
    *(unsigned char *)(v5 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_minimumSupportedVersion;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  id v15 = [(HKCodableChartDataSourceQueryData *)self->_weekData copyWithZone:a3];
  v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  id v17 = [(HKCodableDateInterval *)self->_weekDateInterval copyWithZone:a3];
  v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  id v19 = [(HKCodableChartDataSourceQueryData *)self->_dayData copyWithZone:a3];
  v20 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v19;

  id v21 = [(HKCodableDateInterval *)self->_dayDateInterval copyWithZone:a3];
  v22 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  monthData = self->_monthData;
  if ((unint64_t)monthData | *((void *)v4 + 5))
  {
    if (!-[HKCodableChartDataSourceQueryData isEqual:](monthData, "isEqual:")) {
      goto LABEL_28;
    }
  }
  monthDateInterval = self->_monthDateInterval;
  if ((unint64_t)monthDateInterval | *((void *)v4 + 6))
  {
    if (!-[HKCodableDateInterval isEqual:](monthDateInterval, "isEqual:")) {
      goto LABEL_28;
    }
  }
  sixMonthData = self->_sixMonthData;
  if ((unint64_t)sixMonthData | *((void *)v4 + 7))
  {
    if (!-[HKCodableChartDataSourceQueryData isEqual:](sixMonthData, "isEqual:")) {
      goto LABEL_28;
    }
  }
  sixMonthDateInterval = self->_sixMonthDateInterval;
  if ((unint64_t)sixMonthDateInterval | *((void *)v4 + 8))
  {
    if (!-[HKCodableDateInterval isEqual:](sixMonthDateInterval, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_latestSupportedVersion != *((void *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_28:
    char v13 = 0;
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_28;
  }
  weekData = self->_weekData;
  if ((unint64_t)weekData | *((void *)v4 + 9)
    && !-[HKCodableChartDataSourceQueryData isEqual:](weekData, "isEqual:"))
  {
    goto LABEL_28;
  }
  weekDateInterval = self->_weekDateInterval;
  if ((unint64_t)weekDateInterval | *((void *)v4 + 10))
  {
    if (!-[HKCodableDateInterval isEqual:](weekDateInterval, "isEqual:")) {
      goto LABEL_28;
    }
  }
  dayData = self->_dayData;
  if ((unint64_t)dayData | *((void *)v4 + 3))
  {
    if (!-[HKCodableChartDataSourceQueryData isEqual:](dayData, "isEqual:")) {
      goto LABEL_28;
    }
  }
  dayDateInterval = self->_dayDateInterval;
  if ((unint64_t)dayDateInterval | *((void *)v4 + 4)) {
    char v13 = -[HKCodableDateInterval isEqual:](dayDateInterval, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableChartDataSourceQueryData *)self->_monthData hash];
  unint64_t v4 = [(HKCodableDateInterval *)self->_monthDateInterval hash];
  unint64_t v5 = [(HKCodableChartDataSourceQueryData *)self->_sixMonthData hash];
  unint64_t v6 = [(HKCodableDateInterval *)self->_sixMonthDateInterval hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_latestSupportedVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_minimumSupportedVersion;
LABEL_6:
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v10 = v7 ^ v8 ^ [(HKCodableChartDataSourceQueryData *)self->_weekData hash];
  unint64_t v11 = v9 ^ v10 ^ [(HKCodableDateInterval *)self->_weekDateInterval hash];
  unint64_t v12 = [(HKCodableChartDataSourceQueryData *)self->_dayData hash];
  return v11 ^ v12 ^ [(HKCodableDateInterval *)self->_dayDateInterval hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  monthData = self->_monthData;
  uint64_t v6 = v4[5];
  v22 = v4;
  if (monthData)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableChartDataSourceQueryData mergeFrom:](monthData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableChartSharableModel setMonthData:](self, "setMonthData:");
  }
  unint64_t v4 = v22;
LABEL_7:
  monthDateInterval = self->_monthDateInterval;
  uint64_t v8 = v4[6];
  if (monthDateInterval)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[HKCodableDateInterval mergeFrom:](monthDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[HKCodableChartSharableModel setMonthDateInterval:](self, "setMonthDateInterval:");
  }
  unint64_t v4 = v22;
LABEL_13:
  sixMonthData = self->_sixMonthData;
  uint64_t v10 = v4[7];
  if (sixMonthData)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[HKCodableChartDataSourceQueryData mergeFrom:](sixMonthData, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[HKCodableChartSharableModel setSixMonthData:](self, "setSixMonthData:");
  }
  unint64_t v4 = v22;
LABEL_19:
  sixMonthDateInterval = self->_sixMonthDateInterval;
  uint64_t v12 = v4[8];
  if (sixMonthDateInterval)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[HKCodableDateInterval mergeFrom:](sixMonthDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[HKCodableChartSharableModel setSixMonthDateInterval:](self, "setSixMonthDateInterval:");
  }
  unint64_t v4 = v22;
LABEL_25:
  char v13 = *((unsigned char *)v4 + 88);
  if (v13)
  {
    self->_latestSupportedVersion = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v13 = *((unsigned char *)v4 + 88);
  }
  if ((v13 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  weekData = self->_weekData;
  uint64_t v15 = v4[9];
  if (weekData)
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[HKCodableChartDataSourceQueryData mergeFrom:](weekData, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[HKCodableChartSharableModel setWeekData:](self, "setWeekData:");
  }
  unint64_t v4 = v22;
LABEL_35:
  weekDateInterval = self->_weekDateInterval;
  uint64_t v17 = v4[10];
  if (weekDateInterval)
  {
    if (!v17) {
      goto LABEL_41;
    }
    -[HKCodableDateInterval mergeFrom:](weekDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_41;
    }
    -[HKCodableChartSharableModel setWeekDateInterval:](self, "setWeekDateInterval:");
  }
  unint64_t v4 = v22;
LABEL_41:
  dayData = self->_dayData;
  uint64_t v19 = v4[3];
  if (dayData)
  {
    if (!v19) {
      goto LABEL_47;
    }
    -[HKCodableChartDataSourceQueryData mergeFrom:](dayData, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_47;
    }
    -[HKCodableChartSharableModel setDayData:](self, "setDayData:");
  }
  unint64_t v4 = v22;
LABEL_47:
  dayDateInterval = self->_dayDateInterval;
  uint64_t v21 = v4[4];
  if (dayDateInterval)
  {
    if (!v21) {
      goto LABEL_53;
    }
    dayDateInterval = (HKCodableDateInterval *)-[HKCodableDateInterval mergeFrom:](dayDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_53;
    }
    dayDateInterval = (HKCodableDateInterval *)-[HKCodableChartSharableModel setDayDateInterval:](self, "setDayDateInterval:");
  }
  unint64_t v4 = v22;
LABEL_53:
  MEMORY[0x1F41817F8](dayDateInterval, v4);
}

- (HKCodableChartDataSourceQueryData)monthData
{
  return self->_monthData;
}

- (void)setMonthData:(id)a3
{
}

- (HKCodableDateInterval)monthDateInterval
{
  return self->_monthDateInterval;
}

- (void)setMonthDateInterval:(id)a3
{
}

- (HKCodableChartDataSourceQueryData)sixMonthData
{
  return self->_sixMonthData;
}

- (void)setSixMonthData:(id)a3
{
}

- (HKCodableDateInterval)sixMonthDateInterval
{
  return self->_sixMonthDateInterval;
}

- (void)setSixMonthDateInterval:(id)a3
{
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (HKCodableChartDataSourceQueryData)weekData
{
  return self->_weekData;
}

- (void)setWeekData:(id)a3
{
}

- (HKCodableDateInterval)weekDateInterval
{
  return self->_weekDateInterval;
}

- (void)setWeekDateInterval:(id)a3
{
}

- (HKCodableChartDataSourceQueryData)dayData
{
  return self->_dayData;
}

- (void)setDayData:(id)a3
{
}

- (HKCodableDateInterval)dayDateInterval
{
  return self->_dayDateInterval;
}

- (void)setDayDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekDateInterval, 0);
  objc_storeStrong((id *)&self->_weekData, 0);
  objc_storeStrong((id *)&self->_sixMonthDateInterval, 0);
  objc_storeStrong((id *)&self->_sixMonthData, 0);
  objc_storeStrong((id *)&self->_monthDateInterval, 0);
  objc_storeStrong((id *)&self->_monthData, 0);
  objc_storeStrong((id *)&self->_dayDateInterval, 0);
  objc_storeStrong((id *)&self->_dayData, 0);
}

@end