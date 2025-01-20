@interface HDCodableWorkoutStatistics
- (BOOL)hasAvgQuantity;
- (BOOL)hasMaxQuantity;
- (BOOL)hasMinQuantity;
- (BOOL)hasQuantityType;
- (BOOL)hasSumQuantity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)avgQuantity;
- (double)maxQuantity;
- (double)minQuantity;
- (double)sumQuantity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)quantityType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgQuantity:(double)a3;
- (void)setHasAvgQuantity:(BOOL)a3;
- (void)setHasMaxQuantity:(BOOL)a3;
- (void)setHasMinQuantity:(BOOL)a3;
- (void)setHasQuantityType:(BOOL)a3;
- (void)setHasSumQuantity:(BOOL)a3;
- (void)setMaxQuantity:(double)a3;
- (void)setMinQuantity:(double)a3;
- (void)setQuantityType:(int64_t)a3;
- (void)setSumQuantity:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutStatistics

- (void)setQuantityType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_quantityType = a3;
}

- (void)setHasQuantityType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQuantityType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSumQuantity:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sumQuantity = a3;
}

- (void)setHasSumQuantity:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSumQuantity
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMinQuantity:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minQuantity = a3;
}

- (void)setHasMinQuantity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinQuantity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMaxQuantity:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxQuantity = a3;
}

- (void)setHasMaxQuantity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxQuantity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAvgQuantity:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_avgQuantity = a3;
}

- (void)setHasAvgQuantity:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvgQuantity
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutStatistics;
  v4 = [(HDCodableWorkoutStatistics *)&v8 description];
  v5 = [(HDCodableWorkoutStatistics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_quantityType];
    [v3 setObject:v7 forKey:@"quantityType"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_sumQuantity];
  [v3 setObject:v8 forKey:@"sumQuantity"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithDouble:self->_minQuantity];
  [v3 setObject:v9 forKey:@"minQuantity"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithDouble:self->_maxQuantity];
  [v3 setObject:v10 forKey:@"maxQuantity"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v5 = [NSNumber numberWithDouble:self->_avgQuantity];
    [v3 setObject:v5 forKey:@"avgQuantity"];
  }
LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_quantityType;
    *((unsigned char *)v4 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(void *)&self->_sumQuantity;
  *((unsigned char *)v4 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[3] = *(void *)&self->_minQuantity;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[2] = *(void *)&self->_maxQuantity;
  *((unsigned char *)v4 + 48) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v4[1] = *(void *)&self->_avgQuantity;
    *((unsigned char *)v4 + 48) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)result + 4) = self->_quantityType;
    *((unsigned char *)result + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 5) = *(void *)&self->_sumQuantity;
  *((unsigned char *)result + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 3) = *(void *)&self->_minQuantity;
  *((unsigned char *)result + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 2) = *(void *)&self->_maxQuantity;
  *((unsigned char *)result + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 1) = *(void *)&self->_avgQuantity;
  *((unsigned char *)result + 48) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_quantityType != *((void *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_sumQuantity != *((double *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_minQuantity != *((double *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_maxQuantity != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_avgQuantity != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_quantityType;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double sumQuantity = self->_sumQuantity;
  double v6 = -sumQuantity;
  if (sumQuantity >= 0.0) {
    double v6 = self->_sumQuantity;
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
LABEL_11:
  if ((has & 4) != 0)
  {
    double minQuantity = self->_minQuantity;
    double v12 = -minQuantity;
    if (minQuantity >= 0.0) {
      double v12 = self->_minQuantity;
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
  if ((has & 2) != 0)
  {
    double maxQuantity = self->_maxQuantity;
    double v17 = -maxQuantity;
    if (maxQuantity >= 0.0) {
      double v17 = self->_maxQuantity;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if (has)
  {
    double avgQuantity = self->_avgQuantity;
    double v22 = -avgQuantity;
    if (avgQuantity >= 0.0) {
      double v22 = self->_avgQuantity;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) != 0)
  {
    self->_quantityType = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double sumQuantity = *((double *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_double minQuantity = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_double maxQuantity = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 48))
  {
LABEL_6:
    self->_double avgQuantity = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
}

- (int64_t)quantityType
{
  return self->_quantityType;
}

- (double)sumQuantity
{
  return self->_sumQuantity;
}

- (double)minQuantity
{
  return self->_minQuantity;
}

- (double)maxQuantity
{
  return self->_maxQuantity;
}

- (double)avgQuantity
{
  return self->_avgQuantity;
}

@end