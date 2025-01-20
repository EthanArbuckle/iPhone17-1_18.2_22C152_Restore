@interface HMSoftwareUpdateEventProtoSoftwareUpdateProgress
- (BOOL)hasEstimatedTimeRemaining;
- (BOOL)hasPercentageComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)estimatedTimeRemaining;
- (float)percentageComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEstimatedTimeRemaining:(double)a3;
- (void)setHasEstimatedTimeRemaining:(BOOL)a3;
- (void)setHasPercentageComplete:(BOOL)a3;
- (void)setPercentageComplete:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMSoftwareUpdateEventProtoSoftwareUpdateProgress

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_percentageComplete = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if (v5)
  {
    self->_estimatedTimeRemaining = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float percentageComplete = self->_percentageComplete;
    float v6 = -percentageComplete;
    if (percentageComplete >= 0.0) {
      float v6 = self->_percentageComplete;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double estimatedTimeRemaining = self->_estimatedTimeRemaining;
    double v11 = -estimatedTimeRemaining;
    if (estimatedTimeRemaining >= 0.0) {
      double v11 = self->_estimatedTimeRemaining;
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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_percentageComplete != *((float *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_estimatedTimeRemaining != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = LODWORD(self->_percentageComplete);
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_estimatedTimeRemaining;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = LODWORD(self->_percentageComplete);
    *((unsigned char *)v4 + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_estimatedTimeRemaining;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMSoftwareUpdateEventProtoSoftwareUpdateProgressReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_percentageComplete;
    id v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"percentageComplete"];

    char has = (char)self->_has;
  }
  if (has)
  {
    float v7 = [NSNumber numberWithDouble:self->_estimatedTimeRemaining];
    [v3 setObject:v7 forKey:@"estimatedTimeRemaining"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMSoftwareUpdateEventProtoSoftwareUpdateProgress;
  double v4 = [(HMSoftwareUpdateEventProtoSoftwareUpdateProgress *)&v8 description];
  BOOL v5 = [(HMSoftwareUpdateEventProtoSoftwareUpdateProgress *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEstimatedTimeRemaining
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEstimatedTimeRemaining:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double estimatedTimeRemaining = a3;
}

- (BOOL)hasPercentageComplete
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPercentageComplete:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPercentageComplete:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float percentageComplete = a3;
}

@end