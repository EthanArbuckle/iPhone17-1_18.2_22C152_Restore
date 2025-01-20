@interface HKCodableSummaryElectrocardiogramValue
- (BOOL)hasAlgorithmVersionRawValue;
- (BOOL)hasAverageHeartRate;
- (BOOL)hasClassificationRawValue;
- (BOOL)hasTimestampData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)averageHeartRate;
- (double)timestampData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)algorithmVersionRawValue;
- (int64_t)classificationRawValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithmVersionRawValue:(int64_t)a3;
- (void)setAverageHeartRate:(id)a3;
- (void)setClassificationRawValue:(int64_t)a3;
- (void)setHasAlgorithmVersionRawValue:(BOOL)a3;
- (void)setHasClassificationRawValue:(BOOL)a3;
- (void)setHasTimestampData:(BOOL)a3;
- (void)setTimestampData:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryElectrocardiogramValue

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

- (void)setTimestampData:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestampData
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryElectrocardiogramValue;
  v4 = [(HKCodableSummaryElectrocardiogramValue *)&v8 description];
  v5 = [(HKCodableSummaryElectrocardiogramValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_algorithmVersionRawValue];
    [v3 setObject:v5 forKey:@"algorithmVersionRawValue"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_timestampData];
    [v3 setObject:v9 forKey:@"timestampData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryElectrocardiogramValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_averageHeartRate) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_algorithmVersionRawValue;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_classificationRawValue;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_averageHeartRate)
  {
    v6 = v4;
    objc_msgSend(v4, "setAverageHeartRate:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[3] = *(void *)&self->_timestampData;
    *((unsigned char *)v4 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_algorithmVersionRawValue;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_classificationRawValue;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  id v8 = [(HKCodableQuantity *)self->_averageHeartRate copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(double *)(v6 + 24) = self->_timestampData;
    *(unsigned char *)(v6 + 40) |= 4u;
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
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_algorithmVersionRawValue != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_classificationRawValue != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  averageHeartRate = self->_averageHeartRate;
  if ((unint64_t)averageHeartRate | *((void *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](averageHeartRate, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_timestampData != *((double *)v4 + 3)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_algorithmVersionRawValue;
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
      uint64_t v4 = 2654435761 * self->_classificationRawValue;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(HKCodableQuantity *)self->_averageHeartRate hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double timestampData = self->_timestampData;
    double v8 = -timestampData;
    if (timestampData >= 0.0) {
      double v8 = self->_timestampData;
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
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if (v6)
  {
    self->_algorithmVersionRawValue = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if ((v6 & 2) != 0)
  {
    self->_classificationRawValue = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  averageHeartRate = self->_averageHeartRate;
  uint64_t v8 = v5[4];
  if (averageHeartRate)
  {
    if (!v8) {
      goto LABEL_11;
    }
    long double v9 = v5;
    -[HKCodableQuantity mergeFrom:](averageHeartRate, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    long double v9 = v5;
    -[HKCodableSummaryElectrocardiogramValue setAverageHeartRate:](self, "setAverageHeartRate:");
  }
  unint64_t v5 = v9;
LABEL_11:
  if ((v5[5] & 4) != 0)
  {
    *(void *)&self->_double timestampData = v5[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  MEMORY[0x1F41817F8]();
}

- (int64_t)algorithmVersionRawValue
{
  return self->_algorithmVersionRawValue;
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

- (double)timestampData
{
  return self->_timestampData;
}

- (void).cxx_destruct
{
}

@end