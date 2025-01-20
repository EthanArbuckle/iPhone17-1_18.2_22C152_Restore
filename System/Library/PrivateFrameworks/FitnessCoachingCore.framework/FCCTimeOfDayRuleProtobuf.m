@interface FCCTimeOfDayRuleProtobuf
- (BOOL)hasMinimumDayDuration;
- (BOOL)hasSecondsBeforeEndOfDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)minimumDayDuration;
- (double)secondsBeforeEndOfDay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMinimumDayDuration:(BOOL)a3;
- (void)setHasSecondsBeforeEndOfDay:(BOOL)a3;
- (void)setMinimumDayDuration:(double)a3;
- (void)setSecondsBeforeEndOfDay:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCTimeOfDayRuleProtobuf

- (void)setMinimumDayDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumDayDuration = a3;
}

- (void)setHasMinimumDayDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumDayDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSecondsBeforeEndOfDay:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_secondsBeforeEndOfDay = a3;
}

- (void)setHasSecondsBeforeEndOfDay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecondsBeforeEndOfDay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCTimeOfDayRuleProtobuf;
  v4 = [(FCCTimeOfDayRuleProtobuf *)&v8 description];
  v5 = [(FCCTimeOfDayRuleProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_minimumDayDuration];
    [v3 setObject:v5 forKey:@"minimumDayDuration"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_secondsBeforeEndOfDay];
    [v3 setObject:v6 forKey:@"secondsBeforeEndOfDay"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCTimeOfDayRuleProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
    v4[1] = *(void *)&self->_minimumDayDuration;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_secondsBeforeEndOfDay;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_minimumDayDuration;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_secondsBeforeEndOfDay;
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_minimumDayDuration != *((double *)v4 + 1)) {
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
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_secondsBeforeEndOfDay != *((double *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double minimumDayDuration = self->_minimumDayDuration;
    double v6 = -minimumDayDuration;
    if (minimumDayDuration >= 0.0) {
      double v6 = self->_minimumDayDuration;
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
    double secondsBeforeEndOfDay = self->_secondsBeforeEndOfDay;
    double v11 = -secondsBeforeEndOfDay;
    if (secondsBeforeEndOfDay >= 0.0) {
      double v11 = self->_secondsBeforeEndOfDay;
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
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_double minimumDayDuration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_double secondsBeforeEndOfDay = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (double)minimumDayDuration
{
  return self->_minimumDayDuration;
}

- (double)secondsBeforeEndOfDay
{
  return self->_secondsBeforeEndOfDay;
}

@end