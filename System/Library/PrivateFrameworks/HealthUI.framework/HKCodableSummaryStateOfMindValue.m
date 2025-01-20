@interface HKCodableSummaryStateOfMindValue
- (BOOL)hasDateData;
- (BOOL)hasReflectiveInterval;
- (BOOL)hasValence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)dateData;
- (double)valence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)domains;
- (int64_t)domainsAtIndex:(unint64_t)a3;
- (int64_t)labels;
- (int64_t)labelsAtIndex:(unint64_t)a3;
- (int64_t)reflectiveInterval;
- (unint64_t)domainsCount;
- (unint64_t)hash;
- (unint64_t)labelsCount;
- (void)addDomains:(int64_t)a3;
- (void)addLabels:(int64_t)a3;
- (void)clearDomains;
- (void)clearLabels;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDateData:(double)a3;
- (void)setDomains:(int64_t *)a3 count:(unint64_t)a4;
- (void)setHasDateData:(BOOL)a3;
- (void)setHasReflectiveInterval:(BOOL)a3;
- (void)setHasValence:(BOOL)a3;
- (void)setLabels:(int64_t *)a3 count:(unint64_t)a4;
- (void)setReflectiveInterval:(int64_t)a3;
- (void)setValence:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryStateOfMindValue

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HKCodableSummaryStateOfMindValue;
  [(HKCodableSummaryStateOfMindValue *)&v3 dealloc];
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

- (void)setReflectiveInterval:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reflectiveInterval = a3;
}

- (void)setHasReflectiveInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReflectiveInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setValence:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_valence = a3;
}

- (void)setHasValence:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValence
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)labelsCount
{
  return self->_labels.count;
}

- (int64_t)labels
{
  return self->_labels.list;
}

- (void)clearLabels
{
}

- (void)addLabels:(int64_t)a3
{
}

- (int64_t)labelsAtIndex:(unint64_t)a3
{
  p_labels = &self->_labels;
  unint64_t count = self->_labels.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_labels->list[a3];
}

- (void)setLabels:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)domainsCount
{
  return self->_domains.count;
}

- (int64_t)domains
{
  return self->_domains.list;
}

- (void)clearDomains
{
}

- (void)addDomains:(int64_t)a3
{
}

- (int64_t)domainsAtIndex:(unint64_t)a3
{
  p_domains = &self->_domains;
  unint64_t count = self->_domains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_domains->list[a3];
}

- (void)setDomains:(int64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryStateOfMindValue;
  v4 = [(HKCodableSummaryStateOfMindValue *)&v8 description];
  v5 = [(HKCodableSummaryStateOfMindValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v9 forKey:@"dateData"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithLongLong:self->_reflectiveInterval];
  [v3 setObject:v10 forKey:@"reflectiveInterval"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_valence];
    [v3 setObject:v5 forKey:@"valence"];
  }
LABEL_5:
  v6 = PBRepeatedInt64NSArray();
  [v3 setObject:v6 forKey:@"labels"];

  uint64_t v7 = PBRepeatedInt64NSArray();
  [v3 setObject:v7 forKey:@"domains"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryStateOfMindValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v9 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v9;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
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
  id v4 = v9;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v9;
  }
LABEL_5:
  if (self->_labels.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v9;
      ++v6;
    }
    while (v6 < self->_labels.count);
  }
  p_domains = &self->_domains;
  if (p_domains->count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v9;
      ++v8;
    }
    while (v8 < p_domains->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_17:
    v4[8] = self->_reflectiveInterval;
    *((unsigned char *)v4 + 80) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v4[7] = *(void *)&self->_dateData;
  *((unsigned char *)v4 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_17;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[9] = *(void *)&self->_valence;
    *((unsigned char *)v4 + 80) |= 4u;
  }
LABEL_5:
  id v12 = v4;
  if ([(HKCodableSummaryStateOfMindValue *)self labelsCount])
  {
    [v12 clearLabels];
    unint64_t v6 = [(HKCodableSummaryStateOfMindValue *)self labelsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v12, "addLabels:", -[HKCodableSummaryStateOfMindValue labelsAtIndex:](self, "labelsAtIndex:", i));
    }
  }
  if ([(HKCodableSummaryStateOfMindValue *)self domainsCount])
  {
    [v12 clearDomains];
    unint64_t v9 = [(HKCodableSummaryStateOfMindValue *)self domainsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v12, "addDomains:", -[HKCodableSummaryStateOfMindValue domainsAtIndex:](self, "domainsAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v4 + 64) = self->_reflectiveInterval;
    *(unsigned char *)(v4 + 80) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v4 + 56) = self->_dateData;
  *(unsigned char *)(v4 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(double *)(v4 + 72) = self->_valence;
    *(unsigned char *)(v4 + 80) |= 4u;
  }
LABEL_5:
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_dateData != *((double *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_reflectiveInterval != *((void *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_valence != *((double *)v4 + 9)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedInt64IsEqual())
  {
LABEL_19:
    char IsEqual = 0;
    goto LABEL_20;
  }
  char IsEqual = PBRepeatedInt64IsEqual();
LABEL_20:

  return IsEqual;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double dateData = self->_dateData;
    double v6 = -dateData;
    if (dateData >= 0.0) {
      double v6 = self->_dateData;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_reflectiveInterval;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  if ((has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double valence = self->_valence;
  double v11 = -valence;
  if (valence >= 0.0) {
    double v11 = self->_valence;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  uint64_t v15 = v9 ^ v4 ^ v14 ^ PBRepeatedInt64Hash();
  return v15 ^ PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 80);
  if (v5)
  {
    self->_double dateData = *((double *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_reflectiveInterval = *((void *)v4 + 8);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
LABEL_4:
    self->_double valence = *((double *)v4 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v12 = v4;
  uint64_t v6 = [v4 labelsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[HKCodableSummaryStateOfMindValue addLabels:](self, "addLabels:", [v12 labelsAtIndex:i]);
  }
  uint64_t v9 = [v12 domainsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[HKCodableSummaryStateOfMindValue addDomains:](self, "addDomains:", [v12 domainsAtIndex:j]);
  }
}

- (double)dateData
{
  return self->_dateData;
}

- (int64_t)reflectiveInterval
{
  return self->_reflectiveInterval;
}

- (double)valence
{
  return self->_valence;
}

@end