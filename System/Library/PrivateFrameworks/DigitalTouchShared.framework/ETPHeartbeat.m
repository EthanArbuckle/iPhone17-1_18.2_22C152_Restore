@interface ETPHeartbeat
- (BOOL)hasBeatsPerMinute;
- (BOOL)hasDuration;
- (BOOL)hasHeartbreakTime;
- (BOOL)hasNormalizedCenterX;
- (BOOL)hasNormalizedCenterY;
- (BOOL)hasRotation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)beatsPerMinute;
- (float)heartbreakTime;
- (float)normalizedCenterX;
- (float)normalizedCenterY;
- (float)rotation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)duration;
- (void)mergeFrom:(id)a3;
- (void)setBeatsPerMinute:(float)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasBeatsPerMinute:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHeartbreakTime:(BOOL)a3;
- (void)setHasNormalizedCenterX:(BOOL)a3;
- (void)setHasNormalizedCenterY:(BOOL)a3;
- (void)setHasRotation:(BOOL)a3;
- (void)setHeartbreakTime:(float)a3;
- (void)setNormalizedCenterX:(float)a3;
- (void)setNormalizedCenterY:(float)a3;
- (void)setRotation:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ETPHeartbeat

- (void)setBeatsPerMinute:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_beatsPerMinute = a3;
}

- (void)setHasBeatsPerMinute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBeatsPerMinute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNormalizedCenterX:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_normalizedCenterX = a3;
}

- (void)setHasNormalizedCenterX:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNormalizedCenterX
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNormalizedCenterY:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_normalizedCenterY = a3;
}

- (void)setHasNormalizedCenterY:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNormalizedCenterY
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRotation:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rotation = a3;
}

- (void)setHasRotation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRotation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHeartbreakTime:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_heartbreakTime = a3;
}

- (void)setHasHeartbreakTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHeartbreakTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ETPHeartbeat;
  v4 = [(ETPHeartbeat *)&v8 description];
  v5 = [(ETPHeartbeat *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v4 = self->_beatsPerMinute;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"beatsPerMinute"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v9 forKey:@"duration"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(float *)&double v4 = self->_normalizedCenterX;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"normalizedCenterX"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(float *)&double v4 = self->_normalizedCenterY;
  v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"normalizedCenterY"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *(float *)&double v4 = self->_rotation;
  v12 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"rotation"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *(float *)&double v4 = self->_heartbreakTime;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"heartbreakTime"];
  }
LABEL_8:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPHeartbeatReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_7:
  }
    PBDataWriterWriteFloatField();
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_beatsPerMinute);
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_duration;
  *((unsigned char *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 5) = LODWORD(self->_normalizedCenterX);
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = LODWORD(self->_normalizedCenterY);
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = LODWORD(self->_rotation);
  *((unsigned char *)result + 32) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 4) = LODWORD(self->_heartbreakTime);
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_beatsPerMinute != *((float *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_normalizedCenterX != *((float *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_normalizedCenterY != *((float *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0 || self->_rotation != *((float *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_heartbreakTime != *((float *)v4 + 4)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float beatsPerMinute = self->_beatsPerMinute;
    double v6 = beatsPerMinute;
    if (beatsPerMinute < 0.0) {
      double v6 = -beatsPerMinute;
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
    uint64_t v9 = 2654435761 * self->_duration;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  if ((has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  float normalizedCenterX = self->_normalizedCenterX;
  double v11 = normalizedCenterX;
  if (normalizedCenterX < 0.0) {
    double v11 = -normalizedCenterX;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 0x10) != 0)
  {
    float normalizedCenterY = self->_normalizedCenterY;
    double v17 = normalizedCenterY;
    if (normalizedCenterY < 0.0) {
      double v17 = -normalizedCenterY;
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
  if ((has & 0x20) != 0)
  {
    float rotation = self->_rotation;
    double v22 = rotation;
    if (rotation < 0.0) {
      double v22 = -rotation;
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
  if ((has & 4) != 0)
  {
    float heartbreakTime = self->_heartbreakTime;
    double v27 = heartbreakTime;
    if (heartbreakTime < 0.0) {
      double v27 = -heartbreakTime;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v15 ^ v20 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_float beatsPerMinute = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_float normalizedCenterX = *((float *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_float normalizedCenterY = *((float *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_float rotation = *((float *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_7:
    self->_float heartbreakTime = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_8:
}

- (float)beatsPerMinute
{
  return self->_beatsPerMinute;
}

- (unsigned)duration
{
  return self->_duration;
}

- (float)normalizedCenterX
{
  return self->_normalizedCenterX;
}

- (float)normalizedCenterY
{
  return self->_normalizedCenterY;
}

- (float)rotation
{
  return self->_rotation;
}

- (float)heartbreakTime
{
  return self->_heartbreakTime;
}

@end