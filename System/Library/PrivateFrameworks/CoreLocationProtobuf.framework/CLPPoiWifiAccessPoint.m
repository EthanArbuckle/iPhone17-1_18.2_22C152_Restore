@interface CLPPoiWifiAccessPoint
- (BOOL)hasAge;
- (BOOL)hasScanTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)mac;
- (double)age;
- (double)scanTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)channel;
- (int)rssi;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAge:(double)a3;
- (void)setChannel:(int)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasScanTimestamp:(BOOL)a3;
- (void)setMac:(id)a3;
- (void)setRssi:(int)a3;
- (void)setScanTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPoiWifiAccessPoint

- (void).cxx_destruct
{
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (void)setMac:(id)a3
{
}

- (void)setScanTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_scanTimestamp = a3;
}

- (void)setAge:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasScanTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScanTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPoiWifiAccessPoint;
  v4 = [(CLPPoiWifiAccessPoint *)&v8 description];
  v5 = [(CLPPoiWifiAccessPoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  mac = self->_mac;
  if (mac) {
    [v3 setObject:mac forKey:@"mac"];
  }
  v6 = [NSNumber numberWithInt:self->_rssi];
  [v4 setObject:v6 forKey:@"rssi"];

  v7 = [NSNumber numberWithInt:self->_channel];
  [v4 setObject:v7 forKey:@"channel"];

  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_age];
    [v4 setObject:v9 forKey:@"age"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_scanTimestamp];
    [v4 setObject:v10 forKey:@"scanTimestamp"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPoiWifiAccessPointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_mac) {
    -[CLPPoiWifiAccessPoint writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setMac:self->_mac];
  *((_DWORD *)v5 + 10) = self->_rssi;
  *((_DWORD *)v5 + 6) = self->_channel;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v5 + 1) = *(void *)&self->_age;
    *((unsigned char *)v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v5 + 2) = *(void *)&self->_scanTimestamp;
    *((unsigned char *)v5 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mac copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  *(_DWORD *)(v5 + 40) = self->_rssi;
  *(_DWORD *)(v5 + 24) = self->_channel;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_age;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_scanTimestamp;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  mac = self->_mac;
  if ((unint64_t)mac | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](mac, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (self->_rssi != *((_DWORD *)v4 + 10) || self->_channel != *((_DWORD *)v4 + 6)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_age != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    BOOL v6 = 0;
    goto LABEL_16;
  }
  BOOL v6 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_scanTimestamp != *((double *)v4 + 2)) {
      goto LABEL_15;
    }
    BOOL v6 = 1;
  }
LABEL_16:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mac hash];
  uint64_t rssi = self->_rssi;
  uint64_t channel = self->_channel;
  char has = (char)self->_has;
  if (has)
  {
    double age = self->_age;
    double v9 = -age;
    if (age >= 0.0) {
      double v9 = self->_age;
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
  if ((has & 2) != 0)
  {
    double scanTimestamp = self->_scanTimestamp;
    double v14 = -scanTimestamp;
    if (scanTimestamp >= 0.0) {
      double v14 = self->_scanTimestamp;
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
  return (2654435761 * rssi) ^ v3 ^ (2654435761 * channel) ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[CLPPoiWifiAccessPoint setMac:](self, "setMac:");
    id v4 = v6;
  }
  self->_uint64_t rssi = *((_DWORD *)v4 + 10);
  self->_uint64_t channel = *((_DWORD *)v4 + 6);
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_double age = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_double scanTimestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)mac
{
  return self->_mac;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)channel
{
  return self->_channel;
}

- (double)age
{
  return self->_age;
}

- (double)scanTimestamp
{
  return self->_scanTimestamp;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPoiWifiAccessPoint writeTo:]", "CLPCollectionRequest.gen.m", 31449, "nil != self->_mac");
}

@end