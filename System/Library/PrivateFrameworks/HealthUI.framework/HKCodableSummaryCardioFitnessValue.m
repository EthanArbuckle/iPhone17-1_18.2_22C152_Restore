@interface HKCodableSummaryCardioFitnessValue
- (BOOL)hasClassificationRawValue;
- (BOOL)hasDateData;
- (BOOL)hasLevelViewDataConfiguration;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableLevelViewDataConfiguration)levelViewDataConfiguration;
- (HKCodableQuantity)value;
- (double)dateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)classificationRawValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassificationRawValue:(int64_t)a3;
- (void)setDateData:(double)a3;
- (void)setHasClassificationRawValue:(BOOL)a3;
- (void)setHasDateData:(BOOL)a3;
- (void)setLevelViewDataConfiguration:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryCardioFitnessValue

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setClassificationRawValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_classificationRawValue = a3;
}

- (void)setHasClassificationRawValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClassificationRawValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDateData:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDateData
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLevelViewDataConfiguration
{
  return self->_levelViewDataConfiguration != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryCardioFitnessValue;
  v4 = [(HKCodableSummaryCardioFitnessValue *)&v8 description];
  v5 = [(HKCodableSummaryCardioFitnessValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  value = self->_value;
  if (value)
  {
    v5 = [(HKCodableQuantity *)value dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"value"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_classificationRawValue];
    [v3 setObject:v7 forKey:@"classificationRawValue"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v8 forKey:@"dateData"];
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  if (levelViewDataConfiguration)
  {
    v10 = [(HKCodableLevelViewDataConfiguration *)levelViewDataConfiguration dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"levelViewDataConfiguration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryCardioFitnessValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_value)
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
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_levelViewDataConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_classificationRawValue;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_dateData;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_levelViewDataConfiguration)
  {
    objc_msgSend(v6, "setLevelViewDataConfiguration:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_value copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_classificationRawValue;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_dateData;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  id v9 = [(HKCodableLevelViewDataConfiguration *)self->_levelViewDataConfiguration copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](value, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_classificationRawValue != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_dateData != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  if ((unint64_t)levelViewDataConfiguration | *((void *)v4 + 3)) {
    char v7 = -[HKCodableLevelViewDataConfiguration isEqual:](levelViewDataConfiguration, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_value hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_classificationRawValue;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(HKCodableLevelViewDataConfiguration *)self->_levelViewDataConfiguration hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double dateData = self->_dateData;
  double v6 = -dateData;
  if (dateData >= 0.0) {
    double v6 = self->_dateData;
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
  return v4 ^ v3 ^ v9 ^ [(HKCodableLevelViewDataConfiguration *)self->_levelViewDataConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  value = self->_value;
  uint64_t v6 = *((void *)v4 + 4);
  id v10 = v4;
  if (value)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableQuantity mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableSummaryCardioFitnessValue setValue:](self, "setValue:");
  }
  id v4 = v10;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if (v7)
  {
    self->_classificationRawValue = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 40);
  }
  if ((v7 & 2) != 0)
  {
    self->_double dateData = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  uint64_t v9 = *((void *)v4 + 3);
  if (levelViewDataConfiguration)
  {
    if (v9) {
      -[HKCodableLevelViewDataConfiguration mergeFrom:](levelViewDataConfiguration, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[HKCodableSummaryCardioFitnessValue setLevelViewDataConfiguration:](self, "setLevelViewDataConfiguration:");
  }
  MEMORY[0x1F41817F8]();
}

- (HKCodableQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)classificationRawValue
{
  return self->_classificationRawValue;
}

- (double)dateData
{
  return self->_dateData;
}

- (HKCodableLevelViewDataConfiguration)levelViewDataConfiguration
{
  return self->_levelViewDataConfiguration;
}

- (void)setLevelViewDataConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_levelViewDataConfiguration, 0);
}

@end