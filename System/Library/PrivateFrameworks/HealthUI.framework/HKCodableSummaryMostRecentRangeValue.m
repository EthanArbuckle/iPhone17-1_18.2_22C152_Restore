@interface HKCodableSummaryMostRecentRangeValue
- (BOOL)hasDateData;
- (BOOL)hasMaximumValue;
- (BOOL)hasMinimumValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)maximumValue;
- (HKCodableQuantity)minimumValue;
- (double)dateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateData:(double)a3;
- (void)setHasDateData:(BOOL)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryMostRecentRangeValue

- (BOOL)hasMinimumValue
{
  return self->_minimumValue != 0;
}

- (BOOL)hasMaximumValue
{
  return self->_maximumValue != 0;
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryMostRecentRangeValue;
  v4 = [(HKCodableSummaryMostRecentRangeValue *)&v8 description];
  v5 = [(HKCodableSummaryMostRecentRangeValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  minimumValue = self->_minimumValue;
  if (minimumValue)
  {
    v5 = [(HKCodableQuantity *)minimumValue dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"minimumValue"];
  }
  maximumValue = self->_maximumValue;
  if (maximumValue)
  {
    v7 = [(HKCodableQuantity *)maximumValue dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"maximumValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v8 forKey:@"dateData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryMostRecentRangeValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_minimumValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_maximumValue)
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
  if (self->_minimumValue)
  {
    objc_msgSend(v4, "setMinimumValue:");
    id v4 = v5;
  }
  if (self->_maximumValue)
  {
    objc_msgSend(v5, "setMaximumValue:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_dateData;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableQuantity *)self->_minimumValue copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(HKCodableQuantity *)self->_maximumValue copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_dateData;
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
  minimumValue = self->_minimumValue;
  if ((unint64_t)minimumValue | *((void *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](minimumValue, "isEqual:")) {
      goto LABEL_10;
    }
  }
  maximumValue = self->_maximumValue;
  if ((unint64_t)maximumValue | *((void *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](maximumValue, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_dateData == *((double *)v4 + 1))
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
  unint64_t v3 = [(HKCodableQuantity *)self->_minimumValue hash];
  unint64_t v4 = [(HKCodableQuantity *)self->_maximumValue hash];
  if (*(unsigned char *)&self->_has)
  {
    double dateData = self->_dateData;
    double v7 = -dateData;
    if (dateData >= 0.0) {
      double v7 = self->_dateData;
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
  minimumValue = self->_minimumValue;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (minimumValue)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableQuantity mergeFrom:](minimumValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableSummaryMostRecentRangeValue setMinimumValue:](self, "setMinimumValue:");
  }
  id v4 = v9;
LABEL_7:
  maximumValue = self->_maximumValue;
  uint64_t v8 = *((void *)v4 + 2);
  if (maximumValue)
  {
    if (!v8) {
      goto LABEL_13;
    }
    maximumValue = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](maximumValue, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    maximumValue = (HKCodableQuantity *)-[HKCodableSummaryMostRecentRangeValue setMaximumValue:](self, "setMaximumValue:");
  }
  id v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 32))
  {
    self->_double dateData = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](maximumValue, v4);
}

- (HKCodableQuantity)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
}

- (HKCodableQuantity)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
}

- (double)dateData
{
  return self->_dateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
}

@end