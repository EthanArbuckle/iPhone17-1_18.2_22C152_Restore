@interface HKCodableSummaryGAD7AssessmentValue
- (BOOL)hasDateData;
- (BOOL)hasRisk;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)dateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)risk;
- (int64_t)score;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateData:(double)a3;
- (void)setHasDateData:(BOOL)a3;
- (void)setHasRisk:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setRisk:(int64_t)a3;
- (void)setScore:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryGAD7AssessmentValue

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

- (void)setScore:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRisk:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_risk = a3;
}

- (void)setHasRisk:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRisk
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryGAD7AssessmentValue;
  v4 = [(HKCodableSummaryGAD7AssessmentValue *)&v8 description];
  v5 = [(HKCodableSummaryGAD7AssessmentValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v7 forKey:@"dateData"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithLongLong:self->_score];
  [v3 setObject:v8 forKey:@"score"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_risk];
    [v3 setObject:v5 forKey:@"risk"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryGAD7AssessmentValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_dateData;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_score;
  *((unsigned char *)v4 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[2] = self->_risk;
    *((unsigned char *)v4 + 32) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_dateData;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = self->_score;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 2) = self->_risk;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_dateData != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_score != *((void *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_risk != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
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
  if ((has & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_score;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v10 = 0;
    return v9 ^ v4 ^ v10;
  }
  uint64_t v9 = 0;
  if ((has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_risk;
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_double dateData = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_score = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_4:
    self->_risk = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (double)dateData
{
  return self->_dateData;
}

- (int64_t)score
{
  return self->_score;
}

- (int64_t)risk
{
  return self->_risk;
}

@end