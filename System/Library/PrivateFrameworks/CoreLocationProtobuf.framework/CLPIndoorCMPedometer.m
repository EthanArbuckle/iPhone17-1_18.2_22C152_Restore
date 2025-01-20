@interface CLPIndoorCMPedometer
- (BOOL)hasActiveTime;
- (BOOL)hasDistance;
- (BOOL)hasFirstStepTime;
- (BOOL)hasFloorsAscended;
- (BOOL)hasFloorsDescended;
- (BOOL)hasNumberOfSteps;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)firstStepTime;
- (double)timestamp;
- (float)activeTime;
- (float)distance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)floorsAscended;
- (int)floorsDescended;
- (int)numberOfSteps;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTime:(float)a3;
- (void)setDistance:(float)a3;
- (void)setFirstStepTime:(double)a3;
- (void)setFloorsAscended:(int)a3;
- (void)setFloorsDescended:(int)a3;
- (void)setHasActiveTime:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasFirstStepTime:(BOOL)a3;
- (void)setHasFloorsAscended:(BOOL)a3;
- (void)setHasFloorsDescended:(BOOL)a3;
- (void)setHasNumberOfSteps:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumberOfSteps:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPIndoorCMPedometer

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDistance:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDistance
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumberOfSteps:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_numberOfSteps = a3;
}

- (void)setHasNumberOfSteps:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfSteps
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setFloorsAscended:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_floorsAscended = a3;
}

- (void)setHasFloorsAscended:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFloorsAscended
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFloorsDescended:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_floorsDescended = a3;
}

- (void)setHasFloorsDescended:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFloorsDescended
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setFirstStepTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_firstStepTime = a3;
}

- (void)setHasFirstStepTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstStepTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setActiveTime:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_activeTime = a3;
}

- (void)setHasActiveTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActiveTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPIndoorCMPedometer;
  v4 = [(CLPIndoorCMPedometer *)&v8 description];
  v5 = [(CLPIndoorCMPedometer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_distance;
  v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"distance"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = [NSNumber numberWithInt:self->_numberOfSteps];
  [v3 setObject:v10 forKey:@"numberOfSteps"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = [NSNumber numberWithInt:self->_floorsAscended];
  [v3 setObject:v11 forKey:@"floorsAscended"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = [NSNumber numberWithInt:self->_floorsDescended];
  [v3 setObject:v12 forKey:@"floorsDescended"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v13 = [NSNumber numberWithDouble:self->_firstStepTime];
  [v3 setObject:v13 forKey:@"firstStepTime"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *(float *)&double v4 = self->_activeTime;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"activeTime"];
  }
LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorCMPedometerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_8:
  }
    PBDataWriterWriteFloatField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = LODWORD(self->_distance);
  *((unsigned char *)v4 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 10) = self->_numberOfSteps;
  *((unsigned char *)v4 + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 8) = self->_floorsAscended;
  *((unsigned char *)v4 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 9) = self->_floorsDescended;
  *((unsigned char *)v4 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[1] = *(void *)&self->_firstStepTime;
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 6) = LODWORD(self->_activeTime);
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = LODWORD(self->_distance);
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 10) = self->_numberOfSteps;
  *((unsigned char *)result + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_floorsAscended;
  *((unsigned char *)result + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 9) = self->_floorsDescended;
  *((unsigned char *)result + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((void *)result + 1) = *(void *)&self->_firstStepTime;
  *((unsigned char *)result + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 6) = LODWORD(self->_activeTime);
  *((unsigned char *)result + 44) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_distance != *((float *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x40) == 0 || self->_numberOfSteps != *((_DWORD *)v4 + 10)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_floorsAscended != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0 || self->_floorsDescended != *((_DWORD *)v4 + 9)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_firstStepTime != *((double *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_activeTime != *((float *)v4 + 6)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
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
  if ((has & 8) != 0)
  {
    float distance = self->_distance;
    float v11 = -distance;
    if (distance >= 0.0) {
      float v11 = self->_distance;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x40) != 0)
  {
    uint64_t v14 = 2654435761 * self->_numberOfSteps;
    if ((has & 0x10) != 0)
    {
LABEL_19:
      uint64_t v15 = 2654435761 * self->_floorsAscended;
      if ((has & 0x20) != 0) {
        goto LABEL_20;
      }
LABEL_27:
      uint64_t v16 = 0;
      if (has) {
        goto LABEL_21;
      }
LABEL_28:
      unint64_t v21 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v15 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_27;
  }
LABEL_20:
  uint64_t v16 = 2654435761 * self->_floorsDescended;
  if ((has & 1) == 0) {
    goto LABEL_28;
  }
LABEL_21:
  double firstStepTime = self->_firstStepTime;
  double v18 = -firstStepTime;
  if (firstStepTime >= 0.0) {
    double v18 = self->_firstStepTime;
  }
  long double v19 = floor(v18 + 0.5);
  double v20 = (v18 - v19) * 1.84467441e19;
  unint64_t v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
  if (v20 >= 0.0)
  {
    if (v20 > 0.0) {
      v21 += (unint64_t)v20;
    }
  }
  else
  {
    v21 -= (unint64_t)fabs(v20);
  }
LABEL_31:
  if ((has & 4) != 0)
  {
    float activeTime = self->_activeTime;
    float v24 = -activeTime;
    if (activeTime >= 0.0) {
      float v24 = self->_activeTime;
    }
    float v25 = floorf(v24 + 0.5);
    float v26 = (float)(v24 - v25) * 1.8447e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmodf(v25, 1.8447e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabsf(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_double timestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_float distance = *((float *)v4 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_numberOfSteps = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_floorsAscended = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_floorsDescended = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_double firstStepTime = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_8:
    self->_float activeTime = *((float *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_9:
}

- (double)timestamp
{
  return self->_timestamp;
}

- (float)distance
{
  return self->_distance;
}

- (int)numberOfSteps
{
  return self->_numberOfSteps;
}

- (int)floorsAscended
{
  return self->_floorsAscended;
}

- (int)floorsDescended
{
  return self->_floorsDescended;
}

- (double)firstStepTime
{
  return self->_firstStepTime;
}

- (float)activeTime
{
  return self->_activeTime;
}

@end