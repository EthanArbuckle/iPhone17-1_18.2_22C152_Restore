@interface HKCodableNotificationSample
- (BOOL)hasCategoryValue;
- (BOOL)hasDataType;
- (BOOL)hasEndDate;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMetadataDictionary;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)hasSampleUUID;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableMetadataDictionary)metadataDictionary;
- (NSString)sampleUUID;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)categoryValue;
- (int64_t)dataType;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoryValue:(int64_t)a3;
- (void)setDataType:(int64_t)a3;
- (void)setEndDate:(double)a3;
- (void)setHasCategoryValue:(BOOL)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setSampleUUID:(id)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableNotificationSample

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (void)setCategoryValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_categoryValue = a3;
}

- (void)setHasCategoryValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategoryValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDataType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasSampleUUID
{
  return self->_sampleUUID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableNotificationSample;
  v4 = [(HKCodableNotificationSample *)&v8 description];
  v5 = [(HKCodableNotificationSample *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_startDate];
    [v3 setObject:v5 forKey:@"startDate"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_endDate];
    [v3 setObject:v6 forKey:@"endDate"];
  }
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    objc_super v8 = [(HKCodableMetadataDictionary *)metadataDictionary dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"metadataDictionary"];
  }
  char v9 = (char)self->_has;
  if (v9)
  {
    v13 = [NSNumber numberWithLongLong:self->_categoryValue];
    [v3 setObject:v13 forKey:@"categoryValue"];

    char v9 = (char)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_9:
      if ((v9 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v14 = [NSNumber numberWithLongLong:self->_dataType];
  [v3 setObject:v14 forKey:@"dataType"];

  char v9 = (char)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_10:
    if ((v9 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v15 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
  [v3 setObject:v15 forKey:@"latestSupportedVersion"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    v10 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v3 setObject:v10 forKey:@"minimumSupportedVersion"];
  }
LABEL_12:
  sampleUUID = self->_sampleUUID;
  if (sampleUUID) {
    [v3 setObject:sampleUUID forKey:@"sampleUUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableNotificationSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_metadataDictionary)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  char v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_12:
  if (self->_sampleUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[6] = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 72) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 72) |= 4u;
  }
  id v7 = v4;
  if (self->_metadataDictionary)
  {
    objc_msgSend(v4, "setMetadataDictionary:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[1] = self->_categoryValue;
    *((unsigned char *)v4 + 72) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[2] = self->_dataType;
  *((unsigned char *)v4 + 72) |= 2u;
  char v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v4[4] = self->_latestSupportedVersion;
  *((unsigned char *)v4 + 72) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    v4[5] = self->_minimumSupportedVersion;
    *((unsigned char *)v4 + 72) |= 0x10u;
  }
LABEL_12:
  if (self->_sampleUUID)
  {
    objc_msgSend(v7, "setSampleUUID:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_startDate;
    *(unsigned char *)(v5 + 72) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_endDate;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  id v8 = [(HKCodableMetadataDictionary *)self->_metadataDictionary copyWithZone:a3];
  char v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  char v10 = (char)self->_has;
  if (v10)
  {
    *(void *)(v6 + 8) = self->_categoryValue;
    *(unsigned char *)(v6 + 72) |= 1u;
    char v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_7:
      if ((v10 & 8) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *(void *)(v6 + 32) = self->_latestSupportedVersion;
      *(unsigned char *)(v6 + 72) |= 8u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v6 + 16) = self->_dataType;
  *(unsigned char *)(v6 + 72) |= 2u;
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v10 & 0x10) != 0)
  {
LABEL_9:
    *(void *)(v6 + 40) = self->_minimumSupportedVersion;
    *(unsigned char *)(v6 + 72) |= 0x10u;
  }
LABEL_10:
  uint64_t v11 = [(NSString *)self->_sampleUUID copyWithZone:a3];
  v12 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x20) == 0 || self->_startDate != *((double *)v4 + 6)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_endDate != *((double *)v4 + 3)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_37;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((void *)v4 + 7))
  {
    if (!-[HKCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
    {
LABEL_37:
      char v8 = 0;
      goto LABEL_38;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_categoryValue != *((void *)v4 + 1)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_37;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_dataType != *((void *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_latestSupportedVersion != *((void *)v4 + 4)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 5)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  sampleUUID = self->_sampleUUID;
  if ((unint64_t)sampleUUID | *((void *)v4 + 8)) {
    char v8 = -[NSString isEqual:](sampleUUID, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_38:

  return v8;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    double startDate = self->_startDate;
    double v6 = -startDate;
    if (startDate >= 0.0) {
      double v6 = self->_startDate;
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
  if ((has & 4) != 0)
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
  unint64_t v14 = [(HKCodableMetadataDictionary *)self->_metadataDictionary hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v15 = 2654435761 * self->_categoryValue;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_19:
      uint64_t v16 = 2654435761 * self->_dataType;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v17 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_21;
      }
LABEL_25:
      uint64_t v18 = 0;
      return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v18 ^ v14 ^ [(NSString *)self->_sampleUUID hash];
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v17 = 2654435761 * self->_latestSupportedVersion;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v18 = 2654435761 * self->_minimumSupportedVersion;
  return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v18 ^ v14 ^ [(NSString *)self->_sampleUUID hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 0x20) != 0)
  {
    self->_double startDate = v4[6];
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 72);
  }
  if ((v6 & 4) != 0)
  {
    self->_double endDate = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  metadataDictionary = self->_metadataDictionary;
  uint64_t v8 = *((void *)v5 + 7);
  char v10 = v5;
  if (metadataDictionary)
  {
    if (!v8) {
      goto LABEL_11;
    }
    metadataDictionary = (HKCodableMetadataDictionary *)-[HKCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    metadataDictionary = (HKCodableMetadataDictionary *)-[HKCodableNotificationSample setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  uint64_t v5 = v10;
LABEL_11:
  char v9 = *((unsigned char *)v5 + 72);
  if (v9)
  {
    self->_categoryValue = (int64_t)v5[1];
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v5 + 72);
    if ((v9 & 2) == 0)
    {
LABEL_13:
      if ((v9 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else if (((_BYTE)v5[9] & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_dataType = (int64_t)v5[2];
  *(unsigned char *)&self->_has |= 2u;
  char v9 = *((unsigned char *)v5 + 72);
  if ((v9 & 8) == 0)
  {
LABEL_14:
    if ((v9 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  self->_latestSupportedVersion = (int64_t)v5[4];
  *(unsigned char *)&self->_has |= 8u;
  if (((_BYTE)v5[9] & 0x10) != 0)
  {
LABEL_15:
    self->_minimumSupportedVersion = (int64_t)v5[5];
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_16:
  if (*((void *)v5 + 8))
  {
    metadataDictionary = (HKCodableMetadataDictionary *)-[HKCodableNotificationSample setSampleUUID:](self, "setSampleUUID:");
    uint64_t v5 = v10;
  }
  MEMORY[0x1F41817F8](metadataDictionary, v5);
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
}

- (int64_t)categoryValue
{
  return self->_categoryValue;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (NSString)sampleUUID
{
  return self->_sampleUUID;
}

- (void)setSampleUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleUUID, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end