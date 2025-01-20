@interface HKCodableQuantitySeriesEnumerationResult
- (BOOL)hasCount;
- (BOOL)hasDataTypeCode;
- (BOOL)hasEndTime;
- (BOOL)hasPersistentID;
- (BOOL)hasQuantitySample;
- (BOOL)hasSeriesIndex;
- (BOOL)hasSourceID;
- (BOOL)hasStartTime;
- (BOOL)hasUuid;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)quantitySample;
- (NSData)uuid;
- (double)endTime;
- (double)startTime;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)count;
- (int64_t)dataTypeCode;
- (int64_t)persistentID;
- (int64_t)seriesIndex;
- (int64_t)sourceID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDataTypeCode:(int64_t)a3;
- (void)setEndTime:(double)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasDataTypeCode:(BOOL)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasPersistentID:(BOOL)a3;
- (void)setHasSeriesIndex:(BOOL)a3;
- (void)setHasSourceID:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setQuantitySample:(id)a3;
- (void)setSeriesIndex:(int64_t)a3;
- (void)setSourceID:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setUuid:(id)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableQuantitySeriesEnumerationResult

- (void)setPersistentID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_persistentID = a3;
}

- (void)setHasPersistentID:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPersistentID
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDataTypeCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dataTypeCode = a3;
}

- (void)setHasDataTypeCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataTypeCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setEndTime:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSourceID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_sourceID = a3;
}

- (void)setHasSourceID:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSourceID
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSeriesIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_seriesIndex = a3;
}

