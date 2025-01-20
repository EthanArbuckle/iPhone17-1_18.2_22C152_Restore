@interface NanoMessagesProtoDidFetchCurrentLocation
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasLocationAltitude;
- (BOOL)hasLocationCourse;
- (BOOL)hasLocationHorizontalAccuracy;
- (BOOL)hasLocationLatitude;
- (BOOL)hasLocationLongitude;
- (BOOL)hasLocationSpeed;
- (BOOL)hasLocationTimestamp;
- (BOOL)hasLocationVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDomain;
- (double)locationAltitude;
- (double)locationCourse;
- (double)locationHorizontalAccuracy;
- (double)locationLatitude;
- (double)locationLongitude;
- (double)locationSpeed;
- (double)locationTimestamp;
- (double)locationVerticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasLocationAltitude:(BOOL)a3;
- (void)setHasLocationCourse:(BOOL)a3;
- (void)setHasLocationHorizontalAccuracy:(BOOL)a3;
- (void)setHasLocationLatitude:(BOOL)a3;
- (void)setHasLocationLongitude:(BOOL)a3;
- (void)setHasLocationSpeed:(BOOL)a3;
- (void)setHasLocationTimestamp:(BOOL)a3;
- (void)setHasLocationVerticalAccuracy:(BOOL)a3;
- (void)setLocationAltitude:(double)a3;
- (void)setLocationCourse:(double)a3;
- (void)setLocationHorizontalAccuracy:(double)a3;
- (void)setLocationLatitude:(double)a3;
- (void)setLocationLongitude:(double)a3;
- (void)setLocationSpeed:(double)a3;
- (void)setLocationTimestamp:(double)a3;
- (void)setLocationVerticalAccuracy:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NanoMessagesProtoDidFetchCurrentLocation

- (void)setLocationLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_locationLatitude = a3;
}

- (void)setHasLocationLatitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLocationLatitude
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLocationLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_locationLongitude = a3;
}

- (void)setHasLocationLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLocationLongitude
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLocationAltitude:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_locationAltitude = a3;
}

- (void)setHasLocationAltitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLocationAltitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLocationHorizontalAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_locationHorizontalAccuracy = a3;
}

- (void)setHasLocationHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLocationHorizontalAccuracy
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLocationVerticalAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_locationVerticalAccuracy = a3;
}

- (void)setHasLocationVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLocationVerticalAccuracy
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLocationCourse:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_locationCourse = a3;
}

- (void)setHasLocationCourse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLocationCourse
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLocationSpeed:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_locationSpeed = a3;
}

- (void)setHasLocationSpeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLocationSpeed
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLocationTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_locationTimestamp = a3;
}

