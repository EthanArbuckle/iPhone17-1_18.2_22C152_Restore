@interface HKCodableSummarySleepDurationValue
- (BOOL)hasAsleepDuration;
- (BOOL)hasEndOfSleepTimeIntervalSinceReferenceDate;
- (BOOL)hasInBedDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)asleepDuration;
- (double)endOfSleepTimeIntervalSinceReferenceDate;
- (double)inBedDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsleepDuration:(double)a3;
- (void)setEndOfSleepTimeIntervalSinceReferenceDate:(double)a3;
- (void)setHasAsleepDuration:(BOOL)a3;
- (void)setHasEndOfSleepTimeIntervalSinceReferenceDate:(BOOL)a3;
- (void)setHasInBedDuration:(BOOL)a3;
- (void)setInBedDuration:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummarySleepDurationValue

- (void)setInBedDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_inBedDuration = a3;
}

- (void)setHasInBedDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInBedDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAsleepDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_asleepDuration = a3;
}

- (void)setHasAsleepDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsleepDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEndOfSleepTimeIntervalSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endOfSleepTimeIntervalSinceReferenceDate = a3;
}

- (void)setHasEndOfSleepTimeIntervalSinceReferenceDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndOfSleepTimeIntervalSinceReferenceDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummarySleepDurationValue;
  v4 = [(HKCodableSummarySleepDurationValue *)&v8 description];
  v5 = [(HKCodableSummarySleepDurationValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_inBedDuration];
    [v3 setObject:v7 forKey:@"inBedDuration"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_asleepDuration];
  [v3 setObject:v8 forKey:@"asleepDuration"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_endOfSleepTimeIntervalSinceReferenceDate];
    [v3 setObject:v5 forKey:@"endOfSleepTimeIntervalSinceReferenceDate"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummarySleepDurationValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_inBedDuration;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_asleepDuration;
  *((unsigned char *)v4 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[2] = *(void *)&self->_endOfSleepTimeIntervalSinceReferenceDate;
    *((unsigned char *)v4 + 32) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_inBedDuration;
    *((unsigned char *)result + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_asleepDuration;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 2) = *(void *)&self->_endOfSleepTimeIntervalSinceReferenceDate;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_inBedDuration != *((double *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_asleepDuration != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_endOfSleepTimeIntervalSinceReferenceDate != *((double *)v4 + 2)) {
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
  if ((has & 4) != 0)
  {
    double inBedDuration = self->_inBedDuration;
    double v6 = -inBedDuration;
    if (inBedDuration >= 0.0) {
      double v6 = self->_inBedDuration;
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
    double asleepDuration = self->_asleepDuration;
    double v11 = -asleepDuration;
    if (asleepDuration >= 0.0) {
      double v11 = self->_asleepDuration;
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
  if ((has & 2) != 0)
  {
    double endOfSleepTimeIntervalSinceReferenceDate = self->_endOfSleepTimeIntervalSinceReferenceDate;
    double v16 = -endOfSleepTimeIntervalSinceReferenceDate;
    if (endOfSleepTimeIntervalSinceReferenceDate >= 0.0) {
      double v16 = self->_endOfSleepTimeIntervalSinceReferenceDate;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_double inBedDuration = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double asleepDuration = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_4:
    self->_double endOfSleepTimeIntervalSinceReferenceDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (double)inBedDuration
{
  return self->_inBedDuration;
}

- (double)asleepDuration
{
  return self->_asleepDuration;
}

- (double)endOfSleepTimeIntervalSinceReferenceDate
{
  return self->_endOfSleepTimeIntervalSinceReferenceDate;
}

@end