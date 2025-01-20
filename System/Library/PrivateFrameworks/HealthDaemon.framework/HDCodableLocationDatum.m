@interface HDCodableLocationDatum
- (BOOL)hasAltitude;
- (BOOL)hasCourse;
- (BOOL)hasCourseAccuracy;
- (BOOL)hasHorizontalAccuracy;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasSignalEnvironmentType;
- (BOOL)hasSpeed;
- (BOOL)hasSpeedAccuracy;
- (BOOL)hasTimestamp;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)speedAccuracy;
- (double)timestamp;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)signalEnvironmentType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCourse:(double)a3;
- (void)setCourseAccuracy:(double)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasCourse:(BOOL)a3;
- (void)setHasCourseAccuracy:(BOOL)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasSignalEnvironmentType:(BOOL)a3;
- (void)setHasSpeed:(BOOL)a3;
- (void)setHasSpeedAccuracy:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setSignalEnvironmentType:(int)a3;
- (void)setSpeed:(double)a3;
- (void)setSpeedAccuracy:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setVerticalAccuracy:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableLocationDatum

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTimestamp
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAltitude:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAltitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSpeed:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSpeed
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCourse:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_course = a3;
}

- (void)setHasCourse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCourse
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setVerticalAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSpeedAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_speedAccuracy = a3;
}

- (void)setHasSpeedAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSpeedAccuracy
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCourseAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_courseAccuracy = a3;
}

- (void)setHasCourseAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCourseAccuracy
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSignalEnvironmentType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_signalEnvironmentType = a3;
}

- (void)setHasSignalEnvironmentType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSignalEnvironmentType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableLocationDatum;
  v4 = [(HDCodableLocationDatum *)&v8 description];
  v5 = [(HDCodableLocationDatum *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_latitude];
  [v3 setObject:v8 forKey:@"latitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = [NSNumber numberWithDouble:self->_longitude];
  [v3 setObject:v9 forKey:@"longitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = [NSNumber numberWithDouble:self->_altitude];
  [v3 setObject:v10 forKey:@"altitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = [NSNumber numberWithDouble:self->_speed];
  [v3 setObject:v11 forKey:@"speed"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = [NSNumber numberWithDouble:self->_course];
  [v3 setObject:v12 forKey:@"course"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  [v3 setObject:v13 forKey:@"horizontalAccuracy"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = [NSNumber numberWithDouble:self->_verticalAccuracy];
  [v3 setObject:v14 forKey:@"verticalAccuracy"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = [NSNumber numberWithDouble:self->_speedAccuracy];
  [v3 setObject:v15 forKey:@"speedAccuracy"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v16 = [NSNumber numberWithDouble:self->_courseAccuracy];
  [v3 setObject:v16 forKey:@"courseAccuracy"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    v5 = [NSNumber numberWithInt:self->_signalEnvironmentType];
    [v3 setObject:v5 forKey:@"signalEnvironmentType"];
  }
LABEL_13:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableLocationDatumReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[9] = *(void *)&self->_timestamp;
    *((_WORD *)v4 + 46) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(void *)&self->_latitude;
  *((_WORD *)v4 + 46) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[6] = *(void *)&self->_longitude;
  *((_WORD *)v4 + 46) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[1] = *(void *)&self->_altitude;
  *((_WORD *)v4 + 46) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[7] = *(void *)&self->_speed;
  *((_WORD *)v4 + 46) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[2] = *(void *)&self->_course;
  *((_WORD *)v4 + 46) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[4] = *(void *)&self->_horizontalAccuracy;
  *((_WORD *)v4 + 46) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[10] = *(void *)&self->_verticalAccuracy;
  *((_WORD *)v4 + 46) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[8] = *(void *)&self->_speedAccuracy;
  *((_WORD *)v4 + 46) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v4[3] = *(void *)&self->_courseAccuracy;
  *((_WORD *)v4 + 46) |= 4u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 22) = self->_signalEnvironmentType;
    *((_WORD *)v4 + 46) |= 0x400u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((void *)result + 9) = *(void *)&self->_timestamp;
    *((_WORD *)result + 46) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 5) = *(void *)&self->_latitude;
  *((_WORD *)result + 46) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 6) = *(void *)&self->_longitude;
  *((_WORD *)result + 46) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 1) = *(void *)&self->_altitude;
  *((_WORD *)result + 46) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 7) = *(void *)&self->_speed;
  *((_WORD *)result + 46) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 2) = *(void *)&self->_course;
  *((_WORD *)result + 46) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 4) = *(void *)&self->_horizontalAccuracy;
  *((_WORD *)result + 46) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 10) = *(void *)&self->_verticalAccuracy;
  *((_WORD *)result + 46) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 8) = *(void *)&self->_speedAccuracy;
  *((_WORD *)result + 46) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((void *)result + 3) = *(void *)&self->_courseAccuracy;
  *((_WORD *)result + 46) |= 4u;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    return result;
  }
