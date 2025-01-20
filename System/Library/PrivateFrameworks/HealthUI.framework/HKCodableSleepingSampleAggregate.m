@interface HKCodableSleepingSampleAggregate
- (BOOL)hasLatestSampleEndDate;
- (BOOL)hasMorningIndex;
- (BOOL)hasQuantity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)quantity;
- (double)latestSampleEndDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)morningIndex;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLatestSampleEndDate:(BOOL)a3;
- (void)setHasMorningIndex:(BOOL)a3;
- (void)setLatestSampleEndDate:(double)a3;
- (void)setMorningIndex:(int64_t)a3;
- (void)setQuantity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSleepingSampleAggregate

- (void)setMorningIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_morningIndex = a3;
}

- (void)setHasMorningIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMorningIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasQuantity
{
  return self->_quantity != 0;
}

- (void)setLatestSampleEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latestSampleEndDate = a3;
}

- (void)setHasLatestSampleEndDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSampleEndDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSleepingSampleAggregate;
  v4 = [(HKCodableSleepingSampleAggregate *)&v8 description];
  v5 = [(HKCodableSleepingSampleAggregate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithLongLong:self->_morningIndex];
    [v3 setObject:v4 forKey:@"morningIndex"];
  }
  quantity = self->_quantity;
  if (quantity)
  {
    v6 = [(HKCodableQuantity *)quantity dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"quantity"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_latestSampleEndDate];
    [v3 setObject:v7 forKey:@"latestSampleEndDate"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleAggregateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_quantity)
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_morningIndex;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  if (self->_quantity)
  {
    id v5 = v4;
    objc_msgSend(v4, "setQuantity:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_latestSampleEndDate;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_morningIndex;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  id v7 = [(HKCodableQuantity *)self->_quantity copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_latestSampleEndDate;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_morningIndex != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  quantity = self->_quantity;
  if ((unint64_t)quantity | *((void *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](quantity, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_latestSampleEndDate != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_morningIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(HKCodableQuantity *)self->_quantity hash];
  if (*(unsigned char *)&self->_has)
  {
    double latestSampleEndDate = self->_latestSampleEndDate;
    double v7 = -latestSampleEndDate;
    if (latestSampleEndDate >= 0.0) {
      double v7 = self->_latestSampleEndDate;
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
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if ((v4[4] & 2) != 0)
  {
    self->_morningIndex = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  quantity = self->_quantity;
  uint64_t v7 = v5[3];
  if (quantity)
  {
    if (!v7) {
      goto LABEL_9;
    }
    long double v8 = v5;
    quantity = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](quantity, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    long double v8 = v5;
    quantity = (HKCodableQuantity *)-[HKCodableSleepingSampleAggregate setQuantity:](self, "setQuantity:");
  }
  unint64_t v5 = v8;
LABEL_9:
  if (v5[4])
  {
    self->_double latestSampleEndDate = (double)v5[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](quantity, v5);
}

- (int64_t)morningIndex
{
  return self->_morningIndex;
}

- (HKCodableQuantity)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
}

- (double)latestSampleEndDate
{
  return self->_latestSampleEndDate;
}

- (void).cxx_destruct
{
}

@end