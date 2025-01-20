@interface HKCodableChartCardioFitnessQueryData
- (BOOL)hasAge;
- (BOOL)hasBiologicalSex;
- (BOOL)hasCardioFitnessLevelEnabled;
- (BOOL)hasQuantityData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableChartQuantityDataSourceQueryData)quantityData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)age;
- (int64_t)biologicalSex;
- (int64_t)cardioFitnessLevelEnabled;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAge:(int64_t)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setCardioFitnessLevelEnabled:(int64_t)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasBiologicalSex:(BOOL)a3;
- (void)setHasCardioFitnessLevelEnabled:(BOOL)a3;
- (void)setQuantityData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableChartCardioFitnessQueryData

- (void)setCardioFitnessLevelEnabled:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cardioFitnessLevelEnabled = a3;
}

- (void)setHasCardioFitnessLevelEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCardioFitnessLevelEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBiologicalSex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_biologicalSex = a3;
}

- (void)setHasBiologicalSex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBiologicalSex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAge:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasQuantityData
{
  return self->_quantityData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableChartCardioFitnessQueryData;
  v4 = [(HKCodableChartCardioFitnessQueryData *)&v8 description];
  v5 = [(HKCodableChartCardioFitnessQueryData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_cardioFitnessLevelEnabled];
    [v3 setObject:v9 forKey:@"cardioFitnessLevelEnabled"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithLongLong:self->_biologicalSex];
  [v3 setObject:v10 forKey:@"biologicalSex"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_age];
    [v3 setObject:v5 forKey:@"age"];
  }
LABEL_5:
  quantityData = self->_quantityData;
  if (quantityData)
  {
    v7 = [(HKCodableChartQuantityDataSourceQueryData *)quantityData dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"quantityData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartCardioFitnessQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_quantityData)
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
    v4[3] = self->_cardioFitnessLevelEnabled;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_biologicalSex;
  *((unsigned char *)v4 + 40) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[1] = self->_age;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_5:
  if (self->_quantityData)
  {
    id v6 = v4;
    objc_msgSend(v4, "setQuantityData:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 16) = self->_biologicalSex;
    *(unsigned char *)(v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 24) = self->_cardioFitnessLevelEnabled;
  *(unsigned char *)(v5 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_age;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
LABEL_5:
  id v8 = [(HKCodableChartQuantityDataSourceQueryData *)self->_quantityData copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_cardioFitnessLevelEnabled != *((void *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_biologicalSex != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_age != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_19;
  }
  quantityData = self->_quantityData;
  if ((unint64_t)quantityData | *((void *)v4 + 4)) {
    char v6 = -[HKCodableChartQuantityDataSourceQueryData isEqual:](quantityData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(HKCodableChartQuantityDataSourceQueryData *)self->_quantityData hash];
  }
  uint64_t v2 = 2654435761 * self->_cardioFitnessLevelEnabled;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_biologicalSex;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_age;
  return v3 ^ v2 ^ v4 ^ [(HKCodableChartQuantityDataSourceQueryData *)self->_quantityData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 4) != 0)
  {
    self->_cardioFitnessLevelEnabled = v4[3];
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 40);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[5] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_biologicalSex = v4[2];
  *(unsigned char *)&self->_has |= 2u;
  if (v4[5])
  {
LABEL_4:
    self->_age = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  quantityData = self->_quantityData;
  uint64_t v8 = v5[4];
  if (quantityData)
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    quantityData = (HKCodableChartQuantityDataSourceQueryData *)-[HKCodableChartQuantityDataSourceQueryData mergeFrom:](quantityData, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    quantityData = (HKCodableChartQuantityDataSourceQueryData *)-[HKCodableChartCardioFitnessQueryData setQuantityData:](self, "setQuantityData:");
  }
  uint64_t v5 = v9;
LABEL_14:
  MEMORY[0x1F41817F8](quantityData, v5);
}

- (int64_t)cardioFitnessLevelEnabled
{
  return self->_cardioFitnessLevelEnabled;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (int64_t)age
{
  return self->_age;
}

- (HKCodableChartQuantityDataSourceQueryData)quantityData
{
  return self->_quantityData;
}

- (void)setQuantityData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end