- (void)setHasSeriesIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSeriesIndex
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasQuantitySample
{
  return self->_quantitySample != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableQuantitySeriesEnumerationResult;
  v4 = [(HKCodableQuantitySeriesEnumerationResult *)&v8 description];
  v5 = [(HKCodableQuantitySeriesEnumerationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_persistentID];
    [v3 setObject:v5 forKey:@"persistentID"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_dataTypeCode];
    [v3 setObject:v6 forKey:@"dataTypeCode"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  $EC25E7DE26FA9107235552E23206271C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v8 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v16 = [NSNumber numberWithDouble:self->_value];
  [v3 setObject:v16 forKey:@"value"];

  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v8 = self->_has;
  if (*(unsigned char *)&v8)
  {
LABEL_9:
    v9 = [NSNumber numberWithLongLong:self->_count];
    [v3 setObject:v9 forKey:@"count"];

    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v8 = self->_has;
  }
LABEL_10:
  if ((*(unsigned char *)&v8 & 0x40) != 0)
  {
    v13 = [NSNumber numberWithDouble:self->_startTime];
    [v3 setObject:v13 forKey:@"startTime"];

    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v8 = self->_has;
    if ((*(unsigned char *)&v8 & 4) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v8 & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&v8 & 4) == 0)
  {
    goto LABEL_12;
  }
  v14 = [NSNumber numberWithDouble:self->_endTime];
  [v3 setObject:v14 forKey:@"endTime"];

  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_22:
  v15 = [NSNumber numberWithLongLong:self->_sourceID];
  [v3 setObject:v15 forKey:@"sourceID"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v10 = [NSNumber numberWithLongLong:self->_seriesIndex];
    [v3 setObject:v10 forKey:@"seriesIndex"];
  }
LABEL_15:
  quantitySample = self->_quantitySample;
  if (quantitySample) {
    [v3 setObject:quantitySample forKey:@"quantitySample"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQuantitySeriesEnumerationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  $EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
LABEL_9:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  }
LABEL_10:
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
    if ((*(unsigned char *)&v6 & 4) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v6 & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_15:
  if (self->_quantitySample)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_persistentID;
    *((unsigned char *)v4 + 88) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_dataTypeCode;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  id v7 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v7;
  }
  $EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v4[8] = *(void *)&self->_value;
  *((unsigned char *)v4 + 88) |= 0x80u;
  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
LABEL_9:
    v4[1] = self->_count;
    *((unsigned char *)v4 + 88) |= 1u;
    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  }
LABEL_10:
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    v4[7] = *(void *)&self->_startTime;
    *((unsigned char *)v4 + 88) |= 0x40u;
    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
    if ((*(unsigned char *)&v6 & 4) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v6 & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  v4[3] = *(void *)&self->_endTime;
  *((unsigned char *)v4 + 88) |= 4u;
  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_22:
  v4[6] = self->_sourceID;
  *((unsigned char *)v4 + 88) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v4[5] = self->_seriesIndex;
    *((unsigned char *)v4 + 88) |= 0x10u;
  }
LABEL_15:
  if (self->_quantitySample)
  {
    objc_msgSend(v7, "setQuantitySample:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_persistentID;
    *(unsigned char *)(v5 + 88) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_dataTypeCode;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_uuid copyWithZone:a3];
  v9 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v8;

  $EC25E7DE26FA9107235552E23206271C v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v10 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(double *)(v6 + 64) = self->_value;
  *(unsigned char *)(v6 + 88) |= 0x80u;
  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v10 = self->_has;
  if (*(unsigned char *)&v10)
  {
LABEL_7:
    *(void *)(v6 + 8) = self->_count;
    *(unsigned char *)(v6 + 88) |= 1u;
    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v10 = self->_has;
  }
LABEL_8:
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    *(double *)(v6 + 56) = self->_startTime;
    *(unsigned char *)(v6 + 88) |= 0x40u;
    *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v10 = self->_has;
    if ((*(unsigned char *)&v10 & 4) == 0)
    {
LABEL_10:
      if ((*(unsigned char *)&v10 & 0x20) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      *(void *)(v6 + 48) = self->_sourceID;
      *(unsigned char *)(v6 + 88) |= 0x20u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&v10 & 4) == 0)
  {
    goto LABEL_10;
  }
  *(double *)(v6 + 24) = self->_endTime;
  *(unsigned char *)(v6 + 88) |= 4u;
  *(unsigned char *)&$EC25E7DE26FA9107235552E23206271C v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((*(unsigned char *)&v10 & 0x10) != 0)
  {
LABEL_12:
    *(void *)(v6 + 40) = self->_seriesIndex;
    *(unsigned char *)(v6 + 88) |= 0x10u;
  }
LABEL_13:
  uint64_t v11 = [(NSData *)self->_quantitySample copyWithZone:a3];
  v12 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0 || self->_persistentID != *((void *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_dataTypeCode != *((void *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_47;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_47;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x80) == 0) {
      goto LABEL_17;
    }
LABEL_47:
    char v8 = 0;
    goto LABEL_48;
  }
  if ((*((unsigned char *)v4 + 88) & 0x80) == 0 || self->_value != *((double *)v4 + 8)) {
    goto LABEL_47;
  }
LABEL_17:
  if (has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x40) == 0 || self->_startTime != *((double *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_endTime != *((double *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x20) == 0 || self->_sourceID != *((void *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x10) == 0 || self->_seriesIndex != *((void *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  quantitySample = self->_quantitySample;
  if ((unint64_t)quantitySample | *((void *)v4 + 9)) {
    char v8 = -[NSData isEqual:](quantitySample, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_48:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_persistentID;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_dataTypeCode;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_uuid hash];
  char has = (char)self->_has;
  if (has < 0)
  {
    double value = self->_value;
    double v9 = -value;
    if (value >= 0.0) {
      double v9 = self->_value;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (has)
  {
    uint64_t v12 = 2654435761 * self->_count;
    if ((has & 0x40) != 0) {
      goto LABEL_16;
    }
LABEL_21:
    unint64_t v17 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  double startTime = self->_startTime;
  double v14 = -startTime;
  if (startTime >= 0.0) {
    double v14 = self->_startTime;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_22:
  if ((has & 4) != 0)
  {
    double endTime = self->_endTime;
    double v20 = -endTime;
    if (endTime >= 0.0) {
      double v20 = self->_endTime;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t v23 = 2654435761 * self->_sourceID;
    if ((has & 0x10) != 0) {
      goto LABEL_34;
    }
LABEL_36:
    uint64_t v24 = 0;
    return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v23 ^ v24 ^ v5 ^ [(NSData *)self->_quantitySample hash];
  }
  uint64_t v23 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v24 = 2654435761 * self->_seriesIndex;
  return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v23 ^ v24 ^ v5 ^ [(NSData *)self->_quantitySample hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  char v5 = v4[88];
  if ((v5 & 8) != 0)
  {
    self->_persistentID = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = v4[88];
  }
  if ((v5 & 2) != 0)
  {
    self->_dataTypeCode = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  unint64_t v7 = v4;
  if (*((void *)v4 + 10))
  {
    -[HKCodableQuantitySeriesEnumerationResult setUuid:](self, "setUuid:");
    uint64_t v4 = v7;
  }
  int v6 = v4[88];
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  self->_double value = *((double *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v6) = v4[88];
  if (v6)
  {
LABEL_9:
    self->_count = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    LOBYTE(v6) = v4[88];
  }
LABEL_10:
  if ((v6 & 0x40) != 0)
  {
    self->_double startTime = *((double *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
    LOBYTE(v6) = v4[88];
    if ((v6 & 4) == 0)
    {
LABEL_12:
      if ((v6 & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_double endTime = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  LOBYTE(v6) = v4[88];
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_22:
  self->_sourceID = *((void *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((v4[88] & 0x10) != 0)
  {
LABEL_14:
    self->_seriesIndex = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_15:
  if (*((void *)v4 + 9))
  {
    -[HKCodableQuantitySeriesEnumerationResult setQuantitySample:](self, "setQuantitySample:");
    uint64_t v4 = v7;
  }
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (int64_t)dataTypeCode
{
  return self->_dataTypeCode;
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (int64_t)count
{
  return self->_count;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (int64_t)seriesIndex
{
  return self->_seriesIndex;
}

- (NSData)quantitySample
{
  return self->_quantitySample;
}

- (void)setQuantitySample:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_quantitySample, 0);
}

@end