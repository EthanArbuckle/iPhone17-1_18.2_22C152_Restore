@interface ETPAnger
- (BOOL)hasDelays;
- (BOOL)hasDuration;
- (BOOL)hasNormalizedCenterX;
- (BOOL)hasNormalizedCenterY;
- (BOOL)hasPoints;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)delays;
- (NSData)points;
- (float)duration;
- (float)normalizedCenterX;
- (float)normalizedCenterY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDelays:(id)a3;
- (void)setDuration:(float)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasNormalizedCenterX:(BOOL)a3;
- (void)setHasNormalizedCenterY:(BOOL)a3;
- (void)setNormalizedCenterX:(float)a3;
- (void)setNormalizedCenterY:(float)a3;
- (void)setPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ETPAnger

- (void)setDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNormalizedCenterX:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_normalizedCenterX = a3;
}

- (void)setHasNormalizedCenterX:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNormalizedCenterX
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNormalizedCenterY:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_normalizedCenterY = a3;
}

- (void)setHasNormalizedCenterY:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNormalizedCenterY
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasDelays
{
  return self->_delays != 0;
}

- (BOOL)hasPoints
{
  return self->_points != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ETPAnger;
  v4 = [(ETPAnger *)&v8 description];
  v5 = [(ETPAnger *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v4 = self->_duration;
    v10 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v10 forKey:@"duration"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_normalizedCenterX;
  v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"normalizedCenterX"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(float *)&double v4 = self->_normalizedCenterY;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"normalizedCenterY"];
  }
LABEL_5:
  delays = self->_delays;
  if (delays) {
    [v3 setObject:delays forKey:@"delays"];
  }
  points = self->_points;
  if (points) {
    [v3 setObject:points forKey:@"points"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPAngerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_delays)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_points)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(float *)(v5 + 20) = self->_normalizedCenterX;
    *(unsigned char *)(v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(float *)(v5 + 16) = self->_duration;
  *(unsigned char *)(v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(float *)(v5 + 24) = self->_normalizedCenterY;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_delays copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  uint64_t v10 = [(NSData *)self->_points copyWithZone:a3];
  v11 = (void *)v6[4];
  v6[4] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_duration != *((float *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_normalizedCenterX != *((float *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_normalizedCenterY != *((float *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  delays = self->_delays;
  if ((unint64_t)delays | *((void *)v4 + 1) && !-[NSData isEqual:](delays, "isEqual:")) {
    goto LABEL_21;
  }
  points = self->_points;
  if ((unint64_t)points | *((void *)v4 + 4)) {
    char v7 = -[NSData isEqual:](points, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float duration = self->_duration;
    double v6 = duration;
    if (duration < 0.0) {
      double v6 = -duration;
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
    float normalizedCenterX = self->_normalizedCenterX;
    double v11 = normalizedCenterX;
    if (normalizedCenterX < 0.0) {
      double v11 = -normalizedCenterX;
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
    float normalizedCenterY = self->_normalizedCenterY;
    double v16 = normalizedCenterY;
    if (normalizedCenterY < 0.0) {
      double v16 = -normalizedCenterY;
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
  uint64_t v19 = v9 ^ v4 ^ v14 ^ [(NSData *)self->_delays hash];
  return v19 ^ [(NSData *)self->_points hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_float duration = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_float normalizedCenterX = *((float *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_float normalizedCenterY = *((float *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[ETPAnger setDelays:](self, "setDelays:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[ETPAnger setPoints:](self, "setPoints:");
    id v4 = v6;
  }
}

- (float)duration
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

- (NSData)delays
{
  return self->_delays;
}

- (void)setDelays:(id)a3
{
}

- (NSData)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);

  objc_storeStrong((id *)&self->_delays, 0);
}

@end