@interface HKCodableSummaryBloodPressureValue
- (BOOL)hasDiastolicValue;
- (BOOL)hasSystolicValue;
- (BOOL)hasTimestampData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)diastolicValue;
- (HKCodableQuantity)systolicValue;
- (double)timestampData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDiastolicValue:(id)a3;
- (void)setHasTimestampData:(BOOL)a3;
- (void)setSystolicValue:(id)a3;
- (void)setTimestampData:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryBloodPressureValue

- (BOOL)hasSystolicValue
{
  return self->_systolicValue != 0;
}

- (BOOL)hasDiastolicValue
{
  return self->_diastolicValue != 0;
}

- (void)setTimestampData:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampData
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryBloodPressureValue;
  v4 = [(HKCodableSummaryBloodPressureValue *)&v8 description];
  v5 = [(HKCodableSummaryBloodPressureValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  systolicValue = self->_systolicValue;
  if (systolicValue)
  {
    v5 = [(HKCodableQuantity *)systolicValue dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"systolicValue"];
  }
  diastolicValue = self->_diastolicValue;
  if (diastolicValue)
  {
    v7 = [(HKCodableQuantity *)diastolicValue dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"diastolicValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_timestampData];
    [v3 setObject:v8 forKey:@"timestampData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryBloodPressureValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_systolicValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_diastolicValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_systolicValue)
  {
    objc_msgSend(v4, "setSystolicValue:");
    id v4 = v5;
  }
  if (self->_diastolicValue)
  {
    objc_msgSend(v5, "setDiastolicValue:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestampData;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_systolicValue copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(HKCodableQuantity *)self->_diastolicValue copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestampData;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  systolicValue = self->_systolicValue;
  if ((unint64_t)systolicValue | *((void *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](systolicValue, "isEqual:")) {
      goto LABEL_10;
    }
  }
  diastolicValue = self->_diastolicValue;
  if ((unint64_t)diastolicValue | *((void *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](diastolicValue, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_timestampData == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableQuantity *)self->_systolicValue hash];
  unint64_t v4 = [(HKCodableQuantity *)self->_diastolicValue hash];
  if (*(unsigned char *)&self->_has)
  {
    double timestampData = self->_timestampData;
    double v7 = -timestampData;
    if (timestampData >= 0.0) {
      double v7 = self->_timestampData;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  systolicValue = self->_systolicValue;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (systolicValue)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableQuantity mergeFrom:](systolicValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableSummaryBloodPressureValue setSystolicValue:](self, "setSystolicValue:");
  }
  id v4 = v9;
LABEL_7:
  diastolicValue = self->_diastolicValue;
  uint64_t v8 = *((void *)v4 + 2);
  if (diastolicValue)
  {
    if (!v8) {
      goto LABEL_13;
    }
    diastolicValue = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](diastolicValue, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    diastolicValue = (HKCodableQuantity *)-[HKCodableSummaryBloodPressureValue setDiastolicValue:](self, "setDiastolicValue:");
  }
  id v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 32))
  {
    self->_double timestampData = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](diastolicValue, v4);
}

- (HKCodableQuantity)systolicValue
{
  return self->_systolicValue;
}

- (void)setSystolicValue:(id)a3
{
}

- (HKCodableQuantity)diastolicValue
{
  return self->_diastolicValue;
}

- (void)setDiastolicValue:(id)a3
{
}

- (double)timestampData
{
  return self->_timestampData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systolicValue, 0);
  objc_storeStrong((id *)&self->_diastolicValue, 0);
}

@end