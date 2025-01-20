@interface HKCodableSummaryCategoryValue
- (BOOL)hasCategoryValue;
- (BOOL)hasDateData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)dateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)categoryValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoryValue:(int64_t)a3;
- (void)setDateData:(double)a3;
- (void)setHasCategoryValue:(BOOL)a3;
- (void)setHasDateData:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryCategoryValue

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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryCategoryValue;
  v4 = [(HKCodableSummaryCategoryValue *)&v8 description];
  v5 = [(HKCodableSummaryCategoryValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_categoryValue];
    [v3 setObject:v5 forKey:@"categoryValue"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v6 forKey:@"dateData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryCategoryValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_categoryValue;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_dateData;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_categoryValue;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_dateData;
    *((unsigned char *)result + 24) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_categoryValue != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_dateData != *((double *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_categoryValue;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double dateData = self->_dateData;
  double v4 = -dateData;
  if (dateData >= 0.0) {
    double v4 = self->_dateData;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_categoryValue = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_double dateData = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)categoryValue
{
  return self->_categoryValue;
}

- (double)dateData
{
  return self->_dateData;
}

@end