- (void)setHasLocationTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLocationTimestamp
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasErrorCode
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NanoMessagesProtoDidFetchCurrentLocation;
  __int16 v3 = [(NanoMessagesProtoDidFetchCurrentLocation *)&v7 description];
  v4 = [(NanoMessagesProtoDidFetchCurrentLocation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v8 = +[NSNumber numberWithDouble:self->_locationLatitude];
    [v3 setObject:v8 forKey:@"locationLatitude"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithDouble:self->_locationLongitude];
  [v3 setObject:v9 forKey:@"locationLongitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = +[NSNumber numberWithDouble:self->_locationAltitude];
  [v3 setObject:v10 forKey:@"locationAltitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = +[NSNumber numberWithDouble:self->_locationHorizontalAccuracy];
  [v3 setObject:v11 forKey:@"locationHorizontalAccuracy"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = +[NSNumber numberWithDouble:self->_locationVerticalAccuracy];
  [v3 setObject:v12 forKey:@"locationVerticalAccuracy"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = +[NSNumber numberWithDouble:self->_locationCourse];
  [v3 setObject:v13 forKey:@"locationCourse"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = +[NSNumber numberWithDouble:self->_locationSpeed];
  [v3 setObject:v14 forKey:@"locationSpeed"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_23:
  v15 = +[NSNumber numberWithDouble:self->_locationTimestamp];
  [v3 setObject:v15 forKey:@"locationTimestamp"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v5 = +[NSNumber numberWithInt:self->_errorCode];
    [v3 setObject:v5 forKey:@"errorCode"];
  }
LABEL_11:
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NanoMessagesProtoDidFetchCurrentLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
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
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_11:
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_locationLatitude;
    *((_WORD *)v4 + 44) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(void *)&self->_locationLongitude;
  *((_WORD *)v4 + 44) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[1] = *(void *)&self->_locationAltitude;
  *((_WORD *)v4 + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[3] = *(void *)&self->_locationHorizontalAccuracy;
  *((_WORD *)v4 + 44) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[8] = *(void *)&self->_locationVerticalAccuracy;
  *((_WORD *)v4 + 44) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[2] = *(void *)&self->_locationCourse;
  *((_WORD *)v4 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[6] = *(void *)&self->_locationSpeed;
  *((_WORD *)v4 + 44) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_23:
  v4[7] = *(void *)&self->_locationTimestamp;
  *((_WORD *)v4 + 44) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 18) = self->_errorCode;
    *((_WORD *)v4 + 44) |= 0x100u;
  }
LABEL_11:
  if (self->_errorDomain)
  {
    id v6 = v4;
    objc_msgSend(v4, "setErrorDomain:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v5[4] = *(void *)&self->_locationLatitude;
    *((_WORD *)v5 + 44) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = *(void *)&self->_locationLongitude;
  *((_WORD *)v5 + 44) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[1] = *(void *)&self->_locationAltitude;
  *((_WORD *)v5 + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v5[3] = *(void *)&self->_locationHorizontalAccuracy;
  *((_WORD *)v5 + 44) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v5[8] = *(void *)&self->_locationVerticalAccuracy;
  *((_WORD *)v5 + 44) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  v5[2] = *(void *)&self->_locationCourse;
  *((_WORD *)v5 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
LABEL_19:
    v5[7] = *(void *)&self->_locationTimestamp;
    *((_WORD *)v5 + 44) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_18:
  v5[6] = *(void *)&self->_locationSpeed;
  *((_WORD *)v5 + 44) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_19;
  }
LABEL_9:
  if ((has & 0x100) != 0)
  {
LABEL_10:
    *((_DWORD *)v5 + 18) = self->_errorCode;
    *((_WORD *)v5 + 44) |= 0x100u;
  }
LABEL_11:
  id v8 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v9 = (void *)v6[10];
  v6[10] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_locationLatitude != *((double *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 8) != 0)
  {
LABEL_49:
    unsigned __int8 v8 = 0;
    goto LABEL_50;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_locationLongitude != *((double *)v4 + 5)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_locationAltitude != *((double *)v4 + 1)) {
      goto LABEL_49;
    }
  }
  else if (v6)
  {
    goto LABEL_49;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_locationHorizontalAccuracy != *((double *)v4 + 3)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_locationVerticalAccuracy != *((double *)v4 + 8)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_locationCourse != *((double *)v4 + 2)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_locationSpeed != *((double *)v4 + 6)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_locationTimestamp != *((double *)v4 + 7)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0 || self->_errorCode != *((_DWORD *)v4 + 18)) {
      goto LABEL_49;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_49;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 10)) {
    unsigned __int8 v8 = -[NSString isEqual:](errorDomain, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_50:

  return v8;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    double locationLatitude = self->_locationLatitude;
    double v6 = -locationLatitude;
    if (locationLatitude >= 0.0) {
      double v6 = self->_locationLatitude;
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
    double locationLongitude = self->_locationLongitude;
    double v11 = -locationLongitude;
    if (locationLongitude >= 0.0) {
      double v11 = self->_locationLongitude;
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
  if (has)
  {
    double locationAltitude = self->_locationAltitude;
    double v16 = -locationAltitude;
    if (locationAltitude >= 0.0) {
      double v16 = self->_locationAltitude;
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
    double locationHorizontalAccuracy = self->_locationHorizontalAccuracy;
    double v21 = -locationHorizontalAccuracy;
    if (locationHorizontalAccuracy >= 0.0) {
      double v21 = self->_locationHorizontalAccuracy;
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
  if ((has & 0x80) != 0)
  {
    double locationVerticalAccuracy = self->_locationVerticalAccuracy;
    double v26 = -locationVerticalAccuracy;
    if (locationVerticalAccuracy >= 0.0) {
      double v26 = self->_locationVerticalAccuracy;
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
    double locationCourse = self->_locationCourse;
    double v31 = -locationCourse;
    if (locationCourse >= 0.0) {
      double v31 = self->_locationCourse;
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
    double locationSpeed = self->_locationSpeed;
    double v36 = -locationSpeed;
    if (locationSpeed >= 0.0) {
      double v36 = self->_locationSpeed;
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
  if ((has & 0x40) != 0)
  {
    double locationTimestamp = self->_locationTimestamp;
    double v41 = -locationTimestamp;
    if (locationTimestamp >= 0.0) {
      double v41 = self->_locationTimestamp;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((has & 0x100) != 0) {
    uint64_t v44 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v44 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ [(NSString *)self->_errorDomain hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_double locationLatitude = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double locationLongitude = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double locationAltitude = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double locationHorizontalAccuracy = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double locationVerticalAccuracy = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_double locationCourse = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_double locationSpeed = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_23:
  self->_double locationTimestamp = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
LABEL_10:
    self->_errorCode = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_11:
  if (*((void *)v4 + 10))
  {
    id v6 = v4;
    -[NanoMessagesProtoDidFetchCurrentLocation setErrorDomain:](self, "setErrorDomain:");
    id v4 = v6;
  }
}

- (double)locationLatitude
{
  return self->_locationLatitude;
}

- (double)locationLongitude
{
  return self->_locationLongitude;
}

- (double)locationAltitude
{
  return self->_locationAltitude;
}

- (double)locationHorizontalAccuracy
{
  return self->_locationHorizontalAccuracy;
}

- (double)locationVerticalAccuracy
{
  return self->_locationVerticalAccuracy;
}

- (double)locationCourse
{
  return self->_locationCourse;
}

- (double)locationSpeed
{
  return self->_locationSpeed;
}

- (double)locationTimestamp
{
  return self->_locationTimestamp;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end