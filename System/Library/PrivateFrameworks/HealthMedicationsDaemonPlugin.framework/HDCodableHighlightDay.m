@interface HDCodableHighlightDay
- (BOOL)hasDate;
- (BOOL)hasIsPaddedDay;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaddedDay;
- (BOOL)readFrom:(id)a3;
- (BOOL)status;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasIsPaddedDay:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIsPaddedDay:(BOOL)a3;
- (void)setStatus:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableHighlightDay

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsPaddedDay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isPaddedDay = a3;
}

- (void)setHasIsPaddedDay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPaddedDay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableHighlightDay;
  v4 = [(HDCodableHighlightDay *)&v8 description];
  v5 = [(HDCodableHighlightDay *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_date];
    [v3 setObject:v7 forKey:@"date"];

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
  objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_status];
  [v3 setObject:v8 forKey:@"status"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isPaddedDay];
    [v3 setObject:v5 forKey:@"isPaddedDay"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableHighlightDayReadFrom((uint64_t)self, (uint64_t)a3);
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
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
    v4[1] = *(void *)&self->_date;
    *((unsigned char *)v4 + 20) |= 1u;
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
  *((unsigned char *)v4 + 17) = self->_status;
  *((unsigned char *)v4 + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 16) = self->_isPaddedDay;
    *((unsigned char *)v4 + 20) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_date;
    *((unsigned char *)result + 20) |= 1u;
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
  *((unsigned char *)result + 17) = self->_status;
  *((unsigned char *)result + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 16) = self->_isPaddedDay;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_status)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_isPaddedDay)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 16))
      {
        goto LABEL_17;
      }
      BOOL v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double date = self->_date;
    double v6 = -date;
    if (date >= 0.0) {
      double v6 = self->_date;
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
    uint64_t v9 = 2654435761 * self->_status;
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
  uint64_t v10 = 2654435761 * self->_isPaddedDay;
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_status = *((unsigned char *)v4 + 17);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_4:
    self->_isPaddedDay = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (double)date
{
  return self->_date;
}

- (BOOL)status
{
  return self->_status;
}

- (BOOL)isPaddedDay
{
  return self->_isPaddedDay;
}

@end