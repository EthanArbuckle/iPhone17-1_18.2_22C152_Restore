@interface HKCodableSummaryUnderwaterDepthValue
- (BOOL)hasDateData;
- (BOOL)hasValue;
- (BOOL)hasValueClamped;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)valueClamped;
- (HKCodableQuantity)value;
- (double)dateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateData:(double)a3;
- (void)setHasDateData:(BOOL)a3;
- (void)setHasValueClamped:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValueClamped:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryUnderwaterDepthValue

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValueClamped:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_valueClamped = a3;
}

- (void)setHasValueClamped:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValueClamped
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDateData:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateData
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryUnderwaterDepthValue;
  v4 = [(HKCodableSummaryUnderwaterDepthValue *)&v8 description];
  v5 = [(HKCodableSummaryUnderwaterDepthValue *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_valueClamped];
    [v3 setObject:v7 forKey:@"valueClamped"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v8 forKey:@"dateData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryUnderwaterDepthValueReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_value)
  {
    id v6 = v4;
    objc_msgSend(v4, "setValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_valueClamped;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_dateData;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_value copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_valueClamped;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_dateData;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](value, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_valueClamped)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_dateData != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_value hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_valueClamped;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
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
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  value = self->_value;
  uint64_t v6 = *((void *)v4 + 2);
  if (value)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    value = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    value = (HKCodableQuantity *)-[HKCodableSummaryUnderwaterDepthValue setValue:](self, "setValue:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 28);
  if ((v7 & 2) != 0)
  {
    self->_valueClamped = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if (v7)
  {
    self->_double dateData = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](value, v4);
}

- (HKCodableQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)valueClamped
{
  return self->_valueClamped;
}

- (double)dateData
{
  return self->_dateData;
}

- (void).cxx_destruct
{
}

@end