@interface HKCodableStateOfMindValenceDistributionData
- (BOOL)hasMaximumValence;
- (BOOL)hasMinimumValence;
- (BOOL)hasReflectiveInterval;
- (BOOL)hasSampleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)maximumValence;
- (double)minimumValence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reflectiveIntervalAsString:(int)a3;
- (int)StringAsReflectiveInterval:(id)a3;
- (int)reflectiveInterval;
- (int64_t)sampleCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaximumValence:(BOOL)a3;
- (void)setHasMinimumValence:(BOOL)a3;
- (void)setHasReflectiveInterval:(BOOL)a3;
- (void)setHasSampleCount:(BOOL)a3;
- (void)setMaximumValence:(double)a3;
- (void)setMinimumValence:(double)a3;
- (void)setReflectiveInterval:(int)a3;
- (void)setSampleCount:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableStateOfMindValenceDistributionData

- (void)setMinimumValence:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumValence = a3;
}

- (void)setHasMinimumValence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumValence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaximumValence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maximumValence = a3;
}

- (void)setHasMaximumValence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaximumValence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSampleCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sampleCount = a3;
}

- (void)setHasSampleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSampleCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)reflectiveInterval
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_reflectiveInterval;
  }
  else {
    return 1;
  }
}

- (void)setReflectiveInterval:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_reflectiveInterval = a3;
}

- (void)setHasReflectiveInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReflectiveInterval
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)reflectiveIntervalAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"momentary";
  }
  else if (a3 == 2)
  {
    v4 = @"daily";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsReflectiveInterval:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"momentary"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"daily"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableStateOfMindValenceDistributionData;
  int v4 = [(HKCodableStateOfMindValenceDistributionData *)&v8 description];
  v5 = [(HKCodableStateOfMindValenceDistributionData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_minimumValence];
    [v3 setObject:v5 forKey:@"minimumValence"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      v7 = [NSNumber numberWithLongLong:self->_sampleCount];
      [v3 setObject:v7 forKey:@"sampleCount"];

      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_15;
      }
LABEL_9:
      int reflectiveInterval = self->_reflectiveInterval;
      if (reflectiveInterval == 1)
      {
        v9 = @"momentary";
      }
      else if (reflectiveInterval == 2)
      {
        v9 = @"daily";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reflectiveInterval);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v3 setObject:v9 forKey:@"reflectiveInterval"];

      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithDouble:self->_maximumValence];
  [v3 setObject:v6 forKey:@"maximumValence"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_15:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableStateOfMindValenceDistributionDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_minimumValence;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_maximumValence;
  *((unsigned char *)v4 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[3] = self->_sampleCount;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 8) = self->_reflectiveInterval;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_minimumValence;
    *((unsigned char *)result + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_maximumValence;
  *((unsigned char *)result + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 3) = self->_sampleCount;
  *((unsigned char *)result + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 8) = self->_reflectiveInterval;
  *((unsigned char *)result + 36) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_minimumValence != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_maximumValence != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_sampleCount != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_reflectiveInterval != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double minimumValence = self->_minimumValence;
    double v6 = -minimumValence;
    if (minimumValence >= 0.0) {
      double v6 = self->_minimumValence;
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
    double maximumValence = self->_maximumValence;
    double v11 = -maximumValence;
    if (maximumValence >= 0.0) {
      double v11 = self->_maximumValence;
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
  if ((has & 4) != 0)
  {
    uint64_t v14 = 2654435761 * self->_sampleCount;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v15 = 0;
    return v9 ^ v4 ^ v14 ^ v15;
  }
  uint64_t v14 = 0;
  if ((has & 8) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_reflectiveInterval;
  return v9 ^ v4 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_double minimumValence = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double maximumValence = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_sampleCount = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_5:
    self->_int reflectiveInterval = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
}

- (double)minimumValence
{
  return self->_minimumValence;
}

- (double)maximumValence
{
  return self->_maximumValence;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

@end