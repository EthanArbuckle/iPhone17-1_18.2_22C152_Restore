@interface CLPInertialOdometry
- (BOOL)hasDeltaPositionX;
- (BOOL)hasDeltaPositionY;
- (BOOL)hasDeltaPositionZ;
- (BOOL)hasDeltaVelocityX;
- (BOOL)hasDeltaVelocityY;
- (BOOL)hasDeltaVelocityZ;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)deltaPositionX;
- (double)deltaPositionY;
- (double)deltaPositionZ;
- (double)deltaVelocityX;
- (double)deltaVelocityY;
- (double)deltaVelocityZ;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeltaPositionX:(double)a3;
- (void)setDeltaPositionY:(double)a3;
- (void)setDeltaPositionZ:(double)a3;
- (void)setDeltaVelocityX:(double)a3;
- (void)setDeltaVelocityY:(double)a3;
- (void)setDeltaVelocityZ:(double)a3;
- (void)setHasDeltaPositionX:(BOOL)a3;
- (void)setHasDeltaPositionY:(BOOL)a3;
- (void)setHasDeltaPositionZ:(BOOL)a3;
- (void)setHasDeltaVelocityX:(BOOL)a3;
- (void)setHasDeltaVelocityY:(BOOL)a3;
- (void)setHasDeltaVelocityZ:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInertialOdometry

- (double)timestamp
{
  return self->_timestamp;
}

- (double)deltaPositionY
{
  return self->_deltaPositionY;
}

- (double)deltaPositionX
{
  return self->_deltaPositionX;
}

- (BOOL)hasDeltaPositionY
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasDeltaPositionX
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_timestamp = a3;
}

- (void)setDeltaVelocityZ:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_deltaVelocityZ = a3;
}

- (void)setDeltaVelocityY:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_deltaVelocityY = a3;
}

- (void)setDeltaVelocityX:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deltaVelocityX = a3;
}

- (void)setDeltaPositionZ:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deltaPositionZ = a3;
}

- (void)setDeltaPositionY:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deltaPositionY = a3;
}

- (void)setDeltaPositionX:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deltaPositionX = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasDeltaPositionX:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setHasDeltaPositionY:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHasDeltaPositionZ:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeltaPositionZ
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDeltaVelocityX:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeltaVelocityX
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasDeltaVelocityY:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeltaVelocityY
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasDeltaVelocityZ:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDeltaVelocityZ
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPInertialOdometry;
  v4 = [(CLPInertialOdometry *)&v8 description];
  id v5 = [(CLPInertialOdometry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_deltaPositionX];
  [v3 setObject:v8 forKey:@"deltaPositionX"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = [NSNumber numberWithDouble:self->_deltaPositionY];
  [v3 setObject:v9 forKey:@"deltaPositionY"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = [NSNumber numberWithDouble:self->_deltaPositionZ];
  [v3 setObject:v10 forKey:@"deltaPositionZ"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = [NSNumber numberWithDouble:self->_deltaVelocityX];
  [v3 setObject:v11 forKey:@"deltaVelocityX"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = [NSNumber numberWithDouble:self->_deltaVelocityY];
  [v3 setObject:v12 forKey:@"deltaVelocityY"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    id v5 = [NSNumber numberWithDouble:self->_deltaVelocityZ];
    [v3 setObject:v5 forKey:@"deltaVelocityZ"];
  }
LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPInertialOdometryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[7] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 64) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_deltaPositionX;
  *((unsigned char *)v4 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[2] = *(void *)&self->_deltaPositionY;
  *((unsigned char *)v4 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[3] = *(void *)&self->_deltaPositionZ;
  *((unsigned char *)v4 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[4] = *(void *)&self->_deltaVelocityX;
  *((unsigned char *)v4 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[5] = *(void *)&self->_deltaVelocityY;
  *((unsigned char *)v4 + 64) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v4[6] = *(void *)&self->_deltaVelocityZ;
    *((unsigned char *)v4 + 64) |= 0x20u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((void *)result + 7) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 64) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_deltaPositionX;
  *((unsigned char *)result + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 2) = *(void *)&self->_deltaPositionY;
  *((unsigned char *)result + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 3) = *(void *)&self->_deltaPositionZ;
  *((unsigned char *)result + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 4) = *(void *)&self->_deltaVelocityX;
  *((unsigned char *)result + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((void *)result + 5) = *(void *)&self->_deltaVelocityY;
  *((unsigned char *)result + 64) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_8:
  *((void *)result + 6) = *(void *)&self->_deltaVelocityZ;
  *((unsigned char *)result + 64) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x40) == 0 || self->_timestamp != *((double *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x40) != 0)
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_deltaPositionX != *((double *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_deltaPositionY != *((double *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_deltaPositionZ != *((double *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_deltaVelocityX != *((double *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_deltaVelocityY != *((double *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 64) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0 || self->_deltaVelocityZ != *((double *)v4 + 6)) {
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
  if ((has & 0x40) != 0)
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
  if (has)
  {
    double deltaPositionX = self->_deltaPositionX;
    double v11 = -deltaPositionX;
    if (deltaPositionX >= 0.0) {
      double v11 = self->_deltaPositionX;
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
    double deltaPositionY = self->_deltaPositionY;
    double v16 = -deltaPositionY;
    if (deltaPositionY >= 0.0) {
      double v16 = self->_deltaPositionY;
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
  if ((has & 4) != 0)
  {
    double deltaPositionZ = self->_deltaPositionZ;
    double v21 = -deltaPositionZ;
    if (deltaPositionZ >= 0.0) {
      double v21 = self->_deltaPositionZ;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 8) != 0)
  {
    double deltaVelocityX = self->_deltaVelocityX;
    double v26 = -deltaVelocityX;
    if (deltaVelocityX >= 0.0) {
      double v26 = self->_deltaVelocityX;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double deltaVelocityY = self->_deltaVelocityY;
    double v31 = -deltaVelocityY;
    if (deltaVelocityY >= 0.0) {
      double v31 = self->_deltaVelocityY;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double deltaVelocityZ = self->_deltaVelocityZ;
    double v36 = -deltaVelocityZ;
    if (deltaVelocityZ >= 0.0) {
      double v36 = self->_deltaVelocityZ;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 0x40) != 0)
  {
    self->_double timestamp = *((double *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = *((unsigned char *)v4 + 64);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double deltaPositionX = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double deltaPositionY = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_double deltaPositionZ = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_double deltaVelocityX = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_double deltaVelocityY = *((double *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
LABEL_8:
    self->_double deltaVelocityZ = *((double *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_9:
}

- (double)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (double)deltaVelocityX
{
  return self->_deltaVelocityX;
}

- (double)deltaVelocityY
{
  return self->_deltaVelocityY;
}

- (double)deltaVelocityZ
{
  return self->_deltaVelocityZ;
}

@end