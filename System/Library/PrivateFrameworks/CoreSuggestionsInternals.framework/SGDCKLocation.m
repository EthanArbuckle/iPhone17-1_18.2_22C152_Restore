@interface SGDCKLocation
- (BOOL)hasAccuracy;
- (BOOL)hasAddress;
- (BOOL)hasAirportCode;
- (BOOL)hasHandle;
- (BOOL)hasLabel;
- (BOOL)hasLatitude;
- (BOOL)hasLocationType;
- (BOOL)hasLongitude;
- (BOOL)hasQuality;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)handle;
- (NSString)address;
- (NSString)airportCode;
- (NSString)label;
- (double)accuracy;
- (double)latitude;
- (double)longitude;
- (double)quality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationTypeAsString:(int)a3;
- (int)StringAsLocationType:(id)a3;
- (int)locationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccuracy:(double)a3;
- (void)setAddress:(id)a3;
- (void)setAirportCode:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasAccuracy:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationType:(int)a3;
- (void)setLongitude:(double)a3;
- (void)setQuality:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGDCKLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_airportCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (void)setAirportCode:(id)a3
{
}

- (NSString)airportCode
{
  return self->_airportCode;
}

- (void)setHandle:(id)a3
{
}

- (NSData)handle
{
  return self->_handle;
}

- (double)quality
{
  return self->_quality;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setAddress:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (int)locationType
{
  return self->_locationType;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    self->_locationType = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  id v6 = v4;
  if (*((void *)v4 + 8))
  {
    -[SGDCKLocation setLabel:](self, "setLabel:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[SGDCKLocation setAddress:](self, "setAddress:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_latitude = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 76);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_longitude = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  self->_accuracy = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
LABEL_11:
    self->_quality = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 7))
  {
    -[SGDCKLocation setHandle:](self, "setHandle:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[SGDCKLocation setAirportCode:](self, "setAirportCode:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v3 = 2654435761 * self->_locationType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_label hash];
  NSUInteger v5 = [(NSString *)self->_address hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double latitude = self->_latitude;
    double v9 = -latitude;
    if (latitude >= 0.0) {
      double v9 = self->_latitude;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 4) != 0)
  {
    double longitude = self->_longitude;
    double v14 = -longitude;
    if (longitude >= 0.0) {
      double v14 = self->_longitude;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (has)
  {
    double accuracy = self->_accuracy;
    double v19 = -accuracy;
    if (accuracy >= 0.0) {
      double v19 = self->_accuracy;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((has & 8) != 0)
  {
    double quality = self->_quality;
    double v24 = -quality;
    if (quality >= 0.0) {
      double v24 = self->_quality;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  NSUInteger v27 = v4 ^ v3 ^ v5 ^ v7;
  uint64_t v28 = v12 ^ v17 ^ v22 ^ [(NSData *)self->_handle hash];
  return v27 ^ v28 ^ [(NSString *)self->_airportCode hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) == 0 || self->_locationType != *((_DWORD *)v4 + 18)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
LABEL_35:
    char v9 = 0;
    goto LABEL_36;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 8) && !-[NSString isEqual:](label, "isEqual:")) {
    goto LABEL_35;
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](address, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_latitude != *((double *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_longitude != *((double *)v4 + 3)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_accuracy != *((double *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_quality != *((double *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_35;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 7) && !-[NSData isEqual:](handle, "isEqual:")) {
    goto LABEL_35;
  }
  airportCode = self->_airportCode;
  if ((unint64_t)airportCode | *((void *)v4 + 6)) {
    char v9 = -[NSString isEqual:](airportCode, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_36:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_locationType;
    *(unsigned char *)(v5 + 76) |= 0x10u;
  }
  uint64_t v7 = [(NSString *)self->_label copyWithZone:a3];
  v8 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v7;

  uint64_t v9 = [(NSString *)self->_address copyWithZone:a3];
  long double v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_latitude;
    *(unsigned char *)(v6 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(double *)(v6 + 8) = self->_accuracy;
      *(unsigned char *)(v6 + 76) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 24) = self->_longitude;
  *(unsigned char *)(v6 + 76) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(double *)(v6 + 32) = self->_quality;
    *(unsigned char *)(v6 + 76) |= 8u;
  }
LABEL_8:
  uint64_t v12 = [(NSData *)self->_handle copyWithZone:a3];
  v13 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_airportCode copyWithZone:a3];
  long double v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[18] = self->_locationType;
    *((unsigned char *)v4 + 76) |= 0x10u;
  }
  uint64_t v6 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v6;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_latitude;
    *((unsigned char *)v4 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 3) = *(void *)&self->_longitude;
  *((unsigned char *)v4 + 76) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((void *)v4 + 1) = *(void *)&self->_accuracy;
  *((unsigned char *)v4 + 76) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((void *)v4 + 4) = *(void *)&self->_quality;
    *((unsigned char *)v4 + 76) |= 8u;
  }
LABEL_12:
  if (self->_handle)
  {
    objc_msgSend(v6, "setHandle:");
    id v4 = v6;
  }
  if (self->_airportCode)
  {
    objc_msgSend(v6, "setAirportCode:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_address)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_12:
  if (self->_handle)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_airportCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_locationType];
    uint64_t v5 = [v4 stringValue];
    [v3 setObject:v5 forKey:@"locationType"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  address = self->_address;
  if (address) {
    [v3 setObject:address forKey:@"address"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v13 = [NSNumber numberWithDouble:self->_latitude];
    [v3 setObject:v13 forKey:@"latitude"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v14 = [NSNumber numberWithDouble:self->_longitude];
  [v3 setObject:v14 forKey:@"longitude"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  long double v15 = [NSNumber numberWithDouble:self->_accuracy];
  [v3 setObject:v15 forKey:@"accuracy"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    uint64_t v9 = [NSNumber numberWithDouble:self->_quality];
    [v3 setObject:v9 forKey:@"quality"];
  }
LABEL_12:
  handle = self->_handle;
  if (handle) {
    [v3 setObject:handle forKey:@"handle"];
  }
  airportCode = self->_airportCode;
  if (airportCode) {
    [v3 setObject:airportCode forKey:@"airportCode"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGDCKLocation;
  id v4 = [(SGDCKLocation *)&v8 description];
  uint64_t v5 = [(SGDCKLocation *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAirportCode
{
  return self->_airportCode != 0;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasQuality
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setQuality:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double quality = a3;
}

- (BOOL)hasAccuracy
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAccuracy:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAccuracy:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double accuracy = a3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double longitude = a3;
}

- (BOOL)hasLatitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double latitude = a3;
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (int)StringAsLocationType:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[SGDCKLocation StringAsLocationType:]", "SGDCKLocation.m", 36, "0");
}

- (id)locationTypeAsString:(int)a3
{
  id v3 = [NSNumber numberWithInt:*(void *)&a3];
  id v4 = [v3 stringValue];

  return v4;
}

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_locationType = a3;
}

@end