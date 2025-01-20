@interface CLPIndoorCMAttitude
- (BOOL)hasMagneticAccuracy;
- (BOOL)hasMagneticCalibration;
- (BOOL)hasQuaternion;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPQuaternion)quaternion;
- (double)timestamp;
- (float)magneticAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)magneticCalibrationAsString:(int)a3;
- (int)StringAsMagneticCalibration:(id)a3;
- (int)magneticCalibration;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMagneticAccuracy:(BOOL)a3;
- (void)setHasMagneticCalibration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMagneticAccuracy:(float)a3;
- (void)setMagneticCalibration:(int)a3;
- (void)setQuaternion:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPIndoorCMAttitude

- (CLPQuaternion)quaternion
{
  return self->_quaternion;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setQuaternion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setMagneticCalibration:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_magneticCalibration = a3;
}

- (void)setMagneticAccuracy:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_magneticAccuracy = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_quaternion) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasQuaternion
{
  return self->_quaternion != 0;
}

- (void)setHasMagneticAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMagneticAccuracy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)magneticCalibration
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_magneticCalibration;
  }
  else {
    return -1;
  }
}

- (void)setHasMagneticCalibration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMagneticCalibration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)magneticCalibrationAsString:(int)a3
{
  if ((a3 + 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C35E40[a3 + 1];
  }

  return v3;
}

- (int)StringAsMagneticCalibration:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"Unreliable"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"_2DWeak"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"_2DStrong"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"_3DWeak"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"_3D"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"_3DStrong"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Max"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPIndoorCMAttitude;
  int v4 = [(CLPIndoorCMAttitude *)&v8 description];
  id v5 = [(CLPIndoorCMAttitude *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v5 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
  quaternion = self->_quaternion;
  if (quaternion)
  {
    v7 = [(CLPQuaternion *)quaternion dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"quaternion"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_magneticAccuracy;
    v9 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v9 forKey:@"magneticAccuracy"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    unsigned int v10 = self->_magneticCalibration + 1;
    if (v10 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_magneticCalibration);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E6C35E40[v10];
    }
    [v3 setObject:v11 forKey:@"magneticCalibration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorCMAttitudeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_quaternion)
  {
    v6 = v4;
    objc_msgSend(v4, "setQuaternion:");
    double v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_magneticAccuracy);
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_magneticCalibration;
    *((unsigned char *)v4 + 32) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(CLPQuaternion *)self->_quaternion copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v6 + 16) = self->_magneticAccuracy;
    *(unsigned char *)(v6 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_magneticCalibration;
    *(unsigned char *)(v6 + 32) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  quaternion = self->_quaternion;
  if ((unint64_t)quaternion | *((void *)v4 + 3))
  {
    if (!-[CLPQuaternion isEqual:](quaternion, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_magneticAccuracy != *((float *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_magneticCalibration != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v5 = -timestamp;
    if (timestamp >= 0.0) {
      double v5 = self->_timestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(CLPQuaternion *)self->_quaternion hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float magneticAccuracy = self->_magneticAccuracy;
    float v12 = -magneticAccuracy;
    if (magneticAccuracy >= 0.0) {
      float v12 = self->_magneticAccuracy;
    }
    float v13 = floorf(v12 + 0.5);
    float v14 = (float)(v12 - v13) * 1.8447e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_magneticCalibration;
  }
  else {
    uint64_t v15 = 0;
  }
  return v8 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  double v5 = v4;
  if ((_BYTE)v4[4])
  {
    self->_double timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  quaternion = self->_quaternion;
  uint64_t v7 = *((void *)v5 + 3);
  if (quaternion)
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[CLPQuaternion mergeFrom:](quaternion, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[CLPIndoorCMAttitude setQuaternion:](self, "setQuaternion:");
  }
  double v5 = v9;
LABEL_9:
  char v8 = *((unsigned char *)v5 + 32);
  if ((v8 & 2) != 0)
  {
    self->_float magneticAccuracy = *((float *)v5 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v5 + 32);
  }
  if ((v8 & 4) != 0)
  {
    self->_magneticCalibration = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }

  MEMORY[0x1F41817F8]();
}

- (float)magneticAccuracy
{
  return self->_magneticAccuracy;
}

@end