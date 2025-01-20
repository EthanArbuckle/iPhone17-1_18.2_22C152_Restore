@interface HKCodableSummaryOngoingFactorsValue
- (BOOL)hasEarliestStartDate;
- (BOOL)hasLatestEndDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)earliestStartDate;
- (double)latestEndDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)categoryValueRawValues;
- (int64_t)categoryValueRawValuesAtIndex:(unint64_t)a3;
- (unint64_t)categoryValueRawValuesCount;
- (unint64_t)hash;
- (void)addCategoryValueRawValues:(int64_t)a3;
- (void)clearCategoryValueRawValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCategoryValueRawValues:(int64_t *)a3 count:(unint64_t)a4;
- (void)setEarliestStartDate:(double)a3;
- (void)setHasEarliestStartDate:(BOOL)a3;
- (void)setHasLatestEndDate:(BOOL)a3;
- (void)setLatestEndDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryOngoingFactorsValue

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HKCodableSummaryOngoingFactorsValue;
  [(HKCodableSummaryOngoingFactorsValue *)&v3 dealloc];
}

- (unint64_t)categoryValueRawValuesCount
{
  return self->_categoryValueRawValues.count;
}

- (int64_t)categoryValueRawValues
{
  return self->_categoryValueRawValues.list;
}

- (void)clearCategoryValueRawValues
{
}

- (void)addCategoryValueRawValues:(int64_t)a3
{
}

- (int64_t)categoryValueRawValuesAtIndex:(unint64_t)a3
{
  p_categoryValueRawValues = &self->_categoryValueRawValues;
  unint64_t count = self->_categoryValueRawValues.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_categoryValueRawValues->list[a3];
}

- (void)setCategoryValueRawValues:(int64_t *)a3 count:(unint64_t)a4
{
}

- (void)setEarliestStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_earliestStartDate = a3;
}

- (void)setHasEarliestStartDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEarliestStartDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLatestEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_latestEndDate = a3;
}

- (void)setHasLatestEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatestEndDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryOngoingFactorsValue;
  v4 = [(HKCodableSummaryOngoingFactorsValue *)&v8 description];
  v5 = [(HKCodableSummaryOngoingFactorsValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = PBRepeatedInt64NSArray();
  [v3 setObject:v4 forKey:@"categoryValueRawValues"];

  char has = (char)self->_has;
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_earliestStartDate];
    [v3 setObject:v6 forKey:@"earliestStartDate"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = [NSNumber numberWithDouble:self->_latestEndDate];
    [v3 setObject:v7 forKey:@"latestEndDate"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryOngoingFactorsValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_categoryValueRawValues.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_categoryValueRawValues.count);
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(HKCodableSummaryOngoingFactorsValue *)self categoryValueRawValuesCount])
  {
    [v8 clearCategoryValueRawValues];
    unint64_t v4 = [(HKCodableSummaryOngoingFactorsValue *)self categoryValueRawValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addCategoryValueRawValues:", -[HKCodableSummaryOngoingFactorsValue categoryValueRawValuesAtIndex:](self, "categoryValueRawValuesAtIndex:", i));
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v8 + 4) = *(void *)&self->_earliestStartDate;
    *((unsigned char *)v8 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v8 + 5) = *(void *)&self->_latestEndDate;
    *((unsigned char *)v8 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt64Copy();
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v4 + 32) = self->_earliestStartDate;
    *(unsigned char *)(v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v4 + 40) = self->_latestEndDate;
    *(unsigned char *)(v4 + 48) |= 2u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedInt64IsEqual()) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_earliestStartDate != *((double *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_latestEndDate != *((double *)v4 + 5)) {
      goto LABEL_12;
    }
    BOOL v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt64Hash();
  char has = (char)self->_has;
  if (has)
  {
    double earliestStartDate = self->_earliestStartDate;
    double v7 = -earliestStartDate;
    if (earliestStartDate >= 0.0) {
      double v7 = self->_earliestStartDate;
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
  if ((has & 2) != 0)
  {
    double latestEndDate = self->_latestEndDate;
    double v12 = -latestEndDate;
    if (latestEndDate >= 0.0) {
      double v12 = self->_latestEndDate;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  long double v8 = (double *)a3;
  uint64_t v4 = [v8 categoryValueRawValuesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[HKCodableSummaryOngoingFactorsValue addCategoryValueRawValues:](self, "addCategoryValueRawValues:", [v8 categoryValueRawValuesAtIndex:i]);
  }
  char v7 = *((unsigned char *)v8 + 48);
  if (v7)
  {
    self->_double earliestStartDate = v8[4];
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v8 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_double latestEndDate = v8[5];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (double)earliestStartDate
{
  return self->_earliestStartDate;
}

- (double)latestEndDate
{
  return self->_latestEndDate;
}

@end