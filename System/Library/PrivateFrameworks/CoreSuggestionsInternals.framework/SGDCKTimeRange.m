@interface SGDCKTimeRange
- (BOOL)floating;
- (BOOL)hasEnd;
- (BOOL)hasEndUTCOffsetSeconds;
- (BOOL)hasFloating;
- (BOOL)hasStart;
- (BOOL)hasStartUTCOffsetSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)end;
- (double)start;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)endUTCOffsetSeconds;
- (int64_t)startUTCOffsetSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnd:(double)a3;
- (void)setEndUTCOffsetSeconds:(int64_t)a3;
- (void)setFloating:(BOOL)a3;
- (void)setHasEnd:(BOOL)a3;
- (void)setHasEndUTCOffsetSeconds:(BOOL)a3;
- (void)setHasFloating:(BOOL)a3;
- (void)setHasStart:(BOOL)a3;
- (void)setHasStartUTCOffsetSeconds:(BOOL)a3;
- (void)setStart:(double)a3;
- (void)setStartUTCOffsetSeconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGDCKTimeRange

- (BOOL)floating
{
  return self->_floating;
}

- (int64_t)endUTCOffsetSeconds
{
  return self->_endUTCOffsetSeconds;
}

- (int64_t)startUTCOffsetSeconds
{
  return self->_startUTCOffsetSeconds;
}

- (double)end
{
  return self->_end;
}

- (double)start
{
  return self->_start;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_start = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_end = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_startUTCOffsetSeconds = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_endUTCOffsetSeconds = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
LABEL_6:
    self->_floating = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double start = self->_start;
    double v6 = -start;
    if (start >= 0.0) {
      double v6 = self->_start;
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
  if (has)
  {
    double end = self->_end;
    double v11 = -end;
    if (end >= 0.0) {
      double v11 = self->_end;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 8) == 0)
  {
    uint64_t v14 = 0;
    if ((has & 2) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v15 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v16 = 0;
    return v9 ^ v4 ^ v14 ^ v15 ^ v16;
  }
  uint64_t v14 = 2654435761 * self->_startUTCOffsetSeconds;
  if ((has & 2) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_endUTCOffsetSeconds;
  if ((has & 0x10) == 0) {
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v16 = 2654435761 * self->_floating;
  return v9 ^ v4 ^ v14 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_start != *((double *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_end != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_startUTCOffsetSeconds != *((void *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_endUTCOffsetSeconds != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0)
    {
LABEL_24:
      BOOL v5 = 0;
      goto LABEL_25;
    }
    if (self->_floating)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_start;
    *((unsigned char *)result + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_end;
  *((unsigned char *)result + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 4) = self->_startUTCOffsetSeconds;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 2) = self->_endUTCOffsetSeconds;
  *((unsigned char *)result + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 40) = self->_floating;
  *((unsigned char *)result + 44) |= 0x10u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_start;
    *((unsigned char *)v4 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_end;
  *((unsigned char *)v4 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[4] = self->_startUTCOffsetSeconds;
  *((unsigned char *)v4 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[2] = self->_endUTCOffsetSeconds;
  *((unsigned char *)v4 + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 40) = self->_floating;
    *((unsigned char *)v4 + 44) |= 0x10u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteSint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteSint64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKTimeRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    long double v7 = [NSNumber numberWithDouble:self->_start];
    [v3 setObject:v7 forKey:@"start"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  double v8 = [NSNumber numberWithDouble:self->_end];
  [v3 setObject:v8 forKey:@"end"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v9 = [NSNumber numberWithLongLong:self->_startUTCOffsetSeconds];
  [v3 setObject:v9 forKey:@"startUTCOffsetSeconds"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithLongLong:self->_endUTCOffsetSeconds];
  [v3 setObject:v10 forKey:@"endUTCOffsetSeconds"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    id v5 = [NSNumber numberWithBool:self->_floating];
    [v3 setObject:v5 forKey:@"floating"];
  }
LABEL_7:
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGDCKTimeRange;
  id v4 = [(SGDCKTimeRange *)&v8 description];
  id v5 = [(SGDCKTimeRange *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFloating
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasFloating:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setFloating:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_floating = a3;
}

- (BOOL)hasEndUTCOffsetSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEndUTCOffsetSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEndUTCOffsetSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endUTCOffsetSeconds = a3;
}

- (BOOL)hasStartUTCOffsetSeconds
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasStartUTCOffsetSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setStartUTCOffsetSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startUTCOffsetSeconds = a3;
}

- (BOOL)hasEnd
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEnd:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEnd:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double end = a3;
}

- (BOOL)hasStart
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasStart:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setStart:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double start = a3;
}

@end