LABEL_12:
  *((_DWORD *)result + 22) = self->_signalEnvironmentType;
  *((_WORD *)result + 46) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x100) == 0 || self->_timestamp != *((double *)v4 + 9)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x100) != 0)
  {
LABEL_57:
    BOOL v7 = 0;
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_latitude != *((double *)v4 + 5)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_longitude != *((double *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_altitude != *((double *)v4 + 1)) {
      goto LABEL_57;
    }
  }
  else if (v6)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_speed != *((double *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_course != *((double *)v4 + 2)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_horizontalAccuracy != *((double *)v4 + 4)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x200) == 0 || self->_verticalAccuracy != *((double *)v4 + 10)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_speedAccuracy != *((double *)v4 + 8)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_courseAccuracy != *((double *)v4 + 3)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x400) == 0 || self->_signalEnvironmentType != *((_DWORD *)v4 + 22)) {
      goto LABEL_57;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x400) == 0;
  }
LABEL_58:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
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
  if ((has & 0x10) != 0)
  {
    double latitude = self->_latitude;
    double v11 = -latitude;
    if (latitude >= 0.0) {
      double v11 = self->_latitude;
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
  if ((has & 0x20) != 0)
  {
    double longitude = self->_longitude;
    double v16 = -longitude;
    if (longitude >= 0.0) {
      double v16 = self->_longitude;
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
  if (has)
  {
    double altitude = self->_altitude;
    double v21 = -altitude;
    if (altitude >= 0.0) {
      double v21 = self->_altitude;
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
  if ((has & 0x40) != 0)
  {
    double speed = self->_speed;
    double v26 = -speed;
    if (speed >= 0.0) {
      double v26 = self->_speed;
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
  if ((has & 2) != 0)
  {
    double course = self->_course;
    double v31 = -course;
    if (course >= 0.0) {
      double v31 = self->_course;
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
  unint64_t v58 = v9;
  unint64_t v59 = v19;
  if ((has & 8) != 0)
  {
    double horizontalAccuracy = self->_horizontalAccuracy;
    double v36 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0) {
      double v36 = self->_horizontalAccuracy;
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
  unint64_t v39 = v4;
  if ((has & 0x200) != 0)
  {
    double verticalAccuracy = self->_verticalAccuracy;
    double v43 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0) {
      double v43 = self->_verticalAccuracy;
    }
    long double v44 = floor(v43 + 0.5);
    double v45 = (v43 - v44) * 1.84467441e19;
    unint64_t v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    unint64_t v40 = v24;
    if (v45 >= 0.0)
    {
      if (v45 > 0.0) {
        v41 += (unint64_t)v45;
      }
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    unint64_t v40 = v24;
    unint64_t v41 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double speedAccuracy = self->_speedAccuracy;
    double v48 = -speedAccuracy;
    if (speedAccuracy >= 0.0) {
      double v48 = self->_speedAccuracy;
    }
    long double v49 = floor(v48 + 0.5);
    double v50 = (v48 - v49) * 1.84467441e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    unint64_t v46 = 0;
  }
  if ((has & 4) != 0)
  {
    double courseAccuracy = self->_courseAccuracy;
    double v53 = -courseAccuracy;
    if (courseAccuracy >= 0.0) {
      double v53 = self->_courseAccuracy;
    }
    long double v54 = floor(v53 + 0.5);
    double v55 = (v53 - v54) * 1.84467441e19;
    unint64_t v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0) {
        v51 += (unint64_t)v55;
      }
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    unint64_t v51 = 0;
  }
  if ((has & 0x400) != 0) {
    uint64_t v56 = 2654435761 * self->_signalEnvironmentType;
  }
  else {
    uint64_t v56 = 0;
  }
  return v58 ^ v39 ^ v14 ^ v59 ^ v40 ^ v29 ^ v34 ^ v41 ^ v46 ^ v51 ^ v56;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x100) != 0)
  {
    self->_double timestamp = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 46);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double latitude = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double longitude = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double altitude = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double speed = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_double course = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_double horizontalAccuracy = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_double verticalAccuracy = *((double *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double speedAccuracy = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  self->_double courseAccuracy = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 46) & 0x400) != 0)
  {
LABEL_12:
    self->_signalEnvironmentType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_13:
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)speed
{
  return self->_speed;
}

- (double)course
{
  return self->_course;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (int)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

@end