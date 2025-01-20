@interface HKCodableElectrocardiogramSample
- (BOOL)hasAlgorithmVersionRawValue;
- (BOOL)hasAverageHeartRate;
- (BOOL)hasClassificationRawValue;
- (BOOL)hasDateInterval;
- (BOOL)hasPrivateSymptoms;
- (BOOL)hasReadingData;
- (BOOL)hasSymptomsStatusRawValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateInterval)dateInterval;
- (HKCodableQuantity)averageHeartRate;
- (NSData)readingData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)algorithmVersionRawValue;
- (int64_t)classificationRawValue;
- (int64_t)privateSymptoms;
- (int64_t)symptomsStatusRawValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithmVersionRawValue:(int64_t)a3;
- (void)setAverageHeartRate:(id)a3;
- (void)setClassificationRawValue:(int64_t)a3;
- (void)setDateInterval:(id)a3;
- (void)setHasAlgorithmVersionRawValue:(BOOL)a3;
- (void)setHasClassificationRawValue:(BOOL)a3;
- (void)setHasPrivateSymptoms:(BOOL)a3;
- (void)setHasSymptomsStatusRawValue:(BOOL)a3;
- (void)setPrivateSymptoms:(int64_t)a3;
- (void)setReadingData:(id)a3;
- (void)setSymptomsStatusRawValue:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableElectrocardiogramSample

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setClassificationRawValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_classificationRawValue = a3;
}

- (void)setHasClassificationRawValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClassificationRawValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAverageHeartRate
{
  return self->_averageHeartRate != 0;
}

- (void)setSymptomsStatusRawValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_symptomsStatusRawValue = a3;
}

- (void)setHasSymptomsStatusRawValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSymptomsStatusRawValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPrivateSymptoms:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_privateSymptoms = a3;
}

- (void)setHasPrivateSymptoms:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrivateSymptoms
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasReadingData
{
  return self->_readingData != 0;
}

- (void)setAlgorithmVersionRawValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_algorithmVersionRawValue = a3;
}

- (void)setHasAlgorithmVersionRawValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithmVersionRawValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableElectrocardiogramSample;
  v4 = [(HKCodableElectrocardiogramSample *)&v8 description];
  v5 = [(HKCodableElectrocardiogramSample *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    v5 = [(HKCodableDateInterval *)dateInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"dateInterval"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_classificationRawValue];
    [v3 setObject:v6 forKey:@"classificationRawValue"];
  }
  averageHeartRate = self->_averageHeartRate;
  if (averageHeartRate)
  {
    objc_super v8 = [(HKCodableQuantity *)averageHeartRate dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"averageHeartRate"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_symptomsStatusRawValue];
    [v3 setObject:v10 forKey:@"symptomsStatusRawValue"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_privateSymptoms];
    [v3 setObject:v11 forKey:@"privateSymptoms"];
  }
  readingData = self->_readingData;
  if (readingData) {
    [v3 setObject:readingData forKey:@"readingData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = [NSNumber numberWithLongLong:self->_algorithmVersionRawValue];
    [v3 setObject:v13 forKey:@"algorithmVersionRawValue"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableElectrocardiogramSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_dateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_averageHeartRate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_readingData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_dateInterval)
  {
    objc_msgSend(v4, "setDateInterval:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_classificationRawValue;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  if (self->_averageHeartRate)
  {
    objc_msgSend(v6, "setAverageHeartRate:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_symptomsStatusRawValue;
    *((unsigned char *)v4 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_privateSymptoms;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  if (self->_readingData)
  {
    objc_msgSend(v6, "setReadingData:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_algorithmVersionRawValue;
    *((unsigned char *)v4 + 64) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateInterval *)self->_dateInterval copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_classificationRawValue;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  id v8 = [(HKCodableQuantity *)self->_averageHeartRate copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_symptomsStatusRawValue;
    *(unsigned char *)(v5 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_privateSymptoms;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
  uint64_t v11 = [(NSData *)self->_readingData copyWithZone:a3];
  v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_algorithmVersionRawValue;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((void *)v4 + 6))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:")) {
      goto LABEL_29;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_classificationRawValue != *((void *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_29;
  }
  averageHeartRate = self->_averageHeartRate;
  if ((unint64_t)averageHeartRate | *((void *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](averageHeartRate, "isEqual:")) {
      goto LABEL_29;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_symptomsStatusRawValue != *((void *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_privateSymptoms != *((void *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_29;
  }
  readingData = self->_readingData;
  if ((unint64_t)readingData | *((void *)v4 + 7))
  {
    if (-[NSData isEqual:](readingData, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_25;
    }
LABEL_29:
    BOOL v9 = 0;
    goto LABEL_30;
  }
LABEL_25:
  BOOL v9 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_algorithmVersionRawValue != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
    BOOL v9 = 1;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableDateInterval *)self->_dateInterval hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_classificationRawValue;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(HKCodableQuantity *)self->_averageHeartRate hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_symptomsStatusRawValue;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_privateSymptoms;
      goto LABEL_9;
    }
  }
  uint64_t v7 = 0;
LABEL_9:
  uint64_t v8 = [(NSData *)self->_readingData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_algorithmVersionRawValue;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  dateInterval = self->_dateInterval;
  uint64_t v6 = v4[6];
  v10 = v4;
  if (dateInterval)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableElectrocardiogramSample setDateInterval:](self, "setDateInterval:");
  }
  uint64_t v4 = v10;
LABEL_7:
  if ((v4[8] & 2) != 0)
  {
    self->_classificationRawValue = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  averageHeartRate = self->_averageHeartRate;
  uint64_t v8 = v4[5];
  if (averageHeartRate)
  {
    if (!v8) {
      goto LABEL_15;
    }
    averageHeartRate = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](averageHeartRate, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    averageHeartRate = (HKCodableQuantity *)-[HKCodableElectrocardiogramSample setAverageHeartRate:](self, "setAverageHeartRate:");
  }
  uint64_t v4 = v10;
LABEL_15:
  char v9 = *((unsigned char *)v4 + 64);
  if ((v9 & 8) != 0)
  {
    self->_symptomsStatusRawValue = v4[4];
    *(unsigned char *)&self->_has |= 8u;
    char v9 = *((unsigned char *)v4 + 64);
  }
  if ((v9 & 4) != 0)
  {
    self->_privateSymptoms = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (v4[7])
  {
    averageHeartRate = (HKCodableQuantity *)-[HKCodableElectrocardiogramSample setReadingData:](self, "setReadingData:");
    uint64_t v4 = v10;
  }
  if (v4[8])
  {
    self->_algorithmVersionRawValue = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](averageHeartRate, v4);
}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (int64_t)classificationRawValue
{
  return self->_classificationRawValue;
}

- (HKCodableQuantity)averageHeartRate
{
  return self->_averageHeartRate;
}

- (void)setAverageHeartRate:(id)a3
{
}

- (int64_t)symptomsStatusRawValue
{
  return self->_symptomsStatusRawValue;
}

- (int64_t)privateSymptoms
{
  return self->_privateSymptoms;
}

- (NSData)readingData
{
  return self->_readingData;
}

- (void)setReadingData:(id)a3
{
}

- (int64_t)algorithmVersionRawValue
{
  return self->_algorithmVersionRawValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingData, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
}

@end